## Coursea/Getting and Cleaning Data
## Peer Assignment
## Andreas Kalin

library(stringr)
library(reshape2)

## Create a tidy set from the raw data in the directory specified by data_dir.
## See README.md for a reference to the raw data.
## The function returns a list with the following symbols:
##   merged_set -- The raw data variables for mean and standard deviation,
##                 renamed according to CodeBook.md.
##   tidy_set   -- The tidy data set, with the arithmetid mean of the
##                 data in merged_set with respect to subject and activity.
run_analysis <- function (data_dir=".") {
    main <- function () {

        ## Step 1: "Merges the training and the test sets to create one data set."
        ## The sets are disjunct, so we can just add them together with rbind.
        print("Merging training data with test data...")
        merged_set <- rbind(
            read_data_set("train/subject_train.txt", "train/y_train.txt", "train/X_train.txt"),
            read_data_set("test/subject_test.txt", "test/y_test.txt", "test/X_test.txt")
            )

        merged_set <- label_variables(merged_set, "features.txt")

        ## Step 2: "Extracts only the measurements on the mean and standard deviation for each measurement."
        print("Extracting mean and standard deviation variables...")
        only_mu_and_sigma <- extract_mu_and_sigma(merged_set)

        ## Step 3: "Uses descriptive activity names to name the activities in the data set"
        print("Labelling activities...")
        only_mu_and_sigma <- label_activities(only_mu_and_sigma, "activity_labels.txt")

        ## Step 4: "Appropriately labels the data set with descriptive variable names."
        print("Renaming variables...")
        only_mu_and_sigma <- clarify_variable_labels(only_mu_and_sigma)

        ## Step 5: "Creates a second, independent tidy data set with the average of each variable for each activity and each subject."
        print("Creating tidy set as the mean of raw data variables...")
        averages_data_set <- calculate_averages(only_mu_and_sigma)

        list(merged_set=only_mu_and_sigma, tidy_set=averages_data_set)
    }

    ## Read a test or training set as data.frame; insert subject and activity id first in each row
    read_data_set <- function (subject_file, activity_file, data_file) {
        subjects <- read.table(make_filename(subject_file))
        labels <- read.table(make_filename(activity_file))
        print(paste0("  Reading data from `", data_file, "` (this may take some time)..."))
        data <- read.table(make_filename(data_file))
        cbind(subject=subjects[,1], activity=labels[,1], data)
    }

    ## Set column names according to the feature names
    label_variables <- function (data_set, feature_name_file) {
        feature_names <- read.table(make_filename(feature_name_file), as.is=T)
        colnames(feature_names) <- c("index", "name")
        key_columns <- colnames(data_set)[1:2]
        colnames(data_set) <- c(key_columns, feature_names$name) # index is identical to the row number, so no need to complicate things by using $index.
        data_set
    }

    ## Extract variables for mean and standard deviation
    extract_mu_and_sigma <- function (data_set) {
        ## Only include:
        ##  -std()
        ##  -mean()
        ## Do not include:
        ##  -meanFreq()        # this appears to be a varaible derived from other frequency ariables; we already have fBodyXXX-mean().
        ##  angle(...Mean...)  # this appears to be a variable derived from mean variables, but not a (primary) mean value by itself.
        mu_and_sigma_index <- grep("subject|activity|-(mean|std)\\(\\)", colnames(data_set))
        data_set[, mu_and_sigma_index]
    }

    ## Replace activity id with acticity name
    label_activities <- function (data_set, activity_labels_file) {
        activity_names <- read.table(make_filename(activity_labels_file))
        colnames(activity_names) <- c("index", "name")
        data_set$activity <- tolower(activity_names[activity_names[data_set$activity, "index"], "name"])
        data_set
    }

    ## Replace the feature names with variable names according to a new name standard.
    ## The name standard is roughly:
    ##   underscore separates words (not according to advice in class, but whatta do when we have multiple words? I happen to like underscore.)
    ##   no parethesis
    ##   no dashes
    ##   all lowercase
    ##   pattern: function_domain_signal_component
    ##   example: mean_time_body_gyroscope_x
    ##   example: standard_deviation_gravity_accelerometer_z
    clarify_variable_labels <- function (data_set) {
        group_pattern <- "(([ft])([a-zA-Z]+)-)?([a-zA-Z]+)\\((.*)\\)(-(.*))?$|(.*)"
        group_names <- c("all", "", "domain", "signal", "fn", "args", "", "component", "unmatched")

        ## parts_per_name: one row per column name; one column per mached group in the name
        parts_per_name <- str_match(colnames(data_set), group_pattern)

        ## create new names from the parts
        new_names <- apply(parts_per_name, 1, function (parts) {
            parts <- as.list(parts) # So we can access the elements with $
            names(parts) <- group_names
            if (nchar(parts$unmatched) > 0) {
                ## The columns "subject" and "activity" have no parts, but are returned as-is.
                return (parts$unmatched)
            }
            
            domain <- gsub("t", "time", gsub("f", "frequency", parts$domain))
            signal <- gsub("Acc", "Accelerometer", gsub("Gyro", "Gyroscope", gsub("Mag", "Magnitude", parts$signal)))
            signal <- gsub("([a-z])([A-Z])", "\\1 \\2", signal); # Replace CamelCase with space
            fn <- gsub("std", "standard deviation", parts$fn)
            component <- parts$component

            name <- paste(fn, domain, signal, component)

            name <- str_trim(name)
            name <- gsub(" +", "_", name)
            name <- tolower(name)

            name
        })

        names(data_set) <- new_names
        data_set
    }

    ## Calculate averages of all variables with respect to the first two columns ("subject" and "activity")
    calculate_averages <- function (data_set) {
        variable_names <- colnames(data_set)[3:ncol(data_set)]
        unpivoted <- melt(data_set, id=c("subject", "activity"), measure.vars=variable_names)
        dcast(unpivoted, subject + activity ~ variable, mean)
    }

    ## Helper: prepend base directory name to a file name
    make_filename <- function (file) {
        paste(data_dir, file, sep=.Platform$file.sep)
    }

    main()
}

run_analysis_result <- run_analysis() # Run in cwd
#run_analysis_result <- run_analysis(data_dir="UCI HAR Dataset")
print("Created the global variable `run_analysis_result` with the result.")

write.table(run_analysis_result$tidy_set, file="tidy_set.txt", row.names=F)
print("Wrote tidy data to the file `tidy_set.txt`.")

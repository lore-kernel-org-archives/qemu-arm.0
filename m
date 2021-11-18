Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q26sm654555wrc.39.2021.11.18.10.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 10:46:54 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 583341FF9B;
	Thu, 18 Nov 2021 18:46:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: kvm@vger.kernel.org
Cc: idan.horowitz@gmail.com,
	qemu-arm@nongnu.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu,
	christoffer.dall@arm.com,
	maz@kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [kvm-unit-tests PATCH v8 04/10] run_tests.sh: add --config option for alt test set
Date: Thu, 18 Nov 2021 18:46:44 +0000
Message-Id: <20211118184650.661575-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211118184650.661575-1-alex.bennee@linaro.org>
References: <20211118184650.661575-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: SFaoYYJq7e6p

The upcoming MTTCG tests don't need to be run for normal KVM unit
tests so lets add the facility to have a custom set of tests.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 run_tests.sh | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/run_tests.sh b/run_tests.sh
index 9f233c5..b1088d2 100755
--- a/run_tests.sh
+++ b/run_tests.sh
@@ -15,7 +15,7 @@ function usage()
 {
 cat <<EOF
 
-Usage: $0 [-h] [-v] [-a] [-g group] [-j NUM-TASKS] [-t]
+Usage: $0 [-h] [-v] [-a] [-g group] [-j NUM-TASKS] [-t] [-c CONFIG]
 
     -h, --help      Output this help text
     -v, --verbose   Enables verbose mode
@@ -24,6 +24,7 @@ Usage: $0 [-h] [-v] [-a] [-g group] [-j NUM-TASKS] [-t]
     -g, --group     Only execute tests in the given group
     -j, --parallel  Execute tests in parallel
     -t, --tap13     Output test results in TAP format
+    -c, --config    Override default unittests.cfg
 
 Set the environment variable QEMU=/path/to/qemu-system-ARCH to
 specify the appropriate qemu binary for ARCH-run.
@@ -42,7 +43,7 @@ if [ $? -ne 4 ]; then
 fi
 
 only_tests=""
-args=$(getopt -u -o ag:htj:v -l all,group:,help,tap13,parallel:,verbose -- $*)
+args=$(getopt -u -o ag:htj:vc: -l all,group:,help,tap13,parallel:,verbose,config: -- $*)
 [ $? -ne 0 ] && exit 2;
 set -- $args;
 while [ $# -gt 0 ]; do
@@ -73,6 +74,10 @@ while [ $# -gt 0 ]; do
         -t | --tap13)
             tap_output="yes"
             ;;
+        -c | --config)
+            shift
+            config=$1
+            ;;
         --)
             ;;
         *)
@@ -152,7 +157,7 @@ function run_task()
 
 : ${unittest_log_dir:=logs}
 : ${unittest_run_queues:=1}
-config=$TEST_DIR/unittests.cfg
+: ${config:=$TEST_DIR/unittests.cfg}
 
 rm -rf $unittest_log_dir.old
 [ -d $unittest_log_dir ] && mv $unittest_log_dir $unittest_log_dir.old
-- 
2.30.2

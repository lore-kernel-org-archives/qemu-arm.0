Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id y31sm2568014wrd.83.2020.05.06.05.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 05:05:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6953D1FF96;
	Wed,  6 May 2020 13:05:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 08/14] tests/tcg: better trap gdb failures
Date: Wed,  6 May 2020 13:05:23 +0100
Message-Id: <20200506120529.18974-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200506120529.18974-1-alex.bennee@linaro.org>
References: <20200506120529.18974-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: B2BlBVfDpJvE

It seems older and non-multiarach aware GDBs might not fail gracefully
when faced with something they don't know. For example when faced with
a target XML for s390x the Ubuntu 18.04 gdb will generate an internal
fault and prompt for a core dump.

Work around this by invoking GDB in a more batch orientated way and
then trying to filter out between test failures and gdb failures.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200430190122.4592-4-alex.bennee@linaro.org>

diff --git a/tests/guest-debug/run-test.py b/tests/guest-debug/run-test.py
index 8c49ee2f225..2bbb8fbaa38 100755
--- a/tests/guest-debug/run-test.py
+++ b/tests/guest-debug/run-test.py
@@ -50,8 +50,25 @@ if __name__ == '__main__':
     inferior = subprocess.Popen(shlex.split(cmd))
 
     # Now launch gdb with our test and collect the result
-    gdb_cmd = "%s %s -ex 'target remote localhost:1234' -x %s" % (args.gdb, args.binary, args.test)
+    gdb_cmd = "%s %s" % (args.gdb, args.binary)
+    # run quietly and ignore .gdbinit
+    gdb_cmd += " -q -n -batch"
+    # disable prompts in case of crash
+    gdb_cmd += " -ex 'set confirm off'"
+    # connect to remote
+    gdb_cmd += " -ex 'target remote localhost:1234'"
+    # finally the test script itself
+    gdb_cmd += " -x %s" % (args.test)
+
+    print("GDB CMD: %s" % (gdb_cmd))
 
     result = subprocess.call(gdb_cmd, shell=True);
 
+    # A negative result is the result of an internal gdb failure like
+    # a crash. We force a return of 0 so we don't fail the test on
+    # account of broken external tools.
+    if result < 0:
+        print("GDB crashed? SKIPPING")
+        exit(0)
+
     exit(result)
diff --git a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
index 984fbeb277e..387b2fc20aa 100644
--- a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
+++ b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
@@ -70,7 +70,6 @@ except (gdb.error, AttributeError):
 try:
     # These are not very useful in scripts
     gdb.execute("set pagination off")
-    gdb.execute("set confirm off")
 
     # Run the actual tests
     run_test()
diff --git a/tests/tcg/aarch64/gdbstub/test-sve.py b/tests/tcg/aarch64/gdbstub/test-sve.py
index dbe7f2aa932..5995689625e 100644
--- a/tests/tcg/aarch64/gdbstub/test-sve.py
+++ b/tests/tcg/aarch64/gdbstub/test-sve.py
@@ -71,7 +71,6 @@ except (gdb.error, AttributeError):
 try:
     # These are not very useful in scripts
     gdb.execute("set pagination off")
-    gdb.execute("set confirm off")
 
     # Run the actual tests
     run_test()
-- 
2.20.1

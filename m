Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id z8-20020adff1c8000000b0031c612146f1sm16659748wro.100.2023.08.30.07.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 07:54:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 66A6B1FFC2;
	Wed, 30 Aug 2023 15:54:08 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs),
	qemu-s390x@nongnu.org (open list:S390 TCG CPUs)
Subject: [PULL 07/12] tests/tcg: clean-up gdb confirm/pagination settings
Date: Wed, 30 Aug 2023 15:54:02 +0100
Message-Id: <20230830145407.3064249-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230830145407.3064249-1-alex.bennee@linaro.org>
References: <20230830145407.3064249-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: f4VME0fIhFzT

We can do this all in the run-test.py script so remove the extraneous
bits from the individual tests which got copied from the original
non-CI gdb tests.

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230829161528.2707696-8-alex.bennee@linaro.org>

diff --git a/tests/guest-debug/run-test.py b/tests/guest-debug/run-test.py
index a032e01f79..b13b27d4b1 100755
--- a/tests/guest-debug/run-test.py
+++ b/tests/guest-debug/run-test.py
@@ -83,6 +83,8 @@ def log(output, msg):
         gdb_cmd += " %s" % (args.gdb_args)
     # run quietly and ignore .gdbinit
     gdb_cmd += " -q -n -batch"
+    # disable pagination
+    gdb_cmd += " -ex 'set pagination off'"
     # disable prompts in case of crash
     gdb_cmd += " -ex 'set confirm off'"
     # connect to remote
diff --git a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
index b9ef169c1a..ee8d467e59 100644
--- a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
+++ b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
@@ -76,9 +76,6 @@ def run_test():
     exit(0)
 
 try:
-    # These are not very useful in scripts
-    gdb.execute("set pagination off")
-
     # Run the actual tests
     run_test()
 except:
diff --git a/tests/tcg/aarch64/gdbstub/test-sve.py b/tests/tcg/aarch64/gdbstub/test-sve.py
index ef57c7412c..afd8ece98d 100644
--- a/tests/tcg/aarch64/gdbstub/test-sve.py
+++ b/tests/tcg/aarch64/gdbstub/test-sve.py
@@ -66,9 +66,6 @@ def run_test():
     exit(0)
 
 try:
-    # These are not very useful in scripts
-    gdb.execute("set pagination off")
-
     # Run the actual tests
     run_test()
 except:
diff --git a/tests/tcg/multiarch/gdbstub/memory.py b/tests/tcg/multiarch/gdbstub/memory.py
index 67864ad902..dd25e72281 100644
--- a/tests/tcg/multiarch/gdbstub/memory.py
+++ b/tests/tcg/multiarch/gdbstub/memory.py
@@ -115,9 +115,6 @@ def run_test():
     exit(0)
 
 try:
-    # These are not very useful in scripts
-    gdb.execute("set pagination off")
-
     # Run the actual tests
     run_test()
 except (gdb.error):
diff --git a/tests/tcg/multiarch/gdbstub/sha1.py b/tests/tcg/multiarch/gdbstub/sha1.py
index 423b720e6d..416728415f 100644
--- a/tests/tcg/multiarch/gdbstub/sha1.py
+++ b/tests/tcg/multiarch/gdbstub/sha1.py
@@ -73,10 +73,6 @@ def run_test():
     exit(0)
 
 try:
-    # These are not very useful in scripts
-    gdb.execute("set pagination off")
-    gdb.execute("set confirm off")
-
     # Run the actual tests
     run_test()
 except (gdb.error):
diff --git a/tests/tcg/multiarch/gdbstub/test-proc-mappings.py b/tests/tcg/multiarch/gdbstub/test-proc-mappings.py
index 5e3e5a2fb7..04ec61d219 100644
--- a/tests/tcg/multiarch/gdbstub/test-proc-mappings.py
+++ b/tests/tcg/multiarch/gdbstub/test-proc-mappings.py
@@ -51,10 +51,6 @@ def main():
         exit(0)
 
     try:
-        # These are not very useful in scripts
-        gdb.execute("set pagination off")
-        gdb.execute("set confirm off")
-
         # Run the actual tests
         run_test()
     except gdb.error:
diff --git a/tests/tcg/multiarch/gdbstub/test-qxfer-auxv-read.py b/tests/tcg/multiarch/gdbstub/test-qxfer-auxv-read.py
index d91e8fdf19..926fa962b7 100644
--- a/tests/tcg/multiarch/gdbstub/test-qxfer-auxv-read.py
+++ b/tests/tcg/multiarch/gdbstub/test-qxfer-auxv-read.py
@@ -42,10 +42,6 @@ def run_test():
     exit(0)
 
 try:
-    # These are not very useful in scripts
-    gdb.execute("set pagination off")
-    gdb.execute("set confirm off")
-
     # Run the actual tests
     run_test()
 except (gdb.error):
diff --git a/tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py b/tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py
index 798d508bc7..e57d2a8db8 100644
--- a/tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py
+++ b/tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py
@@ -45,10 +45,6 @@ def run_test():
     exit(0)
 
 try:
-    # These are not very useful in scripts
-    gdb.execute("set pagination off")
-    gdb.execute("set confirm off")
-
     # Run the actual tests
     run_test()
 except (gdb.error):
diff --git a/tests/tcg/s390x/gdbstub/test-signals-s390x.py b/tests/tcg/s390x/gdbstub/test-signals-s390x.py
index 80a284b475..ca2bbc0b03 100644
--- a/tests/tcg/s390x/gdbstub/test-signals-s390x.py
+++ b/tests/tcg/s390x/gdbstub/test-signals-s390x.py
@@ -61,10 +61,6 @@ def run_test():
     exit(0)
 
 try:
-    # These are not very useful in scripts
-    gdb.execute("set pagination off")
-    gdb.execute("set confirm off")
-
     # Run the actual tests
     run_test()
 except (gdb.error):
diff --git a/tests/tcg/s390x/gdbstub/test-svc.py b/tests/tcg/s390x/gdbstub/test-svc.py
index 18fad3f163..804705fede 100644
--- a/tests/tcg/s390x/gdbstub/test-svc.py
+++ b/tests/tcg/s390x/gdbstub/test-svc.py
@@ -49,10 +49,6 @@ def main():
         exit(0)
 
     try:
-        # These are not very useful in scripts
-        gdb.execute("set pagination off")
-        gdb.execute("set confirm off")
-
         # Run the actual tests
         run_test()
     except gdb.error:
-- 
2.39.2

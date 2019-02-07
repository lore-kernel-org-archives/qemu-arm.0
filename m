Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id y20sm35696522wra.51.2019.02.07.10.37.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Feb 2019 10:37:53 -0800 (PST)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 475CE1FF8E;
	Thu,  7 Feb 2019 18:37:45 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH  v2 14/16] tests/vm: add --build-target option
Date: Thu,  7 Feb 2019 18:37:42 +0000
Message-Id: <20190207183744.5054-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190207183744.5054-1-alex.bennee@linaro.org>
References: <20190207183744.5054-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: e5IyGxHxKOIT

This allows us to invoke the build with a custom target (for the VMs
that use the {target} format string specifier). Currently OpenBSD is
still hardwired due to problems running check.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/vm/basevm.py   | 3 +++
 tests/vm/freebsd     | 2 +-
 tests/vm/netbsd      | 2 +-
 tests/vm/ubuntu.i386 | 2 +-
 4 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 5caf77d6b8..bdca6cb2fc 100755
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -228,6 +228,8 @@ def parse_args(vmcls):
                       help="build image")
     parser.add_option("--build-qemu",
                       help="build QEMU from source in guest")
+    parser.add_option("--build-target",
+                      help="QEMU build target", default="check")
     parser.add_option("--interactive", "-I", action="store_true",
                       help="Interactively run command")
     parser.add_option("--snapshot", "-s", action="store_true",
@@ -255,6 +257,7 @@ def main(vmcls):
             cmd = [vm.BUILD_SCRIPT.format(
                    configure_opts = " ".join(argv),
                    jobs=args.jobs,
+                   target=args.build_target,
                    verbose = "V=1" if args.verbose else "")]
         else:
             cmd = argv
diff --git a/tests/vm/freebsd b/tests/vm/freebsd
index a85c866c30..1d64c31b7c 100755
--- a/tests/vm/freebsd
+++ b/tests/vm/freebsd
@@ -25,7 +25,7 @@ class FreeBSDVM(basevm.BaseVM):
         cd $(mktemp -d /var/tmp/qemu-test.XXXXXX);
         tar -xf /dev/vtbd1;
         ./configure {configure_opts};
-        gmake --output-sync -j{jobs} check {verbose};
+        gmake --output-sync -j{jobs} {target} {verbose};
     """
 
     def build_image(self, img):
diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index edea113bb5..a2c3d13af4 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -25,7 +25,7 @@ class NetBSDVM(basevm.BaseVM):
         cd $(mktemp -d /var/tmp/qemu-test.XXXXXX);
         tar -xf /dev/rld1a;
         ./configure --python=python2.7 {configure_opts};
-        gmake --output-sync -j{jobs} check {verbose};
+        gmake --output-sync -j{jobs} {target} {verbose};
     """
 
     def build_image(self, img):
diff --git a/tests/vm/ubuntu.i386 b/tests/vm/ubuntu.i386
index 252e514859..a22d137e76 100755
--- a/tests/vm/ubuntu.i386
+++ b/tests/vm/ubuntu.i386
@@ -26,7 +26,7 @@ class UbuntuX86VM(basevm.BaseVM):
         sudo chmod a+r /dev/vdb;
         tar -xf /dev/vdb;
         ./configure {configure_opts};
-        make --output-sync check -j{jobs} {verbose};
+        make --output-sync {target} -j{jobs} {verbose};
     """
 
     def _gen_cloud_init_iso(self):
-- 
2.20.1

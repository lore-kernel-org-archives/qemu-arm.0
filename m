Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id v8sm399828wra.79.2019.09.25.16.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2019 16:30:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 12F441FF87;
	Thu, 26 Sep 2019 00:30:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-ppc@nongnnu.org,
	qemu-riscv@nongnu.org,
	qemu-discuss@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC PATCH] configure: deprecate 32 bit build hosts
Date: Thu, 26 Sep 2019 00:30:13 +0100
Message-Id: <20190925233013.6449-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3PnFhOJlPX7F

The 32 bit hosts are already a second class citizen especially with
support for running 64 bit guests under TCG. We are also limited by
testing as actual working 32 bit machines are getting quite rare in
developers personal menageries. For TCG supporting newer types like
Int128 is a lot harder with 32 bit calling conventions compared to
their larger bit sized cousins. Fundamentally address space is the
most useful thing for the translator to have even for a 32 bit guest a
32 bit host is quite constrained.

As far as I'm aware 32 bit KVM users are even less numerous. Even
ILP32 doesn't make much sense given the address space QEMU needs to
manage.

Lets mark these machines as deprecated so we can have the wailing and
gnashing of teeth now and look to actually dropping the support in a
couple of cycles.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
---
 configure | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index 542f6aea3f..776fd460b5 100755
--- a/configure
+++ b/configure
@@ -728,7 +728,7 @@ ARCH=
 # Normalise host CPU name and set ARCH.
 # Note that this case should only have supported host CPUs, not guests.
 case "$cpu" in
-  ppc|ppc64|s390|s390x|sparc64|x32|riscv32|riscv64)
+  ppc64|s390|s390x|sparc64|riscv64)
     supported_cpu="yes"
   ;;
   ppc64le)
@@ -737,7 +737,6 @@ case "$cpu" in
   ;;
   i386|i486|i586|i686|i86pc|BePC)
     cpu="i386"
-    supported_cpu="yes"
   ;;
   x86_64|amd64)
     cpu="x86_64"
@@ -745,19 +744,22 @@ case "$cpu" in
   ;;
   armv*b|armv*l|arm)
     cpu="arm"
-    supported_cpu="yes"
   ;;
   aarch64)
     cpu="aarch64"
     supported_cpu="yes"
   ;;
-  mips*)
+  mips64*)
     cpu="mips"
     supported_cpu="yes"
   ;;
+  mips*)
+    cpu="mips"
+  ;;
   sparc|sun4[cdmuv])
     cpu="sparc"
-    supported_cpu="yes"
+  ;;
+  x32|riscv32)
   ;;
   *)
     # This will result in either an error or falling back to TCI later
@@ -6438,12 +6440,12 @@ if test "$supported_cpu" = "no"; then
     echo "WARNING: SUPPORT FOR THIS HOST CPU WILL GO AWAY IN FUTURE RELEASES!"
     echo
     echo "CPU host architecture $cpu support is not currently maintained."
-    echo "The QEMU project intends to remove support for this host CPU in"
-    echo "a future release if nobody volunteers to maintain it and to"
-    echo "provide a build host for our continuous integration setup."
-    echo "configure has succeeded and you can continue to build, but"
-    echo "if you care about QEMU on this platform you should contact"
-    echo "us upstream at qemu-devel@nongnu.org."
+    echo "The QEMU project intends to remove support for all 32 bit host"
+    echo "CPUs in a future release. 64 bit hosts will need a volunteer"
+    echo "to maintain it and to provide a build host for our continuous"
+    echo "integration setup. configure has succeeded and you can continue"
+    echo "to build, but if you care about QEMU on this platform you"
+    echo "should contact us upstream at qemu-devel@nongnu.org."
 fi
 
 if test "$supported_os" = "no"; then
-- 
2.20.1

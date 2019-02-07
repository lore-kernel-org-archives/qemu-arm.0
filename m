Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id r12sm26882504wrq.3.2019.02.07.10.45.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Feb 2019 10:45:06 -0800 (PST)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3B5651FF8D;
	Thu,  7 Feb 2019 18:37:45 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH  v2 13/16] tests/vm: call make check directly for netbsd/freebsd/ubuntu.i386
Date: Thu,  7 Feb 2019 18:37:41 +0000
Message-Id: <20190207183744.5054-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190207183744.5054-1-alex.bennee@linaro.org>
References: <20190207183744.5054-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: vb4pBtYtau5+

The "make check" target calls check-qtest which has the appropriate
system binaries as dependencies so we shouldn't need to do two steps
of make invocation. Doing it in two steps was a hangover from when our
make check couldn't run tests in parallel.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/vm/freebsd     | 1 -
 tests/vm/netbsd      | 1 -
 tests/vm/ubuntu.i386 | 1 -
 3 files changed, 3 deletions(-)

diff --git a/tests/vm/freebsd b/tests/vm/freebsd
index 19a3729172..a85c866c30 100755
--- a/tests/vm/freebsd
+++ b/tests/vm/freebsd
@@ -25,7 +25,6 @@ class FreeBSDVM(basevm.BaseVM):
         cd $(mktemp -d /var/tmp/qemu-test.XXXXXX);
         tar -xf /dev/vtbd1;
         ./configure {configure_opts};
-        gmake --output-sync -j{jobs} {verbose};
         gmake --output-sync -j{jobs} check {verbose};
     """
 
diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index fac6a7ce51..edea113bb5 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -25,7 +25,6 @@ class NetBSDVM(basevm.BaseVM):
         cd $(mktemp -d /var/tmp/qemu-test.XXXXXX);
         tar -xf /dev/rld1a;
         ./configure --python=python2.7 {configure_opts};
-        gmake --output-sync -j{jobs} {verbose};
         gmake --output-sync -j{jobs} check {verbose};
     """
 
diff --git a/tests/vm/ubuntu.i386 b/tests/vm/ubuntu.i386
index 1b7e1ab8f0..252e514859 100755
--- a/tests/vm/ubuntu.i386
+++ b/tests/vm/ubuntu.i386
@@ -26,7 +26,6 @@ class UbuntuX86VM(basevm.BaseVM):
         sudo chmod a+r /dev/vdb;
         tar -xf /dev/vdb;
         ./configure {configure_opts};
-        make --output-sync -j{jobs};
         make --output-sync check -j{jobs} {verbose};
     """
 
-- 
2.20.1

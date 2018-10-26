Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp881088wro;
        Fri, 26 Oct 2018 08:32:08 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cBf5WCUIZRXp9sAu5sNVWXDfzgixC9J8lZdyrFYYZ26pL4O8DSndH8v2KMhbwj7dQOYnmI
X-Received: by 2002:a1c:4c14:: with SMTP id z20-v6mr5617760wmf.89.1540567928671;
        Fri, 26 Oct 2018 08:32:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540567928; cv=none;
        d=google.com; s=arc-20160816;
        b=TOvzFiVXTnO3vaBojvAT3Cyi5Xn8ncG8KdlQZ/mbwtcji8kU7KjlJ3F9y8Ec5R13LO
         zAIKFssxC5ToymXFDUhjqs56qaPy/WTqmCh36BJUR6hjnUGpfMemOGfoenCMVqcIMKJh
         3UhoS/44iTJUPFmw+OBIWZBfVkROMpwogofeLePCcFgSJEuakesEhJDc+EhUrVP7HUfY
         e/gx9yMrx8pOQfRLO7Ans0BUAou8JTiwOFiExKe6iipkiPmntpunEF/pSxX3ZLn94EiX
         gvMGETto+mawWVPkYNHOd1SZlnshroFQv0bpREi0JVg+NUTAmF7zJV/Lu7VLEXoT+6J6
         3zPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=6CQo90Ihj8ZtvZPJjRtxdEgqnfbBUkIVz54RNM+5jy0=;
        b=Nd04lymW+GXILiA2/yPt/PZ3XS0/+SlMa2LaBVt9/5algJU+/0qqonXIzwUUUdYcc/
         E8U6d0ZMXmoyFqgS8kyo3Z/IfChtD8aYP9RtuspPY2N6upRgXLrB3ZRnOzvIElNvUxPg
         ZvX0jimWS1YQRnVr93Zd34MipPCuxCzKySDYQfTAgiSfWT61jl1XuRIfT5WgCoGqfYmu
         h/umPfWZsbpQx4JTpneywrQGDjKW8DT0lJ9+jt0qZcSgviap1hef6tlZVzzM58huBGd3
         bX76CpHt9o6w9mVbDpvEk2eqIk5wTYSMTyurdSo1GZHLuGEW/mwsUyl7N05c+uIIvQYq
         XKUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.187 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.187])
        by mx.google.com with ESMTPS id e3si8908358wrx.330.2018.10.26.08.32.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 08:32:08 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.187 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.187;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.187 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MgARS-1ffLh50QDG-00hbtl; Fri, 26 Oct 2018 17:32:05 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MgARS-1ffLh50QDG-00hbtl; Fri, 26 Oct 2018 17:32:05 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>,
	Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org,
	Michael Walle <michael@walle.cc>,
	Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	xen-devel@lists.xenproject.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Markus Armbruster <armbru@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Kevin Wolf <kwolf@redhat.com>,
	qemu-block@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Subject: [PULL 12/20] tests: Fix typos in comments and help message (found by codespell)
Date: Fri, 26 Oct 2018 17:31:17 +0200
Message-Id: <20181026153125.24738-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ex2+kfocSHYiSFatyHnbgYg6PbpKVY9xitw2Vhe2SRwOK5wFpye
 WzTXWFeZycPBflsRTUQCJdfJIfYS9wEbxqIdLf56LCf/IQvTYsruo8snUVasRtP0S0J2GDm
 aIK9o7o9Xqjm5SH65Y1gwW7/diBtR9KEvlXschdEGuYXQ0Utfn/dtKaQlokYxvqWmBzEnIK
 mIyPtVj6UdDrWmQD06JLA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:detTgguHPt0=:Ec7dYIeTiXiizbwBWjVA82
 1bhjC0EtY+xf53OOXuG7Q9VOa+aBJgKppIySlxiVx4ci0aLVXddBuGtRgBBa6snQutylLHcGh
 E6GV8BiZ8jZY6JgU4cdjPTFR8Y0/0ZSF+1ARF6IqT31mrHv3C95ZSpt7RR5w7I3cK09ki8I72
 iTvOjHV1YBt2E0sXxUE6L5rqeI/tS6EPVX61VpUBs47PPnNclH6vuGIWeem2FK4IIXHQZPX6p
 lDOkTX2T/RRTjasH4Xof6elqb+e2hfDpLQbQt+HRJQJw+5FjgJStOeKDAsVIXWhLRVbiZjuSq
 cjZGKBS7JuTmrYoCQb6zy8O90746NWCVLrSuSkwTurxJL59kRYyUu9Ml4MQnrsGqd/f7IjYhS
 fYrcj9yYO+zAOdusUjkIuV9I0I0k0RMFlvMoXyUIu10Q62ivYAe+8qhm4gvT9IyLNp/6wpwOQ
 QHQPwrsSBcz+lNzIzt2Yd31cGQffdPF2hy3PInHpfrLhz7e7rMUXaX6QruTR1YL3hK5IU3Dx4
 rXaUG+WpG+co3oGpHj+ywZMaKhs9Ho3RoAvMBAfIl2HSb0XFiOTBfeFSj89I+NIMJJbu1JB1Q
 qdBPxuMpcI7kzT2rUvBbz6q5EfKAXCyRcVDlWSFwjRHxJtpMG6fVYPqH4Qz8t1sWxBXwHhUAK
 HUBzn/KyLcw2aGvS0aPRuDzhnr/Vbxg+ef/m1To4nq01zVCYJ4tt42FgZ/XuR0HKBLFumdPlB
 0spzLrBGT41oirWY
X-TUID: w8O8gtQAtWg9

From: Stefan Weil <sw@weilnetz.de>

Fix also a grammar issue.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20180713054755.23323-1-sw@weilnetz.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/bios-tables-test.c              | 2 +-
 tests/docker/Makefile.include         | 2 +-
 tests/docker/docker.py                | 4 ++--
 tests/guest-debug/test-gdbstub.py     | 2 +-
 tests/qemu-iotests/common.qemu        | 2 +-
 tests/tcg/Makefile.include            | 2 +-
 tests/tcg/Makefile.probe              | 2 +-
 tests/tcg/mips/mips64-dsp/subq_s_pw.c | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index 4e24930c4b..af4b1fb6bd 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -390,7 +390,7 @@ try_again:
         if (g_file_test(aml_file, G_FILE_TEST_EXISTS)) {
             exp_sdt.aml_file = aml_file;
         } else if (*ext != '\0') {
-            /* try fallback to generic (extention less) expected file */
+            /* try fallback to generic (extension less) expected file */
             ext = "";
             g_free(aml_file);
             goto try_again;
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 6e03235ab9..9467e9d088 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -41,7 +41,7 @@ docker-qemu-src: $(DOCKER_SRC_COPY)
 docker-image: ${DOCKER_TARGETS}
 
 # General rule for building docker images. If we are a sub-make
-# invoked with SKIP_DOCKER_BUILD we still check the image is upto date
+# invoked with SKIP_DOCKER_BUILD we still check the image is up to date
 # though
 ifdef SKIP_DOCKER_BUILD
 docker-image-%: $(DOCKER_FILES_DIR)/%.docker
diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 44d5f7493b..02d8a83847 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -97,7 +97,7 @@ def _get_so_libs(executable):
     return libs
 
 def _copy_binary_with_libs(src, dest_dir):
-    """Copy a binary executable and all its dependant libraries.
+    """Copy a binary executable and all its dependent libraries.
 
     This does rely on the host file-system being fairly multi-arch
     aware so the file don't clash with the guests layout."""
@@ -284,7 +284,7 @@ class SubCommand(object):
     name = None # Subcommand name
     def shared_args(self, parser):
         parser.add_argument("--quiet", action="store_true",
-                            help="Run quietly unless an error occured")
+                            help="Run quietly unless an error occurred")
 
     def args(self, parser):
         """Setup argument parser"""
diff --git a/tests/guest-debug/test-gdbstub.py b/tests/guest-debug/test-gdbstub.py
index 474d2c5c65..0e4ac01426 100644
--- a/tests/guest-debug/test-gdbstub.py
+++ b/tests/guest-debug/test-gdbstub.py
@@ -122,7 +122,7 @@ class CatchBreakpoint(gdb.Breakpoint):
 
 
 def run_test():
-    "Run throught the tests one by one"
+    "Run through the tests one by one"
 
     print ("Checking we can step the first few instructions")
     step_ok = 0
diff --git a/tests/qemu-iotests/common.qemu b/tests/qemu-iotests/common.qemu
index f285484951..dadde2a266 100644
--- a/tests/qemu-iotests/common.qemu
+++ b/tests/qemu-iotests/common.qemu
@@ -257,7 +257,7 @@ function _launch_qemu()
 }
 
 
-# Silenty kills the QEMU process
+# Silently kills the QEMU process
 #
 # If $wait is set to anything other than the empty string, the process will not
 # be killed but only waited for, and any output will be forwarded to stdout. If
diff --git a/tests/tcg/Makefile.include b/tests/tcg/Makefile.include
index 57470b2a2c..c581bd6ffc 100644
--- a/tests/tcg/Makefile.include
+++ b/tests/tcg/Makefile.include
@@ -2,7 +2,7 @@
 #
 # TCG tests (per-target rules)
 #
-# This Makefile fragement is included from the per-target
+# This Makefile fragment is included from the per-target
 # Makefile.target so will be invoked for each linux-user program we
 # build. We have two options for compiling, either using a configured
 # guest compiler or calling one of our docker images to do it for us.
diff --git a/tests/tcg/Makefile.probe b/tests/tcg/Makefile.probe
index 15c0412657..9dc654663d 100644
--- a/tests/tcg/Makefile.probe
+++ b/tests/tcg/Makefile.probe
@@ -2,7 +2,7 @@
 #
 # TCG Compiler Probe
 #
-# This Makefile fragement is included multiple times in the main make
+# This Makefile fragment is included multiple times in the main make
 # script to probe for available compilers. This is used to build up a
 # selection of required docker targets before we invoke a sub-make for
 # each target.
diff --git a/tests/tcg/mips/mips64-dsp/subq_s_pw.c b/tests/tcg/mips/mips64-dsp/subq_s_pw.c
index e8e0b0567e..4c080b785a 100644
--- a/tests/tcg/mips/mips64-dsp/subq_s_pw.c
+++ b/tests/tcg/mips/mips64-dsp/subq_s_pw.c
@@ -24,7 +24,7 @@ int main(void)
     rt = 0x123456789ABCDEF1;
     rs = 0x123456789ABCDEF2;
     result =  0x0000000000000001;
-    /* This time we do not set dspctrl, but it setted in pre-action. */
+    /* This time we do not set dspctrl, but set it in pre-action. */
     dspresult = 0x1;
 
     __asm
-- 
2.17.2

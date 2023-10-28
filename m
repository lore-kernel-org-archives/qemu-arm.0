Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id h6-20020a5d4fc6000000b00327de0173f6sm3539309wrw.115.2023.10.28.03.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 03:33:12 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 0F02D5F797;
	Sat, 28 Oct 2023 11:33:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Brian Cain <bcain@quicinc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alexandre Iooss <erdnaxe@crans.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Kyle Evans <kevans@freebsd.org>,
	qemu-arm@nongnu.org,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Brad Smith <brad@comstyle.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 01/17] tests/vm/openbsd: Use the system dtc package
Date: Sat, 28 Oct 2023 11:32:55 +0100
Message-Id: <20231028103311.347104-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231028103311.347104-1-alex.bennee@linaro.org>
References: <20231028103311.347104-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Y9giUBJjoYPt

From: Thomas Huth <thuth@redhat.com>

We can use the pre-packaged libfdt from the dtc package to avoid
that we have to compile this code each time again and again.

While we're at it, the "--python=python3" does not seemt to be
necessary anymore, so we can drop it.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20231016154049.37147-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/vm/openbsd | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index 6b4fc29793..85c5bb3536 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -27,6 +27,7 @@ class OpenBSDVM(basevm.BaseVM):
     size = "20G"
     pkgs = [
         # tools
+        "dtc",
         "git",
         "pkgconf",
         "bzip2", "xz",
@@ -67,8 +68,9 @@ class OpenBSDVM(basevm.BaseVM):
         cd $(mktemp -d /home/qemu/qemu-test.XXXXXX);
         mkdir src build; cd src;
         tar -xf /dev/rsd1c;
-        cd ../build
-        ../src/configure --cc=cc --python=python3 {configure_opts};
+        cd ../build;
+        ../src/configure --cc=cc  --extra-cflags=-I/usr/local/include \
+                         --extra-ldflags=-L/usr/local/lib {configure_opts};
         gmake --output-sync -j{jobs} {target} {verbose};
     """
     poweroff = "halt -p"
-- 
2.39.2

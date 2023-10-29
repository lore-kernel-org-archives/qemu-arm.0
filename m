Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id q7-20020a05600c46c700b004076f522058sm10333416wmo.0.2023.10.29.07.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Oct 2023 07:50:34 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 236545F7A1;
	Sun, 29 Oct 2023 14:50:34 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Brad Smith <brad@comstyle.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Kyle Evans <kevans@freebsd.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Brian Cain <bcain@quicinc.com>,
	Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH v2 01/19] tests/vm/openbsd: Use the system dtc package
Date: Sun, 29 Oct 2023 14:50:15 +0000
Message-Id: <20231029145033.592566-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231029145033.592566-1-alex.bennee@linaro.org>
References: <20231029145033.592566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: O5wufBycXHO2

From: Thomas Huth <thuth@redhat.com>

We can use the pre-packaged libfdt from the dtc package to avoid
that we have to compile this code each time again and again.

While we're at it, the "--python=python3" does not seemt to be
necessary anymore, so we can drop it.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20231016154049.37147-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231028103311.347104-2-alex.bennee@linaro.org>
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

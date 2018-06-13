Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id l15-v6sm2754700wrs.95.2018.06.13.05.56.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jun 2018 05:56:03 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 634113E1124;
	Wed, 13 Jun 2018 13:56:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v3 04/22] build-all-arches: do a distclean $(SRC) configured
Date: Wed, 13 Jun 2018 13:55:43 +0100
Message-Id: <20180613125601.14371-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180613125601.14371-1-alex.bennee@linaro.org>
References: <20180613125601.14371-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6iqe94GWSN6Z

This can cause much confusion when you have been building in your
source tree. I've added a distclean so we don't unexpectedly drop the
config for normal make clean invocations.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 Makefile        |  3 +++
 build-all-archs | 10 ++++++++++
 2 files changed, 13 insertions(+)

diff --git a/Makefile b/Makefile
index ca80eef..16e48a0 100644
--- a/Makefile
+++ b/Makefile
@@ -51,3 +51,6 @@ $(PROG): $(OBJS)
 
 clean:
 	rm -f $(PROG) $(OBJS) $(BINS)
+
+distclean: clean
+	rm -f config.h Makefile.in
diff --git a/build-all-archs b/build-all-archs
index a2f5cff..a7cd7c2 100755
--- a/build-all-archs
+++ b/build-all-archs
@@ -54,6 +54,16 @@ while [[ "$1" = -* ]]; do
     esac
 done
 
+#
+# If you are developing your primary architecture directly out of the
+# source tree you can confuse any out-of-tree builds thanks to random
+# crap in your VPATH. Let's detect that and save some hair pulling.
+#
+if [ -e Makefile.in ]; then
+    echo "Cleaning in-src-tree build"
+    make distclean
+fi
+
 # Debian stretch and Ubuntu Xenial have cross compiler packages for
 # all of these:
 #   gcc-arm-linux-gnueabihf gcc-aarch64-linux-gnu gcc-m68k-linux-gnu
-- 
2.17.1

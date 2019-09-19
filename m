Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id j26sm16970160wrd.2.2019.09.19.10.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 10:19:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3D8211FF9F;
	Thu, 19 Sep 2019 18:10:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 16/16] Makefile: fix-up qemu-ga.8 paths to take in-src builds into account
Date: Thu, 19 Sep 2019 18:10:15 +0100
Message-Id: <20190919171015.12681-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190919171015.12681-1-alex.bennee@linaro.org>
References: <20190919171015.12681-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FB4niU/+/FnR

We tweak MANUAL_BUILDIR for in-src builds because sphinx won't build
documents inside a source tree. This was causing the document build to
fail on things like shippable which were using in-tree builds.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 Makefile | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/Makefile b/Makefile
index 3cf5b1e7539..8da33595edd 100644
--- a/Makefile
+++ b/Makefile
@@ -324,8 +324,19 @@ endif
 endif
 endif
 
+# Sphinx does not allow building manuals into the same directory as
+# the source files, so if we're doing an in-tree QEMU build we must
+# build the manuals into a subdirectory (and then install them from
+# there for 'make install'). For an out-of-tree build we can just
+# use the docs/ subdirectory in the build tree as normal.
+ifeq ($(realpath $(SRC_PATH)),$(realpath .))
+MANUAL_BUILDDIR := docs/built
+else
+MANUAL_BUILDDIR := docs
+endif
+
 ifdef BUILD_DOCS
-DOCS=qemu-doc.html qemu-doc.txt qemu.1 qemu-img.1 qemu-nbd.8 docs/interop/qemu-ga.8
+DOCS=qemu-doc.html qemu-doc.txt qemu.1 qemu-img.1 qemu-nbd.8 $(MANUAL_BUILDDIR)/interop/qemu-ga.8
 DOCS+=docs/interop/qemu-qmp-ref.html docs/interop/qemu-qmp-ref.txt docs/interop/qemu-qmp-ref.7
 DOCS+=docs/interop/qemu-ga-ref.html docs/interop/qemu-ga-ref.txt docs/interop/qemu-ga-ref.7
 DOCS+=docs/qemu-block-drivers.7
@@ -703,17 +714,6 @@ dist: qemu-$(VERSION).tar.bz2
 qemu-%.tar.bz2:
 	$(SRC_PATH)/scripts/make-release "$(SRC_PATH)" "$(patsubst qemu-%.tar.bz2,%,$@)"
 
-# Sphinx does not allow building manuals into the same directory as
-# the source files, so if we're doing an in-tree QEMU build we must
-# build the manuals into a subdirectory (and then install them from
-# there for 'make install'). For an out-of-tree build we can just
-# use the docs/ subdirectory in the build tree as normal.
-ifeq ($(realpath $(SRC_PATH)),$(realpath .))
-MANUAL_BUILDDIR := docs/built
-else
-MANUAL_BUILDDIR := docs
-endif
-
 define clean-manual =
 rm -rf $(MANUAL_BUILDDIR)/$1/_static
 rm -f $(MANUAL_BUILDDIR)/$1/objects.inv $(MANUAL_BUILDDIR)/$1/searchindex.js $(MANUAL_BUILDDIR)/$1/*.html
@@ -823,7 +823,7 @@ ifdef CONFIG_TRACE_SYSTEMTAP
 	$(INSTALL_DATA) scripts/qemu-trace-stap.1 "$(DESTDIR)$(mandir)/man1"
 endif
 ifneq (,$(findstring qemu-ga,$(TOOLS)))
-	$(INSTALL_DATA) docs/interop/qemu-ga.8 "$(DESTDIR)$(mandir)/man8"
+	$(INSTALL_DATA) $(MANUAL_BUILDDIR)/interop/qemu-ga.8 "$(DESTDIR)$(mandir)/man8"
 	$(INSTALL_DATA) docs/interop/qemu-ga-ref.html "$(DESTDIR)$(qemu_docdir)"
 	$(INSTALL_DATA) docs/interop/qemu-ga-ref.txt "$(DESTDIR)$(qemu_docdir)"
 	$(INSTALL_DATA) docs/interop/qemu-ga-ref.7 "$(DESTDIR)$(mandir)/man7"
-- 
2.20.1

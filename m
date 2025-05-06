Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891e980bsm692494666b.76.2025.05.06.05.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:57:22 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 727145FAE0;
	Tue,  6 May 2025 13:57:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH v2 14/14] docs: Use uniquelabel in qemu-block-drivers.rst.inc
Date: Tue,  6 May 2025 13:57:15 +0100
Message-Id: <20250506125715.232872-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250506125715.232872-1-alex.bennee@linaro.org>
References: <20250506125715.232872-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +EUB2eZii49C

From: Peter Maydell <peter.maydell@linaro.org>

Use the uniquelabel directive for the 'nbd' label in
qemu-block-drivers.rst.inc.  This avoids a complaint from some Sphinx
versions about it being a duplicate label, and means that we can
reliably ensure that the link in codebase.rst goes to the document
file that we intend (i.e.  the section of the HTML manual on disk
images, not the HTML copy of the qemu-block-drivers manpage).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20250429163212.618953-3-peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/codebase.rst                | 2 +-
 docs/system/qemu-block-drivers.rst.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/devel/codebase.rst b/docs/devel/codebase.rst
index 40273e7d31..f3f133e9ad 100644
--- a/docs/devel/codebase.rst
+++ b/docs/devel/codebase.rst
@@ -116,7 +116,7 @@ yet, so sometimes the source code is all you have.
 * `monitor <https://gitlab.com/qemu-project/qemu/-/tree/master/monitor>`_:
   `Monitor <QEMU monitor>` implementation (HMP & QMP).
 * `nbd <https://gitlab.com/qemu-project/qemu/-/tree/master/nbd>`_:
-  QEMU `NBD (Network Block Device) <nbd>` server.
+  QEMU `NBD (Network Block Device) <system/images-nbd>` server.
 * `net <https://gitlab.com/qemu-project/qemu/-/tree/master/net>`_:
   Network (host) support.
 * `pc-bios <https://gitlab.com/qemu-project/qemu/-/tree/master/pc-bios>`_:
diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-block-drivers.rst.inc
index cfe1acb78a..1a405e4782 100644
--- a/docs/system/qemu-block-drivers.rst.inc
+++ b/docs/system/qemu-block-drivers.rst.inc
@@ -500,7 +500,7 @@ What you should *never* do:
 - expect it to work when loadvm'ing
 - write to the FAT directory on the host system while accessing it with the guest system
 
-.. _nbd:
+.. uniquelabel:: nbd
 
 NBD access
 ~~~~~~~~~~
-- 
2.39.5

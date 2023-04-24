Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id d3-20020a05600c3ac300b003f19b3d89e9sm5407520wms.33.2023.04.24.02.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 02:22:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3B87B1FFC5;
	Mon, 24 Apr 2023 10:22:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Juan Quintela <quintela@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Markus Armbruster <armbru@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	David Hildenbrand <david@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-s390x@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 15/18] docs/system: remove excessive punctuation from guest-loader docs
Date: Mon, 24 Apr 2023 10:22:46 +0100
Message-Id: <20230424092249.58552-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424092249.58552-1-alex.bennee@linaro.org>
References: <20230424092249.58552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YRyw34sJChfY

A possessive its needs no ' whereas the contraction of it is does.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230420155723.1711048-7-alex.bennee@linaro.org>
---
 docs/system/guest-loader.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/system/guest-loader.rst b/docs/system/guest-loader.rst
index 9ef9776bf0..304ee5d531 100644
--- a/docs/system/guest-loader.rst
+++ b/docs/system/guest-loader.rst
@@ -14,7 +14,7 @@ The guest loader does two things:
   - load blobs (kernels and initial ram disks) into memory
   - sets platform FDT data so hypervisors can find and boot them
 
-This is what is typically done by a boot-loader like grub using it's
+This is what is typically done by a boot-loader like grub using its
 multi-boot capability. A typical example would look like:
 
 .. parsed-literal::
@@ -25,9 +25,9 @@ multi-boot capability. A typical example would look like:
     -device guest-loader,addr=0x47000000,initrd=rootfs.cpio
 
 In the above example the Xen hypervisor is loaded by the -kernel
-parameter and passed it's boot arguments via -append. The Dom0 guest
+parameter and passed its boot arguments via -append. The Dom0 guest
 is loaded into the areas of memory. Each blob will get
-``/chosen/module@<addr>`` entry in the FDT to indicate it's location and
+``/chosen/module@<addr>`` entry in the FDT to indicate its location and
 size. Additional information can be passed with by using additional
 arguments.
 
-- 
2.39.2

Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 12-20020a05600c230c00b003fe24441e23sm3134878wmo.24.2023.08.24.09.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 09:39:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C22D31FFC0;
	Thu, 24 Aug 2023 17:39:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>,
	qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-s390x@nongnu.org,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Juan Quintela <quintela@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 05/12] .gitlab-ci.d/cirrus.yml: Update FreeBSD to v13.2
Date: Thu, 24 Aug 2023 17:39:03 +0100
Message-Id: <20230824163910.1737079-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230824163910.1737079-1-alex.bennee@linaro.org>
References: <20230824163910.1737079-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ePVPk7qOaPxN

From: Thomas Huth <thuth@redhat.com>

The FreeBSD CI job started to fail due to linking problems ... time
to update to the latest version to get this fixed.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230823144533.230477-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/cirrus.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index 1507c928e5..41d64d6680 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -50,7 +50,7 @@ x64-freebsd-13-build:
     NAME: freebsd-13
     CIRRUS_VM_INSTANCE_TYPE: freebsd_instance
     CIRRUS_VM_IMAGE_SELECTOR: image_family
-    CIRRUS_VM_IMAGE_NAME: freebsd-13-1
+    CIRRUS_VM_IMAGE_NAME: freebsd-13-2
     CIRRUS_VM_CPUS: 8
     CIRRUS_VM_RAM: 8G
     UPDATE_COMMAND: pkg update; pkg upgrade -y
-- 
2.39.2

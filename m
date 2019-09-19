Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id w4sm9016322wrv.66.2019.09.19.10.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 10:10:16 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D4B1E1FF8F;
	Thu, 19 Sep 2019 18:10:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Fam Zheng <fam@euphon.net>
Subject: [PATCH  v2 02/16] tests/docker: fix DOCKER_PARTIAL_IMAGES
Date: Thu, 19 Sep 2019 18:10:01 +0100
Message-Id: <20190919171015.12681-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190919171015.12681-1-alex.bennee@linaro.org>
References: <20190919171015.12681-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0ibGug+myC84

Finger trouble in a previous clean-up inadvertently set
DEBIAN_PARTIAL_IMAGES instead of DOCKER_PARTIAL_IMAGES. Also fix the
typo to debian-9-mxe.

Fixes: 44d5a8bf5d2
Signed-off-by: John Snow <jsnow@redhat.com>
[AJB: merged fix from Message-Id: <20190917185537.25417-1-jsnow@redhat.com>]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/docker/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 50a400b573a..3fc7a863e51 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -7,7 +7,7 @@ DOCKER_FILES_DIR := $(SRC_PATH)/tests/docker/dockerfiles
 DOCKER_DEPRECATED_IMAGES := debian
 # we don't run tests on intermediate images (used as base by another image)
 DOCKER_PARTIAL_IMAGES := debian debian8 debian9 debian10 debian-sid
-DEBIAN_PARTIAL_IMAGES += debian8-mxe debian-9-mxe debian-ports debian-bootstrap
+DOCKER_PARTIAL_IMAGES += debian8-mxe debian9-mxe debian-ports debian-bootstrap
 DOCKER_IMAGES := $(filter-out $(DOCKER_DEPRECATED_IMAGES),$(sort $(notdir $(basename $(wildcard $(DOCKER_FILES_DIR)/*.docker)))))
 DOCKER_TARGETS := $(patsubst %,docker-image-%,$(DOCKER_IMAGES))
 # Use a global constant ccache directory to speed up repetitive builds
-- 
2.20.1

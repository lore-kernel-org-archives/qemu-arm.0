Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adb35af4456sm733280266b.182.2025.06.03.04.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:02:05 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id EC66B5F9CC;
	Tue, 03 Jun 2025 12:02:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PATCH v4 01/17] tests/docker: expose $HOME/.cache/qemu as docker volume
Date: Tue,  3 Jun 2025 12:01:48 +0100
Message-ID: <20250603110204.838117-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250603110204.838117-1-alex.bennee@linaro.org>
References: <20250603110204.838117-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: y5l+c1fDvhcN

If you want to run functional tests we should share .cache/qemu so we
don't force containers to continually re-download images. We also move
ccache to use this shared area.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>

---
v3
  - mention ccache
v2
  - Share a whole .cache/qemu path.
---
 tests/docker/Makefile.include | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index fa1cbb6726..3959d8a028 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -185,8 +185,10 @@ docker:
 
 docker-help: docker
 
+# Where QEMU caches build artefacts
+DOCKER_QEMU_CACHE_DIR := $$HOME/.cache/qemu
 # Use a global constant ccache directory to speed up repetitive builds
-DOCKER_CCACHE_DIR := $$HOME/.cache/qemu-docker-ccache
+DOCKER_QEMU_CCACHE_DIR := DOCKER_QEMU_CACHE_DIR/docker-ccache
 
 # This rule if for directly running against an arbitrary docker target.
 # It is called by the expanded docker targets (e.g. make
@@ -195,7 +197,7 @@ DOCKER_CCACHE_DIR := $$HOME/.cache/qemu-docker-ccache
 # For example: make docker-run TEST="test-quick" IMAGE="debian:arm64" EXECUTABLE=./aarch64-linux-user/qemu-aarch64
 #
 docker-run: docker-qemu-src
-	@mkdir -p "$(DOCKER_CCACHE_DIR)"
+	@mkdir -p "$(DOCKER_QEMU_CCACHE_DIR)"
 	@if test -z "$(IMAGE)" || test -z "$(TEST)"; \
 		then echo "Invalid target $(IMAGE)/$(TEST)"; exit 1; \
 	fi
@@ -222,8 +224,8 @@ docker-run: docker-qemu-src
 			-e V=$V -e J=$J -e DEBUG=$(DEBUG)		\
 			-e SHOW_ENV=$(SHOW_ENV) 			\
 			$(if $(NOUSER),,				\
-				-e CCACHE_DIR=/var/tmp/ccache 		\
-				-v $(DOCKER_CCACHE_DIR):/var/tmp/ccache:z \
+				-v $(DOCKER_QEMU_CACHE_DIR):$(DOCKER_QEMU_CACHE_DIR) 	\
+				-e CCACHE_DIR=$(DOCKER_QEMU_CCACHE_DIR)	\
 			)						\
 			-v $$(readlink -e $(DOCKER_SRC_COPY)):/var/tmp/qemu:z$(COMMA)ro \
 			$(IMAGE) 					\
-- 
2.47.2

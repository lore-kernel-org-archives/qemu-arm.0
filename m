Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777c8b12sm7766567a12.24.2025.05.06.05.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:57:16 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 32BA35F947;
	Tue,  6 May 2025 13:57:15 +0100 (BST)
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
Subject: [PATCH v2 01/14] tests/docker: expose $HOME/.cache/qemu as docker volume
Date: Tue,  6 May 2025 13:57:02 +0100
Message-Id: <20250506125715.232872-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250506125715.232872-1-alex.bennee@linaro.org>
References: <20250506125715.232872-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rdQ53X0wGzUl

If you want to run functional tests we should share .cache/qemu so we
don't force containers to continually re-download images.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
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
2.39.5

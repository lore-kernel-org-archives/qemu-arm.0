Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc62sm618677666b.25.2025.04.28.05.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 05:59:19 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 592E05F93C;
	Mon, 28 Apr 2025 13:59:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PATCH 1/9] tests/docker: expose $HOME/.cache as docker volume
Date: Mon, 28 Apr 2025 13:59:10 +0100
Message-Id: <20250428125918.449346-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250428125918.449346-1-alex.bennee@linaro.org>
References: <20250428125918.449346-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fVjoh+lQrswS

If you want to run functional tests we should share .cache so we don't
force containers to continually re-download images.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index fa1cbb6726..56a8d9f8ff 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -224,6 +224,7 @@ docker-run: docker-qemu-src
 			$(if $(NOUSER),,				\
 				-e CCACHE_DIR=/var/tmp/ccache 		\
 				-v $(DOCKER_CCACHE_DIR):/var/tmp/ccache:z \
+				-v $(HOME)/.cache:$(HOME)/.cache 	\
 			)						\
 			-v $$(readlink -e $(DOCKER_SRC_COPY)):/var/tmp/qemu:z$(COMMA)ro \
 			$(IMAGE) 					\
-- 
2.39.5

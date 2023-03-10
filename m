Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 20-20020a05600c22d400b003ebfc075eaasm1748419wmg.16.2023.03.10.02.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 02:31:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B493C1FFBA;
	Fri, 10 Mar 2023 10:31:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Fabiano Rosas <farosas@suse.de>
Subject: [PATCH 02/11] tests/docker: all add DOCKER_BUILDKIT to RUNC environment
Date: Fri, 10 Mar 2023 10:31:14 +0000
Message-Id: <20230310103123.2118519-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310103123.2118519-1-alex.bennee@linaro.org>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: uZ+e+Q+zG3M4

It seems we also need to pass DOCKER_BUILDKIT as an argument to docker
itself to get the full benefit of caching.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Suggested-by: Fabiano Rosas <farosas@suse.de>
---
 tests/docker/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 54ed77f671..9401525325 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -39,7 +39,7 @@ docker-qemu-src: $(DOCKER_SRC_COPY)
 # General rule for building docker images.
 docker-image-%: $(DOCKER_FILES_DIR)/%.docker
 	  $(call quiet-command,			\
-		$(RUNC) build				\
+		DOCKER_BUILDKIT=1 $(RUNC) build		\
 		$(if $V,,--quiet)			\
 		$(if $(NOCACHE),--no-cache,		\
 			$(if $(DOCKER_REGISTRY),--cache-from $(DOCKER_REGISTRY)/qemu/$*)) \
-- 
2.39.2

Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id v9-20020a5d6b09000000b0031759e6b43fsm2564444wrw.39.2023.08.10.08.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 08:36:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id EA76E1FFBD;
	Thu, 10 Aug 2023 16:36:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Yonggang Luo <luoyonggang@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 2/8] tests/docker: cleanup non-verbose output
Date: Thu, 10 Aug 2023 16:36:34 +0100
Message-Id: <20230810153640.1879717-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230810153640.1879717-1-alex.bennee@linaro.org>
References: <20230810153640.1879717-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +Ghj79tPh3ZU

Even with --quiet docker will spam the sha256 to the console. Avoid
this by redirecting stdout. While we are at it fix the name we echo
which was broken during 0b1a649047 (tests/docker: use direct RUNC call
to build containers).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 142e8605ee..dfabafab92 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -46,9 +46,9 @@ docker-image-%: $(DOCKER_FILES_DIR)/%.docker
 		--build-arg BUILDKIT_INLINE_CACHE=1 	\
 		$(if $(NOUSER),,			\
 			--build-arg USER=$(USER)	\
-			--build-arg UID=$(UID))	\
-		-t qemu/$* - < $<, 			\
-		"BUILD", $1)
+			--build-arg UID=$(UID))		\
+		-t qemu/$* - < $< $(if $V,,> /dev/null),\
+		"BUILD", $*)
 
 # Special rule for debootstraped binfmt linux-user images
 docker-binfmt-image-debian-%: $(DOCKER_FILES_DIR)/debian-bootstrap.docker
-- 
2.39.2

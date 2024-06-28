Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861324ff85sm983330a12.29.2024.06.28.05.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 05:43:03 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 6C1EE5F9FA;
	Fri, 28 Jun 2024 13:42:59 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Mads Ynddal <mads@ynddal.dk>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 05/23] tests/docker: Specify --userns keep-id for Podman
Date: Fri, 28 Jun 2024 13:42:40 +0100
Message-Id: <20240628124258.832466-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240628124258.832466-1-alex.bennee@linaro.org>
References: <20240628124258.832466-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +7i4DGwPqZ5h

From: Akihiko Odaki <akihiko.odaki@daynix.com>

Previously we are always specifying -u $(UID) to match the UID in the
container with one outside. This causes a problem with rootless Podman.

Rootless Podman remaps user IDs in the container to ones controllable
for the current user outside. The -u option instructs Podman to use
a specified UID in the container but does not affect the UID remapping.
Therefore, the UID in the container can be remapped to some other UID
outside the container. This can make the access to bind-mounted volumes
fail because the remapped UID mismatches with the owner of the
directories.

Replace -u $(UID) with --userns keep-id, which fixes the UID remapping.
This change is limited to Podman because Docker does not support
--userns keep-id.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20240626-podman-v1-1-f8c8daf2bb0a@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 8df50a0ca0..708e3a72fb 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -207,7 +207,12 @@ docker-run: docker-qemu-src
 	$(call quiet-command,						\
 		$(RUNC) run 						\
 			--rm						\
-			$(if $(NOUSER),,-u $(UID)) 			\
+			$(if $(NOUSER),,				\
+				$(if $(filter docker,$(RUNC)),		\
+					-u $(UID),			\
+					--userns keep-id		\
+				)					\
+			) 						\
 			--security-opt seccomp=unconfined		\
 			$(if $(DEBUG),-ti,)				\
 			$(if $(NETWORK),$(if $(subst $(NETWORK),,1),--net=$(NETWORK)),--net=none) \
-- 
2.39.2

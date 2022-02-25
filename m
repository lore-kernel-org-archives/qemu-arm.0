Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l21-20020a056402231500b0041327b58030sm1669973eda.2.2022.02.25.09.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 09:20:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2ADCF1FFBA;
	Fri, 25 Feb 2022 17:20:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net,
	berrange@redhat.com,
	f4bug@amsat.org,
	aurelien@aurel32.net,
	pbonzini@redhat.com,
	stefanha@redhat.com,
	crosa@redhat.com,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	sw@weilnetz.de,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v2 02/18] tests/docker: add NOUSER for alpine image
Date: Fri, 25 Feb 2022 17:20:05 +0000
Message-Id: <20220225172021.3493923-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225172021.3493923-1-alex.bennee@linaro.org>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: X/VMxdtteCqZ

The alpine image doesn't have a standard useradd binary so disable
this convenience feature for it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220211160309.335014-3-alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 0ec59b2193..286f0ac5b5 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -158,6 +158,9 @@ docker-image-debian-native: DOCKER_REGISTRY=
 docker-image-debian10: NOUSER=1
 docker-image-debian11: NOUSER=1
 
+# alpine has no adduser
+docker-image-alpine: NOUSER=1
+
 #
 # The build rule for hexagon-cross is special in so far for most of
 # the time we don't want to build it. While dockers caching does avoid
-- 
2.30.2

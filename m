Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id y16sm6801251wru.28.2019.07.12.04.18.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 12 Jul 2019 04:18:51 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4E02A1FF90;
	Fri, 12 Jul 2019 12:18:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <fam@euphon.net>
Subject: [PATCH  v1 3/7] tests/docker: Install Sphinx in the Fedora image
Date: Fri, 12 Jul 2019 12:18:45 +0100
Message-Id: <20190712111849.9006-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190712111849.9006-1-alex.bennee@linaro.org>
References: <20190712111849.9006-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: oFTkZBhsjm6T

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Since commit 5f71eac06e the Sphinx tool is required
to build the rST documentation.

This fixes:

 $ ./configure --enable-docs

 ERROR: User requested feature docs
        configure was not able to find it.
        Install texinfo, Perl/perl-podlators and python-sphinx

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20190711102710.2263-1-philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/fedora.docker | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 619d1b5656d..e6d39e14cb1 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -76,6 +76,7 @@ ENV PACKAGES \
     perl-Test-Harness \
     pixman-devel \
     python3 \
+    python3-sphinx \
     PyYAML \
     rdma-core-devel \
     SDL2-devel \
-- 
2.20.1

Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id v14-v6sm2988414wro.33.2018.06.13.05.56.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jun 2018 05:56:03 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 56A2B3E10B4;
	Wed, 13 Jun 2018 13:56:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v3 03/22] build-all-arches: expand the range of docker images
Date: Wed, 13 Jun 2018 13:55:42 +0100
Message-Id: <20180613125601.14371-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180613125601.14371-1-alex.bennee@linaro.org>
References: <20180613125601.14371-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Q1C7l4NGeohB

We won't actually want power, we want ppc64el for the 64 bit version.
Also we will soon have m68k so include that as well.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 build-all-archs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/build-all-archs b/build-all-archs
index fa2ac90..a2f5cff 100755
--- a/build-all-archs
+++ b/build-all-archs
@@ -39,7 +39,7 @@ while [[ "$1" = -* ]]; do
             ;;
         --use-docker)
             if [ -z "$arg" ]; then
-                default_tags=$(docker images qemu --format "{{.Repository}}:{{.Tag}}" | grep "\(arm\|power\).*cross$")
+                default_tags=$(docker images qemu --format "{{.Repository}}:{{.Tag}}" | grep "\(arm\|ppc64el\|m68k\).*cross$")
                 docker_tags=$(echo $default_tags | sed 's/\n/\s/g' )
             else
                 docker_tags="$arg"
-- 
2.17.1

Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id n30sm652080wra.39.2017.11.07.07.06.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Nov 2017 07:06:10 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 921F73E03B5;
	Tue,  7 Nov 2017 15:06:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: Dave.Martin@arm.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH 01/10] build-all-arches: drop -t (for tty) from docker invocation
Date: Tue,  7 Nov 2017 15:05:49 +0000
Message-Id: <20171107150558.22131-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171107150558.22131-1-alex.bennee@linaro.org>
References: <20171107150558.22131-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: OF1PnrWXdB7y

This prevents gcc from going nuts with colorizing the compiler output
which looks particularly ugly when invoked via compilation-mode.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 build-all-archs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/build-all-archs b/build-all-archs
index 63918e5..fa2ac90 100755
--- a/build-all-archs
+++ b/build-all-archs
@@ -61,7 +61,7 @@ done
 # If docker is enabled we just brute force the various images until we
 # can set the one that has a workable cross compiler.
 
-DOCKER_RUN="docker run --rm -t -u $(id -u) -v $(pwd):$(pwd) -w $(pwd)"
+DOCKER_RUN="docker run --rm -u $(id -u) -v $(pwd):$(pwd) -w $(pwd)"
 
 program_exists() {
     if [ ! -z "$docker_tags" ]; then
-- 
2.14.2

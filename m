Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id r23sm781899wrc.93.2017.11.07.07.06.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Nov 2017 07:06:15 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id BDA543E044B;
	Tue,  7 Nov 2017 15:06:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: Dave.Martin@arm.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH 05/10] configure: allow repeated invocation of configure in build dir
Date: Tue,  7 Nov 2017 15:05:53 +0000
Message-Id: <20171107150558.22131-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171107150558.22131-1-alex.bennee@linaro.org>
References: <20171107150558.22131-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8UT2kdCz0mXb

Otherwise a second configure run will totally miss out the setting of
BUILD_INC. I made the link -sf as it seemed the easier way around.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 1dc527b..c622a5e 100755
--- a/configure
+++ b/configure
@@ -176,10 +176,10 @@ fi
 
 # Are we in a separate build tree? If so, link the Makefile
 # so that 'make' works.
-if test ! -e Makefile; then
+if test ! -e Makefile || test -s Makefile; then
     echo "linking Makefile..."
     BUILD_INC="-I $(pwd)"
-    ln -s "${SRCDIR}/Makefile" .
+    ln -sf "${SRCDIR}/Makefile" .
 fi
 
 generate_config
-- 
2.14.2

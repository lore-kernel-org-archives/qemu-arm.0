Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id z3-v6sm2875392wrn.42.2018.06.13.05.56.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jun 2018 05:56:02 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 4B5963E10A4;
	Wed, 13 Jun 2018 13:56:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v3 02/22] comms: include header for writev
Date: Wed, 13 Jun 2018 13:55:41 +0100
Message-Id: <20180613125601.14371-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180613125601.14371-1-alex.bennee@linaro.org>
References: <20180613125601.14371-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: aW3My1iT9jJd

The compiler complains about implicit declarations otherwise.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 comms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/comms.c b/comms.c
index 2900c33..6946fd9 100644
--- a/comms.c
+++ b/comms.c
@@ -17,6 +17,7 @@
 #include <errno.h>
 #include <sys/socket.h>
 #include <sys/types.h>
+#include <sys/uio.h>
 #include <netinet/in.h>
 #include <netdb.h>
 
-- 
2.17.1

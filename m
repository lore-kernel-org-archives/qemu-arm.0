Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id f2-v6sm8425313wre.16.2018.06.22.07.12.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jun 2018 07:12:05 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 6E5933E08B3;
	Fri, 22 Jun 2018 15:12:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v4 02/22] comms: include header for writev
Date: Fri, 22 Jun 2018 15:11:45 +0100
Message-Id: <20180622141205.16306-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180622141205.16306-1-alex.bennee@linaro.org>
References: <20180622141205.16306-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: o/kuAYPEkq+P

The compiler complains about implicit declarations otherwise.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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

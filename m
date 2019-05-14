Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 6sm18365980wrd.51.2019.05.14.08.59.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 14 May 2019 08:59:43 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 029091FF9A;
	Tue, 14 May 2019 16:53:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH  11/11] MAINTAINERS: update for semihostings new home
Date: Tue, 14 May 2019 16:53:01 +0100
Message-Id: <20190514155301.16123-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190514155301.16123-1-alex.bennee@linaro.org>
References: <20190514155301.16123-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +yFE4JNmpxhU

Seeing as I touched it I should at least keep an eye on it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a73a61a5465..e9050beb222 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2559,6 +2559,13 @@ F: docs/pvrdma.txt
 F: contrib/rdmacm-mux/*
 F: qapi/rdma.json
 
+Semihosting
+M: Alex Bennée <alex.bennee@linaro.org>
+L: qemu-devel@nongnu.org
+S: Maintained
+F: hw/semihosting/
+F: include/hw/semihosting/
+
 Build and test automation
 -------------------------
 Build and test automation
-- 
2.20.1

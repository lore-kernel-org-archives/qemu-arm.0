Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id z13sm23588885wrw.42.2019.05.23.03.25.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 03:25:35 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 71A1A1FF9A;
	Thu, 23 May 2019 11:25:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH  v2 11/28] MAINTAINERS: update for semihostings new home
Date: Thu, 23 May 2019 11:25:15 +0100
Message-Id: <20190523102532.10486-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523102532.10486-1-alex.bennee@linaro.org>
References: <20190523102532.10486-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: OlJ9nD+yGe3w

Seeing as I touched it I should at least keep an eye on it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a6948ebc63b..c4f209898a9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2560,6 +2560,13 @@ F: docs/pvrdma.txt
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

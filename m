Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id i131sm24325080wmf.0.2017.07.04.07.48.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jul 2017 07:48:15 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 0266A3E21FA;
	Tue,  4 Jul 2017 15:49:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH 05/11] risu.el: derive from text-mode
Date: Tue,  4 Jul 2017 15:48:53 +0100
Message-Id: <20170704144859.17644-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170704144859.17644-1-alex.bennee@linaro.org>
References: <20170704144859.17644-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: dmuy9pJZ3BbC

As RISU files have copious commentary it seems better to derive from
text-mode so we can access things like spell-checker short cuts ;-)

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 risu.el | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/risu.el b/risu.el
index dff9337..1875d02 100644
--- a/risu.el
+++ b/risu.el
@@ -39,7 +39,7 @@
 
 ;;; Code
 
-(define-derived-mode risu-mode fundamental-mode "RISU"
+(define-derived-mode risu-mode text-mode "RISU"
   "Major mode for editing RISU control files."
   (set (make-local-variable 'font-lock-defaults) '(risu-font-lock-keywords)))
 
-- 
2.13.0

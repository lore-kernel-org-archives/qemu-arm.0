Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x21sm20654607wme.24.2017.07.04.07.48.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jul 2017 07:48:15 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 0D4263E21FB;
	Tue,  4 Jul 2017 15:49:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH 06/11] risugen: fix bad indent
Date: Tue,  4 Jul 2017 15:48:54 +0100
Message-Id: <20170704144859.17644-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170704144859.17644-1-alex.bennee@linaro.org>
References: <20170704144859.17644-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2/M/YSF5Zf+L

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 risugen | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/risugen b/risugen
index 8b20425..347cf12 100755
--- a/risugen
+++ b/risugen
@@ -262,7 +262,7 @@ Valid options:
                    These REs are applied after the matching pattern which
                    is useful if you want to exclude a specific instruction from
                    a general set you have excluded.
-     --no-fp      : disable floating point: no fp init, randomization etc.
+    --no-fp      : disable floating point: no fp init, randomization etc.
                    Useful to test before support for FP is available.
     --be         : generate instructions in Big-Endian byte order (ppc64 only).
     --help       : print this message
-- 
2.13.0

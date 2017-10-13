Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id s196sm2224812wmb.26.2017.10.13.09.24.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Oct 2017 09:24:42 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id AE6C23E06EB;
	Fri, 13 Oct 2017 17:24:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Cc: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 04/30] target/arm/cpu.h: update comment for half-precision values
Date: Fri, 13 Oct 2017 17:24:12 +0100
Message-Id: <20171013162438.32458-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20171013162438.32458-1-alex.bennee@linaro.org>
References: <20171013162438.32458-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: UjMULN4AJ9IA

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 3a0f27c782..521b82d46e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -488,6 +488,7 @@ typedef struct CPUARMState {
          *  Qn = regs[2n+1]:regs[2n]
          *  Dn = regs[2n]
          *  Sn = regs[2n] bits 31..0
+         *  Hn = regs[2n] bits 15..0 for even n, and bits 31..16 for odd n
          * This corresponds to the architecturally defined mapping between
          * the two execution states, and means we do not need to explicitly
          * map these registers when changing states.
-- 
2.14.1

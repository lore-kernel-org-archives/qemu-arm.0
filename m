Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id k4sm6288158wrx.91.2018.11.08.08.33.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Nov 2018 08:33:32 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 476673E0593;
	Thu,  8 Nov 2018 16:33:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 5/6] arm: use symbolic MDCR_TDE in arm_debug_target_el
Date: Thu,  8 Nov 2018 16:33:28 +0000
Message-Id: <20181108163329.19940-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181108163329.19940-1-alex.bennee@linaro.org>
References: <20181108163329.19940-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9bZsgp0VDfYq

We already have this symbol defined so lets use it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b5eff79f73..1efff21a18 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2743,7 +2743,7 @@ static inline int arm_debug_target_el(CPUARMState *env)
 
     if (arm_feature(env, ARM_FEATURE_EL2) && !secure) {
         route_to_el2 = env->cp15.hcr_el2 & HCR_TGE ||
-                       env->cp15.mdcr_el2 & (1 << 8);
+                       env->cp15.mdcr_el2 & MDCR_TDE;
     }
 
     if (route_to_el2) {
-- 
2.17.1

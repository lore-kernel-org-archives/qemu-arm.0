Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id a126-v6sm1162248wmh.4.2018.11.09.07.21.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Nov 2018 07:21:21 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 897153E059D;
	Fri,  9 Nov 2018 15:21:19 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v3 6/7] arm: use symbolic MDCR_TDE in arm_debug_target_el
Date: Fri,  9 Nov 2018 15:21:18 +0000
Message-Id: <20181109152119.9242-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181109152119.9242-1-alex.bennee@linaro.org>
References: <20181109152119.9242-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: KrR8nfDwCrXP

We already have this symbol defined so lets use it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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

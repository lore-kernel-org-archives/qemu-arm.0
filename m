Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id j8-20020a5d5648000000b002416e383e1csm2289017wrw.25.2022.11.11.10.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 10:25:39 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 88DD61FFC0;
	Fri, 11 Nov 2022 18:25:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:PXA2XX)
Subject: [PATCH  v5 09/20] hw/arm: remove current_cpu hack from pxa2xx access
Date: Fri, 11 Nov 2022 18:25:24 +0000
Message-Id: <20221111182535.64844-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111182535.64844-1-alex.bennee@linaro.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +cLy7t78Q1bD

We can derive the correct CPU from CPUARMState so lets not rely on
current_cpu.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/arm/pxa2xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 93dda83d7a..065392a8bc 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -319,7 +319,7 @@ static void pxa2xx_pwrmode_write(CPUARMState *env, const ARMCPRegInfo *ri,
 #endif
 
         /* Suspend */
-        cpu_interrupt(current_cpu, CPU_INTERRUPT_HALT);
+        cpu_interrupt(env_cpu(env), CPU_INTERRUPT_HALT);
 
         goto message;
 
-- 
2.34.1

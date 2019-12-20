Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id t1sm9763073wma.43.2019.12.20.05.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2019 05:22:47 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id ABC081FF8C;
	Fri, 20 Dec 2019 13:22:46 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: keithp@keithp.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v2 1/5] target/arm: remove unused EXCP_SEMIHOST leg
Date: Fri, 20 Dec 2019 13:22:42 +0000
Message-Id: <20191220132246.6759-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191220132246.6759-1-alex.bennee@linaro.org>
References: <20191220132246.6759-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bbfweCtd0i3F

All semihosting exceptions are dealt with earlier in the common code
so we should never get here.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Keith Packard <keithp@keithp.com>
Tested-by: Keith Packard <keithp@keithp.com>
---
 target/arm/helper.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5074b5f69ca..b4dc2274c8b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8554,12 +8554,6 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     case EXCP_VFIQ:
         addr += 0x100;
         break;
-    case EXCP_SEMIHOST:
-        qemu_log_mask(CPU_LOG_INT,
-                      "...handling as semihosting call 0x%" PRIx64 "\n",
-                      env->xregs[0]);
-        env->xregs[0] = do_arm_semihosting(env);
-        return;
     default:
         cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index);
     }
-- 
2.20.1

Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q8sm251177wmg.6.2020.03.17.10.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 10:58:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2112D1FFA5;
	Tue, 17 Mar 2020 17:50:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 17/28] target/arm: default SVE length to 64 bytes for linux-user
Date: Tue, 17 Mar 2020 17:50:42 +0000
Message-Id: <20200317175053.5278-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200317175053.5278-1-alex.bennee@linaro.org>
References: <20200317175053.5278-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qgZ6AYK6+v6E

The Linux kernel chooses the default of 64 bytes for SVE registers on
the basis that it is the largest size on known hardware that won't
grow the signal frame. We still honour the sve-max-vq property and
userspace can expand the number of lanes by calling PR_SVE_SET_VL.

This should not make any difference to SVE enabled software as the SVE
is of course vector length agnostic.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Message-Id: <20200316172155.971-18-alex.bennee@linaro.org>

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 3623ecefbd9..0909ce86a12 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -195,9 +195,10 @@ static void arm_cpu_reset(CPUState *s)
         env->cp15.cpacr_el1 = deposit64(env->cp15.cpacr_el1, 20, 2, 3);
         /* and to the SVE instructions */
         env->cp15.cpacr_el1 = deposit64(env->cp15.cpacr_el1, 16, 2, 3);
-        /* with maximum vector length */
-        env->vfp.zcr_el[1] = cpu_isar_feature(aa64_sve, cpu) ?
-                             cpu->sve_max_vq - 1 : 0;
+        /* with reasonable vector length */
+        if (cpu_isar_feature(aa64_sve, cpu)) {
+            env->vfp.zcr_el[1] = MIN(cpu->sve_max_vq - 1, 3);
+        }
         /*
          * Enable TBI0 and TBI1.  While the real kernel only enables TBI0,
          * turning on both here will produce smaller code and otherwise
-- 
2.20.1

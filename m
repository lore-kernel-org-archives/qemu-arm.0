Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id da16-20020a056000197000b0031274a184d5sm25819195wrb.109.2023.07.03.06.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 06:53:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D11691FFBE;
	Mon,  3 Jul 2023 14:44:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 18/38] target/arm: make arm_casq_ptw CONFIG_TCG only
Date: Mon,  3 Jul 2023 14:44:07 +0100
Message-Id: <20230703134427.1389440-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703134427.1389440-1-alex.bennee@linaro.org>
References: <20230703134427.1389440-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hshuowpMbXUU

The ptw code is accessed by non-TCG code (specifically arm_pamax and
arm_cpu_get_phys_page_attrs_debug) but most of it is really only for
TCG emulation. Seeing as we already assert for a non TARGET_AARCH64
build lets extend the test rather than further messing with the ifdef
ladder.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230630180423.558337-19-alex.bennee@linaro.org>

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6015121b99..42355caa9b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -628,7 +628,7 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
                              uint64_t new_val, S1Translate *ptw,
                              ARMMMUFaultInfo *fi)
 {
-#ifdef TARGET_AARCH64
+#if defined(TARGET_AARCH64) && defined(CONFIG_TCG)
     uint64_t cur_val;
     void *host = ptw->out_host;
 
@@ -709,7 +709,7 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
 
     return cur_val;
 #else
-    /* AArch32 does not have FEAT_HADFS. */
+    /* AArch32 does not have FEAT_HADFS; non-TCG guests only use debug-mode. */
     g_assert_not_reached();
 #endif
 }
-- 
2.39.2

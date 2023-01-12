Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4684048ejc;
        Thu, 12 Jan 2023 02:38:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsP+WuSUpd5+0OX6JaOaElIVGVfCH4AVSU2De+53QJ5p25DHWJ33LEQf1KQ7ayrvZyfg5vt
X-Received: by 2002:ac8:4cc1:0:b0:39c:da20:d489 with SMTP id l1-20020ac84cc1000000b0039cda20d489mr97749924qtv.30.1673519910825;
        Thu, 12 Jan 2023 02:38:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673519910; cv=none;
        d=google.com; s=arc-20160816;
        b=0kbwhRqgkdj1CXxT+wvHH17EuTjwkalNSmDarWDbonbhkeoJBj/wcUFhaQU7y7p0B9
         K6pYRQaRs8rPh14i5eiZAhr/mAcgOwI8B9/kTPTxg4JnASmbtk0TbkvT/jFX7xq4G2C/
         6ZxEGlfq+iaDKmImYVCvHHrhp3mmFfGzoWn1rQ4JCAk9mrnJP+Obtgx441WFs/mAMXm6
         z4MTTzJRAxKMICVr+85ACnjn/HuWJPrlsATM+9ro3x6yWTvsNpBZbfQdFiDaV/RO+VaP
         1cPa+B2a8CWCnGR2TsHfGlWAPjRSLF0CoXVob0q98o1BvAyzW/Vn12JX1+kYWIW5QZdg
         ML7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zgYSpkPWt3XJSKPRvFourSSz9p544s04F5BpIyvX9KA=;
        b=W6dXwu+9ZMh5xRsNT/N2CY/k6l+Nhmv0nx19aqkLvTmdQot1uZ4RjRf54uJR3vG0CT
         dlLNlXTlKic96CAD4tYysWCHYE5hqpubYyHFelR9lb5NXA/iq4keiSQorRJ0sCVAknuL
         73VzJXHFYX/vkxzcO/E5TrooDq7+wsx6qMDmRMbWQ4a5XFK3LGqG2CFGUzzo11MMSD6Y
         Bdc3QIyM8fBUYejo5QMo7GkI7Y1PU6DfVJzB1Khgm3fFScTw0X76VM9mvk4U04N7Y9hS
         hLkMBD3x7Nv6InwI1weuh3otVhTP9YMC9VhLS7a1ectooltJKEOTuMKpw059EHlyH67n
         bELA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vPynf7Ws;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3-20020ac84883000000b003a525d6dd77si9378015qtq.440.2023.01.12.02.38.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jan 2023 02:38:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vPynf7Ws;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFulW-0002lb-HM; Thu, 12 Jan 2023 05:24:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFulU-0002lB-Bx
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 05:24:56 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFulS-0000Gh-LR
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 05:24:56 -0500
Received: by mail-wr1-x434.google.com with SMTP id bk16so17567918wrb.11
 for <qemu-arm@nongnu.org>; Thu, 12 Jan 2023 02:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zgYSpkPWt3XJSKPRvFourSSz9p544s04F5BpIyvX9KA=;
 b=vPynf7WsrZGoepkqM84RvsX3vqjyfFUib2jQL+Y9NknK83R14sh7RA3hAbntDyXcFQ
 ZPn5ICY277BdgPxcTcma07klwB84ngeOzVjTlurWROOz9sTdiBHEvKnAMFLIZzD7UkBV
 eGsFdLuVxCGgy7FnzTwf2RcumSu/vE/BSIVoQAhBGuZzDCpzzeA750gPrUZpV+usBooo
 4Zc3WyT7S789BcVlBkagATSxrc/Uh4Sz5uMuYJmwSke6ArtME+/WfpU6588kJOB6SQ5R
 D/itwWP3/yedJOiA6NGkSkrrM9jlZd0+O+pHUNRbR9KpgBIBgP08c1NDlKB81c2FwbtH
 rubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zgYSpkPWt3XJSKPRvFourSSz9p544s04F5BpIyvX9KA=;
 b=4uVatUUCRYE3LW07feDBXvVoJiNLG8viui/P0HJeFv/zQ/UxUDrzeATwFi5LAhlcgE
 n5NB12oW1QDf2q3BkcS0Bv53NPqHSFhDUYdLeVDy0Rr+P1kW1AqA0eSQ8UariMYwLpaf
 9ru6Yeh/eArPBmKBX6UjfC28nTDkAVMrPidl4DQwPKSu9zOUfczMIv227pPHgAjbS7GR
 Ou8wcnLTVOekhAiSwLsXs1QCa5PZiH3nDgNaDG3k5JW78S4tCmMV9b9HJhDPSCa8URA4
 v7CpAbr5MXX/bIhaRW6DZZLg6txXspgf8t7uUXjIo9TPLXJF9VZeVHiFfBEtvwMa7QkY
 jbpw==
X-Gm-Message-State: AFqh2krGtHiS197pgqDOxGAa9LGlxiW25OGORmRt5u9DwUWLoV79u4VL
 mjuLcJBTo1LkLCrHSRjaEL4CBg==
X-Received: by 2002:a5d:4692:0:b0:2bb:e94c:fcbf with SMTP id
 u18-20020a5d4692000000b002bbe94cfcbfmr10155989wrq.52.1673519093982; 
 Thu, 12 Jan 2023 02:24:53 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a5d62cf000000b002bbedd60a9asm10371382wrv.77.2023.01.12.02.24.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Jan 2023 02:24:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 3/7] target/arm/sme: Introduce aarch64_set_svcr()
Date: Thu, 12 Jan 2023 11:24:32 +0100
Message-Id: <20230112102436.1913-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230112102436.1913-1-philmd@linaro.org>
References: <20230112102436.1913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IqZpHVc3lg0F

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230112004322.161330-1-richard.henderson@linaro.org>
[PMD: Split patch in multiple tiny steps]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 2 +-
 linux-user/aarch64/signal.c   | 2 +-
 target/arm/cpu.h              | 1 +
 target/arm/helper.c           | 8 ++++++++
 target/arm/sme_helper.c       | 4 ++--
 5 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 9875d609a9..d53742e10b 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -93,8 +93,8 @@ void cpu_loop(CPUARMState *env)
              * On syscall, PSTATE.ZA is preserved, along with the ZA matrix.
              * PSTATE.SM is cleared, per SMSTOP, which does ResetSVEState.
              */
+            aarch64_set_svcr(env, 0, R_SVCR_SM_MASK);
             if (FIELD_EX64(env->svcr, SVCR, SM)) {
-                env->svcr = FIELD_DP64(env->svcr, SVCR, SM, 0);
                 arm_rebuild_hflags(env);
                 arm_reset_sve_state(env);
             }
diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 6a2c6e06d2..b6e4dcb494 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -669,11 +669,11 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
      * Invoke the signal handler with both SM and ZA disabled.
      * When clearing SM, ResetSVEState, per SMSTOP.
      */
+    aarch64_set_svcr(env, 0, R_SVCR_SM_MASK | R_SVCR_ZA_MASK);
     if (FIELD_EX64(env->svcr, SVCR, SM)) {
         arm_reset_sve_state(env);
     }
     if (env->svcr) {
-        env->svcr = 0;
         arm_rebuild_hflags(env);
     }
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bf2bce046d..0484da3322 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1123,6 +1123,7 @@ int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
 void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
+void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask);
 void arm_reset_sve_state(CPUARMState *env);
 
 /*
diff --git a/target/arm/helper.c b/target/arm/helper.c
index cee3804354..b5626627a1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6722,11 +6722,19 @@ static CPAccessResult access_esm(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask)
+{
+    uint64_t change = (env->svcr ^ new) & mask;
+
+    env->svcr ^= change;
+}
+
 static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
     helper_set_pstate_sm(env, FIELD_EX64(value, SVCR, SM));
     helper_set_pstate_za(env, FIELD_EX64(value, SVCR, ZA));
+    aarch64_set_svcr(env, value, -1);
     arm_rebuild_hflags(env);
 }
 
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index b5aefa3eda..94dc084135 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -43,7 +43,7 @@ void helper_set_pstate_sm(CPUARMState *env, uint32_t i)
     if (i == FIELD_EX64(env->svcr, SVCR, SM)) {
         return;
     }
-    env->svcr ^= R_SVCR_SM_MASK;
+    aarch64_set_svcr(env, 0, R_SVCR_SM_MASK);
     arm_reset_sve_state(env);
     arm_rebuild_hflags(env);
 }
@@ -53,7 +53,7 @@ void helper_set_pstate_za(CPUARMState *env, uint32_t i)
     if (i == FIELD_EX64(env->svcr, SVCR, ZA)) {
         return;
     }
-    env->svcr ^= R_SVCR_ZA_MASK;
+    aarch64_set_svcr(env, 0, R_SVCR_ZA_MASK);
 
     /*
      * ResetSMEState.
-- 
2.38.1


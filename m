Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1693496lfp;
        Sun, 19 Sep 2021 19:46:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzA9Jpgrjmhixi1yO62E7u+XGhs7N7du/rwGjjNH5baTMb9cX4t3EMQ+1S2pMZClVYXfJ9Y
X-Received: by 2002:a05:6214:1474:: with SMTP id c20mr22871499qvy.14.1632105999651;
        Sun, 19 Sep 2021 19:46:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632105999; cv=none;
        d=google.com; s=arc-20160816;
        b=HDxgKB7Il1zncHhhpA0t9CVrEquJ/5ZHMrUK56XcM1fe44/zAiH95LDAi2voPRnSZ7
         4HDb5lXMP4zSys9n7ERuX1TcgBvHVbGPHOtzMtlapD6jz/i889xedIzqqAHCudZ9cX0x
         aQc9mXVOy80xs//7jaXC9cO4b8gMfRWFJc0ysy9aFkmQI/P0ddXknyLAt0zidL8P8GHH
         0EwyORv77R3Dhf7iObzssk48sEYveq8Lu158zgDHOGgj6yxv3lOF3c4TmQSFL6o6Fuot
         EmIRcGlstmr/GxWSQ4hn5UcrLMeeDNprfDcZBMiq4oQrlqlb0FNPvwgcDnw37CaWoEK1
         rZQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6vZb5MWAv/fM2L9STadGzJOqVrgkaOYinJFwq93jV/c=;
        b=xeSdFVjNhDzavsqYPz4twVdJdeK4bccZHGvqf8uOy3DWgEoeMKCZss0UH2khuGgx6U
         lspWcEklbRiZ00m8l1x3pwcv2beVBwdcPlnyIZbQhzuOIyUFho7GfS0TwQLyPrw5f3RU
         0vLNU5Ast+qNR6xfZ9A9dPqZARzsi9QPd0A+3PxLCt14X6ddiSShp7/Pu1qQutO3gafX
         5V4n8brDMCeA6ItP2gEoa0oOFHFfyQtEl+1Wo341xp59TIIX4Fx1yE0pW170png7SgSg
         KSVdC00pUq8RHMF9+A1L1d6/hO1k6PpUdn12+TXQf0Qi6S2LssAYybFI5SebagsjKrd6
         FWog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lKIx7rDq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s20si8517703qki.373.2021.09.19.19.46.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Sep 2021 19:46:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lKIx7rDq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mS9KJ-0005zf-1B
	for alex.bennee@linaro.org; Sun, 19 Sep 2021 22:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS9Is-0005Cn-LI
 for qemu-arm@nongnu.org; Sun, 19 Sep 2021 22:45:10 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:34577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS9Ir-0008Cn-5I
 for qemu-arm@nongnu.org; Sun, 19 Sep 2021 22:45:10 -0400
Received: by mail-pf1-x42d.google.com with SMTP id g14so14936733pfm.1
 for <qemu-arm@nongnu.org>; Sun, 19 Sep 2021 19:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6vZb5MWAv/fM2L9STadGzJOqVrgkaOYinJFwq93jV/c=;
 b=lKIx7rDq/+M2DK6H7v1tQhDLkae1ND9EkyyKSubRMo6LZt6CGZxLX7aeMKwb5tzFHd
 VQhI9SRUHKGzPvVbM9kvkEbA9IJlXGEP51SCWX0c4HeVvAi1Ymy1RVGNRaPBuEbp1Wnf
 1KzsmTB86ibaUJkimv3hekUTe/6qiS9lvd9H7RClVV/J51c9wF6Ce6bzkDyHXZyjLLgb
 2dGbqNhtEscguz4BjS66wGGL/IBP4bdDuaBNtCf/3K//69yWMtNCc3wm/AIEh2BUErW/
 TVxFzG2vfI4QtVn5ag4Si6F8cQ+RIB8Ko1/iimKmlpHmZOpvJ09eixnb6pAMnhrBDtpo
 U4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6vZb5MWAv/fM2L9STadGzJOqVrgkaOYinJFwq93jV/c=;
 b=pxMoEiTyWjeP04RhqCUyk8CY3M46B7owu5xzkWQDYzQ8e7quK7jmNZtImA/63gDyah
 CI9JOqKIsY59Boe2qS6DYnRYmQRN3vC1u2RtQhzE3riCglMMea9C5bwwU1GSlH6pAcpu
 +IOrERf02JXG45rS2ROADbPqyGucn8GX9T8kW4StM50oyZrvDBRg8chZp592sr2kidv3
 +EeZeQS7l5zWhryP7PrAjGR57UrAmbY2QixhCGf1dV2jG9vu59LLbdZqs8G3eS4SShQv
 5IQQ3grIHLmJNnHYNhNLGKojQwILxXNpnXs6N8h8KJ80S2EO2eAidYfp3S/0rHPK/rYe
 LFzw==
X-Gm-Message-State: AOAM531MwrnzBiW8rY6t6mint1utmPDw932NOmdRhtAfJZvkncdwlOfr
 EcDv1YmSkwdtp7AetGLaJzIlqpdePMIiaw==
X-Received: by 2002:a63:f5b:: with SMTP id 27mr12402253pgp.302.1632105907798; 
 Sun, 19 Sep 2021 19:45:07 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id fh3sm16164767pjb.8.2021.09.19.19.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 19:45:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/6] linux-user/arm: Report SIGBUS and SIGSEGV correctly
Date: Sun, 19 Sep 2021 19:45:00 -0700
Message-Id: <20210920024504.625965-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920024504.625965-1-richard.henderson@linaro.org>
References: <20210920024504.625965-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UTCGzOAdo7D9

Pull the fault information from where we placed it, in
arm_cpu_tlb_fill and arm_cpu_do_unaligned_access.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/cpu_loop.c | 39 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index d4b4f0c71f..1377a80620 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -24,6 +24,7 @@
 #include "cpu_loop-common.h"
 #include "signal-common.h"
 #include "semihosting/common-semi.h"
+#include "target/arm/syndrome.h"
 
 #define get_user_code_u32(x, gaddr, env)                \
     ({ abi_long __r = get_user_u32((x), (gaddr));       \
@@ -279,8 +280,8 @@ static bool emulate_arm_fpa11(CPUARMState *env, uint32_t opcode)
 void cpu_loop(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr;
-    unsigned int n, insn;
+    int trapnr, si_signo, si_code;
+    unsigned int n, insn, ec, fsc;
     abi_ulong ret;
 
     for(;;) {
@@ -422,9 +423,37 @@ void cpu_loop(CPUARMState *env)
             break;
         case EXCP_PREFETCH_ABORT:
         case EXCP_DATA_ABORT:
-            /* XXX: check env->error_code */
-            force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR,
-                            env->exception.vaddress);
+            /*
+             * For user-only we don't set TTBCR_EAE, so we always get
+             * short-form FSC, which then tells us to look at the FSR.
+             */
+            ec = syn_get_ec(env->exception.syndrome);
+            assert(ec == EC_DATAABORT || ec == EC_INSNABORT);
+            fsc = extract32(env->exception.syndrome, 0, 6);
+            assert(fsc == 0x3f);
+            switch (env->exception.fsr & 0x1f) {
+            case 0x1: /* Alignment */
+                si_signo = TARGET_SIGBUS;
+                si_code = TARGET_BUS_ADRALN;
+                break;
+            case 0x3: /* Access flag fault, level 1 */
+            case 0x6: /* Access flag fault, level 2 */
+            case 0x9: /* Domain fault, level 1 */
+            case 0xb: /* Domain fault, level 2 */
+            case 0xd: /* Permission fault, level 1 */
+            case 0xf: /* Permission fault, level 2 */
+                si_signo = TARGET_SIGSEGV;
+                si_code = TARGET_SEGV_ACCERR;
+                break;
+            case 0x5: /* Translation fault, level 1 */
+            case 0x7: /* Translation fault, level 2 */
+                si_signo = TARGET_SIGSEGV;
+                si_code = TARGET_SEGV_MAPERR;
+                break;
+            default:
+                g_assert_not_reached();
+            }
+            force_sig_fault(si_signo, si_code, env->exception.vaddress);
             break;
         case EXCP_DEBUG:
         case EXCP_BKPT:
-- 
2.25.1


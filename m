Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp757194lfb;
        Thu, 19 Nov 2020 14:07:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyq6x81dVFANUXbX/Lh0xd02QwZqvTg0EYYqHiHHBGMwlwAP26hcluS1qmxAIpctmQqi2Bm
X-Received: by 2002:a25:af8e:: with SMTP id g14mr10948998ybh.479.1605823644761;
        Thu, 19 Nov 2020 14:07:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605823644; cv=none;
        d=google.com; s=arc-20160816;
        b=I4mzELpT2EqB+1Wc98mSWPWCvWS6sWR6ZNN6HyDo28e/Tosit+fSn2VZv+Y+qA8k++
         RMZMSm89sZQZUckROIJLcqOAcsG5aA8sR22CKIQBxopd/kKuO9tgNE1bZHYNufrpmsTM
         ctCahDPutcRVjcDT9mw9RGYw1RT/OjK+xG4aFPGfGADCg4rf8j+EoOyohCGqbfYS8Cgg
         NWQkLHpDpywbde+/RxuwYj17+8KyCjHc1ri/qb41thU4D1r1oWrkx3HqMto6vaFqvSiy
         uuHDd60VP0ihCrzKdKRH1HiBQRhyqY0ENmUZ5G34tMXQZOPgocCQLZX2Qx+d27BCHxYE
         3u9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6unaasnFxd79TDn7gyVT0FcWmgVKe5+lejxSz6Mjv8k=;
        b=BzZdhOPtdJgXb1sCWY1hcOi0KEUxZwn1etyaXPma+AZjhIkgkFTshGwJ2Ywy+H480m
         C2XKxd1FL6Id+fegFyOMg0wdMq8uitFnuGY0+y7EjoAqjcIK8clcFnKn+YivGA7vO85M
         KFfDAPIygmJgdQHS4+2v8vqoTnIBbNitQUNO86TPoSNPonPdrmUCpMgOkHeDJQVqAiZ6
         keh2R7ZUyyG0hHN+Bim+Omc15UasYMnHeQ0XZbJ86iesGoDMlrhGSXAFqeIKjISav02z
         r/3amn+P2ThaXFKy2O5cOYD4ZNE26yv5ZkkrwjmhXLPisiymHoC8wV2R3iBbHHbGGXEg
         e26g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VImRXyVr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k133si744078ybf.458.2020.11.19.14.07.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Nov 2020 14:07:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VImRXyVr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfs5M-0004jq-1n
	for alex.bennee@linaro.org; Thu, 19 Nov 2020 17:07:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrv7-0000oD-3l
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:52 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:52964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrut-0004Be-RR
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:46 -0500
Received: by mail-wm1-x342.google.com with SMTP id 10so8569447wml.2
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6unaasnFxd79TDn7gyVT0FcWmgVKe5+lejxSz6Mjv8k=;
 b=VImRXyVr8v2AhsA+OQFglH3J+4fxaUB05LqJkM8Bnv1wWfeg9Nt9PtBoJKaiDefaZ1
 ldVOX161fbX8pKM2DcE3JXJ0Fo03hwX4SWcE0MY2Jymykhh1iWzdGtBRJ9nxl1T3+SJZ
 BBznWDEJWNd/Jb57DXtkk/AE4/IOPDsU9LpoWWNf8bO3DQIEYuLPW2KZcwAY38Ghohe3
 uCZUJyS9zImN3txhqwg19UzfZJ7AZmZJoZRV6HxIJtJJkZzatTs4Ak6g/OKUORXbejoJ
 WnXvUWU6fZpcvvzN0TCcXMr7fObTwQIONqp6jsLuSHiJlVNFX524nmLUpzX6A5cCLDmw
 xmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6unaasnFxd79TDn7gyVT0FcWmgVKe5+lejxSz6Mjv8k=;
 b=cxy55Zy1PG7YwQjlExAWVkdQ3qxpNNlUfLT+0bECKtKtnP/fkylGFc/ri6H9E9fGZ9
 do0695g8IyvcxYKEQZfI/5ZIbgTTcSPDkrz+ol7MmSgTKoceubWLhO3kTjk0rad3XNAS
 32S1AvUekKbDDEBBQZSt3U6cXzDS//B0xugCX8ma1+nEsvzwLADUka6dwd+QpLAt8JTm
 GSaabU+Ahlm98MXPFAeV31QAon1gSjTqmfUvI8TXvLxWDySZDI04qY7SXi2YSWc869eJ
 plVvRw8lwsfB14jDWo2wzddI4PF0woZj5TxLe6RcwQTLGTyfo6pA3t2J+SKDvCsOpAAj
 rZQg==
X-Gm-Message-State: AOAM531+CKuSXlQkSoUU843aT8FnPQe3wZPNye9MK6CTVgoIT6MGMkYj
 dMeyJSNW0raglYMoiAc4tAaL3w==
X-Received: by 2002:a1c:230e:: with SMTP id j14mr6380189wmj.187.1605822994200; 
 Thu, 19 Nov 2020 13:56:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 12/28] target/arm: Factor out preserve-fp-state from
 full_vfp_access_check()
Date: Thu, 19 Nov 2020 21:56:01 +0000
Message-Id: <20201119215617.29887-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S2legbtkG/Ag

Factor out the code which handles M-profile lazy FP state preservation
from full_vfp_access_check(); accesses to the FPCXT_NS register are
a special case which need to do just this part (corresponding in the
pseudocode to the PreserveFPState() function), and not the full
set of actions matching the pseudocode ExecuteFPCheck() which
normal FP instructions need to do.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.c.inc | 45 ++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 6bc327e9819..9c90c0647bd 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -83,6 +83,32 @@ static inline long vfp_f16_offset(unsigned reg, bool top)
     return offs;
 }
 
+/*
+ * Generate code for M-profile lazy FP state preservation if needed;
+ * this corresponds to the pseudocode PreserveFPState() function.
+ */
+static void gen_preserve_fp_state(DisasContext *s)
+{
+    if (s->v7m_lspact) {
+        /*
+         * Lazy state saving affects external memory and also the NVIC,
+         * so we must mark it as an IO operation for icount (and cause
+         * this to be the last insn in the TB).
+         */
+        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+            s->base.is_jmp = DISAS_UPDATE_EXIT;
+            gen_io_start();
+        }
+        gen_helper_v7m_preserve_fp_state(cpu_env);
+        /*
+         * If the preserve_fp_state helper doesn't throw an exception
+         * then it will clear LSPACT; we don't need to repeat this for
+         * any further FP insns in this TB.
+         */
+        s->v7m_lspact = false;
+    }
+}
+
 /*
  * Check that VFP access is enabled. If it is, do the necessary
  * M-profile lazy-FP handling and then return true.
@@ -113,24 +139,7 @@ static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
         /* Handle M-profile lazy FP state mechanics */
 
         /* Trigger lazy-state preservation if necessary */
-        if (s->v7m_lspact) {
-            /*
-             * Lazy state saving affects external memory and also the NVIC,
-             * so we must mark it as an IO operation for icount (and cause
-             * this to be the last insn in the TB).
-             */
-            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                s->base.is_jmp = DISAS_UPDATE_EXIT;
-                gen_io_start();
-            }
-            gen_helper_v7m_preserve_fp_state(cpu_env);
-            /*
-             * If the preserve_fp_state helper doesn't throw an exception
-             * then it will clear LSPACT; we don't need to repeat this for
-             * any further FP insns in this TB.
-             */
-            s->v7m_lspact = false;
-        }
+        gen_preserve_fp_state(s);
 
         /* Update ownership of FP context: set FPCCR.S to match current state */
         if (s->v8m_fpccr_s_wrong) {
-- 
2.20.1


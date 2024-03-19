Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1384544ejb;
        Tue, 19 Mar 2024 08:47:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2AcJzQhCLgf2/e5yBc2z8fb3lvhq3RQSbcVlPu/mK1DBf3tAGMMVmPovyLyZxpvMc0iu+HCUmOUSWfqaiwdHp8YsNx/6H
X-Google-Smtp-Source: AGHT+IHe15Kc6AbK+prOrwAbaKFbzAzo+yUGmsbhpqR+PSebaFfCZsG1yroGrA5+tgIwHkHLI/00
X-Received: by 2002:ac8:5d05:0:b0:430:abd3:2684 with SMTP id f5-20020ac85d05000000b00430abd32684mr3332027qtx.48.1710863274989;
        Tue, 19 Mar 2024 08:47:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710863274; cv=none;
        d=google.com; s=arc-20160816;
        b=L4NlFasIu4zmVxhyhGsNHsfBo6KrEyoZiC3pqVOlhrmwCIGfN5GIq9fFRnwX9KG01f
         56N9vcDFQMCSX0E/hT1xoB9hw/7Pt7EL21uzM1D3iRS2CHK3u7gh+bGZN964wcTe/qGA
         fjVFbpffkYo4LSZexdjymUsgIxl6PM2zXFjCaaL+NrX5LmqE1axSFSCOvLb5rbHPml1k
         tK4/vz6HCcx87BkybYrHVe3vfNrvjFhdn2dtXnXRzG8BAB/0xwYJ8O2vq7ikDxWDY304
         Q8vTpFKHUsqWdxPKCYoVbBU4fWRGGMLd6MCxxF2i/cehQpvBkjtrq14ymczXxetthKor
         ObpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=t3jAlnMMCXdnlaBpDRUrvP0z17b0GYkDdt6gJNRf5/M=;
        fh=b0tAQU6lqaAdoGQyuePxldR5xoO8UinrzZD+Dl4SWLk=;
        b=SnR+wmLdjdEowv4yYoCWWw4GQAeFM44+WDj8zWCp2+TchUyklIRlSoGbGCu4Ha2/oM
         cTh2rCNDMR1gwAlQ8rnguTdldCV4h/rRY+an1TmFezknNtPoIRjav7MYO7RdccNHzevl
         XBdJN3QoKhpl6KRGIar7ivBBtzDVAw02VHaGNTuj0QYui+ckBHaWB9O9TwK8e4jDUvcp
         Zebu90Y8jpO7N6q8htUZWANkSGF9g6Os6QLe6ae8zsVNVO7neeQ5lnLGbIO9w1bQ1qqD
         3bwRLsAd2KTv4OECGkDHBNY50thzX8oTGCz2Dreef32qvJiBMWIQECEx8lPAcOCAdSAN
         bsKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gk8RxjF4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9-20020ac85d89000000b00430c438fee7si6323211qtx.211.2024.03.19.08.47.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 08:47:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gk8RxjF4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmbdm-0007L1-8v; Tue, 19 Mar 2024 11:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbdL-00060I-Bv
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:44:14 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbd6-00051q-CN
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:44:09 -0400
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2d220e39907so81666091fa.1
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 08:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863034; x=1711467834; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t3jAlnMMCXdnlaBpDRUrvP0z17b0GYkDdt6gJNRf5/M=;
 b=gk8RxjF4dRv5mDJtAzKIf5SxxB0vVxgxbZFAiEjdwnK9GSKZDDlbtjDo+3U8um0KYA
 BnvjK970PetZXAlrNTB8LSnfwoRtRgIgahB5BCLzn4oY1RDJIQJDQhRAFMzyqn5cCi/n
 QmtSf9E8Z/lwzNE000f9qsNpGUVFB7gp67mZ+pf2pO5coYhfZLx6yYTdLCM2mZHf+xMS
 AjGcsfeZXznL/7nd2J9G7CtKh15zV3CvE/6qC+Kil/k2USoOZybtOrmSbV714Y9LHZGW
 R0yUTDG4xIJA5/2gzq2L4UwHLHd68E6Ety1asbnI5y6zO3S+EdmCJNXWlIyxFW/8pAYe
 gjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863034; x=1711467834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t3jAlnMMCXdnlaBpDRUrvP0z17b0GYkDdt6gJNRf5/M=;
 b=ldBoZvJp8MdwwWX5Bw2VkmBiYXFNMhHpgf2Mu+hfxZ1IQTrtwKIsljVumuXO+C0gAI
 Jrlyklr2/ozKgvvmJwex+OSswuQ0OwlY3BQPss5BevMxspxkqlyWNgVMeIgiPB6FIoDp
 +8QtrarmPBPWcNmNnQxVNc9+lIdx9cgaQ9n9m9KeoS3FW3azHL20GsC5czcY4A20rjVQ
 aKXFVmVoxi7ezhKyu0BlCF/maFv4+8jc2vSwPH1viG4WBOIk/2f6oPLq6v+QsYspqvTz
 9ONOqmc05Rd3C3kP0LsOabejFJOVbLC39+j/pJbZJXrTpPDRXrOvCHobeDQ1C7A5fzdK
 ThjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC5IyIzLmraabA23pAm/8N18jvGJaW4zltBmuIciWb+83f9myBi966oNfwh9cQA56uXwRxGr5xiFMyPVVXut2a8rOS
X-Gm-Message-State: AOJu0Ywbd9RMIc1Wp0y2pvsHl/JjP4U1wfcFMmLPoi5XHwnUDJKZ31/V
 XWWWx6u2EoztCT/xfTgKAuYEgWk+Uth2P1x5ltkIdI+sgMY69LhMof+FL6+tvBI=
X-Received: by 2002:a2e:be8a:0:b0:2d4:522e:62f3 with SMTP id
 a10-20020a2ebe8a000000b002d4522e62f3mr11483591ljr.44.1710863034373; 
 Tue, 19 Mar 2024 08:43:54 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a5d4002000000b0033e93e00f68sm12609359wrp.61.2024.03.19.08.43.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:43:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.1 09/27] target/hppa: Convert to
 TCGCPUOps::get_cpu_state()
Date: Tue, 19 Mar 2024 16:42:38 +0100
Message-ID: <20240319154258.71206-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 4hZ9opa/bSYf

Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/hppa/cpu.h | 44 --------------------------------------------
 target/hppa/cpu.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 44 deletions(-)

diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index cdb2904936..9bc54124c1 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -314,50 +314,6 @@ hwaddr hppa_abs_to_phys_pa2_w1(vaddr addr);
 #define TB_FLAG_PRIV_SHIFT  8
 #define TB_FLAG_UNALIGN     0x400
 
-#define TARGET_HAS_CPU_GET_TB_CPU_STATE
-
-static inline void cpu_get_tb_cpu_state(CPUHPPAState *env, vaddr *pc,
-                                        uint64_t *cs_base, uint32_t *pflags)
-{
-    uint32_t flags = env->psw_n * PSW_N;
-
-    /* TB lookup assumes that PC contains the complete virtual address.
-       If we leave space+offset separate, we'll get ITLB misses to an
-       incomplete virtual address.  This also means that we must separate
-       out current cpu privilege from the low bits of IAOQ_F.  */
-#ifdef CONFIG_USER_ONLY
-    *pc = env->iaoq_f & -4;
-    *cs_base = env->iaoq_b & -4;
-    flags |= TB_FLAG_UNALIGN * !env_cpu(env)->prctl_unalign_sigbus;
-#else
-    /* ??? E, T, H, L, B bits need to be here, when implemented.  */
-    flags |= env->psw & (PSW_W | PSW_C | PSW_D | PSW_P);
-    flags |= (env->iaoq_f & 3) << TB_FLAG_PRIV_SHIFT;
-
-    *pc = hppa_form_gva_psw(env->psw, (env->psw & PSW_C ? env->iasq_f : 0),
-                            env->iaoq_f & -4);
-    *cs_base = env->iasq_f;
-
-    /* Insert a difference between IAOQ_B and IAOQ_F within the otherwise zero
-       low 32-bits of CS_BASE.  This will succeed for all direct branches,
-       which is the primary case we care about -- using goto_tb within a page.
-       Failure is indicated by a zero difference.  */
-    if (env->iasq_f == env->iasq_b) {
-        target_long diff = env->iaoq_b - env->iaoq_f;
-        if (diff == (int32_t)diff) {
-            *cs_base |= (uint32_t)diff;
-        }
-    }
-    if ((env->sr[4] == env->sr[5])
-        & (env->sr[4] == env->sr[6])
-        & (env->sr[4] == env->sr[7])) {
-        flags |= TB_FLAG_SR_SAME;
-    }
-#endif
-
-    *pflags = flags;
-}
-
 target_ulong cpu_hppa_get_psw(CPUHPPAState *env);
 void cpu_hppa_put_psw(CPUHPPAState *env, target_ulong);
 void cpu_hppa_loaded_fr0(CPUHPPAState *env);
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 3831cb6db2..f2dc1e79e9 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -89,6 +89,48 @@ static void hppa_restore_state_to_opc(CPUState *cs,
     cpu->env.psw_n = 0;
 }
 
+static void hppa_get_cpu_state(CPUHPPAState *env, vaddr *pc,
+                               uint64_t *cs_base, uint32_t *pflags)
+{
+    uint32_t flags = env->psw_n * PSW_N;
+
+    /* TB lookup assumes that PC contains the complete virtual address.
+       If we leave space+offset separate, we'll get ITLB misses to an
+       incomplete virtual address.  This also means that we must separate
+       out current cpu privilege from the low bits of IAOQ_F.  */
+#ifdef CONFIG_USER_ONLY
+    *pc = env->iaoq_f & -4;
+    *cs_base = env->iaoq_b & -4;
+    flags |= TB_FLAG_UNALIGN * !env_cpu(env)->prctl_unalign_sigbus;
+#else
+    /* ??? E, T, H, L, B bits need to be here, when implemented.  */
+    flags |= env->psw & (PSW_W | PSW_C | PSW_D | PSW_P);
+    flags |= (env->iaoq_f & 3) << TB_FLAG_PRIV_SHIFT;
+
+    *pc = hppa_form_gva_psw(env->psw, (env->psw & PSW_C ? env->iasq_f : 0),
+                            env->iaoq_f & -4);
+    *cs_base = env->iasq_f;
+
+    /* Insert a difference between IAOQ_B and IAOQ_F within the otherwise zero
+       low 32-bits of CS_BASE.  This will succeed for all direct branches,
+       which is the primary case we care about -- using goto_tb within a page.
+       Failure is indicated by a zero difference.  */
+    if (env->iasq_f == env->iasq_b) {
+        target_long diff = env->iaoq_b - env->iaoq_f;
+        if (diff == (int32_t)diff) {
+            *cs_base |= (uint32_t)diff;
+        }
+    }
+    if ((env->sr[4] == env->sr[5])
+        & (env->sr[4] == env->sr[6])
+        & (env->sr[4] == env->sr[7])) {
+        flags |= TB_FLAG_SR_SAME;
+    }
+#endif
+
+    *pflags = flags;
+}
+
 static bool hppa_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
@@ -186,6 +228,7 @@ static const TCGCPUOps hppa_tcg_ops = {
     .initialize = hppa_translate_init,
     .synchronize_from_tb = hppa_cpu_synchronize_from_tb,
     .restore_state_to_opc = hppa_restore_state_to_opc,
+    .get_cpu_state = hppa_get_cpu_state,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = hppa_cpu_tlb_fill,
-- 
2.41.0


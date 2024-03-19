Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1384537ejb;
        Tue, 19 Mar 2024 08:47:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVIRMJl6/9QZRTRemY/FgBDHhwJkZYLS+Xg70pYHIdqZ1wMOLnQncrI57i19GWJVG9EHGEtfmwOS/ZZ2Gv3HapYSdAVIUuN
X-Google-Smtp-Source: AGHT+IED1DoJDKKRDl6L1vsdpjKl2k0Tuwd/4Dr1pJgDJBW0dvdTkvqVbaaQZyOiNEYg3TAlWAod
X-Received: by 2002:ad4:5bef:0:b0:691:641a:7bbb with SMTP id k15-20020ad45bef000000b00691641a7bbbmr19483507qvc.28.1710863274457;
        Tue, 19 Mar 2024 08:47:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710863274; cv=none;
        d=google.com; s=arc-20160816;
        b=l/7MFk3fI8e1d78VXn+uQiV/NCdRyjvt2mZxloWi8XrBJjfpswhHeV157oFtI5vQpP
         P2pM+pFGBJq9iQ4nXmFrecEDsqWuMlFmjYVvfpgOdHFPP3MmIIwGFUbWrVAul/bq18HB
         Rsn5laRDBLruyZLHq+8zSlSGlNsf4dOKXp5JM5o8w+iQIkLuD09x5cJShyYYmi08qW81
         emalzBkkNGvY57FNZlyvjZbXu/V2dmkQhpfILRATkcpcm2oJxpeYAeDAbeHNoBObUFYN
         U/B+sJ/elexuWN3rbDmUsvOew8GveHFEMAFm1qpKgFr/DPVe9UMbBfTfHEXcaOkDmugd
         bAKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7zdeoZffxwGI3lRqW4pFFxiIsmjJu49dy/PfqA3+ths=;
        fh=Nd50U15WaFI96vo8sDmVrEASGt1rYf6wbZgEvR5Cwvk=;
        b=uE4NsTERNNW/pfOSOD9Jc2TEHq/XGoGM0cu/xB3xQMMHvILVBRAXvHygbopz9rLvZD
         +N6oDQbLVVaWPbHKvqdQlwNIKMLd9JLuOR5amla5z2CyRqzyfQVjvUWmlCvGNwsEFLzX
         q/1+3euenDwJJrSoPPWCBk6Sxfdvf6bpL3fAQjTtK/YgMKrPVtVxhAkDf2+JYjZtcwDm
         Wdkvkonjx2PjwvhE0KFAS/JyPkKCXwy8OJnO4GeuSoT0hiZnE7ang9jKmX6RO3Lir/bD
         cyxwsPPTAyt3y/UPC0VE3Z5jrN66x+eILdS87pU0nuLgxqTJI/mhg+Nar0m/Ak+/JMlC
         z7rQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vSFeQ9kB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jl10-20020ad45e8a000000b0068f7497703bsi10584108qvb.215.2024.03.19.08.47.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 08:47:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vSFeQ9kB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rmbf1-0002P5-Br; Tue, 19 Mar 2024 11:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbeX-0001ZV-77
 for qemu-devel@nongnu.org; Tue, 19 Mar 2024 11:45:27 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbeT-0005kW-2v
 for qemu-devel@nongnu.org; Tue, 19 Mar 2024 11:45:24 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41464711dc8so6984055e9.1
 for <qemu-devel@nongnu.org>; Tue, 19 Mar 2024 08:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863119; x=1711467919; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7zdeoZffxwGI3lRqW4pFFxiIsmjJu49dy/PfqA3+ths=;
 b=vSFeQ9kBr6PVLjq69j3dZpgXpl8vq0yfVi2Qo0Oj+uJojuLau5YGBshxuUiaUOVVZU
 M7k85BHGzbyUKjRcA4LBj9Es5N8LIig20aLhlS6Ijp04nzpliEec5Ox2kiJHqMiB7KPD
 mWzs2OhngfRGlC65NWlO7xthSSLDAlQzfu8hdCoTrE0plEhjtt+Rm6cd+owfYisFw34W
 gGwubuBdx4ZMc1X53qQ+2pkNI5lirHL6QEOD0G+A/1wgD2n3MdfF6C46An/2AEraxq5D
 KW1A9GQfUNBNOmBYQT28E4t1btq0xivfFzbdhcAw5pLS+Q3E/4RZzBhdE3wfUxuTujc6
 nelg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863119; x=1711467919;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7zdeoZffxwGI3lRqW4pFFxiIsmjJu49dy/PfqA3+ths=;
 b=hJebn8q6MyboncdEhXXeIEjf8P8jsiWeni6oR2y9vd9OpeTHc9VAcSnQRwZhnMPg4z
 Csf7bLVbvBwJi2O8ebjEZQnZmp7qO304plztJoNNX1QECcNZWo0LLGzShf25hkdC2zTh
 k9GAb0FbO54G9u0ISeQCaDGLEPm4eFEs+PI0o/d/lAaZjMjHONUP4dkadO2936UECNEz
 IDMdS14G6HHe9yqatZuSC5xDg1uAxd65LsRMTbUzVUHXDfWKkAyf2yhHgQtIhQnP8IaH
 Emy9SqLHAfXZEIh6r8bOV6ihEf6nLjdQoAQ5/lfFlKX6RitpayjLxDHhEpSaKSdVRPsQ
 rGuQ==
X-Gm-Message-State: AOJu0YwXwb10nmnB8LDI2Uq6flYSf5bMDVIDrH9ggPL0fjpsP8DFGiBb
 lQkNQJKKDNiQI3tJxq47wYVDK0DYobGUUsCwN1eFy8vBE2jUf+BK6RlceOVYnN/PT6hvD6FTPPl
 X
X-Received: by 2002:a05:600c:524b:b0:413:f3f0:c591 with SMTP id
 fc11-20020a05600c524b00b00413f3f0c591mr2794850wmb.41.1710863119137; 
 Tue, 19 Mar 2024 08:45:19 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 w16-20020adfcd10000000b0033e5c54d0d9sm12682641wrm.38.2024.03.19.08.45.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:45:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH-for-9.1 24/27] target/sparc: Convert to
 TCGCPUOps::get_cpu_state()
Date: Tue, 19 Mar 2024 16:42:53 +0100
Message-ID: <20240319154258.71206-25-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Fl1cmP3h2kFZ

Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/sparc/cpu.h       | 37 ++-----------------------------------
 target/sparc/cpu.c       |  1 +
 target/sparc/translate.c | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 35 deletions(-)

diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index ae55cd15a4..283c235222 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -614,6 +614,8 @@ void sparc_tcg_init(void);
 void sparc_restore_state_to_opc(CPUState *cs,
                                 const TranslationBlock *tb,
                                 const uint64_t *data);
+void sparc_get_cpu_state(CPUSPARCState *env, vaddr *pc,
+                         uint64_t *cs_base, uint32_t *pflags);
 
 /* fop_helper.c */
 target_ulong cpu_get_fsr(CPUSPARCState *);
@@ -747,41 +749,6 @@ trap_state* cpu_tsptr(CPUSPARCState* env);
 #define TB_FLAG_HYPER        (1 << 7)
 #define TB_FLAG_ASI_SHIFT    24
 
-#define TARGET_HAS_CPU_GET_TB_CPU_STATE
-
-static inline void cpu_get_tb_cpu_state(CPUSPARCState *env, vaddr *pc,
-                                        uint64_t *cs_base, uint32_t *pflags)
-{
-    uint32_t flags;
-    *pc = env->pc;
-    *cs_base = env->npc;
-    flags = cpu_mmu_index(env_cpu(env), false);
-#ifndef CONFIG_USER_ONLY
-    if (cpu_supervisor_mode(env)) {
-        flags |= TB_FLAG_SUPER;
-    }
-#endif
-#ifdef TARGET_SPARC64
-#ifndef CONFIG_USER_ONLY
-    if (cpu_hypervisor_mode(env)) {
-        flags |= TB_FLAG_HYPER;
-    }
-#endif
-    if (env->pstate & PS_AM) {
-        flags |= TB_FLAG_AM_ENABLED;
-    }
-    if ((env->pstate & PS_PEF) && (env->fprs & FPRS_FEF)) {
-        flags |= TB_FLAG_FPU_ENABLED;
-    }
-    flags |= env->asi << TB_FLAG_ASI_SHIFT;
-#else
-    if (env->psref) {
-        flags |= TB_FLAG_FPU_ENABLED;
-    }
-#endif
-    *pflags = flags;
-}
-
 static inline bool tb_fpu_enabled(int tb_flags)
 {
 #if defined(CONFIG_USER_ONLY)
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index dc9ead21fc..b74a3f00b7 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -899,6 +899,7 @@ static const TCGCPUOps sparc_tcg_ops = {
     .initialize = sparc_tcg_init,
     .synchronize_from_tb = sparc_cpu_synchronize_from_tb,
     .restore_state_to_opc = sparc_restore_state_to_opc,
+    .get_cpu_state = sparc_get_cpu_state,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = sparc_cpu_tlb_fill,
diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 319934d9bd..49958837b8 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -5122,3 +5122,36 @@ void sparc_restore_state_to_opc(CPUState *cs,
         env->npc = npc;
     }
 }
+
+void sparc_get_cpu_state(CPUSPARCState *env, vaddr *pc,
+                         uint64_t *cs_base, uint32_t *pflags)
+{
+    uint32_t flags;
+    *pc = env->pc;
+    *cs_base = env->npc;
+    flags = cpu_mmu_index(env_cpu(env), false);
+#ifndef CONFIG_USER_ONLY
+    if (cpu_supervisor_mode(env)) {
+        flags |= TB_FLAG_SUPER;
+    }
+#endif
+#ifdef TARGET_SPARC64
+#ifndef CONFIG_USER_ONLY
+    if (cpu_hypervisor_mode(env)) {
+        flags |= TB_FLAG_HYPER;
+    }
+#endif
+    if (env->pstate & PS_AM) {
+        flags |= TB_FLAG_AM_ENABLED;
+    }
+    if ((env->pstate & PS_PEF) && (env->fprs & FPRS_FEF)) {
+        flags |= TB_FLAG_FPU_ENABLED;
+    }
+    flags |= env->asi << TB_FLAG_ASI_SHIFT;
+#else
+    if (env->psref) {
+        flags |= TB_FLAG_FPU_ENABLED;
+    }
+#endif
+    *pflags = flags;
+}
-- 
2.41.0


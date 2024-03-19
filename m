Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1384596ejb;
        Tue, 19 Mar 2024 08:48:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUj4ev5rZ033XxiGwv4fcoCNKKEbqCaZ5V7MTQFz2Czm05vYVIQhVQgXoI0XG50i/K3BKrO9nDwTMrvTSBqFhQA+ruWC+Is
X-Google-Smtp-Source: AGHT+IE6QuQ993JBzRCo98Rm4svB4folQ1sNcDCLXunLq+FHC5plLfH+483EoYERCPPEWThgwRg/
X-Received: by 2002:ad4:53a6:0:b0:690:df46:2ebb with SMTP id j6-20020ad453a6000000b00690df462ebbmr17758852qvv.56.1710863280686;
        Tue, 19 Mar 2024 08:48:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710863280; cv=none;
        d=google.com; s=arc-20160816;
        b=CFMz15piExsYCdE0yeuvz7HPnagogYxO7p/gJI+b7uc9GDuKciPGRN6z1ZBT5AlChs
         k8EE2sJM58rbdTtzVBcFNXd3NrCv6r+cOcdGwlFc70QqYbcUGzfeu5Rja5tv259I6wl/
         WH49F+Lt9xfd5+UA0WKRGLKokqvedNdSIrGzpx6+ANhbSLfSrit6v5is5HiECA2u214Y
         U6SK/FNOjuiIJWN63yl9tSDD8u/0yycIPU0FRfYFwNXV25a9pwIPxRLuaiD/ydLMXXSH
         wmEA6CUmeHkQdJUzl8RMYaNCdyj47FnCAZuStUXbwd+3pPYByQZBCfnmC5aLVoP+R0iv
         FIvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=j7owAJrs+Pq1wtN5iEuRd7D9oJWUcLUFndnuD7FxVak=;
        fh=tbyzyP+aRjTS4Cl7SKNd0Qx1+cr3K719XGXX2B3mDIw=;
        b=VWA8XqlTx3kr0eBxVmntFXGUvGaLzx0hpq350gK686EJ2It8tQ0QFTXNo7eVn+gFzj
         9C014ADSXGvNECWjaVOJKu+W8xLsRHc+vVSiw4Fp8bIhLKqSBHwJ2//eekmKMT/suwwq
         /YHkOdqIbJHfm3UMv4RVXMqTYRB/V7ZFzL+iv+79wytLVlgduPsJKlWe8VYeUqraYku4
         89pm5IUNfZDNnafWoF3/xew9MXdHPaSPiax7FgPgSiAO7a1TSbu2Iv7Jv4L2vffUeJHd
         Wr2KCyV16WkRtp1tgg5nEEpdOu3wPpLm+IhbgG14edV8zud0UJaMx1cOQEeMP0vhvU2P
         vSaQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CxT1DYqd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id mf7-20020a0562145d8700b00690d9ed71d5si11055946qvb.503.2024.03.19.08.48.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 08:48:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CxT1DYqd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmbdk-00078e-Sw; Tue, 19 Mar 2024 11:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbdL-000609-AO
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:44:14 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbdD-000537-3j
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:44:07 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3416a975840so1628221f8f.0
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 08:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863040; x=1711467840; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j7owAJrs+Pq1wtN5iEuRd7D9oJWUcLUFndnuD7FxVak=;
 b=CxT1DYqduBuo7jh1s3Atk2ea4hwd8bl8FQSlasG5Y+TlwP4GAYi+1WLElSpNoyQcZW
 Xv8NGDFynY7Z3qn2M0Vmd8N3OXgOI61TknkB+nsZhU7tFGmtF2Kt6BQVfRs4OfIZS8/y
 8e9mDs0bOu7YpNSH0aoNBn1ZOU+aRr0izAql0IPzz3DuWu5x4B7ENr5MBJdcQcLpGkk8
 AkGswTh1gJYKdLnqaq/VzhZQlcAQPrI0Yunww/ukLO6CAwYZcgY/Mz0JUA2yIK7+2dfk
 NJZr64zCl15Fjwik4qJxGderB3uZoqi1jLQjE6+b3d/r/spEQhJ4ZWzRd0uWIyWhNVpE
 hLXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863040; x=1711467840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j7owAJrs+Pq1wtN5iEuRd7D9oJWUcLUFndnuD7FxVak=;
 b=gKqf9CiYzPAgRvjBBQB7S1fNxSBYhr4bF3qDVgwDwkhFAo19DpD6L2N9LuC0DgBovB
 WACqsAiTvnBKue8BB9gjEVF1wZlIulp9W1KdJcMVUXH31L5fn2rOQdra9poH+JNfYC6W
 fcrM9xGRcm2FzA2flhtjAnNYm95q3jXMobl1FqSiv+WZtP4sYTDZqrwSE9hb9rzTMupf
 xv7Te2QsFcJc8rZVesfqbsOPHN0HzgBxO7ZwAlvPue5uMhgvDSfWouFq5/TtncC0oEpo
 6Wk6g/sxZP/b82rdCEvi41UQ6hxY86oFE+ZNF2ae65RhIynTXGmwgQdSpUY1gnfFLR3b
 z6WQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo6Db41qVglOVVf/m0aIhyVrQyaoD0pqer/oIY0Dd2FhKKO2vYA6N6oJ+2GUyzmBP/6OFg16Es37BEEL6HI0JpZmjw
X-Gm-Message-State: AOJu0YyJxTb8y2GFu50AOGyRx1fwvoQmYucMOFhdgyM3UrXB4n0d27yi
 WiceOmJZ9UPxXHfe+HbqZ5an9k9xWVab1PlS1cRPAxq2Pe0lith92mmJRirYjzw=
X-Received: by 2002:a05:6000:bc6:b0:33e:c974:1294 with SMTP id
 dm6-20020a0560000bc600b0033ec9741294mr10840337wrb.17.1710863039961; 
 Tue, 19 Mar 2024 08:43:59 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 b16-20020adfee90000000b0033ec7182673sm12742529wro.52.2024.03.19.08.43.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:43:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH-for-9.1 10/27] target/i386: Convert to
 TCGCPUOps::get_cpu_state()
Date: Tue, 19 Mar 2024 16:42:39 +0100
Message-ID: <20240319154258.71206-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: qwvKvlyKRKzM

Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state().

Note, now x86_get_cpu_state() is restricted to TCG.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/cpu.h         | 16 ----------------
 target/i386/cpu.c         |  2 +-
 target/i386/tcg/tcg-cpu.c | 15 +++++++++++++++
 3 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 954495fff0..390abc969e 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2354,22 +2354,6 @@ static inline int cpu_mmu_index_kernel(CPUX86State *env)
 #include "hw/i386/apic.h"
 #endif
 
-#define TARGET_HAS_CPU_GET_TB_CPU_STATE
-
-static inline void cpu_get_tb_cpu_state(CPUX86State *env, vaddr *pc,
-                                        uint64_t *cs_base, uint32_t *flags)
-{
-    *flags = env->hflags |
-        (env->eflags & (IOPL_MASK | TF_MASK | RF_MASK | VM_MASK | AC_MASK));
-    if (env->hflags & HF_CS64_MASK) {
-        *cs_base = 0;
-        *pc = env->eip;
-    } else {
-        *cs_base = env->segs[R_CS].base;
-        *pc = (uint32_t)(*cs_base + env->eip);
-    }
-}
-
 void do_cpu_init(X86CPU *cpu);
 
 #define MCE_INJECT_BROADCAST    1
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 9a210d8d92..249b6fe0bb 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7679,7 +7679,7 @@ static vaddr x86_cpu_get_pc(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
 
-    /* Match cpu_get_tb_cpu_state. */
+    /* Match x86_get_cpu_state. */
     return cpu->env.eip + cpu->env.segs[R_CS].base;
 }
 
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index cca19cd40e..a89c11a34b 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -93,6 +93,20 @@ static void x86_restore_state_to_opc(CPUState *cs,
     }
 }
 
+static inline void x86_get_cpu_state(CPUX86State *env, vaddr *pc,
+                                     uint64_t *cs_base, uint32_t *flags)
+{
+    *flags = env->hflags |
+        (env->eflags & (IOPL_MASK | TF_MASK | RF_MASK | VM_MASK | AC_MASK));
+    if (env->hflags & HF_CS64_MASK) {
+        *cs_base = 0;
+        *pc = env->eip;
+    } else {
+        *cs_base = env->segs[R_CS].base;
+        *pc = (uint32_t)(*cs_base + env->eip);
+    }
+}
+
 #ifndef CONFIG_USER_ONLY
 static bool x86_debug_check_breakpoint(CPUState *cs)
 {
@@ -110,6 +124,7 @@ static const TCGCPUOps x86_tcg_ops = {
     .initialize = tcg_x86_init,
     .synchronize_from_tb = x86_cpu_synchronize_from_tb,
     .restore_state_to_opc = x86_restore_state_to_opc,
+    .get_cpu_state = x86_get_cpu_state,
     .cpu_exec_enter = x86_cpu_exec_enter,
     .cpu_exec_exit = x86_cpu_exec_exit,
 #ifdef CONFIG_USER_ONLY
-- 
2.41.0


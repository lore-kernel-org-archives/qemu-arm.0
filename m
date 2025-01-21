Received: by 2002:a05:7022:639b:b0:92:a90b:6588 with SMTP id q27csp154538dlq;
        Tue, 21 Jan 2025 06:27:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWPpFqEo8SXPPaLKubWqHOw1e0dg/drBRwgy1eqLxQjLq81GcWjrVa/DwD3pXiKUDmRCtjGAPmxwaRDSQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHNoUp1m9+N8B1peVMiDrKxCVFAUbQAhf8mDhz+ffzWggOVhuH2PwfQf5yk6v5bRiy/0S7t
X-Received: by 2002:a05:622a:58e:b0:467:67db:ef7a with SMTP id d75a77b69052e-46e12bbded7mr255367811cf.44.1737469676438;
        Tue, 21 Jan 2025 06:27:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737469676; cv=none;
        d=google.com; s=arc-20240605;
        b=aE+SB84Ly0flR9Pbg93Zcj+b7YeJs2/sET19+7SNUknaaiyLMmQqhe9gbjeW3QuTvs
         wHNm8bS30U5AuADHJRVpTOw9B0no7xtxTKp3k6gzKkOH0473OMfhSBvjtHSSDn2TTm/h
         zugzeL+h9zn8Ki6m3Z/OHOnWWzQqau5AK070kGJ/A7v7UJQUdXlrukzfWTbqjYTHYOq5
         0+JmqttRI+rZX2DLvPX9eeAJxaJDnASI+qpoAQZYAUUGFXBdFYNj+1GRZAbimKT3GQ59
         by6HZDSYGIoMl90p3azwDfCOG5WTTAkMACNAX9lRyFTBNojMgh4zw54v8X8xKEnVx7Bl
         M+uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1OW6/o4DCFgT3ilwuV2iLRLfLVBrhuRs1sUZEij4GK4=;
        fh=T9nLPmYdz8kSl8qI33evWuh/VVTqN+U2Q3T/ETy8raQ=;
        b=gflUunmZV+yw78IaTAaLNe142dBVrPTmEDUT3OavgpQxSw0WMK4inzBC7gRrTvMWKc
         /RSctM7XWpGtRX8jYMP05pZ0SF8nT3L5BIEuvbvQqldRqYFav9KmrQx0SCvU7ZAai7zA
         NvvGsAx//C7443v5TT2kNwM24xTj02NijGrM+t+cLfikN+4cX0nduEO70P6rmKiW8eU4
         xaykhjldZ96KbDRbWG7FplpEARiCdlRPBUjJAzRbNbWZuvP57q9BhGdpFyRLdcRu/tF/
         qd9BaSz844V0TeiS0zBPjJo1L8R6OMx/Fi/e5dTZW723lNCUhXlXHEHaq+0PADytjVx+
         6RYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AFVie4bx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e1040a960si121749291cf.208.2025.01.21.06.27.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 06:27:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AFVie4bx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taFBT-0001J1-UA; Tue, 21 Jan 2025 09:24:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFBR-0001CM-Tj
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:24:50 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFBP-0003Dj-RY
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:24:49 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38a8b35e168so3978356f8f.1
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2025 06:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469486; x=1738074286; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1OW6/o4DCFgT3ilwuV2iLRLfLVBrhuRs1sUZEij4GK4=;
 b=AFVie4bxAX3IOVeGygVIgIKoeLvoMBdGwL5hxqZJGRca3iKS99wMO3B+z5oGyEjeYt
 t0vn4XxTEwydUeuEuyUHEdFPAVyjiHZaNUyUSBBQvLZliiF66MJQpWbvWntGfCCvzE+Y
 XBbhr7xSX93lWpJNuvw3R4q5LXiBH4Tqd/bLVapkCc5I9rS5+4O6OXr07/nV+qeX0GlH
 qSMdkO9z4hsV7Yqs4hSKvPkUIZYsznoce+DwhA4XVu4dyO8TMH6hsp6cOn1qZfBBB8kP
 3Ob0iyBcn88LrAs8gVbebfAnwNMoujnKeGjk6JI83Xfn4tYHaEl408SdIUyr2Pafrghg
 ufaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469486; x=1738074286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1OW6/o4DCFgT3ilwuV2iLRLfLVBrhuRs1sUZEij4GK4=;
 b=IFXHIjIz+KoEOjmcr0B1PoyWlt+2a39nlJqJIZiuaooPOHBK6PqkS0S7OtRIhhcBtl
 oXorqAIsWwisMA+UESxF8XkHZT4UkBTcIOHskFEV95Rh4gz4pf8yKTpV5CRxkcRRi9KG
 TM+y446Kv3kk6477yowyesxUrJTmaiKM6zYo1tR1KTu5uqIElkOE82I5Yd4G4rlAVcKK
 XdUw7pusF2zKRMxKu7z8Vt9vKgSVT4TxyexEi8e+zygUJr0bmZXbeBu68mD2oLF+vOMn
 5VcQ91jDc8UzMDeiA3VZxCYUnwyLPOYE9bvOU/+DfzYWNWO2vHXnSQgWH22NpSvjk8jG
 OpWw==
X-Gm-Message-State: AOJu0YyWeKbPMoAoVQ+RbU2MJgrlbbFyPR9HeKZzsqt+HH+0qCajZS9B
 I7ZXfqB1lI+l9mSYVK/zsrn9/WPGYd9WKqzZF1tFR6Vtig0OG5pUK/5jNTpSngX6WpD8/ZzGzGd
 z9Nc=
X-Gm-Gg: ASbGncvlRedwKRXAsTaTPiOtLVZSuy7nULvVALG0cbZt+J4i5Q2EpexhQG+zyTNmUGG
 HMXHEAGdWekxONPuATl8WguhliFl/asFrfGDBSpL707jvPLv4+m9zBoYPNXakGGnZ+GXXijYxhB
 NLbmmfgzyCIiKEuk9Hqq4bdyqM3KyRxBTMvXBAskpzo5nksivE7JzK6GeS1T7GX45YB5YidvpX2
 YRptyo/yj/ZZGDhf7IJOD2WyjXvechXXmC1z3spbm8kwRbCLGGysUqMbzpeVBDYmnerDLihuCT7
 Voqm7Pk1X756GvhwYknNdNX39I0wWaV3MFg75AJ2hywN
X-Received: by 2002:a05:6000:18ab:b0:38a:49c1:8345 with SMTP id
 ffacd0b85a97d-38bec542923mr19873328f8f.18.1737469486020; 
 Tue, 21 Jan 2025 06:24:46 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4389041fec5sm184339285e9.19.2025.01.21.06.24.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:24:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 13/28] target/i386: Move has_work() from CPUClass to
 SysemuCPUOps
Date: Tue, 21 Jan 2025 15:23:26 +0100
Message-ID: <20250121142341.17001-14-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: mcc6KLeJQVqg

Move has_work() from CPUClass to SysemuCPUOps,
restrict x86_cpu_pending_interrupt() to system.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/cpu.h | 4 ++--
 target/i386/cpu.c | 8 +++-----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index b26e25ba15e..869b8598cd5 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2289,8 +2289,6 @@ struct X86CPUClass {
 extern const VMStateDescription vmstate_x86_cpu;
 #endif
 
-int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request);
-
 int x86_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
                              int cpuid, DumpState *s);
 int x86_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
@@ -2313,6 +2311,8 @@ void x86_cpu_list(void);
 int cpu_x86_support_mca_broadcast(CPUX86State *env);
 
 #ifndef CONFIG_USER_ONLY
+int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request);
+
 hwaddr x86_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                          MemTxAttrs *attrs);
 int cpu_get_pic_interrupt(CPUX86State *s);
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 1b9c11022c4..51faba4e0b4 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -8256,16 +8256,15 @@ static vaddr x86_cpu_get_pc(CPUState *cs)
     return cpu->env.eip + cpu->env.segs[R_CS].base;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request)
 {
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
 
-#if !defined(CONFIG_USER_ONLY)
     if (interrupt_request & CPU_INTERRUPT_POLL) {
         return CPU_INTERRUPT_POLL;
     }
-#endif
     if (interrupt_request & CPU_INTERRUPT_SIPI) {
         return CPU_INTERRUPT_SIPI;
     }
@@ -8286,14 +8285,12 @@ int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request)
                      (env->eflags & IF_MASK &&
                       !(env->hflags & HF_INHIBIT_IRQ_MASK))))) {
             return CPU_INTERRUPT_HARD;
-#if !defined(CONFIG_USER_ONLY)
         } else if (env->hflags2 & HF2_VGIF_MASK) {
             if((interrupt_request & CPU_INTERRUPT_VIRQ) &&
                    (env->eflags & IF_MASK) &&
                    !(env->hflags & HF_INHIBIT_IRQ_MASK)) {
                         return CPU_INTERRUPT_VIRQ;
             }
-#endif
         }
     }
 
@@ -8304,6 +8301,7 @@ static bool x86_cpu_has_work(CPUState *cs)
 {
     return x86_cpu_pending_interrupt(cs, cs->interrupt_request) != 0;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 int x86_mmu_index_pl(CPUX86State *env, unsigned pl)
 {
@@ -8544,6 +8542,7 @@ static const Property x86_cpu_properties[] = {
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps i386_sysemu_ops = {
+    .has_work = x86_cpu_has_work,
     .get_memory_mapping = x86_cpu_get_memory_mapping,
     .get_paging_enabled = x86_cpu_get_paging_enabled,
     .get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug,
@@ -8577,7 +8576,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = x86_cpu_class_by_name;
     cc->parse_features = x86_cpu_parse_featurestr;
-    cc->has_work = x86_cpu_has_work;
     cc->mmu_index = x86_cpu_mmu_index;
     cc->dump_state = x86_cpu_dump_state;
     cc->set_pc = x86_cpu_set_pc;
-- 
2.47.1


Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3083155ejb;
        Mon, 5 Jun 2023 15:26:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ641Z5f4ukzO5c8FpvwIJsVmLJYg0fQfB+O4qYtxvN+NsLX4QB6YO/H3APoiHVic4Fl1iKC
X-Received: by 2002:a05:6214:400a:b0:628:474b:aaef with SMTP id kd10-20020a056214400a00b00628474baaefmr175575qvb.25.1686003970085;
        Mon, 05 Jun 2023 15:26:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686003970; cv=none;
        d=google.com; s=arc-20160816;
        b=mkaBAhbczkLXnt3njXpcqBc+m1AHFtVJgUgZ2bBETi6na0kzySYY5b+iGne/EhVWhg
         MOTfsFhTREziT7Mv0Gcii544gon2vhj3+agSlJhOONzKgQjf8Z49qeUIqbYItXHpanwL
         yT9lc/ZXqUUrbEW19CMGlh/gFHxXZ6UdMzdPmpKG2I/+S9nLmWVvX6KklxUGyn1bj4ID
         CWqFwX0zto0zB8HoWnKbHBv9l5cjDZwP2kiVtmNCWKA53RXMPnUs6Enju9arlkLyePS2
         sTgjptdQVzWbnkZRFMfp8KcVHhh86Y53sLvEDi5n8JVG9USF3UXG2KFrH45pgG1Npgzm
         J3nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iug9o5kY2rRDf7L6GzL4VJkrhoufA94Kp6D71aiQx4U=;
        b=CEbB1b4x7IhJPXA2vlcAfPUmmh2LMuPXRw2pbrzOiU75cZjln+Polpf1bQcr9PJiA5
         WaRMzaQUyAFUvn+/y+euWVJkkiApOoYjBCN99e5etspVk2VpLn+NnP597jNhEMBPj0Vc
         am77S/q5q2s7V7m1o6G1VsPDJ01jkIVLVmbviRLEbZGSqz0KJaBFRV+GO2hy21LY290o
         JSWxBQnrSJsvE1F/YKoi+Hfi16muRrAg/kuXaCuRTLce5XRfY5FxKN8lWfIrjisSHrF6
         EBRoyY0ZwqZ9tKMR8NUgUgjB7Y0Tjhsdd3xO9CApgErnlWPSHZXqDHlg+3PUa0UGM0/Z
         oTXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QKXvWEnJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14-20020a05622a048e00b003f3875db680si5469339qtx.610.2023.06.05.15.26.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jun 2023 15:26:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QKXvWEnJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q6Id7-0008PK-Or; Mon, 05 Jun 2023 18:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6Id6-0008O2-0d
 for qemu-devel@nongnu.org; Mon, 05 Jun 2023 18:24:48 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6Id4-00065y-68
 for qemu-devel@nongnu.org; Mon, 05 Jun 2023 18:24:47 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-30ae95c4e75so5529785f8f.2
 for <qemu-devel@nongnu.org>; Mon, 05 Jun 2023 15:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686003884; x=1688595884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iug9o5kY2rRDf7L6GzL4VJkrhoufA94Kp6D71aiQx4U=;
 b=QKXvWEnJConX1M26MSrm0mYFpyEWj7C9CU+KVuXcLYXJ9XGFhS6ch1UnLNq98KrWTT
 ViUQzGw43thPhmjfjYOmSqCXrKjAnoa5yrhbYbvGoTfW18/5GQz1ZrHgQLqzB5V47hE6
 qTRabQVzy73gxBsSfr8CtPqXCdB1qDBDN9WLVuP4q/y+LpyVqQnbBfazPqvNiyk5Tzge
 rYa9e4VqIAaJSIiQJP47WbZG63fNdk1GHzdY4vF02i4U6ihPiUldZg4gOTknyjTkUwef
 FJNQYN+SQUx/X9WS8/w0Ei+3KKW1FXMoGsEk1N/iIJnvZaQcYkgDPYTSH4ilLpc7a/uw
 1yQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686003884; x=1688595884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iug9o5kY2rRDf7L6GzL4VJkrhoufA94Kp6D71aiQx4U=;
 b=hpRJDjc/c68ciD49aKcsmEAO0LuFaoxZRNgoxA6mdszRHNLOxktNjvVdB+33tqj+cD
 cL8Ig2ioNvefoAlPWMI9SpHjClUANWI31rTU991XrAYHP3GufWdBbTwaHkoX5W0sU8ZI
 dh+6y+hEO0cxYQXqldLzi7ntvr/Rg0sq+8tV9so5uMe9l6hFh3GeEmv4zn/fdnMxcDtk
 wxEnyViLf3NaF5EQfb86o6Wh01u9hRbi1Ylc1rtK2+hpj9C3m4VgQWvMOLz1lfWUqO1L
 ZsDuDGI7Sxy1RHJnW7Cxe1xf/kP0sXdm+INOnbrWr6K5GCOjFlQRtzumEVbNDhnDgKNG
 UM9Q==
X-Gm-Message-State: AC+VfDyHTWEP76hMcLgjxa0MBJty0oXqTNyOhKhj+JqSGZ6nRHaPkXre
 D+/ZbDbEwOkRcaQCF8l/DD1bAG1JuYkETSgz/eA=
X-Received: by 2002:a5d:4949:0:b0:30a:e5e3:ea66 with SMTP id
 r9-20020a5d4949000000b0030ae5e3ea66mr210048wrs.14.1686003884545; 
 Mon, 05 Jun 2023 15:24:44 -0700 (PDT)
Received: from localhost.localdomain ([176.187.217.157])
 by smtp.gmail.com with ESMTPSA id
 j5-20020a5d6185000000b0030af05fce4dsm10873473wru.77.2023.06.05.15.24.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 05 Jun 2023 15:24:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH v2 4/9] target/ppc: Check for USER_ONLY definition instead
 of SOFTMMU one
Date: Tue,  6 Jun 2023 00:24:15 +0200
Message-Id: <20230605222420.14776-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230605222420.14776-1-philmd@linaro.org>
References: <20230605222420.14776-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: 6nH+GNDUsc4B

Since we *might* have user emulation with softmmu,
replace the system emulation check by !user emulation one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/cpu_init.c    | 20 ++++++++++----------
 target/ppc/helper_regs.c |  6 ++----
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 05bf73296b..a1b0bb2905 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5840,7 +5840,7 @@ POWERPC_FAMILY(970)(ObjectClass *oc, void *data)
                     (1ull << MSR_PMM) |
                     (1ull << MSR_RI);
     pcc->mmu_model = POWERPC_MMU_64B;
-#if defined(CONFIG_SOFTMMU)
+#if !defined(CONFIG_USER_ONLY)
     pcc->hash64_opts = &ppc_hash64_opts_basic;
 #endif
     pcc->excp_model = POWERPC_EXCP_970;
@@ -5919,7 +5919,7 @@ POWERPC_FAMILY(POWER5P)(ObjectClass *oc, void *data)
     pcc->lpcr_mask = LPCR_RMLS | LPCR_ILE | LPCR_LPES0 | LPCR_LPES1 |
         LPCR_RMI | LPCR_HDICE;
     pcc->mmu_model = POWERPC_MMU_2_03;
-#if defined(CONFIG_SOFTMMU)
+#if !defined(CONFIG_USER_ONLY)
     pcc->hash64_opts = &ppc_hash64_opts_basic;
     pcc->lrg_decr_bits = 32;
 #endif
@@ -6036,7 +6036,7 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
         LPCR_LPES0 | LPCR_LPES1 | LPCR_HDICE;
     pcc->lpcr_pm = LPCR_P7_PECE0 | LPCR_P7_PECE1 | LPCR_P7_PECE2;
     pcc->mmu_model = POWERPC_MMU_2_06;
-#if defined(CONFIG_SOFTMMU)
+#if !defined(CONFIG_USER_ONLY)
     pcc->hash64_opts = &ppc_hash64_opts_POWER7;
     pcc->lrg_decr_bits = 32;
 #endif
@@ -6180,7 +6180,7 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
     pcc->lpcr_pm = LPCR_P8_PECE0 | LPCR_P8_PECE1 | LPCR_P8_PECE2 |
                    LPCR_P8_PECE3 | LPCR_P8_PECE4;
     pcc->mmu_model = POWERPC_MMU_2_07;
-#if defined(CONFIG_SOFTMMU)
+#if !defined(CONFIG_USER_ONLY)
     pcc->hash64_opts = &ppc_hash64_opts_POWER7;
     pcc->lrg_decr_bits = 32;
     pcc->n_host_threads = 8;
@@ -6196,7 +6196,7 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
     pcc->l1_icache_size = 0x8000;
 }
 
-#ifdef CONFIG_SOFTMMU
+#ifndef CONFIG_USER_ONLY
 /*
  * Radix pg sizes and AP encodings for dt node ibm,processor-radix-AP-encodings
  * Encoded as array of int_32s in the form:
@@ -6213,7 +6213,7 @@ static struct ppc_radix_page_info POWER9_radix_page_info = {
         0x4000001e  /*  1G - enc: 0x2 */
     }
 };
-#endif /* CONFIG_SOFTMMU */
+#endif /* CONFIG_USER_ONLY */
 
 static void init_proc_POWER9(CPUPPCState *env)
 {
@@ -6370,7 +6370,7 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
         LPCR_HEIC | LPCR_LPES0 | LPCR_HVICE | LPCR_HDICE;
     pcc->lpcr_pm = LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_OEE;
     pcc->mmu_model = POWERPC_MMU_3_00;
-#if defined(CONFIG_SOFTMMU)
+#if !defined(CONFIG_USER_ONLY)
     /* segment page size remain the same */
     pcc->hash64_opts = &ppc_hash64_opts_POWER7;
     pcc->radix_page_info = &POWER9_radix_page_info;
@@ -6388,7 +6388,7 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
     pcc->l1_icache_size = 0x8000;
 }
 
-#ifdef CONFIG_SOFTMMU
+#ifndef CONFIG_USER_ONLY
 /*
  * Radix pg sizes and AP encodings for dt node ibm,processor-radix-AP-encodings
  * Encoded as array of int_32s in the form:
@@ -6405,7 +6405,7 @@ static struct ppc_radix_page_info POWER10_radix_page_info = {
         0x4000001e  /*  1G - enc: 0x2 */
     }
 };
-#endif /* CONFIG_SOFTMMU */
+#endif /* !CONFIG_USER_ONLY */
 
 static void init_proc_POWER10(CPUPPCState *env)
 {
@@ -6546,7 +6546,7 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
 
     pcc->lpcr_pm = LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_OEE;
     pcc->mmu_model = POWERPC_MMU_3_00;
-#if defined(CONFIG_SOFTMMU)
+#if !defined(CONFIG_USER_ONLY)
     /* segment page size remain the same */
     pcc->hash64_opts = &ppc_hash64_opts_POWER7;
     pcc->radix_page_info = &POWER10_radix_page_info;
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index fb351c303f..537e835360 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -273,7 +273,7 @@ int hreg_store_msr(CPUPPCState *env, target_ulong value, int alter_hv)
     return excp;
 }
 
-#ifdef CONFIG_SOFTMMU
+#ifndef CONFIG_USER_ONLY
 void store_40x_sler(CPUPPCState *env, uint32_t val)
 {
     /* XXX: TO BE FIXED */
@@ -283,9 +283,7 @@ void store_40x_sler(CPUPPCState *env, uint32_t val)
     }
     env->spr[SPR_405_SLER] = val;
 }
-#endif /* CONFIG_SOFTMMU */
 
-#ifndef CONFIG_USER_ONLY
 void check_tlb_flush(CPUPPCState *env, bool global)
 {
     CPUState *cs = env_cpu(env);
@@ -304,7 +302,7 @@ void check_tlb_flush(CPUPPCState *env, bool global)
         tlb_flush(cs);
     }
 }
-#endif
+#endif /* !CONFIG_USER_ONLY */
 
 /**
  * _spr_register
-- 
2.38.1


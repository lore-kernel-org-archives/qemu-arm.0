Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1780957lfa;
        Fri, 16 Oct 2020 11:42:14 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c8:: with SMTP id kb8mr5370738pjb.179.1602873734149;
        Fri, 16 Oct 2020 11:42:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602873734; cv=none;
        d=google.com; s=arc-20160816;
        b=IUpCAREN2ls8VGaN2u1Z31SfJ4oafiiUi5WvgqsvjLZY2GlEa2BKlgcuo6HJtucuxx
         A7lKZahBZuRu52tsc465t8cYa+RLIdVobK8nXU6nVKSDetvgCrwdvQnPY4D0aVFGNNId
         VgVPbZQWw5DrOsYhdynOqAomFCIL9VDW9PXQ8VoAoALlpzOMU+tRlK+oz0IRuZeX8Fmt
         cdbk7w8WNMbnQXuNamzIMJxiVzSlrPOPbev+r5v66FsZZEStD25feeMGXgBgo+7FAETe
         dCyfToJWWi8Jm4Ryx03OuUHFdlxXrJuX7fjnePXCF9if9xMrUwGpdahKjc1vn9rnUujj
         yddQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mmx0CSTu1RTijUU9ATLSsRFrO7J82mzvN7XFVAPyzh0=;
        b=EoEdsSF6ZGVNPGYZzRtBd1BtyhHlTufwmFR4UrcvYabMZSvurNokRe8UyO2x8o1G2O
         ail+WyIuca8VCjZcfTuMQtB0idwPc1sFNGxuv6owktpgtbV6TM7wxGjrFGCRfehUC5Eu
         G6uXlZffN7VGsyImTwR/g5kmQVn4Ue94GetWHqyRo+NA1wKXXxGwVvoBkofwMtSlr158
         WlcDOY1MerOHOh6pEX03YtD7MVymY4iglWfnZrxBSyw7LcE8wFWoVTbEXTvqMYcRwKUG
         o4BljsXZKcpVx2Mj/Sfpw9AyTvBuEVS20rfqwaFsNdXDZzCZ/Ra6VPVo5YDe9UtjNfsP
         4atg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UDvBaa/2";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c3sor1755994pjc.23.2020.10.16.11.42.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Oct 2020 11:42:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UDvBaa/2";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mmx0CSTu1RTijUU9ATLSsRFrO7J82mzvN7XFVAPyzh0=;
        b=UDvBaa/2+KKhPbT4/iNfv5XE+B7/uNC7eM98tlHjPuMTzjib2VBF04WADHBc5uw36s
         xlwjsnUpC2Wjk4qWoN1v4ujscN4hOqA8IpB3wpWQcgNyC7LvRS2fUxuCWWYtoztd4gv4
         EAycsoFCnxOb9ni1jgXYaQKM9mgieHnhvz3x+v53B2e329Y3NPAzLfWXVMfxO6bxb1aq
         qRDn0bU4giEfrygHkcTzQU2ZFKiHeb8xJhTAA+oFgrRaY7zannZb2aQ69Tkc0g4JQgx0
         PAiHPobqzh/yxvBTsQYQMHA91i/tkCzLoKN5DIwOJDl8wi5BTvnRfYMwaADc3VgEYdf+
         CodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mmx0CSTu1RTijUU9ATLSsRFrO7J82mzvN7XFVAPyzh0=;
        b=FjyE4wpxYC89COzsSeqWrPt0kDmoUY7iMu4kojdmU36X95kNof/e4JQSfhDKBqWyYR
         Rgpart4W0n/1YK8lQtDX2PnQyAzAwjvj5rvHKgywZ/YxeJzSSNDekHs/nyb3uNSZR4RC
         7mtO3O+scrfyCfOWhJVv2I8EM8aFUsDjtNl7TS4EqhH0q9kIkE5BvUu8D66rOD4asMes
         OorQMtqDtp8uVPlEGxl2QM+N8NYXeXsH774KHJwF+9vjvvtbcLuyf/JXoOGOpD/qVJD1
         IH9aeNSbt8S7ok/m7DoO6iJXYDO1zhDle5Bdg2OYEGKlCVqL3GItFCJ8VnbL1/Y3nOfm
         lDZg==
X-Gm-Message-State: AOAM533gnbDT21RypreD6ZyPZEszjjYXpHO+EoB2lBE5cscuT2nD+wAX
	tEbc3VdB7E4OmTKUhqO1h2VCg+7JAj+yLIT0
X-Google-Smtp-Source: ABdhPJyxKkUTKpLTA/YU83qDPCL5iTjtWDkm6nmQEH+Pgy5X+GeRJ6VdpjBFhwXEy3pjnrIjal1iLg==
X-Received: by 2002:a17:90a:6541:: with SMTP id f1mr5433416pjs.46.1602873733577;
        Fri, 16 Oct 2020 11:42:13 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([71.212.141.89])
        by smtp.gmail.com with ESMTPSA id c15sm3426011pgg.77.2020.10.16.11.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:42:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	laurent@vivier.eu
Subject: [PATCH v11 02/12] linux-user: Set PAGE_TARGET_1 for TARGET_PROT_BTI
Date: Fri, 16 Oct 2020 11:41:57 -0700
Message-Id: <20201016184207.786698-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016184207.786698-1-richard.henderson@linaro.org>
References: <20201016184207.786698-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: nWoviherq7EC

Transform the prot bit to a qemu internal page bit, and save
it in the page tables.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v10: Add PAGE_BTI define (pmm).
---
 include/exec/cpu-all.h     |  2 ++
 linux-user/syscall_defs.h  |  4 ++++
 target/arm/cpu.h           |  5 +++++
 linux-user/mmap.c          | 16 ++++++++++++++++
 target/arm/translate-a64.c |  6 +++---
 5 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 61e13b5038..656a2a8788 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -274,6 +274,8 @@ extern intptr_t qemu_host_page_mask;
 /* FIXME: Code that sets/uses this is broken and needs to go away.  */
 #define PAGE_RESERVED  0x0020
 #endif
+/* Target-specific bits that will be used via page_get_flags().  */
+#define PAGE_TARGET_1  0x0080
 
 #if defined(CONFIG_USER_ONLY)
 void page_dump(FILE *f);
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 731c3d5341..cabbfb762d 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -1277,6 +1277,10 @@ struct target_winsize {
 #define TARGET_PROT_SEM         0x08
 #endif
 
+#ifdef TARGET_AARCH64
+#define TARGET_PROT_BTI         0x10
+#endif
+
 /* Common */
 #define TARGET_MAP_SHARED	0x01		/* Share changes */
 #define TARGET_MAP_PRIVATE	0x02		/* Changes are private */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index cfff1b5c8f..e8efe21a1b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3443,6 +3443,11 @@ static inline MemTxAttrs *typecheck_memtxattrs(MemTxAttrs *x)
 #define arm_tlb_bti_gp(x) (typecheck_memtxattrs(x)->target_tlb_bit0)
 #define arm_tlb_mte_tagged(x) (typecheck_memtxattrs(x)->target_tlb_bit1)
 
+/*
+ * AArch64 usage of the PAGE_TARGET_* bits for linux-user.
+ */
+#define PAGE_BTI  PAGE_TARGET_1
+
 /*
  * Naming convention for isar_feature functions:
  * Functions which test 32-bit ID registers should have _aa32_ in
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index f261563420..00c05e6a0f 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -83,6 +83,22 @@ static int validate_prot_to_pageflags(int *host_prot, int prot)
     *host_prot = (prot & (PROT_READ | PROT_WRITE))
                | (prot & PROT_EXEC ? PROT_READ : 0);
 
+#ifdef TARGET_AARCH64
+    /*
+     * The PROT_BTI bit is only accepted if the cpu supports the feature.
+     * Since this is the unusual case, don't bother checking unless
+     * the bit has been requested.  If set and valid, record the bit
+     * within QEMU's page_flags.
+     */
+    if (prot & TARGET_PROT_BTI) {
+        ARMCPU *cpu = ARM_CPU(thread_cpu);
+        if (cpu_isar_feature(aa64_bti, cpu)) {
+            valid |= TARGET_PROT_BTI;
+            page_flags |= PAGE_BTI;
+        }
+    }
+#endif
+
     return prot & ~valid ? 0 : page_flags;
 }
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 7188808341..072754fa24 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14507,10 +14507,10 @@ static void disas_data_proc_simd_fp(DisasContext *s, uint32_t insn)
  */
 static bool is_guarded_page(CPUARMState *env, DisasContext *s)
 {
-#ifdef CONFIG_USER_ONLY
-    return false;  /* FIXME */
-#else
     uint64_t addr = s->base.pc_first;
+#ifdef CONFIG_USER_ONLY
+    return page_get_flags(addr) & PAGE_BTI;
+#else
     int mmu_idx = arm_to_core_mmu_idx(s->mmu_idx);
     unsigned int index = tlb_index(env, mmu_idx, addr);
     CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
-- 
2.25.1

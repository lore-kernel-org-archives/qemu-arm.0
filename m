Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2281589wrv;
        Sat, 3 Aug 2019 14:08:11 -0700 (PDT)
X-Received: by 2002:a65:430b:: with SMTP id j11mr128059619pgq.383.1564866491094;
        Sat, 03 Aug 2019 14:08:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564866491; cv=none;
        d=google.com; s=arc-20160816;
        b=yF7fG0O62pLe4ogQYLJA5zLqJHZQ97y76MHX+M6i2PYWtlgtPg2Ex/C6uBai+U9InR
         iX67G5v/kkeEIJonMXmUsP8QvSaDzla9K5IAkf04SGgwG15KDntGuYwkYRTTyq0gwDVu
         6itXuY0b+DE4TRM/H0xjXfkJkLbkhOjsw2Atjvz8nwXlEDvfk+0Cslqf8LPdmRDeg7Ag
         SEaQ4wgN32tGbqFKCQ/rV93VXgYq4QSB6LCaHhFru+JiPp8ApN9Z9ViDJeNTF90gQEtT
         G3ZAgRSmQ23Iy8/ot3fHqikH/GKff6wrgbJgcCCjSmoxPe3CbyfZqwbcSVg0JjT5m/0L
         9bGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=+dg5JIkpSzmoy0afkqhKVUwUedH22oFzTp8ibzMq0SE=;
        b=FLhv3xhAFl4DubjRzVPTDMkEzMf7P2OtirOB79LEWXU9qX9H2+ycGw+Hn3tcEsC2Vg
         WV9JiGldR6b0ukeVL0tMNfWdxNowQDBTl0vMgK5ZGRXRQuEzMJRoU1+RMVNLr3DbYum2
         LBEYdKbznrkcU47k5uFaErwDT8vn6MjYxp0a4ZNRrvFdCfIR+qND7XH9R1aLGYw9fUfd
         rW+AvPzxlf7GedPwQwC5vwmmI/6OP6ypiUqfjTVi4jfv80Tf24Ewdsy5i++XOp6cURqO
         QbzceOl7zhTpMaqp87MO+kScsWpiUFKsS8548pAsaZoi7SObXsP5NY0yKh1duuBpObIm
         bUBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qNY3Sw+X;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r14sor7462944pgl.40.2019.08.03.14.08.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 14:08:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qNY3Sw+X;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+dg5JIkpSzmoy0afkqhKVUwUedH22oFzTp8ibzMq0SE=;
        b=qNY3Sw+XDQzjoWT4PxBw52H0kfB9SJ0QGxQmeR2rPEBDqbj14D4oTAb49uvqILtuwf
         WxrOCfI64/HwQNLD90HNO3IbbMw4vy9Q1t5WVSr8bmezdG4SuNpu0It8P+BcaLWHNWOV
         LYfFJsyMA8qzml31pvKrvohZuWzgGf4mhemtCZSC7/aqvrnJMvF6saYOXiE05GGL5UlL
         iloojqiMDAkHhY8VHGgVZfvtssPRdrgOWS8YllKif4xeo7fJ2PZ3Xl5HL6oLuZXIUorh
         O2LjuUrL1BX8y28tlurMMo0u/eQXrm8dQDBAWF+S85gtwrIp7tlIA4b6+o21k3VUdCxy
         F0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+dg5JIkpSzmoy0afkqhKVUwUedH22oFzTp8ibzMq0SE=;
        b=coLK2mTgrPqdMmBsGWF2ChOTgW1u5IIOHIPsnQDfSkV+6mHuk7akOhvpo2ihsMXTjh
         TQvIQXnkHBUanwngMZu7oQCVG6cQ26dmahy4TXHloGx0gD3EK4mqQq2hAx4HI5gDg5PN
         sq5VMAZujxqBERdr9dWhdT5k+Q+CbJgAQtLmHTlOo9Lz1qxoFP4WYE7la2T1ffL/5cvp
         umDk2D8FNyEsj7eF+NHYDOQcBAz2wSCFyji/DTjFn8H3kPQIwO9XixOAsyY5UaA1JAv7
         Y1o5V41hJdR6igceBjOlrFZUigXDf2lSUthLgnYBkBMHUzLFF4QuSFctmmc6NGt5hj13
         Vbpw==
X-Gm-Message-State: APjAAAWn69A/BjNzQhHiZsNvKHr3gZ463aFND3CoshTCi22Ui6i/82lc
	J2TMsVBq8IVEhYhQwpts8i3rzzmh
X-Google-Smtp-Source: APXvYqz7uW/ymngdVOZhS7j5IKDPvn/wXBmQASOXDEnJ/pwL8kLBDpvi+mpG9C7XmBI2I5bs6yi/YA==
X-Received: by 2002:a65:4c4d:: with SMTP id l13mr88114498pgr.156.1564866490564;
        Sat, 03 Aug 2019 14:08:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id x25sm110129644pfa.90.2019.08.03.14.08.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 14:08:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org,
	Dave.Martin@arm.com
Subject: [PATCH v7 3/6] linux-user: Set PAGE_TARGET_1 for TARGET_PROT_BTI
Date: Sat,  3 Aug 2019 14:08:00 -0700
Message-Id: <20190803210803.5701-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803210803.5701-1-richard.henderson@linaro.org>
References: <20190803210803.5701-1-richard.henderson@linaro.org>
X-TUID: SQ3BKIyHnHZB

Transform the prot bit to a qemu internal page bit, and save
it in the page tables.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h     |  2 ++
 linux-user/syscall_defs.h  |  4 ++++
 linux-user/mmap.c          | 16 ++++++++++++++++
 target/arm/translate-a64.c |  6 +++---
 4 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 40b140cbba..27470b73f7 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -248,6 +248,8 @@ extern intptr_t qemu_host_page_mask;
 /* FIXME: Code that sets/uses this is broken and needs to go away.  */
 #define PAGE_RESERVED  0x0020
 #endif
+/* Target-specific bits that will be used via page_get_flags().  */
+#define PAGE_TARGET_1  0x0080
 
 #if defined(CONFIG_USER_ONLY)
 void page_dump(FILE *f);
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 0662270300..a59a81e4b6 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -1124,6 +1124,10 @@ struct target_winsize {
 #define TARGET_PROT_SEM         0x08
 #endif
 
+#ifdef TARGET_AARCH64
+#define TARGET_PROT_BTI         0x10
+#endif
+
 /* Common */
 #define TARGET_MAP_SHARED	0x01		/* Share changes */
 #define TARGET_MAP_PRIVATE	0x02		/* Changes are private */
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index c1a188ec0b..c1bed290f6 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -83,6 +83,22 @@ static int validate_prot_to_pageflags(int *host_prot, int prot)
      */
     *host_prot = prot & (PROT_READ | PROT_WRITE | PROT_EXEC);
 
+#ifdef TARGET_AARCH64
+    /*
+     * The PROT_BTI bit is only accepted if the cpu supports the feature.
+     * Since this is the unusual case, don't bother checking unless
+     * the bit has been requested.  If set and valid, record the bit
+     * within QEMU's page_flags as PAGE_TARGET_1.
+     */
+    if (prot & TARGET_PROT_BTI) {
+        ARMCPU *cpu = ARM_CPU(thread_cpu);
+        if (cpu_isar_feature(aa64_bti, cpu)) {
+            valid |= TARGET_PROT_BTI;
+            page_flags |= PAGE_TARGET_1;
+        }
+    }
+#endif
+
     return prot & ~valid ? 0 : page_flags;
 }
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 06ff3a7f2e..395e498acf 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -13963,10 +13963,10 @@ static void disas_data_proc_simd_fp(DisasContext *s, uint32_t insn)
  */
 static bool is_guarded_page(CPUARMState *env, DisasContext *s)
 {
-#ifdef CONFIG_USER_ONLY
-    return false;  /* FIXME */
-#else
     uint64_t addr = s->base.pc_first;
+#ifdef CONFIG_USER_ONLY
+    return page_get_flags(addr) & PAGE_TARGET_1;
+#else
     int mmu_idx = arm_to_core_mmu_idx(s->mmu_idx);
     unsigned int index = tlb_index(env, mmu_idx, addr);
     CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
-- 
2.17.1

Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2008919ejf;
        Tue, 16 Aug 2022 13:34:25 -0700 (PDT)
X-Received: by 2002:a05:6830:2b25:b0:637:397a:3122 with SMTP id l37-20020a0568302b2500b00637397a3122mr8333892otv.329.1660682065651;
        Tue, 16 Aug 2022 13:34:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682065; cv=none;
        d=google.com; s=arc-20160816;
        b=Z/ucHEgR4CjbvQzlM+iRDA6nAxvNuxw8Q+3KX/khzV7etX7e33udNhcnPXLZ9gA9M4
         TAbPwVo1o68mJGM4N0GnLps9+QBW077wHoPXEmGH4E4TCwUD0ddtv8Q53JfDhmkFFG7B
         MR4+YOCostGIXb3qAsUoy88UGfYiVcJWST4wdBt61P34nxb3Gwue8EHZe4ymmzvJEhCN
         sxAr8jkysS/4DrsOhetFyGpZw+YT8rwvnFp0WpNacO1tj+u8UWm26AoPpW80eq17Rf0e
         /3ym4RqCjpMsG/Wb5UN6z+reZwS+5vJhZHzEnzEck3bPjviSIH7ctq9LUlfyQQF1GtfS
         nK2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yvFaYil5KCmrJ18ST8mO/xgAXl5EVxbXc1ztEfjbOPQ=;
        b=F8mKSov/UsdSEWK3DjOmfet06/ptND4rQo/pHIxIKiwIRO+yRKDmJZOE1liV8rGCn7
         X9nb1YNCDFBR72z9mb4VDusMN8MNrOJSsL1hrKnzwyqksME6Vz5mS6E0DE/0mqfnExmS
         6lpkJVQhsbl+nqSmD7PwsIzpuKX01KhgdIUtAh5F8MvG1yQDoaZgtE6Xi0RWToqANiuF
         UjwegQ/kp7iZzcBZ+gLtUJEJrSiV5IgYvicdkRJZlbD0Glr73gHlXkxkieLP3ua//KeW
         kk3wcxViLmyf1oCTTTuWhm7fGtHMbtk43xBo9n/GLeVmv3Ccfslr9xuqNsizluMYFxxH
         Giaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nxqz1pmV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p9-20020acaf109000000b003434a2de2c1sor2740803oih.24.2022.08.16.13.34.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:34:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nxqz1pmV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=yvFaYil5KCmrJ18ST8mO/xgAXl5EVxbXc1ztEfjbOPQ=;
        b=Nxqz1pmVh/GpNWvT4Tloo4OxtjLId9CRdVZcUMNS4fibSV/v/3YYyBSoAevlSjTuVt
         pYjghwLEb0ZUaZ7jwOCdo3jadDZCpyKifIE8G8dbIN27eHeVboFZgYLLgFWihKOg9aAK
         /XM6UBNatULz6zeiN8UVeJWOII9O0BFtNBOV7zmyB7OpDSMPRHz8pUtjt4PJM47euxAn
         ZGXWbUkdJLlbSyC5DyQgAuDHkx0ZIpn7JxnAVm2x1Jo3aqIDdDKYCm8B9KK0TTT1HB96
         IfJWPJVOvF8FpL3TRAqRqUfcOZcT67rxZToSPfeobeg4hRWBeA79g4Hts2XdwS07mBjn
         r4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=yvFaYil5KCmrJ18ST8mO/xgAXl5EVxbXc1ztEfjbOPQ=;
        b=E2KuJQRZ66ggbbb3GJnAcTNcGJFA3hbmYsZVBLetwi4CvHkSKZj7+Cr1dER7wbsRWI
         9PgTKHHG5qb3G0IyxBS99JHJIUlRNknG7N6No9ieGKmKgts1POXEI9ka+3mTD7eXO5J8
         2XmrOlD6LHrWAmblqGh1hXPY3Xu4eDhS+I78cxq/OpomYgr6bciveqzNAdCDR6BnRH8s
         jMdVLQYJleaL2/e6bX0q8T5k/WJpIFDpYcEl4VUYopvfcdO8nuN4ljqOgd9FyKbdqznB
         99hxJlxY1f1Nk5mAXoo7D6MIbXYkGEuKObwBTlE0+kOtEPArU800BZ1zU6Su2k54Ys9e
         9Duw==
X-Gm-Message-State: ACgBeo3IqPfTkSoY/2C8MPP/X2ke81Nk3LvURANYps4Iu+hVuertlLFr
	T8mTprfqBeXsAYgXS3Vfz/Pu/7pP
X-Google-Smtp-Source: AA6agR6HqyeAUO+VriiEATpxONLVQA6JaR0DjkHSSbfEtmil/PIwNzraOiffR9KeUnVxCaQjC9LFng==
X-Received: by 2002:aca:ad0c:0:b0:342:f3e2:32a9 with SMTP id w12-20020acaad0c000000b00342f3e232a9mr128410oie.261.1660682065222;
        Tue, 16 Aug 2022 13:34:25 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:34:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 08/33] accel/tcg: Make tb_htable_lookup static
Date: Tue, 16 Aug 2022 15:33:35 -0500
Message-Id: <20220816203400.161187-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: oPlmGxjINGu1

The function is not used outside of cpu-exec.c.  Move it and
its subroutines up in the file, before the first use.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h |   3 -
 accel/tcg/cpu-exec.c    | 122 ++++++++++++++++++++--------------------
 2 files changed, 61 insertions(+), 64 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 311e5fb422..e7e30d55b8 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -552,9 +552,6 @@ void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs);
 #endif
 void tb_flush(CPUState *cpu);
 void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr);
-TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
-                                   target_ulong cs_base, uint32_t flags,
-                                   uint32_t cflags);
 void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr);
 
 /* GETPC is the true target of the return instruction that we'll execute.  */
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index a565a3f8ec..711859d4d4 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -170,6 +170,67 @@ uint32_t curr_cflags(CPUState *cpu)
     return cflags;
 }
 
+struct tb_desc {
+    target_ulong pc;
+    target_ulong cs_base;
+    CPUArchState *env;
+    tb_page_addr_t phys_page1;
+    uint32_t flags;
+    uint32_t cflags;
+    uint32_t trace_vcpu_dstate;
+};
+
+static bool tb_lookup_cmp(const void *p, const void *d)
+{
+    const TranslationBlock *tb = p;
+    const struct tb_desc *desc = d;
+
+    if (tb->pc == desc->pc &&
+        tb->page_addr[0] == desc->phys_page1 &&
+        tb->cs_base == desc->cs_base &&
+        tb->flags == desc->flags &&
+        tb->trace_vcpu_dstate == desc->trace_vcpu_dstate &&
+        tb_cflags(tb) == desc->cflags) {
+        /* check next page if needed */
+        if (tb->page_addr[1] == -1) {
+            return true;
+        } else {
+            tb_page_addr_t phys_page2;
+            target_ulong virt_page2;
+
+            virt_page2 = (desc->pc & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
+            phys_page2 = get_page_addr_code(desc->env, virt_page2);
+            if (tb->page_addr[1] == phys_page2) {
+                return true;
+            }
+        }
+    }
+    return false;
+}
+
+static TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
+                                          target_ulong cs_base, uint32_t flags,
+                                          uint32_t cflags)
+{
+    tb_page_addr_t phys_pc;
+    struct tb_desc desc;
+    uint32_t h;
+
+    desc.env = cpu->env_ptr;
+    desc.cs_base = cs_base;
+    desc.flags = flags;
+    desc.cflags = cflags;
+    desc.trace_vcpu_dstate = *cpu->trace_dstate;
+    desc.pc = pc;
+    phys_pc = get_page_addr_code(desc.env, pc);
+    if (phys_pc == -1) {
+        return NULL;
+    }
+    desc.phys_page1 = phys_pc & TARGET_PAGE_MASK;
+    h = tb_hash_func(phys_pc, pc, flags, cflags, *cpu->trace_dstate);
+    return qht_lookup_custom(&tb_ctx.htable, &desc, h, tb_lookup_cmp);
+}
+
 /* Might cause an exception, so have a longjmp destination ready */
 static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
                                           target_ulong cs_base,
@@ -487,67 +548,6 @@ void cpu_exec_step_atomic(CPUState *cpu)
     end_exclusive();
 }
 
-struct tb_desc {
-    target_ulong pc;
-    target_ulong cs_base;
-    CPUArchState *env;
-    tb_page_addr_t phys_page1;
-    uint32_t flags;
-    uint32_t cflags;
-    uint32_t trace_vcpu_dstate;
-};
-
-static bool tb_lookup_cmp(const void *p, const void *d)
-{
-    const TranslationBlock *tb = p;
-    const struct tb_desc *desc = d;
-
-    if (tb->pc == desc->pc &&
-        tb->page_addr[0] == desc->phys_page1 &&
-        tb->cs_base == desc->cs_base &&
-        tb->flags == desc->flags &&
-        tb->trace_vcpu_dstate == desc->trace_vcpu_dstate &&
-        tb_cflags(tb) == desc->cflags) {
-        /* check next page if needed */
-        if (tb->page_addr[1] == -1) {
-            return true;
-        } else {
-            tb_page_addr_t phys_page2;
-            target_ulong virt_page2;
-
-            virt_page2 = (desc->pc & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
-            phys_page2 = get_page_addr_code(desc->env, virt_page2);
-            if (tb->page_addr[1] == phys_page2) {
-                return true;
-            }
-        }
-    }
-    return false;
-}
-
-TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
-                                   target_ulong cs_base, uint32_t flags,
-                                   uint32_t cflags)
-{
-    tb_page_addr_t phys_pc;
-    struct tb_desc desc;
-    uint32_t h;
-
-    desc.env = cpu->env_ptr;
-    desc.cs_base = cs_base;
-    desc.flags = flags;
-    desc.cflags = cflags;
-    desc.trace_vcpu_dstate = *cpu->trace_dstate;
-    desc.pc = pc;
-    phys_pc = get_page_addr_code(desc.env, pc);
-    if (phys_pc == -1) {
-        return NULL;
-    }
-    desc.phys_page1 = phys_pc & TARGET_PAGE_MASK;
-    h = tb_hash_func(phys_pc, pc, flags, cflags, *cpu->trace_dstate);
-    return qht_lookup_custom(&tb_ctx.htable, &desc, h, tb_lookup_cmp);
-}
-
 void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr)
 {
     if (TCG_TARGET_HAS_direct_jump) {
-- 
2.34.1

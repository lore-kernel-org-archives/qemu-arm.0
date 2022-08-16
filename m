Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2009122ejf;
        Tue, 16 Aug 2022 13:34:49 -0700 (PDT)
X-Received: by 2002:a05:6870:8305:b0:116:8e04:71c2 with SMTP id p5-20020a056870830500b001168e0471c2mr135356oae.201.1660682089695;
        Tue, 16 Aug 2022 13:34:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682089; cv=none;
        d=google.com; s=arc-20160816;
        b=mKFeB/Z1TLsXB7TVlXMS5Zcdtd+AIMJaFziV6h4EWk+HasU+/uzhknTJdL5x9xBZQu
         zriT9TwNLuswY3r43TLmCP47D59toU1HrejAMTu+ujruBZgZWIDBi2uXDKrjwhRRaHQD
         OuJ7JyuL/yCG/ngcVrjfcBkdgLiSVOe7BuefaAhWC1xCteAKWmXOwgYngGCUcNV0Ob43
         7xHzGP09hKO9OiaS5pqtXPohAcIIOzrkC1g59EdUCMDuGy4dVrjArRYdO/xxJAXThA8b
         Oi3s0QAYNmP66Y09IUgNaeK9xyRUGeckz6IS1T+5NeGKw81jTO/sWYGM8NQ+Z0Qx4vYB
         IiAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nnTf8vYQrhFGbCh9F71+TS9pu/cqcKGq2pxwJ/zBizo=;
        b=pqd0hsEZEZ8UyrHCmz2pB3PVpVRTs4KbrPeGoJlnAkaiIftT6p+SR9I1UzA0l6szrg
         xDVTsdYix2h6W/QJxhmUkUFVxGX5Aa8AtRw/C5hoe612YFhECsJ327pNCuCMtJy1cjCZ
         c7tiRFFq/ghXKxkOas8r3kV+8LfkdOJ3ZpgtEiUg/ftpCAyz1W2JplZoaSZRR4BLZs/S
         1HXOOQ9e4RqLwDTSayxk0A+kZVj6ufiL5RPnA1kUzn+jpD+hJd/vKvtQnWIK3kzLW08l
         s1ATAyyGFe+dUml8DHwatPjNwj11nQGuWgge3JTz0MCEs/c4YQ73ZiR3/wg+f9AQegn0
         YWfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kQWys5LK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x25-20020a9d6d99000000b00637121d7feasor1696682otp.8.2022.08.16.13.34.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:34:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kQWys5LK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=nnTf8vYQrhFGbCh9F71+TS9pu/cqcKGq2pxwJ/zBizo=;
        b=kQWys5LKPME3++maxshyi9tj+cntKWUdfJhPQpwWnj1cYxmgIWhu4tBpmw3ONlN02s
         TGgdIUN20FNABTeNBe/G8tkDudR+wer6XfpyWETM/ZZ4F+w97+O64wsq2FH60CRyBU9t
         Y1cQ9W07hptdQuQkvNKn9JsbrvJ2qvKNHdkg3pxW4fwkrOIuhaCoTwwkjyfMQz9ef2GY
         Htgs16/gDFMDBThSorwJhsUf1X1MAgJmNhQZtWCP9DE2xeDLSWkZSFpvTBb/nLP7NY1y
         LcVDkI00LpRyKMicl2MFcDYewKNNLeK/RvzlDdmSahYCv+3QReVnIHng3ALaCqHe4296
         9k2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=nnTf8vYQrhFGbCh9F71+TS9pu/cqcKGq2pxwJ/zBizo=;
        b=oE1G0yo1br5k6++6LsA3FymvvscrEH0wO+z48f11dvUOfZ2NuLCGkTJVaKNzvJQDKY
         yxuCXKsu4ad+yWikCVYZ5vkDuu3lgMwRVlbfU/kzNR6zpoRZ3KoOC4Ndke53mTCzQhrA
         M0/T+mlxqWE/h3pNEIg6DYBu783kpIIBEYsUUHG7TqBifLa/kQyfGtlMb5M6RCKtXDYE
         janPf7FoKouUXIXCmE9w67fkn9Sau5tb+xJVG7vAOp09a5+a9grLgTs0iLGEbrKkWzK+
         Ll+oO1PA0ZNjhRpA/pEhObF8lvfxxo33zWClBglOnq45ZdzJ085Zi1etWpIadYuGKeqb
         iNdQ==
X-Gm-Message-State: ACgBeo1dbx9clWfqN17GI3Z4mZNgaFpY07LqlFdi0Pgvfwpxqg0+upE4
	KSXxG5061MSXfEIznLcpQmqg48KI
X-Google-Smtp-Source: AA6agR4KMoSQu+76ek989FMN6dfPejgCUjTy705SwSiJeISQyZJTiGXDc4uV+j3iLUpbolhL/lTfww==
X-Received: by 2002:a9d:7a55:0:b0:637:1874:a2cb with SMTP id z21-20020a9d7a55000000b006371874a2cbmr8269625otm.318.1660682089295;
        Tue, 16 Aug 2022 13:34:49 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:34:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 20/33] accel/tcg: Do not align tb->page_addr[0]
Date: Tue, 16 Aug 2022 15:33:47 -0500
Message-Id: <20220816203400.161187-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: X5iGmWW+ahlX

Let tb->page_addr[0] contain the offset within the page of the
start of the translation block.  We need to recover this value
anyway at various points, and it is easier to discard the page
offset when it's not needed, which happens naturally via the
existing find_page shift.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c      | 16 ++++++++--------
 accel/tcg/cputlb.c        |  3 ++-
 accel/tcg/translate-all.c |  9 +++++----
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 7b8977a0a4..b1fd962718 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -174,7 +174,7 @@ struct tb_desc {
     target_ulong pc;
     target_ulong cs_base;
     CPUArchState *env;
-    tb_page_addr_t phys_page1;
+    tb_page_addr_t page_addr0;
     uint32_t flags;
     uint32_t cflags;
     uint32_t trace_vcpu_dstate;
@@ -186,7 +186,7 @@ static bool tb_lookup_cmp(const void *p, const void *d)
     const struct tb_desc *desc = d;
 
     if (tb->pc == desc->pc &&
-        tb->page_addr[0] == desc->phys_page1 &&
+        tb->page_addr[0] == desc->page_addr0 &&
         tb->cs_base == desc->cs_base &&
         tb->flags == desc->flags &&
         tb->trace_vcpu_dstate == desc->trace_vcpu_dstate &&
@@ -195,12 +195,12 @@ static bool tb_lookup_cmp(const void *p, const void *d)
         if (tb->page_addr[1] == -1) {
             return true;
         } else {
-            tb_page_addr_t phys_page2;
-            target_ulong virt_page2;
+            tb_page_addr_t phys_page1;
+            target_ulong virt_page1;
 
-            virt_page2 = (desc->pc & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
-            phys_page2 = get_page_addr_code(desc->env, virt_page2);
-            if (tb->page_addr[1] == phys_page2) {
+            virt_page1 = TARGET_PAGE_ALIGN(desc->pc);
+            phys_page1 = get_page_addr_code(desc->env, virt_page1);
+            if (tb->page_addr[1] == phys_page1) {
                 return true;
             }
         }
@@ -226,7 +226,7 @@ static TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
     if (phys_pc == -1) {
         return NULL;
     }
-    desc.phys_page1 = phys_pc & TARGET_PAGE_MASK;
+    desc.page_addr0 = phys_pc;
     h = tb_hash_func(phys_pc, pc, flags, cflags, *cpu->trace_dstate);
     return qht_lookup_custom(&tb_ctx.htable, &desc, h, tb_lookup_cmp);
 }
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index ae7b40dd51..8b81b07b79 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -951,7 +951,8 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
    can be detected */
 void tlb_protect_code(ram_addr_t ram_addr)
 {
-    cpu_physical_memory_test_and_clear_dirty(ram_addr, TARGET_PAGE_SIZE,
+    cpu_physical_memory_test_and_clear_dirty(ram_addr & TARGET_PAGE_MASK,
+                                             TARGET_PAGE_SIZE,
                                              DIRTY_MEMORY_CODE);
 }
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index a8f1c34c4e..20f00f4335 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1167,7 +1167,7 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
     qemu_spin_unlock(&tb->jmp_lock);
 
     /* remove the TB from the hash list */
-    phys_pc = tb->page_addr[0] + (tb->pc & ~TARGET_PAGE_MASK);
+    phys_pc = tb->page_addr[0];
     h = tb_hash_func(phys_pc, tb->pc, tb->flags, orig_cflags,
                      tb->trace_vcpu_dstate);
     if (!qht_remove(&tb_ctx.htable, tb, h)) {
@@ -1291,7 +1291,7 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
      * we can only insert TBs that are fully initialized.
      */
     page_lock_pair(&p, phys_pc, &p2, phys_page2, true);
-    tb_page_add(p, tb, 0, phys_pc & TARGET_PAGE_MASK);
+    tb_page_add(p, tb, 0, phys_pc);
     if (p2) {
         tb_page_add(p2, tb, 1, phys_page2);
     } else {
@@ -1644,11 +1644,12 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
         if (n == 0) {
             /* NOTE: tb_end may be after the end of the page, but
                it is not a problem */
-            tb_start = tb->page_addr[0] + (tb->pc & ~TARGET_PAGE_MASK);
+            tb_start = tb->page_addr[0];
             tb_end = tb_start + tb->size;
         } else {
             tb_start = tb->page_addr[1];
-            tb_end = tb_start + ((tb->pc + tb->size) & ~TARGET_PAGE_MASK);
+            tb_end = tb_start + ((tb->page_addr[0] + tb->size)
+                                 & ~TARGET_PAGE_MASK);
         }
         if (!(tb_end <= start || tb_start >= end)) {
 #ifdef TARGET_HAS_PRECISE_SMC
-- 
2.34.1

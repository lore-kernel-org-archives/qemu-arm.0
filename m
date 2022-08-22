Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1182741ejc;
        Mon, 22 Aug 2022 16:24:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR73avQqr9RxCw6pDTXu47IbjFMQALwPLrpm5Mo7BS/blWVlfEBzhUPHL9mSHHXJmDaaz5zT
X-Received: by 2002:ad4:5be1:0:b0:496:a686:2bec with SMTP id k1-20020ad45be1000000b00496a6862becmr17556277qvc.85.1661210670075;
        Mon, 22 Aug 2022 16:24:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661210670; cv=none;
        d=google.com; s=arc-20160816;
        b=mTKPyJ1XS17nkp068rhnLP2Bh6EOFygVv1XscKj4dZpJ7B6Xvqm5vh1M1FhS7XuLBM
         8r72KSnhC3bxC8OlLbn2/phpLdLLjyHFD+C2jiWCdZAk0D/4RM0eDyMcbJvzaG8DRUAT
         Akj6epDuAS7xfDbcgtPofItk/2UJDKGKKNJQUQzCv1wMsg4A0SSufP9EQjoze+zF8Sin
         6uyo7jNfea8pJyacg9MX07pm0roJH2oegEfXMoKcEgzPxGqG8zVXZPch1H9TFwo8E+6H
         zBunajR5hxsp+He9FPqacTyqBX68K9rGHYkG4zEkVhEbatceT572w1qKV1C9wbru5ZFg
         6x/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=u1rNx+z6mfX9QOf0swX80lotmkBIQnUrgYcTWCQuCO0=;
        b=f5p44zNJ6Re59p3vLWrSHUa7PoWoEp/5PpwTkf7JVOAQcJqdS71mp1jWcJjDHRn2KD
         IimdvS9jGusux6VOJ07jBQEUkoFwR0JVfOg585aBGebTDZ+/Metuaa0BC/i4HO4MIW5g
         QDZocSHNVLajQzvOXsCNByYWwu2inivJ6hZYXLV89YzMGMXX8OSuSFVDqMGjvy3oTYk8
         gp1bzI4jXhz/kxt7TJ0kvIy5TbZXD2LFMAwp/9+Ze1Z3j20FWOHrLvFzB4W6AkKWdjY+
         PCT96jSfCQPs+Y+Jz15AU7azlyz6JsCIZo/zAbI4nYjcNWW6j5vn2pEymhGgOpY25FOc
         JPtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sdLmjGg4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 138-20020a370790000000b006bb83fcc59asi4860539qkh.347.2022.08.22.16.24.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 16:24:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sdLmjGg4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQGmT-0005d1-FK
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 19:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGlk-0005cc-DJ
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 19:23:46 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:35458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGli-0005aX-J6
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 19:23:44 -0400
Received: by mail-pf1-x42d.google.com with SMTP id 67so3625866pfv.2
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 16:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=u1rNx+z6mfX9QOf0swX80lotmkBIQnUrgYcTWCQuCO0=;
 b=sdLmjGg43PO9lTKnLfky08DInjwny15HVABQVjuB2+JbRwSPAWwdTSSCHIeDcrYLnq
 uy6IyNtvnPYIDKyIH/jwuROtaiRgEUBDyNnYdbQjg0ZdPGmuN6tT36MqyIuxsYnvobos
 WNvPW/uldIAyyYC9zJ1yT6eTmt0d5ekBOTvU2R3ttas2nKByR7ItRezMF+XPlGbLHdWj
 ozRm2zgMq8aOOhveYdCcY6AYHqYJV4fKWHTpobuHgpqGWGfE0KIwJnHt5EQ8dMQd43ge
 PyIpKMbk8gwykZRtztzhpNQ8OiQY3pXTySDr2D36sZbnzXDgIKVmbYJRVmd+iRFkpbRm
 DxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=u1rNx+z6mfX9QOf0swX80lotmkBIQnUrgYcTWCQuCO0=;
 b=j9aAhQgKmw7uKPadAYIZBlO/J7+JkuEJBCDPast3emJCTZPsYSCRZziZpop07IO1sg
 7pUse8O0CqjXPJi9EQF81B29w5S5KBzmhx8e3VBPrI37H0WJJUbXhTBID/aB7ddZD1tx
 aZw60EUgKrVsJhS3LhiBAw7SG7kwZkTVwPDVSk1FGhGoYbSbc9Od4iQk8gYzXMJ4HOMG
 y9VLYh2qnHDy9BvK5LXlvTAtafDvwkZdUwGanzwEzA6xr7jvorz9vlIEPLdFoOzhhQ4y
 vp673ZWiKfsfeXGq720Do8BuGQ3oOzmf7FBUnwGNCxt2aqlGz2aCB9U3t+AF9aGmLtPi
 CGEQ==
X-Gm-Message-State: ACgBeo3X+hLHvMzr0DFRENronxZD/NyPtdJC9Wz6rlNYgjKq1F6jp9pU
 dAiwYIep+xkcv1rw8PohVRk9kQ==
X-Received: by 2002:a63:6a46:0:b0:41a:3e67:67cd with SMTP id
 f67-20020a636a46000000b0041a3e6767cdmr18773197pgc.94.1661210621087; 
 Mon, 22 Aug 2022 16:23:41 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa79731000000b0052d3899f8c2sm3809112pfg.4.2022.08.22.16.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:23:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 01/17] accel/tcg: Remove PageDesc code_bitmap
Date: Mon, 22 Aug 2022 16:23:22 -0700
Message-Id: <20220822232338.1727934-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822232338.1727934-1-richard.henderson@linaro.org>
References: <20220822232338.1727934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZqxlDdg875Tf

This bitmap is created and discarded immediately.
We gain nothing by its existence.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 78 ++-------------------------------------
 1 file changed, 4 insertions(+), 74 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index e44f40b234..34bf296250 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -102,21 +102,14 @@
 #define assert_memory_lock() tcg_debug_assert(have_mmap_lock())
 #endif
 
-#define SMC_BITMAP_USE_THRESHOLD 10
-
 typedef struct PageDesc {
     /* list of TBs intersecting this ram page */
     uintptr_t first_tb;
-#ifdef CONFIG_SOFTMMU
-    /* in order to optimize self modifying code, we count the number
-       of lookups we do to a given page to use a bitmap */
-    unsigned long *code_bitmap;
-    unsigned int code_write_count;
-#else
+#ifdef CONFIG_USER_ONLY
     unsigned long flags;
     void *target_data;
 #endif
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_SOFTMMU
     QemuSpin lock;
 #endif
 } PageDesc;
@@ -907,17 +900,6 @@ void tb_htable_init(void)
     qht_init(&tb_ctx.htable, tb_cmp, CODE_GEN_HTABLE_SIZE, mode);
 }
 
-/* call with @p->lock held */
-static inline void invalidate_page_bitmap(PageDesc *p)
-{
-    assert_page_locked(p);
-#ifdef CONFIG_SOFTMMU
-    g_free(p->code_bitmap);
-    p->code_bitmap = NULL;
-    p->code_write_count = 0;
-#endif
-}
-
 /* Set to NULL all the 'first_tb' fields in all PageDescs. */
 static void page_flush_tb_1(int level, void **lp)
 {
@@ -932,7 +914,6 @@ static void page_flush_tb_1(int level, void **lp)
         for (i = 0; i < V_L2_SIZE; ++i) {
             page_lock(&pd[i]);
             pd[i].first_tb = (uintptr_t)NULL;
-            invalidate_page_bitmap(pd + i);
             page_unlock(&pd[i]);
         }
     } else {
@@ -1197,11 +1178,9 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
     if (rm_from_page_list) {
         p = page_find(tb->page_addr[0] >> TARGET_PAGE_BITS);
         tb_page_remove(p, tb);
-        invalidate_page_bitmap(p);
         if (tb->page_addr[1] != -1) {
             p = page_find(tb->page_addr[1] >> TARGET_PAGE_BITS);
             tb_page_remove(p, tb);
-            invalidate_page_bitmap(p);
         }
     }
 
@@ -1246,35 +1225,6 @@ void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr)
     }
 }
 
-#ifdef CONFIG_SOFTMMU
-/* call with @p->lock held */
-static void build_page_bitmap(PageDesc *p)
-{
-    int n, tb_start, tb_end;
-    TranslationBlock *tb;
-
-    assert_page_locked(p);
-    p->code_bitmap = bitmap_new(TARGET_PAGE_SIZE);
-
-    PAGE_FOR_EACH_TB(p, tb, n) {
-        /* NOTE: this is subtle as a TB may span two physical pages */
-        if (n == 0) {
-            /* NOTE: tb_end may be after the end of the page, but
-               it is not a problem */
-            tb_start = tb->pc & ~TARGET_PAGE_MASK;
-            tb_end = tb_start + tb->size;
-            if (tb_end > TARGET_PAGE_SIZE) {
-                tb_end = TARGET_PAGE_SIZE;
-             }
-        } else {
-            tb_start = 0;
-            tb_end = ((tb->pc + tb->size) & ~TARGET_PAGE_MASK);
-        }
-        bitmap_set(p->code_bitmap, tb_start, tb_end - tb_start);
-    }
-}
-#endif
-
 /* add the tb in the target page and protect it if necessary
  *
  * Called with mmap_lock held for user-mode emulation.
@@ -1295,7 +1245,6 @@ static inline void tb_page_add(PageDesc *p, TranslationBlock *tb,
     page_already_protected = p->first_tb != (uintptr_t)NULL;
 #endif
     p->first_tb = (uintptr_t)tb | n;
-    invalidate_page_bitmap(p);
 
 #if defined(CONFIG_USER_ONLY)
     /* translator_loop() must have made all TB pages non-writable */
@@ -1357,10 +1306,8 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
     /* remove TB from the page(s) if we couldn't insert it */
     if (unlikely(existing_tb)) {
         tb_page_remove(p, tb);
-        invalidate_page_bitmap(p);
         if (p2) {
             tb_page_remove(p2, tb);
-            invalidate_page_bitmap(p2);
         }
         tb = existing_tb;
     }
@@ -1731,7 +1678,6 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
 #if !defined(CONFIG_USER_ONLY)
     /* if no code remaining, no need to continue to use slow writes */
     if (!p->first_tb) {
-        invalidate_page_bitmap(p);
         tlb_unprotect_code(start);
     }
 #endif
@@ -1827,24 +1773,8 @@ void tb_invalidate_phys_page_fast(struct page_collection *pages,
     }
 
     assert_page_locked(p);
-    if (!p->code_bitmap &&
-        ++p->code_write_count >= SMC_BITMAP_USE_THRESHOLD) {
-        build_page_bitmap(p);
-    }
-    if (p->code_bitmap) {
-        unsigned int nr;
-        unsigned long b;
-
-        nr = start & ~TARGET_PAGE_MASK;
-        b = p->code_bitmap[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG - 1));
-        if (b & ((1 << len) - 1)) {
-            goto do_invalidate;
-        }
-    } else {
-    do_invalidate:
-        tb_invalidate_phys_page_range__locked(pages, p, start, start + len,
-                                              retaddr);
-    }
+    tb_invalidate_phys_page_range__locked(pages, p, start, start + len,
+                                          retaddr);
 }
 #else
 /* Called with mmap_lock held. If pc is not 0 then it indicates the
-- 
2.34.1


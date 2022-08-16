Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2008868ejf;
        Tue, 16 Aug 2022 13:34:19 -0700 (PDT)
X-Received: by 2002:a05:6808:159e:b0:343:422e:7ac4 with SMTP id t30-20020a056808159e00b00343422e7ac4mr132530oiw.153.1660682059434;
        Tue, 16 Aug 2022 13:34:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682059; cv=none;
        d=google.com; s=arc-20160816;
        b=JOq1BGdYJfKB5goPakcWRwr3NC91qJZrMhn/eE1CjXwmDhK6H7XQmgdcZdNM0bwtpJ
         /pW5aErMSh9ayE6g86ElYz4FDCjgv0pr0t6QOxBdFsZAJtXhtRHDcCsJhyakjS7fJ6px
         xCcs05pgVx1tXRFY8XPq/Sdg0y3e+gpbJT+u4nT4mzCaxEjG6VrvhU707U/twHLYqJpz
         ScV3YDuE6cHJY9IrCDMMe8snVe2hZkYx8N1WsRXmiyasqLO9t0o1MOVdwdnPm1y3F2EL
         /JJHHbMNJFe0fggh/FkxBCtkAziT4ucMnTtQfhrGJiwbPK/PnE5+mWmjOrC1xZc9kkWH
         rFEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=P0kR5OrFfppQUIx2J+31AG0d7fIF32ATaR6GWxpzNsw=;
        b=WTXoeYJHDr6j1jZFbEhxI0j0f12qQjxagimUvpbwLxW2YMogl2i5ICIS03qbuesiiB
         tm7IJZcbDSMjq83xwpU53cegO0FqzFsCELygMZeOmnkAA1gNiZsuFjrAfw4R+t65iHNz
         aOa/81WNR69LrIQ+72wJMWxvbYeXB0+94aCaBMJsxOM8Q+wzngEN4tm5uQQbREcXZwT5
         PT05DvB5fThJ8EwzV4bg5Bz8Dq5z+E6uYK7mbjT3myZm3pPL2vP74l+unalX7XG9ysZf
         jXXae/jWEmytLImLULPBWhfm6+WZ849J0X0hjrtYdO+1qmsFNw/0PBUQwP72Bn9VOKEW
         lqXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jDu+jYz4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id fx10-20020a056870088a00b0010dc1dbd89fsor2298926oab.74.2022.08.16.13.34.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:34:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jDu+jYz4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=P0kR5OrFfppQUIx2J+31AG0d7fIF32ATaR6GWxpzNsw=;
        b=jDu+jYz4gf98nV/1Py6PijqPBrkbQAzfGS/cFjfdwSNAFZdyUOmJ2En7tO0oGXxkr4
         WzkUgsZcM4ZN1/OknmcVtsmhKUYr/xaoNcf07C9hql9nCJe6PDCKB9KZMOPSJBizHZV3
         tzJ7gw0MuGJ1ZHyiHFx4/moQEG0vCUKz9mctSSIUDOect58YRB7HS+F2kSUHhIprGprq
         soPGgzP1FL9rJLpDHaswRk+R1hsxvvaaPo0F1hOS1eD8ljgfQQR1TJO1gEQIZ68cJ+1C
         pqD2YTVK+k9T8aaIVBplD/6cGHBBX5yLcwzoQ8fZRfRPJJVSgRxpw1LAlJgfN4bhy49t
         48YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=P0kR5OrFfppQUIx2J+31AG0d7fIF32ATaR6GWxpzNsw=;
        b=MDxXHAZqy+zn5lQ9it3zfNghukKmw/zxdwvsKt4TsrOfqyn0HvGWs9gRoLSa2QxfYe
         IYtuLI7HB2vSDXz3b/tzggIqDvK+KPhpBF/tmW05epR6e/xGFB+BhPpdU8JAuy4wmwCH
         3fdeE/zAqLTvEDFtahTW/fSQrTK9i1jK5zYkZw2zJrSfhpa/iRecYwBFHsLYTIDvbq/4
         ZqvPgGqDlA58OmrIq2BDTemEb3lJF4WHspj0S8837v9ujkrvZ4yjHobqFkXpp+2bRmFr
         /B4ByK5qws5H8SFTpUtwTXiUv0pE94xZmtr+18uuwuUc+qFoEKNj+rvztruiZnnc8fOx
         Girw==
X-Gm-Message-State: ACgBeo1CBf/qaeWGFSLi/z+2x0L3kIVraHRCk4leaofF+xR5QVckFDcW
	s2R50Rj01NfjkKIwNc57dxOnUzCc
X-Google-Smtp-Source: AA6agR5VdOESR8O/KgNOBlcYWic/VDZmnT/z5DEGU4Qfz7pO1llaSCcWJjFlj379xHNriN4O0tikwg==
X-Received: by 2002:a05:6870:f69e:b0:100:fc8b:b3bf with SMTP id el30-20020a056870f69e00b00100fc8bb3bfmr159114oab.136.1660682059010;
        Tue, 16 Aug 2022 13:34:19 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:34:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 06/33] accel/tcg: Remove PageDesc code_bitmap
Date: Tue, 16 Aug 2022 15:33:33 -0500
Message-Id: <20220816203400.161187-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: dssDm3hOXa0k

This bitmap is created and discarded immediately.
We gain nothing by its existence.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 78 ++-------------------------------------
 1 file changed, 4 insertions(+), 74 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index b83161a081..298277a590 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -101,21 +101,14 @@
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
@@ -906,17 +899,6 @@ void tb_htable_init(void)
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
@@ -931,7 +913,6 @@ static void page_flush_tb_1(int level, void **lp)
         for (i = 0; i < V_L2_SIZE; ++i) {
             page_lock(&pd[i]);
             pd[i].first_tb = (uintptr_t)NULL;
-            invalidate_page_bitmap(pd + i);
             page_unlock(&pd[i]);
         }
     } else {
@@ -1196,11 +1177,9 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
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
 
@@ -1245,35 +1224,6 @@ void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr)
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
@@ -1294,7 +1244,6 @@ static inline void tb_page_add(PageDesc *p, TranslationBlock *tb,
     page_already_protected = p->first_tb != (uintptr_t)NULL;
 #endif
     p->first_tb = (uintptr_t)tb | n;
-    invalidate_page_bitmap(p);
 
 #if defined(CONFIG_USER_ONLY)
     /* translator_loop() must have made all TB pages non-writable */
@@ -1356,10 +1305,8 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
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
@@ -1736,7 +1683,6 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
 #if !defined(CONFIG_USER_ONLY)
     /* if no code remaining, no need to continue to use slow writes */
     if (!p->first_tb) {
-        invalidate_page_bitmap(p);
         tlb_unprotect_code(start);
     }
 #endif
@@ -1832,24 +1778,8 @@ void tb_invalidate_phys_page_fast(struct page_collection *pages,
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

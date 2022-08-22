Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1182761ejc;
        Mon, 22 Aug 2022 16:24:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5agREr79oVrV8sfjEt922WqymoT2oXTRfqz0MifaH6F5Y5BCHOpTVj/m0TsOwp99V3qPhw
X-Received: by 2002:a05:6214:2485:b0:496:d259:75ed with SMTP id gi5-20020a056214248500b00496d25975edmr9581082qvb.2.1661210675163;
        Mon, 22 Aug 2022 16:24:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661210675; cv=none;
        d=google.com; s=arc-20160816;
        b=JqTAQkfl8rRJLkED9JDOJJqZ6qOlJytIBlKWJh8OgJ0lrSRnTdf0ktq+NtRzHUdt8b
         vmoPzfV364cRIrQTI7GwmoEvIJrwfu7rrwCgWHcH22rhDaUcpMEEAXerf0rLje4tRIEn
         TBY4y9iwN8yEtyih3+pqAeK+kOMzhr+2+Vh6EFN5iIitLi8KC+ewVx/Cs74+JHV2/88s
         jKSQd8U1w7R+1NZB9Q2APM3LIAj1WH8N8Jzs1vy/nbdFKwK3Jw5YV4wooL9aoA2GCK6x
         D71of8RlProvTenEGdqufNUDpddVJlSp3YzobZQzycGUkCwban7aCmeliNlL5R/q4nxc
         teog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eMqYEALQlNCHryVYkn9ayeWYJiH16krDhtfDzKR3N+4=;
        b=Q25LjyxT75u/NL2gl60Xnq0a43Mafi6NyTIYeACzoXrfl72nIoIFXHNxPizv+CeHlu
         DmS5+Wlxf6umVlX8ZA37fCLGdRJjfu9Cjpaej/BlTiOFJMYzEs7IPtMwVsVm5lAnKRKa
         ku3gLz2rQazqHokOu8KQqjh7R1UutFsk0I4Z+1CPl8MvO+kbGY+0gY4N3q61STPkQZQi
         JgvtGpobTM3wV0NiWOUr6sU/stHZ7nRgYXTXF72+v7jqdPkaj+RW3c86jPHSnz664lL/
         xSipmRGMYJDNAkqzlO1Ql10QvLMgM9TmBrzFY15z258tlGogCoszB3l7UV24a6Camfmk
         lFRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TYQBcK0M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2-20020ac84442000000b00342ead03525si4776755qtn.130.2022.08.22.16.24.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 16:24:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TYQBcK0M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQGmY-0005wY-Hk
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 19:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGlp-0005cv-6y
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 19:23:49 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:46051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGlj-0005al-Ho
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 19:23:45 -0400
Received: by mail-pl1-x636.google.com with SMTP id u22so11277123plq.12
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 16:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=eMqYEALQlNCHryVYkn9ayeWYJiH16krDhtfDzKR3N+4=;
 b=TYQBcK0MW3DxORsvXbqYjWpE/UmT9qOmwhv9wkrUvhF0j5rA6d5pKvtPzWcYl+9L/T
 qAvV1jms+Lx3KVQ1w0oVJOTP6V9RgCED3VI7DW0Wmr41+DVB7iFnL0tB2rdVZMZZELP1
 GOqwBPzN1BPfoBDd3CMGf5t88lKe44qPn0Z8dezGE4QVRb3d4BE/2NgF/UkJTI53ZcHe
 TFt8Ynfifin+b5h9vfNuNvUP5sYDFYJSRHX2NDV7AzMKWqmXGfnVDITBA2K6vmUbeuBS
 6fkEcoSnRs3k6Nliqc6XHg9gL08+hW76uj7rXLSDwz5pl9p2DdWXpeAf1Irj3GzXGq13
 PUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=eMqYEALQlNCHryVYkn9ayeWYJiH16krDhtfDzKR3N+4=;
 b=izLYhVVZzp1tE+LO8TTqdF0fOJqSnJqAsYHTy8vwLM4OnM7K3pT3cD9zkbrhc3G5tY
 pXe1C0zLbqV0GCfVf7K2AIRzNvfv7cU7ZEJBxKcpI07K6rlCIaZFhZhx8o5FY7/sz59C
 o7j0IU3wal2kh4pRx7SFVzjjDtR/KDyIg3d9dzLddoUN7x/94mFwMnOzGbcODx81Lcsv
 3HgneYBZ8eiTaN2mYu6DSlfGOod3XLysM1p4/D1JiFpUkXAMIQfU1IUd9zL2tkkXmuLa
 6fAw1sXZLtMUUCsTMDkMk7Lrt7zEVDyszeu4SHFlE0WS017CPmllH1GbobuZO+fVJ7Sh
 OmsA==
X-Gm-Message-State: ACgBeo31GJRFFIeZUos0Av87Cz9jHfsyGS4MtbgflhGylaWT2xtGAmUz
 K2QVFB+lJb6Hu0pa07ovlujimW36jClXMg==
X-Received: by 2002:a17:902:7b95:b0:172:9dc3:6c12 with SMTP id
 w21-20020a1709027b9500b001729dc36c12mr22486423pll.94.1661210622245; 
 Mon, 22 Aug 2022 16:23:42 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa79731000000b0052d3899f8c2sm3809112pfg.4.2022.08.22.16.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:23:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 02/17] accel/tcg: Use bool for page_find_alloc
Date: Mon, 22 Aug 2022 16:23:23 -0700
Message-Id: <20220822232338.1727934-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822232338.1727934-1-richard.henderson@linaro.org>
References: <20220822232338.1727934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
X-TUID: wcnb/kPorckn

Bool is more appropriate type for the alloc parameter.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 34bf296250..a8f1c34c4e 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -465,7 +465,7 @@ void page_init(void)
 #endif
 }
 
-static PageDesc *page_find_alloc(tb_page_addr_t index, int alloc)
+static PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc)
 {
     PageDesc *pd;
     void **lp;
@@ -533,11 +533,11 @@ static PageDesc *page_find_alloc(tb_page_addr_t index, int alloc)
 
 static inline PageDesc *page_find(tb_page_addr_t index)
 {
-    return page_find_alloc(index, 0);
+    return page_find_alloc(index, false);
 }
 
 static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
-                           PageDesc **ret_p2, tb_page_addr_t phys2, int alloc);
+                           PageDesc **ret_p2, tb_page_addr_t phys2, bool alloc);
 
 /* In user-mode page locks aren't used; mmap_lock is enough */
 #ifdef CONFIG_USER_ONLY
@@ -651,7 +651,7 @@ static inline void page_unlock(PageDesc *pd)
 /* lock the page(s) of a TB in the correct acquisition order */
 static inline void page_lock_tb(const TranslationBlock *tb)
 {
-    page_lock_pair(NULL, tb->page_addr[0], NULL, tb->page_addr[1], 0);
+    page_lock_pair(NULL, tb->page_addr[0], NULL, tb->page_addr[1], false);
 }
 
 static inline void page_unlock_tb(const TranslationBlock *tb)
@@ -840,7 +840,7 @@ void page_collection_unlock(struct page_collection *set)
 #endif /* !CONFIG_USER_ONLY */
 
 static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
-                           PageDesc **ret_p2, tb_page_addr_t phys2, int alloc)
+                           PageDesc **ret_p2, tb_page_addr_t phys2, bool alloc)
 {
     PageDesc *p1, *p2;
     tb_page_addr_t page1;
@@ -1290,7 +1290,7 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
      * Note that inserting into the hash table first isn't an option, since
      * we can only insert TBs that are fully initialized.
      */
-    page_lock_pair(&p, phys_pc, &p2, phys_page2, 1);
+    page_lock_pair(&p, phys_pc, &p2, phys_page2, true);
     tb_page_add(p, tb, 0, phys_pc & TARGET_PAGE_MASK);
     if (p2) {
         tb_page_add(p2, tb, 1, phys_page2);
@@ -2219,7 +2219,7 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
     for (addr = start, len = end - start;
          len != 0;
          len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
-        PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, 1);
+        PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, true);
 
         /* If the write protection bit is set, then we invalidate
            the code inside.  */
-- 
2.34.1


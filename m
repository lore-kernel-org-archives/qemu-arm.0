Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2008901ejf;
        Tue, 16 Aug 2022 13:34:23 -0700 (PDT)
X-Received: by 2002:a4a:dc04:0:b0:448:9728:5e15 with SMTP id p4-20020a4adc04000000b0044897285e15mr6850000oov.77.1660682063069;
        Tue, 16 Aug 2022 13:34:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682063; cv=none;
        d=google.com; s=arc-20160816;
        b=UCbG4f0ybHat+rdv7wwUNIZ1wX5958c28gGADdcrptXac78eY4jXuGoknw68hpN1aY
         iHi/+ZjL+ewlBBN7f/0klSxG+IT0lTpzonOXVeBpfYRsSpeZn4eTsX1bqkYz/pIo+dd5
         cTZ7z7vI7GHZ3QaoyAGuyJLu/blZ60msYX/BQ48hHR4PmjhF7iBr1Vg9gXUNTVd5lsvZ
         tSEkKgCQ2mu60BSIavWvH2+xLtgOsCE6+1TBkw7BzTXfM9u+59LKnNowv+mV7uHPGUAq
         ilEWY9neprx5YlQU7TK1TrUmSOI5Slyiu/qnu030EgimRR3NlfPHR9Od4wWo7krg4P8B
         eaJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GX62IFzgxiLc3YqrfYpimUBcYuQPnU8/+Qkb9r74BEo=;
        b=OWkzEms+hb6L2er1q6SCvJEEZzaSYHzrAP8mXb+NsHYCTpHHJCQ3eB2wFMJpV6If8m
         av8Zk2iYsDT0jRWdoRu8cz7AtkcurhbOtQwbijjIfF4hQ0AR6+J/PBO8IkeJXaZ9AlAK
         gtxyfR+NxFuzFEMMHMOqq/P7dXBIqqWRT4bVXkEVFAfVmdr0rDFOHrIlIDrScEiN/w0o
         2r+d7/O5RCQWEvdqvLCViSy0R4aBIzByDieHXNCdSNFOwHKNUz0Gu8xB9fUVv/Y0HSb5
         md5cJcQvvtgj7RB8B1qvU1PiI3zZ8cVDHl4+X8tQglWMXYx/6kn78e4GPlCLT3TZCCF1
         A+5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Qhwl/nzZ";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id pd18-20020a0568701f1200b0010c4558e2e8sor2315943oab.7.2022.08.16.13.34.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:34:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Qhwl/nzZ";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=GX62IFzgxiLc3YqrfYpimUBcYuQPnU8/+Qkb9r74BEo=;
        b=Qhwl/nzZib4gYpu3K7s4UGLiwy/W1ffbovnMmf38xL0AKNyDPF6F9Pw13jRKrZtMM+
         sdwwhoRpFft74CLbkgsu8fu2GqGn3ykvrOZf8DzZn9OTqEwY6SuqVbBogZAHXiDGJ5nK
         jzphjqIOu95lJWybZTp1LNCkiAD5R/CLrIzVrwt/c3HwhTzSMIRcijJKfhQ4mSm2laEh
         L7jM4JBhp5gH7jq2gJmU/EjNALhYI/1zi9XRcEaCC9ToqbV+LPSSrEpobYs3kFlzkwbD
         GutM6EnvpPkGhJkbAotSNv4xRe+OghDRNxtZBL8oD0Pd3K4cgLcpg0zcB82FviOsx+1u
         LWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=GX62IFzgxiLc3YqrfYpimUBcYuQPnU8/+Qkb9r74BEo=;
        b=UyA84UGPwKZ8OV3s+xRHBdToyuP9g5Dgppt1+eFxj3vyavjkiX8eV53gSgLXlispgu
         I3QyZK9Wf28zIdsqFDg99azAu5DdaxIx83yYsaTSOycNPcihAMgwrSJyWM/rEFDSH2lw
         QQofKdPa96Qf4UKFyNlTVwj2Tga/VIUzz1LRaRRU5gkvhweWRVicCjHlLndTSNZ0U78k
         mm/17xzJRwm1IwngbUqR+IMBbLEguSvwUODkG/sXz1dtPEemM+UPqphywCFJVPJZBXjI
         zvMQPvVmeYiYT4Obb4/XOUmLjTSiHgWON0r7QsyjgIc4wRWK8XEKBtdwplWgsWDAWSwB
         p/Kg==
X-Gm-Message-State: ACgBeo1xiXqs/Z3aymdqbmyC/pQlxP8JE1OnqCxZN3cUka00XwjZRCrf
	LkwdShrBmh1ugtk/plrAYczg/R5T
X-Google-Smtp-Source: AA6agR6ibQzDXEqwKBDBrohPkPd5ixQ4nVnm8ylyS/+b+wCOjny0cwZi2Z4lGkytmtl7nX76yYP51Q==
X-Received: by 2002:a05:6870:b148:b0:112:cfe1:5062 with SMTP id a8-20020a056870b14800b00112cfe15062mr137113oal.297.1660682062731;
        Tue, 16 Aug 2022 13:34:22 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:34:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 07/33] accel/tcg: Use bool for page_find_alloc
Date: Tue, 16 Aug 2022 15:33:34 -0500
Message-Id: <20220816203400.161187-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: r120i/L+3NyO

Bool is more appropriate type for the alloc parameter.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 298277a590..596029b26d 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -464,7 +464,7 @@ void page_init(void)
 #endif
 }
 
-static PageDesc *page_find_alloc(tb_page_addr_t index, int alloc)
+static PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc)
 {
     PageDesc *pd;
     void **lp;
@@ -532,11 +532,11 @@ static PageDesc *page_find_alloc(tb_page_addr_t index, int alloc)
 
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
@@ -650,7 +650,7 @@ static inline void page_unlock(PageDesc *pd)
 /* lock the page(s) of a TB in the correct acquisition order */
 static inline void page_lock_tb(const TranslationBlock *tb)
 {
-    page_lock_pair(NULL, tb->page_addr[0], NULL, tb->page_addr[1], 0);
+    page_lock_pair(NULL, tb->page_addr[0], NULL, tb->page_addr[1], false);
 }
 
 static inline void page_unlock_tb(const TranslationBlock *tb)
@@ -839,7 +839,7 @@ void page_collection_unlock(struct page_collection *set)
 #endif /* !CONFIG_USER_ONLY */
 
 static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
-                           PageDesc **ret_p2, tb_page_addr_t phys2, int alloc)
+                           PageDesc **ret_p2, tb_page_addr_t phys2, bool alloc)
 {
     PageDesc *p1, *p2;
     tb_page_addr_t page1;
@@ -1289,7 +1289,7 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
      * Note that inserting into the hash table first isn't an option, since
      * we can only insert TBs that are fully initialized.
      */
-    page_lock_pair(&p, phys_pc, &p2, phys_page2, 1);
+    page_lock_pair(&p, phys_pc, &p2, phys_page2, true);
     tb_page_add(p, tb, 0, phys_pc & TARGET_PAGE_MASK);
     if (p2) {
         tb_page_add(p2, tb, 1, phys_page2);
@@ -2224,7 +2224,7 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
     for (addr = start, len = end - start;
          len != 0;
          len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
-        PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, 1);
+        PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, true);
 
         /* If the write protection bit is set, then we invalidate
            the code inside.  */
-- 
2.34.1

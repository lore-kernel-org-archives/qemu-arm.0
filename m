Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp511887lfo;
        Wed, 3 Feb 2021 11:48:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFpMlBy/4iOe5NMwQDnfe7YM6V/xyhkOlAWYLhyfmUe1l9A5wY7rHh8Mw+jLFqqlHrTeA5
X-Received: by 2002:a25:ccd1:: with SMTP id l200mr6670863ybf.520.1612381692770;
        Wed, 03 Feb 2021 11:48:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612381692; cv=none;
        d=google.com; s=arc-20160816;
        b=ciJdZpMcVS1aT982FfZ0hIn2VDIwbhXUG2ZfS6K7hA5sh2Lb/5Hy5uJl31zbvGi2ZC
         +dM9phvC60DYy4s/Fx8lYZCJsrk/fzG8bLiAMKDLJvsDGXCot/37y4AdR9atM4CqB0Ll
         qomNLvDgQZ66sKHTY+rHfRhimYFoSNPArr2ABJpfAOM6YOvBVtPrxOHd2Pu5ZTojcPhF
         r498T8Z0l/0EGY5gfLfUls14Kv6Fui85sTNA2hDbNYL/KVa7iMm7FC79NBca4apqwVbL
         nR36URnkIxQEI1wcdMeogCY4UGBr8dFC3Pu0ceeOgMBXNWkVoOLiwGZvvvFgJvC6Jjix
         0hog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9J8C2yhZQHwcHgCFCp6aWoyOwMetLwuIKJgxUSgtqBU=;
        b=qjklg7sJ74nZYKxGh3t6ie9kqkO0rUfyMgM/UEM65kVhNGoBUqX6WWbr+o/YMGHFHF
         /qRLzlEDUewvaUUHRgjIx5ZNQn+E9NCthaJwStOCGj69YwZGDSBHCkz6P4QWuA2uvWBW
         ML7Di6hYpEpWZRJHqv63z3hYcR2X/aX1NFsqgFpjg57xaX/SlORfkRUpEBWykaye/lVP
         gizWDwThprbSGGyekA98h3zDw6AvD2JTvM0HSZxrAsFUcncgQxJdAeDaUe4sV9nrEj1p
         H5vQ5QNyoDsezESwOlhcLju/M/3McdSDBJ434mTcL4sAcB52E1NaO0p4HoF2B99LfI3z
         8EZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ad/X3Pw/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a191si3654496ybg.312.2021.02.03.11.48.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 11:48:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ad/X3Pw/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7O8K-0008Fe-1f
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 14:48:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NP3-0007jM-Dz
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 14:01:25 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOs-0001qA-5Q
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 14:01:25 -0500
Received: by mail-pg1-x52b.google.com with SMTP id b21so379855pgk.7
 for <qemu-arm@nongnu.org>; Wed, 03 Feb 2021 11:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9J8C2yhZQHwcHgCFCp6aWoyOwMetLwuIKJgxUSgtqBU=;
 b=ad/X3Pw/RzxAHyJ4ZfjzwUohqg7OPUzNVN4iwieT1iUQdqsL6C/fnKmFr6eCZObKY5
 pcf51OakGnhSF4m3lofyRIB3VAgXpizFmHWV5spODDXS84u5oa66Q9eTPqRLlOuNLter
 sGRCvCaYibowG09ha9Q5cU2eN5I0cimwa3lR1fnyP2JQjYFAIGKiIuRJyiViSU0vtWvZ
 HAUvXNSoWGKwT38A1EMePqWPXh+j59Z+/LS6haaUNbfR8o9CreGQnMlaknSCl3U8basp
 cLohd4GlpO6vkmptJeuj2bIq37fooYM4Fe2e2LFNcuPiE0M1ShabL+EyFZvlnxwscZNJ
 pceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9J8C2yhZQHwcHgCFCp6aWoyOwMetLwuIKJgxUSgtqBU=;
 b=KX6hLPTxpC8ZIInmV8miHh7Kpw5PE/twCmjLjeRw5yyIjQimySccrZ103p6JNBQ50z
 12a/FMZvag+j5iQaMfxnPmE/bmCOYESucrmAEQeDctZ0NjGxeJszidxzzfGNM/et+hym
 a4UQQ74FM3eodvMqWfZQ/iibAn59z0yeZu0XoI5vZU5N12SvlPUz/0C8MLg+eoey44Ui
 sUDpGFc/kZ/xljdG/guS1AEGCzYHDsZEizjnFdHmtabELpYQoGj05xkfQ4BIhS5q2ZLl
 79l1e+2lNvZfIfQdBjclO4Ebpo8Z0bXW2q7qnuB8HmrEysKhW4f0hasazgUohEh1Larq
 dDkw==
X-Gm-Message-State: AOAM532ycuwfz5q3qJCX6CrUvyslXLRfQd5ukCt91/ZbihZX02tLSL12
 efUmfs+gzx6UR0z40W+VtFTuKw==
X-Received: by 2002:a65:5b47:: with SMTP id y7mr5080819pgr.221.1612378872795; 
 Wed, 03 Feb 2021 11:01:12 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:01:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 29/31] target/arm: Add allocation tag storage for user mode
Date: Wed,  3 Feb 2021 09:00:08 -1000
Message-Id: <20210203190010.759771-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qbeso9wuXlwz

Use the now-saved PAGE_ANON and PAGE_MTE bits,
and the per-page saved data.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index d55f8d1e1e..1c569336ea 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -78,8 +78,33 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
                                    int tag_size, uintptr_t ra)
 {
 #ifdef CONFIG_USER_ONLY
-    /* Tag storage not implemented.  */
-    return NULL;
+    uint64_t clean_ptr = useronly_clean_ptr(ptr);
+    int flags = page_get_flags(clean_ptr);
+    uint8_t *tags;
+    uintptr_t index;
+
+    if (!(flags & (ptr_access == MMU_DATA_STORE ? PAGE_WRITE : PAGE_READ))) {
+        /* SIGSEGV */
+        arm_cpu_tlb_fill(env_cpu(env), ptr, ptr_size, ptr_access,
+                         ptr_mmu_idx, false, ra);
+        g_assert_not_reached();
+    }
+
+    /* Require both MAP_ANON and PROT_MTE for the page. */
+    if (!(flags & PAGE_ANON) || !(flags & PAGE_MTE)) {
+        return NULL;
+    }
+
+    tags = page_get_target_data(clean_ptr);
+    if (tags == NULL) {
+        size_t alloc_size = TARGET_PAGE_SIZE >> (LOG2_TAG_GRANULE + 1);
+        tags = page_alloc_target_data(clean_ptr, alloc_size);
+        assert(tags != NULL);
+    }
+
+    index = extract32(ptr, LOG2_TAG_GRANULE + 1,
+                      TARGET_PAGE_BITS - LOG2_TAG_GRANULE - 1);
+    return tags + index;
 #else
     uintptr_t index;
     CPUIOTLBEntry *iotlbentry;
-- 
2.25.1


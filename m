Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp629606lfr;
        Fri, 16 Apr 2021 11:31:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7iloeOE1/HceioFUm+ZiRt4X4CKhMEIdoZkMmiN2X9mWHXkEQMxtks6boJNnomYbO4NG8
X-Received: by 2002:a05:6638:2508:: with SMTP id v8mr5180110jat.133.1618597906092;
        Fri, 16 Apr 2021 11:31:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618597906; cv=none;
        d=google.com; s=arc-20160816;
        b=QOM4ITZCzN51UDXemK5U6Yn9dvz1FckAHIgGX3ih+GKRWMMFjtlyl6GeChttmO2ndx
         YH8dphlnkYr7WOgSyN2NFUCuMWebo3GRXi7oioGixTfS+JnvCFsJmwclQIfpOvlluVzY
         mmHDPuRE1D1tlMs6o33a+ZZO7c5wHvRF1uJPrMBQPXsFhFn6f+0FMo/F4nT/I3IzH522
         in1fyl0t6HERT15WnN9xsZCqvJObqbt0HSWJBt7l5zmpV5aLJwBtJDLuBDiLWQy6R1T8
         or9KNQ2qHOmlH6tQ9jRL8SnnkIaXr+Bbj7GXZajjVCRYRjlT1K/Lf8v5HRQweaGKyAKc
         5bSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3mgQ/AwHCdEqMYqaEDNteTClCiB0ojdl1YSqbUogses=;
        b=QB4jyj3qaQ5kr5VnW79W/QAI1nwwxHgw/FQxwR9nKlCPlMJ71o/qGynV3fFdAOHo56
         P22j/SUmWlvGx5zYKlpV6X0nEcTxfUuLbl9u6mXn8rDMzNUwLcq0q0P6/RhrPtyakQ3F
         KNCvbZkGawanLFuSFT8jzBPmJSjJElHa49NgBOqIjrsw27x8mzwwj6QIng6+qdyE7ufZ
         Yh+Q3OVqasyO0uoAz1R5Q3RyuZgjDldSMP3FG0FkCxka0NSazg3AQbCNO5Vxb17iMmJX
         gaFxkXCuO4EM9CE8OJ1ipAl24rmL31AzWnTd/y06eZnmLlsCj+n5Q/Yay718hek2ZQut
         y+Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=siN3rkA3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e2si8015185ioc.23.2021.04.16.11.31.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 11:31:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=siN3rkA3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXTFp-0000gd-7n
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 14:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXTFJ-0000fO-8d
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 14:31:13 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:46914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXTFH-0003ft-45
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 14:31:13 -0400
Received: by mail-pl1-x633.google.com with SMTP id m18so12228229plc.13
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 11:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3mgQ/AwHCdEqMYqaEDNteTClCiB0ojdl1YSqbUogses=;
 b=siN3rkA3h67ankImk12bnn75NCtHcRb4DATeXC5SzSqwUFLawttAYPK5bRavOpA13r
 pX9Rvu879BFDZe0erNNEuNZU/n8tz6jIVJ89gOyn2/saUafpTTOnd6x0wGu0z23Kt+B8
 TJ2AXcQpgv7u5FE0ZeYHoGApXXHAlOp8hEo+pYqP8fydAYSI45cFyDlUgaB5tlO/rKm3
 hGFNTrx03fbLnc+fgO70+/xk4Jhc0q/QaYXYNbmfjAAVpx52MoE5sEvIzE5ild2fZIAQ
 h6pfUuTMUboJKiI5dlBp6a/ef4ze3PVqK3s/uz2Y8v25S0kwomTRISlFHb79X1Kkryay
 YZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3mgQ/AwHCdEqMYqaEDNteTClCiB0ojdl1YSqbUogses=;
 b=Ux48pSoLrxooNvmDhvIpCb+4lqxkN23UWtajm8ACdB7mfvKkRpsksEUXrofsjojI6K
 pXaLvXUOx6IApQJsMF2SONtpgWi3tDAME+J24wduAqDe523nsZ5utPpmLv/QxAonlzXf
 0mPKMVHydIGCzuBMNmXrMxKbTblh9rbItf7UVhjRd9vkO36zl8XTyrOacrEjynDYiTZ6
 1IsK2wATMSZbMXxkXZ2mGyemHgQYDS/JEofaVxbWsfdaEPK+bGS2Ab4mZSpFEA4WK45C
 K5fWuORWTRW1R05g0pI4B5ZVVD+91gG443qwHrLnT5ouj4BCEI8j54IdPGtKxXMfe+Mu
 xvvQ==
X-Gm-Message-State: AOAM533iyNCSzex2W6ChQTzz+NnnG5S6+WBA/1ktvbp6mAJGM4sCUS2O
 8/j8Su9U0oCDRUrHpX4xeIQeRgZBBywcTw==
X-Received: by 2002:a17:902:5988:b029:ea:ac90:529b with SMTP id
 p8-20020a1709025988b02900eaac90529bmr11238207pli.78.1618597869477; 
 Fri, 16 Apr 2021 11:31:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id p18sm3057307pju.3.2021.04.16.11.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 11:31:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/9] target/arm: Fix mte_checkN
Date: Fri, 16 Apr 2021 11:30:58 -0700
Message-Id: <20210416183106.1516563-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416183106.1516563-1-richard.henderson@linaro.org>
References: <20210416183106.1516563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xrC/V5XggjwE

We were incorrectly assuming that only the first byte of an MTE access
is checked against the tags.  But per the ARM, unaligned accesses are
pre-decomposed into single-byte accesses.  So by the time we reach the
actual MTE check in the ARM pseudocode, all accesses are aligned.

Therefore, the first failure is always either the first byte of the
access, or the first byte of the granule.

In addition, some of the arithmetic is off for last-first -> count.
This does not become directly visible until a later patch that passes
single bytes into this function, so ptr == ptr_last.

Buglink: https://bugs.launchpad.net/bugs/1921948
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 38 +++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 8be17e1b70..c87717127c 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -757,10 +757,10 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
                     uint64_t ptr, uintptr_t ra)
 {
     int mmu_idx, ptr_tag, bit55;
-    uint64_t ptr_last, ptr_end, prev_page, next_page;
-    uint64_t tag_first, tag_end;
-    uint64_t tag_byte_first, tag_byte_end;
-    uint32_t esize, total, tag_count, tag_size, n, c;
+    uint64_t ptr_last, prev_page, next_page;
+    uint64_t tag_first, tag_last;
+    uint64_t tag_byte_first, tag_byte_last;
+    uint32_t total, tag_count, tag_size, n, c;
     uint8_t *mem1, *mem2;
     MMUAccessType type;
 
@@ -779,29 +779,27 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
 
     mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
     type = FIELD_EX32(desc, MTEDESC, WRITE) ? MMU_DATA_STORE : MMU_DATA_LOAD;
-    esize = FIELD_EX32(desc, MTEDESC, ESIZE);
     total = FIELD_EX32(desc, MTEDESC, TSIZE);
 
     /* Find the addr of the end of the access, and of the last element. */
-    ptr_end = ptr + total;
-    ptr_last = ptr_end - esize;
+    ptr_last = ptr + total - 1;
 
     /* Round the bounds to the tag granule, and compute the number of tags. */
     tag_first = QEMU_ALIGN_DOWN(ptr, TAG_GRANULE);
-    tag_end = QEMU_ALIGN_UP(ptr_last, TAG_GRANULE);
-    tag_count = (tag_end - tag_first) / TAG_GRANULE;
+    tag_last = QEMU_ALIGN_DOWN(ptr_last, TAG_GRANULE);
+    tag_count = ((tag_last - tag_first) / TAG_GRANULE) + 1;
 
     /* Round the bounds to twice the tag granule, and compute the bytes. */
     tag_byte_first = QEMU_ALIGN_DOWN(ptr, 2 * TAG_GRANULE);
-    tag_byte_end = QEMU_ALIGN_UP(ptr_last, 2 * TAG_GRANULE);
+    tag_byte_last = QEMU_ALIGN_DOWN(ptr_last, 2 * TAG_GRANULE);
 
     /* Locate the page boundaries. */
     prev_page = ptr & TARGET_PAGE_MASK;
     next_page = prev_page + TARGET_PAGE_SIZE;
 
-    if (likely(tag_end - prev_page <= TARGET_PAGE_SIZE)) {
+    if (likely(tag_last - prev_page <= TARGET_PAGE_SIZE)) {
         /* Memory access stays on one page. */
-        tag_size = (tag_byte_end - tag_byte_first) / (2 * TAG_GRANULE);
+        tag_size = ((tag_byte_last - tag_byte_first) / (2 * TAG_GRANULE)) + 1;
         mem1 = allocation_tag_mem(env, mmu_idx, ptr, type, total,
                                   MMU_DATA_LOAD, tag_size, ra);
         if (!mem1) {
@@ -815,9 +813,9 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
         mem1 = allocation_tag_mem(env, mmu_idx, ptr, type, next_page - ptr,
                                   MMU_DATA_LOAD, tag_size, ra);
 
-        tag_size = (tag_byte_end - next_page) / (2 * TAG_GRANULE);
+        tag_size = ((tag_byte_last - next_page) / (2 * TAG_GRANULE)) + 1;
         mem2 = allocation_tag_mem(env, mmu_idx, next_page, type,
-                                  ptr_end - next_page,
+                                  ptr_last - next_page + 1,
                                   MMU_DATA_LOAD, tag_size, ra);
 
         /*
@@ -838,15 +836,13 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
     }
 
     /*
-     * If we failed, we know which granule.  Compute the element that
-     * is first in that granule, and signal failure on that element.
+     * If we failed, we know which granule.  For the first granule, the
+     * failure address is @ptr, the first byte accessed.  Otherwise the
+     * failure address is the first byte of the nth granule.
      */
     if (unlikely(n < tag_count)) {
-        uint64_t fail_ofs;
-
-        fail_ofs = tag_first + n * TAG_GRANULE - ptr;
-        fail_ofs = ROUND_UP(fail_ofs, esize);
-        mte_check_fail(env, desc, ptr + fail_ofs, ra);
+        uint64_t fault = (n == 0 ? ptr : tag_first + n * TAG_GRANULE);
+        mte_check_fail(env, desc, fault, ra);
     }
 
  done:
-- 
2.25.1


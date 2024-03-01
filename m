Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1309493eja;
        Fri, 1 Mar 2024 12:43:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXoW/BzhdLhKtIxOr/bm2Y5HqovSbvQ0HcgZB60SBXjnxnPHA6YIiaFYyeQyFs7UHT+p1zWZnfkd8vQcBSVM2VXsB3OVmeH
X-Google-Smtp-Source: AGHT+IGsHsl8kH12u7axZFKcHRjkORJp9MGYEggHRpoHE07zpu/8Y8VfUyZoN2mhuhzdchRWleN6
X-Received: by 2002:a05:6808:d4d:b0:3c1:d329:a55c with SMTP id w13-20020a0568080d4d00b003c1d329a55cmr3382383oik.27.1709325788534;
        Fri, 01 Mar 2024 12:43:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709325788; cv=none;
        d=google.com; s=arc-20160816;
        b=XLQd8vM8IrBoHEzzF/NhLWXD7QMqPaeMAacfz3pHmmfHI9qP050KQJr3WitaPUYLPx
         wbFfVMR4eWftFp/6qi0LIVp/AuxojnwwUn+dtkeUnzCB/5xTM0/etlaymskbvatIN//8
         pzNQb7inXhD4EsrNe4492odCusXYDADtPRSPaYwqjZ5SGBFjcT3emvktTfNBw1ZqIt+6
         j+xmQbnugZO9qyd3Ky6t4o63f5P4Xt4DgeYNKqr3Y8XcW+MZipfX/MArqROwt+QGOW1q
         NnGD8FSUAcSky1E/JfX0p5vYySXvpM3M7FPosEMUsqh7A6Op7+N5spqdcae9qScWFYiv
         bfvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ODF936SZPk4uxaAkeX8YtobtmAxstAcsRTqY9d2kdho=;
        fh=OZQBfL75rC14cCDy3q+1fYHCs9KjWAQ7ZJ3hTfS+5lQ=;
        b=rgokXJag/2DUDOlzuP6S6jo3IwEeTfdo/ojPVX4LuaHoloEr8iuVCE/V7NgZq27QzB
         nI8Db9qV1KQcCxZQVuzbmgA7DE3ams5+zBkrawBRMy/I87DFjrwQYwHXgH83Inf7Vanf
         SAFb3uPAlQG5E+nAGJ2+bw6eL7fLI4VSeCkvAYk0vhxFfita30XhfcLg9qgU2kuWYBfu
         9yddvZh0U0wOuN8En8JQ1nb/e1DLMj72Cdb/cxWG4WA2x64+gqG7jemkuF/pYjvP4h9o
         V3bYoLd9Uz/Hqa9Plp+7eKJZshh7p9BxF6xb8gCLXad++pZ7cn929PeTVatdaByrWVJX
         zmiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R223uc9M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14-20020ac8708e000000b0042c74f61419si4061247qto.634.2024.03.01.12.43.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 12:43:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R223uc9M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rg9h8-0001zT-2c; Fri, 01 Mar 2024 15:41:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rg9h5-0001xl-PI
 for qemu-devel@nongnu.org; Fri, 01 Mar 2024 15:41:23 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rg9h2-0006zQ-PH
 for qemu-devel@nongnu.org; Fri, 01 Mar 2024 15:41:22 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-29a858a0981so1930057a91.0
 for <qemu-devel@nongnu.org>; Fri, 01 Mar 2024 12:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709325679; x=1709930479; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ODF936SZPk4uxaAkeX8YtobtmAxstAcsRTqY9d2kdho=;
 b=R223uc9MVQ+MSeZaIh1WORiy8/asr/8YzgsueEhJUF/h5J2WfvdtryfznPN6MOdhK1
 oFAkzNqoWGbcBGfCMtqXTn4dqhMah4TMeOD/1uNAL7wdQTGYLqwgn/qCpXeTioCZPhug
 p3uToD/r8leEQKSVhLFS3es30mMy8zPwIIkV9m96/qgz0LmCaE0+XzZdp+49QFbsAeYn
 hXD0HasuaNsQMw6rkaALifpwC5jb+82qVF7Ebhbw1WxyVYdplSA3wkkOCbUkSpE8LHX8
 dStSsu/3fVuK6QjDRnUZCWBQ5VBQnMxR/j3qRDTm8FKH+Yr5mG9R/6ApjjDsX0oHlHRO
 olKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709325679; x=1709930479;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ODF936SZPk4uxaAkeX8YtobtmAxstAcsRTqY9d2kdho=;
 b=vzGgbJe0NWE0pA79V9+s4QV37PiISfvOk4MKXTzILY+jPgNzu+6cYO3K5GwLhw7l3x
 7eBZmF9KY9NZ9bjrKMa3L26cHXEOBZG7g7411aIYzMo/Fe/0TtxkApuU3SDQn1mKqLYZ
 hGK6RxHC1Yx04r0y+7AsUO3l4rvumYTlVzjyBHNdg6LndzBEKgbay1lTTRPImhp1tKiI
 L7d9haeELrSNnEE++DSCtREulhN5GThW9JZz94VzUoPTtmWF87bcJK0MdejjO8rJfGn3
 ByvXzesVOwzQq1K/2K+jo+LMMjshrKsog8K8KOZD8gAUzGibiuCFzprZBOxBIBMhP4gi
 iByg==
X-Gm-Message-State: AOJu0Yz8MNAav4CFqUXBGyCdLqNUddKhnHl/GW8YP2mvEZ96yBBJD7Lm
 Hs96azTJHYIofb/rf3mUAoBuFL7/+5xrUpreoblGMJCsC1yFqIxMZ7Af+yxLT6ZDmk8+ls8uIRe
 B
X-Received: by 2002:a17:90a:c297:b0:29a:ccb2:13dd with SMTP id
 f23-20020a17090ac29700b0029accb213ddmr2744078pjt.33.1709325679353; 
 Fri, 01 Mar 2024 12:41:19 -0800 (PST)
Received: from stoup.. (098-147-055-211.res.spectrum.com. [98.147.55.211])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a17090ac58300b0029b2e00359esm681947pjt.36.2024.03.01.12.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 12:41:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 4/6] accel/tcg: Add TLB_CHECK_ALIGNED
Date: Fri,  1 Mar 2024 10:41:08 -1000
Message-Id: <20240301204110.656742-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301204110.656742-1-richard.henderson@linaro.org>
References: <20240301204110.656742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SIXgzEMwXVk7

This creates a per-page method for checking of alignment.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h |  4 +++-
 accel/tcg/cputlb.c     | 30 +++++++++++++++++++++++++++---
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index bc05dce7ab..1a6510fd3b 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -357,8 +357,10 @@ static inline int cpu_mmu_index(CPUState *cs, bool ifetch)
 #define TLB_BSWAP            (1 << 0)
 /* Set if TLB entry contains a watchpoint.  */
 #define TLB_WATCHPOINT       (1 << 1)
+/* Set if TLB entry requires aligned accesses.  */
+#define TLB_CHECK_ALIGNED    (1 << 2)
 
-#define TLB_SLOW_FLAGS_MASK  (TLB_BSWAP | TLB_WATCHPOINT)
+#define TLB_SLOW_FLAGS_MASK  (TLB_BSWAP | TLB_WATCHPOINT | TLB_CHECK_ALIGNED)
 
 /* The two sets of flags must not overlap. */
 QEMU_BUILD_BUG_ON(TLB_FLAGS_MASK & TLB_SLOW_FLAGS_MASK);
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 72d6a09616..f1e4c23535 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1453,9 +1453,8 @@ static int probe_access_internal(CPUState *cpu, vaddr addr,
     flags |= full->slow_flags[access_type];
 
     /* Fold all "mmio-like" bits into TLB_MMIO.  This is not RAM.  */
-    if (unlikely(flags & ~(TLB_WATCHPOINT | TLB_NOTDIRTY))
-        ||
-        (access_type != MMU_INST_FETCH && force_mmio)) {
+    if (unlikely(flags & ~(TLB_WATCHPOINT | TLB_NOTDIRTY | TLB_CHECK_ALIGNED))
+        || (access_type != MMU_INST_FETCH && force_mmio)) {
         *phost = NULL;
         return TLB_MMIO;
     }
@@ -1836,6 +1835,31 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
         tcg_debug_assert((flags & TLB_BSWAP) == 0);
     }
 
+    /*
+     * This alignment check differs from the one above, in that this is
+     * based on the atomicity of the operation. The intended use case is
+     * the ARM memory type field of each PTE, where access to pages with
+     * Device memory type require alignment.
+     */
+    if (unlikely(flags & TLB_CHECK_ALIGNED)) {
+        MemOp size = l->memop & MO_SIZE;
+
+        switch (l->memop & MO_ATOM_MASK) {
+        case MO_ATOM_NONE:
+            size = MO_8;
+            break;
+        case MO_ATOM_IFALIGN_PAIR:
+        case MO_ATOM_WITHIN16_PAIR:
+            size = size ? size - 1 : 0;
+            break;
+        default:
+            break;
+        }
+        if (addr & ((1 << size) - 1)) {
+            cpu_unaligned_access(cpu, addr, type, l->mmu_idx, ra);
+        }
+    }
+
     return crosspage;
 }
 
-- 
2.34.1


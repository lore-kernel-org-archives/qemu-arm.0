Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1036036ejc;
        Mon, 22 Aug 2022 10:14:57 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4py6sM0OXRmzsZn9KCJ2id1y9QjeA228i1r5j59+Ehr/ufgUMzvBrLqexMemCGwyi4hO3a
X-Received: by 2002:a05:622a:1302:b0:344:8a9d:817d with SMTP id v2-20020a05622a130200b003448a9d817dmr16204117qtk.339.1661188496937;
        Mon, 22 Aug 2022 10:14:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661188496; cv=none;
        d=google.com; s=arc-20160816;
        b=RyN1SgbRCdPS9pBAe6+s4VilWdceantUDAfOHMvI+SUngcD2kOUrDnUeigurIMoNT5
         1S9mUzAV1rz4+DaWhJTQOKygycUxdlKGffB+Ytax00CwGNYxylfZrShSAs1smWTzy6cq
         BcAzvA0jQsXwWS50K6qzVRPZbpqUv6B4nvMZC+GMRZUjWYrPt2KmX5LVJ+V6vhu+NfZL
         zzphfy1fC752FcmkowapCHCcltwSBO1m7hqcDjxsnzUiOsnMIKhhXUiEwXo1frdWV057
         MTlSW8en+AOkzj+a17G81saDSm9gsqaFRIbErXOnY6Vw1EPKkuFyQ5GlAWtjd4xqYS/4
         BX8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AOC1J2N1TFaqmPODpiEeJvvId1/L1t5ozJ+BKFX5tCI=;
        b=kop0RdFus5NlFTuovc/r6ZADiClKUg063LJQwI8ejNczZNyBHqaLIp2Od04kCdGEzR
         G3E1YGS6kUPrVbalE6zO64kX4SaKVQWDlNc3F2MR9/++27JVyzqe8LWe4yOemUO0oh1f
         uOh9weW9dI5FdFKLQNK2slufkGNGu/A4odHiBUM7Gaheliu1GA2jd2sPkxIUv4wMhzAr
         E6r075b6lbpHM64xyKWjnl8t7S18zM6PaFZE8IlOprceeMxvq4VkluGPBjhMcgKN40hq
         OMvNGDpFfqUJoED00QNHUQFp2Dvug+B3S6w0Vmqh+xjbtyPzqJv7uVEiedtmpTdfsD0c
         nZTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iIvxLrzj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15-20020ac86b4f000000b00342f8a02981si4392616qts.767.2022.08.22.10.14.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 10:14:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iIvxLrzj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQB0q-0002GZ-Dz
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 13:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9M1-0000rB-AT
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:28:41 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:40682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Lf-0000tA-GP
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:28:41 -0400
Received: by mail-pg1-x532.google.com with SMTP id w13so4595393pgq.7
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 08:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=AOC1J2N1TFaqmPODpiEeJvvId1/L1t5ozJ+BKFX5tCI=;
 b=iIvxLrzj8WxzmdYfitz6DVTQo2olvu6icUB/p/DoRCUH67QB5rjnc4S5hbAwU5iUXh
 vizwayS9shWSKQ+MUkki9pqv2B3gBZeSJtOe1rADfyNgW948xljZ5HeRLwy0ccnASec7
 Zdbpdi2lxZQImaxDd0+JaQH/RW1+ZqNSEeLfaAy4t8/rKepiqeic+RfICdWmE7ecMpeU
 KkKSRUp98G9gUH4f0T5MfsMLp4d9gqQxVo7HnenbOzIrxv7X7o/xBRkPsvrXmex84U9R
 vgTbd/QIibgpx2GEDaPRc/8OQnCm23/n6sybFtNRhL27VZy6aSFvvya84rdE6eQJbAds
 90uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=AOC1J2N1TFaqmPODpiEeJvvId1/L1t5ozJ+BKFX5tCI=;
 b=D9Smfhdqb0Vy6LPOrAHjVSfgGMJn7bmhTHhsDeBQHB5+yixRJ9Z+e9j6Cqy8LSi5ma
 eQPGvg4azSdE6u+JsIId0X20iKuF0UteI0OkjrQhmVW5o5Az1a1cjjy6EO/OMC+LR+NT
 Iyji9R6GOlGBwU+QB/6qRQeW76q3aEl0A2kXBxMTBYRPTMdM/weAQHqM+JLhwvA0ASgK
 H9x3j6qZr/M58BXSe4HPyM2ST/J4R3hp0LkIjQWDKr0lf3wqJ48rxiu/WQr3xXcHCrWs
 msOs6vzhnhx0zhEGW4nLJpFtuVrb4NYNEeTxiNdavgtPKpnkdk1ylfN2G8Xc4vzqEi/f
 pKJw==
X-Gm-Message-State: ACgBeo3nOmcn5Td13I6mai7DL4rkjbK6eoR4U1ysvlVdCWGSxo4OM0uK
 pt2o43nnQ9zWckObo/6FYo05bA==
X-Received: by 2002:a05:6a00:1883:b0:536:e59f:f776 with SMTP id
 x3-20020a056a00188300b00536e59ff776mr1086800pfh.49.1661182098016; 
 Mon, 22 Aug 2022 08:28:18 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:28:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 39/66] accel/tcg: Suppress auto-invalidate in
 probe_access_internal
Date: Mon, 22 Aug 2022 08:27:14 -0700
Message-Id: <20220822152741.1617527-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: YTMneplTvdG7

When PAGE_WRITE_INV is set when calling tlb_set_page,
we immediately set TLB_INVALID_MASK in order to force
tlb_fill to be called on the next lookup.  Here in
probe_access_internal, we have just called tlb_fill
and eliminated true misses, thus the lookup must be valid.

This allows us to remove a warning comment from s390x.
There doesn't seem to be a reason to change the code though.

Cc: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c            | 10 +++++++++-
 target/s390x/tcg/mem_helper.c |  4 ----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 1509df96b4..5359113e8d 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1602,6 +1602,7 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     }
     tlb_addr = tlb_read_ofs(entry, elt_ofs);
 
+    flags = TLB_FLAGS_MASK;
     page_addr = addr & TARGET_PAGE_MASK;
     if (!tlb_hit_page(tlb_addr, page_addr)) {
         if (!victim_tlb_hit(env, mmu_idx, index, elt_ofs, page_addr)) {
@@ -1617,10 +1618,17 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
 
             /* TLB resize via tlb_fill may have moved the entry.  */
             entry = tlb_entry(env, mmu_idx, addr);
+
+            /*
+             * With PAGE_WRITE_INV, we set TLB_INVALID_MASK immediately,
+             * to force the next access through tlb_fill.  We've just
+             * called tlb_fill, so we know that this entry *is* valid.
+             */
+            flags &= ~TLB_INVALID_MASK;
         }
         tlb_addr = tlb_read_ofs(entry, elt_ofs);
     }
-    flags = tlb_addr & TLB_FLAGS_MASK;
+    flags &= tlb_addr;
 
     /* Fold all "mmio-like" bits into TLB_MMIO.  This is not RAM.  */
     if (unlikely(flags & ~(TLB_WATCHPOINT | TLB_NOTDIRTY))) {
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index fc52aa128b..3758b9e688 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -148,10 +148,6 @@ static int s390_probe_access(CPUArchState *env, target_ulong addr, int size,
 #else
     int flags;
 
-    /*
-     * For !CONFIG_USER_ONLY, we cannot rely on TLB_INVALID_MASK or haddr==NULL
-     * to detect if there was an exception during tlb_fill().
-     */
     env->tlb_fill_exc = 0;
     flags = probe_access_flags(env, addr, access_type, mmu_idx, nonfault, phost,
                                ra);
-- 
2.34.1


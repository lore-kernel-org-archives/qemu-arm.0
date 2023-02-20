Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2707511ejb;
        Mon, 20 Feb 2023 15:28:59 -0800 (PST)
X-Google-Smtp-Source: AK7set+yfarYD2w8dX3bYsFLNJ1GyfbIwKiLEv70JyYicjrs1wHUFcarKgcXXS0k/VZGUJg/MC7X
X-Received: by 2002:ac8:5dc9:0:b0:3a8:20fd:7111 with SMTP id e9-20020ac85dc9000000b003a820fd7111mr16821714qtx.39.1676935739468;
        Mon, 20 Feb 2023 15:28:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676935739; cv=none;
        d=google.com; s=arc-20160816;
        b=ugVLvuLcL0gJOQxr7tJbQPbNgg43bN72pmOL1xmtmMyQmVMxKfluVC032bP9opY84L
         N8BfxTiINhI3n7iaAsQI3RVrEnlEtYITRmb1hjf48DYMLWa9fgslW41hFLD7UGKTIBof
         kYlLroJGSjTpQIelBIFZ/Ljtb57HRa6zTIMUWWgoEVZXyF+gT1AXTyDetQkhZvNqHu3q
         37PgZc1TC91VUezYwPnMHx7mMxXIdLHSpx8x7WvLDCZsj93TBCpjtGYi9AuTT7gbtrGB
         ERXYRzWa/fOW8ZiqC5ZnswZB1QbIQ9sKrQRZgKlh9Q8lGZhsG8JNERYYEqVpVPnSuZ7K
         ZAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=d4Ci3OKSOkWsuhLLCd9XsBSP6q75DdfzpORQaA+1Aqs=;
        b=hcS3VWcnkiq7IV2voSMJqnvhKqUrRYA1+WHGN/iny+E8gQzXG5kYzJCRvmvp/Mbmxq
         xeaEhV2EK8wrnx9XGBECZlVrGYsmdaa/Jjb2w4Nkubid5oLt5Hdl9uRmKt98PolEqiLc
         oBRzD5cp1x66NGJZ6mFylCV4hb7A4mbuFqeE7Lk4peSEvNiVW1NK9KpQiYSpWctJau8V
         fkkZ/sXVnjH+baWvMtrBVbvnad/tNLBStfgaIBLCaNsQdRVXli2GDEwYN8Tewvs2KFDW
         OaUu0uDuqV8fBALvb4pTc5WrmkrVSEqsYrz0+DCvWudMZ9mnlIeWROpEYMzfjfl8eMkY
         6VgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F6+sFcFd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9-20020a05622a100900b003b344718afdsi10895229qte.638.2023.02.20.15.28.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 15:28:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F6+sFcFd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUFYi-0004Qy-2f; Mon, 20 Feb 2023 18:27:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYe-0004D3-9V
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 18:26:56 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYb-0000QJ-Qn
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 18:26:55 -0500
Received: by mail-pj1-x1035.google.com with SMTP id cp9so3982310pjb.0
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 15:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d4Ci3OKSOkWsuhLLCd9XsBSP6q75DdfzpORQaA+1Aqs=;
 b=F6+sFcFdW1ZtAnPQO4GNXDAuyz+Q5bFePcMX6bH5wEf8dqWAfCSSbjDG47dxVIXFKa
 Ed7KwcyusTxKS0uEEQxt0ggaXA8AQ5pS5hRdwB727Pz7dXcT5NdzM0BVEDV+PPG/Oh5V
 j/PoWFd9bTplJ5jjf/Wpwf3hWeybIf/kGTfEIUlvaeT+rAS8/aLG9/XjLl0NYeyoXp8d
 EjM3WLdZIQqgdBlygpF3JzNRBf8TYzE3uO0/oHESxtdxlIWfIreot5dZj7fWTDCnMN6r
 6xKZM856uexts1tP5D9qszL+atib9EOFNywhzIRQf5h/pGJUMWinVTJfPfI1GH8u7Wbp
 vQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d4Ci3OKSOkWsuhLLCd9XsBSP6q75DdfzpORQaA+1Aqs=;
 b=w9X8pcP5rJ3nPfczCF0nR6LJceZr3de29haFeOYQ0nZRR5Hyr1l8GqQvEH/7B5Yivk
 lOnh8K4Y5bVXLKvXG/h1jxeLSkAARTjwk078RQeEvNNRvU3QHl5qURgO333Og/riTck1
 cAqIobZK6aTbglUMnLTE+oJaOQZp9SOtTeSHrMpl0/bkpAhOt8NGkK+V1PQDXDV+a25b
 /AVpx3KmfDyy9/DNbJmUY8Ylc2StTe2NeBuIuXQgz+4bhyOPNmGfgsfwSDnOHb0W9/G+
 jReW25nDK6LdJs9rU9162FPn8TphsW56lpjOE+68vp6mzB/AZeuH6p+GNcDFBQGnK4Qw
 Rr4Q==
X-Gm-Message-State: AO0yUKV4kJWpTvLcSQkqipUTSpCJ8ZlH6jzbpK1KOQ1r6wETpw4D5Gy4
 6E42gcoTQLQeQDJnioX4EQpLLg==
X-Received: by 2002:a17:902:c40d:b0:19a:8284:83a2 with SMTP id
 k13-20020a170902c40d00b0019a828483a2mr4647179plk.10.1676935612564; 
 Mon, 20 Feb 2023 15:26:52 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902690a00b001992e74d058sm2665348plk.7.2023.02.20.15.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 15:26:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 14/21] target/arm: Use get_phys_addr_with_struct in
 S1_ptw_translate
Date: Mon, 20 Feb 2023 13:26:19 -1000
Message-Id: <20230220232626.429947-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220232626.429947-1-richard.henderson@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0TVOVMdQ5Cqx

Do not provide a fast-path for physical addresses,
as those will need to be validated for GPC.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 54e72baff5..6e980654be 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -234,29 +234,22 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
          * From gdbstub, do not use softmmu so that we don't modify the
          * state of the cpu at all, including softmmu tlb contents.
          */
-        if (regime_is_stage2(s2_mmu_idx)) {
-            S1Translate s2ptw = {
-                .in_mmu_idx = s2_mmu_idx,
-                .in_ptw_idx = arm_space_to_phys(space),
-                .in_space = space,
-                .in_secure = is_secure,
-                .in_debug = true,
-            };
-            GetPhysAddrResult s2 = { };
+        S1Translate s2ptw = {
+            .in_mmu_idx = s2_mmu_idx,
+            .in_ptw_idx = arm_space_to_phys(space),
+            .in_space = space,
+            .in_secure = is_secure,
+            .in_debug = true,
+        };
+        GetPhysAddrResult s2 = { };
 
-            if (get_phys_addr_lpae(env, &s2ptw, addr, MMU_DATA_LOAD,
-                                   false, &s2, fi)) {
-                goto fail;
-            }
-            ptw->out_phys = s2.f.phys_addr;
-            pte_attrs = s2.cacheattrs.attrs;
-            pte_secure = s2.f.attrs.secure;
-        } else {
-            /* Regime is physical. */
-            ptw->out_phys = addr;
-            pte_attrs = 0;
-            pte_secure = is_secure;
+        if (get_phys_addr_with_struct(env, &s2ptw, addr,
+                                      MMU_DATA_LOAD, &s2, fi)) {
+            goto fail;
         }
+        ptw->out_phys = s2.f.phys_addr;
+        pte_attrs = s2.cacheattrs.attrs;
+        pte_secure = s2.f.attrs.secure;
         ptw->out_host = NULL;
         ptw->out_rw = false;
     } else {
-- 
2.34.1


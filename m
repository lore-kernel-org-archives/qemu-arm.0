Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6568107ejq;
        Mon, 15 May 2023 07:53:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6E9noElUrUx87e3+fgqdKyNaTLQNSwvC9uD3qHgA6j9F59PPk/NcqAH0yzYaY7zXqZV38E
X-Received: by 2002:a7b:c318:0:b0:3f0:a08e:811b with SMTP id k24-20020a7bc318000000b003f0a08e811bmr24021544wmj.13.1684162426718;
        Mon, 15 May 2023 07:53:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684162426; cv=none;
        d=google.com; s=arc-20160816;
        b=x0zLW3oEJ47Wh5qdUfgzA5gqWsz2Eo0TPOs7zqHrxGJ93igmfEi0ksc+78Ssek8fLT
         JaOER7ec6/S3vQIfUb1+VXtoHCcgR4jXSQrzqf1YjALIy+KZcsjpv5EA+lwvaVUYzSj7
         RTom1Je79Yxb8poekgKAqsxAuoQhAvDEm16ODaV1LQEMHxpZD3LnrT81XtBAKG5i1SmX
         JnES2JT5SVToNeqJZnBrb+6kZNl2GoE8MkGNvXjwvda7Ol3nzitD4ZkobYEibUT7FPqf
         NV4icjwm6Ofng7DmtKRWHSKQZHSQTzUPATow0E+3yarE+n5Tnr5AVTWrqmtx4/8hqtqr
         5jgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DCduZxszzPV9k+ZJiXPHrxUp5Yyx6mQ092je6pWUrHc=;
        b=q9WhQBKo67MrHw5EhxKYs0X/pT5+zVH0g1t0y6lgQx/CV8S3SVBTDfwvyQQwj4gtmf
         O36tsxYIlyTbj49X6tq93IeWHzlsgezjbLS6N85HW9RufzP5dwlDuPUrNF6fCLLc2YSz
         2Os/CMs3o321XHaKzJmc3lolGlrfndeR2vJeYxXxzUnc0AUIVnEtsZ7CtYQ76+5CmcDB
         m8MLw8G2ai3eA3Vci1V3zMYsQLdtrqrr+8ZXSeJL9j9mWfdkL2ui330jPDP3KjR2tvK3
         KZslO1ScLHOJlQwoum5fNs/ycurRZU4UAObuNzhuyjamphwJtGKlYZeM8dTnXVLFTj5Y
         fRRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="WOBf4/Fu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fk15-20020a05600c0ccf00b003f508cb4762si2382758wmb.177.2023.05.15.07.53.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 07:53:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="WOBf4/Fu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyZKl-0006wK-4S; Mon, 15 May 2023 10:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJw-0005P7-S6
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:37:08 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJo-00060C-6F
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:37:04 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1aaf7067647so87347235ad.0
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 07:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161413; x=1686753413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DCduZxszzPV9k+ZJiXPHrxUp5Yyx6mQ092je6pWUrHc=;
 b=WOBf4/FuGoLoJGVXoHMkSiONeFatm8YlDzIbg4fdSjTlzHZY8ZMqr1B/hg87tz+tBV
 VF9alinKnIkbmYeiTI+2VM6V4N6s1dKMY9SqLTeatc3Yyku3FinHRDrX1J0EPOueiQUu
 gYfmiYIBCnC36KZ9CdA1uIT4fRgUObiv1NkDS55j5vOaz6UVxAh/NsfSbi+1VJ0L4/x6
 0m2xzm6RwbroQRECR8OBJZaSzV0F6Nh+6nRecj/hGK/XzUiCi820oxDBPZAkZjozealh
 eaJ40weq7s/kTznVX6979afRVT7NIC4YWILVYNykswJ9ilKEtobNvIQnTHmx6kMBOWJp
 7JNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161413; x=1686753413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DCduZxszzPV9k+ZJiXPHrxUp5Yyx6mQ092je6pWUrHc=;
 b=fPJ5KO9HU1fzGUA8hsMtebOZjwGHeOFAOnZVJUwbwR9ivKqF87cfm2Y5j8RHK/F9bU
 gVyG9Xz3c5Ob4NNivqa5n3FCCFLPp6c1bTKTk6NOIz8KRbrsOrJYuk9wZtFTLKTQufNk
 MqfotvTwS1oFYZg52pQcsAxHaAJfiC6HFEYZt+guMV93/oSbYNmCwthtXk/FVWe62buM
 NtiXg1vj+DWru5vInyxBguiGOoQ4uCJp2f7uo5Q+A5aGZHY8bmCTO45t1jM6kyff7tAD
 CaVWVKKJ+J/GLostyJfqUC4+P8CymP2ihZoxSgXclxcdiV1P2+oJIz8GeBK7FsutHWbm
 49Ag==
X-Gm-Message-State: AC+VfDxxZ0qEcHDn3P9SVcLrm+SmNSMFgujQwHmgrZOq4bF4j+h2XW6t
 E2GPj6HSiqqPxEi4rEw+UKtsE5mmjGSS37qqhPg=
X-Received: by 2002:a17:903:120d:b0:1ae:b38:b6a with SMTP id
 l13-20020a170903120d00b001ae0b380b6amr7585127plh.58.1684161413302; 
 Mon, 15 May 2023 07:36:53 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a1709026ac600b001aadfdfcd06sm8942735plt.299.2023.05.15.07.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:36:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v5 45/54] tcg/ppc: Use atom_and_align_for_opc
Date: Mon, 15 May 2023 07:33:04 -0700
Message-Id: <20230515143313.734053-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yP2ZPxge6pEu

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index b62a163014..b5c49895f3 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2015,6 +2015,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 typedef struct {
     TCGReg base;
     TCGReg index;
+    TCGAtomAlign aa;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -2034,7 +2035,23 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
+    MemOp a_bits;
+
+    /*
+     * Book II, Section 1.4, Single-Copy Atomicity, specifies:
+     *
+     * Before 3.0, "An access that is not atomic is performed as a set of
+     * smaller disjoint atomic accesses. In general, the number and alignment
+     * of these accesses are implementation-dependent."  Thus MO_ATOM_IFALIGN.
+     *
+     * As of 3.0, "the non-atomic access is performed as described in
+     * the corresponding list", which matches MO_ATOM_SUBALIGN.
+     */
+    h->aa = atom_and_align_for_opc(s, opc,
+                                   have_isa_3_00 ? MO_ATOM_SUBALIGN
+                                                 : MO_ATOM_IFALIGN,
+                                   false);
+    a_bits = h->aa.align;
 
 #ifdef CONFIG_SOFTMMU
     int mem_index = get_mmuidx(oi);
-- 
2.34.1


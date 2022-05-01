Received: by 2002:a05:6512:2248:0:0:0:0 with SMTP id i8csp467409lfu;
        Sat, 30 Apr 2022 23:00:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3eCsFyAXkPOzyKYBRcvrN4KzylASin/8fCx6P7zzb4+kvLU0UNvj8aW+9mcPEtzuTjYhI
X-Received: by 2002:a05:6214:260b:b0:456:50fc:550d with SMTP id gu11-20020a056214260b00b0045650fc550dmr5405642qvb.13.1651384829383;
        Sat, 30 Apr 2022 23:00:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651384829; cv=none;
        d=google.com; s=arc-20160816;
        b=GncVKa2CeEcF5WVR/d3lqSLOwNJ1EQv9imijn9zxzN8KZf5HD1GGlpE/uGC1wRCqOt
         PBmAZZprFZQW8ePYeUV8yBmIohAWjEsq1WtVUDyGZ0yKWtGgS/SUbfWmPnw0ZrHO97vS
         qfrJvAOyibLiaF57mXm20dgVdl53O/VQDE1/FWNk6sDPu5whRf5x2bdIGwDxYvp3OPRO
         1QMOFlhbaU/gMAgGiNyNlr/Lg9SNE4NKajNq3QqEnELGVppSga0HXxqllQpSUCjz4TEm
         3lH12mnifvq2hM2pbm+Vt/JJczcpqe74aLUQ7dyaAhyrpXQBkPYmaQe5IxUlcgC2kRlL
         yWdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7dAjLdTZkl7TID6iGw+1xQMd9kdTMVThmu014u7vMDQ=;
        b=Soz9dqLV0gVQViB5wrWONEWLrhRXO67VWN0mRva60s51YhepK0WSBdM8RzftUgqkmu
         IFbbUDKyujHiaaX9EuqKBy2oktAQ2p6K1SGo8Iqwk7DkIXxxEavl22Oknj2misMr+qBS
         2DjjCea9yyiieHYg4KqFq4a3EzqfEvGEZsLz77koZqb3NbvPkv5hM+DqSbqlhR9Pqs6i
         CCXVgeApKeYkEzVJ9TdE/H3l/taUN6nGAObFOHEn3lZUlusbt2UDfUav/1qytWFQDGqa
         CTpCPqPGAg0LZdtD5U98pMqBRC5sAhrm2BkMGkA0mDNsqWL/3KaYbcen/Uc3AYjf1PyH
         t4gA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n75sJf5x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gg11-20020a056214252b00b00459ce622ec8si2586317qvb.21.2022.04.30.23.00.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Apr 2022 23:00:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n75sJf5x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nl2dA-0005kE-RW
	for alex.bennee@linaro.org; Sun, 01 May 2022 02:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tl-0006sG-RJ
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:50:51 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:37858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Th-0001Ge-37
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:50:42 -0400
Received: by mail-pl1-x633.google.com with SMTP id k1so1679026pll.4
 for <qemu-arm@nongnu.org>; Sat, 30 Apr 2022 22:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7dAjLdTZkl7TID6iGw+1xQMd9kdTMVThmu014u7vMDQ=;
 b=n75sJf5xK2h9Le32WX0ruVufYI4OSQykxtXdUuSwrd8SppuA7gbZukcNvwjaHf01tJ
 keE0i9JkY3nABySd09/+eWfMl0vzrmtDjveiSCX7boRJ8+v6VuL1yrKjxY3ylc011grM
 ShjXaOEFlgRX7flwNlwwCCupZiWakLQwEW51MHejex09fLYnucPKTW3FejlBsScTuJ2u
 hXKYwB8t4Xe1O6wM5p/zV02xyLzDVdBbldy7+QAlNVjogZ9WNrAxYQvJjR327mhj0Fv9
 NdQhkWU8+IcNJBsgNw9DdtT5ELqDxv4zDW4X85lgVv7iecFBn4NERLnqvm2+92XWW6sD
 XSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7dAjLdTZkl7TID6iGw+1xQMd9kdTMVThmu014u7vMDQ=;
 b=XVVr+3zg8VJYq7WwAyjwxCFHgQftjvimFfsEGxNo4nCf8hX0UyqbxZ0mGemeAP6zfD
 LBuL730KM0k7oLv1H970go/0iFwnYTrJrBl67517VWdIyFk4xN1Svr47fy1zvsx17yFL
 JYexdw3C/125Be2YwCFe5livn9FNoRbHhjX/qXGmN0K5tHUpuos8xQjnH1ywrkJDgFjm
 vrqtCVP0RycZvQNZWaShu5WOSAxcIGwFQeLtzY0nd4N4TCZl4/ruqBwYOBNa+8aunVF0
 onXhei4jiKEPcIAmJLl3mPtmyP9LJzgZYNUwRqhcdP+9d4o0nd3JRbfc6Zqnai+hN0G8
 tRiw==
X-Gm-Message-State: AOAM533pbQRxB4Hxxq6hHGdtrAlt5d7QFKsUVX/A5J9s/ZLXIH4cVtbn
 LxGqwc44e/6KYhXYv8hUzaYMRA==
X-Received: by 2002:a17:90b:3851:b0:1dc:4f70:1cb with SMTP id
 nl17-20020a17090b385100b001dc4f7001cbmr1366825pjb.167.1651384239772; 
 Sat, 30 Apr 2022 22:50:39 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/45] target/arm: Drop always-true test in
 define_arm_vh_e2h_redirects_aliases
Date: Sat, 30 Apr 2022 22:49:52 -0700
Message-Id: <20220501055028.646596-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l6xY7oD8sSsB

The new_key field is always non-zero -- drop the if.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v4: Drop change to crn et al.
---
 target/arm/helper.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 50ad2e3e37..e5fc22bb69 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5914,7 +5914,9 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
 
     for (i = 0; i < ARRAY_SIZE(aliases); i++) {
         const struct E2HAlias *a = &aliases[i];
-        ARMCPRegInfo *src_reg, *dst_reg;
+        ARMCPRegInfo *src_reg, *dst_reg, *new_reg;
+        uint32_t *new_key;
+        bool ok;
 
         if (a->feature && !a->feature(&cpu->isar)) {
             continue;
@@ -5933,19 +5935,16 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
         g_assert(src_reg->opaque == NULL);
 
         /* Create alias before redirection so we dup the right data. */
-        if (a->new_key) {
-            ARMCPRegInfo *new_reg = g_memdup(src_reg, sizeof(ARMCPRegInfo));
-            uint32_t *new_key = g_memdup(&a->new_key, sizeof(uint32_t));
-            bool ok;
+        new_reg = g_memdup(src_reg, sizeof(ARMCPRegInfo));
+        new_key = g_memdup(&a->new_key, sizeof(uint32_t));
 
-            new_reg->name = a->new_name;
-            new_reg->type |= ARM_CP_ALIAS;
-            /* Remove PL1/PL0 access, leaving PL2/PL3 R/W in place.  */
-            new_reg->access &= PL2_RW | PL3_RW;
+        new_reg->name = a->new_name;
+        new_reg->type |= ARM_CP_ALIAS;
+        /* Remove PL1/PL0 access, leaving PL2/PL3 R/W in place.  */
+        new_reg->access &= PL2_RW;
 
-            ok = g_hash_table_insert(cpu->cp_regs, new_key, new_reg);
-            g_assert(ok);
-        }
+        ok = g_hash_table_insert(cpu->cp_regs, new_key, new_reg);
+        g_assert(ok);
 
         src_reg->opaque = dst_reg;
         src_reg->orig_readfn = src_reg->readfn ?: raw_read;
-- 
2.34.1


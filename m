Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA291CA0EE4
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:03:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXXy-0001bM-ER; Thu, 14 Aug 2025 08:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXXr-0001Yk-Px
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:59:04 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXXl-0004HN-MG
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:59:03 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-24457f53d2eso9805315ad.0
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 05:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176332; x=1755781132; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P80G+Mqq/PBj5fm0u9e6xc+6PUuM6bwSvtsR/7Pt9Yc=;
 b=yY9CW6hw2aZO8AtL96t4zM1RHKaFCfnm53NR9LjO/CFfD8bWZTKHf7uR0sszWbRQKW
 8SrREVRo2fx5cjZT6nsunxAsvckf75OJnlFEDXJEwz7N5uMfsYQ7P7u79xVJnsoMceuy
 oc2ex7B/XTzU+Zut7mfOss5ryjZaxcU+0llnN9tuYA/W6bBj+hz7uvk1O5JemNXAzdFt
 Y1GrNTPYw2NIT35qYOVlpU9xYxX2WbcHQnYwEEwDupVumPqYwOu6sblTei8FemGfaS4G
 CmFQ+/gGXhnm8407TrJi/ToT9v1uvnhZ2GBIW0plqi7GmkbfsV/gxh3f7HqCWLNdrb2f
 H/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176332; x=1755781132;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P80G+Mqq/PBj5fm0u9e6xc+6PUuM6bwSvtsR/7Pt9Yc=;
 b=OeiS7pKvOSiOqVQiOH6fakKhzLXqJhygDHkPYKfAxTtyKa/hLMeWy69TcD6xHBrInS
 ZIL2+c9EvjpxTLQ3tTq0tlU1vcB/mDHsDblQFLGKPAIHCts2mw+Wo7fvsePDxQ1cIEDB
 Jf9C9BgEJHbdyc5D9iOuiU4iG+cKSDGhBj1w9e33F77jcLkVpGuL1QihqbDUzQ3mBiJE
 v0+XnJv/ZhdhzsAMM+kw/hWt2zrfKTvAF0M2JiuAFnpPnsAhyOKnyZB7t3V9jqx0kLDT
 YWnrGBfP5GuNXcDSJx9fa1vGtC768iEkTNgBn1/zWNA+ogRm9wT3rWEkEiyXN4UipMtG
 4I5w==
X-Gm-Message-State: AOJu0YwS3UII9mOUWJWp8cwxP8qeI0uMmNCsmI6zv/p3q1A6RDVWQWsL
 JmafDjj/Jsc8hZRfA2CQsQv7/xdcPS3p4qayiZ606MWI++pEUbUc9BE10KFjEPRfNcA=
X-Gm-Gg: ASbGnct78qqQue56CbDdpiXcLkSG15u4wAxSkn23JcFspUyCGdNv+CxPdmOCu4L6mur
 yLOa1S3FqsyvB1zvITeSoRV4lujcraOY+BROFzpsEcGzW9JhgwHPEU3rPqL9C6rTt5wp7zS6UW6
 tgUqDjzfdyoriLJmliLeBuqmK7fWKKCiwKCDadG8USEDqsDhhRQu5vBzReOAuEM5Tt9jIZanoKZ
 j+SLmxsa75N6bokwWjS8fJEVwGExz00jwyzCxXZwNgFtkJsOYiAlx4lNycONcNnhGOoXzSOE5Bk
 BWJye+ufKGvVHLdI5bOgimJih9/bHgbqUdLOKOrcxI5pPbUfaKVT6OlaziQOR1G2bC7GdIuGKJv
 nfPPAToV8283gh6dsrqLMh/OUgdmfB8OiNtoqbtRUrIjRUxQ=
X-Google-Smtp-Source: AGHT+IGM+/VwnTutCdMcVaUZ8A4cwwtf8eMGEIrC3kgkgNCekm1yt3ayWa3zifnR/wlHeeuA1R6t1A==
X-Received: by 2002:a17:903:40d1:b0:240:2a0:c449 with SMTP id
 d9443c01a7336-244584ed083mr43883645ad.8.1755176332006; 
 Thu, 14 Aug 2025 05:58:52 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3233100c994sm1766256a91.21.2025.08.14.05.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 05:58:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 16/85] target/arm: Force HPD for stage2 translations
Date: Thu, 14 Aug 2025 22:56:43 +1000
Message-ID: <20250814125752.164107-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Stage2 translations do not have hierarchial permissions.
Setting HPD means we can eliminate an extra check against
regime_is_stage2.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c |  7 +++++--
 target/arm/ptw.c    | 24 +++++++++++++-----------
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6353b2dea1..a6130f7dcd 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9639,8 +9639,11 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         tsz = extract32(tcr, 0, 6);
         gran = tg0_to_gran_size(extract32(tcr, 14, 2));
         if (stage2) {
-            /* VTCR_EL2 */
-            hpd = false;
+            /*
+             * Stage2 does not have hierarchical permissions.
+             * Thus disabling them makes things easier during ptw.
+             */
+            hpd = true;
         } else {
             hpd = extract32(tcr, 24, 1);
         }
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index efbad7af1f..2eb2041edb 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1472,8 +1472,12 @@ static ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
         }
         tsz = sextract32(tcr, 0, 4) + 8;
         select = 0;
-        hpd = false;
         epd = false;
+        /*
+         * Stage2 does not have hierarchical permissions.
+         * Thus disabling them makes things easier during ptw.
+         */
+        hpd = true;
     } else if (el == 2) {
         /* HTCR */
         tsz = extract32(tcr, 0, 3);
@@ -1979,16 +1983,14 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      * except NSTable (which we have already handled).
      */
     attrs = new_descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
-    if (!regime_is_stage2(mmu_idx)) {
-        if (!param.hpd) {
-            attrs |= extract64(tableattrs, 0, 2) << 53;     /* XN, PXN */
-            /*
-             * The sense of AP[1] vs APTable[0] is reversed, as APTable[0] == 1
-             * means "force PL1 access only", which means forcing AP[1] to 0.
-             */
-            attrs &= ~(extract64(tableattrs, 2, 1) << 6); /* !APT[0] => AP[1] */
-            attrs |= extract32(tableattrs, 3, 1) << 7;    /* APT[1] => AP[2] */
-        }
+    if (!param.hpd) {
+        attrs |= extract64(tableattrs, 0, 2) << 53;     /* XN, PXN */
+        /*
+         * The sense of AP[1] vs APTable[0] is reversed, as APTable[0] == 1
+         * means "force PL1 access only", which means forcing AP[1] to 0.
+         */
+        attrs &= ~(extract64(tableattrs, 2, 1) << 6); /* !APT[0] => AP[1] */
+        attrs |= extract32(tableattrs, 3, 1) << 7;    /* APT[1] => AP[2] */
     }
 
     ap = extract32(attrs, 6, 2);
-- 
2.43.0



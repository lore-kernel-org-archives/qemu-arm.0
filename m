Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9479ECAC599
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Sep 2025 14:28:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyWae-00062D-D1; Tue, 16 Sep 2025 10:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWaW-0005uD-LW
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:23:20 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWaP-0008NG-NC
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:23:19 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-b54b3cafdcaso2723976a12.0
 for <qemu-arm@nongnu.org>; Tue, 16 Sep 2025 07:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758032581; x=1758637381; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hg2xV4nRaM7n2VIoSbN3KehS3wFi1JQVp0YcyiarUG8=;
 b=YP1IejkqUTkDdKes6iR03Wi59QwgIQ20Ip1Z4rkmZFq2McIu1Zkj/88mSRvIH4ly24
 jAkgwCqNno6VSYFPgFOtav0lZ0iMyODgwOkq43S9ZHB0FvolCF19KZ6hDQfde6f0B0Vu
 ZGfa0517RF9aQmFFNXjgjTdONOjWryOgqsvhAFE400eDggaN2iL4cDvneYL2TQ9BfEVz
 9heUatPbvzXAjP8CYMxopFGCucy+jDQNVw0Q4hoAilDV0vqR9qAwXt+bSGUiG3Isdhzj
 K/Vs7OjehWG3wu2QXiHH53K6HX9nRGhOAtJ+v0clo1O6ScWydixvCFlSYZUKZYp7Y53X
 riNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758032581; x=1758637381;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hg2xV4nRaM7n2VIoSbN3KehS3wFi1JQVp0YcyiarUG8=;
 b=g679fmIzPuXifWGBBlqHpjUZA983vChuV+LfxZJc5zb2sl9vENw4gkQSbpmJti+O3/
 HTNE/N+1f/CGb+nh9t3iUWnhajW5zpVZSaQus+h5Y0yqNj9/zPdm4kUQLjfVT4FI7m4X
 UXudClOGOEBMTUmGvx1lPn1dQg8p11UpNWur8ermO2c3E7ceMgc6hQEnJcd16L5SWDrs
 R6vVp50f1btQh3VPOjY2UzYcqCTrvpdoNoXyBWxUpk7ZGgH2n0UAoWnE4XBkynRfyxG6
 H1wn7TAl82aUtH59dbYdtaZsv/RBA54CkwJRpkRa4MplFWeolyZk4s1uhU9R9cdE6Eff
 5DAQ==
X-Gm-Message-State: AOJu0YywF00wYsoaWgL6ueptAOEJUh5HUeyUcgTBL0b/eA13i4PHmpFf
 2INfhxQYagtEPwZ/OcLqemwmgdX52tXMe2p1DEA9ipM2czQ4+WgI65lO+0ChvcGyRNM=
X-Gm-Gg: ASbGncvtp0EqwOV56E9az/VVzLQCBw4kVErQ21mqMD+PolS6JpT/ZYLAJYfVexwtW7s
 tMiSkUj0BnwDvj/buPBygqwDKBB9OghLhwEex2wM/yVord60x0myjR7jbMWDuZxBL1kOgiIR8US
 j53JLQvcCYvTicnz/LrthHf4K6Hso96dYG3ZC8Zhg7DZMScftTgwh8mzeuG2l6sOEmO5Qmqwspq
 RH6KQoLylvcwf1y1AhhrzAoq0+4D664X7vNxruq5UXzU03ZKr+tQLH+Le90eilvl/4rs41vGGg6
 IEQEXvsp1EWljomsNHORd+Zm59Y2YZmw2LMO9KzzN8YB5m23koIoNKNe3WQJPhgdKMpR2R3gDHq
 kEuk+RQwkGf/+wR2sxNY1tFoPObB3
X-Google-Smtp-Source: AGHT+IGPpZrUMRb7VyZtwEqPUXOvvyc9FIxx7TNhRTr1GvaneXPY5/aKjU2uh2HQ7eIfkAFQoCijXw==
X-Received: by 2002:a17:903:2f0f:b0:24b:1589:5054 with SMTP id
 d9443c01a7336-25d250961b0mr203823045ad.23.1758032580737; 
 Tue, 16 Sep 2025 07:23:00 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2651d2df15esm73459905ad.45.2025.09.16.07.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 07:23:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 27/36] target/arm: Remove name argument to alloc_cpreg
Date: Tue, 16 Sep 2025 07:22:28 -0700
Message-ID: <20250916142238.664316-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916142238.664316-1-richard.henderson@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

All callers now pass in->name, so take the value from there.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 71dd094fac..da3dd073d3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7421,9 +7421,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
  * Copy a ARMCPRegInfo structure, allocating it along with the name
  * and an optional suffix to the name.
  */
-static ARMCPRegInfo *alloc_cpreg(const ARMCPRegInfo *in,
-                                 const char *name, const char *suffix)
+static ARMCPRegInfo *alloc_cpreg(const ARMCPRegInfo *in, const char *suffix)
 {
+    const char *name = in->name;
     size_t name_len = strlen(name);
     size_t suff_len = suffix ? strlen(suffix) : 0;
     ARMCPRegInfo *out = g_malloc(sizeof(*in) + name_len + suff_len + 1);
@@ -7563,7 +7563,7 @@ static void add_cpreg_to_hashtable_aa32(ARMCPU *cpu, ARMCPRegInfo *r,
                                cp, crm, opc1, opc2, key);
         break;
     case ARM_CP_SECSTATE_BOTH:
-        r_s = alloc_cpreg(r, r->name, "_S");
+        r_s = alloc_cpreg(r, "_S");
         add_cpreg_to_hashtable(cpu, r_s, ARM_CP_STATE_AA32, ARM_CP_SECSTATE_S,
                                cp, crm, opc1, opc2, key);
 
@@ -7593,7 +7593,7 @@ static void add_cpreg_to_hashtable_aa64(ARMCPU *cpu, ARMCPRegInfo *r,
          * and name that it is passed, so it's OK to use
          * a local struct here.
          */
-        ARMCPRegInfo *nxs_ri = alloc_cpreg(r, r->name, "NXS");
+        ARMCPRegInfo *nxs_ri = alloc_cpreg(r, "NXS");
         uint32_t nxs_key;
 
         assert(nxs_ri->crn < 0xf);
@@ -7816,7 +7816,7 @@ void define_one_arm_cp_reg(ARMCPU *cpu, const ARMCPRegInfo *r)
     for (int crm = crmmin; crm <= crmmax; crm++) {
         for (int opc1 = opc1min; opc1 <= opc1max; opc1++) {
             for (int opc2 = opc2min; opc2 <= opc2max; opc2++) {
-                ARMCPRegInfo *r2 = alloc_cpreg(r, r->name, NULL);
+                ARMCPRegInfo *r2 = alloc_cpreg(r, NULL);
                 ARMCPRegInfo *r3;
 
                 switch (r->state) {
@@ -7827,7 +7827,7 @@ void define_one_arm_cp_reg(ARMCPU *cpu, const ARMCPRegInfo *r)
                     add_cpreg_to_hashtable_aa64(cpu, r2, crm, opc1, opc2);
                     break;
                 case ARM_CP_STATE_BOTH:
-                    r3 = alloc_cpreg(r2, r2->name, NULL);
+                    r3 = alloc_cpreg(r2, NULL);
                     add_cpreg_to_hashtable_aa32(cpu, r2, cp, crm, opc1, opc2);
                     add_cpreg_to_hashtable_aa64(cpu, r3, crm, opc1, opc2);
                     break;
-- 
2.43.0



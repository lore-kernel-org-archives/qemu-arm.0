Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1259161ejn;
        Fri, 28 Oct 2022 06:41:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6fnEGek/PaOR95tAM5yE1kUktfimq9eZvW5nChmRkryUAMVMuGUPUuKQO9aWvocY2b8igF
X-Received: by 2002:a0c:f193:0:b0:4bb:92f5:bc20 with SMTP id m19-20020a0cf193000000b004bb92f5bc20mr13231576qvl.52.1666964470447;
        Fri, 28 Oct 2022 06:41:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666964470; cv=none;
        d=google.com; s=arc-20160816;
        b=ektig1qCv2wrIQHmr/5/JzymvOCW2kBJ39sP+QXEf3/r3VR24mYn5TMpPTCqwD5dyF
         /Tz0tEtt8AYSwgR5tC8Oljwp7J0kbIPzBPrw4DojCL90k1DrEZgpjlTlqGho7T3hZ6qj
         7aYQKG6XVzlMUGreJmvNc9PFewj4louvaBeqZGI0X8REOEFrMVah8YXv7ldYZPMbzYR/
         Qrdx7R3GHjFz8/mJNdCsFvfsnyoOCoF32f5vvmL4tE97Vg8Ml62DI9dmyGbPlPxrMhvZ
         2d3sb1GPieGROz65TzHvmiE0VMRRhUSkK2zM2Ms0Ku7AC3bN29uVs6vXjO+qMwk8UChS
         nPwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4K87xT8UfgYIvzosA0ZzEb5C1Re2w2jmRL989xqlNYM=;
        b=qTdEeorzNU7/nQ/pPuW8NZjxD0GlNJaTT3rsgriuyJkTN7biHj8hIKqwagADC+4O2o
         l/n3hmEAu5LzkjM0C7BhQDhJUEZVReS/t9iOneml1B1paVTsXSJGTcTbdBItJKijP1cU
         9CsivvdKtztJJHIvB0eSW/DRadytXwTK+Sc9Fr0WE0/F6tq01KBvif20/GfQdcAg0WeJ
         eOgTRUNrDS8U2o1f9H8znDPalfAjho/uH9yZgRBdGu7mVlYXp/0Sa5XdonoM8SphbNes
         cK9d7G6vFnxYq0RoqEzQPJsI7LYzMj/i7jj8jtNxwtV05fqggZjjhrKDBGluZ+tyqz3o
         yLGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X9wYD2DL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi31-20020a05620a319f00b006fa0a5394c3si795677qkb.266.2022.10.28.06.41.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Oct 2022 06:41:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X9wYD2DL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPaq-0008NZ-PY; Fri, 28 Oct 2022 09:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ooPak-0008Jc-Dm
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:40:10 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ooPai-0007r7-3D
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:40:10 -0400
Received: by mail-wr1-x431.google.com with SMTP id g12so6629165wrs.10
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 06:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4K87xT8UfgYIvzosA0ZzEb5C1Re2w2jmRL989xqlNYM=;
 b=X9wYD2DLpvPekzE13VfXXIvQFYAz/4lyMnGtvF4PPzujN1znkzYQpK2DLC8pDeNuFm
 S/2gQw2zxR8dUwLZofaalLEs4qyx7eP87AJJVSF68WaFrBEWXp9fNNOH/5tGdZMAbHOG
 xq/1DjhTaBGmVogMOdXdKV9k0Wdned9trKa4qs+RRfeiTv+1ED07uHKu32gnnKHzN/FY
 1iNU7D7Xx1G9TtWS6ts2qR+rJP/bBJV8mPiAMdpDIK8rKGVHu8xRkcW2eS3K7toimoZX
 J+tfiQzumu7GCRLbEH+IxKnlgNSNNHWM/ftGC3AsbUJiU1FNwbIkhRGSqgK9W2Tphznb
 8lfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4K87xT8UfgYIvzosA0ZzEb5C1Re2w2jmRL989xqlNYM=;
 b=RT8yFv9YDMXcJANV33zVM9J3b+VX18q4fHi0c/erXVeapsq/7gNzr5vOHmYTdxyd8Z
 HLXqwWfEUtesigd/l89aUf7pq3r+BLZ1Vw8z71E+/rvwv6musXKrqMDOyzu4tzKVhMN7
 ljM9ElF+LtJ8BorJG8P5x0Qsz+PXJmAnN2V6Els92rJ2eZ0MlR3ySYS4Cs9/r5D2y2Tx
 TJuqPDtgXE4sZL8oU45B7mHklDBnc9DQ6rG3r0Xu8BgpzBx42DPj1WV0ghkOFswmMV1/
 TFsowZu4Q8BETExdriKAIv5AAW/iATllJFB6xqlqpSbOgqZ4G6Gyco276pC+AjD0JUtw
 vXDA==
X-Gm-Message-State: ACrzQf0sIFotfghxVsSCutomsFkZ9KG7QFXvLkKJjEV1MZ1SMCr1KaGH
 A1Fwk8Cq3ZhJOE/r0Dk681CgJTetogObiQ==
X-Received: by 2002:a05:6000:1a46:b0:236:9cb4:f2a7 with SMTP id
 t6-20020a0560001a4600b002369cb4f2a7mr3849407wry.141.1666964406628; 
 Fri, 28 Oct 2022 06:40:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a5d4110000000b002365cd93d05sm3572858wrp.102.2022.10.28.06.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 06:40:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/7] target/arm: Make TLBIOS and TLBIRANGE ops trap on
 HCR_EL2.TTLB
Date: Fri, 28 Oct 2022 14:39:56 +0100
Message-Id: <20221028134002.730598-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028134002.730598-1-peter.maydell@linaro.org>
References: <20221028134002.730598-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: k2B9tczpwa1U

The HCR_EL2.TTLB bit is supposed to trap all EL1 execution of TLB
maintenance instructions.  However we have added new TLB insns for
FEAT_TLBIOS and FEAT_TLBIRANGE, and forgot to set their accessfn to
access_ttlb.  Add the missing accessfns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c672903f432..dd6fc30faee 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6717,51 +6717,51 @@ static const ARMCPRegInfo pauth_reginfo[] = {
 static const ARMCPRegInfo tlbirange_reginfo[] = {
     { .name = "TLBI_RVAE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 1,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAAE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 3,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
    { .name = "TLBI_RVALE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 5,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAALE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 7,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 1,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAAE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 3,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
    { .name = "TLBI_RVALE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 5,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAALE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 7,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 1,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1_write },
     { .name = "TLBI_RVAAE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 3,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1_write },
    { .name = "TLBI_RVALE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 5,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1_write },
     { .name = "TLBI_RVAALE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 7,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_rvae1_write },
     { .name = "TLBI_RIPAS2E1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 2,
@@ -6832,27 +6832,27 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
 static const ARMCPRegInfo tlbios_reginfo[] = {
     { .name = "TLBI_VMALLE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 0,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vmalle1is_write },
     { .name = "TLBI_VAE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 1,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_ASIDE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 2,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vmalle1is_write },
     { .name = "TLBI_VAAE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 3,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_VALE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 5,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_VAALE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 7,
-      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_ALLE2OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 0,
-- 
2.25.1


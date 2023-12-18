Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp722700eji;
        Mon, 18 Dec 2023 03:34:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSYUc53U+sIS48Nn2Zd4yRLcsyuyIxjWDwaGSirCzuMPNWwRlxQAS/nXYHT8F9VPH51vz+
X-Received: by 2002:a05:6214:124c:b0:67f:24c7:a51 with SMTP id r12-20020a056214124c00b0067f24c70a51mr4609449qvv.130.1702899261098;
        Mon, 18 Dec 2023 03:34:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702899261; cv=none;
        d=google.com; s=arc-20160816;
        b=Nlb+ZFHxnMsrOvFV7pLuVwnT/qiXiTxZrLfkgdTrNLRiYfQsxU/CxEb7FYFyssX1DX
         jTAxtwClmCwmQKBQNa/p9AaALIdSfWPgstaCPnuMoVhZ5mBz2437E4ZRt7Q+p01c8cVS
         IKN5z4eRqCBQ3hPd1fV9GfsAT1ptodeREP6G2MMqDkTGtxDml1QFSZYsw6YCHlFCqqRA
         VwRzcAF3bYnaP0yOT56KSGFU5UcF9N8AoBr0+se7Drj5E2jM6qbZiFz23IMbzvNbJ5WO
         IlAKKACAXKxjPxkrS5Mp6NizPLonpvI5YhVaAlDjadlKte9UWwThIX44C1OKfkwvuUAF
         5KrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kn2/l6hTTPHeOx0ZYSVe0llwanYj6080bnCCd9Z4V2M=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=Mh6+5BnpH6SAWOtm1sBwRQg5uuB5ViwVa3PwdZkuDrKNCvphjFZRS1/415ZkndS1d6
         SLkw42dNpxOSmv6Y24vsf8agzcpCvgDGzyjrAhQcsK6TkR1ZN6TLi6i0FV8qzchHw36g
         MNJnF+PC2b9AU3Ke2Fq8UjhMOV1+aYyYBQ3gyjh0O3u7z5EQASKUZotHv9BHVwX9hOp8
         qsA0d5r5PD1f2tKJ1BbwdIQ38y469KJp10NxXnyL+iaAERnX2f/XGG6XErqtC1UBxSXT
         l4Rl9syESxK0lv7JxurG5tRxfzwMhhlLrOEf8Foo9h5z/0Av1QoztayzMeASedjzWQNC
         1bOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=baaT3mTa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d18-20020a05620a167200b0077da9b7be21si22713564qko.581.2023.12.18.03.34.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 03:34:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=baaT3mTa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rFBsa-0007Wo-OS; Mon, 18 Dec 2023 06:33:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBsL-00077s-IV
 for qemu-devel@nongnu.org; Mon, 18 Dec 2023 06:33:35 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBsA-0003OD-Gd
 for qemu-devel@nongnu.org; Mon, 18 Dec 2023 06:33:33 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33666946422so649319f8f.1
 for <qemu-devel@nongnu.org>; Mon, 18 Dec 2023 03:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702899201; x=1703504001; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kn2/l6hTTPHeOx0ZYSVe0llwanYj6080bnCCd9Z4V2M=;
 b=baaT3mTaKdbbi+uXKErRNSrjroRLEWhAIOndp5dlVhFL9SPP/I5HH30MaMQAYTR6QK
 rTcAtbjlfG0rnBUCH3amYqfm1cz2Uje7DBQ4+MdxL2+wsFzw33pkdmf8Isy9B/b/hm9n
 pKR+iNM67JilZMpA2G63AYOGMLeV5dLlzBlXY47HIEuZC6OLNjahOtVIqKOF/r3tgHj7
 LdkhnjR9feBuwDkMx0lta55ce6yeVWarjQVzYZIu2KycO0ZV56fvGBt8gNHIK/B45bg8
 SrT7OBjYpkFKE4MVcu2wC2jD6ET2JIWUtAJkuDRBW9k2ZFoV3tYKJBI/e9sMnErG/biA
 zXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702899201; x=1703504001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kn2/l6hTTPHeOx0ZYSVe0llwanYj6080bnCCd9Z4V2M=;
 b=NwPXPK/MIOTiI43T1SRNpbdm8QwjjOHZbp+rUNOtHX2LjvXfucU3KEj5+cTfTm9mBe
 kHpkP/AR8FG57kjb5CC6Fwg8vjSv9aD7yJKUJmQCcnhvVJFVH6yOoZIgxmqy9Mo1HC/B
 QlPZCLTbVr9HVHTBRKg99wtYF/N0xSwLoY+puziwtPgsgBRbs3g/EoHSi1yeXWhHTwxy
 aBRg6wSFRErWLreNMgpUEETdCEOLafvpaZC94qAUzA3oRgCov4jtXzn2P97y6nQAIVxN
 hzQbjN5JpL/o6wRj4bG29rkouwez46eDSzORiOlam8KzVl3bVCrm5SeMx0CtnZckdIX/
 wBcg==
X-Gm-Message-State: AOJu0YylCvjMQ5nzulspJBn+eLNZmjLOP/nbu9qNgiX7++vumXkX43Fq
 PpmPh4t6raxeM1d/X/uhc5LZWQ==
X-Received: by 2002:adf:f4c5:0:b0:336:6102:9c04 with SMTP id
 h5-20020adff4c5000000b0033661029c04mr1652570wrp.125.1702899201227; 
 Mon, 18 Dec 2023 03:33:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adff012000000b003366da509ecsm671193wro.85.2023.12.18.03.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 03:33:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 30/35] target/arm: Mark up VNCR offsets (offsets 0x168..0x1f8)
Date: Mon, 18 Dec 2023 11:33:00 +0000
Message-Id: <20231218113305.2511480-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218113305.2511480-1-peter.maydell@linaro.org>
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ubY0tyAB2d+P

Mark up the cpreginfo structs to indicate offsets for system
registers from VNCR_EL2, as defined in table D8-66 in rule R_CSRPQ in
the Arm ARM.  This commit covers offsets 0x168 to 0x1f8.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 78c3c3ebd8d..6c33619d646 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3175,6 +3175,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 2, .opc2 = 1,
       .type = ARM_CP_IO, .access = PL0_RW,
       .accessfn = gt_ptimer_access,
+      .nv2_redirect_offset = 0x180 | NV2_REDIR_NV1,
       .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_PHYS].ctl),
       .resetvalue = 0,
       .readfn = gt_phys_redir_ctl_read, .raw_readfn = raw_read,
@@ -3192,6 +3193,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 3, .opc2 = 1,
       .type = ARM_CP_IO, .access = PL0_RW,
       .accessfn = gt_vtimer_access,
+      .nv2_redirect_offset = 0x170 | NV2_REDIR_NV1,
       .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_VIRT].ctl),
       .resetvalue = 0,
       .readfn = gt_virt_redir_ctl_read, .raw_readfn = raw_read,
@@ -3271,6 +3273,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 2, .opc2 = 2,
       .access = PL0_RW,
       .type = ARM_CP_IO,
+      .nv2_redirect_offset = 0x178 | NV2_REDIR_NV1,
       .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_PHYS].cval),
       .resetvalue = 0, .accessfn = gt_ptimer_access,
       .readfn = gt_phys_redir_cval_read, .raw_readfn = raw_read,
@@ -3288,6 +3291,7 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 3, .opc2 = 2,
       .access = PL0_RW,
       .type = ARM_CP_IO,
+      .nv2_redirect_offset = 0x168 | NV2_REDIR_NV1,
       .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_VIRT].cval),
       .resetvalue = 0, .accessfn = gt_vtimer_access,
       .readfn = gt_virt_redir_cval_read, .raw_readfn = raw_read,
@@ -7036,6 +7040,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static const ARMCPRegInfo zcr_reginfo[] = {
     { .name = "ZCR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 2, .opc2 = 0,
+      .nv2_redirect_offset = 0x1e0 | NV2_REDIR_NV1,
       .access = PL1_RW, .type = ARM_CP_SVE,
       .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[1]),
       .writefn = zcr_write, .raw_writefn = raw_write },
@@ -7177,6 +7182,7 @@ static const ARMCPRegInfo sme_reginfo[] = {
       .writefn = svcr_write, .raw_writefn = raw_write },
     { .name = "SMCR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 2, .opc2 = 6,
+      .nv2_redirect_offset = 0x1f0 | NV2_REDIR_NV1,
       .access = PL1_RW, .type = ARM_CP_SME,
       .fieldoffset = offsetof(CPUARMState, vfp.smcr_el[1]),
       .writefn = smcr_write, .raw_writefn = raw_write },
@@ -7210,6 +7216,7 @@ static const ARMCPRegInfo sme_reginfo[] = {
       .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "SMPRIMAP_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 5,
+      .nv2_redirect_offset = 0x1f8,
       .access = PL2_RW, .accessfn = access_smprimap,
       .type = ARM_CP_CONST, .resetvalue = 0 },
 };
@@ -7924,6 +7931,7 @@ static const ARMCPRegInfo mte_reginfo[] = {
     { .name = "TFSR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 5, .crm = 6, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_tfsr_el1,
+      .nv2_redirect_offset = 0x190 | NV2_REDIR_NV1,
       .fieldoffset = offsetof(CPUARMState, cp15.tfsr_el[1]) },
     { .name = "TFSR_EL2", .state = ARM_CP_STATE_AA64,
       .type = ARM_CP_NV2_REDIRECT,
@@ -8098,6 +8106,7 @@ static const ARMCPRegInfo scxtnum_reginfo[] = {
       .opc0 = 3, .opc1 = 0, .crn = 13, .crm = 0, .opc2 = 7,
       .access = PL1_RW, .accessfn = access_scxtnum_el1,
       .fgt = FGT_SCXTNUM_EL1,
+      .nv2_redirect_offset = 0x188 | NV2_REDIR_NV1,
       .fieldoffset = offsetof(CPUARMState, scxtnum_el[1]) },
     { .name = "SCXTNUM_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 13, .crm = 0, .opc2 = 7,
@@ -8122,22 +8131,27 @@ static CPAccessResult access_fgt(CPUARMState *env, const ARMCPRegInfo *ri,
 static const ARMCPRegInfo fgt_reginfo[] = {
     { .name = "HFGRTR_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 4,
+      .nv2_redirect_offset = 0x1b8,
       .access = PL2_RW, .accessfn = access_fgt,
       .fieldoffset = offsetof(CPUARMState, cp15.fgt_read[FGTREG_HFGRTR]) },
     { .name = "HFGWTR_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 5,
+      .nv2_redirect_offset = 0x1c0,
       .access = PL2_RW, .accessfn = access_fgt,
       .fieldoffset = offsetof(CPUARMState, cp15.fgt_write[FGTREG_HFGWTR]) },
     { .name = "HDFGRTR_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 3, .crm = 1, .opc2 = 4,
+      .nv2_redirect_offset = 0x1d0,
       .access = PL2_RW, .accessfn = access_fgt,
       .fieldoffset = offsetof(CPUARMState, cp15.fgt_read[FGTREG_HDFGRTR]) },
     { .name = "HDFGWTR_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 3, .crm = 1, .opc2 = 5,
+      .nv2_redirect_offset = 0x1d8,
       .access = PL2_RW, .accessfn = access_fgt,
       .fieldoffset = offsetof(CPUARMState, cp15.fgt_write[FGTREG_HDFGWTR]) },
     { .name = "HFGITR_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 6,
+      .nv2_redirect_offset = 0x1c8,
       .access = PL2_RW, .accessfn = access_fgt,
       .fieldoffset = offsetof(CPUARMState, cp15.fgt_exec[FGTREG_HFGITR]) },
 };
@@ -8324,12 +8338,14 @@ static const ARMCPRegInfo vhe_reginfo[] = {
       .opc0 = 3, .opc1 = 5, .crn = 14, .crm = 2, .opc2 = 1,
       .type = ARM_CP_IO | ARM_CP_ALIAS,
       .access = PL2_RW, .accessfn = e2h_access,
+      .nv2_redirect_offset = 0x180 | NV2_REDIR_NO_NV1,
       .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_PHYS].ctl),
       .writefn = gt_phys_ctl_write, .raw_writefn = raw_write },
     { .name = "CNTV_CTL_EL02", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 5, .crn = 14, .crm = 3, .opc2 = 1,
       .type = ARM_CP_IO | ARM_CP_ALIAS,
       .access = PL2_RW, .accessfn = e2h_access,
+      .nv2_redirect_offset = 0x170 | NV2_REDIR_NO_NV1,
       .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_VIRT].ctl),
       .writefn = gt_virt_ctl_write, .raw_writefn = raw_write },
     { .name = "CNTP_TVAL_EL02", .state = ARM_CP_STATE_AA64,
@@ -8346,11 +8362,13 @@ static const ARMCPRegInfo vhe_reginfo[] = {
       .opc0 = 3, .opc1 = 5, .crn = 14, .crm = 2, .opc2 = 2,
       .type = ARM_CP_IO | ARM_CP_ALIAS,
       .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_PHYS].cval),
+      .nv2_redirect_offset = 0x178 | NV2_REDIR_NO_NV1,
       .access = PL2_RW, .accessfn = e2h_access,
       .writefn = gt_phys_cval_write, .raw_writefn = raw_write },
     { .name = "CNTV_CVAL_EL02", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 5, .crn = 14, .crm = 3, .opc2 = 2,
       .type = ARM_CP_IO | ARM_CP_ALIAS,
+      .nv2_redirect_offset = 0x168 | NV2_REDIR_NO_NV1,
       .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_VIRT].cval),
       .access = PL2_RW, .accessfn = e2h_access,
       .writefn = gt_virt_cval_write, .raw_writefn = raw_write },
-- 
2.34.1


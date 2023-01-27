Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1338638ejc;
        Fri, 27 Jan 2023 09:58:17 -0800 (PST)
X-Google-Smtp-Source: AK7set85DHqwMkIPEJZtBB/Jk8TjPRDYAo9ISIm/cXqZEIq+7vIMU4pP+StsEyMtRABbBi4nQRnu
X-Received: by 2002:ac8:7d91:0:b0:3b8:1f33:ab57 with SMTP id c17-20020ac87d91000000b003b81f33ab57mr6021519qtd.59.1674842297551;
        Fri, 27 Jan 2023 09:58:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674842297; cv=none;
        d=google.com; s=arc-20160816;
        b=i0e2ASqnU52AEXZs7VPjTJIrBRPzScuvepLsfv1o8DD8VZiPeYnbWOMsHgf5f84wKq
         vIJfKsgwsEX5r3gqXclDXpV+c4v2U3Kgmh+WtANlnM8B/4ud3zwH4Kv3ipvyoZ0yG5fI
         Eaow+GxHmq6bkB966LRB0FIRT86Y7QIBPstnCtyq2sX+3sbjvTg9RW1tg70CRll+zlou
         zl9m9zlIBEQAOXF2wg+ZZDiiPQDBcfD02UQdev5twck1Ng9KHgLTrv9h912y6XjGEzH9
         jTtEIRVj4PVla8/ZLG57o0AkudzHPCz6fQOMHyMITcUHlKK01dMIiVOTMqAUOfwVZjjB
         fVhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=evwq3ihx19jz47boF7ZRHKWdFLZOMN4sOrrfNKDNnBY=;
        b=nOkdR5Pdv37I9K8/gdukuk/0PZPYPPn2tVXloJqFb9eMsPkdAXS1b0wiOUyfPd+tb5
         5hIu/dVS+3xovyWDhHkgBeIt0GWFYBdC2znSbvpS2mI/PMqNkn4NISmYve79WsN/fUZ1
         EbuEWF9agn11b0l2NG4UrGOue3a47fSmlYAkQ6fEHicV/RV15IHHqnl/cKu/0aR34ZmA
         qFBzTvvpcx2hQKrSnh8fP9T7VuW+bnTZ4190FQVJNRlJbaOTOBbDX8RZYAbBcnkUhh24
         KTiHF1U4sL9uJIYDAH+xjnUXc2PgKaHUCTdH6RocCNOELzYNv3c3FWE6x9chrqJc15bI
         FZaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SH1pOFa0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a20-20020a05620a02f400b006fc95f0d1absi3026393qko.262.2023.01.27.09.58.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jan 2023 09:58:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SH1pOFa0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLSxA-00016g-7r; Fri, 27 Jan 2023 12:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSww-0000u3-KW
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:43 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwl-00063W-Od
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:42 -0500
Received: by mail-wr1-x434.google.com with SMTP id m14so5215286wrg.13
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 09:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=evwq3ihx19jz47boF7ZRHKWdFLZOMN4sOrrfNKDNnBY=;
 b=SH1pOFa0Zmve8yLaVTrqabjwmvucYZoD3J01+cLs452uHr8i4LYRyWV3OGd/4+JW2e
 mRsBJP4s2ENB+nL780K6cBT+4FAgSl6ByZkA7Ec1N3wNJO6CXGdA1xiUObU0rwYBVHl0
 TK+FsABMhQenZ0vRSZOTpsYuT26ZFcwmlKvL/M8sBf80dqLfW+tWnwkvv9721omyjZ40
 IkjBV8XZit+qOvdY1h+abBsA3plltepAmhAjU5xk4fwjzKhSM7nWr6Zuysg0c3+yW3lF
 HiWeEudWq+qpJATmXmVIpEh3YeFysOu2xrxmERoi1cCyZAQsxaNU1aptFhjqTSiOoXvG
 lbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=evwq3ihx19jz47boF7ZRHKWdFLZOMN4sOrrfNKDNnBY=;
 b=p+5Mkd1LcRJF85eDzYJFWuhxUUlyq0FXg664GXSviAbPEN3DKZFOGjf4ZoZR7Fe+qf
 TS/0u4NAEqzZ4uzl+lAZatlcBcqz40CZEEMWJSd4w8SJO1/zFMaWphkBaQ/k20RZnSp6
 zjSEg3hKc1NfLzvG2n5fkF7rgFJZGVAuqbWCdWnYbJgU3MM57WZCx23MaVkDlSddiEAZ
 Er12qHR2/pm0sSCiRC64jus+ruNFm7x9HJ7X0mEkHVLFNCW3FRWPPDo/Oz8q9VRxPb0H
 9JAAXnK9Q/jFaGoJK9a4IEsMa0bay6bMlzchOJ/G9fArRsf6xwm1Mk4Ub49WzIwnApqw
 co9Q==
X-Gm-Message-State: AO0yUKVcWd3nJd9m0j3CM45ksvicDioVO7HYOmds6mw6kZDNEsBXsTEI
 c+qG/TdxGwrPWvZ272UqOwkzfpgYfpOR2Ipl
X-Received: by 2002:a5d:61c1:0:b0:2bf:d9c3:9dcf with SMTP id
 q1-20020a5d61c1000000b002bfd9c39dcfmr293391wrv.52.1674842127040; 
 Fri, 27 Jan 2023 09:55:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002366e3f1497sm4545089wro.6.2023.01.27.09.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:55:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 16/23] target/arm: Mark up sysregs for HFGITR bits 0..11
Date: Fri, 27 Jan 2023 17:55:00 +0000
Message-Id: <20230127175507.2895013-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127175507.2895013-1-peter.maydell@linaro.org>
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GfNC1FKTgGM2

Mark up the sysreg definitions for the system instructions
trapped by HFGITR bits 0..11. These bits cover various
cache maintenance operations.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpregs.h | 14 ++++++++++++++
 target/arm/helper.c | 28 ++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index c37e013b8f3..6596c2a1233 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -646,6 +646,20 @@ typedef enum FGTBit {
     DO_BIT(HDFGWTR, PMCR_EL0),
     DO_BIT(HDFGRTR, PMMIR_EL1),
     DO_BIT(HDFGRTR, PMCEIDN_EL0),
+
+    /* Trap bits in HFGITR_EL2, starting from bit 0 */
+    DO_BIT(HFGITR, ICIALLUIS),
+    DO_BIT(HFGITR, ICIALLU),
+    DO_BIT(HFGITR, ICIVAU),
+    DO_BIT(HFGITR, DCIVAC),
+    DO_BIT(HFGITR, DCISW),
+    DO_BIT(HFGITR, DCCSW),
+    DO_BIT(HFGITR, DCCISW),
+    DO_BIT(HFGITR, DCCVAU),
+    DO_BIT(HFGITR, DCCVAP),
+    DO_BIT(HFGITR, DCCVADP),
+    DO_BIT(HFGITR, DCCIVAC),
+    DO_BIT(HFGITR, DCZVA),
 } FGTBit;
 
 #undef DO_BIT
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2e494b8f924..51866ba70e9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5261,6 +5261,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
 #ifndef CONFIG_USER_ONLY
       /* Avoid overhead of an access check that always passes in user-mode */
       .accessfn = aa64_zva_access,
+      .fgt = FGT_DCZVA,
 #endif
     },
     { .name = "CURRENTEL", .state = ARM_CP_STATE_AA64,
@@ -5270,21 +5271,26 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "IC_IALLUIS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 1, .opc2 = 0,
       .access = PL1_W, .type = ARM_CP_NOP,
+      .fgt = FGT_ICIALLUIS,
       .accessfn = access_ticab },
     { .name = "IC_IALLU", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 5, .opc2 = 0,
       .access = PL1_W, .type = ARM_CP_NOP,
+      .fgt = FGT_ICIALLU,
       .accessfn = access_tocu },
     { .name = "IC_IVAU", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 5, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NOP,
+      .fgt = FGT_ICIVAU,
       .accessfn = access_tocu },
     { .name = "DC_IVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 1,
       .access = PL1_W, .accessfn = aa64_cacheop_poc_access,
+      .fgt = FGT_DCIVAC,
       .type = ARM_CP_NOP },
     { .name = "DC_ISW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 2,
+      .fgt = FGT_DCISW,
       .access = PL1_W, .accessfn = access_tsw, .type = ARM_CP_NOP },
     { .name = "DC_CVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 1,
@@ -5292,17 +5298,21 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_CSW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 2,
+      .fgt = FGT_DCCSW,
       .access = PL1_W, .accessfn = access_tsw, .type = ARM_CP_NOP },
     { .name = "DC_CVAU", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 11, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NOP,
+      .fgt = FGT_DCCVAU,
       .accessfn = access_tocu },
     { .name = "DC_CIVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NOP,
+      .fgt = FGT_DCCIVAC,
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_CISW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 2,
+      .fgt = FGT_DCCISW,
       .access = PL1_W, .accessfn = access_tsw, .type = ARM_CP_NOP },
     /* TLBI operations */
     { .name = "TLBI_VMALLE1IS", .state = ARM_CP_STATE_AA64,
@@ -7413,6 +7423,7 @@ static const ARMCPRegInfo dcpop_reg[] = {
     { .name = "DC_CVAP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END,
+      .fgt = FGT_DCCVAP,
       .accessfn = aa64_cacheop_poc_access, .writefn = dccvap_writefn },
 };
 
@@ -7420,6 +7431,7 @@ static const ARMCPRegInfo dcpodp_reg[] = {
     { .name = "DC_CVADP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 13, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END,
+      .fgt = FGT_DCCVADP,
       .accessfn = aa64_cacheop_poc_access, .writefn = dccvap_writefn },
 };
 #endif /*CONFIG_USER_ONLY*/
@@ -7499,28 +7511,36 @@ static const ARMCPRegInfo mte_reginfo[] = {
     { .name = "DC_IGVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 3,
       .type = ARM_CP_NOP, .access = PL1_W,
+      .fgt = FGT_DCIVAC,
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_IGSW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 4,
+      .fgt = FGT_DCISW,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
     { .name = "DC_IGDVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 5,
       .type = ARM_CP_NOP, .access = PL1_W,
+      .fgt = FGT_DCIVAC,
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_IGDSW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 6,
+      .fgt = FGT_DCISW,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
     { .name = "DC_CGSW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 4,
+      .fgt = FGT_DCCSW,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
     { .name = "DC_CGDSW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 6,
+      .fgt = FGT_DCCSW,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
     { .name = "DC_CIGSW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 4,
+      .fgt = FGT_DCCISW,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
     { .name = "DC_CIGDSW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 6,
+      .fgt = FGT_DCCISW,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
 };
 
@@ -7542,26 +7562,32 @@ static const ARMCPRegInfo mte_el0_cacheop_reginfo[] = {
     { .name = "DC_CGVAP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 3,
       .type = ARM_CP_NOP, .access = PL0_W,
+      .fgt = FGT_DCCVAP,
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_CGDVAP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 5,
       .type = ARM_CP_NOP, .access = PL0_W,
+      .fgt = FGT_DCCVAP,
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_CGVADP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 13, .opc2 = 3,
       .type = ARM_CP_NOP, .access = PL0_W,
+      .fgt = FGT_DCCVADP,
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_CGDVADP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 13, .opc2 = 5,
       .type = ARM_CP_NOP, .access = PL0_W,
+      .fgt = FGT_DCCVADP,
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_CIGVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 3,
       .type = ARM_CP_NOP, .access = PL0_W,
+      .fgt = FGT_DCCIVAC,
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_CIGDVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 5,
       .type = ARM_CP_NOP, .access = PL0_W,
+      .fgt = FGT_DCCIVAC,
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_GVA", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 4, .opc2 = 3,
@@ -7569,6 +7595,7 @@ static const ARMCPRegInfo mte_el0_cacheop_reginfo[] = {
 #ifndef CONFIG_USER_ONLY
       /* Avoid overhead of an access check that always passes in user-mode */
       .accessfn = aa64_zva_access,
+      .fgt = FGT_DCZVA,
 #endif
     },
     { .name = "DC_GZVA", .state = ARM_CP_STATE_AA64,
@@ -7577,6 +7604,7 @@ static const ARMCPRegInfo mte_el0_cacheop_reginfo[] = {
 #ifndef CONFIG_USER_ONLY
       /* Avoid overhead of an access check that always passes in user-mode */
       .accessfn = aa64_zva_access,
+      .fgt = FGT_DCZVA,
 #endif
     },
 };
-- 
2.34.1


Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1339274ejc;
        Fri, 27 Jan 2023 09:59:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtItRBE0n7AYYzJLc9yuZ8p7Pxhd02ZAGscONGup5HdGD00QFXx/F9ZWH29Pu0RsZhbM/JG
X-Received: by 2002:ac8:5a95:0:b0:3b2:39ee:dcf3 with SMTP id c21-20020ac85a95000000b003b239eedcf3mr78158342qtc.25.1674842360640;
        Fri, 27 Jan 2023 09:59:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674842360; cv=none;
        d=google.com; s=arc-20160816;
        b=HdgutKLP/HGxeh5d5EuZok7pvqDRJG2OA2OQalTGZLMRzwV4Bf1xh7k/0iMMnWi4hA
         zGIIvwiwFU0w57lXi+zrRp7iE6CZJ8PQ8M+BtUpQ9uM6wuikw6cSx9+0SCvQD8LxacNx
         6QTU5sAYlGH35t1peJs0IiZkeue2Yv56siWCQQ+b7TDwHFd2jiLhP2g3nNj9Vd/rMmZ2
         YJs1IUK6Y1FYMva3gflZlnCwQ/6nqCFZb5Ute/QOKixRuEeC6XR/acIdd2hnndb6k60P
         4FVssjXQ+LtIJUkxlRN6Glj1UFz5VZgphucAHxETQs6KWubOIJntu3+AbYHtbctajEua
         nW+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vUZ+5WCGd2aXzcmqtmPQybGWA36dDti6Rddo0SepbLo=;
        b=tFuWNOm65bzLJCiXkCzKp/BEmE3Eb3zs9wnDfYD/GKRTwtm7BlQTtIhK+dhUyugMbR
         aYHsoNAIIi5BqMaLZkjWQWNaOTamTSWQ7mBD/E/IHTXwiI65L7RSRgY/uSR+LosDTBgR
         yR1CDcoSKfbGA2obh58ePX3b4LNLJE8qviJa/3+r/5LIEGwBPqZjofc/UYlMNZL2Cm0z
         G2I74xMa87/vv+aiQfQ1EvTwbS0xvbwakh7+sRzoLPTUI/8yI5S4mMBY2Or/ZpqWYlLT
         EHFjootEozXoUsgtxFh2hKorW1tHp6N6Hu+nEYMM4GRxNZJELyMvsaZlu4sFm/eLaxoF
         T6uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EsHt0378;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15-20020a05622a180f00b003a57f6a1e68si2660009qtc.204.2023.01.27.09.59.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jan 2023 09:59:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EsHt0378;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLSx3-0000zA-E0; Fri, 27 Jan 2023 12:55:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwu-0000s8-1o
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 12:55:41 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwl-000644-LA
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 12:55:39 -0500
Received: by mail-wr1-x435.google.com with SMTP id q10so5682780wrm.4
 for <qemu-arm@nongnu.org>; Fri, 27 Jan 2023 09:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vUZ+5WCGd2aXzcmqtmPQybGWA36dDti6Rddo0SepbLo=;
 b=EsHt0378xchgXStbRMQ50EwmCqEUSJHqjd0lRUVPSVSNJ4z5uJlG5qWHPVay0223c1
 FTJqkj5WfawSxftsLQpTP8svFbPFzb5pp92q4jJ0pss/XHRvmUAs4cfudb46Y1+QjBzB
 Z9JQKOJRtdG60X+nNaqISKGTISnrBED7/f9Uy29PwWOyJynVsDaGEA11/zvndGS+LWNe
 urQd5mzH0g5fVrFYaVJbDaozQ3N+HxKn9zSMZTgnmygVygeI3ZtSX0b+o0Kat+QuPf4C
 KQnLV+TnDgOGXKo+4nW58pIRrEnaBFR47HC8ya4V79cEglUBc5fZONa1WIpzo/1gTArO
 hyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vUZ+5WCGd2aXzcmqtmPQybGWA36dDti6Rddo0SepbLo=;
 b=X8rbryvmQS8tPTVXl2Haj5TXKjHc90M1J0BLiS/y8DDQ2A/nZDpDEPzww0yWXBc3dR
 BQoe9Nq5ece5TmO1tRr5Pae8dteXRDVM38Hf4FzU1xg7oHD/nUzXzyxuw/ZF1G1vrqRv
 FIIcxTnGDXEYFsk7nIUOtSQ64TgLGIyERuV4zcOaLIY5IU3ZN3MlJmktVqHQQA2xnrP9
 DUzR9Msru2cO28BJgO8g8w3yhvX2r53iYs0c3yu12MZq+g0fUqzM3mYHOyFbXaDbjfFG
 frzruV7qgA6ZEq0tq0Jp4NGodrnkImGRj0k8SI2W9fFaZsuF+TGKdZXLbUASbZOBV18m
 LKIA==
X-Gm-Message-State: AO0yUKUVzYShCf2u50M5S4CsrBoy0FAz0NvcujX2Twg/wjSBQCSfS7cB
 +89smnT+3sQ0zFczgVDkmuKEeGcH4pH0CvSe
X-Received: by 2002:adf:8b48:0:b0:2bf:d6f9:23d6 with SMTP id
 v8-20020adf8b48000000b002bfd6f923d6mr1861143wra.45.1674842129097; 
 Fri, 27 Jan 2023 09:55:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002366e3f1497sm4545089wro.6.2023.01.27.09.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:55:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 18/23] target/arm: Mark up sysregs for HFGITR bits 18..47
Date: Fri, 27 Jan 2023 17:55:02 +0000
Message-Id: <20230127175507.2895013-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127175507.2895013-1-peter.maydell@linaro.org>
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: e2tBdQ03sAu7

Mark up the sysreg definitions for the system instructions
trapped by HFGITR bits 18..47. These bits cover TLBI
TLB maintenance instructions.

(If we implemented FEAT_XS we would need to trap some of the
instructions added by that feature using these bits; but we don't
yet, so will need to add the .fgt markup when we do.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpregs.h | 30 ++++++++++++++++++++++++++++++
 target/arm/helper.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 1f74308ef5d..2e5ac6b4f98 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -666,6 +666,36 @@ typedef enum FGTBit {
     DO_BIT(HFGITR, ATS1E0W),
     DO_BIT(HFGITR, ATS1E1RP),
     DO_BIT(HFGITR, ATS1E1WP),
+    DO_BIT(HFGITR, TLBIVMALLE1OS),
+    DO_BIT(HFGITR, TLBIVAE1OS),
+    DO_BIT(HFGITR, TLBIASIDE1OS),
+    DO_BIT(HFGITR, TLBIVAAE1OS),
+    DO_BIT(HFGITR, TLBIVALE1OS),
+    DO_BIT(HFGITR, TLBIVAALE1OS),
+    DO_BIT(HFGITR, TLBIRVAE1OS),
+    DO_BIT(HFGITR, TLBIRVAAE1OS),
+    DO_BIT(HFGITR, TLBIRVALE1OS),
+    DO_BIT(HFGITR, TLBIRVAALE1OS),
+    DO_BIT(HFGITR, TLBIVMALLE1IS),
+    DO_BIT(HFGITR, TLBIVAE1IS),
+    DO_BIT(HFGITR, TLBIASIDE1IS),
+    DO_BIT(HFGITR, TLBIVAAE1IS),
+    DO_BIT(HFGITR, TLBIVALE1IS),
+    DO_BIT(HFGITR, TLBIVAALE1IS),
+    DO_BIT(HFGITR, TLBIRVAE1IS),
+    DO_BIT(HFGITR, TLBIRVAAE1IS),
+    DO_BIT(HFGITR, TLBIRVALE1IS),
+    DO_BIT(HFGITR, TLBIRVAALE1IS),
+    DO_BIT(HFGITR, TLBIRVAE1),
+    DO_BIT(HFGITR, TLBIRVAAE1),
+    DO_BIT(HFGITR, TLBIRVALE1),
+    DO_BIT(HFGITR, TLBIRVAALE1),
+    DO_BIT(HFGITR, TLBIVMALLE1),
+    DO_BIT(HFGITR, TLBIVAE1),
+    DO_BIT(HFGITR, TLBIASIDE1),
+    DO_BIT(HFGITR, TLBIVAAE1),
+    DO_BIT(HFGITR, TLBIVALE1),
+    DO_BIT(HFGITR, TLBIVAALE1),
 } FGTBit;
 
 #undef DO_BIT
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8b9c7fcc3a4..5b9cc087e28 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5318,50 +5318,62 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "TLBI_VMALLE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 0,
       .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIVMALLE1IS,
       .writefn = tlbi_aa64_vmalle1is_write },
     { .name = "TLBI_VAE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 1,
       .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIVAE1IS,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_ASIDE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 2,
       .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIASIDE1IS,
       .writefn = tlbi_aa64_vmalle1is_write },
     { .name = "TLBI_VAAE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 3,
       .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIVAAE1IS,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_VALE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 5,
       .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIVALE1IS,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_VAALE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 3, .opc2 = 7,
       .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIVAALE1IS,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_VMALLE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 0,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIVMALLE1,
       .writefn = tlbi_aa64_vmalle1_write },
     { .name = "TLBI_VAE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 1,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIVAE1,
       .writefn = tlbi_aa64_vae1_write },
     { .name = "TLBI_ASIDE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 2,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIASIDE1,
       .writefn = tlbi_aa64_vmalle1_write },
     { .name = "TLBI_VAAE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 3,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIVAAE1,
       .writefn = tlbi_aa64_vae1_write },
     { .name = "TLBI_VALE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 5,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIVALE1,
       .writefn = tlbi_aa64_vae1_write },
     { .name = "TLBI_VAALE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 7, .opc2 = 7,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIVAALE1,
       .writefn = tlbi_aa64_vae1_write },
     { .name = "TLBI_IPAS2E1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 1,
@@ -7175,50 +7187,62 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
     { .name = "TLBI_RVAE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 1,
       .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIRVAE1IS,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAAE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 3,
       .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIRVAAE1IS,
       .writefn = tlbi_aa64_rvae1is_write },
    { .name = "TLBI_RVALE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 5,
       .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIRVALE1IS,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAALE1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 7,
       .access = PL1_W, .accessfn = access_ttlbis, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIRVAALE1IS,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 1,
       .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIRVAE1OS,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAAE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 3,
       .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIRVAAE1OS,
       .writefn = tlbi_aa64_rvae1is_write },
    { .name = "TLBI_RVALE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 5,
       .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIRVALE1OS,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAALE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 7,
       .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIRVAALE1OS,
       .writefn = tlbi_aa64_rvae1is_write },
     { .name = "TLBI_RVAE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 1,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIRVAE1,
       .writefn = tlbi_aa64_rvae1_write },
     { .name = "TLBI_RVAAE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 3,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIRVAAE1,
       .writefn = tlbi_aa64_rvae1_write },
    { .name = "TLBI_RVALE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 5,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIRVALE1,
       .writefn = tlbi_aa64_rvae1_write },
     { .name = "TLBI_RVAALE1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 7,
       .access = PL1_W, .accessfn = access_ttlb, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIRVAALE1,
       .writefn = tlbi_aa64_rvae1_write },
     { .name = "TLBI_RIPAS2E1IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 2,
@@ -7290,26 +7314,32 @@ static const ARMCPRegInfo tlbios_reginfo[] = {
     { .name = "TLBI_VMALLE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 0,
       .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIVMALLE1OS,
       .writefn = tlbi_aa64_vmalle1is_write },
     { .name = "TLBI_VAE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 1,
+      .fgt = FGT_TLBIVAE1OS,
       .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_ASIDE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 2,
       .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIASIDE1OS,
       .writefn = tlbi_aa64_vmalle1is_write },
     { .name = "TLBI_VAAE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 3,
       .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIVAAE1OS,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_VALE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 5,
       .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIVALE1OS,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_VAALE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 7,
       .access = PL1_W, .accessfn = access_ttlbos, .type = ARM_CP_NO_RAW,
+      .fgt = FGT_TLBIVAALE1OS,
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_ALLE2OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 0,
-- 
2.34.1


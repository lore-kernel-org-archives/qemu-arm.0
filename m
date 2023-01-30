Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1150254ejb;
        Mon, 30 Jan 2023 10:27:30 -0800 (PST)
X-Google-Smtp-Source: AK7set/yYKaIXLF5a+cz+nZ1JqCXJiEAHwI3T3LGj2ZPERa0J4aCs1vEIM+ZJ7lhFSxgV4EG7N0j
X-Received: by 2002:a05:6214:a87:b0:53a:bf63:b053 with SMTP id ev7-20020a0562140a8700b0053abf63b053mr9681877qvb.45.1675103250479;
        Mon, 30 Jan 2023 10:27:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675103250; cv=none;
        d=google.com; s=arc-20160816;
        b=S2Cm+evsjX8QAz2uXQwdIWgpnFhYatieorR2pA0W1OlfpexaRt8uAWk85fd86k8exj
         ldRbevJ8RJ3hXV3FqEck/I1UfwMKIUcx8V7IuMBvmXM+V/bhBsC96fU29ha3Oywv8ZEf
         ejYaOdvv47p15uKDhyl51FvkCS6BazkTznHaEVRj/sVKqoI+B8O6mCyC4uYBaJUUZTgi
         MODMHVXJ0A34pl8jQqnhfjKa362cCftmm830OqOFfO6QEAkaxgTa8q6s9sClvXs+paAo
         MDTpWk2zUg+ZUSYjzQlK5uyuLkYV27S00SFpykixJY20FTiYc7yzW7hjJRpxTLPzWTbq
         gBZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=F++zAkK2fRYjHug1M8O2hF79PTDP/GEk7kbXJXgLTXs=;
        b=0i7tVNIsiCUzf4lYTV2hRp2VCvV04syBcSAlGPVoWW9lW3rC4cuIK+SLQh8GpfrSaa
         qod+IKOa4nh+rdvygUKZx/N8m7KICzNVPVASUBFSgjavVbbgNWgSHN0tJ+3UUm4dR6nI
         7Q0PeHxruo81Mu9ABhySjGG7RzPNMoPVvvIA4Q2oHY+l0acjrJBYaEXVNPiD8ZY3+Fvi
         yqIiAdKL5xpUejhLBGzTsLDSN6N08EIvI59Y9ZQeGVakiXFZdj/SLqR4mAm9nvUDAF8f
         jkWhNW9CEjkgcOxw3NLrmKF8oP8GBw4FGrUHP79h/QLqYDapMF6CD2GcBWowGCmumOG/
         ottw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mATVpeyg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t190-20020a375fc7000000b00706b15a6e8fsi6932417qkb.578.2023.01.30.10.27.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jan 2023 10:27:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mATVpeyg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMYqO-0001BG-EN; Mon, 30 Jan 2023 13:25:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqM-00018y-4s
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 13:25:26 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqG-00007E-Ug
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 13:25:25 -0500
Received: by mail-wr1-x430.google.com with SMTP id m14so11522452wrg.13
 for <qemu-arm@nongnu.org>; Mon, 30 Jan 2023 10:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=F++zAkK2fRYjHug1M8O2hF79PTDP/GEk7kbXJXgLTXs=;
 b=mATVpeygNuIZRd3iWVb0y3jQ0hpk3p3Z7GGJQeIgTPS04gYj6e4RMEhb//3uHSs6DK
 aciOOTXu8XmzLsZ5ut48HctoNoUeF+zrIO+kii3WhPngMhNvRCxfJNXYfB+OYqjl5MWz
 NCI1zt2QI16hlpPQMh5Oi8PjwyLfheOaW3vAIvlJRjjOYGouSEVtNwooUE/Lo2fSezU0
 QHPcRohVu8AdfNfXZUbsMy9/vzfCY3aNF8svuxFeLn5edgEmvCquC+x2nr+gajRJ6MFp
 s/sf/Z7d6667fZYbq9snVYUS+0k85bbbgL2p15u5wqUQSN5N8NHA/NqNle/q39lVC9Uc
 TmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F++zAkK2fRYjHug1M8O2hF79PTDP/GEk7kbXJXgLTXs=;
 b=59SKaNUf0V3eMkw7JuScAO6zSSauvP6MV25GTP/kj6/OqD4gMLa+iUr44jVVj6F3Bj
 OR+McWJEMZoqpM8zv7+Bma8MXdyteB1x6iGGmBk3lh2VYbDab3ROwuUMRr+ji7tl79Mv
 UZU/C8jgQignLKF6dkf6Fk5QhGVX5ZNU49/+fntMacyh7/mDpCH2cX4GCogk0PARmN+L
 RxfwZcn1Sf0EH3T1vLOo0B6Orly02rJwjpazR3f2TlZ7tACNss7oaCFu2RWQSUeTCHcW
 Jx+33QI0/YC4c6Npp/ksEDfuHuBB/O7RTCfj7yVSkvb6hOKJFVDKtFBzubfvlzGZVJNr
 O1Fg==
X-Gm-Message-State: AO0yUKUKVBbMiz2uOC/W8eonNdYWQzLD8FmJMOI7Iy7j3jmbqnZmY3g2
 vHYQghtCDb+hGIodAQPvkRuEJGiiKUIdWlKY
X-Received: by 2002:adf:a493:0:b0:2bf:b5c0:f157 with SMTP id
 g19-20020adfa493000000b002bfb5c0f157mr19018507wrb.39.1675103119514; 
 Mon, 30 Jan 2023 10:25:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b002b8fe58d6desm12245202wrr.62.2023.01.30.10.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:25:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 18/23] target/arm: Mark up sysregs for HFGITR bits 18..47
Date: Mon, 30 Jan 2023 18:24:54 +0000
Message-Id: <20230130182459.3309057-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130182459.3309057-1-peter.maydell@linaro.org>
References: <20230130182459.3309057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
X-TUID: xNOrEc22T3NY

Mark up the sysreg definitions for the system instructions
trapped by HFGITR bits 18..47. These bits cover TLBI
TLB maintenance instructions.

(If we implemented FEAT_XS we would need to trap some of the
instructions added by that feature using these bits; but we don't
yet, so will need to add the .fgt markup when we do.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230127175507.2895013-19-peter.maydell@linaro.org
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


Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1338054ejc;
        Fri, 27 Jan 2023 09:57:16 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs9gnDVaoq3yACGjVpudUxHlBvj8AHzRo9a20wuuVZC/ty9Nz1neSu/jsAaP3wGWibEUmRG
X-Received: by 2002:a05:622a:1995:b0:3b2:4309:99e with SMTP id u21-20020a05622a199500b003b24309099emr79306930qtc.54.1674842236718;
        Fri, 27 Jan 2023 09:57:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674842236; cv=none;
        d=google.com; s=arc-20160816;
        b=VCbp9vS1jjA2Bf8bmooHQiESIJctRr31LN6aP56oFN0cTbzeV/ew4XTTqnwrcs05WV
         fD0QCk3sERzQQbMy5EOkOj6pwEPzP4BT7ftgcYbbb3vMmA1KdvMQrTtZi89Q7ohAXZz1
         p3Ms41+a6nhAidOSv1shWuDwdW9vlsQaXgPUuRP3x0rhd2GKDFldoohSiWDhn9EVlPe3
         Gk4U4gu1+c9U2JtSpOrpfc+LX/+wKF2tVCsKjN+CjVndl086cezdcMOU2kOjMSUYr6Pr
         GDZkZG0axnnOcEiie3vXhdtFDXe8ausmzMVO5CV8KvsD+LyUNRSvuq90/ijRRk8bbMQ9
         hNqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HjCfQiMWNSZl3Nzxa/4M+4YiXibriZW78F2cSItPV1Q=;
        b=OPT2/iBxVsOgAA1akcroyTk9qVc/q4nQsLyVgHVkJlPjbYWyOzxms5sRfNyR7AeW9W
         c7M/+rJftd4X7uAQ9ZuCNWN49bUza2DRon16im/2xVsun6eEudEe3qwIrUL2FY6zahnp
         zqNVCvs7zqUyatXLfyMPp/UsMAXf+j2q2cWCRwaHnCJ7rmMI35SJyZxFwyCWiOWAyi7C
         qobLwG2EKE8ypDXb4GplI37ONUDMFJcRDNFBBCfYJvq840LzTV5SWYxixu8eaKeL6p/T
         KjyJynktdIaO7QJCiwiCIUIlub5jT1H4Kjt37s8aeKwJz0F7B6zWyNY813EmzuGT4ry1
         20pA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ez6vbJgn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z12-20020a05620a100c00b006feb1b257absi2942756qkj.110.2023.01.27.09.57.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jan 2023 09:57:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ez6vbJgn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLSwx-0000uZ-Jh; Fri, 27 Jan 2023 12:55:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwo-0000oQ-FM
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:35 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwl-00064K-In
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:34 -0500
Received: by mail-wr1-x429.google.com with SMTP id m14so5215406wrg.13
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 09:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HjCfQiMWNSZl3Nzxa/4M+4YiXibriZW78F2cSItPV1Q=;
 b=Ez6vbJgnyhssktc7+5STfLqmsh/9PjBxRjJIjsuYQq6YAFhLuW+gKKgUJCjB+Ec2oV
 U0u7lv44oaeL+jGQIy8kdJ0UyjfKH1ZExldsVOm63mMqLf0xunxhId44O/Tw9Robflm0
 FmJkHrCO6ksqkpIfA/hLwOavFkIbHUArQtCo3A0jnv7YpiDwtNnfjt5KYPx32ebzKR1X
 h6wntmusk4nH2+tCtlUd0yorg4RMDgECB/bfWTZna9T0A8N+IHYmx0zKnocI3CdBioQk
 oMhDd0ytUeC8Fm887Q4ZVN55X6BU6koV4PpBqz+SOFffN0+3/rW5fL3e+mw3o1H10uyP
 pepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HjCfQiMWNSZl3Nzxa/4M+4YiXibriZW78F2cSItPV1Q=;
 b=rg71Dn8U1cSzeBNwcgydFoSm7TrpZJgiWmeS/cZiJ2MqlwqnSjMb9sHcTN8UW952XO
 aC9dxINj+fJRHu24wIPmBDgTjoGcefUDnU7U8YnrMdyiG822LLM/HnoDqGCP1XNF/KzY
 75dY3snARDQGizRtr12M/Yxp6Li2jDX5XtZulEw4jHvALadsbWJOz+ZAvqa8vWA51Jkw
 0biI3odFo5oIqJJ9lj4vHYUqrEIu4GIBHucVZRCQnKrt0ZRzbxd93ScsFL2ZbvLPJhuk
 05J6GU4VidtGKyODNMqer2dnXzp82KUECH8rxsGCkzjzlzwrY/Yu1T/Ad1NS0CO4zI4M
 pO5g==
X-Gm-Message-State: AFqh2kr1bBTIymlBdQPHBUcehNhiph53ZwRpjHsjWpmyXdGXoBrxIQ+E
 vy+SiwpC07tcvuTMym0Nm+iOx1PKQwvI3Bn2
X-Received: by 2002:a5d:56d1:0:b0:242:ac3:87f4 with SMTP id
 m17-20020a5d56d1000000b002420ac387f4mr34741700wrw.50.1674842130052; 
 Fri, 27 Jan 2023 09:55:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002366e3f1497sm4545089wro.6.2023.01.27.09.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:55:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 19/23] target/arm: Mark up sysregs for HFGITR bits 48..63
Date: Fri, 27 Jan 2023 17:55:03 +0000
Message-Id: <20230127175507.2895013-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127175507.2895013-1-peter.maydell@linaro.org>
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
X-TUID: /KyqZH+dky90

Mark up the sysreg definitions for the system instructions
trapped by HFGITR bits 48..63.

Some of these bits are for trapping instructions which are
not in the system instruction encoding (i.e. which are
not handled by the ARMCPRegInfo mechanism):
 * ERET, ERETAA, ERETAB
 * SVC

We will have to handle those separately and manually.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpregs.h | 4 ++++
 target/arm/helper.c | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 2e5ac6b4f98..efcf9181b97 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -696,6 +696,10 @@ typedef enum FGTBit {
     DO_BIT(HFGITR, TLBIVAAE1),
     DO_BIT(HFGITR, TLBIVALE1),
     DO_BIT(HFGITR, TLBIVAALE1),
+    DO_BIT(HFGITR, CFPRCTX),
+    DO_BIT(HFGITR, DVPRCTX),
+    DO_BIT(HFGITR, CPPRCTX),
+    DO_BIT(HFGITR, DCCVAC),
 } FGTBit;
 
 #undef DO_BIT
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5b9cc087e28..c0403aadae2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5295,6 +5295,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "DC_CVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NOP,
+      .fgt = FGT_DCCVAC,
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_CSW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 2,
@@ -7588,10 +7589,12 @@ static const ARMCPRegInfo mte_el0_cacheop_reginfo[] = {
     { .name = "DC_CGVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 3,
       .type = ARM_CP_NOP, .access = PL0_W,
+      .fgt = FGT_DCCVAC,
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_CGDVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 5,
       .type = ARM_CP_NOP, .access = PL0_W,
+      .fgt = FGT_DCCVAC,
       .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_CGVAP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 3,
@@ -7747,24 +7750,30 @@ static CPAccessResult access_predinv(CPUARMState *env, const ARMCPRegInfo *ri,
 static const ARMCPRegInfo predinv_reginfo[] = {
     { .name = "CFP_RCTX", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 3, .opc2 = 4,
+      .fgt = FGT_CFPRCTX,
       .type = ARM_CP_NOP, .access = PL0_W, .accessfn = access_predinv },
     { .name = "DVP_RCTX", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 3, .opc2 = 5,
+      .fgt = FGT_DVPRCTX,
       .type = ARM_CP_NOP, .access = PL0_W, .accessfn = access_predinv },
     { .name = "CPP_RCTX", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 3, .opc2 = 7,
+      .fgt = FGT_CPPRCTX,
       .type = ARM_CP_NOP, .access = PL0_W, .accessfn = access_predinv },
     /*
      * Note the AArch32 opcodes have a different OPC1.
      */
     { .name = "CFPRCTX", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 0, .crn = 7, .crm = 3, .opc2 = 4,
+      .fgt = FGT_CFPRCTX,
       .type = ARM_CP_NOP, .access = PL0_W, .accessfn = access_predinv },
     { .name = "DVPRCTX", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 0, .crn = 7, .crm = 3, .opc2 = 5,
+      .fgt = FGT_DVPRCTX,
       .type = ARM_CP_NOP, .access = PL0_W, .accessfn = access_predinv },
     { .name = "CPPRCTX", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 0, .crn = 7, .crm = 3, .opc2 = 7,
+      .fgt = FGT_CPPRCTX,
       .type = ARM_CP_NOP, .access = PL0_W, .accessfn = access_predinv },
 };
 
-- 
2.34.1


Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp724581eji;
        Mon, 18 Dec 2023 03:38:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFk1qv97uM6v3wcLSJiO0dkKZWXcObEBdplpJSWtz2DGpbods/J34S8HPQ7Qm1nzqGx1PBl
X-Received: by 2002:ac8:4e50:0:b0:423:a4f6:9a8e with SMTP id e16-20020ac84e50000000b00423a4f69a8emr22302953qtw.24.1702899496370;
        Mon, 18 Dec 2023 03:38:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702899496; cv=none;
        d=google.com; s=arc-20160816;
        b=f08v3gh1PrDlbGxUt3oxr9L2o56s9y7XDYWU8Qq/xtIUd1zGkYHP89Cje01uIdPTFb
         0hKpa8V6Fk11pq3B1OK+jJS8b6+sQjW5bQksgW1EngvDdcnPf/rs/LqITDvTpl5UlbXw
         X6fRl5cF8DAPCHwgomLcAXOdsFC/nNUQ3OvT6ER4yH1Q7UJwA6CJdG1C2rFgis6CA4zl
         XwVOZ4xnli6+OhFZzAEbHGwAUL8C+QoSixqqZtS3U32izyDe7dVQKa+3xYZ3yDUQVDTR
         /Nj43Aant8uFlqNS4p6N0o4RwJdEnJ0CbikYfzRmOo8GrmOU1KQDo5BNCK7CAGgaugz+
         pA0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TmxW7KVfKlZkNiHA6/fprQpfKnNWnbFdOQHNckFDGhI=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=Gz+w+UuRd45ofH4R9O+6cwsld8Vc4RiCuXwtpJqmA3z555GsdNaecjeSjAmgzcTNAx
         7HChVswFEk9+g/WtYMXGhQhGoaxCoRJj9dzjCGSgf/XUC/WF8DRGISjLdARzjk5FoTPt
         qSzmSFO2uNt6/y+sTeSnmIUZlxXwIiM+dWvJoPN2Y+iJb6BxXPuG4l1ov3lSjpgjA8q3
         ym3z+ybhRjuiYnafwzl27+rXgr9xBraeIRqrI6flMACKcNsxIMGkVeMDknVAu+7rzJ/2
         gLf8aEb9lw+rAi8unrcK3D9M5ZRS3BY2bGAwwA92uJuyDU6T+tKloIw/2QPj+EYWAqHJ
         FBDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kOTCyVZc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2-20020a05622a118200b004257f21e5adsi25746229qtk.520.2023.12.18.03.38.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 03:38:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kOTCyVZc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFBsX-0007ME-AP; Mon, 18 Dec 2023 06:33:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBsO-00078f-3d
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:36 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBsB-0003Oj-DO
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:35 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40c236624edso31645845e9.1
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 03:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702899202; x=1703504002; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TmxW7KVfKlZkNiHA6/fprQpfKnNWnbFdOQHNckFDGhI=;
 b=kOTCyVZcxE1lU9+Jb19z6u6/F2RtJvV9XxdxRovheilvZpDZzFdBPA0ZT+d6WhpKK+
 oFJuZ8QzdNr7NJmeG4noAKJ0yEB5S7+PYXmjST1K74S14uAvi1oM4me6tmoJtXriYyVO
 IuK/kGn9v1FZ+mjvatSoPATN5TrFSCfBJxfYADlSBv/5E/lV3Tx7R6zFJk3Om/UaePrS
 O7L3SZtMqgYoHm6XEwwviE+6YtbWgzzJVjWHLkELJKsJ7tFGdbdGX6XmjLGLbsi9uG9A
 2bj/HVg6XVAU4Gl1mXT0T2HZ/5sRPxfRTexL8x9x91ojQMMRfuOrOP8oCsd0ZPg1UBTk
 zjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702899202; x=1703504002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TmxW7KVfKlZkNiHA6/fprQpfKnNWnbFdOQHNckFDGhI=;
 b=fbnkkntJV83Da1UNJDAAVUS8VwVfb8nlQqMnHJEzawB6ktcjOj0nmI/9YOEY8dsUg0
 H2kH8aGds5sIvce4A9oHn1X/6YFyTbN79gc4xjL3E6CgHQJCuw4lCZwredwe6gmh3tTn
 ZIOaAG9auMZCCq7K5022bl57BqGNZRPlzBGAdPC4lPHOcySKfnswD246wVJmfoxWmX/C
 NRF2ADYE620M9z9dR88g1Jy1TBXvr4V+ZuoZaBqIfoyd+C+Gm7SmAata7gXRzW0eGo/Z
 IeoIgkk0+m4gDhawce3CQv+n6S1WswO+ywXBLiEtBlpyuv0VhCqv9gAFtFLb5Vwqc2S4
 EW8Q==
X-Gm-Message-State: AOJu0YwKgaX0jjCsiSvlGEBRBCdYjkj2pkaL65Np+STUPTBLJqI2zDOh
 hUAhE36Vi14V+pHpEIIb6JzqUwvQNcqeneMQoNI=
X-Received: by 2002:a05:600c:4f11:b0:40c:295f:1195 with SMTP id
 l17-20020a05600c4f1100b0040c295f1195mr8213144wmq.55.1702899202129; 
 Mon, 18 Dec 2023 03:33:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adff012000000b003366da509ecsm671193wro.85.2023.12.18.03.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 03:33:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 32/35] hw/intc/arm_gicv3_cpuif: Mark up VNCR offsets for GIC
 CPU registers
Date: Mon, 18 Dec 2023 11:33:02 +0000
Message-Id: <20231218113305.2511480-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218113305.2511480-1-peter.maydell@linaro.org>
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: dMLSKig6IcRn

Mark up the cpreginfo structs for the GIC CPU registers to indicate
the offsets from VNCR_EL2, as defined in table D8-66 in rule R_CSRPQ
in the Arm ARM.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 258dee1b808..96539cdbe9a 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -2684,6 +2684,7 @@ static const ARMCPRegInfo gicv3_cpuif_hcr_reginfo[] = {
     { .name = "ICH_AP0R0_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 8, .opc2 = 0,
       .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .nv2_redirect_offset = 0x480,
       .access = PL2_RW,
       .readfn = ich_ap_read,
       .writefn = ich_ap_write,
@@ -2691,6 +2692,7 @@ static const ARMCPRegInfo gicv3_cpuif_hcr_reginfo[] = {
     { .name = "ICH_AP1R0_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 9, .opc2 = 0,
       .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .nv2_redirect_offset = 0x4a0,
       .access = PL2_RW,
       .readfn = ich_ap_read,
       .writefn = ich_ap_write,
@@ -2698,6 +2700,7 @@ static const ARMCPRegInfo gicv3_cpuif_hcr_reginfo[] = {
     { .name = "ICH_HCR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 11, .opc2 = 0,
       .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .nv2_redirect_offset = 0x4c0,
       .access = PL2_RW,
       .readfn = ich_hcr_read,
       .writefn = ich_hcr_write,
@@ -2729,6 +2732,7 @@ static const ARMCPRegInfo gicv3_cpuif_hcr_reginfo[] = {
     { .name = "ICH_VMCR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 11, .opc2 = 7,
       .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .nv2_redirect_offset = 0x4c8,
       .access = PL2_RW,
       .readfn = ich_vmcr_read,
       .writefn = ich_vmcr_write,
@@ -2739,6 +2743,7 @@ static const ARMCPRegInfo gicv3_cpuif_ich_apxr1_reginfo[] = {
     { .name = "ICH_AP0R1_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 8, .opc2 = 1,
       .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .nv2_redirect_offset = 0x488,
       .access = PL2_RW,
       .readfn = ich_ap_read,
       .writefn = ich_ap_write,
@@ -2746,6 +2751,7 @@ static const ARMCPRegInfo gicv3_cpuif_ich_apxr1_reginfo[] = {
     { .name = "ICH_AP1R1_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 9, .opc2 = 1,
       .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .nv2_redirect_offset = 0x4a8,
       .access = PL2_RW,
       .readfn = ich_ap_read,
       .writefn = ich_ap_write,
@@ -2756,6 +2762,7 @@ static const ARMCPRegInfo gicv3_cpuif_ich_apxr23_reginfo[] = {
     { .name = "ICH_AP0R2_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 8, .opc2 = 2,
       .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .nv2_redirect_offset = 0x490,
       .access = PL2_RW,
       .readfn = ich_ap_read,
       .writefn = ich_ap_write,
@@ -2763,6 +2770,7 @@ static const ARMCPRegInfo gicv3_cpuif_ich_apxr23_reginfo[] = {
     { .name = "ICH_AP0R3_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 8, .opc2 = 3,
       .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .nv2_redirect_offset = 0x498,
       .access = PL2_RW,
       .readfn = ich_ap_read,
       .writefn = ich_ap_write,
@@ -2770,6 +2778,7 @@ static const ARMCPRegInfo gicv3_cpuif_ich_apxr23_reginfo[] = {
     { .name = "ICH_AP1R2_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 9, .opc2 = 2,
       .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .nv2_redirect_offset = 0x4b0,
       .access = PL2_RW,
       .readfn = ich_ap_read,
       .writefn = ich_ap_write,
@@ -2777,6 +2786,7 @@ static const ARMCPRegInfo gicv3_cpuif_ich_apxr23_reginfo[] = {
     { .name = "ICH_AP1R3_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 9, .opc2 = 3,
       .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .nv2_redirect_offset = 0x4b8,
       .access = PL2_RW,
       .readfn = ich_ap_read,
       .writefn = ich_ap_write,
@@ -2898,6 +2908,7 @@ void gicv3_init_cpuif(GICv3State *s)
                       .opc0 = 3, .opc1 = 4, .crn = 12,
                       .crm = 12 + (j >> 3), .opc2 = j & 7,
                       .type = ARM_CP_IO | ARM_CP_NO_RAW,
+                      .nv2_redirect_offset = 0x400 + 8 * j,
                       .access = PL2_RW,
                       .readfn = ich_lr_read,
                       .writefn = ich_lr_write,
-- 
2.34.1


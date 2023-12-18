Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp724695eji;
        Mon, 18 Dec 2023 03:38:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHN6Z/ndq77P9GsK5o9J1Uu5hWvxOEuNnX0gjytPoWJIkwh3fHEkRDVsTA09lq65Wpaf2PP
X-Received: by 2002:a05:6808:2129:b0:3b8:b063:8244 with SMTP id r41-20020a056808212900b003b8b0638244mr21292695oiw.70.1702899509356;
        Mon, 18 Dec 2023 03:38:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702899509; cv=none;
        d=google.com; s=arc-20160816;
        b=i20gSGbBo73gE6NGD372Ze/6hEyZCjBwLOJ4IdhjNP5rqZiYRQ/obYVY9gkrkYAZ/e
         CucfFHozd+du567iPPdYvjKISz8ZxMRMrKwIe6GAq1d2RCFoC458v5wdTjfbeaIIeMnu
         4ananP+L10dS+wCC2o57Flybz5eibv4q8OnKNrpquydh1CZg6jdIaed+w3geZZzQ43oc
         oTEUA8TY7htLaYUJfgL3aXty5Ze3Rf57hPZJBoazO0Hbvm0ksnVaehUgVVmkk4IyJ/b3
         r6K1vvkE0PCYVffYEes0DuPuqbMMRQa5SDlNjggIb4Wt6hP1VhBv1dshJ9w5ScS6++Qb
         Odag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cnaAgGELiStMiiqiZ/WGnlE6jWaXkDE/fig9LQyAGcg=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=wQr1U5nWIUS//XKu3hvHnXtBoGTB5fH5VNW4a4NNxG/UZzwpAvDKHP8nYbG+ioodQu
         jSxAaqoGBC4X1nr4sphrViJuD/cxXPyUbsfER8c9Xp844sXNg412KtfPElXQdAw/XUaJ
         9vRz3UYyRRgDpEv85UTwpJ3mQeW1oGx8A0qPiz5GU12mMYtNcSYdhCNTTSFBVhpSvCU1
         G+C6cUEwd8xIQDcaYkgT1d23Voq97xe+ea6yA6VZFIPyNTrm4a3YgCHM7yEx5yFRvwzR
         b/bwiBYHsk9szyOxECiQiYUgs2SxO6Vd7cazxodZKHyFYn4Bs9RmguivBssOmDgQi4qz
         cePQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="svZF/0nL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g6-20020a0cf086000000b0067f2193a916si6507184qvk.413.2023.12.18.03.38.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 03:38:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="svZF/0nL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFBsG-000724-6r; Mon, 18 Dec 2023 06:33:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBsE-0006xa-Ia
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:26 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBs7-0003ME-1A
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:26 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40c3fe6c08fso32788975e9.1
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 03:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702899197; x=1703503997; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cnaAgGELiStMiiqiZ/WGnlE6jWaXkDE/fig9LQyAGcg=;
 b=svZF/0nLA3Lgvz5LNmtl4+J632zMGgFFqZH4JLAiExhu6bPJh4ILQDrNCbstBjwpjT
 r2v2OjS1735IgrDi95f3gkK6ZgypKlkdsDy+g8NgPYEBzitmNHtpgLOmSnLRO7zztRry
 sgwsf5zBuku8Iw0ePGpJwckYjBYhlhvpLI618nKoAPVYpnHlG6BKkjf+0WG8YvTQtOW7
 aB0Z8Sfh461VugjDEiT9Lwxlf0Z4cZfoGVo7d4OLc47aFrLwV1S8sPg1thPJEd2KUp8O
 /g6ojFjRcKYGGvyyKKdjPE6ZBaS9v/qEqOzXK+5bs8797hsJvEncpBD5Vyd5BaADu75m
 fWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702899197; x=1703503997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cnaAgGELiStMiiqiZ/WGnlE6jWaXkDE/fig9LQyAGcg=;
 b=G4ZLOVFA69ytpK1WjV7jSE0jayZ09VireZfqR62S9fvD2hEnf9soHTIYzE06puK0lw
 gYN6234CZWbSpW+0A2O6i7V2jx0/OuM05hJ0aFTRFiPL7tlV9wEMctEyBUfYp66v2pbe
 ZKrCEDbUfh4ClQX3evIaR1bBRa7Paqq+2s4wmXR3yB9H1O4+XWEBAu2LWQbdgeWZsDUe
 tMMKcowaj1uyufDiZ20MYsvzVk/F8f/CZxuQyiO22j0te6JAym4RS7W7h8jhWqAjwfjt
 82//433sZEXniOxL69U8SBYOsozIw9n+ksicendnSCIT3QIx6g3ca2MnBTFYDld9bnBN
 LYSw==
X-Gm-Message-State: AOJu0YxFdEqr77jV+9uSdSD75Lw1so5fQ4dm64AVM5dANiuHSJ0b7bEn
 PB07kLE5ETKcLYGdTDY2HMOn4k+VMOhAhfeBDaI=
X-Received: by 2002:a7b:cd0c:0:b0:40c:359c:47fd with SMTP id
 f12-20020a7bcd0c000000b0040c359c47fdmr5590379wmj.178.1702899197767; 
 Mon, 18 Dec 2023 03:33:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adff012000000b003366da509ecsm671193wro.85.2023.12.18.03.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 03:33:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 23/35] target/arm: Implement VNCR_EL2 register
Date: Mon, 18 Dec 2023 11:32:53 +0000
Message-Id: <20231218113305.2511480-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218113305.2511480-1-peter.maydell@linaro.org>
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: znpLVqfuLnGT

For FEAT_NV2, a new system register VNCR_EL2 holds the base
address of the memory which nested-guest system register
accesses are redirected to. Implement this register.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    |  3 +++
 target/arm/helper.c | 26 ++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 0ec67847181..9df8fc08d79 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -547,6 +547,9 @@ typedef struct CPUArchState {
         uint64_t gpccr_el3;
         uint64_t gptbr_el3;
         uint64_t mfar_el3;
+
+        /* NV2 register */
+        uint64_t vncr_el2;
     } cp15;
 
     struct {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index afed58b6f7f..45444360f95 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8107,6 +8107,28 @@ static const ARMCPRegInfo fgt_reginfo[] = {
       .access = PL2_RW, .accessfn = access_fgt,
       .fieldoffset = offsetof(CPUARMState, cp15.fgt_exec[FGTREG_HFGITR]) },
 };
+
+static void vncr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                       uint64_t value)
+{
+    /*
+     * Clear the RES0 bottom 12 bits; this means at runtime we can guarantee
+     * that VNCR_EL2 + offset is 64-bit aligned. We don't need to do anything
+     * about the RESS bits at the top -- we choose the "generate an EL2
+     * translation abort on use" CONSTRAINED UNPREDICTABLE option (i.e. let
+     * the ptw.c code detect the resulting invalid address).
+     */
+    env->cp15.vncr_el2 = value & ~0xfffULL;
+}
+
+static const ARMCPRegInfo nv2_reginfo[] = {
+    { .name = "VNCR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 2, .opc2 = 0,
+      .access = PL2_RW,
+      .writefn = vncr_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.vncr_el2) },
+};
+
 #endif /* TARGET_AARCH64 */
 
 static CPAccessResult access_predinv(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -9590,6 +9612,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             define_arm_cp_regs(cpu, rme_mte_reginfo);
         }
     }
+
+    if (cpu_isar_feature(aa64_nv2, cpu)) {
+        define_arm_cp_regs(cpu, nv2_reginfo);
+    }
 #endif
 
     if (cpu_isar_feature(any_predinv, cpu)) {
-- 
2.34.1


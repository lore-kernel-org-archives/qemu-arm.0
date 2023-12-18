Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp722740eji;
        Mon, 18 Dec 2023 03:34:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHK+dgeVsgsTg+SWpCCtevhLeHKpL/ZU6NWmxzT1FftOSXcBjzRUVRoy9fMT6m4CjZzRcfr
X-Received: by 2002:a05:6808:3c89:b0:3b8:94c0:87fb with SMTP id gs9-20020a0568083c8900b003b894c087fbmr21471455oib.9.1702899264382;
        Mon, 18 Dec 2023 03:34:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702899264; cv=none;
        d=google.com; s=arc-20160816;
        b=CS7NcdrePL1piRH3jTO1Xl3XmxTW9NakYzR7C2/iwJWmzt3ijC0nm+pzqq3WUBz065
         YqlaX0ESURDVf8D9x7lbYHn/d1XbtsmqX1zh+RqLn76V5FEpkGa4L6QkuBQsPmZA7w2i
         fGiw5+uupYuyxX9C2gDKLPXnamgI89kbgjvnx9mXwS/KHgZjfl9k+YAxGSkRsb7jTOzu
         sy5siiKz5RgXUwqnqBnnY5cCFlET+rtmSIFqQazLw1P0ZKLTnmhorZh87VgabWMakOjL
         +Cce+jLWveDZ8eSyvT/pQZwNVPMAEE2FKk+1h+ASSr7inzfbCahYZ5C8VA0FSKTIrBvv
         4FuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pI9y91DFQZNTbXdExRzAPNc0Dc6/QVSgo+x9WHnJ4D4=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=StQJUhjWGWnBJ/RDEf3XEU9+GApF2RJsl43hNlqY0o/JZsq0XhogdVAsixEvj6UGiq
         ABLmlEWYGdNz2nWyQCrFSCgwe1Qm0LL6nxyk/nQz3Iozd2NqOQf0dqVaiHs/ZjRskXoZ
         ofZth4fMk51JFaiyWRngL9f0YUEwFBx0Eij97QRPzu74Mmak9EDN48CMJ8yJz+DK5IaR
         tnkRS727LndsIaYUUjZ3hB4aMeAS+kj8kWuRLKMHHc4DB+LISoXpRHuNwVmSupIfVCFj
         f+k4VzQI2t9yTYBij1Iv9h/26mBrTyzpCHFeyWgz1gjyLukHywjhpltewyjfGLMEbCtt
         pmrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hY/r8ifh";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d4-20020a0cb2c4000000b0067f0b5ca1e2si2449021qvf.253.2023.12.18.03.34.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 03:34:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hY/r8ifh";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rFBs5-0006bC-Kw; Mon, 18 Dec 2023 06:33:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBs2-0006Ye-MA
 for qemu-devel@nongnu.org; Mon, 18 Dec 2023 06:33:14 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBry-0003HV-Gg
 for qemu-devel@nongnu.org; Mon, 18 Dec 2023 06:33:14 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40c55872d80so21726035e9.1
 for <qemu-devel@nongnu.org>; Mon, 18 Dec 2023 03:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702899189; x=1703503989; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pI9y91DFQZNTbXdExRzAPNc0Dc6/QVSgo+x9WHnJ4D4=;
 b=hY/r8ifhnnkLT8kCj5d6TSHFlhNM4CteUJjUba5lnZj719FMg00uA49gBNyTQE/YWe
 Dmsbw/1Q4RwsCv7AJ+aYoj6Jgeb3WjpzqhbCgy4lj0Y//yGWiEGH/7Q/JyjEKnuaPkyl
 OTqVI1eYaYLxOWUh5KOWBMhhyWh44yqkMq2ctCvQyQlOzl5RSVdVgYjC406uR0upx4q5
 PM7QUsh+ajwVCpQ1wLvIcy7lMTKGQyRI/+0bCbjFaYUVgftXvrClCwxP4f+OJqxbqXI8
 MiFOoo/ruwWF87uBwQu91w2UYqv20/ZmIBPm+Tk6iATNGIEZtxw8j+l0VjC5WiJ9e2Ea
 wB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702899189; x=1703503989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pI9y91DFQZNTbXdExRzAPNc0Dc6/QVSgo+x9WHnJ4D4=;
 b=sh/PW3GFenip4yTk9td0Snd+UyXVxH08MatHe94GFk/NIpPy5dgZ83iB1C0fgEb3vI
 JuWvdBvq6Nd9JVi8EkgLExAW+v/LoT4vo+bAHZ1T74cc9/1xzKtVL+s4vF+FnDI6Gwjh
 nzfr8h0hdcPwBA1LVmdLRRTBT+XLz5I5xTpz8KWislb9YxzTe36kpQuGc1gxK5tUgmfO
 SEzkfAeFNUp3MeRHCEyPpmwSYF9Po1mi4u5q9KvPOKauI80gTvKsPCcUv626bIyprOaW
 z+7JCSGkFxwRkmzkvg7fqpFmpMIP5X8u+4xDOW5RzGy9BSvqdorfFP4jQe55u7FyMQPV
 66EQ==
X-Gm-Message-State: AOJu0YyZpF+Oth02xIzBgC0S389SbxER7UIRdTZBwi0+rMTZ67BJKKa2
 f8wyAwzGT6AGLn+Ki9EIvKJ48g==
X-Received: by 2002:a05:600c:3c8b:b0:40c:4b42:a20b with SMTP id
 bg11-20020a05600c3c8b00b0040c4b42a20bmr5830850wmb.8.1702899189147; 
 Mon, 18 Dec 2023 03:33:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adff012000000b003366da509ecsm671193wro.85.2023.12.18.03.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 03:33:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/35] target/arm: Implement HCR_EL2.AT handling
Date: Mon, 18 Dec 2023 11:32:35 +0000
Message-Id: <20231218113305.2511480-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218113305.2511480-1-peter.maydell@linaro.org>
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: OIzCALqLMLTB

The FEAT_NV HCR_EL2.AT bit enables trapping of some address
translation instructions from EL1 to EL2.  Implement this behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ca8de414bdb..f1c7fbf319c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3687,6 +3687,15 @@ static CPAccessResult at_s1e2_access(CPUARMState *env, const ARMCPRegInfo *ri,
     return at_e012_access(env, ri, isread);
 }
 
+static CPAccessResult at_s1e01_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                      bool isread)
+{
+    if (arm_current_el(env) == 1 && (arm_hcr_el2_eff(env) & HCR_AT)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    return at_e012_access(env, ri, isread);
+}
+
 static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
@@ -5552,22 +5561,22 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 8, .opc2 = 0,
       .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
       .fgt = FGT_ATS1E1R,
-      .accessfn = at_e012_access, .writefn = ats_write64 },
+      .accessfn = at_s1e01_access, .writefn = ats_write64 },
     { .name = "AT_S1E1W", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 8, .opc2 = 1,
       .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
       .fgt = FGT_ATS1E1W,
-      .accessfn = at_e012_access, .writefn = ats_write64 },
+      .accessfn = at_s1e01_access, .writefn = ats_write64 },
     { .name = "AT_S1E0R", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 8, .opc2 = 2,
       .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
       .fgt = FGT_ATS1E0R,
-      .accessfn = at_e012_access, .writefn = ats_write64 },
+      .accessfn = at_s1e01_access, .writefn = ats_write64 },
     { .name = "AT_S1E0W", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 8, .opc2 = 3,
       .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
       .fgt = FGT_ATS1E0W,
-      .accessfn = at_e012_access, .writefn = ats_write64 },
+      .accessfn = at_s1e01_access, .writefn = ats_write64 },
     { .name = "AT_S12E1R", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 7, .crm = 8, .opc2 = 4,
       .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
@@ -8145,12 +8154,12 @@ static const ARMCPRegInfo ats1e1_reginfo[] = {
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 0,
       .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
       .fgt = FGT_ATS1E1RP,
-      .accessfn = at_e012_access, .writefn = ats_write64 },
+      .accessfn = at_s1e01_access, .writefn = ats_write64 },
     { .name = "AT_S1E1WP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 1,
       .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
       .fgt = FGT_ATS1E1WP,
-      .accessfn = at_e012_access, .writefn = ats_write64 },
+      .accessfn = at_s1e01_access, .writefn = ats_write64 },
 };
 
 static const ARMCPRegInfo ats1cp_reginfo[] = {
-- 
2.34.1


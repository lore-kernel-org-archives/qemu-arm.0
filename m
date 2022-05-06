Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1975005lfj;
        Fri, 6 May 2022 11:03:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHtUH3TaYZMm9c35mSvQXokFEaLEHphaXcIH17v98G/fteb6P1aswHtecaK+xwlsL1LM31
X-Received: by 2002:a05:622a:187:b0:2f3:a7e4:ffa5 with SMTP id s7-20020a05622a018700b002f3a7e4ffa5mr4053630qtw.508.1651860220274;
        Fri, 06 May 2022 11:03:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651860220; cv=none;
        d=google.com; s=arc-20160816;
        b=X7wO2iDfqtBfy/fr4qhmIm7BufIcUs0LeKMH/6yujfJm05cawhgTXxDX+EDXONIcC9
         TH4ixxDfXM5DqGZeMQcusYpM4Ilk5pOrrvVnN/GTk19vkn+c0ESGO/+p9W4JKtYLMJq4
         bdmJdNQ5HKc+o60B6/jVMEgn8Iu6RlXqN4bJ/TVsk1c7v+FdHpfr7Q75zy1e5qw5kbfL
         GbXTL4qUzQ5WCmIXz8yZxCmo8E1GRYNqtI7eS1/impTpjulKcDhp8pmSApFImEw+oSle
         yTN3Q77LXpg3qDOrc6YGNCmC3i5jk5mjaybPEHKRCODeIDj2jPL4aNhOkl+TecZOEtTD
         Y/Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4YqOGbb38qjiPY2dXCdLJrEWMXvDZh6b/gyG/7bmWLA=;
        b=iTj/oXAdvudtjplrP/cU8Uyt7v5IZd4AienO1h4wLpVMfGgg2BbAq9qSmGAKynIFKW
         IL41/rOCy8Avskpo2cx4kAgttGUcqnlP/cTdQx+UwcUIZTv0PMXf8QNHn5NevavA+ORC
         zlsAlQk3Fy3Y3aNS8FdBrQuDqerA4KhJZ6LOgB4tIr5G475zYfWg/VgkrRvS0x+LkrfQ
         Os9JcKTdWWTODapOj/TcranxTHhOvrSeIOtti/hgn62eg2V7hEZwKTgGVoAPYuhE9ugu
         Jmdx2qjtRAnZ8DOj/MbNqP7TK5xG24FoW+/xMsFs5jstMsUetiefNkteubFHleYDnjVS
         VJxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IdsrfcLZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13-20020a05620a24cd00b006a043886e08si1713614qkn.657.2022.05.06.11.03.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 May 2022 11:03:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IdsrfcLZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nn2Il-0006I6-O9
	for alex.bennee@linaro.org; Fri, 06 May 2022 14:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2I1-0005Bu-AO
 for qemu-arm@nongnu.org; Fri, 06 May 2022 14:02:53 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:41739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2Hz-0003nu-GZ
 for qemu-arm@nongnu.org; Fri, 06 May 2022 14:02:52 -0400
Received: by mail-oi1-x230.google.com with SMTP id e189so8276376oia.8
 for <qemu-arm@nongnu.org>; Fri, 06 May 2022 11:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4YqOGbb38qjiPY2dXCdLJrEWMXvDZh6b/gyG/7bmWLA=;
 b=IdsrfcLZ8C03H55YUSl/U83BSKIlU4ZHuCoBO/cHOqftzrO88aBwlrh9tD49aF7sB6
 bhHKBX79dfoIw/6HtqDXrPwUeITfgPHbN6IIrNP0nVevYNGvFRy696qYGbTi9SgsY2dA
 8rnGp40uhml0l1IpCavyvjBBl06oee8tWQBOPX+gsQNZGPazl2ntzkQ4D/pBDDNwo0wB
 mrQ5AtsX7XiKd8TnkyGjRKPeF7cUpFTvPzzNJRVtBTPG1UA4vOUDc8yhuFaGc7mo/Wrp
 8oHSMVskAxu5TQu0tavzviCyqVv93tHH64BZMZ0DkZWQ9149ATNHae5QT5jgB2MwHq0y
 n2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4YqOGbb38qjiPY2dXCdLJrEWMXvDZh6b/gyG/7bmWLA=;
 b=xZQ1NBYfKAfIzkCLe+JlE7hX+WSQr929aru8x4uz9c6coCf5GymDFWJZVVijnRZofY
 jQTe7zC123nAyPdW35bxyVniLN95VXpT1HJLi4vesATPMRwj6NfnOpJgW2SP1AoNeeDA
 oOfFxY9fQ+B/JjEn9JsL/tK3h5fREgiQpEIQSlisUXO/u8roeqFHtwb56jJqokcWHwUN
 0j9iQWlWnaZJQyan0SJsUCnDe+iD+QdjW4WaiiDET+FFb6P5rMMsU8okPa3mJ7gBoDzi
 A8rxo5lQ6Tp70hEnmc5ENgiyGWj+P8ZDlXT3KVFrBcoxX22bRXOmXHY9/HiOVbwpX80U
 8OfQ==
X-Gm-Message-State: AOAM530WgeAEXSj7WymUXav+TZzjWtdO8QXR6JUVtkvtTzR6Ga3HaVMq
 bDtnSDwi+04xLcN+to+u7yHh2Q==
X-Received: by 2002:a05:6808:220d:b0:326:4eb1:6911 with SMTP id
 bd13-20020a056808220d00b003264eb16911mr2128189oib.200.1651860170775; 
 Fri, 06 May 2022 11:02:50 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:02:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 03/24] target/arm: Merge zcr reginfo
Date: Fri,  6 May 2022 13:02:21 -0500
Message-Id: <20220506180242.216785-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: slyNHRytlf/X

Drop zcr_no_el2_reginfo and merge the 3 registers into one array,
now that ZCR_EL2 can be squashed to RES0 and ZCR_EL3 dropped
while registering.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 55 ++++++++++++++-------------------------------
 1 file changed, 17 insertions(+), 38 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ea2788b3d5..72d05070f0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6122,35 +6122,22 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
-static const ARMCPRegInfo zcr_el1_reginfo = {
-    .name = "ZCR_EL1", .state = ARM_CP_STATE_AA64,
-    .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 2, .opc2 = 0,
-    .access = PL1_RW, .type = ARM_CP_SVE,
-    .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[1]),
-    .writefn = zcr_write, .raw_writefn = raw_write
-};
-
-static const ARMCPRegInfo zcr_el2_reginfo = {
-    .name = "ZCR_EL2", .state = ARM_CP_STATE_AA64,
-    .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 0,
-    .access = PL2_RW, .type = ARM_CP_SVE,
-    .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[2]),
-    .writefn = zcr_write, .raw_writefn = raw_write
-};
-
-static const ARMCPRegInfo zcr_no_el2_reginfo = {
-    .name = "ZCR_EL2", .state = ARM_CP_STATE_AA64,
-    .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 0,
-    .access = PL2_RW, .type = ARM_CP_SVE,
-    .readfn = arm_cp_read_zero, .writefn = arm_cp_write_ignore
-};
-
-static const ARMCPRegInfo zcr_el3_reginfo = {
-    .name = "ZCR_EL3", .state = ARM_CP_STATE_AA64,
-    .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 2, .opc2 = 0,
-    .access = PL3_RW, .type = ARM_CP_SVE,
-    .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[3]),
-    .writefn = zcr_write, .raw_writefn = raw_write
+static const ARMCPRegInfo zcr_reginfo[] = {
+    { .name = "ZCR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 2, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_SVE,
+      .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[1]),
+      .writefn = zcr_write, .raw_writefn = raw_write },
+    { .name = "ZCR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 0,
+      .access = PL2_RW, .type = ARM_CP_SVE,
+      .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[2]),
+      .writefn = zcr_write, .raw_writefn = raw_write },
+    { .name = "ZCR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 2, .opc2 = 0,
+      .access = PL3_RW, .type = ARM_CP_SVE,
+      .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[3]),
+      .writefn = zcr_write, .raw_writefn = raw_write },
 };
 
 void hw_watchpoint_update(ARMCPU *cpu, int n)
@@ -8233,15 +8220,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     }
 
     if (cpu_isar_feature(aa64_sve, cpu)) {
-        define_one_arm_cp_reg(cpu, &zcr_el1_reginfo);
-        if (arm_feature(env, ARM_FEATURE_EL2)) {
-            define_one_arm_cp_reg(cpu, &zcr_el2_reginfo);
-        } else {
-            define_one_arm_cp_reg(cpu, &zcr_no_el2_reginfo);
-        }
-        if (arm_feature(env, ARM_FEATURE_EL3)) {
-            define_one_arm_cp_reg(cpu, &zcr_el3_reginfo);
-        }
+        define_arm_cp_regs(cpu, zcr_reginfo);
     }
 
 #ifdef TARGET_AARCH64
-- 
2.34.1


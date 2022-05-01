Received: by 2002:a05:6512:2248:0:0:0:0 with SMTP id i8csp483621lfu;
        Sat, 30 Apr 2022 23:48:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTJXVr74BgU5ht3uvqYtpos98uAnti1BTz/6dz5MMSFpBR05PnP2yXSbeFGNn3IQEmFpIu
X-Received: by 2002:a37:683:0:b0:69f:9bc8:720e with SMTP id 125-20020a370683000000b0069f9bc8720emr4854326qkg.660.1651387693674;
        Sat, 30 Apr 2022 23:48:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651387693; cv=none;
        d=google.com; s=arc-20160816;
        b=E36nfYm9K5f8LoQxX5wmGxVafTZS+1MGaYqNOzBnRAmUe+Tb/kl/mdBY8hbRbXnjBx
         BeOroqmvmrrVcJFWUacGmyiO2HPeCkn3cn3oAstkHRJ8zGDAVVH7O3dY8SG1pcIOpFGH
         oe2OWNnu5OfbeIbBQ0wTP5+lFjggy2dkP2zlNeiqTaRnEdC6kHf9T76g7rPmQHEsw50X
         6ciw3jNxa3Fyti/kkOZ6Bv9koZ20D7NybVxvfYbdj19yD02V47Jzlu/tOl68Dh3SPik5
         urQ9BDmSm/4Kj8dBPZNr/5bVNC/1HlWkoHTyoAKTfHzn7jG6hcaFy1FZcCR10BHvpc7m
         E7nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fg33AYGqWxlbsFqDHnUVCK+5A1bEa2zIHmnKmyfZL/g=;
        b=KEIL3MuLH01CuRBIaveqMTuvygwqAPxCMYglBUFFI3vh9xJ1pS567nqEL8nVYk154l
         OFqUfeX0zQjuS6aIiXhB2WEuhvNfT+ACy8wQN33q/W0FcgFtXMx1Myo24UZU/xM0mwxg
         V3/LUhjZ0WYNu5hfuUV0oFh1g8smv8oksE3wIUeIM3uk65VwcJhP9sqOswULqXTETim3
         zKGcC5Le1wsr47OnWO4SMcZgAsewg1+NqIzL7z1u1YOa6/4UlRWk/9x10Z5QvsnRZcAL
         VzGKRds+5oYOauHQ5kSoWHkNvUo0aQ+8SKmyOtWeXhWaZD391ti4nld8z7Ccl58koBRV
         5Lsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uaexpWmw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8-20020a05622a028800b002f36d92cf11si4976446qtw.571.2022.04.30.23.48.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Apr 2022 23:48:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uaexpWmw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nl3NN-0006qg-5J
	for alex.bennee@linaro.org; Sun, 01 May 2022 02:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tt-0006ta-Hk
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:50:58 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:38589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tr-0001KK-WC
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:50:53 -0400
Received: by mail-pl1-x635.google.com with SMTP id n18so10283030plg.5
 for <qemu-arm@nongnu.org>; Sat, 30 Apr 2022 22:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fg33AYGqWxlbsFqDHnUVCK+5A1bEa2zIHmnKmyfZL/g=;
 b=uaexpWmwTOmJFccnWa30znhIT5ngRAKa25R5CwGDYNtV2cmATC76F5QSL27b3l556o
 Wl+Hz2pPTCofWAdBbzdO4LogUB+5l/TENer+FXgfeIjNlFZ4Kc2Ghz4d7iKY3uvMR5H6
 KpVwydUESd/qGAf8W+1xm59IaSRAIavwAOBWtEV3UFDk74iJ97xP85YZAZgmjru78kbM
 jdzgjSeUmdlJmDXHP5rBLt3+dMMCC6E2yn7wk0W1ZXfquMm6SvWOK3GA5/WSR1shfwiF
 +kkBeoJ9OcaBHsQ9jHhayXyzw6RSyai6nkzMJplSJml+7w+WOGpfnzBWW59UubTW198G
 W9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fg33AYGqWxlbsFqDHnUVCK+5A1bEa2zIHmnKmyfZL/g=;
 b=7+oAdj3bk9Iz4SeW66YR2shnmKHLLeakCCpjwNEOLwc72i/qGtspo8RtelxteyVa6t
 5+aDkv/W3A3JCwA/ZUIXOhy0waboHfgfnYJMxFl1zs4fqvZK+r6giBKGxo7v+1JyVhx/
 Ko1kWMzxg/PfvhfYk/dVuvPoDQ49g6V6NYg4ejndTcXTvpu5HfIT2Li2Zx/mFQcX6eDm
 dtUUsE7xEhRZudmWlXi7IQ2K4BPWmoI6LDwlr/Y+z5IeTMUWJxCKE/EGTxgJ7BqSa94P
 P/zWIR4BJn0Ln4eCGlWp1Gce7MzoI7KgvhlRIbFKsVoOv8mG2GQWkWFZXTe3gWYW+598
 DAEA==
X-Gm-Message-State: AOAM533PqxvW89zfACptceTc1vujmw6/5QStLAaG3aoHTx6dsW3Q+H96
 WarPaGaXl8ST+CHBruiiJEE5ZA==
X-Received: by 2002:a17:902:f60e:b0:158:5c4d:d9b0 with SMTP id
 n14-20020a170902f60e00b001585c4dd9b0mr6558268plg.63.1651384250698; 
 Sat, 30 Apr 2022 22:50:50 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 22/45] target/arm: Merge zcr reginfo
Date: Sat, 30 Apr 2022 22:50:04 -0700
Message-Id: <20220501055028.646596-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FmB0SZ20bd7h

Drop zcr_no_el2_reginfo and merge the 3 registers into one array,
now that ZCR_EL2 can be squashed to RES0 and ZCR_EL3 dropped
while registering.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 55 ++++++++++++++-------------------------------
 1 file changed, 17 insertions(+), 38 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e24e0749ac..228472506d 100644
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
@@ -8230,15 +8217,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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


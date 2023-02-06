Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4121913ejb;
        Mon, 6 Feb 2023 04:17:47 -0800 (PST)
X-Google-Smtp-Source: AK7set+Dh1JQXcX4vCW8lVC50XbY9jXgi17cLvdpFnT/0qpv8h7vVkzopytTN6LgWU/szCn2xEVr
X-Received: by 2002:a05:6214:f24:b0:56b:f775:6700 with SMTP id iw4-20020a0562140f2400b0056bf7756700mr5458089qvb.34.1675685867575;
        Mon, 06 Feb 2023 04:17:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675685867; cv=none;
        d=google.com; s=arc-20160816;
        b=mlDbk0i3Z9dbqDgmZAXWDl0/q6e0pydipPYkwVSXqrolzXs8p16jOuu+Od7gM2Z+Fo
         B3FTO21wsYj6C43HzOvTPP/eNvO2gPZJ/w9EyLAU0HuGqiRluxoYeadsA4R6cenpHEw8
         pVDDL++/ge4PwIIOjpuBLyvZlYBb1oiLPqayp6OEweOsP0SevxguoBNMrUqNHO4yTsY3
         AXIyr2JILN1UcRdt7LkaV807NF2b1fWgRvjbPUezQAl6i/w8oyF4rMCO1IYHg6PKAswJ
         urAKg2d5AlAMEcrK+Zk9RuyNzaYWmuSlfZv0Z1ext1mD2MagWwvY2YhdkDX8HhoMm8at
         lDxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cnLR1uIdaRx63uyaDPgEE9PMokr2C9C9/vY4stomlB8=;
        b=ggwOXr2kUn0H2WMPoKDVcaAqZAexGYBFerdnyTxIRSqzuMfK/Ovb/W3HytJPTsW3+/
         /FYIMHl02khqgJLLfFAzjmYpHduejgkaiqVs0QcqSMxNCT3oJYN+t54U7vkWWH/IWl4D
         EIyWGbDhNOPkT3YolM+cTRtQXMf602QrC+RjENkXxiuwd229kvC8igJz9GcbdHNMeM/d
         Z9gj5ETd+NF3E85LTQTMY+/bC4DxgNOs4rWN0LdawXSLWh5S4CpKhgYWtxWmhtSTMXQc
         XRdmTqw0hFs8itcGkcqojLFyNJoWhudq90ElBZ9RiMEpt+//kWRXyCpnOwvhBjH4ldzT
         5Ehg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pCIc1SWu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c142-20020ae9ed94000000b006fef612fcfesi8530104qkg.23.2023.02.06.04.17.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 04:17:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pCIc1SWu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pP0RB-0007ao-Iu; Mon, 06 Feb 2023 07:17:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0R8-0007YF-TH
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 07:17:30 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0R6-0005nk-J4
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 07:17:29 -0500
Received: by mail-wm1-x32d.google.com with SMTP id q8so8513279wmo.5
 for <qemu-arm@nongnu.org>; Mon, 06 Feb 2023 04:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cnLR1uIdaRx63uyaDPgEE9PMokr2C9C9/vY4stomlB8=;
 b=pCIc1SWuqEqCCrureSTt61msuerP/ylniPzZ4d74S7kpjWDtNaay9Czimws319Fx5h
 ykMXm40WA3ywED/ohntCF2H8P0hs1LDfCyUDb3AHOa5OocIyQfeFBeTH6ivzgPxRw4v+
 iFf5VIKxVXjxMgkse1xVbNmwHRfQenTLzjOxnbXj2sdclXKJ7Zfg+/ICYkgQKkhTdgxo
 gz4C2J0Mk0ygVmc0He3rNJnBP6dvKtJgFPS928KFt9YOyoKb6ODJdzyGw4dDs06EwU3A
 02vqBtsrNUqoenShWpwZGFKVQQlahFsR3QaLtITvC45O0/MBMvKjg6Vu3ja+HMt5x0Q8
 +F0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cnLR1uIdaRx63uyaDPgEE9PMokr2C9C9/vY4stomlB8=;
 b=B0em5z/AAcaQzgMpvpX618OFXJhSteJU1uG7+ZWCfmhTr9Wu6gvJq7+sxZJXyaU8uM
 4kw8aIw4amzeXJjda6mOb/kfXlTNcwxxtUFBhufZfBQrodtQJ0lDmSS/94oTaHXDs9ze
 7ExdG2hwZK4KGr+82NGzMv5Y0W94JR0wSQO81L0nRMaMBhRCknqm2lJJtF9P3G0u9gEu
 0f93MyghsjizU86a2ULf3LNgG7A+LtBMNT3QprOKGR1zXKpXMjZxTOv8Z72SVJuCKx2a
 87wKAqMEdTrvfmZ5ndQbNshVbtkmq3bTjEIAKZlIxkuDPvrQa2Zf6obEj9KI280nBJsC
 +zqg==
X-Gm-Message-State: AO0yUKUe3wA08ttTT/8CHl9eyiJRElzpidG+Oxygl+4OrOrNLbJvbwqG
 l/Z9pw0FcJdKMIfYQvGtDZRd7Q==
X-Received: by 2002:a05:600c:3795:b0:3c6:e61e:ae71 with SMTP id
 o21-20020a05600c379500b003c6e61eae71mr21104626wmr.1.1675685847107; 
 Mon, 06 Feb 2023 04:17:27 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 14-20020a05600c228e00b003dd9232f036sm12708711wmf.23.2023.02.06.04.17.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 04:17:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/9] target/arm: Constify ID_PFR1 on user emulation
Date: Mon,  6 Feb 2023 13:17:07 +0100
Message-Id: <20230206121714.85084-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206121714.85084-1-philmd@linaro.org>
References: <20230206121714.85084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: N1WUBcVW6+Cp

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5dbeade787..b58800a1a5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7021,6 +7021,7 @@ static void define_pmu_regs(ARMCPU *cpu)
     }
 }
 
+#ifndef CONFIG_USER_ONLY
 /*
  * We don't know until after realize whether there's a GICv3
  * attached, and that is what registers the gicv3 sysregs.
@@ -7038,7 +7039,6 @@ static uint64_t id_pfr1_read(CPUARMState *env, const ARMCPRegInfo *ri)
     return pfr1;
 }
 
-#ifndef CONFIG_USER_ONLY
 static uint64_t id_aa64pfr0_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -7998,8 +7998,16 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 1,
               .access = PL1_R, .type = ARM_CP_NO_RAW,
               .accessfn = access_aa32_tid3,
+#ifdef CONFIG_USER_ONLY
+              .type = ARM_CP_CONST,
+              .resetvalue = cpu->isar.id_pfr1,
+#else
+              .type = ARM_CP_NO_RAW,
+              .accessfn = access_aa32_tid3,
               .readfn = id_pfr1_read,
-              .writefn = arm_cp_write_ignore },
+              .writefn = arm_cp_write_ignore
+#endif
+            },
             { .name = "ID_DFR0", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 2,
               .access = PL1_R, .type = ARM_CP_CONST,
-- 
2.38.1


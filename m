Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp306560ejy;
        Fri, 23 Sep 2022 05:44:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6PykWV8YVr7rJofuTvdP5OwMlZP4hcBzVP6E5DhoVd0uBiIo+syVRDyML8gvQtzyDzYllE
X-Received: by 2002:a05:620a:450d:b0:6ce:3f27:eb47 with SMTP id t13-20020a05620a450d00b006ce3f27eb47mr5678409qkp.700.1663937098082;
        Fri, 23 Sep 2022 05:44:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663937098; cv=none;
        d=google.com; s=arc-20160816;
        b=F1AS9wvGGTfPDF6zkWkiec54M3pSz0sTeujonxDZObapnqDxp9cwoluIApsw1mFHSm
         Yj/NaPnTI+BzSwMBDgcunBGbqF6kQKiHyuiMU+EYQpYYds9L3kgkcu3BYueM5SNZJ2LS
         e1iqR98YuohLWfMsPHHdiVwqC8UtHaXK1Om7rJHtGKHyfWkQMnThgTGkyk1byZvCscDM
         AD19OnYcTJ4HDdBjpBp5PFCRS/IXcT+u8TKjHdZV74usHzjpxCUTOVKPMFWHQ5QtV0GK
         mTnV53N2qCctsy/+LdV7Vot4MEjQGF2wPmxO2u+cnwDc7zwU5UdPWzCX4HVVXzL4cxhq
         fYUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9bX1U7fCCWCM+RDd/fzqQav05Uxy455tmNKKT/hfAUQ=;
        b=c+dF4Eb3RwCNmwMEuoOhnefcy8wiUGrnd9RpSnctG0Xb2CWxmBVgRXW4FVsPaT7Etw
         sEMqkVqwJvlw2mXlGCZoTUrj3i4fmUImRjhQBQ4ZHHcdIq0TCYlPmO8XpqUCp4MPWVnq
         CbMMcK+M36wPRGzwuKS8GAXwHajoBFdV2dVEwqCN0PfGP+a4qIPed0e6bC0eMr9XFTYM
         Xf938UZV1felZWX3cPnQ5H5O6jX6UOEGyKXKwe92ZAJGeutCnMkYM4Z4iFtTJGdFXz3k
         ZV+htUiLGuwuppVdeLHW0RmvWPSsxTAgyypLQ9pbBj2cIkxzPGtdNOy/q3llhc7ZASrK
         QBTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rWEgCWnU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cm21-20020a05622a251500b003436198b1e7si4847775qtb.385.2022.09.23.05.44.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Sep 2022 05:44:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rWEgCWnU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1obi37-0005YH-DL
	for alex.bennee@linaro.org; Fri, 23 Sep 2022 08:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obhsq-0006QJ-28
 for qemu-arm@nongnu.org; Fri, 23 Sep 2022 08:34:24 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obhsn-0007VU-Ak
 for qemu-arm@nongnu.org; Fri, 23 Sep 2022 08:34:19 -0400
Received: by mail-wr1-x434.google.com with SMTP id s14so18249014wro.0
 for <qemu-arm@nongnu.org>; Fri, 23 Sep 2022 05:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=9bX1U7fCCWCM+RDd/fzqQav05Uxy455tmNKKT/hfAUQ=;
 b=rWEgCWnUdgamXStSyyzCw0RZPP/GBIXNbLE2tfhMqzjfhtI7L1aC0NQ/7Xj4kV/zbI
 dFugSZKhhBYQZyPeaOzMR+tcnQu0J7JnQ6QM+cijrBCjHIYURZPdtr6vYxqQ7aV7NZT4
 cSNi75VYK2qZ7B61anc2O32zV1ijU/WPVI/luNzP8KwXwIXvzdAwewZIxedLFuQ6ggJG
 44lr5gjkvGCfGmPsoImiAc6jmbrZ5gr8+wE6+5dzjkgreMLrP90+Z3gIyi6hvfqk/3mo
 a9np/YKtVH6dqdYRRCbJhaCG+Gevj4AYKQ1YG4o/8xBU5oE446lNBJjl3+g6GN5PrLB0
 xo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9bX1U7fCCWCM+RDd/fzqQav05Uxy455tmNKKT/hfAUQ=;
 b=w37yDdZnO27H2ZdSeJ/rcKLHJ3Tet1VBnH/o+PoXBF+okqJuKC2htzoxqoFxyNNbn0
 25/LMmNEKkfex3SCNuAyeyeiCinoMQSRgUpSHgSTQoo6Up/5FtJxdhs9Qw9nP247/aSE
 g90vf88tymEPphESuWLTp7+NYq7X12DLy2i5iv5Ql42V4HD5HmFVbisIGP3MHmra6yn1
 63R2vHDlbiwoRkGn+6srWoy1mv3ojpMflL8CP8KBK7IFqq25MHHj1MJ0LtFWq2o58HpF
 cc/KQZJAGhk9izDN6QeyfSnlGHW745PjAufcwUs0RTyTS3/miixrl1XiCV0zZNY5cLYM
 88bg==
X-Gm-Message-State: ACrzQf1nPLk2p+w9/oLt7hfLpZUkKo3Cb5Qv432ZdfTbPv6yF+r3bt+n
 OH0cX5QJhKK1ZJu2TieBWAcJopDjCDO8Ng==
X-Received: by 2002:adf:fa81:0:b0:224:f260:2523 with SMTP id
 h1-20020adffa81000000b00224f2602523mr5057563wrr.26.1663936455843; 
 Fri, 23 Sep 2022 05:34:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n43-20020a05600c502b00b003b486027c8asm2504555wmr.20.2022.09.23.05.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 05:34:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
Subject: [PATCH 1/3] target/arm: Mark registers which call pmu_op_start() as
 ARM_CP_IO
Date: Fri, 23 Sep 2022 13:34:10 +0100
Message-Id: <20220923123412.1214041-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220923123412.1214041-1-peter.maydell@linaro.org>
References: <20220923123412.1214041-1-peter.maydell@linaro.org>
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3421GU05o6fY

In commit 01765386a888 we made some system register write functions
call pmu_op_start()/pmu_op_finish(). This means that they now touch
timers, so for icount to work these registers must have the ARM_CP_IO
flag set.

This fixes a bug where when icount is enabled a guest that touches
MDCR_EL3, MDCR_EL2, PMCNTENSET_EL0 or PMCNTENCLR_EL0 would cause
QEMU to print an error message and exit, for example:

[    2.495971] TCP: Hash tables configured (established 1024 bind 1024)
[    2.496213] UDP hash table entries: 256 (order: 1, 8192 bytes)
[    2.496386] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes)
[    2.496917] NET: Registered protocol family 1
qemu-system-aarch64: Bad icount read

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1a57d2e1d60..7c7ba328d6d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1927,12 +1927,12 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
      * or PL0_RO as appropriate and then check PMUSERENR in the helper fn.
      */
     { .name = "PMCNTENSET", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 1,
-      .access = PL0_RW, .type = ARM_CP_ALIAS,
+      .access = PL0_RW, .type = ARM_CP_ALIAS | ARM_CP_IO,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmcnten),
       .writefn = pmcntenset_write,
       .accessfn = pmreg_access,
       .raw_writefn = raw_write },
-    { .name = "PMCNTENSET_EL0", .state = ARM_CP_STATE_AA64,
+    { .name = "PMCNTENSET_EL0", .state = ARM_CP_STATE_AA64, .type = ARM_CP_IO,
       .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 1,
       .access = PL0_RW, .accessfn = pmreg_access,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcnten), .resetvalue = 0,
@@ -1942,11 +1942,11 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmcnten),
       .accessfn = pmreg_access,
       .writefn = pmcntenclr_write,
-      .type = ARM_CP_ALIAS },
+      .type = ARM_CP_ALIAS | ARM_CP_IO },
     { .name = "PMCNTENCLR_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 2,
       .access = PL0_RW, .accessfn = pmreg_access,
-      .type = ARM_CP_ALIAS,
+      .type = ARM_CP_ALIAS | ARM_CP_IO,
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcnten),
       .writefn = pmcntenclr_write },
     { .name = "PMOVSR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 3,
@@ -5130,7 +5130,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 3, .opc2 = 1,
       .resetvalue = 0,
       .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el3) },
-    { .name = "SDCR", .type = ARM_CP_ALIAS,
+    { .name = "SDCR", .type = ARM_CP_ALIAS | ARM_CP_IO,
       .cp = 15, .opc1 = 0, .crn = 1, .crm = 3, .opc2 = 1,
       .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
       .writefn = sdcr_write,
@@ -7837,7 +7837,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
          * value is MDCR_EL2.HPMN which should reset to the value of PMCR_EL0.N.
          */
         ARMCPRegInfo mdcr_el2 = {
-            .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
+            .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH, .type = ARM_CP_IO,
             .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 1,
             .writefn = mdcr_el2_write,
             .access = PL2_RW, .resetvalue = pmu_num_counters(env),
-- 
2.25.1


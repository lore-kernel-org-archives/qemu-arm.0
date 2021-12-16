Received: by 2002:a19:8c50:0:0:0:0:0 with SMTP id i16csp526522lfj;
        Wed, 15 Dec 2021 22:49:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+hJ9AOfHsgFzcQfku0PknUZVhZVcZUhzMh+voEE2SXWH+NZX5oMQzselVnieZT33OZEY5
X-Received: by 2002:a25:d4c:: with SMTP id 73mr10979447ybn.74.1639637383375;
        Wed, 15 Dec 2021 22:49:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639637383; cv=none;
        d=google.com; s=arc-20160816;
        b=BYaLzL2Uoklu7yNEi99/97mrqqDAkqRpkB9jOTvn2u+3lze6WmU3qdPAbiaMRLB3yi
         EYuO/cxmwuM1HKC43rd2V4fGaav6w/SnZC7nsZqh5KRZHYWBaqdwSPJZggwVxhhe5o9W
         QAuIxPJj+CvZDG00cvgJ3IIynD2D6Gvj90BUMBAyYPw6UFpLeBcEgznHt+Zj5D2jRNmA
         0rvhRCqTcPLXnGFVH/VswVgq/QluEK1U75pIZoxc0iie05cEv6FTPvCItZZ6w+sAASIt
         qgto8bj3+EAR1d7/+UYLYWALjAAfCKEKgTFi36wS7coRwv5THd7b0AGzuoHjhpTOhWA7
         UdZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0a/WJC1NpwszNVtsBxaqaxOqAA8Wj1GY+DxkgkW9YnU=;
        b=aa5iDLAC7xYaw/y8FdKPl/n8JUZ1V+0ei4jlRn0kuwzgscwsJy6sn6a2L2mL4jgHO0
         XCUBobHJW1idxNbvPn7ffwB6TxjIfeXMG7cI/lm6s9iW4jEd9NM/7Xh25O28JttrwUVB
         20gZPhVkW2qA6ingFvNTxGH3DqnjqvWt4yvtugMdiimnUzlpFg1CiA2xH1YrA7Urtjuf
         pNb01plt085F1olr0QJ4otU3uFo/zyPrrllXj1VRkwoNN3uJ7+YxmKft/cviszq6pXWV
         3lVwpyrujdfQm9lR8eAgF6u84mdcKYsKkGZf9un58wYNHBPp16Zqb3JSH4Q3FI+bvwcs
         YriA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=knchsAQs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 130si4466940ybm.379.2021.12.15.22.49.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Dec 2021 22:49:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=knchsAQs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mxkaE-0006UW-8R
	for alex.bennee@linaro.org; Thu, 16 Dec 2021 01:49:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bslathi19@gmail.com>)
 id 1mxkZR-0006Sf-Ql; Thu, 16 Dec 2021 01:48:54 -0500
Received: from [2607:f8b0:4864:20::12d] (port=35646
 helo=mail-il1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bslathi19@gmail.com>)
 id 1mxkZC-0005Pk-9V; Thu, 16 Dec 2021 01:48:53 -0500
Received: by mail-il1-x12d.google.com with SMTP id 15so21356393ilq.2;
 Wed, 15 Dec 2021 22:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0a/WJC1NpwszNVtsBxaqaxOqAA8Wj1GY+DxkgkW9YnU=;
 b=knchsAQsEK8ZDPxnxWMWAgs5fBm2jr8tHiwOwrrpvb28sEIKkErhkE26PDUhNwnEBh
 0Y4reRJwoF3Q4+erRDXRfp3IvexUoV1ZE2OrZvx53AFFij4axMcht1E2WEOV2zo8LBdn
 GIcapGB8VS2+BVLs7HXnzd6hqakR5FVBd35OFu4ytVMVyBoTwiDtsXDHVtzH13u0pA86
 5uSpaVDxuwB+FzlkfhPu/x/o4yivv0Cp+TysGgmfn0ZRDNLFw6px2g+2xGa1Z0UyL4t8
 TDd/YZ2mh6Cpa7PRFc0syMM51iouqyc235sA5pWzvzbnpJglTOwiRM4zx2dt7zkqT4Pc
 MRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0a/WJC1NpwszNVtsBxaqaxOqAA8Wj1GY+DxkgkW9YnU=;
 b=AhqkKE3m7kvrAv5xfyuMgFs6bxRs0RLpj7XImNxWzVt71yJlEH6W36DFSo8s8Cr95b
 BLKY7s3fOoSHjX4UXLv8BtcH7W8QOIgbysVz84DVFXyNnK3wY3sCFoM+TIJoW7wqn97H
 /K+VKG20EJrjEPGRXXdIDHeJKp0leaWj/O3poPzPTAXYb66FKtMqpY7AP3nDelUqz4Dp
 XMPNnRU+cFLlZ6KTUuMHOwfivIhIts0CFC2si5A495xsj11JyBXZgyM+LfOtJv7rcAgi
 0icIUSTCWD/yfpKBr9GIf8mBxp3zJMRM5tpeGt9X3u/mIVr64Ljz98o3N+HsOwfm2r+C
 p20w==
X-Gm-Message-State: AOAM530mddg1dVsyuzw7ZWURnGV54DSaLi8LyduTtsCPzrH2SnVSH51Z
 bP8LOIbsiNEUt3cnUzlQ8j0Ejlczv90D+g==
X-Received: by 2002:a05:6e02:1ba5:: with SMTP id
 n5mr8767879ili.61.1639637316778; 
 Wed, 15 Dec 2021 22:48:36 -0800 (PST)
Received: from localhost.localdomain (s-30-204.flex.volo.net. [76.191.30.204])
 by smtp.gmail.com with ESMTPSA id
 t6sm2081650ioi.51.2021.12.15.22.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 22:48:36 -0800 (PST)
From: Byron Lathi <bslathi19@gmail.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 bslathi19@gmail.org
Subject: [PATCH v2 1/2] target/arm: Implement Cortex-A5
Date: Thu, 16 Dec 2021 00:48:19 -0600
Message-Id: <20211216064820.61342-2-bslathi19@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211216064820.61342-1-bslathi19@gmail.com>
References: <20211216064820.61342-1-bslathi19@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=bslathi19@gmail.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Byron Lathi <bslathi19@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0lxCUnN3GuRE

Add support for the Cortex-A5. These changes are based off of the A7 and
A9 Init functions, using the appropriate values from the technical
reference manual for the A5.

Signed-off-by: Byron Lathi <bslathi19@gmail.com>
---
 target/arm/cpu_tcg.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 13d0e9b195..2b54fb618b 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -304,6 +304,41 @@ static void cortex_a8_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortexa8_cp_reginfo);
 }
 
+static void cortex_a5_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a5";
+    set_feature(&cpu->env, ARM_FEATURE_V7);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
+    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    cpu->midr = 0x410fc0f1;
+    cpu->reset_fpsid = 0x41023051;
+    cpu->isar.mvfr0 = 0x10110221;
+    cpu->isar.mvfr1 = 0x11000011;
+    cpu->ctr = 0x83338003;
+    cpu->reset_sctlr = 0x00c50078;
+    cpu->isar.id_pfr0 = 0x00001231;
+    cpu->isar.id_pfr1 = 0x00000011;
+    cpu->isar.id_dfr0 = 0x02010444;
+    cpu->id_afr0 = 0x00000000;
+    cpu->isar.id_mmfr0 = 0x00100103;
+    cpu->isar.id_mmfr1 = 0x40000000;
+    cpu->isar.id_mmfr2 = 0x01230000;
+    cpu->isar.id_mmfr3 = 0x00102211;
+    cpu->isar.id_isar0 = 0x00101111;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232041;
+    cpu->isar.id_isar3 = 0x11112131;
+    cpu->isar.id_isar4 = 0x00011142;
+    cpu->isar.dbgdidr = 0x1203f001;
+    cpu->clidr = 0x09200003;
+    cpu->ccsidr[0] = 0x701fe00a;
+    cpu->ccsidr[1] = 0x203fe00a;
+}
+
 static const ARMCPRegInfo cortexa9_cp_reginfo[] = {
     /*
      * power_control should be set to maximum latency. Again,
@@ -1019,6 +1054,7 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
     { .name = "arm1136",     .initfn = arm1136_initfn },
     { .name = "arm1176",     .initfn = arm1176_initfn },
     { .name = "arm11mpcore", .initfn = arm11mpcore_initfn },
+    { .name = "cortex-a5",  .initfn = cortex_a5_initfn },
     { .name = "cortex-a7",   .initfn = cortex_a7_initfn },
     { .name = "cortex-a8",   .initfn = cortex_a8_initfn },
     { .name = "cortex-a9",   .initfn = cortex_a9_initfn },
-- 
2.30.2


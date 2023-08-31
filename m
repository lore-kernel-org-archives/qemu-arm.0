Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp261056ejc;
        Thu, 31 Aug 2023 16:25:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSugNVpkfuDQRnQErWUXxD2hf4Wv9qvQcrv+uQcjFmVFYY1YW9XIy/uoakNZGh0QsAXIui
X-Received: by 2002:ac8:5907:0:b0:403:971a:44ab with SMTP id 7-20020ac85907000000b00403971a44abmr1128540qty.58.1693524351746;
        Thu, 31 Aug 2023 16:25:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693524351; cv=none;
        d=google.com; s=arc-20160816;
        b=LIgPR4Zbzieso2mJBfTOtk0FzEvPGG8mOs4+3IcUR8UBQWiS9TgjLAa25lQ3KoPWzT
         uWVyILe65hFQpvuqtLGZjJKB2TbQEPdFJwak36k5UkaWvDZWL5kaA/Zltx2oKrEqxFes
         6hZpD6R50bzuxhDkn2yir6duKd8XIsFNRxxiZMUDWLoeD80px/ljW4/56Xf5jAZWEYAX
         MT0gpot9SqP9pFSPXvHpGSyrarQ4zLIgJZtbRPujVgAvxgS5yqWImNFvkXW8ZnDL9fxl
         mbP0gzrstFCwzpCdR05wjeoik8t05WiLYUH2AmixSJV+aUpBzmfTaXSmWbqrx/+k9PxP
         S61Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fKdHQlw/TcgzSbe1vD4Z7Y3NFBfF1rOhXjA2KTi3TfI=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=WNXNbO76hFdOpEKiJv0BTqC0juOUiT4yEyE8qRdvxtnIhW1TSn7jsoQjmRjrhh8s6L
         MYbXbDmc2vr+K0DVPzBtiq6Ev48SLKGb+ZosZIEMt6nM9MALFTDhXB/Bk/KRauhBxKa7
         b5E2qU7fycJgr7YIh7fmCcYjqMXak4KwN5bv0VVtZqr6W28Cg0IaXlmi0WBGqLqQ6onM
         B53rOkfOtL0yg7pAoc2iTnU7WfCkteHmp17wI48GFsKk7Y1k3ks3gItzk9efiUH/t/Y5
         6nDN1jLDKw/EVophvmR2ZN7A+gtpWSUflFVrlQEHtJKV/F+JeAZVlPzDFiHijvxSax1j
         hU7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QRN6LwKa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 21-20020ac84e95000000b00403cad59323si1550165qtp.779.2023.08.31.16.25.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 16:25:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QRN6LwKa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbr1z-0006nU-ST; Thu, 31 Aug 2023 19:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qbr1y-0006mk-83
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 19:24:54 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qbr1r-0002HS-2Q
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 19:24:54 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1c0db66af1bso9874805ad.2
 for <qemu-arm@nongnu.org>; Thu, 31 Aug 2023 16:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693524284; x=1694129084; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fKdHQlw/TcgzSbe1vD4Z7Y3NFBfF1rOhXjA2KTi3TfI=;
 b=QRN6LwKa/XQRaOUZuZF5BP/hwEnKI77VVaLV8q8EP8tknm+133PZR7uZ2L8ESc7Frl
 2c4rWYig2nUjtkbhTjON7UyFP3m5km0RsdmBjo7lU7KSJPXbc6Bomp1WJBnomkhZLdnI
 wYWcOYdjSrbQec8KzJT8sA/6BFVkVMYNko7+vvK2fiePYcKP6gDTliyBqqXo3WCkKOtm
 D3wXlyAU6ZMFG34qSsPAld8IYY3jRd6SHxLOa6K1NZT29x9bJ+O/jlxmJtWgWHg4UnAB
 sG7gJ0zK88ePrivY3clwfK27pX7EHQPQFXoEXpDUV6dO+9r3vuF8J/rPGyfBOeiW7zG3
 2cuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693524284; x=1694129084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fKdHQlw/TcgzSbe1vD4Z7Y3NFBfF1rOhXjA2KTi3TfI=;
 b=MkB6cpjqxOplDA/3uPJDRxZk1lHCugds2H641BkYtT2XIEH7Ic8u72ddUBKBGT+OcL
 NJSqBHf6OSFHOMByoQI/K2pyb3qbCE053whmSloGTHm4t/qRct59PpDmhbO3fuWZaira
 FO0/FqibA6LP6YMsBqwEBJkTz+1ZU7rahrhavFetQrPe5VeQHmoX6bXXeh0n1VE4mWjw
 DRK7sGXqQ6e2A628NM3FnQSPo7UShyWE300QuVWZjcsAjj8Mb00BRh8mRrQRt1xpBv8a
 5FdUq0FjSeJpF648ZNaFAajhBcOca1ohnVbztvL5I58F78Tgv5yI9dF0UhJzM6+1PyEM
 MyqQ==
X-Gm-Message-State: AOJu0YyzZ/XDxN2vK723YgxB+lalUIG7fVdhTxzpe+MNbP7OUKE6jPtT
 q0ELWz+MLPYLSoHtTCA+WYpk/w==
X-Received: by 2002:a17:902:d2cb:b0:1c2:193e:1106 with SMTP id
 n11-20020a170902d2cb00b001c2193e1106mr1354166plc.50.1693524284157; 
 Thu, 31 Aug 2023 16:24:44 -0700 (PDT)
Received: from stoup.. ([71.212.131.115]) by smtp.gmail.com with ESMTPSA id
 jd5-20020a170903260500b001bb8895848bsm1732711plb.71.2023.08.31.16.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 16:24:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 2/5] target/arm: Implement cortex-a710
Date: Thu, 31 Aug 2023 16:24:38 -0700
Message-Id: <20230831232441.66020-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230831232441.66020-1-richard.henderson@linaro.org>
References: <20230831232441.66020-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
X-TUID: 2pKmwqX0aARS

The cortex-a710 is a first generation ARMv9.0-A processor.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/virt.rst |   1 +
 hw/arm/virt.c            |   1 +
 target/arm/tcg/cpu64.c   | 212 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 214 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 51cdac6841..e1697ac8f4 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -58,6 +58,7 @@ Supported guest CPU types:
 - ``cortex-a57`` (64-bit)
 - ``cortex-a72`` (64-bit)
 - ``cortex-a76`` (64-bit)
+- ``cortex-a710`` (64-bit)
 - ``a64fx`` (64-bit)
 - ``host`` (with KVM only)
 - ``neoverse-n1`` (64-bit)
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a13c658bbf..8ad78b23c2 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -211,6 +211,7 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a55"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
     ARM_CPU_TYPE_NAME("cortex-a76"),
+    ARM_CPU_TYPE_NAME("cortex-a710"),
     ARM_CPU_TYPE_NAME("a64fx"),
     ARM_CPU_TYPE_NAME("neoverse-n1"),
     ARM_CPU_TYPE_NAME("neoverse-v1"),
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 0f8972950d..ab63526bea 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -745,6 +745,217 @@ static void aarch64_neoverse_v1_initfn(Object *obj)
     aarch64_add_sve_properties(obj);
 }
 
+static const ARMCPRegInfo cortex_a710_cp_reginfo[] = {
+    { .name = "CPUACTLR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0,
+      .accessfn = access_actlr_w },
+    { .name = "CPUACTLR2_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 1,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0,
+      .accessfn = access_actlr_w },
+    { .name = "CPUACTLR3_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 2,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0,
+      .accessfn = access_actlr_w },
+    { .name = "CPUACTLR4_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 3,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0,
+      .accessfn = access_actlr_w },
+    { .name = "CPUECTLR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 4,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0,
+      .accessfn = access_actlr_w },
+    { .name = "CPUECTLR2_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 1, .opc2 = 5,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0,
+      .accessfn = access_actlr_w },
+    { .name = "CPUPPMCR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 4,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPWRCTLR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 2, .opc2 = 7,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0,
+      .accessfn = access_actlr_w },
+    { .name = "ATCR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 7, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUACTLR5_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 8, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0,
+      .accessfn = access_actlr_w },
+    { .name = "CPUACTLR6_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 8, .opc2 = 1,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0,
+      .accessfn = access_actlr_w },
+    { .name = "CPUACTLR7_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 8, .opc2 = 2,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0,
+      .accessfn = access_actlr_w },
+    { .name = "ATCR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 15, .crm = 7, .opc2 = 0,
+      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "AVTCR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 15, .crm = 7, .opc2 = 1,
+      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPPMCR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 2, .opc2 = 0,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPPMCR2_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 2, .opc2 = 1,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPPMCR4_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 2, .opc2 = 4,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPPMCR5_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 2, .opc2 = 5,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPPMCR6_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 2, .opc2 = 6,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUACTLR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 4, .opc2 = 0,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "ATCR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 7, .opc2 = 0,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPSELR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 0,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPCR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 1,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPOR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 2,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPMR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 3,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPOR2_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 4,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPMR2_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 5,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "CPUPFR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 8, .opc2 = 6,
+      .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+
+    /*
+     * Stub RAMINDEX, as we don't actually implement caches, BTB,
+     * or anything else with cpu internal memory.
+     * "Read" zeros into the IDATA* and DDATA* output registers.
+     */
+    { .name = "RAMINDEX_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 15, .crm = 0, .opc2 = 0,
+      .access = PL3_W, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IDATA0_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 0, .opc2 = 0,
+      .access = PL3_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IDATA1_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 0, .opc2 = 1,
+      .access = PL3_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "IDATA2_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 0, .opc2 = 2,
+      .access = PL3_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "DDATA0_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 1, .opc2 = 0,
+      .access = PL3_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "DDATA1_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 1, .opc2 = 1,
+      .access = PL3_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "DDATA2_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 15, .crm = 1, .opc2 = 2,
+      .access = PL3_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+};
+
+static void aarch64_a710_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a710";
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
+    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+
+    /* Ordered by Section B.4: AArch64 registers */
+    cpu->midr          = 0x412FD471; /* r2p1 */
+    cpu->revidr        = 0;
+    cpu->isar.id_pfr0  = 0x21110131;
+    cpu->isar.id_pfr1  = 0x00010000; /* GIC filled in later */
+    cpu->isar.id_dfr0  = 0x16011099;
+    cpu->id_afr0       = 0;
+    cpu->isar.id_mmfr0 = 0x10201105;
+    cpu->isar.id_mmfr1 = 0x40000000;
+    cpu->isar.id_mmfr2 = 0x01260000;
+    cpu->isar.id_mmfr3 = 0x02122211;
+    cpu->isar.id_isar0 = 0x02101110;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232042;
+    cpu->isar.id_isar3 = 0x01112131;
+    cpu->isar.id_isar4 = 0x00010142;
+    cpu->isar.id_isar5 = 0x11011121; /* with Crypto */
+    cpu->isar.id_mmfr4 = 0x21021110;
+    cpu->isar.id_isar6 = 0x01111111;
+    cpu->isar.mvfr0    = 0x10110222;
+    cpu->isar.mvfr1    = 0x13211111;
+    cpu->isar.mvfr2    = 0x00000043;
+    cpu->isar.id_pfr2  = 0x00000011;
+    cpu->isar.id_aa64pfr0  = 0x1201111120111112ull; /* GIC filled in later */
+    cpu->isar.id_aa64pfr1  = 0x0000000000000221ull;
+    cpu->isar.id_aa64zfr0  = 0x0000110100110021ull; /* with Crypto */
+    cpu->isar.id_aa64dfr0  = 0x000011f010305611ull;
+    cpu->isar.id_aa64dfr1  = 0;
+    cpu->id_aa64afr0       = 0;
+    cpu->id_aa64afr1       = 0;
+    cpu->isar.id_aa64isar0 = 0x0221111110212120ull; /* with Crypto */
+    cpu->isar.id_aa64isar1 = 0x0010111101211032ull;
+    cpu->isar.id_aa64mmfr0 = 0x0000022200101122ull;
+    cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
+    cpu->isar.id_aa64mmfr2 = 0x1221011110101011ull;
+    cpu->clidr             = 0x0000001482000023ull;
+    cpu->gm_blocksize      = 4;
+    cpu->ctr               = 0x000000049444c004ull;
+    cpu->dcz_blocksize     = 4;
+    /* TODO FEAT_MPAM: mpamidr_el1 = 0x0000_0001_0006_003f */
+
+    /* Section B.5.2: PMCR_EL0 */
+    cpu->isar.reset_pmcr_el0 = 0xa000;  /* with 20 counters */
+
+    /* Section B.6.7: ICH_VTR_EL2 */
+    cpu->gic_num_lrs = 4;
+    cpu->gic_vpribits = 5;
+    cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
+
+    /* Section 14: Scalable Vector Extensions support */
+    cpu->sve_vq.supported = 1 << 0;  /* 128bit */
+
+    /*
+     * The cortex-a710 TRM does not list CCSIDR values.  The layout of
+     * the caches are in text in Table 7-1, Table 8-1, and Table 9-1.
+     *
+     * L1: 4-way set associative 64-byte line size, total either 32K or 64K.
+     * L2: 8-way set associative 64 byte line size, total either 256K or 512K.
+     */
+    cpu->ccsidr[0] = make_ccsidr64(4, 64, 64 * KiB);   /* L1 dcache */
+    cpu->ccsidr[1] = cpu->ccsidr[0];                   /* L1 icache */
+    cpu->ccsidr[2] = make_ccsidr64(8, 64, 512 * KiB);  /* L2 cache */
+
+    /* FIXME: Not documented -- copied from neoverse-v1 */
+    cpu->reset_sctlr = 0x30c50838;
+
+    define_arm_cp_regs(cpu, cortex_a710_cp_reginfo);
+
+    aarch64_add_pauth_properties(obj);
+    aarch64_add_sve_properties(obj);
+}
+
 /*
  * -cpu max: a CPU with as many features enabled as our emulation supports.
  * The version of '-cpu max' for qemu-system-arm is defined in cpu32.c;
@@ -934,6 +1145,7 @@ static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a55",         .initfn = aarch64_a55_initfn },
     { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
     { .name = "cortex-a76",         .initfn = aarch64_a76_initfn },
+    { .name = "cortex-a710",        .initfn = aarch64_a710_initfn },
     { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
     { .name = "neoverse-n1",        .initfn = aarch64_neoverse_n1_initfn },
     { .name = "neoverse-v1",        .initfn = aarch64_neoverse_v1_initfn },
-- 
2.34.1


Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp659461ejf;
        Thu, 18 Aug 2022 17:20:38 -0700 (PDT)
X-Google-Smtp-Source: AA6agR45l46e6B0ke1Ewg/6lm43FCC+0XbPHf9lqKMejdi8zWvTU4OaoJunEfSq1656XFXADFF2m
X-Received: by 2002:ad4:4eab:0:b0:47e:cada:d63d with SMTP id ed11-20020ad44eab000000b0047ecadad63dmr4886751qvb.48.1660868437910;
        Thu, 18 Aug 2022 17:20:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660868437; cv=none;
        d=google.com; s=arc-20160816;
        b=t4L3BlE0RGIj85ja04Dpjj970vBD6Wemx5GjhbBzFxF3pSaSeEcyfMR108wxkqty8X
         d54JeuQ0EtfBIntVOjJWK2XUxM5p8+IfRAMx0SRHvTL2zIn97yl4rcPiVdfzhwKWa0E7
         gYhrhsffppxdpq285GJzIMawjsrJWqiySP9EXt3THeExrxXQeyl1IbCtzdTYWuTJUCX+
         pHySDMFsZq9NsYFAB+OakJiahGmGt3uKrBHkzl5w6jTtVSsp+2xwM1p0lM5HAGgmpeHW
         zu57VSBFHvUfLJvu+05f9CeQRwXvk89Icqqee7droUZxR1c4c3zX/z+YpB5k1wtDiwj9
         hGwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=zVnkECe23A1Q4ukGkykwvav2i+uCcpgafUQJkyuhSoU=;
        b=jjO3+jlK6QwwnYgHKlZBws4em25Tu1xrgAgCKQQpwNBjY3I4HGODgIqolZnK5pqtMv
         0AAbwTDSK/uYa9sSE0xDWkqLGwlJiEBvuZdaVATQAzsucDfduivr5NPu2LlZXmwQzLPD
         0BVvuL6Y/x1f1eKuWAY5uEdXfSEI9evEB6W7locquqIUDYpOIPKtB4Tf8ESBQ+xXLstg
         FKnEHlP9ytwqZMfDL+d1PFo45BzDiHVzv2IDjYVWd/0nI/12H5rJGNmfsceVti94x4v8
         b4Aer+BTqAAnTH+XiSi7oRqbFq9z8W41SYZltKQ6iVIz7szSZJnOZqsb+d+ig4xXGoOQ
         FGwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="S2/n7avB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj39-20020a05620a192700b006bb11dd25fesi1776856qkb.431.2022.08.18.17.20.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Aug 2022 17:20:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="S2/n7avB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:54788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oOpkb-0006gU-6x
	for alex.bennee@linaro.org; Thu, 18 Aug 2022 20:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Q9f-YggKCAw86tm054ts00sxq.o0y2qy6-m3yz0zsz6.03s@flex--wuhaotsh.bounces.google.com>)
 id 1oOpkO-0006eh-OH
 for qemu-arm@nongnu.org; Thu, 18 Aug 2022 20:20:24 -0400
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a]:39728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Q9f-YggKCAw86tm054ts00sxq.o0y2qy6-m3yz0zsz6.03s@flex--wuhaotsh.bounces.google.com>)
 id 1oOpkN-00021E-37
 for qemu-arm@nongnu.org; Thu, 18 Aug 2022 20:20:24 -0400
Received: by mail-pl1-x64a.google.com with SMTP id
 y9-20020a17090322c900b0016f8fdcc3b1so1779460plg.6
 for <qemu-arm@nongnu.org>; Thu, 18 Aug 2022 17:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:mime-version:message-id:date:from:to:cc;
 bh=zVnkECe23A1Q4ukGkykwvav2i+uCcpgafUQJkyuhSoU=;
 b=S2/n7avBm0OvqOgOzXhO69PpdlWzWW2wcuxz2zIyBcikCbN1FNknh4+FeDs1Zq/+CP
 VqpwVT6Mv3ioFIa3qmoELNuvU8M7bKCHO8SeO8XFE+WzOuAGknF9AgHUtRzxz8KDR03x
 YQkRZgc217eucPWBpg9epFbidC09285E6eVX1boXc/1lXQlndS0aDwmGNv23T7Mr4Wvs
 dlLcqsnY/pQI0j6TOsR2HVaHLU6p4QfnwhN2y8L8WCsqgjsOo3cB9iccCsOc6W8A2Iif
 WM0tn8jSt82bHTpuZfZCh25QJqyMvaJut1THsec8LcX37YrJLrcsDPMpB/1zV9QHRhFJ
 +rZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
 :from:to:cc;
 bh=zVnkECe23A1Q4ukGkykwvav2i+uCcpgafUQJkyuhSoU=;
 b=ReC7VzNiYNaKDauP9g8dz/TK4TIbGMmjrNYL7jFRbZ2veJhaiYcljRv7mnyehvLNET
 eEYCGSAE9eJ+/YU3JnTmZGN3uwjcIdUAVYXNslsm46zdyF540CW/egYn+JMkitEJQy76
 jxP3RXnD2hzmAmtwj8S2+UJYv9cUdN6kYnSkZPwmm9eoefp4y6CP+10SvDI9/Lnbig6k
 5Y5P/e3/VztoGygEaLGXZH0EVveuHnp6/KJ8TmH3jMffTtSshj3bSHyGGj0lsF+4VaMQ
 cqDoS/X4crQWJ0pO7j4moFHXy7ttBsl59QAr7jA+GrFIvgkWMwobM9KzwUAvfVsKLezw
 IHHA==
X-Gm-Message-State: ACgBeo0yedaTThI1pDS9CcmDZo0tEkeM+fNK3HQCkZ/9e1vJ+ILwQ7cX
 1ypjQkXaAs+lejXOL8dJUhAXRbfl47IwEg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:249:b0:1e0:a8a3:3c6c with SMTP id
 t9-20020a17090a024900b001e0a8a33c6cmr159484pje.0.1660868419432; Thu, 18 Aug
 2022 17:20:19 -0700 (PDT)
Date: Thu, 18 Aug 2022 17:20:15 -0700
Message-Id: <20220819002015.1663247-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
Subject: [PATCH v2] target/arm: Add cortex-a35
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 Joe Komlodi <komlodi@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3Q9f-YggKCAw86tm054ts00sxq.o0y2qy6-m3yz0zsz6.03s@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: qLdDYm6p+lS+

Add cortex A35 core and enable it for virt board.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Joe Komlodi <komlodi@google.com>
---
 docs/system/arm/virt.rst |  1 +
 hw/arm/virt.c            |  1 +
 target/arm/cpu64.c       | 80 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 82 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 3b6ba69a9a..20442ea2c1 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -52,6 +52,7 @@ Supported guest CPU types:
 
 - ``cortex-a7`` (32-bit)
 - ``cortex-a15`` (32-bit; the default)
+- ``cortex-a35`` (64-bit)
 - ``cortex-a53`` (64-bit)
 - ``cortex-a57`` (64-bit)
 - ``cortex-a72`` (64-bit)
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9633f822f3..ee06003aed 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -199,6 +199,7 @@ static const int a15irqmap[] = {
 static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a7"),
     ARM_CPU_TYPE_NAME("cortex-a15"),
+    ARM_CPU_TYPE_NAME("cortex-a35"),
     ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 78e27f778a..9d1ea32057 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -36,6 +36,85 @@
 #include "hw/qdev-properties.h"
 #include "internals.h"
 
+static void aarch64_a35_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a35";
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
+    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+
+    /* From B2.2 AArch64 identification registers. */
+    cpu->midr = 0x411fd040;
+    cpu->revidr = 0;
+    cpu->ctr = 0x84448004;
+    cpu->isar.id_pfr0 = 0x00000131;
+    cpu->isar.id_pfr1 = 0x00011011;
+    cpu->isar.id_dfr0 = 0x03010066;
+    cpu->id_afr0 = 0;
+    cpu->isar.id_mmfr0 = 0x10201105;
+    cpu->isar.id_mmfr1 = 0x40000000;
+    cpu->isar.id_mmfr2 = 0x01260000;
+    cpu->isar.id_mmfr3 = 0x02102211;
+    cpu->isar.id_isar0 = 0x02101110;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232042;
+    cpu->isar.id_isar3 = 0x01112131;
+    cpu->isar.id_isar4 = 0x00011142;
+    cpu->isar.id_isar5 = 0x00011121;
+    cpu->isar.id_aa64pfr0 = 0x00002222;
+    cpu->isar.id_aa64pfr1 = 0;
+    cpu->isar.id_aa64dfr0 = 0x10305106;
+    cpu->isar.id_aa64dfr1 = 0;
+    cpu->isar.id_aa64isar0 = 0x00011120;
+    cpu->isar.id_aa64isar1 = 0;
+    cpu->isar.id_aa64mmfr0 = 0x00101122;
+    cpu->isar.id_aa64mmfr1 = 0;
+    cpu->clidr = 0x0a200023;
+    cpu->dcz_blocksize = 4;
+
+    /* From B2.4 AArch64 Virtual Memory control registers */
+    cpu->reset_sctlr = 0x00c50838;
+
+    /* From B2.10 AArch64 performance monitor registers */
+    cpu->isar.reset_pmcr_el0 = 0x410a3000;
+
+    /* From B2.29 Cache ID registers */
+    cpu->ccsidr[0] = 0x700fe01a; /* 32KB L1 dcache */
+    cpu->ccsidr[1] = 0x201fe00a; /* 32KB L1 icache */
+    cpu->ccsidr[2] = 0x703fe03a; /* 512KB L2 cache */
+
+    /* From B3.5 VGIC Type register */
+    cpu->gic_num_lrs = 4;
+    cpu->gic_vpribits = 5;
+    cpu->gic_vprebits = 5;
+    cpu->gic_pribits = 5;
+
+    /* From C6.4 Debug ID Register */
+    cpu->isar.dbgdidr = 0x3516d000;
+    /* From C6.5 Debug Device ID Register */
+    cpu->isar.dbgdevid = 0x00110f13;
+    /* From C6.6 Debug Device ID Register 1 */
+    cpu->isar.dbgdevid1 = 0x2;
+
+    /* From Cortex-A35 SIMD and Floating-point Support r1p0 */
+    /* From 3.2 AArch32 register summary */
+    cpu->reset_fpsid = 0x41034043;
+
+    /* From 2.2 AArch64 register summary */
+    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr1 = 0x12111111;
+    cpu->isar.mvfr2 = 0x00000043;
+
+    /* These values are the same with A53/A57/A72. */
+    define_cortex_a72_a57_a53_cp_reginfo(cpu);
+}
 
 static void aarch64_a57_initfn(Object *obj)
 {
@@ -1158,6 +1237,7 @@ static void aarch64_a64fx_initfn(Object *obj)
 }
 
 static const ARMCPUInfo aarch64_cpus[] = {
+    { .name = "cortex-a35",         .initfn = aarch64_a35_initfn },
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
     { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
     { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
-- 
2.37.1.595.g718a3a8f04-goog


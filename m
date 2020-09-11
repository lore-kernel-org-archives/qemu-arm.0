Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1941731lfq;
        Thu, 10 Sep 2020 22:25:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0kxHI8xBQBXgpswDJQj33MYi0BTxFGpNDyrM5pBuoK40ERd/o7EyFK+zd6GMZXMIvkjbF
X-Received: by 2002:aed:2d83:: with SMTP id i3mr401977qtd.198.1599801918096;
        Thu, 10 Sep 2020 22:25:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599801918; cv=none;
        d=google.com; s=arc-20160816;
        b=y9CLzvb1wIwTWul9KILQuVTlJ3tPCKA9POKAEAXRoyD0jSI4RxCbbvCRl++el1KJz4
         wAvL2hxwnGx7sk3H9O+iP+IzYQDXwwV82I3fq/h+K2yn4wKJW6TwgQhyTduVaJeOcH6b
         4aZfZii/9Bs8pAmpxwNc/dcARtRgIHDihMIZHTPMNWKWDrg9w7MR7UVrkdBb4BZowFOo
         Fq4Q/9iMovGUbCNmff19L88EQgjEyjQtqy3lBKodyjJmkI4vkD1uLRMA2vgNzkK52eXb
         O/cklfpdAdjGj4T6cHIcI2Rpo+fLSFt3yhsxzh3sbkJBkO7XqH4XETu6VjjjbH8PaIS2
         j4RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:subject:references:mime-version
         :message-id:in-reply-to:date:dkim-signature;
        bh=WWpqX/yBMhPt82OS1Sbtd+fIf4AGvUd/kuDW3qcWHk0=;
        b=Q90h1YrKEG6JmUBODE0L30SVSSiVk7TBaQGFcUSnJPGhfLMG+8Eh0iMp4s4X18/xly
         YLzoxvE837UU+pFZZoDlmlGtGZfPwu7+1uMh09tjltSAjYTPYtY8tLOm34ZsXgU9sFEX
         1M7Cyl9LfcUuDtufWWeSFLVQNvDt+FY6fhorbSCmCvg8jaol9oOsdAjjLcKK4qx1Rlfw
         Yg6dBbE54n1Jd+4fAy1kKZQhDCgeX0kZndKc9r+nyNnE3WuXlFoakVAMJ2G4EulHy3aL
         VMYhvgy1V9lhDvtECdk96PlRjsXL7UVnIXSpm0YHETUUDDIkZdoJ0T8LogxkJs/i9p+Z
         Gvqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=E2BpsfzY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t26si695873qkj.124.2020.09.10.22.25.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Sep 2020 22:25:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=E2BpsfzY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGbYj-00051i-GU
	for alex.bennee@linaro.org; Fri, 11 Sep 2020 01:25:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3WwlbXwsKCtoDOGEJJAIKAJCKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--hskinnemoen.bounces.google.com>)
 id 1kGbV9-0006rU-E6
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 01:21:35 -0400
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a]:44450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3WwlbXwsKCtoDOGEJJAIKAJCKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--hskinnemoen.bounces.google.com>)
 id 1kGbV7-0002Pa-GI
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 01:21:35 -0400
Received: by mail-pj1-x104a.google.com with SMTP id o11so1436310pjj.9
 for <qemu-devel@nongnu.org>; Thu, 10 Sep 2020 22:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc:content-transfer-encoding;
 bh=WWpqX/yBMhPt82OS1Sbtd+fIf4AGvUd/kuDW3qcWHk0=;
 b=E2BpsfzY/j/0MdXwbI118DSMj7RbHg05On9Ij1iMQ9VU2l589Jg7QTBkML0e2UphKL
 nYqVjC4VJgFb4iHdxQSXVaBjneW8HdDgjHCVQNHsZaU8JZlKQVnqCFAX7uI2kadfthnS
 aVR0DvH2CNLY25EIiFWQMY6HbVzWgrM14cndVoBu1LvcVQK91RCTpP3ob3QSyiA1DYyN
 TderlMmMaY66JhLB6o1wZS2RU98cZDi4+bhuo2ApFSpILHbP0wFA7MjyWRpzd9KS9JEi
 bnxHunQGj98QaSSfMnUj2gW1XEPZbf+3YdEX0ni6KSPbTVjLE0Ggpk1P0J9+GaLsP1eG
 bcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=WWpqX/yBMhPt82OS1Sbtd+fIf4AGvUd/kuDW3qcWHk0=;
 b=LknBACIdi8WNqyZelaSCxVPK5OEFZLyjRuX3p8+LHUFU3S5Wbvl5H8xhf2K4J5Xafi
 57ZvKN+4R6O12e77PmI3brzYKBfvUum5BZPBXsy+HSrZCGGlE8Sikdb6bfsqyDblBUFJ
 e6xI3G7onGlSAUcSRHZZZB2uxYnqE6u4GVLDAR+cCt1wYhwA4NBk+TaM7NgmfeSV2p5j
 f9QVIU4DQSecgLaI2jNaM8D4YvikMMCsH0+yMbsmFc+C+XEN2PzqxbReDS+/DHeu1vv/
 bXBY5XOjedQ10rXZyeH4RfLO2MJB7rZTCyeQRzuQFQAFk8wAZbLYbkefSZSElBnZdS99
 m5nw==
X-Gm-Message-State: AOAM530G53wbZDYXoDoln5lzdn6KwxjP3p5k8/lmWXi+4HkcDySjEy+n
 mk+FDwXOoaC2TZYOcIlURExl18N5jo/9eVE+Rg==
X-Received: from skybert.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:3107])
 (user=hskinnemoen job=sendgmr) by
 2002:aa7:8f0b:0:b029:13e:d13d:a0fb with
 SMTP id x11-20020aa78f0b0000b029013ed13da0fbmr540727pfr.23.1599801691678;
 Thu, 10 Sep 2020 22:21:31 -0700 (PDT)
Date: Thu, 10 Sep 2020 22:20:59 -0700
In-Reply-To: <20200911052101.2602693-1-hskinnemoen@google.com>
Message-Id: <20200911052101.2602693-13-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200911052101.2602693-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
Subject: [PATCH v9 12/14] hw/arm/npcm7xx: add board setup stub for CPU and
 UART clocks
To: peter.maydell@linaro.org, f4bug@amsat.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3WwlbXwsKCtoDOGEJJAIKAJCKKCHA.8KIMAIQ-9ARAHJKJCJQ.KNC@flex--hskinnemoen.bounces.google.com;
 helo=mail-pj1-x104a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to: Havard Skinnemoen <hskinnemoen@google.com>
From: Havard Skinnemoen via <qemu-devel@nongnu.org>
X-TUID: jyNzqYXNvyCr

When booting directly into a kernel, bypassing the boot loader, the CPU and
UART clocks are not set up correctly. This makes the system appear very
slow, and causes the initrd boot test to fail when optimization is off.

The UART clock must run at 24 MHz. The default 25 MHz reference clock
cannot achieve this, so switch to PLL2/2 @ 480 MHz, which works
perfectly with the default /20 divider.

The CPU clock should run at 800 MHz, so switch it to PLL1/2. PLL1 runs
at 800 MHz by default, so we need to double the feedback divider as well
to make it run at 1600 MHz (so PLL1/2 runs at 800 MHz).

We don't bother checking for PLL lock because we know our emulated PLLs
lock instantly.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 include/hw/arm/npcm7xx.h |  1 +
 hw/arm/npcm7xx.c         | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 78d0d78c52..13106af215 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -37,6 +37,7 @@
 #define NPCM7XX_SMP_LOADER_START        (0xffff0000)  /* Boot ROM */
 #define NPCM7XX_SMP_BOOTREG_ADDR        (0xf080013c)  /* GCR.SCRPAD */
 #define NPCM7XX_GIC_CPU_IF_ADDR         (0xf03fe100)  /* GIC within A9 */
+#define NPCM7XX_BOARD_SETUP_ADDR        (0xffff1000)  /* Boot ROM */
=20
 typedef struct NPCM7xxMachine {
     MachineState        parent;
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 7884b2b03d..037f3a26f2 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -55,6 +55,13 @@
 #define NPCM7XX_ROM_BA          (0xffff0000)
 #define NPCM7XX_ROM_SZ          (64 * KiB)
=20
+/* Clock configuration values to be fixed up when bypassing bootloader */
+
+/* Run PLL1 at 1600 MHz */
+#define NPCM7XX_PLLCON1_FIXUP_VAL   (0x00402101)
+/* Run the CPU from PLL1 and UART from PLL2 */
+#define NPCM7XX_CLKSEL_FIXUP_VAL    (0x004aaba9)
+
 /*
  * Interrupt lines going into the GIC. This does not include internal Cort=
ex-A9
  * interrupts.
@@ -132,6 +139,29 @@ static const struct {
     },
 };
=20
+static void npcm7xx_write_board_setup(ARMCPU *cpu,
+                                      const struct arm_boot_info *info)
+{
+    uint32_t board_setup[] =3D {
+        0xe59f0010,     /* ldr r0, clk_base_addr */
+        0xe59f1010,     /* ldr r1, pllcon1_value */
+        0xe5801010,     /* str r1, [r0, #16] */
+        0xe59f100c,     /* ldr r1, clksel_value */
+        0xe5801004,     /* str r1, [r0, #4] */
+        0xe12fff1e,     /* bx lr */
+        NPCM7XX_CLK_BA,
+        NPCM7XX_PLLCON1_FIXUP_VAL,
+        NPCM7XX_CLKSEL_FIXUP_VAL,
+    };
+    int i;
+
+    for (i =3D 0; i < ARRAY_SIZE(board_setup); i++) {
+        board_setup[i] =3D tswap32(board_setup[i]);
+    }
+    rom_add_blob_fixed("board-setup", board_setup, sizeof(board_setup),
+                       info->board_setup_addr);
+}
+
 static void npcm7xx_write_secondary_boot(ARMCPU *cpu,
                                          const struct arm_boot_info *info)
 {
@@ -170,6 +200,8 @@ static struct arm_boot_info npcm7xx_binfo =3D {
     .gic_cpu_if_addr        =3D NPCM7XX_GIC_CPU_IF_ADDR,
     .write_secondary_boot   =3D npcm7xx_write_secondary_boot,
     .board_id               =3D -1,
+    .board_setup_addr       =3D NPCM7XX_BOARD_SETUP_ADDR,
+    .write_board_setup      =3D npcm7xx_write_board_setup,
 };
=20
 void npcm7xx_load_kernel(MachineState *machine, NPCM7xxState *soc)
--=20
2.28.0.526.ge36021eeef-goog


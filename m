Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2988876lfy;
        Mon, 24 Aug 2020 17:23:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4zXXOD4ugcopA7ABBkLIDUpT1C1ccyYkCyQo7DOH4iDxVNuutiO8nplOR1i9+NcYFM66W
X-Received: by 2002:a25:b4c:: with SMTP id 73mr10873039ybl.102.1598315001813;
        Mon, 24 Aug 2020 17:23:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598315001; cv=none;
        d=google.com; s=arc-20160816;
        b=L7Y9DiKoNW2u/XkLGf8qyPrqY8BIEy2WmZL2/F25KLUsgRjRPCPTUiRuRE4VHGvsan
         x/4lrgGEdSVwCEYUwbdE4yhc6mGV4nsHH/DxY8KdGZSlzoZu55d8nbFikM/xWvp8oYTQ
         jR2reNUWmZj4uSIIYpc1lBpb4U7iYYh4e9WTpzopDXc9joj8SXolecwLSDueHMhdqbdw
         IdZOzdGJbBp3DUtLKdcvZ9BoEjNCD6xW2AeInNLQyGqpNAYRz2dJDiJNUxN43F3f9w7b
         B/1B+Fc64lJdqh699/7sJVRW7fTcfdVfsy2m7G/rfPrWYlDpGavbWj/v8VZgDROO9N2g
         CNcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:cc:to:subject
         :references:mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=1eUKc4mUKGxpAfRnn7edRuE+wT0NYPxDKPSyLd06AXc=;
        b=IXmy9MGVzhoz6/rTo4i0IKom6BlUprmHGKXRnVMsLobFppkaMU+rywB+OKpMQX5Ba/
         5IVpAb5JyY6cArIf/M4awyAzKqo62MfcajDCM/KSZtRJ7M4YSgDUQdRx1NJ8JjXEUr7z
         quu24fPVGv4YwSy+pJLCpmnmmZ2NwrnJ6mL0BtOPfa/e9feYBItgVpSdRstz40G9VZpu
         cy2z3mw6gCjkvFTg24V/+FE94UBcUlKe2e97HPb0/DwxWMM4QVvEX0nLlzWvQV3nNj8Y
         lVz0m3jSwQTdC6dC8QfJH5wGMUMqtVVnn76fIVQuLekWLXS0syB0nKRvPVDHTUMzUnz1
         5Nkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=i93oxQc9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d131si11983277ybh.16.2020.08.24.17.23.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 17:23:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=i93oxQc9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAMkD-0006ZP-6M
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 20:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3qFhEXwsKCGsQbTRWWNVXNWPXXPUN.LXVZNVd-JaVWXWPWd.XaP@flex--hskinnemoen.bounces.google.com>)
 id 1kAMer-0004UM-OC
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 20:17:50 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:53303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3qFhEXwsKCGsQbTRWWNVXNWPXXPUN.LXVZNVd-JaVWXWPWd.XaP@flex--hskinnemoen.bounces.google.com>)
 id 1kAMeo-00069Z-K8
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 20:17:49 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id d26so12732834yba.20
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2020 17:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=1eUKc4mUKGxpAfRnn7edRuE+wT0NYPxDKPSyLd06AXc=;
 b=i93oxQc97gPif+5l4MHVqnL0YPMUFlN8wvY3LI9yWOg2mHfMPjZqLRqsQqH2ZNGD53
 uevKckWnlmqo2HG4m9p3FxLYYDgsBVFk9xZWf/KjF2fUZs5BsaAWOeV4lmHe6Gq0PIOl
 y6Veokzd3DM7fI5DO3EJks/63EmZLKJv3cqzXJgtrkQZiCw0Gprnq9eDBr9VoskVB/r0
 Gx5cQilHKjRRZhTJU8mvC8ZRDoq+TERAdsnDFDiUBLK6dXDvenB55D3Uo6awa9Mc5O5M
 Hs14JjX+++uxtEQMY7VDFU9ZhHS1H39ct+JdyNTxAL1h7DlL0/4TStCHfNv8v5CwEbtF
 Vcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=1eUKc4mUKGxpAfRnn7edRuE+wT0NYPxDKPSyLd06AXc=;
 b=ft/Y4yOb022JvXz2I/4mK67Ei05eywzR6Uzk8Z5CEWkXL1UHKcDQ79Eyz2CJIGDYO7
 sK86GFMl14bECG23+ONskZzzohbXKgr3aq6I3XeuC/FPBr1CxXyYBlDkiOF10n3YfUEJ
 AdKm+fy92FV4dqdeLxvbQC6tj5Paddk0ooVoq0YWl43xNQHmRRRIB7pQFnt7PZhzhQFq
 gGD6EwE1jHZgONI3r/EPrI2swYH5rjEs9khx8qlUCtXg/CGAcXpz3ZGwA7GPa7h0/Dk4
 McVVZUpf/CfyDpvJl7/bzGnKah+qCDoSX+Suj2wSXpUnjx99Af8Oasxnz3hhnQZE2XfK
 RqaA==
X-Gm-Message-State: AOAM530Wafrv+96wd6/giGuPLPZyjTfNvHPY04/8rSNq/iT/HkHUI9N9
 1b/zUWB8/kpw/9cIQ5TQT4h6i9a3t65EaY7OcQ==
X-Received: from skybert.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:3107])
 (user=hskinnemoen job=sendgmr) by 2002:a25:9004:: with SMTP id
 s4mr10468658ybl.247.1598314664144; Mon, 24 Aug 2020 17:17:44 -0700 (PDT)
Date: Mon, 24 Aug 2020 17:17:09 -0700
In-Reply-To: <20200825001711.1340443-1-hskinnemoen@google.com>
Message-Id: <20200825001711.1340443-13-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200825001711.1340443-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH v8 12/14] hw/arm/npcm7xx: add board setup stub for CPU and
 UART clocks
To: peter.maydell@linaro.org, f4bug@amsat.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3qFhEXwsKCGsQbTRWWNVXNWPXXPUN.LXVZNVd-JaVWXWPWd.XaP@flex--hskinnemoen.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Reply-to: Havard Skinnemoen <hskinnemoen@google.com>
From: Havard Skinnemoen via <qemu-arm@nongnu.org>
X-TUID: bKFoJqPgLXWx

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
 
 typedef struct NPCM7xxMachine {
     MachineState        parent;
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 7884b2b03d..037f3a26f2 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -55,6 +55,13 @@
 #define NPCM7XX_ROM_BA          (0xffff0000)
 #define NPCM7XX_ROM_SZ          (64 * KiB)
 
+/* Clock configuration values to be fixed up when bypassing bootloader */
+
+/* Run PLL1 at 1600 MHz */
+#define NPCM7XX_PLLCON1_FIXUP_VAL   (0x00402101)
+/* Run the CPU from PLL1 and UART from PLL2 */
+#define NPCM7XX_CLKSEL_FIXUP_VAL    (0x004aaba9)
+
 /*
  * Interrupt lines going into the GIC. This does not include internal Cortex-A9
  * interrupts.
@@ -132,6 +139,29 @@ static const struct {
     },
 };
 
+static void npcm7xx_write_board_setup(ARMCPU *cpu,
+                                      const struct arm_boot_info *info)
+{
+    uint32_t board_setup[] = {
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
+    for (i = 0; i < ARRAY_SIZE(board_setup); i++) {
+        board_setup[i] = tswap32(board_setup[i]);
+    }
+    rom_add_blob_fixed("board-setup", board_setup, sizeof(board_setup),
+                       info->board_setup_addr);
+}
+
 static void npcm7xx_write_secondary_boot(ARMCPU *cpu,
                                          const struct arm_boot_info *info)
 {
@@ -170,6 +200,8 @@ static struct arm_boot_info npcm7xx_binfo = {
     .gic_cpu_if_addr        = NPCM7XX_GIC_CPU_IF_ADDR,
     .write_secondary_boot   = npcm7xx_write_secondary_boot,
     .board_id               = -1,
+    .board_setup_addr       = NPCM7XX_BOARD_SETUP_ADDR,
+    .write_board_setup      = npcm7xx_write_board_setup,
 };
 
 void npcm7xx_load_kernel(MachineState *machine, NPCM7xxState *soc)
-- 
2.28.0.297.g1956fa8f8d-goog


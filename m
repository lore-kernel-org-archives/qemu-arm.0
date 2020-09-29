Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4811116lfq;
        Tue, 29 Sep 2020 11:09:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7lE8wAPMQVsJtb1MAULwKhxfWdo4rzfpSEvaIh8uDLbc/Ev+hT2arbb++9IsSJyLI8y4c
X-Received: by 2002:a25:a083:: with SMTP id y3mr8053695ybh.278.1601402945826;
        Tue, 29 Sep 2020 11:09:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601402945; cv=none;
        d=google.com; s=arc-20160816;
        b=LZ9lMsDWwXqbFLd0BqLiepN80qKZG636EAcMTCc4KKpgg2qOMTATj8fzG/dew8YRkw
         Rh+Gu82wQQts8yJUN39fZQTlnGteguBXdwbFm6FS3U+dAvQH+h27RbZNDIZFOhlU2t7/
         I1MkKYxWNNEYwRRS9hLyzdE8XMqm60WNSq4Hy4BPEAgznbvZGMhSQ0rILy/QOZzJpEL7
         CdW/8Qg09IOI0jdsSpYXsu7r+8MeSRPdAsX3vnLltM2DNq3DcFB+wcoCO44SNZnlGLNo
         god3S9ngyUWJaorkMEh/56scpgxlW/TVqDzkCTZLLMTffRYFeOZjYDdR2BWVf+4x8Lio
         iOtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=M/DFtl07DbniPTffKuqIPeshFScMcLoVhHYnqUvbx0k=;
        b=ZUDYjWvHfP8Y4AbVj1czAhBljrxwZyCE9kyWcnHCEMvx6t7KERL7i8BO6c/F0u34Xs
         BtthNb3LAdCK/hFI6UQ6z9FVPkCr4a7hmkVTEQwk2Guk1xxz3jD7xbqZ3pmpXoCMel2c
         N2ijBi4jp6ATiQwmoD9W3Inbr/oRhFk5Tr9NRzX3nnwQnnApnzQJEJ7xLrGmb1VdSm9c
         FtH3bltZXE4jKqMlOkugxOPYarDmBW03ZN2xbNlXdRLKibmBtsZjvqhp22GsyLrpkQKg
         GQQFkfUe2k4EQ4TIhXu7Vd3QJi2VrjkaG03pI41V94dLfgZnUJoRkgUbFd/64mLf0Ril
         CzXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o+VlDJDv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j4si5002127ybj.305.2020.09.29.11.09.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 11:09:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o+VlDJDv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNK3l-0001ka-9A
	for alex.bennee@linaro.org; Tue, 29 Sep 2020 14:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kNJz7-0006o8-VL
 for qemu-arm@nongnu.org; Tue, 29 Sep 2020 14:04:17 -0400
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:41538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kNJz5-0001Lh-6g
 for qemu-arm@nongnu.org; Tue, 29 Sep 2020 14:04:17 -0400
Received: by mail-qt1-x841.google.com with SMTP id b2so4304806qtp.8
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2020 11:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=M/DFtl07DbniPTffKuqIPeshFScMcLoVhHYnqUvbx0k=;
 b=o+VlDJDv+CVV7igLMurV+r2w1NuRvw4jHycHXU4fcMb4ermk2hgukvraImNbxLZbCZ
 1DMYb5Kqgo6Y/CimanLqEtuk3GCELwHvMDu/M2YxqwF9EU4XHLeyNymgXPqnpKsXZGXO
 BqhHAG1maStFn4SM4EGGG/qMtRrNOFOP9mL1E8nHjH/5RL8CdGkgOblKkpjGy60q8PFu
 d+4ZvxJ5ZE0c5FMJx63dF6CY7xAZmEIs3fd6VMyQT7vapuvZitVExu7vCs2LEo4xyNe3
 lfcXnUyrudBgXx95RrIsj4lhAENWXZFVNAFzWYODVWygKUlMp0M38V5yuSe5KCPCHOvY
 HVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=M/DFtl07DbniPTffKuqIPeshFScMcLoVhHYnqUvbx0k=;
 b=BZBOTt7brD5Goptwx8bOx59v1zrEWaHb5GR+pBGZo5e7OiVDNaow6z9+Tmkhpfajx0
 rVFAP2Bbdq3thfCApj/BZ4xCBFg6KOAXXkBlMYnFMRVRPVdoKAbL6hwdomSsMsHD2wDq
 O2mwHO93nIEb6g8wFSQJXXEmXRhJgGJ3vZbKvdjYO8jUUjRXTEjTdp19RlSCtJYKheYl
 k+qr9S7SfpTrNsdhQ1HxOQvw64D1jheI8V76qV+Y7xkz4ld2s56JGvXqLXlmKHwGHGdr
 AekP8ttzltcfpyztHEibEuB0JNTP2pEujIGJwrUW4Xwq7B5P1HHPLZeQtDpptZm94Ks0
 OPIA==
X-Gm-Message-State: AOAM533IRzTQqP1r8LK8GIzW9ThY0qifmaAWlxs2RLqaQv5oX/1CsvZ1
 ksLEf3LlEmvnP5ipvoEhQ8RCHQ==
X-Received: by 2002:ac8:748d:: with SMTP id v13mr4563099qtq.301.1601402654213; 
 Tue, 29 Sep 2020 11:04:14 -0700 (PDT)
Received: from master.hitronhub.home ([2607:fea8:e2a0:e950::661])
 by smtp.googlemail.com with ESMTPSA id n7sm6600337qtf.27.2020.09.29.11.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 11:04:13 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v2 2/2] hw/arm/sbsa-ref: add SBSA watchdog device
Date: Tue, 29 Sep 2020 14:04:10 -0400
Message-Id: <20200929180410.33058-3-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200929180410.33058-1-shashi.mallela@linaro.org>
References: <20200929180410.33058-1-shashi.mallela@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::841;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x841.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BRZZaQDEhTn1

Included the newly implemented SBSA generic watchdog device model into
SBSA platform

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/arm/sbsa-ref.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 257ada942550..99a16f3c93ba 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -40,6 +40,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/usb.h"
 #include "hw/char/pl011.h"
+#include "hw/watchdog/wdt_sbsa_gwdt.h"
 #include "net/net.h"
 #include "qom/object.h"
 
@@ -64,6 +65,9 @@ enum {
     SBSA_GIC_DIST,
     SBSA_GIC_REDIST,
     SBSA_SECURE_EC,
+    SBSA_GWDT,
+    SBSA_GWDT_REFRESH,
+    SBSA_GWDT_CONTROL,
     SBSA_SMMU,
     SBSA_UART,
     SBSA_RTC,
@@ -109,6 +113,8 @@ static const MemMapEntry sbsa_ref_memmap[] = {
     [SBSA_GIC_DIST] =           { 0x40060000, 0x00010000 },
     [SBSA_GIC_REDIST] =         { 0x40080000, 0x04000000 },
     [SBSA_SECURE_EC] =          { 0x50000000, 0x00001000 },
+    [SBSA_GWDT_REFRESH] =       { 0x50010000, 0x00001000 },
+    [SBSA_GWDT_CONTROL] =       { 0x50011000, 0x00001000 },
     [SBSA_UART] =               { 0x60000000, 0x00001000 },
     [SBSA_RTC] =                { 0x60010000, 0x00001000 },
     [SBSA_GPIO] =               { 0x60020000, 0x00001000 },
@@ -138,6 +144,7 @@ static const int sbsa_ref_irqmap[] = {
     [SBSA_SECURE_UART_MM] = 9,
     [SBSA_AHCI] = 10,
     [SBSA_EHCI] = 11,
+    [SBSA_GWDT] = 12,
 };
 
 static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
@@ -452,6 +459,20 @@ static void create_rtc(const SBSAMachineState *sms)
     sysbus_create_simple("pl031", base, qdev_get_gpio_in(sms->gic, irq));
 }
 
+static void create_wdt(const SBSAMachineState *sms)
+{
+    hwaddr rbase = sbsa_ref_memmap[SBSA_GWDT_REFRESH].base;
+    hwaddr cbase = sbsa_ref_memmap[SBSA_GWDT_CONTROL].base;
+    DeviceState *dev = qdev_new(TYPE_WDT_SBSA_GWDT);
+    SysBusDevice *s = SYS_BUS_DEVICE(dev);
+    int irq = sbsa_ref_irqmap[SBSA_GWDT];
+
+    sysbus_realize_and_unref(s, &error_fatal);
+    sysbus_mmio_map(s, 0, rbase);
+    sysbus_mmio_map(s, 1, cbase);
+    sysbus_connect_irq(s, 0, qdev_get_gpio_in(sms->gic, irq));
+}
+
 static DeviceState *gpio_key_dev;
 static void sbsa_ref_powerdown_req(Notifier *n, void *opaque)
 {
@@ -735,6 +756,8 @@ static void sbsa_ref_init(MachineState *machine)
 
     create_rtc(sms);
 
+    create_wdt(sms);
+
     create_gpio(sms);
 
     create_ahci(sms);
-- 
2.18.4


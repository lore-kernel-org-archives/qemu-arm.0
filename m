Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp733240lfa;
        Thu, 15 Oct 2020 09:35:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEtZMTB3PQdns0uUK8lm6QM1dpQ/gT/H7DkTCy/q8rVhvU4AwYI8efnySWbgFeItofDi6c
X-Received: by 2002:a25:aa14:: with SMTP id s20mr6565222ybi.210.1602779722509;
        Thu, 15 Oct 2020 09:35:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602779722; cv=none;
        d=google.com; s=arc-20160816;
        b=xKR69NbFIz5Cz9SBRGSvfdt9OeCmeHvHRJZ4ZbROw7G9G0VgGOFlxhIsGZqpdxHGJO
         6ltJiUlvyD+w7NtXccCYxhrVh9w+AIoRQtYNzUQPpXRe7yArccqMGwBEwD29TdDNVTgD
         W371svL/aabTDItfYBHV8Wtqmd1ePpMQPRwv6gjHVdCeMTLyB5TXf6sdm5YTSTuQOxjb
         RBrzBGhbXHaxeorK1ijSz0/x7gHT3J3Ra1MS74tgWzeT+PPy/AEGIfHoi2cUfUsoQD0p
         7k4dKEnMD0SnWAena3u/aDGhWT93UPZ3VfklhbnEnlmV43Dak+6SMcqDznZmshaSYW0l
         8ycQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=1UmYEvhyZgK1qIGwpSsJJHOwQVTxNS3Tja5Dv+YNeUw=;
        b=hLBhw47Y27u5u9UMZkcUmWv9YWdLbGk6RC/b7OxMksTDowfiwu5UdIQTFuwJPblyJ9
         QCLucKKu7MYTR21vAibDB8+5Iupu1YgeRPTvYSzUwCpWA5KdmZy3fDP5V74H3PvAFnXU
         nRdNlN/2lV1gn51laGWKN9AQ49bO4aTpErHKR2p+IKJk6bFmns00Og8vO954fTA8KeVl
         O1qx37YqAFApMrG6GNC76j4+0f866HJidxF98S4MJ4Ksr9O6r7/XPJGf6Vc9zXAEPsL0
         WmNHWsKTkWHiIRWgdqxeS2IKHNfjv8wnWA+M5xLHCT4qvE9yNNoAgLhdWDaueT/oVTzm
         +iQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SSEW3TyK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d129si2875452ybh.40.2020.10.15.09.35.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Oct 2020 09:35:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SSEW3TyK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kT6Dp-0006xX-TA
	for alex.bennee@linaro.org; Thu, 15 Oct 2020 12:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kT6Da-0006tp-Gr
 for qemu-arm@nongnu.org; Thu, 15 Oct 2020 12:35:09 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:34437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kT6DY-0007bf-2h
 for qemu-arm@nongnu.org; Thu, 15 Oct 2020 12:35:06 -0400
Received: by mail-qt1-x842.google.com with SMTP id h12so2034142qtu.1
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2020 09:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1UmYEvhyZgK1qIGwpSsJJHOwQVTxNS3Tja5Dv+YNeUw=;
 b=SSEW3TyKjqcOXcst/XQvPeLDNqcRVwS4Z5rM0Jpgl/a+HNU4NVy5uqL0R1K7WcKX+i
 hJ6EWdgAmGrEUsaLxdnVCtBm3ie3iMFyKhRhlxTrZLOmArEXGAW9Y+bLlypq29RoUHw3
 lhQqQY98Q+Tw7e7SWcgWi8cfxbSR2+mtvbKoel+2vGgE3fPTA3+YhIQHp73MZM8VMWKV
 SUviy2VyA/IJRBF0siHoMlDI1ClaPxGYKoCFA77Uqny9FvkpVwLDFYuiXHbrlTbbuh/3
 KOa00Xu2SbCF4jNCCQOpIbLP+v4k2GWQQzxlEjZcU/HxuHHvr8hlkOpX8hLp00DA6OZO
 plNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1UmYEvhyZgK1qIGwpSsJJHOwQVTxNS3Tja5Dv+YNeUw=;
 b=mTHnb3DeGF+vcCiVKcafpHEcKu45w3sWx8YZj/wU7CDbcPHNzvnFqUpaLQbONNNDZw
 iCpGjuSKXw3aJ5358kVsDBb8qVycGr1ouWAlzfu1oGiDTEx45GU0f0e2V02bOmf2pKTS
 DgOwOJrc2i9iPe0ntApp7HRgz+gfI4xw+eepcwGdbkLte3E40I1FqWVCHTtH7ENFcuEo
 JuhT2R1YeRQmT6V+Apfbiff30KaGDFxrZxt7PN6nJNW3wMgDzJ7n7G9DHgyVcNb4Ao+a
 WGcSAjWiv1ZqitjRkn5zXqheCJhFKNWinXnqTkrZaJaS76q+aICXZSChNd3NhT4wQAML
 4TCw==
X-Gm-Message-State: AOAM533GR81pireWY63cSbuswMl/HDEaESuDaD14bylgpngbJ70L7U47
 0LSOTw7WHvGeB6kkdNiQ/56f7Q==
X-Received: by 2002:ac8:2bdd:: with SMTP id n29mr4852500qtn.369.1602779703292; 
 Thu, 15 Oct 2020 09:35:03 -0700 (PDT)
Received: from localhost.localdomain
 (stsvon1503w-lp130-06-174-91-97-36.dsl.bell.ca. [174.91.97.36])
 by smtp.googlemail.com with ESMTPSA id s73sm1338373qke.71.2020.10.15.09.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 09:35:02 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v6 2/2] hw/arm/sbsa-ref: add SBSA watchdog device
Date: Thu, 15 Oct 2020 12:34:59 -0400
Message-Id: <20201015163459.32298-3-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20201015163459.32298-1-shashi.mallela@linaro.org>
References: <20201015163459.32298-1-shashi.mallela@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::842;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x842.google.com
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
X-TUID: UGUwb/brlNSZ

Included the newly implemented SBSA generic watchdog device model into
SBSA platform

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/arm/sbsa-ref.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 01863510d0f5..671859ec9711 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -30,6 +30,7 @@
 #include "exec/hwaddr.h"
 #include "kvm_arm.h"
 #include "hw/arm/boot.h"
+#include "hw/arm/fdt.h"
 #include "hw/block/flash.h"
 #include "hw/boards.h"
 #include "hw/ide/internal.h"
@@ -40,6 +41,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/usb.h"
 #include "hw/char/pl011.h"
+#include "hw/watchdog/wdt_sbsa_gwdt.h"
 #include "net/net.h"
 #include "qom/object.h"
 
@@ -64,6 +66,9 @@ enum {
     SBSA_GIC_DIST,
     SBSA_GIC_REDIST,
     SBSA_SECURE_EC,
+    SBSA_GWDT,
+    SBSA_GWDT_REFRESH,
+    SBSA_GWDT_CONTROL,
     SBSA_SMMU,
     SBSA_UART,
     SBSA_RTC,
@@ -104,6 +109,8 @@ static const MemMapEntry sbsa_ref_memmap[] = {
     [SBSA_GIC_DIST] =           { 0x40060000, 0x00010000 },
     [SBSA_GIC_REDIST] =         { 0x40080000, 0x04000000 },
     [SBSA_SECURE_EC] =          { 0x50000000, 0x00001000 },
+    [SBSA_GWDT_REFRESH] =       { 0x50010000, 0x00001000 },
+    [SBSA_GWDT_CONTROL] =       { 0x50011000, 0x00001000 },
     [SBSA_UART] =               { 0x60000000, 0x00001000 },
     [SBSA_RTC] =                { 0x60010000, 0x00001000 },
     [SBSA_GPIO] =               { 0x60020000, 0x00001000 },
@@ -134,6 +141,7 @@ static const int sbsa_ref_irqmap[] = {
     [SBSA_AHCI] = 10,
     [SBSA_EHCI] = 11,
     [SBSA_SMMU] = 12, /* ... to 15 */
+    [SBSA_GWDT] = 16,
 };
 
 static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
@@ -448,6 +456,20 @@ static void create_rtc(const SBSAMachineState *sms)
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
@@ -731,6 +753,8 @@ static void sbsa_ref_init(MachineState *machine)
 
     create_rtc(sms);
 
+    create_wdt(sms);
+
     create_gpio(sms);
 
     create_ahci(sms);
-- 
2.18.4


Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3923077wru;
        Tue, 7 Aug 2018 01:06:29 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcOBzN9HR0wr4I3ZcHbBHHppGZxtprev2aEIC4PWqkkjh2hMn3E62fOQ8HP1TPGbHjL2yij
X-Received: by 2002:a37:5f03:: with SMTP id t3-v6mr16896705qkb.193.1533629189381;
        Tue, 07 Aug 2018 01:06:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533629189; cv=none;
        d=google.com; s=arc-20160816;
        b=q2U3tDtLVCZP6mMyunpihyszZv0kbQV49+DmSMZbO61n5bqRXqDnw52cIn9wQUok3n
         npRycEPBNXYUCG25afM9ggEvdBPxEJw2bDN3/95dXaBBu0QRY0AtsSW5sQXnx+XDmUf2
         8zaUEpHW8cUu7Ic9uf0grlj62aBiUCYHl8vnd0a6CrhlwQBVkvBKPhO6x6g5Vrqfwrkw
         o1me1BLlf0LNFDBJqt1MWEV4ojnu+LGiJ1vtjjgnpjdSlAyOYe8YT98Uxi23L95GuXKS
         JxHqi/fepr+KqgVol42j49YhboG4Ac2I9lHfrfKks9WqANfEWYpfcolb/txS1R1Zkkh9
         1f+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=3RtZ/h1iBSZFLfoCfLXbdQ+HU5csM0CuyQNEFOBPc6o=;
        b=qE8iJpO1EKiN9HM4abVBzPBi1HKeniWhkEZ2H3batqyX/vW//L3fZ51FW5kJvZbmJv
         UbI5yrbm7EtyayENxQZzbmeb1t4p7x4V4yANSDWkLCt+Nr1DfyZKp7chaNPyuTx50a9f
         i8ibRenWNzsimT0eN13Z8i5Z+sTGHA7E1D1p5v1xb5ApaHOX3iymla2KIASrl7UCHukF
         pYEEbZGQA+YVtkrPDV0BX4Ov5PYDDl8YXsD/mn4AiXP1lDxpEIaxwkK9lF1frOgDZ2iR
         BAlW6RIWqGdl59gD5KUThjpK7Jv4eno1KfJ33AOyK/E4o9CYAX1/TfxfsOFK0u+WA42R
         7Ueg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=thV71t9b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d17-v6si602262qvo.36.2018.08.07.01.06.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 01:06:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=thV71t9b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37852 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmx0e-0000ko-UO
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 04:06:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fmwtR-00035L-Ta
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 03:59:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fmwtN-0005gi-1t
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 03:59:02 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:38680)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fmwtM-0005gZ-Rg; Tue, 07 Aug 2018 03:58:56 -0400
Received: by mail-pf1-x441.google.com with SMTP id x17-v6so8177215pfh.5;
	Tue, 07 Aug 2018 00:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3RtZ/h1iBSZFLfoCfLXbdQ+HU5csM0CuyQNEFOBPc6o=;
	b=thV71t9bcbv9TbqM3oF2alcsBU5GRiVmj+M4pFZEt5DUCuI2rn5/cV49rBOnsOlSZU
	1X8PQnhGwgVB9/93LouJBcx9DztKiWIs0dZtqDBedHrT63bQ4ifL2508hD/pat8oO5Dl
	HF1Kzco+kRhZDdtzTJO5do2hXz0n61ZU6Q3sQqXaBWnp4nT/jotEX830KW9/YM+klbL0
	1HM+AICJ+ChuSIqnL13ODFlc7mkl4cG2MQ6GcK8VRosy9vy/cJELXMXTUnLJxhBP3+pa
	jSiC1w2BBrrEZwA30qoqYXY7ht20hnZhVeu90zOzuW9Bsqb+RT2Vu1y/KAK4PPtKBjOw
	m3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=3RtZ/h1iBSZFLfoCfLXbdQ+HU5csM0CuyQNEFOBPc6o=;
	b=gPqlwCZfTS6fFDgL0A+ONBfX3ctbsTs/gV37dJytrjJl2JwhnDnWq0udLRFWZTg+Ob
	O+Fc9Ub73H9NtTAHbg0996eJf1ir1ltzvQstHNlbA+C+KMXNy3MtDqn0qBeaGksF3cQY
	y5yYCKGyP4uCLfZ+qGgDNRPkXTBtKRu2Dzr9p+0E8nE8TAyjWySeba2zlP2fwDk7yxx2
	KYrbDn4esDCdakE0Ct4ow0LyU6Wx/hQMp4/5tUk0AQgVjVe0MGEiUVDZQypZi0csJNCh
	TxXHZwffXoQZDlaSMUtUUhOcHrPICFKFg14Ny1n3tOAGYapdxu/nenqsJ31v0L4KAkOl
	Wgzg==
X-Gm-Message-State: AOUpUlEwWDuBZ8GJQVMggZaT90k59ZUXb+2gNCedl0YvLxY2ushwFOsA
	xUDgp/hrL5LUUhqjNwBVEJE=
X-Received: by 2002:a62:93d4:: with SMTP id
	r81-v6mr20486890pfk.55.1533628735770; 
	Tue, 07 Aug 2018 00:58:55 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.18])
	by smtp.gmail.com with ESMTPSA id
	p64-v6sm1421808pfa.47.2018.08.07.00.58.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 Aug 2018 00:58:55 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Tue, 07 Aug 2018 17:28:49 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Date: Tue,  7 Aug 2018 17:27:57 +0930
Message-Id: <20180807075757.7242-8-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180807075757.7242-1-joel@jms.id.au>
References: <20180807075757.7242-1-joel@jms.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-arm] [PATCH 7/7] aspeed: Link SCU to the watchdog
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7FXLFTfpmkoG

The ast2500 uses the watchdog to reset the SDRAM controller. This
operation is usually performed by u-boot's memory training procedure,
and it is enabled by setting a bit in the SCU and then causing the
watchdog to expire. Therefore, we need the watchdog to be able to
acess the SCU's register space.

This does not cause a system reset, but only resets the SDRAM
controller.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/arm/aspeed_soc.c              |  2 ++
 hw/watchdog/wdt_aspeed.c         | 20 ++++++++++++++++++++
 include/hw/watchdog/wdt_aspeed.h |  1 +
 3 files changed, 23 insertions(+)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index a27233d4876b..2cbacb4430bb 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -164,6 +164,8 @@ static void aspeed_soc_init(Object *obj)
         qdev_set_parent_bus(DEVICE(&s->wdt[i]), sysbus_get_default());
         qdev_prop_set_uint32(DEVICE(&s->wdt[i]), "silicon-rev",
                                     sc->info->silicon_rev);
+        object_property_add_const_link(OBJECT(&s->wdt[i]), "scu",
+                                       OBJECT(&s->scu), &error_abort);
     }
 
     object_initialize(&s->ftgmac100, sizeof(s->ftgmac100), TYPE_FTGMAC100);
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 95f6ad186d72..f5cb30c0b584 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -43,6 +43,9 @@
 
 #define WDT_RESTART_MAGIC               0x4755
 
+#define SCU_RESET_CONTROL1              (0x04 / 4)
+#define    SCU_RESET_SDRAM              BIT(0)
+
 static bool aspeed_wdt_is_enabled(const AspeedWDTState *s)
 {
     return s->regs[WDT_CTRL] & WDT_CTRL_ENABLE;
@@ -221,6 +224,13 @@ static void aspeed_wdt_timer_expired(void *dev)
 {
     AspeedWDTState *s = ASPEED_WDT(dev);
 
+    /* Do not reset on SDRAM controller reset */
+    if (s->scu->regs[SCU_RESET_CONTROL1] & SCU_RESET_SDRAM) {
+        timer_del(s->timer);
+        s->regs[WDT_CTRL] = 0;
+        return;
+    }
+
     qemu_log_mask(CPU_LOG_RESET, "Watchdog timer expired.\n");
     watchdog_perform_action();
     timer_del(s->timer);
@@ -232,6 +242,16 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     AspeedWDTState *s = ASPEED_WDT(dev);
+    Error *err = NULL;
+    Object *obj;
+
+    obj = object_property_get_link(OBJECT(dev), "scu", &err);
+    if (!obj) {
+        error_propagate(errp, err);
+        error_prepend(errp, "required link 'scu' not found: ");
+        return;
+    }
+    s->scu = ASPEED_SCU(obj);
 
     if (!is_supported_silicon_rev(s->silicon_rev)) {
         error_setg(errp, "Unknown silicon revision: 0x%" PRIx32,
diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
index 7de3e5c224fb..cc734bd7ae7b 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -26,6 +26,7 @@ typedef struct AspeedWDTState {
     MemoryRegion iomem;
     uint32_t regs[ASPEED_WDT_REGS_MAX];
 
+    AspeedSCUState *scu;
     uint32_t pclk_freq;
     uint32_t silicon_rev;
     uint32_t ext_pulse_width_mask;
-- 
2.17.1


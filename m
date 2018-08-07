Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3920767wru;
        Tue, 7 Aug 2018 01:03:42 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfthnA/3SuTtWIzMRD8ronf30wSgwDft0LAXihHxGaAiI3deyfOfqSrGFaoxzINACpeN4ry
X-Received: by 2002:ac8:3531:: with SMTP id y46-v6mr17046458qtb.92.1533629021993;
        Tue, 07 Aug 2018 01:03:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533629021; cv=none;
        d=google.com; s=arc-20160816;
        b=TO6osIwpJi2Nbs0Vdtj9CXSqPH5jKbXzCEbqOQ/vujnLLdMzRRDfdvNeDMeCl2OWPi
         IQyleHGSpkixTk+LIIn4+tG2sxoWyuf6lWCxiNPts/ovbOMik1TaDKextD8jqfhiLvUK
         cVdJ2f24nMCMA1PLunhtj++JcIZd1EQ4QyKnvpOR1abEk/xTQenNXZl5tojSUq5j05MV
         vnWyisVuuHWBzyxomPCbwm8CMjoRDuBfqHaj0pH/vQuhS6+ri2dNb8mapcg2dy1UNqQq
         ld/RG7FLpqv3mEtHvCdZkrLQCi9fHS6aGOJSU5uY0LC0f3Lmp6UWH8dOZAf7oCXAyBsr
         Ys8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=LVUzio99dOgvDQkTMW0Kz3gBweM4FRQz7uPSMwwQ3js=;
        b=q/KeRlpxqHFV3cCSfAOKPbTr5hbY6rBTOZ41aiPsEp+vX/D2uCMaH7eckjiZs9AraA
         WxWDBBHcFynhIbXizJsCSRAhrCGtysn8Pk6PzDvOD9NbNeWxy4OBjlk7FdAC2o3gM+e3
         ArnsKZPKChTYfxmsIkNskiD4bnxfrn7XTIOZcpjseiGMEHXNf2Iy7IJWuG1k9F2HmKuf
         XPh56Z7y3i3EIkTJBf3DMfxCwEyjfbd4K1tgTdIO9ZpoIroTUhJp9qLaFVBB8pAhmjUL
         iy/5iIPA6lPm1vJK6uCj26mWH7FTEroLi+Fk2zUhD6juhwcmOxHs+m13R2rmBzLsqd4X
         xPrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CaSHPtwt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a1-v6si577752qvj.236.2018.08.07.01.03.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 01:03:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CaSHPtwt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37833 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmwxx-0006ag-FO
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 04:03:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fmwtH-0002wy-5C
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 03:58:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fmwtG-0005eE-0e
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 03:58:51 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:36318)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fmwtF-0005dP-OS; Tue, 07 Aug 2018 03:58:49 -0400
Received: by mail-pf1-x42e.google.com with SMTP id b11-v6so8178244pfo.3;
	Tue, 07 Aug 2018 00:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=LVUzio99dOgvDQkTMW0Kz3gBweM4FRQz7uPSMwwQ3js=;
	b=CaSHPtwtaGGEAp0BSGGPBJaX2m1kZzKnJcv2pUDVcX7bT5Ax/YkclkU881jmW1hwrV
	jig3Jg0DOkR5YxYiAmA8Cl3tomiBCVLhEEdM/WLIzzjcCelJ/yDGdrCylSDTP6+dSAu7
	L4bOkdm/SNfUoMzBVoAHxX6gFDsHunSSHDne4w8psO3SKuj5oaglc+rIvFeQj3veyuQw
	5722slHCV+d7oJIJQ4Wj6zk48Mlk0ZunvXGaK+1yO1prDFjUJNphETCZyLu9BtPV5DVI
	r9VLcPq5e9PAEpFT1+/ecdPBd5Y4Pe+2FLYpHQPPuoTwEzNFNstpJfFQ7dxB+uCRHCl7
	RQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=LVUzio99dOgvDQkTMW0Kz3gBweM4FRQz7uPSMwwQ3js=;
	b=AqFqOytGKLrIEHE0++sip++MLGog2BeV0woc1qLprU7qihdDPAoK2FP3vQO1fAUBiG
	I1iOET9xPYRWWoTdO5N/ZIEplLg9DjkYg7P7hGuh+TwMseNVnzIKj0JmYxMwvKOEJtyW
	MwseiZYL9Ts1Zs61xWF3Ld+64fNBDrn5SLpGWaobKLn2XKnuc1i+p3zuiL2ojNcRqgUH
	vkXvcNY85QhkK47ozwCtNMDgL+wy1j3nwIDRxBgXA7870KLx3gNlkpUkFPBgr4U/1VXd
	X3Jt6Pfdi4U5+NDH6xaFcHFBeFEJZTwgguoL/h1uMar2IrNJIP+ATb+YeAAn7D1w+vqi
	fUwA==
X-Gm-Message-State: AOUpUlE33qwocp8tXTEgHtH+NQ4oZpDVhb68suz3I+N28NmOXghAfVIh
	PmkEj3ZC06rKK4iMmJEKLHw=
X-Received: by 2002:a63:e255:: with SMTP id
	y21-v6mr17549346pgj.160.1533628728684; 
	Tue, 07 Aug 2018 00:58:48 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.18])
	by smtp.gmail.com with ESMTPSA id
	16-v6sm1550863pfo.164.2018.08.07.00.58.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 Aug 2018 00:58:47 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Tue, 07 Aug 2018 17:28:41 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Date: Tue,  7 Aug 2018 17:27:56 +0930
Message-Id: <20180807075757.7242-7-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180807075757.7242-1-joel@jms.id.au>
References: <20180807075757.7242-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42e
Subject: [Qemu-arm] [PATCH 6/7] aspeed: add a max_ram_size property to the
 memory controller
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
X-TUID: /3wFjOIZK5II

From: Cédric Le Goater <clg@kaod.org>

This will be used to construct a memory region beyond the RAM region
to let firmwares scan the address space with load/store to guess how
much RAM the SoC has.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/arm/aspeed.c               | 31 +++++++++++++++++++++++++++++++
 hw/arm/aspeed_soc.c           |  2 ++
 hw/misc/aspeed_sdmc.c         |  3 +++
 include/hw/misc/aspeed_sdmc.h |  1 +
 4 files changed, 37 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index bb9d33848d3f..e078269266bc 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -31,6 +31,7 @@ static struct arm_boot_info aspeed_board_binfo = {
 typedef struct AspeedBoardState {
     AspeedSoCState soc;
     MemoryRegion ram;
+    MemoryRegion max_ram;
 } AspeedBoardState;
 
 typedef struct AspeedBoardConfig {
@@ -127,6 +128,27 @@ static const AspeedBoardConfig aspeed_boards[] = {
     },
 };
 
+/*
+ * The max ram region is for firmwares that scan the address space
+ * with load/store to guess how much RAM the SoC has.
+ */
+static uint64_t max_ram_read(void *opaque, hwaddr offset, unsigned size)
+{
+    return 0;
+}
+
+static void max_ram_write(void *opaque, hwaddr offset, uint64_t value,
+                           unsigned size)
+{
+    /* Disacard writes */
+}
+
+static const MemoryRegionOps max_ram_ops = {
+    .read = max_ram_read,
+    .write = max_ram_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
 #define FIRMWARE_ADDR 0x0
 
 static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
@@ -187,6 +209,7 @@ static void aspeed_board_init(MachineState *machine,
     AspeedBoardState *bmc;
     AspeedSoCClass *sc;
     DriveInfo *drive0 = drive_get(IF_MTD, 0, 0);
+    ram_addr_t max_ram_size;
 
     bmc = g_new0(AspeedBoardState, 1);
     object_initialize(&bmc->soc, (sizeof(bmc->soc)), cfg->soc_name);
@@ -226,6 +249,14 @@ static void aspeed_board_init(MachineState *machine,
     object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&bmc->ram),
                                    &error_abort);
 
+    max_ram_size = object_property_get_uint(OBJECT(&bmc->soc), "max-ram-size",
+                                            &error_abort);
+    memory_region_init_io(&bmc->max_ram, NULL, &max_ram_ops, NULL,
+                          "max_ram", max_ram_size  - ram_size);
+    memory_region_add_subregion(get_system_memory(),
+                                sc->info->sdram_base + ram_size,
+                                &bmc->max_ram);
+
     aspeed_board_init_flashes(&bmc->soc.fmc, cfg->fmc_model, &error_abort);
     aspeed_board_init_flashes(&bmc->soc.spi[0], cfg->spi_model, &error_abort);
 
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index e68911af0f90..a27233d4876b 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -155,6 +155,8 @@ static void aspeed_soc_init(Object *obj)
                          sc->info->silicon_rev);
     object_property_add_alias(obj, "ram-size", OBJECT(&s->sdmc),
                               "ram-size", &error_abort);
+    object_property_add_alias(obj, "max-ram-size", OBJECT(&s->sdmc),
+                              "max-ram-size", &error_abort);
 
     for (i = 0; i < sc->info->wdts_num; i++) {
         object_initialize(&s->wdt[i], sizeof(s->wdt[i]), TYPE_ASPEED_WDT);
diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 89de3138aff0..eec77f243508 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -242,12 +242,14 @@ static void aspeed_sdmc_realize(DeviceState *dev, Error **errp)
     case AST2400_A0_SILICON_REV:
     case AST2400_A1_SILICON_REV:
         s->ram_bits = ast2400_rambits(s);
+        s->max_ram_size = 512 << 20;
         s->fixed_conf = ASPEED_SDMC_VGA_COMPAT |
             ASPEED_SDMC_DRAM_SIZE(s->ram_bits);
         break;
     case AST2500_A0_SILICON_REV:
     case AST2500_A1_SILICON_REV:
         s->ram_bits = ast2500_rambits(s);
+        s->max_ram_size = 1024 << 20;
         s->fixed_conf = ASPEED_SDMC_HW_VERSION(1) |
             ASPEED_SDMC_VGA_APERTURE(ASPEED_SDMC_VGA_64MB) |
             ASPEED_SDMC_CACHE_INITIAL_DONE |
@@ -275,6 +277,7 @@ static const VMStateDescription vmstate_aspeed_sdmc = {
 static Property aspeed_sdmc_properties[] = {
     DEFINE_PROP_UINT32("silicon-rev", AspeedSDMCState, silicon_rev, 0),
     DEFINE_PROP_UINT64("ram-size", AspeedSDMCState, ram_size, 0),
+    DEFINE_PROP_UINT64("max-ram-size", AspeedSDMCState, max_ram_size, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/misc/aspeed_sdmc.h b/include/hw/misc/aspeed_sdmc.h
index e079c66a7d73..b3c926acae90 100644
--- a/include/hw/misc/aspeed_sdmc.h
+++ b/include/hw/misc/aspeed_sdmc.h
@@ -27,6 +27,7 @@ typedef struct AspeedSDMCState {
     uint32_t silicon_rev;
     uint32_t ram_bits;
     uint64_t ram_size;
+    uint64_t max_ram_size;
     uint32_t fixed_conf;
 
 } AspeedSDMCState;
-- 
2.17.1


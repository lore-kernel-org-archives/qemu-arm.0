Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp957170wrp;
        Thu, 14 Feb 2019 05:08:28 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYg/UvV7LppWx6OFul3VoOMtRKsOqfma8CbYNfF++74HUfpeihaNS8hg0RVipCH2fd0Ub5K
X-Received: by 2002:a81:8741:: with SMTP id x62mr2925891ywf.406.1550149707947;
        Thu, 14 Feb 2019 05:08:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550149707; cv=none;
        d=google.com; s=arc-20160816;
        b=s/UhCDFsUkHOYK0u0pcdCE6PGEkwQE7I/v8QEvGc9zd+ZuQE8IMM8y2RxmKRCyJRqe
         Ke6XwIeBMdTcN65XABrhupwikzTNRcw15qyl35AI7aIwk8/Ioj8cMBlGCaCVBFJN2eFH
         lsmg7KsD9PzBWQEVh61KDtWqAQy2F908JLkHT0o9z7L2Hpljn5CWyO3nUbsOZ+UtfHdg
         68UhFF3KnEQbvZeQfByMTgutc/bjqFTwe/hpMTb0XO74yogHfmDkXtdxroaRet0VPEvs
         ptd8RT0OAB1mU9gOEBmWrBzSXW3Nvr/ahslNXVU5ZydZu/5lujH04o3jXE+huCIeCmCm
         GsYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=wx+BYpvHTW57CyXGJ3HudXtRv2dk+GGAZ3zOw47Rw9I=;
        b=rmlbRksirAm9WuvsiuYuaXuGBJisft816Uo11QSY7yWJEVMGMtSx6KGBKv0cWgu+s6
         GDjeQ4WohSGrl2bD1nAwPth5LdqWS3G/rvk1uMlVyAQeeNTN/1Y1/vqSp0ggWpp3XyRR
         p1Ey2U3folsa6m63qFCGMSt50YkdXn557SArKy/+yq2K2POYhOB7YC8ySzcxkbIFwtqb
         Ue5p3FblJ9++03aNGpUSeokeYa2RZVaPyqzdfQ/RV2PqBT12sgugGU+U6ZKMAQREZjs1
         e1Zx5kA3lXpMQYQmPQEGTbPkPxIZFSuQOkevMeyImmyQeEvJMrJGDyew30JgD7vHFQNi
         aS2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M3l+fQYo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l189si468709ywg.418.2019.02.14.05.08.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 05:08:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M3l+fQYo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48318 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guGkd-0007Xq-9I
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 08:08:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49748)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGeQ-0002vd-JI
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 08:02:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGUW-0006yg-If
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 07:51:54 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:46427)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guGUR-0006fa-HX
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 07:51:46 -0500
Received: by mail-wr1-x443.google.com with SMTP id l9so6308990wrt.13
	for <qemu-devel@nongnu.org>; Thu, 14 Feb 2019 04:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wx+BYpvHTW57CyXGJ3HudXtRv2dk+GGAZ3zOw47Rw9I=;
	b=M3l+fQYoOO5SzX3Fyu4sAkXuBkZf3FzJ5ASsuxfv++NmA7lBb67Xw4QoQqCNoyKrg2
	EKh0fH1DjggwXP3ta4ana7uma2grGjQ1Os/KSASPZl7zLB9yxAUJlxfIVieK/E/0hxA3
	04CrYdWTGsIcmB48ub+/4ksgUwklyBf72RRRiJXZAc44vVSkOw1tbb9Iy3Rm6/ddDWUW
	b9Aq6he96L9I60IcLvQXl6bjqjhl/3ismN6AL4et6AzvZfI3SNU5biot1d3a1E+GHj8C
	/PQ5BRsPOIadpeAEltWgQRVI1j3xwW6asVuQpYBqFr47A/4fd+Qkf4qtx73D+KgxUNlR
	NKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wx+BYpvHTW57CyXGJ3HudXtRv2dk+GGAZ3zOw47Rw9I=;
	b=q1xurBhLGIukgMkM5kpbWRjwkucH+/tIyXMVwl6wS3g52P/RMfXM36zvODvCFV61yG
	b/ghQABBBdk6ZKurJYh5/xShSsQqDuEpZKjbRR6FMnICTO8ewMdk+oVbSjCZ09m18khR
	vOYnU4emPzAZkl9SMM3mda+JTk26iqEfSyR96hanwKYF736JUn2dBXu9xZ8fjgVdLvJZ
	oGEhltMWsaTBD7ps2llmlIRlMYaitVM/VrQqSuRONCQARGeqi8aHYCSMCdNuPtFE9cvP
	g6wDh+gKYD2qOTVVGX5nff/nlT3Ykn3L2uH0sJRgfMNYJQo0TJWN6LxtwOpUJcMPmask
	Lspg==
X-Gm-Message-State: AHQUAuZQjOXZvzHx9d1eaRBF0oCezHkyX3nldQkBS8WI6lnVZYy3/JXT
	JvqXY2UvZhl761AY57AJEUDyI4CmWDHASw==
X-Received: by 2002:adf:f388:: with SMTP id m8mr2923482wro.133.1550148682278; 
	Thu, 14 Feb 2019 04:51:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id j3sm1488073wmb.39.2019.02.14.04.51.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Feb 2019 04:51:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 14 Feb 2019 12:51:04 +0000
Message-Id: <20190214125107.22178-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214125107.22178-1-peter.maydell@linaro.org>
References: <20190214125107.22178-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PATCH 11/14] hw/arm/musca: Add PPCs
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N4aEOBs0Irmx

Many of the devices on the Musca board live behind TrustZone
Peripheral Protection Controllers (PPCs); add models of the
PPCs, using a similar scheme to the MPS2 board models.
This commit wires up the PPCs with "unimplemented device"
stubs behind them in the correct places in the address map.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/musca.c | 289 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 289 insertions(+)

diff --git a/hw/arm/musca.c b/hw/arm/musca.c
index cc624c7d160..8774e0b87b7 100644
--- a/hw/arm/musca.c
+++ b/hw/arm/musca.c
@@ -27,8 +27,11 @@
 #include "hw/arm/armsse.h"
 #include "hw/boards.h"
 #include "hw/core/split-irq.h"
+#include "hw/misc/tz-ppc.h"
+#include "hw/misc/unimp.h"
 
 #define MUSCA_NUMIRQ_MAX 96
+#define MUSCA_PPC_MAX 3
 
 typedef enum MuscaType {
     MUSCA_A,
@@ -48,6 +51,24 @@ typedef struct {
 
     ARMSSE sse;
     SplitIRQ cpu_irq_splitter[MUSCA_NUMIRQ_MAX];
+    SplitIRQ sec_resp_splitter;
+    TZPPC ppc[MUSCA_PPC_MAX];
+    MemoryRegion container;
+    UnimplementedDeviceState eflash[2];
+    UnimplementedDeviceState qspi;
+    UnimplementedDeviceState mpc[5];
+    UnimplementedDeviceState mhu[2];
+    UnimplementedDeviceState pwm[3];
+    UnimplementedDeviceState i2s;
+    UnimplementedDeviceState uart[2];
+    UnimplementedDeviceState i2c[2];
+    UnimplementedDeviceState spi;
+    UnimplementedDeviceState scc;
+    UnimplementedDeviceState timer;
+    UnimplementedDeviceState rtc;
+    UnimplementedDeviceState pvt;
+    UnimplementedDeviceState sdio;
+    UnimplementedDeviceState gpio;
 } MuscaMachineState;
 
 #define TYPE_MUSCA_MACHINE "musca"
@@ -68,6 +89,94 @@ typedef struct {
  */
 #define SYSCLK_FRQ 40000000
 
+/*
+ * Most of the devices in the Musca board sit behind Peripheral Protection
+ * Controllers. These data structures define the layout of which devices
+ * sit behind which PPCs.
+ * The devfn for each port is a function which creates, configures
+ * and initializes the device, returning the MemoryRegion which
+ * needs to be plugged into the downstream end of the PPC port.
+ */
+typedef MemoryRegion *MakeDevFn(MuscaMachineState *mms, void *opaque,
+                                const char *name, hwaddr size);
+
+typedef struct PPCPortInfo {
+    const char *name;
+    MakeDevFn *devfn;
+    void *opaque;
+    hwaddr addr;
+    hwaddr size;
+} PPCPortInfo;
+
+typedef struct PPCInfo {
+    const char *name;
+    PPCPortInfo ports[TZ_NUM_PORTS];
+} PPCInfo;
+
+static MemoryRegion *make_unimp_dev(MuscaMachineState *mms,
+                                    void *opaque, const char *name, hwaddr size)
+{
+    /*
+     * Initialize, configure and realize a TYPE_UNIMPLEMENTED_DEVICE,
+     * and return a pointer to its MemoryRegion.
+     */
+    UnimplementedDeviceState *uds = opaque;
+
+    sysbus_init_child_obj(OBJECT(mms), name, uds,
+                          sizeof(UnimplementedDeviceState),
+                          TYPE_UNIMPLEMENTED_DEVICE);
+    qdev_prop_set_string(DEVICE(uds), "name", name);
+    qdev_prop_set_uint64(DEVICE(uds), "size", size);
+    object_property_set_bool(OBJECT(uds), true, "realized", &error_fatal);
+    return sysbus_mmio_get_region(SYS_BUS_DEVICE(uds), 0);
+}
+
+static MemoryRegion *make_musca_a_devs(MuscaMachineState *mms, void *opaque,
+                                       const char *name, hwaddr size)
+{
+    /*
+     * Create the container MemoryRegion for all the devices that live
+     * behind the Musca-A PPC's single port. These devices don't have a PPC
+     * port each, but we use the PPCPortInfo struct as a convenient way
+     * to describe them. Note that addresses here are relative to the base
+     * address of the PPC port region: 0x40100000, and devices appear both
+     * at the 0x4... NS region and the 0x5... S region.
+     */
+    int i;
+    MemoryRegion *container = &mms->container;
+
+    const PPCPortInfo devices[] = {
+        { "uart0", make_unimp_dev, &mms->uart[0], 0x1000, 0x1000 },
+        { "uart1", make_unimp_dev, &mms->uart[1], 0x2000, 0x1000 },
+        { "spi", make_unimp_dev, &mms->spi, 0x3000, 0x1000 },
+        { "i2c0", make_unimp_dev, &mms->i2c[0], 0x4000, 0x1000 },
+        { "i2c1", make_unimp_dev, &mms->i2c[1], 0x5000, 0x1000 },
+        { "i2s", make_unimp_dev, &mms->i2s, 0x6000, 0x1000 },
+        { "pwm0", make_unimp_dev, &mms->pwm[0], 0x7000, 0x1000 },
+        { "rtc", make_unimp_dev, &mms->rtc, 0x8000, 0x1000 },
+        { "qspi", make_unimp_dev, &mms->qspi, 0xa000, 0x1000 },
+        { "timer", make_unimp_dev, &mms->timer, 0xb000, 0x1000 },
+        { "scc", make_unimp_dev, &mms->scc, 0xc000, 0x1000 },
+        { "pwm1", make_unimp_dev, &mms->pwm[1], 0xe000, 0x1000 },
+        { "pwm2", make_unimp_dev, &mms->pwm[2], 0xf000, 0x1000 },
+        { "gpio", make_unimp_dev, &mms->gpio, 0x10000, 0x1000 },
+        { "mpc0", make_unimp_dev, &mms->mpc[0], 0x12000, 0x1000 },
+        { "mpc1", make_unimp_dev, &mms->mpc[1], 0x13000, 0x1000 },
+    };
+
+    memory_region_init(container, OBJECT(mms), "musca-device-container", size);
+
+    for (i = 0; i < ARRAY_SIZE(devices); i++) {
+        const PPCPortInfo *pinfo = &devices[i];
+        MemoryRegion *mr;
+
+        mr = pinfo->devfn(mms, pinfo->opaque, pinfo->name, pinfo->size);
+        memory_region_add_subregion(container, pinfo->addr, mr);
+    }
+
+    return &mms->container;
+}
+
 static void musca_init(MachineState *machine)
 {
     MuscaMachineState *mms = MUSCA_MACHINE(machine);
@@ -75,6 +184,9 @@ static void musca_init(MachineState *machine)
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     MemoryRegion *system_memory = get_system_memory();
     DeviceState *ssedev;
+    DeviceState *dev_splitter;
+    const PPCInfo *ppcs;
+    int num_ppcs;
     int i;
 
     assert(mmc->num_irqs <= MUSCA_NUMIRQ_MAX);
@@ -121,6 +233,183 @@ static void musca_init(MachineState *machine)
                                                      "EXP_CPU1_IRQ", i));
     }
 
+    /*
+     * The sec_resp_cfg output from the SSE-200 must be split into multiple
+     * lines, one for each of the PPCs we create here.
+     */
+    object_initialize(&mms->sec_resp_splitter, sizeof(mms->sec_resp_splitter),
+                      TYPE_SPLIT_IRQ);
+    object_property_add_child(OBJECT(machine), "sec-resp-splitter",
+                              OBJECT(&mms->sec_resp_splitter), &error_fatal);
+    object_property_set_int(OBJECT(&mms->sec_resp_splitter),
+                            ARRAY_SIZE(mms->ppc), "num-lines", &error_fatal);
+    object_property_set_bool(OBJECT(&mms->sec_resp_splitter), true,
+                             "realized", &error_fatal);
+    dev_splitter = DEVICE(&mms->sec_resp_splitter);
+    qdev_connect_gpio_out_named(ssedev, "sec_resp_cfg", 0,
+                                qdev_get_gpio_in(dev_splitter, 0));
+
+    /*
+     * Most of the devices in the board are behind Peripheral Protection
+     * Controllers. The required order for initializing things is:
+     *  + initialize the PPC
+     *  + initialize, configure and realize downstream devices
+     *  + connect downstream device MemoryRegions to the PPC
+     *  + realize the PPC
+     *  + map the PPC's MemoryRegions to the places in the address map
+     *    where the downstream devices should appear
+     *  + wire up the PPC's control lines to the SSE object
+     *
+     * The PPC mapping differs for the -A and -B1 variants; the -A version
+     * is much simpler, using only a single port of a single PPC and putting
+     * all the devices behind that.
+     */
+    const PPCInfo a_ppcs[] = { {
+            .name = "ahb_ppcexp0",
+            .ports = {
+                { "musca-devices", make_musca_a_devs, 0, 0x40100000, 0x100000 },
+            },
+        },
+    };
+
+    /*
+     * Devices listed with an 0x4.. address appear in both the NS 0x4.. region
+     * and the 0x5.. S region. Devices listed with an 0x5.. address appear
+     * only in the S region.
+     */
+    const PPCInfo b1_ppcs[] = { {
+            .name = "apb_ppcexp0",
+            .ports = {
+                { "eflash0", make_unimp_dev, &mms->eflash[0],
+                  0x52400000, 0x1000 },
+                { "eflash1", make_unimp_dev, &mms->eflash[1],
+                  0x52500000, 0x1000 },
+                { "qspi", make_unimp_dev, &mms->qspi, 0x42800000, 0x100000 },
+                { "mpc0", make_unimp_dev, &mms->mpc[0], 0x52000000, 0x1000 },
+                { "mpc1", make_unimp_dev, &mms->mpc[1], 0x52100000, 0x1000 },
+                { "mpc2", make_unimp_dev, &mms->mpc[2], 0x52200000, 0x1000 },
+                { "mpc3", make_unimp_dev, &mms->mpc[3], 0x52300000, 0x1000 },
+                { "mhu0", make_unimp_dev, &mms->mhu[0], 0x42600000, 0x100000 },
+                { "mhu1", make_unimp_dev, &mms->mhu[1], 0x42700000, 0x100000 },
+                { }, /* port 9: unused */
+                { }, /* port 10: unused */
+                { }, /* port 11: unused */
+                { }, /* port 12: unused */
+                { }, /* port 13: unused */
+                { "mpc4", make_unimp_dev, &mms->mpc[4], 0x52e00000, 0x1000 },
+            },
+        }, {
+            .name = "apb_ppcexp1",
+            .ports = {
+                { "pwm0", make_unimp_dev, &mms->pwm[0], 0x40101000, 0x1000 },
+                { "pwm1", make_unimp_dev, &mms->pwm[1], 0x40102000, 0x1000 },
+                { "pwm2", make_unimp_dev, &mms->pwm[2], 0x40103000, 0x1000 },
+                { "i2s", make_unimp_dev, &mms->i2s, 0x40104000, 0x1000 },
+                { "uart0", make_unimp_dev, &mms->uart[0], 0x40105000, 0x1000 },
+                { "uart1", make_unimp_dev, &mms->uart[1], 0x40106000, 0x1000 },
+                { "i2c0", make_unimp_dev, &mms->i2c[0], 0x40108000, 0x1000 },
+                { "i2c1", make_unimp_dev, &mms->i2c[1], 0x40109000, 0x1000 },
+                { "spi", make_unimp_dev, &mms->spi, 0x4010a000, 0x1000 },
+                { "scc", make_unimp_dev, &mms->scc, 0x5010b000, 0x1000 },
+                { "timer", make_unimp_dev, &mms->timer, 0x4010c000, 0x1000 },
+                { "rtc", make_unimp_dev, &mms->rtc, 0x4010d000, 0x1000 },
+                { "pvt", make_unimp_dev, &mms->pvt, 0x4010e000, 0x1000 },
+                { "sdio", make_unimp_dev, &mms->sdio, 0x4010f000, 0x1000 },
+            },
+        }, {
+            .name = "ahb_ppcexp0",
+            .ports = {
+                { }, /* port 0: unused */
+                { "gpio", make_unimp_dev, &mms->gpio, 0x41000000, 0x1000 },
+            },
+        },
+    };
+
+    switch (mmc->type) {
+    case MUSCA_A:
+        ppcs = a_ppcs;
+        num_ppcs = ARRAY_SIZE(a_ppcs);
+        break;
+    case MUSCA_B1:
+        ppcs = b1_ppcs;
+        num_ppcs = ARRAY_SIZE(b1_ppcs);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    assert(num_ppcs <= MUSCA_PPC_MAX);
+
+    for (i = 0; i < num_ppcs; i++) {
+        const PPCInfo *ppcinfo = &ppcs[i];
+        TZPPC *ppc = &mms->ppc[i];
+        DeviceState *ppcdev;
+        int port;
+        char *gpioname;
+
+        sysbus_init_child_obj(OBJECT(machine), ppcinfo->name, ppc,
+                              sizeof(TZPPC), TYPE_TZ_PPC);
+        ppcdev = DEVICE(ppc);
+
+        for (port = 0; port < TZ_NUM_PORTS; port++) {
+            const PPCPortInfo *pinfo = &ppcinfo->ports[port];
+            MemoryRegion *mr;
+            char *portname;
+
+            if (!pinfo->devfn) {
+                continue;
+            }
+
+            mr = pinfo->devfn(mms, pinfo->opaque, pinfo->name, pinfo->size);
+            portname = g_strdup_printf("port[%d]", port);
+            object_property_set_link(OBJECT(ppc), OBJECT(mr),
+                                     portname, &error_fatal);
+            g_free(portname);
+        }
+
+        object_property_set_bool(OBJECT(ppc), true, "realized", &error_fatal);
+
+        for (port = 0; port < TZ_NUM_PORTS; port++) {
+            const PPCPortInfo *pinfo = &ppcinfo->ports[port];
+
+            if (!pinfo->devfn) {
+                continue;
+            }
+            sysbus_mmio_map(SYS_BUS_DEVICE(ppc), port, pinfo->addr);
+
+            gpioname = g_strdup_printf("%s_nonsec", ppcinfo->name);
+            qdev_connect_gpio_out_named(ssedev, gpioname, port,
+                                        qdev_get_gpio_in_named(ppcdev,
+                                                               "cfg_nonsec",
+                                                               port));
+            g_free(gpioname);
+            gpioname = g_strdup_printf("%s_ap", ppcinfo->name);
+            qdev_connect_gpio_out_named(ssedev, gpioname, port,
+                                        qdev_get_gpio_in_named(ppcdev,
+                                                               "cfg_ap", port));
+            g_free(gpioname);
+        }
+
+        gpioname = g_strdup_printf("%s_irq_enable", ppcinfo->name);
+        qdev_connect_gpio_out_named(ssedev, gpioname, 0,
+                                    qdev_get_gpio_in_named(ppcdev,
+                                                           "irq_enable", 0));
+        g_free(gpioname);
+        gpioname = g_strdup_printf("%s_irq_clear", ppcinfo->name);
+        qdev_connect_gpio_out_named(ssedev, gpioname, 0,
+                                    qdev_get_gpio_in_named(ppcdev,
+                                                           "irq_clear", 0));
+        g_free(gpioname);
+        gpioname = g_strdup_printf("%s_irq_status", ppcinfo->name);
+        qdev_connect_gpio_out_named(ppcdev, "irq", 0,
+                                    qdev_get_gpio_in_named(ssedev,
+                                                           gpioname, 0));
+        g_free(gpioname);
+
+        qdev_connect_gpio_out(dev_splitter, i,
+                              qdev_get_gpio_in_named(ppcdev,
+                                                     "cfg_sec_resp", 0));
+    }
+
     armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename, 0x2000000);
 }
 
-- 
2.20.1


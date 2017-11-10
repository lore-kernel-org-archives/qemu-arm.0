Received: by 10.223.150.237 with SMTP id u100csp4140112wrb;
        Fri, 10 Nov 2017 11:54:45 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZw+wpkd6nQa6mm/exrZuvxdqqCLguvnq+TpR+sR0i/e0qPo3CGlmGSxYRJGkEw7ocYl1PC
X-Received: by 10.37.43.70 with SMTP id r67mr1051027ybr.78.1510343685091;
        Fri, 10 Nov 2017 11:54:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510343685; cv=none;
        d=google.com; s=arc-20160816;
        b=CIKHHrym2gr/jFU4MwV6m/ore4xoV4SaQJkYvnGc5uBg2lxSba/f4c0X2PWL5BHW2B
         vy3ABOnvqZm5vf1InOGjd29PPbHHuWP6gqcUuOy/8MVs3JdYeRID3qXbCo0dvMrv+1b5
         9u7bY8Kv+Bpj2cljY27jGiPPauVQjwQlOwa6XcgfHOT7bKTOO/paOUvqvcMDdw4lt6h5
         X/bURdHYWg9Ohwojuuh+DyqKTdGGSxY+gA2Ei4d8Jv6JzLJPTYx+KDAVJXj5XfXcFaIQ
         o6h3BXwOrI6iHAKnQfXZbkdf4xTOAoNIIfkjwuTVebaSBsX+lb378EMKlenwQnJEU0UA
         u44g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=zKfCjUo7Reakg0/ReUwtOq0EMonXUekHXcEhKAOR7bA=;
        b=pqCEXhYUC3UsBr1L1CeLsRVXth2MGdN90ZIEYELpLK4vCBiw3dYjGCu4BnLrTiL42l
         PdfAm7uRW3njrqEzQMZ407ouYI3hUaafkhvlw7RBx+8O2va+553bsa4hoBAaaU/clGlx
         KL6nIyncXCfEv3loi7ts0x33owfP9zxriJTdOaxlmFEXsHSRkG12HiByiu9mXGghdfSI
         M/TgWT+LHH4/nJnssT8fje/QvhF7p1ewV+S3AC/kjxddPas9L/+eSr8riFNLR0rxGJQK
         ShYNoZhorQdzAfuTNBNVZ+BdrpCq2l38E0iGwJOWcmd4qlqZN0DJ50IVRqqsmbUvR5Qh
         zZ0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=zh5FHhJD;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=FLteUxxo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k63si2251280ybb.698.2017.11.10.11.54.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Nov 2017 11:54:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=zh5FHhJD;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=FLteUxxo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43247 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eDFO0-0005wy-G2
	for alex.bennee@linaro.org; Fri, 10 Nov 2017 14:54:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47279)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eDFNA-0005Lg-3z
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 14:53:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eDFN5-0006BA-Lc
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 14:53:50 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:60437)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1eDFN5-0006Ap-G7; Fri, 10 Nov 2017 14:53:47 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 131A8212A0;
	Fri, 10 Nov 2017 14:53:47 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Fri, 10 Nov 2017 14:53:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=mesmtp; bh=zKfCjUo7Reakg0
	/ReUwtOq0EMonXUekHXcEhKAOR7bA=; b=zh5FHhJD4uhvZKMdMPzU3G1kEDBq26
	QfxPAj71ZF0+n9nqAvb3XX9P4K3OUU1Vs6kEnS1wxAHlh6ufbmmRb+DbI4R1NNRT
	0uoIixaIbTnuzgWpa3zNNL7/RoowBDu3EoSMVBH/bML8Ic6YkfEi8zMMU/rVsxDR
	nD8V3Rn/zsLQU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=zKfCjUo7Reakg0/ReUwtOq0EMonXUekHXcEhKAOR7bA=; b=FLteUxxo
	/8yA6Y4gH6PRtBSmHDhStx+jitoMv6uOMQ7zojMUt6PeVfrDK1jWmbygS4GkphAa
	m/kyAe+sa9Ykp2TqgNvVAHjVox2mR5Rt+ZEe9H1dP2XXweKCPpixkksphtVqvKm7
	97XQcuNV0w8BLylNQ36BokdtfGofQSdtYS0Cqx8NCK5wtqMYcFwCdUxG/OqJPQYX
	IgPgmf2FW9hoWYyma2cceP/zjrQl69hQxGcuRh2MJKPHV1l8fB/+XIgHWE+Q43nO
	Tl9BggZrcrDizWR8t6z0cWRV3fqw1rjIw4QT5L4Y/mr5a5G896miq6G3HL/jrbnQ
	HbgQZE16cys8xg==
X-ME-Sender: <xms:ywMGWqBv_T8stGW6OdXMKcmjnUDQYClwM0qoov6Pn4xYKB1O9fMHmw>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id C438A7E6B8;
	Fri, 10 Nov 2017 14:53:46 -0500 (EST)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Fri, 10 Nov 2017 14:53:43 -0500
Message-Id: <1510343626-25861-3-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510343626-25861-1-git-send-email-cota@braap.org>
References: <1510343626-25861-1-git-send-email-cota@braap.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.28
Subject: [Qemu-arm] [PATCH for 2.11 2/5] xlnx-zynqmp: Properly support the
 smp command line option
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wMVgw7guvRZ2

From: Alistair Francis <alistair.francis@xilinx.com>

Allow the -smp command line option to control the number of CPUs we
create.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Emilio G. Cota <cota@braap.org>
Tested-by: Emilio G. Cota <cota@braap.org>
---
 hw/arm/xlnx-zcu102.c |  3 ++-
 hw/arm/xlnx-zynqmp.c | 26 ++++++++++++++++----------
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index e2d15a1..7ec03da 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -235,7 +235,8 @@ static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->desc = "Xilinx ZynqMP ZCU102 board";
+    mc->desc = "Xilinx ZynqMP ZCU102 board with 4xA53s and 2xR5s based on " \
+               "the value of smp";
     mc->init = xlnx_zcu102_init;
     mc->block_default_type = IF_IDE;
     mc->units_per_default_bus = 1;
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index d4b6560..c707c66 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -98,8 +98,9 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
 {
     Error *err = NULL;
     int i;
+    int num_rpus = MIN(smp_cpus - XLNX_ZYNQMP_NUM_APU_CPUS, XLNX_ZYNQMP_NUM_RPU_CPUS);
 
-    for (i = 0; i < XLNX_ZYNQMP_NUM_RPU_CPUS; i++) {
+    for (i = 0; i < num_rpus; i++) {
         char *name;
 
         object_initialize(&s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
@@ -132,8 +133,9 @@ static void xlnx_zynqmp_init(Object *obj)
 {
     XlnxZynqMPState *s = XLNX_ZYNQMP(obj);
     int i;
+    int num_apus = MIN(smp_cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
 
-    for (i = 0; i < XLNX_ZYNQMP_NUM_APU_CPUS; i++) {
+    for (i = 0; i < num_apus; i++) {
         object_initialize(&s->apu_cpu[i], sizeof(s->apu_cpu[i]),
                           "cortex-a53-" TYPE_ARM_CPU);
         object_property_add_child(obj, "apu-cpu[*]", OBJECT(&s->apu_cpu[i]),
@@ -182,6 +184,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     MemoryRegion *system_memory = get_system_memory();
     uint8_t i;
     uint64_t ram_size;
+    int num_apus = MIN(smp_cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
     const char *boot_cpu = s->boot_cpu ? s->boot_cpu : "apu-cpu[0]";
     ram_addr_t ddr_low_size, ddr_high_size;
     qemu_irq gic_spi[GIC_NUM_SPI_INTR];
@@ -233,10 +236,10 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
     qdev_prop_set_uint32(DEVICE(&s->gic), "num-irq", GIC_NUM_SPI_INTR + 32);
     qdev_prop_set_uint32(DEVICE(&s->gic), "revision", 2);
-    qdev_prop_set_uint32(DEVICE(&s->gic), "num-cpu", XLNX_ZYNQMP_NUM_APU_CPUS);
+    qdev_prop_set_uint32(DEVICE(&s->gic), "num-cpu", num_apus);
 
     /* Realize APUs before realizing the GIC. KVM requires this.  */
-    for (i = 0; i < XLNX_ZYNQMP_NUM_APU_CPUS; i++) {
+    for (i = 0; i < num_apus; i++) {
         char *name;
 
         object_property_set_int(OBJECT(&s->apu_cpu[i]), QEMU_PSCI_CONDUIT_SMC,
@@ -292,7 +295,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    for (i = 0; i < XLNX_ZYNQMP_NUM_APU_CPUS; i++) {
+    for (i = 0; i < num_apus; i++) {
         qemu_irq irq;
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i,
@@ -307,11 +310,14 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     }
 
     if (s->has_rpu) {
-        xlnx_zynqmp_create_rpu(s, boot_cpu, &err);
-        if (err) {
-            error_propagate(errp, err);
-            return;
-        }
+        info_report("The 'has_rpu' property is no longer required, to use the "
+                    "RPUs just use -smp 6.");
+    }
+
+    xlnx_zynqmp_create_rpu(s, boot_cpu, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
     }
 
     if (!s->boot_cpu_ptr) {
-- 
2.7.4


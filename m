Received: by 10.223.150.237 with SMTP id u100csp2448999wrb;
        Mon, 13 Nov 2017 05:29:07 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaz+EVdzCw2LskALO6TrJz09uYOQnE+XYpSYjhbKC1Gq8sBcFF+P+LJskC6KulDHzPx43y2
X-Received: by 10.129.182.92 with SMTP id h28mr4239771ywk.402.1510579747088;
        Mon, 13 Nov 2017 05:29:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510579747; cv=none;
        d=google.com; s=arc-20160816;
        b=r4Sl+7osZiBMyo6ETJdXQmmlE9xbOiLKj+GRftPunEBaNkrTlOoD18AInUjCgFGE80
         6T6aW5KkV5W5botUciGtcEGkXnUXDFpOy/V/mjHxuCMpJxP0vJvP0PZQ+3vwMFGZ36Bw
         fwWNO/DyqFdtp5NrQDENWPWyMtWiV76JWTpnp0/v0QoEXgpDOcNZO7fUIelCouuHmtvc
         5CVmi7I9Rw58yDzKJ/pfJSaCPg1s3BKD1GwVQwSA8W6aDksjRMP84XRCZJRCBcUXiMsw
         UKWL5pXZ63/l40sM/e86BbxKUjV+72H7WQPMlxLSYcnfDpshytVUA/QoYjqS7sm+zBFI
         cw7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=9fX1SLjVvUdQJw/fQCbFmQUHXDAbwO3bVianCvY/EnQ=;
        b=VhZmjnTXx4FZ+SH/iiqRN8rKdHKiNwJ42WKQEF1No+0hrunM5UK7UJkY6YGwr7ZyzD
         8oLh1Z1ApJGIm668kIFgp5JK8M0wYVDLMZfjiZ9c9LpDgcyLTCzvSa81svck59q3KcK7
         qPV5+7s3vW3/f0QRqpfQIwDg0LgY/Kp0jgpEyyxG1SX64JbwEsywcpiNaBcPXQRGISPM
         3RUvOGr3CDQRiAwVYrH7taGiw7bSzybUzq6+wsQrJ/VtrIl4/QxT9r5eA9uyBTGiPK+Q
         943AlIvJI9G9CJrp3Bwpq0USg0H9l7ijE4/bEMKS5w6to3cX7hGpjb3qvL2+6ngkRrpO
         wrHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ST8HDhbR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p65si3823001ywh.193.2017.11.13.05.29.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Nov 2017 05:29:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ST8HDhbR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54429 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eEEnS-0003Io-GO
	for alex.bennee@linaro.org; Mon, 13 Nov 2017 08:29:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1eEEnH-0003Gw-6m
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 08:28:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1eEEnB-000196-49
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 08:28:55 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:54758)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1eEEnA-00017D-Rs; Mon, 13 Nov 2017 08:28:49 -0500
Received: by mail-pg0-x242.google.com with SMTP id c123so4640552pga.11;
	Mon, 13 Nov 2017 05:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=9fX1SLjVvUdQJw/fQCbFmQUHXDAbwO3bVianCvY/EnQ=;
	b=ST8HDhbRUpya6msOv3JQ9sMWSa8PHdw6bxCeMVbHLIaZB6Mx368ohbkpMt7jt3TrjQ
	hrc7XYn6mFb986Qi06slykZO+IHOqcpx45spnPHi9ipcFCDflF2Gu2wGoM+FRMSRRCqf
	GEycs3c5VlcB1GkAd6M8TP80c/taacZIOnutjdHdvxJRFLu5yAPsg+GXSYQpjQpcchR/
	maR4XWhS+J761vYxFdobKvxkXqg1tih4bjdaz0cyxasPTvjGi1XyUe8RHmuHimAShfYz
	6m0fpkM1Tnka5GWWQl+vtLck2yG8upMb0BWenkJDxjQB8PCAxyLsu/xYX/B5urZo6Tfr
	a+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=9fX1SLjVvUdQJw/fQCbFmQUHXDAbwO3bVianCvY/EnQ=;
	b=tNxMJtBQIq+/KtEORUArKH1tfZ4o6jCoUPqeyKksPoSAwda9bpHpbSVEvya7sxiTc/
	Hqi6vND4fwAlEam5io+kGcNLxYH3vUeGNkp8s23R8l7dAZLlidcvryt2KzxzXzHq8Ccf
	DMB1Yst/pYJyoGewf9VW8/sP7gAX1gaGPUsen2NoHvq6YISfzvJTrzIBnOlRuT4C5raQ
	l0bUVUZM64HKxvMW+t3HMciGNeI6ykEWSZp7ltEZP5ncPj+5vU+BCDaTk51h6HHvm24T
	6Cw1jcmaUacSK3b5jW//qkC/BLGZ9abA7KQIL2rOqqYPBXhx2jUaI2FeDcTAgMjKv1jF
	8zmA==
X-Gm-Message-State: AJaThX4EXddq8fWCqnYBxMc+UYZY0wL59LhaO1CBUAJxb4px7vrjkEvC
	lUA2GtZ68xgKtMYz6q7zi1U=
X-Received: by 10.84.248.77 with SMTP id e13mr9117827pln.200.1510579727421;
	Mon, 13 Nov 2017 05:28:47 -0800 (PST)
Received: from aurora.jms.id.au ([45.124.203.19])
	by smtp.gmail.com with ESMTPSA id y5sm32541032pfk.3.2017.11.13.05.28.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 Nov 2017 05:28:45 -0800 (PST)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Mon, 13 Nov 2017 23:58:38 +1030
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Nov 2017 23:58:01 +1030
Message-Id: <20171113132801.8562-1-joel@jms.id.au>
X-Mailer: git-send-email 2.14.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-arm] [PATCH v2] hw/arm/aspeed: Unlock SCU when running kernel
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
	qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qWoODOh+rYko

The ASPEED hardware contains a lock register for the SCU that disables
any writes to the SCU when it is locked. The machine comes up with the
lock enabled, but on all known hardware u-boot will unlock it and leave
it unlocked when loading the kernel.

This means the kernel expects the SCU to be unlocked. When booting from
an emulated ROM the normal u-boot unlock path is executed. Things don't
go well when booting using the -kernel command line, as u-boot does not
run first.

Change behaviour so that when a kernel is passed to the machine, set the
reset value of the SCU to be unlocked.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 - use the correct value for the key
 - rename it ASPEED_SCU_PROT_KEY
---
 hw/arm/aspeed.c              | 10 ++++++++++
 hw/arm/aspeed_soc.c          |  2 ++
 hw/misc/aspeed_scu.c         |  5 +++--
 include/hw/misc/aspeed_scu.h |  3 +++
 4 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index ab895ad490af..754df8403273 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -36,6 +36,7 @@ typedef struct AspeedBoardState {
 typedef struct AspeedBoardConfig {
     const char *soc_name;
     uint32_t hw_strap1;
+    uint32_t hw_prot_key;
     const char *fmc_model;
     const char *spi_model;
     uint32_t num_cs;
@@ -186,6 +187,15 @@ static void aspeed_board_init(MachineState *machine,
                             &error_abort);
     object_property_set_int(OBJECT(&bmc->soc), cfg->num_cs, "num-cs",
                             &error_abort);
+    if (machine->kernel_filename) {
+        /*
+         * When booting with a -kernel command line there is no u-boot
+         * that runs to unlock the SCU. In this case set the default to
+         * be unlocked as the kernel expects
+         */
+        object_property_set_int(OBJECT(&bmc->soc), ASPEED_SCU_PROT_KEY,
+                                "hw-prot-key", &error_abort);
+    }
     object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
                              &error_abort);
 
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 5aa3d2ddd9cd..c83b7e207b86 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -154,6 +154,8 @@ static void aspeed_soc_init(Object *obj)
                               "hw-strap1", &error_abort);
     object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu),
                               "hw-strap2", &error_abort);
+    object_property_add_alias(obj, "hw-prot-key", OBJECT(&s->scu),
+                              "hw-prot-key", &error_abort);
 
     object_initialize(&s->fmc, sizeof(s->fmc), sc->info->fmc_typename);
     object_property_add_child(obj, "fmc", OBJECT(&s->fmc), NULL);
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 95022d3607ad..74537ce9755d 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -85,7 +85,6 @@
 #define BMC_REV              TO_REG(0x19C)
 #define BMC_DEV_ID           TO_REG(0x1A4)
 
-#define PROT_KEY_UNLOCK 0x1688A8A8
 #define SCU_IO_REGION_SIZE 0x1000
 
 static const uint32_t ast2400_a0_resets[ASPEED_SCU_NR_REGS] = {
@@ -192,7 +191,7 @@ static void aspeed_scu_write(void *opaque, hwaddr offset, uint64_t data,
     }
 
     if (reg > PROT_KEY && reg < CPU2_BASE_SEG1 &&
-            s->regs[PROT_KEY] != PROT_KEY_UNLOCK) {
+            s->regs[PROT_KEY] != ASPEED_SCU_PROT_KEY) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: SCU is locked!\n", __func__);
         return;
     }
@@ -246,6 +245,7 @@ static void aspeed_scu_reset(DeviceState *dev)
     s->regs[SILICON_REV] = s->silicon_rev;
     s->regs[HW_STRAP1] = s->hw_strap1;
     s->regs[HW_STRAP2] = s->hw_strap2;
+    s->regs[PROT_KEY] = s->hw_prot_key;
 }
 
 static uint32_t aspeed_silicon_revs[] = {
@@ -299,6 +299,7 @@ static Property aspeed_scu_properties[] = {
     DEFINE_PROP_UINT32("silicon-rev", AspeedSCUState, silicon_rev, 0),
     DEFINE_PROP_UINT32("hw-strap1", AspeedSCUState, hw_strap1, 0),
     DEFINE_PROP_UINT32("hw-strap2", AspeedSCUState, hw_strap2, 0),
+    DEFINE_PROP_UINT32("hw-prot-key", AspeedSCUState, hw_prot_key, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index bd4ac013f997..d70cc0aeca61 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -29,6 +29,7 @@ typedef struct AspeedSCUState {
     uint32_t silicon_rev;
     uint32_t hw_strap1;
     uint32_t hw_strap2;
+    uint32_t hw_prot_key;
 } AspeedSCUState;
 
 #define AST2400_A0_SILICON_REV   0x02000303U
@@ -38,6 +39,8 @@ typedef struct AspeedSCUState {
 
 extern bool is_supported_silicon_rev(uint32_t silicon_rev);
 
+#define ASPEED_SCU_PROT_KEY      0x1688A8A8
+
 /*
  * Extracted from Aspeed SDK v00.03.21. Fixes and extra definitions
  * were added.
-- 
2.14.1


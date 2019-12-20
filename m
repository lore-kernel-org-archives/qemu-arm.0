Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3702873lff;
        Fri, 20 Dec 2019 06:47:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqxKOcIJDcBle3rZf4HKQ1dZdzP8GKnahWNbAsoGIOFp5bdRi18Ls5h1u+XbZ0enp9IsCZSa
X-Received: by 2002:a9d:24ea:: with SMTP id z97mr15856798ota.345.1576853272861;
        Fri, 20 Dec 2019 06:47:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 90si5524000oty.278.2019.12.20.06.47.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Dec 2019 06:47:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=pLxt1y8Y;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iiJZH-0008FQ-Ub
	for alex.bennee@linaro.org; Fri, 20 Dec 2019 09:47:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50225)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1iiJXy-0006fx-EN
 for qemu-arm@nongnu.org; Fri, 20 Dec 2019 09:46:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1iiJXx-00080T-6t
 for qemu-arm@nongnu.org; Fri, 20 Dec 2019 09:46:30 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:52552)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1iiJXw-0007yN-Qr; Fri, 20 Dec 2019 09:46:29 -0500
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id 94A7396EF2;
 Fri, 20 Dec 2019 14:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1576853187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SbgvYJhx6Lit3rs3j+nNkUTo6mP2ku7nAV624s9t11k=;
 b=pLxt1y8YeyRjjFOiEwU4gagAknZGqxqWTGjKTT9U+mWGN0sXPLzYwIHeDIGucqkrUrT+qd
 tATMQgU+kdBTh8aOnIKeASvvTlqhte4XIqfNk4lO3BiH1Ch49ugeQNZqg/z3TFYrq2yc4l
 TpEfot6HSwDHUQj0hnm8vP2R/m5QIJ0=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/arm/bcm2835: remove gpio/sd-bus
Date: Fri, 20 Dec 2019 15:46:14 +0100
Message-Id: <20191220144616.911466-2-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191220144616.911466-1-damien.hedde@greensocs.com>
References: <20191220144616.911466-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1576853187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SbgvYJhx6Lit3rs3j+nNkUTo6mP2ku7nAV624s9t11k=;
 b=MI6qLUDmaWiMtZ3wTmX4U+UnYBrHtvhcLZ+Zh6LmHC+M4LB6m2UPZwYqRBXRv0lnrVWsqk
 nHhdJIQc3cHFoA4M4H/cKVszyxb2K6mC9EWgDlFbJMuMyelG80EtIcDI76nG1BfmPsYla2
 ElP6436uEPVv9LCeG9VwkdH7Ahc7Slc=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1576853187; a=rsa-sha256; cv=none;
 b=MxI/C14GDculPwqELFq5jEitYIDfAKg3A5TE7rxod3NVWQ2WuOakifmty2f/MXV+a29S3B
 P7fm0WjKiybmRabInhNXuzBYXpdxZBuB34q5Ld8nzw7mtJawAdWUxEcEPHVIWcWbYUlfOl
 4A7kNuLl3YtmwU9y/cVKiC09jR+2KcQ=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.135.226.135
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, philmd@redhat.com, Andrew.Baumann@microsoft.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uaRtu3xQULHD

Remove gpio/sdbus which is only used to host the sd card before reset.

Instead directly we exhibit the sdhci bus to the soc and machine. Thus
the sd card is created on the sdhci bus and do not need to be moved
during first reset.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/gpio/bcm2835_gpio.h | 1 -
 hw/arm/bcm2835_peripherals.c   | 2 +-
 hw/gpio/bcm2835_gpio.c         | 6 ------
 3 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/include/hw/gpio/bcm2835_gpio.h b/include/hw/gpio/bcm2835_gpi=
o.h
index b0de0a3c74..f8416d43d3 100644
--- a/include/hw/gpio/bcm2835_gpio.h
+++ b/include/hw/gpio/bcm2835_gpio.h
@@ -23,7 +23,6 @@ typedef struct BCM2835GpioState {
     MemoryRegion iomem;
=20
     /* SDBus selector */
-    SDBus sdbus;
     SDBus *sdbus_sdhci;
     SDBus *sdbus_sdhost;
=20
diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 17207ae07e..93477c5b2f 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -360,7 +360,7 @@ static void bcm2835_peripherals_realize(DeviceState *=
dev, Error **errp)
     memory_region_add_subregion(&s->peri_mr, GPIO_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gpio), 0));
=20
-    object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->gpio), "sd=
-bus",
+    object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->sdhci), "s=
d-bus",
                               &err);
     if (err) {
         error_propagate(errp, err);
diff --git a/hw/gpio/bcm2835_gpio.c b/hw/gpio/bcm2835_gpio.c
index 91ce3d10cc..25c180423f 100644
--- a/hw/gpio/bcm2835_gpio.c
+++ b/hw/gpio/bcm2835_gpio.c
@@ -267,9 +267,6 @@ static void bcm2835_gpio_reset(DeviceState *dev)
=20
     s->sd_fsel =3D 0;
=20
-    /* SDHCI is selected by default */
-    sdbus_reparent_card(&s->sdbus, s->sdbus_sdhci);
-
     s->lev0 =3D 0;
     s->lev1 =3D 0;
 }
@@ -299,9 +296,6 @@ static void bcm2835_gpio_init(Object *obj)
     DeviceState *dev =3D DEVICE(obj);
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
=20
-    qbus_create_inplace(&s->sdbus, sizeof(s->sdbus),
-                        TYPE_SD_BUS, DEVICE(s), "sd-bus");
-
     memory_region_init_io(&s->iomem, obj,
             &bcm2835_gpio_ops, s, "bcm2835_gpio", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
--=20
2.24.0


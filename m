Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2315738lff;
        Sat, 14 Dec 2019 07:56:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqwZ4nDTIljBxMGdlb6BbXiO8W7bJUknPyfh8jM0QjZNFx1wkc3P5v88NJF9u+i+V/jUavHb
X-Received: by 2002:a9d:2073:: with SMTP id n106mr21019911ota.145.1576339013092;
        Sat, 14 Dec 2019 07:56:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576339013; cv=none;
        d=google.com; s=arc-20160816;
        b=AjFashWaT+w9mcKek05SXENO+zloueQucD3CdGTNnRSbH/QDxynQo4UH8Cp9h9XM3/
         pv87BLJqRDckyvBvfhnF4rrCq/uPlDIM+CgX47Q/zBhxEPNyI5i+rcrj9BQBBIw1Q1ib
         Hb9fSrJMaIq+3+vBOB2Bq/yGWa6pek2QozHAG77vkoXkXBdNYq7+VkryPpdGZpuwzMqz
         SFxkAwE5i8lvAoePESD+j8UoQc6eKzilOn83Za593vSSU3RCIU3QjzJitKv1d8WMvRJ7
         m1mng5zEbE3HP1ldnEoXYtm7EF83wwSW8VXNSIj138Ku71dBvEGHa7YX38UQitMGbXiN
         rA/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=IiMSoFUEZseoMxLw1sAmT/IUeieWX2EUqAxBTC+j+po=;
        b=BO3BGfY8rihMxauvEYq2oq8bsLvhwOVr9Vv2e7l3is/KET9mGHlD9VMwIvjxLr8rwB
         G04x5AdFVd2VanpvsUKvOyF3qNGj855NHnWsU545m3Imqk5AVbanbYPEF7AbHn4o1R97
         8NO1DH08J43FwdLNQjZV/Wwm/PJRdXdJ0CttplOxJ8716sDUVHeM86L3Cz13Xj2YwFQ4
         FzIpUQmWnuujxrVZgFGtpnO47k4TB4Wbd+gmOP3OXTJZOsQAk9Beav8sNxY64k5kpdZH
         +eo9d5HnGt3gftT2B9cWDhmdjTibHlcKmJ7BLfSxsVisFVCUBjiJO2i6HRQ29ne8fDtM
         KjDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MsdGxiOA;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id a205si7330504oii.95.2019.12.14.07.56.52;
        Sat, 14 Dec 2019 07:56:53 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MsdGxiOA;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbfLNP4w (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Sat, 14 Dec 2019 10:56:52 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:31246 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726944AbfLNP4v (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sat, 14 Dec 2019 10:56:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576339011;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IiMSoFUEZseoMxLw1sAmT/IUeieWX2EUqAxBTC+j+po=;
        b=MsdGxiOAuI3TpMWumBs3S87MFcocJUweZ9R89UjHZCvMI47GTrDoCLMf1QPRN3LpvJ+vqw
        FFErJNSfKPB3l1murZou81w55rHq/LhiuLf1BnoI+cQyOzyvd9dtlOyU9CCXydN1VF+ZOB
        q5YYejji8Fez7sb5GT3LpJl10HlvCjE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-8GfcR2qbM7asPJU8NqZDDA-1; Sat, 14 Dec 2019 10:56:49 -0500
X-MC-Unique: 8GfcR2qbM7asPJU8NqZDDA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62B71107ACC4;
        Sat, 14 Dec 2019 15:56:47 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C0F166A1A;
        Sat, 14 Dec 2019 15:56:32 +0000 (UTC)
From:   =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To:     qemu-devel@nongnu.org
Cc:     Peter Maydell <peter.maydell@linaro.org>,
        Andrew Baumann <Andrew.Baumann@microsoft.com>,
        Aurelien Jarno <aurelien@aurel32.net>, kvm@vger.kernel.org,
        Alex Williamson <alex.williamson@redhat.com>,
        Aleksandar Markovic <amarkovic@wavecomp.com>,
        Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Alistair Francis <alistair@alistair23.me>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
        Paul Burton <pburton@wavecomp.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/8] hw/arm/nrf51_soc: Use memory_region_add_subregion() when priority is 0
Date:   Sat, 14 Dec 2019 16:56:07 +0100
Message-Id: <20191214155614.19004-2-philmd@redhat.com>
In-Reply-To: <20191214155614.19004-1-philmd@redhat.com>
References: <20191214155614.19004-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: qReCU8mtYLmy

It is pointless to overlap a memory subregion with priority 0.
Use the simpler memory_region_add_subregion() function.

This patch was produced with the following spatch script:

    @@
    expression region;
    expression offset;
    expression subregion;
    @@
    -memory_region_add_subregion_overlap(region, offset, subregion, 0)
    +memory_region_add_subregion(region, offset, subregion)

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/nrf51_soc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index 74029169d0..ade06b225f 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -94,7 +94,7 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Err=
or **errp)
         return;
     }
     mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->uart), 0);
-    memory_region_add_subregion_overlap(&s->container, NRF51_UART_BASE, =
mr, 0);
+    memory_region_add_subregion(&s->container, NRF51_UART_BASE, mr);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart), 0,
                        qdev_get_gpio_in(DEVICE(&s->cpu),
                        BASE_TO_IRQ(NRF51_UART_BASE)));
@@ -107,7 +107,7 @@ static void nrf51_soc_realize(DeviceState *dev_soc, E=
rror **errp)
     }
=20
     mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->rng), 0);
-    memory_region_add_subregion_overlap(&s->container, NRF51_RNG_BASE, m=
r, 0);
+    memory_region_add_subregion(&s->container, NRF51_RNG_BASE, mr);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->rng), 0,
                        qdev_get_gpio_in(DEVICE(&s->cpu),
                        BASE_TO_IRQ(NRF51_RNG_BASE)));
@@ -127,13 +127,13 @@ static void nrf51_soc_realize(DeviceState *dev_soc,=
 Error **errp)
     }
=20
     mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->nvm), 0);
-    memory_region_add_subregion_overlap(&s->container, NRF51_NVMC_BASE, =
mr, 0);
+    memory_region_add_subregion(&s->container, NRF51_NVMC_BASE, mr);
     mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->nvm), 1);
-    memory_region_add_subregion_overlap(&s->container, NRF51_FICR_BASE, =
mr, 0);
+    memory_region_add_subregion(&s->container, NRF51_FICR_BASE, mr);
     mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->nvm), 2);
-    memory_region_add_subregion_overlap(&s->container, NRF51_UICR_BASE, =
mr, 0);
+    memory_region_add_subregion(&s->container, NRF51_UICR_BASE, mr);
     mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->nvm), 3);
-    memory_region_add_subregion_overlap(&s->container, NRF51_FLASH_BASE,=
 mr, 0);
+    memory_region_add_subregion(&s->container, NRF51_FLASH_BASE, mr);
=20
     /* GPIO */
     object_property_set_bool(OBJECT(&s->gpio), true, "realized", &err);
@@ -143,7 +143,7 @@ static void nrf51_soc_realize(DeviceState *dev_soc, E=
rror **errp)
     }
=20
     mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gpio), 0);
-    memory_region_add_subregion_overlap(&s->container, NRF51_GPIO_BASE, =
mr, 0);
+    memory_region_add_subregion(&s->container, NRF51_GPIO_BASE, mr);
=20
     /* Pass all GPIOs to the SOC layer so they are available to the boar=
d */
     qdev_pass_gpios(DEVICE(&s->gpio), dev_soc, NULL);
--=20
2.21.0

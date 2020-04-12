Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3139312lfm;
        Sun, 12 Apr 2020 15:41:13 -0700 (PDT)
X-Google-Smtp-Source: APiQypKLTcmjbfEyMpI/oF0NxVdumjF+8qA12ydrmXSQF7bQiRRhoWOkQxgLKiUomwhgAYRLa3cC
X-Received: by 2002:a37:6c81:: with SMTP id h123mr13710876qkc.290.1586731273237;
        Sun, 12 Apr 2020 15:41:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586731273; cv=none;
        d=google.com; s=arc-20160816;
        b=mXnexm6UQ30xXHWYzB29FgI3nEsll4TdAoxl/X/U5MDJJbggMV2pEMiKjyc+p1Gynt
         4YKGRd7U8Vn8RIg7PHKtdZEFsJvA6p1Jr4pPYvVI9JxVsW2j+f9DjUb+b2kLtvGs/GUP
         tUEGy0u48o3h6+re7JHUKS4FsMJKZsfScA4roExLyyUJewWSc7gi8h4reh+Uj/lj2bR2
         bk9aa807GCciqLMBNnync4WXRL4BPanssdRQA4aZK6d0MJcww5L0KyG0Udq99LL/pQ+j
         XTsKskc3PkUdRWcSose3Spe9SU3bcbX1RSrf8Z4rXepUOJ7qEJVgDZKts/C9mGWQta+R
         s7Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4j3n0ZN8lrQk9Ox5ZI487lTmFghYMiP7ZCOjQ+gtTO0=;
        b=KaNksltlFe2Sk1RBHyvM3mh0LnY0QhBKqsOOX8EnICnwqjJBzCW755NFEMRj8kNkQ6
         3EEWgCyX2Azi85LodUDEfaZgiJy7Gn7WAwWHV8i+ekAJ23HkxJXMTgPTatqbwKuJrpN5
         iIFIii6WHf3rGlBm2i20MxmmYt9RUE5hh3/VRctnckDVjR/zM6snnDS1U6aEdX0XID1S
         sFnc2GrKvNJ9JElpJGNSHZuLYHjbr7VE/OriHFChznCjckic8gw7BjPsAF/UGW09CWfe
         VMLmDT/cf7RDHNbFyFwhFqF44DNLZm0hIT4b2dq1LTrVjtkqo+fCdd4U3fa8rtZngYUl
         DXIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FiPl+xfI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p55si2862906qtk.60.2020.04.12.15.41.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Apr 2020 15:41:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FiPl+xfI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:37798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jNlHs-0006vg-MW
	for alex.bennee@linaro.org; Sun, 12 Apr 2020 18:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47971)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlE8-0006xV-Ve
 for qemu-arm@nongnu.org; Sun, 12 Apr 2020 18:37:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlE7-0002wh-Kw
 for qemu-arm@nongnu.org; Sun, 12 Apr 2020 18:37:20 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:56094)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlE1-0002rQ-Lg; Sun, 12 Apr 2020 18:37:13 -0400
Received: by mail-wm1-x342.google.com with SMTP id e26so7922076wmk.5;
 Sun, 12 Apr 2020 15:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4j3n0ZN8lrQk9Ox5ZI487lTmFghYMiP7ZCOjQ+gtTO0=;
 b=FiPl+xfImHl2GpHUMPv7DS3HnCGs7y5Yv7rRAWLbBxSA+Zejhz/zl3dYLZFx9NwO3C
 ruBIj4ErorNm/wEEEwmAZQN7jz+KhLLNa3qUtc6sXdKd0t4oGGLXPCHrZDaqFOt7+heG
 akctvFAf/HakBv2w5G3h7MQwU/7e8gmOEEk6Z3+IDI0ZJ8CQnO1vrHu4pMgXZE7FtJ37
 +V2y1Eimw56yRDBdiaV3zqgFJs1xlb2++xZYHy83WCjNnfGmjYL3b+tsJbkPb0JXPjQ6
 mm7I3D/7KEPFhiTmxZNJOmqeOOKBoCVRVDbYfbGEZ4JPJvWn79ulzvCvctV9S8Op08JM
 6KXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4j3n0ZN8lrQk9Ox5ZI487lTmFghYMiP7ZCOjQ+gtTO0=;
 b=NDk6OdbEfQIzD4f7kNQB7TtSmI+3GaowfGPmWcuE6OI+tVK6TpDsiqd0UGQK2qnmmh
 BejAKN8SjEfqTt6MKwJQ/jmGEvgxBuADzg9jJEVZmJWGDUGdvo23pDosPNDPX4hBpFc0
 5rJdsy54zyCp0ftdmQRZk6rXCM8JFT74GU4ogCiCrrCv0X022bl69rCCHzYsTK/t544E
 ajb4NMgmE0beHEz2alF3agWFSVgxVuOPDPZeMqBAjCWJntVlsi1oE42viY0zd/tXIjzR
 56cFgRnqwKZyIYH9gmPQhVOkd08QDJDdkRQ3gIvkSJ9jZgdU6Fv+PXCypPY8qNuMvJGd
 v/bw==
X-Gm-Message-State: AGi0PuaR+VGZEmMahti7aVPdm9EfelZQh4tMBfAdAzgpwydSx+PQynl9
 Qv0XVETGASH50VnzAxhayImVmyVveln+WQ==
X-Received: by 2002:a1c:7301:: with SMTP id d1mr16763598wmb.26.1586731032454; 
 Sun, 12 Apr 2020 15:37:12 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id d13sm12563559wrv.34.2020.04.12.15.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:37:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 v3 14/24] hw/arm/xlnx-zynqmp: Use single
 propagate_error() call
Date: Mon, 13 Apr 2020 00:36:09 +0200
Message-Id: <20200412223619.11284-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412223619.11284-1-f4bug@amsat.org>
References: <20200412223619.11284-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Wen Congyang <wencongyang2@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2f1YCRJfkP8Y

Coccinelle failed at processing this file:

  $ spatch ... --timeout 60 --sp-file \
    scripts/coccinelle/simplify-init-realize-error_propagate.cocci
  HANDLING: ./hw/arm/xlnx-zynqmp.c
  EXN: Coccinelle_modules.Common.Timeout

We are going to manually add the missing propagate_error() calls.
As there are many Error* calls used, simplify by using an unique
call to propagate_error().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/xlnx-zynqmp.c | 61 +++++++++++++++++---------------------------
 1 file changed, 23 insertions(+), 38 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index b84d153d56..43d57fa7de 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -385,15 +385,13 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         object_property_set_bool(OBJECT(&s->apu_cpu[i]), true, "realized",
                                  &err);
         if (err) {
-            error_propagate(errp, err);
-            return;
+            goto out_propagate_error;
         }
     }
 
     object_property_set_bool(OBJECT(&s->gic), true, "realized", &err);
     if (err) {
-        error_propagate(errp, err);
-        return;
+        goto out_propagate_error;
     }
 
     assert(ARRAY_SIZE(xlnx_zynqmp_gic_regions) == XLNX_ZYNQMP_GIC_REGIONS);
@@ -462,8 +460,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
     xlnx_zynqmp_create_rpu(ms, s, boot_cpu, &err);
     if (err) {
-        error_propagate(errp, err);
-        return;
+        goto out_propagate_error;
     }
 
     if (!s->boot_cpu_ptr) {
@@ -488,8 +485,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
                                 &error_abort);
         object_property_set_bool(OBJECT(&s->gem[i]), true, "realized", &err);
         if (err) {
-            error_propagate(errp, err);
-            return;
+            goto out_propagate_error;
         }
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->gem[i]), 0, gem_addr[i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gem[i]), 0,
@@ -500,8 +496,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         qdev_prop_set_chr(DEVICE(&s->uart[i]), "chardev", serial_hd(i));
         object_property_set_bool(OBJECT(&s->uart[i]), true, "realized", &err);
         if (err) {
-            error_propagate(errp, err);
-            return;
+            goto out_propagate_error;
         }
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->uart[i]), 0, uart_addr[i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart[i]), 0,
@@ -512,8 +507,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
                             &error_abort);
     object_property_set_bool(OBJECT(&s->sata), true, "realized", &err);
     if (err) {
-        error_propagate(errp, err);
-        return;
+        goto out_propagate_error;
     }
 
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->sata), 0, SATA_ADDR);
@@ -531,23 +525,19 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
          */
         object_property_set_uint(sdhci, 3, "sd-spec-version", &err);
         if (err) {
-            error_propagate(errp, err);
-            return;
+            goto out_propagate_error;
         }
         object_property_set_uint(sdhci, SDHCI_CAPABILITIES, "capareg", &err);
         if (err) {
-            error_propagate(errp, err);
-            return;
+            goto out_propagate_error;
         }
         object_property_set_uint(sdhci, UHS_I, "uhs", &err);
         if (err) {
-            error_propagate(errp, err);
-            return;
+            goto out_propagate_error;
         }
         object_property_set_bool(sdhci, true, "realized", &err);
         if (err) {
-            error_propagate(errp, err);
-            return;
+            goto out_propagate_error;
         }
         sysbus_mmio_map(sbd, 0, sdhci_addr[i]);
         sysbus_connect_irq(sbd, 0, gic_spi[sdhci_intr[i]]);
@@ -564,8 +554,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
         object_property_set_bool(OBJECT(&s->spi[i]), true, "realized", &err);
         if (err) {
-            error_propagate(errp, err);
-            return;
+            goto out_propagate_error;
         }
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0, spi_addr[i]);
@@ -582,8 +571,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
     object_property_set_bool(OBJECT(&s->qspi), true, "realized", &err);
     if (err) {
-        error_propagate(errp, err);
-        return;
+        goto out_propagate_error;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 0, QSPI_ADDR);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 1, LQSPI_ADDR);
@@ -605,16 +593,14 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
     object_property_set_bool(OBJECT(&s->dp), true, "realized", &err);
     if (err) {
-        error_propagate(errp, err);
-        return;
+        goto out_propagate_error;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->dp), 0, DP_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->dp), 0, gic_spi[DP_IRQ]);
 
     object_property_set_bool(OBJECT(&s->dpdma), true, "realized", &err);
     if (err) {
-        error_propagate(errp, err);
-        return;
+        goto out_propagate_error;
     }
     object_property_set_link(OBJECT(&s->dp), OBJECT(&s->dpdma), "dpdma",
                              &error_abort);
@@ -623,16 +609,14 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
     object_property_set_bool(OBJECT(&s->ipi), true, "realized", &err);
     if (err) {
-        error_propagate(errp, err);
-        return;
+        goto out_propagate_error;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->ipi), 0, IPI_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->ipi), 0, gic_spi[IPI_IRQ]);
 
     object_property_set_bool(OBJECT(&s->rtc), true, "realized", &err);
     if (err) {
-        error_propagate(errp, err);
-        return;
+        goto out_propagate_error;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->rtc), 0, RTC_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->rtc), 0, gic_spi[RTC_IRQ]);
@@ -640,13 +624,11 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
         object_property_set_uint(OBJECT(&s->gdma[i]), 128, "bus-width", &err);
         if (err) {
-            error_propagate(errp, err);
-            return;
+            goto out_propagate_error;
         }
         object_property_set_bool(OBJECT(&s->gdma[i]), true, "realized", &err);
         if (err) {
-            error_propagate(errp, err);
-            return;
+            goto out_propagate_error;
         }
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->gdma[i]), 0, gdma_ch_addr[i]);
@@ -657,14 +639,17 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < XLNX_ZYNQMP_NUM_ADMA_CH; i++) {
         object_property_set_bool(OBJECT(&s->adma[i]), true, "realized", &err);
         if (err) {
-            error_propagate(errp, err);
-            return;
+            goto out_propagate_error;
         }
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->adma[i]), 0, adma_ch_addr[i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->adma[i]), 0,
                            gic_spi[adma_ch_intr[i]]);
     }
+    return;
+
+out_propagate_error:
+    error_propagate(errp, err);
 }
 
 static Property xlnx_zynqmp_props[] = {
-- 
2.21.1


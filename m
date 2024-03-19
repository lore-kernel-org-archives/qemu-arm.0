Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1122782ejb;
        Tue, 19 Mar 2024 00:34:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWuvAYBVbeda0T6lvCs5A80QgZslDJITTIdCzmk9/ardmk9HpIxdF6ePRRYUX8z3TawsDWFBc5I3RPJRAnOZHHlD59Jqe70
X-Google-Smtp-Source: AGHT+IFpF5PcIsxotipFefK/SHdku97qk0Q0a7Yl99z9zdkU45CI9lzzr5A9tIRRDH1xrEXgMMnV
X-Received: by 2002:a0d:c386:0:b0:60a:5fd6:360b with SMTP id f128-20020a0dc386000000b0060a5fd6360bmr16950673ywd.40.1710833669649;
        Tue, 19 Mar 2024 00:34:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710833669; cv=none;
        d=google.com; s=arc-20160816;
        b=rwl5pivsQ2NfqA/aGPer2kLCpyCDWxHxp7oPYLxf9Vm8RmiG0LJsHn/coAgQNdOb+q
         GCn+NMjyY3Hueve0enOBGpvKqACfdqNJ2I4GhA+FzuXJxiEU8AuCByuidUzuMXhfJX12
         tKQthgw4G+mPlE5b53MOz9WLc5xkUZNXhVizkeSoC/g862ZWAExo8VW+RCnVbxxsJml4
         CCq2r4Imq7+1i2rcKtHpYm4lY8jMM4ModDhCTnkdrAuKGxX6oksY8RDdd6x6VfaZQpej
         Uc21coD/DDGy5ZoW8RxEfaJy0exFVGLVUilyg7T6OdG3Z3gTht0a12dau0ZjRkMS29Bd
         dliA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=gw7AqvkdEkFkQaEkj3AAmMlWcj6KLK6J/UQxKNb7WNA=;
        fh=8z+WuXTxBCVRtDkS1fMrYY8iEWmcCe/iUbhzIT7jH1k=;
        b=PbuiBxCfvUFKfBFQMql01S7N1JALEQQWC3yFdPWUghhcgpciuv86CQN5UnT6EAr1D/
         h3+yN7sDZakMQJ3qoZPtbHE4YZMhQC4IP0DfjJPVQL61HCEsN6ggEgZudirMk7tnNSRx
         rKKsHVFXkm6xIBIITs7Mt1SukZf1RS4wuSOzPnxnASmvDV6xyh48OU5Iy+HAycyO9wmY
         Ko6cW7+jPhF0TgnTDpcsGPOOFFyg1/UQRreQgZZM/1IkZquZi75paf4BmP6bWkehUdgd
         Hv4zoXF16NoSgxBSfkUPHDVi/ICAjhJC1Ic54gEmMoDATLLIfafqPg5a50ecdwt1r7qV
         j5yQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hUIElaSb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g1-20020ac85d41000000b00430cfc1c074si4140618qtx.304.2024.03.19.00.34.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 00:34:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hUIElaSb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmTz5-0003vc-9B; Tue, 19 Mar 2024 03:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rmTyw-0003tb-02
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 03:33:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rmTyp-0000Yw-U3
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 03:33:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710833631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gw7AqvkdEkFkQaEkj3AAmMlWcj6KLK6J/UQxKNb7WNA=;
 b=hUIElaSba3aUzO35LPmVf6oUS1GKG7WYhZobk5+zFiI5MIqlmNWuxFOMhtVUWedgV7QxaN
 On5PVTjl3dhx6pDlCJmnwMBZYq2gzp7MHPvdpX6JhQIEhqfC9vorUVWmD1fF3GL7mZP4Vy
 nhoSnaG6jj2jpXVmuxHK19XKuZeJlOU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-GrCjKjE-MnyQSfhC_DaTqg-1; Tue, 19 Mar 2024 03:33:47 -0400
X-MC-Unique: GrCjKjE-MnyQSfhC_DaTqg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69706101A523;
 Tue, 19 Mar 2024 07:33:46 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D98D040C6DB3;
 Tue, 19 Mar 2024 07:33:43 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Subject: [PATCH] aspeed/smc: Only wire flash devices at reset
Date: Tue, 19 Mar 2024 08:33:20 +0100
Message-ID: <20240319073320.315170-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: c6DR+0h087zF

The Aspeed machines have many Static Memory Controllers (SMC), up to
8, which can only drive flash memory devices. Commit 27a2c66c92ec
("aspeed/smc: Wire CS lines at reset") tried to ease the definitions
of these devices by allowing flash devices from the command line to be
attached to a SSI bus. For that, the wiring of the CS lines of the
Aspeed SMC controller was moved at reset. Two assumptions are made
though, first that the device has a SSI_GPIO_CS GPIO line, which is
not always the case, and second that it is flash device.

Correct this problem by ensuring that the devices attached to the bus
are the correct flash type. This fixes a QEMU abort when devices
without a CS line, such as the max111x, are passed on the command
line.

While at it, export TYPE_M25P80 used in the Xilinx Versal Virtual
machine.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2228
Fixes: 27a2c66c92ec ("aspeed/smc: Wire CS lines at reset")
Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/block/flash.h  | 2 ++
 hw/arm/xlnx-versal-virt.c | 3 ++-
 hw/block/m25p80.c         | 1 -
 hw/ssi/aspeed_smc.c       | 9 +++++++++
 4 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index de93756cbe8f..2b5ccd92f463 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -78,6 +78,8 @@ extern const VMStateDescription vmstate_ecc_state;
 
 /* m25p80.c */
 
+#define TYPE_M25P80 "m25p80-generic"
+
 BlockBackend *m25p80_get_blk(DeviceState *dev);
 
 #endif
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index bfaed1aebfc6..962f98fee2ea 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -13,6 +13,7 @@
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "sysemu/device_tree.h"
+#include "hw/block/flash.h"
 #include "hw/boards.h"
 #include "hw/sysbus.h"
 #include "hw/arm/fdt.h"
@@ -759,7 +760,7 @@ static void versal_virt_init(MachineState *machine)
             flash_klass = object_class_by_name(s->ospi_model);
             if (!flash_klass ||
                 object_class_is_abstract(flash_klass) ||
-                !object_class_dynamic_cast(flash_klass, "m25p80-generic")) {
+                !object_class_dynamic_cast(flash_klass, TYPE_M25P80)) {
                 error_setg(&error_fatal, "'%s' is either abstract or"
                        " not a subtype of m25p80", s->ospi_model);
                 return;
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 08a00a6d9b89..8dec134832a1 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -515,7 +515,6 @@ struct M25P80Class {
     FlashPartInfo *pi;
 };
 
-#define TYPE_M25P80 "m25p80-generic"
 OBJECT_DECLARE_TYPE(Flash, M25P80Class, M25P80)
 
 static inline Manufacturer get_man(Flash *s)
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 0dff1d910778..de57e690e124 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/block/flash.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "qemu/log.h"
@@ -711,6 +712,14 @@ static void aspeed_smc_reset(DeviceState *d)
     for (i = 0; i < asc->cs_num_max; i++) {
         DeviceState *dev = ssi_get_cs(s->spi, i);
         if (dev) {
+            Object *o = OBJECT(dev);
+
+            if (!object_dynamic_cast(o, TYPE_M25P80)) {
+                warn_report("Aspeed SMC %s.%d : Invalid %s device type",
+                            BUS(s->spi)->name, i, object_get_typename(o));
+                continue;
+            }
+
             qemu_irq cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
             qdev_connect_gpio_out_named(DEVICE(s), "cs", i, cs_line);
         }
-- 
2.44.0


Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5FBCD5BD1
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 09:24:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSWy3-0002oH-Sj; Thu, 28 May 2026 05:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wSWxu-0002lA-CI
 for qemu-arm@nongnu.org; Thu, 28 May 2026 05:23:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1wSWxp-0004SG-LO
 for qemu-arm@nongnu.org; Thu, 28 May 2026 05:23:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779960219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=1vA6MBKntWhNaACiyqSXQMoBAMp+4vKgu8m3XqpJ7s4=;
 b=KdzFGv9tHY+2s8BbfQIrwuqEMGqA0UiimRABRIMFngwVMJp2QfLvLszcCDag2qwZUQysWy
 NzgEaF+mxpITlbBCDzgEwwqhBw+2t8LzvqWjj4CIw0boo/VMvlmJGvwF91Z5zsMPbzG4y3
 aB3fz6bG/1OZVqkKW+TKL67j3UZtMNY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-Wi2si5CTMRmE_81OrRk6SA-1; Thu, 28 May 2026 05:23:33 -0400
X-MC-Unique: Wi2si5CTMRmE_81OrRk6SA-1
X-Mimecast-MFC-AGG-ID: Wi2si5CTMRmE_81OrRk6SA_1779960213
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-45e73a4f1dfso9128571f8f.0
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 02:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779960213; x=1780565013;
 h=mime-version:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1vA6MBKntWhNaACiyqSXQMoBAMp+4vKgu8m3XqpJ7s4=;
 b=I7J8I92Wx3h1yjtumlFEMxg7Rbe0c48QOpbCVvapQjZS9CARNtoUjGlzfiG8cGKU+X
 8iM8SyQIAuOyIE4pbItplQkIp6e3LyH0ZHpptuePk7TzxUhYLaiMKfS42ZuGI3ZfogS2
 8j+F4J5pwN+guh0RXfG+J1syC14yi/AH2PvZLBtgbRbOh+43MeMprNLientgxeG35pvG
 KgAznRFDa9I98RZunFw2GetdkSFYVJYWJfkJk5L/LUvd8GDY9Ofo4ZR1yx93xRstqBbj
 VIvcPdK84tToxyW1I9rO+RVM8xRu8XQSY6WoxUebqABeSEojT93qhsCrfsljA+SwhNa7
 4RfQ==
X-Gm-Message-State: AOJu0YxwuhHeRz8mvf6OFFyPGJOVJqbAmChGx87/asOp4CHrk/Mn06yc
 JgzbPt6fZCXC35BFd4TG6ln0JxsmFkZEWFsfQsm0HMIZjESw4jOiqN5mcDBBpxesLVKlgQW+qJz
 Aj+phAMfruDqNE9U4p3WDoT+GMyNRt8MPXMlhGV31KqGlnHP1N+g/vQ==
X-Gm-Gg: Acq92OGW1ILElFNeyHAmG7m+qB/v4fzm1hw0DnEkHuG6caGph1xv1HGzCvSBCJ88jOt
 MenHXLos0d4Fs8jRXsDxEvRsWVhaKtCnLkfJDVhhLV/qmy+ONIDXvxomaPIvs00kiFwjbTw1Is9
 Fw//CrjaYVFqebNb3tHX8dTQFLOGCnWvPc/QJBu5SSZLydm9j4vu5enLQJ+mkaR0c8JeqkmgAhX
 TNXPdD+xCfo+CcmFcUlcdJFzTvgsCipjHTee7NQ8x9TuOrd5l7e7QTAI0sZzLRgOOPYmgwCLQMF
 B0nvAJbnn/N7GNISLa4C9u7BCnw4vILPOYdY6BKmtkmVgF/Q+Y7Q6UtZLk58caH9RhpS0LTzFim
 Y87DwpYO8vBBwM2URLDdoTPhgQujwExh/yp1kDPsLM2y7q86ePnAAjncsAB5QVdATkGua38PGnF
 MAVk2fLQ==
X-Received: by 2002:a05:600c:6207:b0:490:538a:9c0b with SMTP id
 5b1f17b1804b1-4907dae371fmr130553705e9.2.1779960212677; 
 Thu, 28 May 2026 02:23:32 -0700 (PDT)
X-Received: by 2002:a05:600c:6207:b0:490:538a:9c0b with SMTP id
 5b1f17b1804b1-4907dae371fmr130553485e9.2.1779960212297; 
 Thu, 28 May 2026 02:23:32 -0700 (PDT)
Received: from rh (p200300f6af2a6100f239e076bbd76784.dip0.t-ipconnect.de.
 [2003:f6:af2a:6100:f239:e076:bbd7:6784])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4908f0afc77sm11447935e9.33.2026.05.28.02.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 02:23:31 -0700 (PDT)
Date: Thu, 28 May 2026 11:23:30 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: peter.maydell@linaro.org, mst@redhat.com, Eric Auger <eauger@redhat.com>
cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/virt: preserve config for ACPI PCI hotplug
Message-ID: <0de640a2-8807-69cf-4429-672263e3e759@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vqn-0A5eXErUnFSIITi-7R7IbATZsOwMKvFlMt8e-vM_1779960213
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

ACPI PCI hotplug of a PCI device using a bar > 2M fails on ARM
with a resource allocation failure in the guest kernel (Linux):

qemu-system-aarch64 [..] -device pcie-root-port,id=rp1,bus=pcie.0 \
 		    -global acpi-ged.acpi-pci-hotplug-with-bridge-support=on \
 		    -pflash /usr/share/edk2/aarch64/QEMU_EFI-silent-pflash.qcow2

(qemu) device_add pci-testdev,bus=rp1,membar=4M

[   55.106283] pci 0000:01:00.0: [1b36:0005] type 00 class 0x00ff00 conventional PCI endpoint
[   55.107627] pci 0000:01:00.0: BAR 0 [mem 0x00000000-0x00000fff]
[   55.107864] pci 0000:01:00.0: BAR 1 [io  0x0000-0x00ff]
[   55.108015] pci 0000:01:00.0: BAR 2 [mem 0x00000000-0x003fffff 64bit pref]
[   55.118609] pci 0000:01:00.0: BAR 2 [mem size 0x00400000 64bit pref]: can't assign; no space
[   55.118653] pci 0000:01:00.0: BAR 2 [mem size 0x00400000 64bit pref]: failed to assign
[   55.118671] pci 0000:01:00.0: BAR 0 [mem 0x10000000-0x10000fff]: assigned
[   55.122828] pci 0000:01:00.0: BAR 1 [io  0x1000-0x10ff]: assigned
[   55.127090] pci 0000:01:00.0: BAR 0 [mem 0x10000000-0x10000fff]: releasing
[   55.127098] pci 0000:01:00.0: BAR 2 [mem size 0x00400000 64bit pref]: can't assign; no space
[   55.127102] pci 0000:01:00.0: BAR 2 [mem size 0x00400000 64bit pref]: failed to assign
[   55.127106] pci 0000:01:00.0: BAR 0 [mem 0x10000000-0x10000fff]: assigned

This behavior is exactly the same on x86 - except the busses are created
with a default window size of 256M there. If the PCI devices being
hotplugged use a bar > 256M you get the same failure like on ARM.

The workaround on x86 is to specify "pref64-reserve=" for the PCIe
root-port. On ARM this is currently ignored.

The following patch changes ACPI DSM #5 to return 0 (only when
ACPI HP is used) which basically tells the guest kernel to keep
all PCI resource allocations.

------->8
From 92cd64b8398f13e51b67ff8baf62f15cac300c94 Mon Sep 17 00:00:00 2001
From: Sebastian Ott <sebott@redhat.com>
Date: Wed, 20 May 2026 10:39:26 -0400
Subject: [PATCH] hw/arm/virt: preserve config for ACPI PCI hotplug

Change ACPI DSM #5 to return 0 when ACPI PCI hotplug is used
to tell the guest kernel to keep all PCI resource allocations.

This allows to use the pref64-reserve= option for pcie-root-ports
and thus enables hotplug of PCI devices with a barsize > 2M.

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
  hw/arm/virt.c | 1 +
  1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b090233893..293a0c2163 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1094,6 +1094,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
          pcihp_region_index = sysbus_mmio_map_name(sbdev, ACPI_PCIHP_REGION_NAME,
                                                    vms->memmap[VIRT_ACPI_PCIHP].base);
          assert(pcihp_region_index >= 0);
+        vms->pci_preserve_config = true;
      }

      sysbus_connect_irq(sbdev, 0, qdev_get_gpio_in(vms->gic, irq));
-- 
2.53.0



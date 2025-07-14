Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E354C83F17
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Jul 2025 23:27:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubSMU-0003CO-Rw; Mon, 14 Jul 2025 19:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ubSIx-0004oq-Ld
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 19:09:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ubSIr-0005vi-3N
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 19:09:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752534583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ch85qCxvAmCXoJ+NOOx+afwY7JfNKRiohRHU3Ox1I3g=;
 b=N1nu3cCpl90dPHKE5TpGUvfj3PMt70JsyML4ozR9f3qGjEO27Tr89YH1sJJ2dm6mCFPVPs
 EGFczcbhdzdlxZNEbImtaMwy86vklj41pMo842L0o7xT4CWy9XBmSxA1l5pgjF+g7fU0di
 VVz9EXGnUO5xfTGUBcd4xhsMExxlnhk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-znFhTFiFNbSyXlKeH7BnIg-1; Mon, 14 Jul 2025 19:09:41 -0400
X-MC-Unique: znFhTFiFNbSyXlKeH7BnIg-1
X-Mimecast-MFC-AGG-ID: znFhTFiFNbSyXlKeH7BnIg_1752534581
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a4e9252ba0so2841206f8f.0
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 16:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752534580; x=1753139380;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ch85qCxvAmCXoJ+NOOx+afwY7JfNKRiohRHU3Ox1I3g=;
 b=guoYFmT4D/ucUPus2LAyq2gKTSXiQstDpFpO889ZeT+wFiPcXg7V4aiVkHcsl2uOVB
 65ngp9MZpgzU/wiyP0phPErhqR0eueJGlDU0S/6RvSdMECNJdoXuqzgs94vE4T4Wscju
 VlF7jxAFG2nTIgTxJplaW7aczUoj3vLuuQYx72pOwuQ2JVWWcv08bM3F6ka06D+S8POO
 QlzqqWGqQz6myHG0kkAJ0VTRw7qq5GAHc8EPEJLby9Yll9Gxo/ue611i1vLg2Ane8tom
 wG7yyoLFwLNU1bd3tivn80grsUSJWoHfBg8m0dhYc8bNWShnJ+eBWEQ8e1rcr8mG885Z
 6pNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTpVLr9JKzJqlcBrHBa9var0H3L+Q4z1beN0fuhBR+WVn7/8XpmdKCXhZrNc4pWUWOXxrbTVxtiA==@nongnu.org
X-Gm-Message-State: AOJu0Yz5VPLvTZal7xlilQbEcQ7n1EzsXB1mUIpcvOPk50yb5eEBRujI
 SZZvKjd6nFB7ZN7HyqaqgvYUNCjdvytK333fbeHQdnFIu79/hXCJSIdfetjsKAL1/2mSDtEoeo7
 wr3sejjHA//bybOTNOGHqmMS2zuQ2zYI6jrMFxQtfNlawzwOt1GxfZg==
X-Gm-Gg: ASbGncs+1zaNP8gFmB53k8q5UfmNYHAs1DE59/7VYZHm81++Dun9fKaKo+bnY3Xa677
 riZVRgi+SkSmRsw7ZTmoU4ovT/RSt3TTjlQt9ZkVTDDSQE5ozF0shT0jeA21ClY3GQPeyyuLdbx
 V0SsGJ49NS3jYe9KlXVTm1zKgU2oZe2luFL5BS2VyAGPe8qq4r5iOwiYTZQgFoTbvoAytCw+yot
 wcN4+zz8BUUtmwoIa4AbZaT1aE3hl2CDAWns8l5QCbaVuC9ONMco0Aecoq+SyVvS7wn0VLZhe1u
 8VWNy2DoYHrvNZVkqlB/jutFMD3tTuEB
X-Received: by 2002:a05:6000:2a8a:b0:3a3:71cb:f0bd with SMTP id
 ffacd0b85a97d-3b5f188e702mr9336544f8f.23.1752534580654; 
 Mon, 14 Jul 2025 16:09:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIoRwndar8o46lZkgjDi+/pA/NlseW3O9MbPUamqQ5li/NgikHoiq6lzt4urFfskPmtoG4bw==
X-Received: by 2002:a05:6000:2a8a:b0:3a3:71cb:f0bd with SMTP id
 ffacd0b85a97d-3b5f188e702mr9336530f8f.23.1752534580294; 
 Mon, 14 Jul 2025 16:09:40 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:150d:fc00:de3:4725:47c6:6809])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd180fsm13369695f8f.2.2025.07.14.16.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 16:09:40 -0700 (PDT)
Date: Mon, 14 Jul 2025 19:09:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org
Subject: [PULL 78/97] hw/arm/virt: Let virt support pci hotplug/unplug GED
 event
Message-ID: <28ac8a5662a55c40b377e9c94c2b49191db346c8.1752534227.git.mst@redhat.com>
References: <cover.1752534227.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1752534227.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5ieXB5t_WPy4FuAQ-D9YNMOxTqa5Fa-2_4aHVhiI5kE_1752534581
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Eric Auger <eric.auger@redhat.com>

Set up the IO registers used to communicate between QEMU
and ACPI.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20250714080639.2525563-33-eric.auger@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f127a668ef..ef6be3660f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -691,6 +691,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
     SysBusDevice *sbdev;
     int irq = vms->irqmap[VIRT_ACPI_GED];
     uint32_t event = ACPI_GED_PWR_DOWN_EVT;
+    bool acpi_pcihp;
 
     if (ms->ram_slots) {
         event |= ACPI_GED_MEM_HOTPLUG_EVT;
@@ -709,6 +710,18 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
     sysbus_mmio_map_name(sbdev, TYPE_ACPI_GED, vms->memmap[VIRT_ACPI_GED].base);
     sysbus_mmio_map_name(sbdev, ACPI_MEMHP_REGION_NAME,
                          vms->memmap[VIRT_PCDIMM_ACPI].base);
+
+    acpi_pcihp = object_property_get_bool(OBJECT(dev),
+                                          ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, NULL);
+
+    if (acpi_pcihp) {
+        int pcihp_region_index;
+
+        pcihp_region_index = sysbus_mmio_map_name(sbdev, ACPI_PCIHP_REGION_NAME,
+                                                  vms->memmap[VIRT_ACPI_PCIHP].base);
+        assert(pcihp_region_index >= 0);
+    }
+
     sysbus_connect_irq(sbdev, 0, qdev_get_gpio_in(vms->gic, irq));
 
     return dev;
-- 
MST



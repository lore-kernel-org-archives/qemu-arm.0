Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBE4C43327
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Jun 2026 13:37:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weCAQ-0000An-8q; Mon, 29 Jun 2026 09:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1weCAO-0000AL-RR
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 09:36:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1weCAN-0003UH-2y
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 09:36:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782740209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dYTTV9TjkG/+IdI3+8N4Jcda4sBwtPZ3h/J56YePBFI=;
 b=PbULOoDmui3usSWpJGgIXob4QFcwhzShXOpf2RTpwHEEf7CZqFFD3xpj0t96kpd95+9EEH
 SBmn8efTLLsjUBAnXvLjkO7PufC/ms5bZuXuIBdgP0vpEtxL95znvXgfcU2rJc+8YosXRv
 RAKjRi37c9NCtlS/n3DEbZbjJkQxnZ0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-TjogNH-SMXShLtKNq3pC3g-1; Mon, 29 Jun 2026 09:36:47 -0400
X-MC-Unique: TjogNH-SMXShLtKNq3pC3g-1
X-Mimecast-MFC-AGG-ID: TjogNH-SMXShLtKNq3pC3g_1782740206
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-49246459bc4so24995185e9.2
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2026 06:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782740206; x=1783345006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dYTTV9TjkG/+IdI3+8N4Jcda4sBwtPZ3h/J56YePBFI=;
 b=PrKFqYe++B8OIzYQWncuiHY4MekLFnAXYls7k9UKKRSW3bZAhZyDPLQNOAfP0RHb8t
 R/S8Fg2QBKetFuLCqKxiSwdLCKIr6m0ZGyEBaWfqRMM08N4ftWY+1Pnf0Fndp5wfXflH
 Jhpe47kWRX3lHiq3/qTPp+p7RAmEptMahCB32sh/bsE+f2kyfGL5ilzlKHCewsIY1k4z
 5RD3549rSExejzQHmDc4ALWpWmDTlmX3eUcqlAPHUgMIyaVsZ5wt3oVHLpTMTfCFWrpo
 7wcJviCrVmlBji7bio+cYMr+wz58M8XOmZZp77/Zq1xl51y8nBC2H3YNAe3DAumyeVR6
 zp8A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+R1ftTeDZ7j3Y+PoxzHfxo0q1s2T17MImxyfFg3AGTJR4kJZq0D1qGZlHFaNODNW8oOtwJUalktA==@nongnu.org
X-Gm-Message-State: AOJu0YxpqueTwW2Ed60Jart8tFRVcuZuxH0aely5+ArJ3Egl4baDHcdG
 D+ArBscH86EJc6xgFgNl0MZUU/Rx3uywXF3y9gbNcJrvXUQYJ2ezfqHZngRe0jiGFc0+RttzLI+
 7/YDNI+o97r+mmUXZ6zkx2+xn+LXPa9fPwXhguTA9QQeXMx7pGENQEg==
X-Gm-Gg: AfdE7clCZcbQ7I8WshKCuf/JEBH9d07MBc68IZ9I2wM/CbhtkapjuXfqW19O4AD+g//
 iHvPY+XjwvU0wKFdG9V4vlAlJaNLHyW6atry2uFEmlYSjQUj9slBV5YAbQWVF6ZXjCHGikMk+AW
 QDfbubN3nf4sNluD3edHPWUTLJH4S6er7Z9iVSo6N3Tp3Eeyj4Rxvsy13bqr8cHvIQOfFnBmBZT
 InehKN7R8q0kIIJnt88G/jZmn5YyoNSSVeblx/PQaJSKLs9nLdouThDfreV+w6aTLIglpPKRnlg
 KDmf0hwZSOyBgNK0xbNA8+u3EmkZ86oz2ciS11YhWLysvzBE81BsCWJwRRBWfgy2V0RGsmc=
X-Received: by 2002:a05:600c:c83:b0:490:e196:eaee with SMTP id
 5b1f17b1804b1-493b7197579mr13933145e9.10.1782740205825; 
 Mon, 29 Jun 2026 06:36:45 -0700 (PDT)
X-Received: by 2002:a05:600c:c83:b0:490:e196:eaee with SMTP id
 5b1f17b1804b1-493b7197579mr13932545e9.10.1782740205326; 
 Mon, 29 Jun 2026 06:36:45 -0700 (PDT)
Received: from imammedo ([213.175.46.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-472bca3caccsm15345909f8f.33.2026.06.29.06.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 06:36:44 -0700 (PDT)
Date: Mon, 29 Jun 2026 15:36:42 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eauger@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, rad@semihalf.com, leif.lindholm@oss.qualcomm.com,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v3 04/17] arm: virt: create sbsa-gwdt watchdog
Message-ID: <20260629153642.14ce960e@imammedo>
In-Reply-To: <db203d86-7280-4210-8640-e94c9f11f9da@redhat.com>
References: <20260624102830.1355552-1-imammedo@redhat.com>
 <20260624102830.1355552-5-imammedo@redhat.com>
 <db203d86-7280-4210-8640-e94c9f11f9da@redhat.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XHiKXJ33iPnmUCEQd2P133_X6GyD7uO2sJsDFMQTBqo_1782740206
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 29 Jun 2026 10:37:59 +0200
Eric Auger <eauger@redhat.com> wrote:

> Hi Igor,
> 
> On 6/24/26 12:28 PM, Igor Mammedov wrote:
> > Allow to use SBSA generic watchdog with virt machine type.
> > (includes conditional generation of corresponding FDT and
> > ACPI GTDT descriptors)
> > 
> > Use '-device sbsa-gwdt' to command line to enable it.
> > 
> > Instead of using dynamic sysbus infra to wire up MMIO/IRQ/FDT,
> > statically assign resources in machine's mem/irq maps and wire
> > them up at device (pre_)plug handlers. It's similar to dynamic
> > sysbus wiring, modulo resources are nailed down statically,
> > and wiring is limited to virt machine only.
> > (Benefit is that tests don't break anymore on rebase due to
> > address being stable)
> > 
> > Tested with Fedora 43:
> >   FDT: -M virt,acpi=off -device sbsa-gwdt
> >   ACPI: -M virt -device sbsa-gwdt
> > 
> > Note:
> > Windows sees GTDT, initializes watchdog but instead pinging WRR
> > it sets/advances WOR to way too large value, so it's never going
> > to trigger watchdog reboot (it's Windows driver issue though).
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > v3:
> >   - (Eric) assign MMIO/IRQ statically and abandon most of
> >      dynamic sysbus machinery.
> >   - (Peter) set watchdog freq to system clock explicitly,
> >     machine version compat won't work in case host is not runing
> >     1GHz clock. (Tested on Jetson machine)
> > ---
> >  include/hw/arm/virt.h    |  3 +++
> >  hw/arm/Kconfig           |  1 +
> >  hw/arm/virt-acpi-build.c | 29 +++++++++++++++++++++++++++--
> >  hw/arm/virt.c            | 37 +++++++++++++++++++++++++++++++++++++
> >  hw/core/sysbus-fdt.c     |  2 ++
> >  hw/watchdog/sbsa_gwdt.c  |  1 +
> >  6 files changed, 71 insertions(+), 2 deletions(-)
> > 
[...]
> > @@ -3820,6 +3824,10 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
> >          qlist_append_str(reserved_regions, resv_prop_str);
> >          qdev_prop_set_array(dev, "reserved-regions", reserved_regions);
> >          g_free(resv_prop_str);
> > +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_WDT_SBSA)) {
> > +        uint64_t cntfrq = object_property_get_int(OBJECT(qemu_get_cpu(0)),
> > +                                                  "cntfrq", &error_abort);  
> missing extra line.
> > +        qdev_prop_set_uint64(dev, "clock-frequency", cntfrq);  
> 
> Can you explain why you cannot do that in virt_machine_device_plug_cb()?

sure,
all prep work, typically is done at pre_plug time. (it's stage we are allowed to fail)

While at plug time we typically do final (post realize) wiring/exposing model to guest
(no allowed to fail (I need to do cleanup and remove errp from all plug handlers
but that is orthogonal to series))

> >      } else if (object_dynamic_cast(OBJECT(dev), TYPE_ARM_SMMUV3)) {
> >          if (vms->legacy_smmuv3_present || vms->iommu == VIRT_IOMMU_VIRTIO) {
> >              error_setg(errp, "virt machine already has %s set. "
[...]

> > diff --git a/hw/watchdog/sbsa_gwdt.c b/hw/watchdog/sbsa_gwdt.c
> > index acb970e8b3..c4dd8005b7 100644
> > --- a/hw/watchdog/sbsa_gwdt.c
> > +++ b/hw/watchdog/sbsa_gwdt.c
> > @@ -285,6 +285,7 @@ static void wdt_sbsa_gwdt_class_init(ObjectClass *klass, const void *data)
> >      dc->realize = wdt_sbsa_gwdt_realize;
> >      device_class_set_legacy_reset(dc, wdt_sbsa_gwdt_reset);
> >      dc->hotpluggable = false;
> > +    dc->user_creatable = true;
> >      set_bit(DEVICE_CATEGORY_WATCHDOG, dc->categories);
> >      dc->vmsd = &vmstate_sbsa_gwdt;
> >      dc->desc = "SBSA-compliant generic watchdog device";  
> You may document somewhere that the device can be dynamically
> instantiated, in machvirt alone and this required machine specific
> hardwiring.

Any suggestion wrt where to put it? 

> 
> Thanks
> 
> Eric
> 



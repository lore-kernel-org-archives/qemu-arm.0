Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D662C43602
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Jul 2026 13:25:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weuvq-0000au-A1; Wed, 01 Jul 2026 09:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1weuvn-0000aD-Ow
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 09:24:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1weuvm-0008Mw-6W
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 09:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782912285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iE2JEhnO/I/lqN4rAOeaAOhpFG1qhFc2ftW1ETZhFDU=;
 b=OPMge9wSj9y61jbsrKrYOxhe6uvZO+Ox7I2c/+CdpYWf2nxKH7mn2Z28LkEXw9HaSBnjF9
 q3M8q1YPA2FkWS3wNPRqAiqhjmzCZ41mVbZtS4ZEkkgw1Fh1Z+65L/dswE5ZRw/Ut4GJys
 MP9WrkyiVdx8Dkpfff8X9Q/52EM/Rss=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-HH5Qn_RqOimkyQNAKvKKCw-1; Wed, 01 Jul 2026 09:24:41 -0400
X-MC-Unique: HH5Qn_RqOimkyQNAKvKKCw-1
X-Mimecast-MFC-AGG-ID: HH5Qn_RqOimkyQNAKvKKCw_1782912281
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-493a5d7eaedso5751775e9.2
 for <qemu-arm@nongnu.org>; Wed, 01 Jul 2026 06:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782912281; x=1783517081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iE2JEhnO/I/lqN4rAOeaAOhpFG1qhFc2ftW1ETZhFDU=;
 b=rgOt4gbpXJkqtIeQTj2Q2kVXlHJna8CpRX6vIb5S8tx7dRNPTD7hfxj0ar+AsnjVDF
 ONMS//X5iXngCm/t/iLN4/p1Zd5sBtkaSBjc5riLi35PysU3KZ9V7rBmd2jenol+iXzn
 K5ifgmB8j6FY+A0kWOodC+f770zvr+7TYAg+D/sLDOEAr6JiHEA8frjcCBIMv7Rtpl8b
 Bf9aZKrdijSnpQp6cdlrpQcIcG59XYSQgWPRqJ3RWc9To7bsnD9Tx+LnF2/3n2G8Eqo6
 RQHZx8J1FXEUnmeAPF7l0ihUNQ/jv5uyYiv21225/mrf5UcZC8gtCqe+fAkaLwRNXu9s
 vD8w==
X-Forwarded-Encrypted: i=1;
 AFNElJ+pZoTZso40yFTQOoqJYagpTYn+g2SqvODUF9iFsVkawJA8K1jzrnWxTU0MczIjFxJoVTAq85gRVQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx2Bc80Qf6PBY6CpABFuWvSjKUZRhQm1b1BmRe6GgmmA//j3mt3
 0/CNrf+ZLE79qnvoYRzuOzxuEl0yctHvkBCqGwe0RqLhstBGAZC/dL6KiIc1zQtrIGRBcNcwxMS
 cYJa1Uu6ALk/b7brvhrU7GNchx09S5mHARX1jY3P2b+ZjWALJG4Lt4A==
X-Gm-Gg: AfdE7clsPa6viN4SF87QFgWIICAwAvWopvxboDT3e63av6Piki/7yP6mb2mVWkZemJT
 gWVT/UbTLOKb+5lTDjjCKABZ1MU4uWkPn+J2SUb30KVylARqN/ZWpG55ViTRQvfNZClIGLwwfEV
 b5hmgSHUKPXoKqeZtGPVB5FPEuoNWPkWnSTuzdBnEgDtj+vxVFDTPW8eaCBj0cbBUYLwE8Ojepq
 NQ75v0tOggze/Zt9Lmg4XKkRVuYjdhvbIrP0RP0u40PYHwkzor86G+W7Um4RZEkDEnoqyb1PmhX
 QQlqHLv3Kt4aQcPfYRGttEd3hlg4FnCU1TFTjx9tlLLOGz5ZQzeXISL98B733dFhTzLupAE=
X-Received: by 2002:a05:600c:c3cd:10b0:493:b7c8:6530 with SMTP id
 5b1f17b1804b1-493c2b56d6dmr19890925e9.16.1782912280634; 
 Wed, 01 Jul 2026 06:24:40 -0700 (PDT)
X-Received: by 2002:a05:600c:c3cd:10b0:493:b7c8:6530 with SMTP id
 5b1f17b1804b1-493c2b56d6dmr19890575e9.16.1782912280190; 
 Wed, 01 Jul 2026 06:24:40 -0700 (PDT)
Received: from imammedo ([213.175.46.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493bef248b7sm38973925e9.2.2026.07.01.06.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2026 06:24:39 -0700 (PDT)
Date: Wed, 1 Jul 2026 15:24:36 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eauger@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, rad@semihalf.com, leif.lindholm@oss.qualcomm.com,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v3 04/17] arm: virt: create sbsa-gwdt watchdog
Message-ID: <20260701152436.57e89060@imammedo>
In-Reply-To: <ffffe2fc-a2fd-445a-876a-dddd1f1cc798@redhat.com>
References: <20260624102830.1355552-1-imammedo@redhat.com>
 <20260624102830.1355552-5-imammedo@redhat.com>
 <db203d86-7280-4210-8640-e94c9f11f9da@redhat.com>
 <20260629153642.14ce960e@imammedo>
 <ffffe2fc-a2fd-445a-876a-dddd1f1cc798@redhat.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DqDnuTXVRVN_BdFopu6XibDA66R4NB_2QOwXggl0bO0_1782912281
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Wed, 1 Jul 2026 13:57:28 +0200
Eric Auger <eauger@redhat.com> wrote:

> On 6/29/26 3:36 PM, Igor Mammedov wrote:
> > On Mon, 29 Jun 2026 10:37:59 +0200
> > Eric Auger <eauger@redhat.com> wrote:
> >   
> >> Hi Igor,
> >>
> >> On 6/24/26 12:28 PM, Igor Mammedov wrote:  
> >>> Allow to use SBSA generic watchdog with virt machine type.
> >>> (includes conditional generation of corresponding FDT and
> >>> ACPI GTDT descriptors)
> >>>
> >>> Use '-device sbsa-gwdt' to command line to enable it.
> >>>
> >>> Instead of using dynamic sysbus infra to wire up MMIO/IRQ/FDT,
> >>> statically assign resources in machine's mem/irq maps and wire
> >>> them up at device (pre_)plug handlers. It's similar to dynamic
> >>> sysbus wiring, modulo resources are nailed down statically,
> >>> and wiring is limited to virt machine only.
> >>> (Benefit is that tests don't break anymore on rebase due to
> >>> address being stable)
> >>>
> >>> Tested with Fedora 43:
> >>>   FDT: -M virt,acpi=off -device sbsa-gwdt
> >>>   ACPI: -M virt -device sbsa-gwdt
> >>>
> >>> Note:
> >>> Windows sees GTDT, initializes watchdog but instead pinging WRR
> >>> it sets/advances WOR to way too large value, so it's never going
> >>> to trigger watchdog reboot (it's Windows driver issue though).
> >>>
> >>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> >>> ---
> >>> v3:
> >>>   - (Eric) assign MMIO/IRQ statically and abandon most of
> >>>      dynamic sysbus machinery.
> >>>   - (Peter) set watchdog freq to system clock explicitly,
> >>>     machine version compat won't work in case host is not runing
> >>>     1GHz clock. (Tested on Jetson machine)
> >>> ---
> >>>  include/hw/arm/virt.h    |  3 +++
> >>>  hw/arm/Kconfig           |  1 +
> >>>  hw/arm/virt-acpi-build.c | 29 +++++++++++++++++++++++++++--
> >>>  hw/arm/virt.c            | 37 +++++++++++++++++++++++++++++++++++++
> >>>  hw/core/sysbus-fdt.c     |  2 ++
> >>>  hw/watchdog/sbsa_gwdt.c  |  1 +
> >>>  6 files changed, 71 insertions(+), 2 deletions(-)
> >>>  
> > [...]  
> >>> @@ -3820,6 +3824,10 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
> >>>          qlist_append_str(reserved_regions, resv_prop_str);
> >>>          qdev_prop_set_array(dev, "reserved-regions", reserved_regions);
> >>>          g_free(resv_prop_str);
> >>> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_WDT_SBSA)) {
> >>> +        uint64_t cntfrq = object_property_get_int(OBJECT(qemu_get_cpu(0)),
> >>> +                                                  "cntfrq", &error_abort);    
> >> missing extra line.  
> >>> +        qdev_prop_set_uint64(dev, "clock-frequency", cntfrq);    
> >>
> >> Can you explain why you cannot do that in virt_machine_device_plug_cb()?  
> > 
> > sure,
> > all prep work, typically is done at pre_plug time. (it's stage we are allowed to fail)
> > 
> > While at plug time we typically do final (post realize) wiring/exposing model to guest
> > (no allowed to fail (I need to do cleanup and remove errp from all plug handlers
> > but that is orthogonal to series))
> >   
> >>>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_ARM_SMMUV3)) {
> >>>          if (vms->legacy_smmuv3_present || vms->iommu == VIRT_IOMMU_VIRTIO) {
> >>>              error_setg(errp, "virt machine already has %s set. "  
> OK
> > [...]
> >   
> >>> diff --git a/hw/watchdog/sbsa_gwdt.c b/hw/watchdog/sbsa_gwdt.c
> >>> index acb970e8b3..c4dd8005b7 100644
> >>> --- a/hw/watchdog/sbsa_gwdt.c
> >>> +++ b/hw/watchdog/sbsa_gwdt.c
> >>> @@ -285,6 +285,7 @@ static void wdt_sbsa_gwdt_class_init(ObjectClass *klass, const void *data)
> >>>      dc->realize = wdt_sbsa_gwdt_realize;
> >>>      device_class_set_legacy_reset(dc, wdt_sbsa_gwdt_reset);
> >>>      dc->hotpluggable = false;
> >>> +    dc->user_creatable = true;
> >>>      set_bit(DEVICE_CATEGORY_WATCHDOG, dc->categories);
> >>>      dc->vmsd = &vmstate_sbsa_gwdt;
> >>>      dc->desc = "SBSA-compliant generic watchdog device";    
> >> You may document somewhere that the device can be dynamically
> >> instantiated, in machvirt alone and this required machine specific
> >> hardwiring.  
> > 
> > Any suggestion wrt where to put it?   
> 
> At least you need to update system/arm/virt.rst with the new support of
> the sbsa-gwdt device.
done


> wrt the fact dt bindings are not created by default I would add least
> add a comment above dc->user_creatable = true;
> saying it requires manual dt bindings in the machine that uses it.
will do once I'm done with retesting,

I plan to respin today without last 4 patches.
They are  basically independed fixes for native gwdt for windows
and are pre-existing issue (that would affect not only arm/virt but also current sbsa machine)

And then I'll spin off those 4 patches separately.
 
> Thanks
> 
> Eric
> 
> >   
> >>
> >> Thanks
> >>
> >> Eric
> >>  
> >   
> 



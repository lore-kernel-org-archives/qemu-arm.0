Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3152784lfm;
        Mon, 22 Jun 2020 05:48:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYDO/HuLtV/Kz4oPsApiMhX6eDqlsxLjIe3UTSDnoMVNLMtK+gwNrdrXKY8wX06/9Rfwpu
X-Received: by 2002:a5b:307:: with SMTP id j7mr25982113ybp.292.1592830083103;
        Mon, 22 Jun 2020 05:48:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592830083; cv=none;
        d=google.com; s=arc-20160816;
        b=sBhtNtJbCkd9VJkKd81/0szFR9F2flexLHXsJq02xB+0AyJsjoZ/UW7FMZTc073qy/
         oZEEluMsJQn2uT3CEKottW+TwuZh1DLiR1bbVKCFnWLLbTj5RDigi7B6MOWtn7/j/o1M
         dSaZ7XSO8h4hLkjueBs6Tg9YiTU+m6UbvbI7PbpMi/pgePYITmQ9mxrVSTZ+2iplye4T
         MXMh5l5j01S6sNtgIG1u+2j+sanqtwv9knrGSi0eACpTMT8DgGi96b4SIAODAqLmu6Fh
         cqHHys9xW0wZLB0iclpMFkHbHIXuWCKTHGDMQmQblMR9Mu++Qwwz0FucvR7+SgWLCobQ
         EGPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=EhoxS32sOUMZqqfgEyzb+R8KJAk4qwgunGRXSB0OG2U=;
        b=umn7vQTWY47bRFjS1vTyjbXVF6OPSXnNDibBC2LKdDhyQOKhj9do4/+UNYK7w1G9Sp
         DzqYxdDO8dHpQcgPKUTQvDpmPZ7C+MpC1P+wahYGsIy0UBtG7aWGqR5957zOK3NmpdCV
         3Mk3Q1acUxfJz8kj8vrfKPh/t4jzlWLowQevTEgRJc+spraujgluU9WsyNCaxTGTDPkC
         XJ+0AqYYVmYjVORFDZ6MZGKv5GI2XrM45ljlwS+uOwpym8awY8akxbjUKYfApvcxRkIm
         J9dFSIXYqgS2VfUlKAjfdF/D3T9isxvYM0UP70tQ4CCjGJQGu1ck6YqYWNh3y50u4RuF
         VvVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hHC4aNQb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x16si15484469ybk.399.2020.06.22.05.48.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jun 2020 05:48:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hHC4aNQb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnLrm-0005fN-D5
	for alex.bennee@linaro.org; Mon, 22 Jun 2020 08:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jnLrd-0005cN-9Q
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 08:47:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50659
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jnLra-0004FG-K7
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 08:47:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592830069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EhoxS32sOUMZqqfgEyzb+R8KJAk4qwgunGRXSB0OG2U=;
 b=hHC4aNQbo6PpROLoj1bSLb/E8kxxv6pe4mhyu2SKaRmLDNKcLUyEcvB4/rbFHxWV7Zgk/W
 f+I+qyCD9DDrhpiEZW6/ZbFV/1CgL3yZPjC9jK7u6pbNu9yLX/3CI+njnADHccyvv5Yy0Z
 DueRLGsW6g4YKr70taxqagi5YVZvU1U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-VwoxCQP8N0O6YQkkezV_mQ-1; Mon, 22 Jun 2020 08:47:45 -0400
X-MC-Unique: VwoxCQP8N0O6YQkkezV_mQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8470018585A1;
 Mon, 22 Jun 2020 12:47:43 +0000 (UTC)
Received: from [10.36.114.197] (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C113C10013D7;
 Mon, 22 Jun 2020 12:47:37 +0000 (UTC)
Subject: Re: [PATCH 16/22] hw: Fix error API violation around
 object_property_set_link()
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200622104250.1404835-1-armbru@redhat.com>
 <20200622104250.1404835-17-armbru@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <de8aa426-36cb-0ed4-3208-42b3f2939575@redhat.com>
Date: Mon, 22 Jun 2020 14:47:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200622104250.1404835-17-armbru@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 02:57:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8XyN8QzGBEm8

Hi Markus,
On 6/22/20 12:42 PM, Markus Armbruster wrote:
> The Error ** argument must be NULL, &error_abort, &error_fatal, or a
> pointer to a variable containing NULL.  Passing an argument of the
> latter kind twice without clearing it in between is wrong: if the
> first call sets an error, it no longer points to NULL for the second
> call.
> 
> virtio_gpu_pci_base_realize(), virtio_vga_base_realize(),
> sparc32_ledma_device_realize(), sparc32_dma_realize(),
> sparc32_dma_realize() xilinx_axidma_realize(), mips_cps_realize(),
> macio_realize_ide(), xilinx_enet_realize(), and
> virtio_iommu_pci_realize() are wrong that way: they reuse the argument
> they pass to object_property_set_link() for another call.
> 
> Harmless, because object_property_set_link() can't actually fail for
> them: it fails when the property doesn't exist, is not settable, or
> its .check() method fails.  Fix by passing &error_abort instead.
s/.check/.set()? in object_property_set()
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> Cc: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric


> ---
>  hw/display/virtio-gpu-pci.c  |  2 +-
>  hw/display/virtio-vga.c      |  2 +-
>  hw/dma/sparc32_dma.c         |  6 +++---
>  hw/dma/xilinx_axidma.c       | 12 ++----------
>  hw/mips/cps.c                |  6 ++++--
>  hw/misc/macio/macio.c        |  3 ++-
>  hw/net/xilinx_axienet.c      | 12 ++----------
>  hw/virtio/virtio-iommu-pci.c |  2 +-
>  8 files changed, 16 insertions(+), 29 deletions(-)
> 
> diff --git a/hw/display/virtio-gpu-pci.c b/hw/display/virtio-gpu-pci.c
> index b532fe8b5f..41b88b878d 100644
> --- a/hw/display/virtio-gpu-pci.c
> +++ b/hw/display/virtio-gpu-pci.c
> @@ -44,7 +44,7 @@ static void virtio_gpu_pci_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>      for (i = 0; i < g->conf.max_outputs; i++) {
>          object_property_set_link(OBJECT(g->scanout[i].con),
>                                   OBJECT(vpci_dev),
> -                                 "device", errp);
> +                                 "device", &error_abort);
>      }
>  }
>  
> diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
> index 68a062ece6..67f409e106 100644
> --- a/hw/display/virtio-vga.c
> +++ b/hw/display/virtio-vga.c
> @@ -154,7 +154,7 @@ static void virtio_vga_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>      for (i = 0; i < g->conf.max_outputs; i++) {
>          object_property_set_link(OBJECT(g->scanout[i].con),
>                                   OBJECT(vpci_dev),
> -                                 "device", errp);
> +                                 "device", &error_abort);
>      }
>  }
>  
> diff --git a/hw/dma/sparc32_dma.c b/hw/dma/sparc32_dma.c
> index f02aca6f40..2d7dbbb92d 100644
> --- a/hw/dma/sparc32_dma.c
> +++ b/hw/dma/sparc32_dma.c
> @@ -346,7 +346,7 @@ static void sparc32_ledma_device_realize(DeviceState *dev, Error **errp)
>      d = qdev_new(TYPE_LANCE);
>      object_property_add_child(OBJECT(dev), "lance", OBJECT(d));
>      qdev_set_nic_properties(d, nd);
> -    object_property_set_link(OBJECT(d), OBJECT(dev), "dma", errp);
> +    object_property_set_link(OBJECT(d), OBJECT(dev), "dma", &error_abort);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(d), &error_fatal);
>  }
>  
> @@ -379,7 +379,7 @@ static void sparc32_dma_realize(DeviceState *dev, Error **errp)
>      }
>  
>      espdma = qdev_new(TYPE_SPARC32_ESPDMA_DEVICE);
> -    object_property_set_link(OBJECT(espdma), iommu, "iommu", errp);
> +    object_property_set_link(OBJECT(espdma), iommu, "iommu", &error_abort);
>      object_property_add_child(OBJECT(s), "espdma", OBJECT(espdma));
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(espdma), &error_fatal);
>  
> @@ -394,7 +394,7 @@ static void sparc32_dma_realize(DeviceState *dev, Error **errp)
>                                  sysbus_mmio_get_region(sbd, 0));
>  
>      ledma = qdev_new(TYPE_SPARC32_LEDMA_DEVICE);
> -    object_property_set_link(OBJECT(ledma), iommu, "iommu", errp);
> +    object_property_set_link(OBJECT(ledma), iommu, "iommu", &error_abort);
>      object_property_add_child(OBJECT(s), "ledma", OBJECT(ledma));
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(ledma), &error_fatal);
>  
> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> index 6a9df2c4db..a069637bf2 100644
> --- a/hw/dma/xilinx_axidma.c
> +++ b/hw/dma/xilinx_axidma.c
> @@ -537,7 +537,6 @@ static void xilinx_axidma_realize(DeviceState *dev, Error **errp)
>      XilinxAXIDMAStreamSlave *ds = XILINX_AXI_DMA_DATA_STREAM(&s->rx_data_dev);
>      XilinxAXIDMAStreamSlave *cs = XILINX_AXI_DMA_CONTROL_STREAM(
>                                                              &s->rx_control_dev);
> -    Error *local_err = NULL;
>      int i;
>  
>      object_property_add_link(OBJECT(ds), "dma", TYPE_XILINX_AXI_DMA,
> @@ -548,11 +547,8 @@ static void xilinx_axidma_realize(DeviceState *dev, Error **errp)
>                               (Object **)&cs->dma,
>                               object_property_allow_set_link,
>                               OBJ_PROP_LINK_STRONG);
> -    object_property_set_link(OBJECT(ds), OBJECT(s), "dma", &local_err);
> -    object_property_set_link(OBJECT(cs), OBJECT(s), "dma", &local_err);
> -    if (local_err) {
> -        goto xilinx_axidma_realize_fail;
> -    }
> +    object_property_set_link(OBJECT(ds), OBJECT(s), "dma", &error_abort);
> +    object_property_set_link(OBJECT(cs), OBJECT(s), "dma", &error_abort);
>  
>      for (i = 0; i < 2; i++) {
>          struct Stream *st = &s->streams[i];
> @@ -567,10 +563,6 @@ static void xilinx_axidma_realize(DeviceState *dev, Error **errp)
>  
>      address_space_init(&s->as,
>                         s->dma_mr ? s->dma_mr : get_system_memory(), "dma");
> -    return;
> -
> -xilinx_axidma_realize_fail:
> -    error_propagate(errp, local_err);
>  }
>  
>  static void xilinx_axidma_init(Object *obj)
> diff --git a/hw/mips/cps.c b/hw/mips/cps.c
> index cdfab19826..5382bc86f7 100644
> --- a/hw/mips/cps.c
> +++ b/hw/mips/cps.c
> @@ -150,8 +150,10 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
>      object_property_set_int(OBJECT(&s->gcr), s->num_vp, "num-vp", &err);
>      object_property_set_int(OBJECT(&s->gcr), 0x800, "gcr-rev", &err);
>      object_property_set_int(OBJECT(&s->gcr), gcr_base, "gcr-base", &err);
> -    object_property_set_link(OBJECT(&s->gcr), OBJECT(&s->gic.mr), "gic", &err);
> -    object_property_set_link(OBJECT(&s->gcr), OBJECT(&s->cpc.mr), "cpc", &err);
> +    object_property_set_link(OBJECT(&s->gcr), OBJECT(&s->gic.mr), "gic",
> +                             &error_abort);
> +    object_property_set_link(OBJECT(&s->gcr), OBJECT(&s->cpc.mr), "cpc",
> +                             &error_abort);
>      sysbus_realize(SYS_BUS_DEVICE(&s->gcr), &err);
>      if (err != NULL) {
>          error_propagate(errp, err);
> diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
> index 8ba7af073c..3251c79f46 100644
> --- a/hw/misc/macio/macio.c
> +++ b/hw/misc/macio/macio.c
> @@ -136,7 +136,8 @@ static void macio_realize_ide(MacIOState *s, MACIOIDEState *ide,
>      sysbus_connect_irq(sysbus_dev, 0, irq0);
>      sysbus_connect_irq(sysbus_dev, 1, irq1);
>      qdev_prop_set_uint32(DEVICE(ide), "channel", dmaid);
> -    object_property_set_link(OBJECT(ide), OBJECT(&s->dbdma), "dbdma", errp);
> +    object_property_set_link(OBJECT(ide), OBJECT(&s->dbdma), "dbdma",
> +                             &error_abort);
>      macio_ide_register_dma(ide);
>  
>      qdev_realize(DEVICE(ide), BUS(&s->macio_bus), errp);
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index c2f40b8ea9..679a359f9a 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -980,7 +980,6 @@ static void xilinx_enet_realize(DeviceState *dev, Error **errp)
>      XilinxAXIEnetStreamSlave *ds = XILINX_AXI_ENET_DATA_STREAM(&s->rx_data_dev);
>      XilinxAXIEnetStreamSlave *cs = XILINX_AXI_ENET_CONTROL_STREAM(
>                                                              &s->rx_control_dev);
> -    Error *local_err = NULL;
>  
>      object_property_add_link(OBJECT(ds), "enet", "xlnx.axi-ethernet",
>                               (Object **) &ds->enet,
> @@ -990,11 +989,8 @@ static void xilinx_enet_realize(DeviceState *dev, Error **errp)
>                               (Object **) &cs->enet,
>                               object_property_allow_set_link,
>                               OBJ_PROP_LINK_STRONG);
> -    object_property_set_link(OBJECT(ds), OBJECT(s), "enet", &local_err);
> -    object_property_set_link(OBJECT(cs), OBJECT(s), "enet", &local_err);
> -    if (local_err) {
> -        goto xilinx_enet_realize_fail;
> -    }
> +    object_property_set_link(OBJECT(ds), OBJECT(s), "enet", &error_abort);
> +    object_property_set_link(OBJECT(cs), OBJECT(s), "enet", &error_abort);
>  
>      qemu_macaddr_default_if_unset(&s->conf.macaddr);
>      s->nic = qemu_new_nic(&net_xilinx_enet_info, &s->conf,
> @@ -1008,10 +1004,6 @@ static void xilinx_enet_realize(DeviceState *dev, Error **errp)
>  
>      s->rxmem = g_malloc(s->c_rxmem);
>      s->txmem = g_malloc(s->c_txmem);
> -    return;
> -
> -xilinx_enet_realize_fail:
> -    error_propagate(errp, local_err);
>  }
>  
>  static void xilinx_enet_init(Object *obj)
> diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
> index 632533abaf..bd61d6e2f8 100644
> --- a/hw/virtio/virtio-iommu-pci.c
> +++ b/hw/virtio/virtio-iommu-pci.c
> @@ -56,7 +56,7 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>      }
>      object_property_set_link(OBJECT(dev),
>                               OBJECT(pci_get_bus(&vpci_dev->pci_dev)),
> -                             "primary-bus", errp);
> +                             "primary-bus", &error_abort);
>      qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
>  }
>  
> 


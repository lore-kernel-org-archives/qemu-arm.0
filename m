Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3996966lfg;
        Mon, 22 Mar 2021 15:36:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyqV2UDEANlt6HXR3N18Jta7rW/1/v6L464LYPmKlQBgcKkiiWIjnfzezHoX1luN4yXh3i
X-Received: by 2002:a05:6602:2355:: with SMTP id r21mr1635851iot.62.1616452577823;
        Mon, 22 Mar 2021 15:36:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616452577; cv=none;
        d=google.com; s=arc-20160816;
        b=v/wF6ntKRE57eZN0apXQB5XeGsDR/HFOr+NrTIB2Aq7kAYoBCilFDzUCvHFIF01wvf
         a4s1GAxAOSKxzkYpCHslQX4wtxjJ/lE8FplZSvXsHhpgysOc3g7CCTVlFs43RfochVHR
         ILZDzFjabEipwcrBhxLzPRagiuav6DUFkdKKUH7UhHxZ7jzhqBVMh4A7yLi5C6mTHDKv
         MMl4GjRkgcw6l+c0gIAiiizwaaymfs/Wgn7jQpt84nc7NfVHbGYFWStBq9ibxyAIH5fQ
         QrrgzNHsIGlvNwjp6lB6fQ/WCDGRchw7nb9ZMHAU4EKVvEQhGE8DrN2da1YRlkwggoUr
         ijqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=QuaXJQGU7xRevn41itaezuZ1ET1Lx0cq3YRMTZ4tkE8=;
        b=vx4oVDWTp88c/IbFlWFfjG72QM/ZkfnPgKLxXgzuy+722z/mtbBeZepx1HmSq0maqG
         1nE/hBzlQ2ts+FL4SLid3mUfp2kYykhW1NjQ82twgtRJagImAWS5jRCNmzzkO3asGZla
         MhdsEyfWR9cZAOtP3uElE91YyyIiLvOKBO2kt+rciP1037BF1//SO7Wf4wIQoecAuyLh
         WqcTow2rKjoB4NDaFAQzsiyCEWOUtj8B6zw4qFqjI8Rf47nI7iqNZpTt4m6g9wP7EGNZ
         hVW7x5fx6qQrk1iUTDnMBEaBjfEKqa+Es/JOL6ukOyg7/GVlxhXk/w4H10CNilyNBs9g
         pTWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c6RppT0Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9si10952962jak.86.2021.03.22.15.36.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Mar 2021 15:36:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c6RppT0Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lOT9l-0003jE-5X
	for alex.bennee@linaro.org; Mon, 22 Mar 2021 18:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOT91-0003go-Ss
 for qemu-arm@nongnu.org; Mon, 22 Mar 2021 18:35:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOT8s-0006ga-EZ
 for qemu-arm@nongnu.org; Mon, 22 Mar 2021 18:35:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616452520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QuaXJQGU7xRevn41itaezuZ1ET1Lx0cq3YRMTZ4tkE8=;
 b=c6RppT0Qj3yRGc0b86ygiUEXPf2Wdy+ZUj+n4ztt3eh60wIiCrG44NRENSrla20l2X0AWZ
 tiiKQlbPpL95pcmUiPlkF3UP89rQxVRuGSsF24ODfJ6iFNKM7cp3ygMHxdIDOrwMksixjz
 6hq8cm8ChzAbmPmU+iI+1hJKNg6MVt4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-KzPI8eE4MTOli5n0K0lRjw-1; Mon, 22 Mar 2021 18:35:17 -0400
X-MC-Unique: KzPI8eE4MTOli5n0K0lRjw-1
Received: by mail-wr1-f71.google.com with SMTP id m23so128068wrh.7
 for <qemu-arm@nongnu.org>; Mon, 22 Mar 2021 15:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QuaXJQGU7xRevn41itaezuZ1ET1Lx0cq3YRMTZ4tkE8=;
 b=WcnY/HhhEbFy5cY5j2xtUarGx1kb4kdWubsDtM3OfJZcIUxkuApFsAtZ2XNOICjvTh
 BvbDTMg6oh6HysXsNZwKs3OOtqj5tuNZkTYSQhj2TX+XSgKeS03eOJrC7kyZ8AFnBCwX
 3OIn8idFw1XI0ygK2oVSGkebRWZk4xWO6UczvwAfpXLOx5RVuHuYnN5yTE/gAJ44CRkk
 PFTfE4iEMTQnChIx5cDcPOJHOPyBTdmxHJcf6M9d/nilnmXoPLYfrZwIYrWn7FJ5C/8h
 wC9OXYUscP1R1EHrI9EXQHgTOQ08pxombJwUDoaCZ3gr3rkuAutOeDrG3c7VIUPzXn76
 OpuA==
X-Gm-Message-State: AOAM533TS/HXTXd77riXl27A/6ER1l6xr6GD2HBn9dSCV5xIWSz399Hm
 dgnDcmvrWP8H4ND3UBOL4Y+lezJF3AoRWeO0ncumiiART21qtKOTRNr1AyX4rO774H5HPTKc+EL
 YvZX0RzeCPYMz
X-Received: by 2002:a5d:4ac4:: with SMTP id y4mr756375wrs.86.1616452516625;
 Mon, 22 Mar 2021 15:35:16 -0700 (PDT)
X-Received: by 2002:a5d:4ac4:: with SMTP id y4mr756356wrs.86.1616452516256;
 Mon, 22 Mar 2021 15:35:16 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id 7sm711278wmk.8.2021.03.22.15.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 15:35:11 -0700 (PDT)
Date: Mon, 22 Mar 2021 18:35:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/pci-host/gpex: Don't fault for unmapped parts of MMIO
 and PIO windows
Message-ID: <20210322183320-mutt-send-email-mst@kernel.org>
References: <20210322201336.9539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210322201336.9539-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Arnd Bergmann <arnd@arndb.de>,
 qemu-devel@nongnu.org, Dmitry Vyukov <dvyukov@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EZhs/LguKcAD

On Mon, Mar 22, 2021 at 08:13:36PM +0000, Peter Maydell wrote:
> Currently the gpex PCI controller implements no special behaviour for
> guest accesses to areas of the PIO and MMIO where it has not mapped
> any PCI devices, which means that for Arm you end up with a CPU
> exception due to a data abort.
> 
> Most host OSes expect "like an x86 PC" behaviour, where bad accesses
> like this return -1 for reads and ignore writes.  In the interests of
> not being surprising, make host CPU accesses to these windows behave
> as -1/discard where there's no mapped PCI device.
> 
> Reported-by: Dmitry Vyukov <dvyukov@google.com>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1918917
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

BTW it looks like launchpad butchered the lore.kernel.org
link so one can't find out what was the guest issue this is
fixing. Want to include a bit more data in the commit log
instead?

> ---
> Not convinced that this is 6.0 material, because IMHO the
> kernel shouldn't be doing this in the first place.
> Do we need to have the property machinery so that old
> virt-5.2 etc retain the previous behaviour ?
> ---
>  include/hw/pci-host/gpex.h |  2 ++
>  hw/pci-host/gpex.c         | 37 +++++++++++++++++++++++++++++++++++--
>  2 files changed, 37 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
> index d48a020a952..ad876ecd209 100644
> --- a/include/hw/pci-host/gpex.h
> +++ b/include/hw/pci-host/gpex.h
> @@ -49,6 +49,8 @@ struct GPEXHost {
>  
>      MemoryRegion io_ioport;
>      MemoryRegion io_mmio;
> +    MemoryRegion io_ioport_window;
> +    MemoryRegion io_mmio_window;
>      qemu_irq irq[GPEX_NUM_IRQS];
>      int irq_num[GPEX_NUM_IRQS];
>  };
> diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
> index 2bdbe7b4561..1f48c89ac6a 100644
> --- a/hw/pci-host/gpex.c
> +++ b/hw/pci-host/gpex.c
> @@ -82,13 +82,46 @@ static void gpex_host_realize(DeviceState *dev, Error **errp)
>      PCIExpressHost *pex = PCIE_HOST_BRIDGE(dev);
>      int i;
>  
> +    /*
> +     * Note that the MemoryRegions io_mmio and io_ioport that we pass
> +     * to pci_register_root_bus() are not the same as the
> +     * MemoryRegions io_mmio_window and io_ioport_window that we
> +     * expose as SysBus MRs. The difference is in the behaviour of
> +     * accesses to addresses where no PCI device has been mapped.
> +     *
> +     * io_mmio and io_ioport are the underlying PCI view of the PCI
> +     * address space, and when a PCI device does a bus master access
> +     * to a bad address this is reported back to it as a transaction
> +     * failure.
> +     *
> +     * io_mmio_window and io_ioport_window implement "unmapped
> +     * addresses read as -1 and ignore writes"; this is traditional
> +     * x86 PC behaviour, which is not mandated by the PCI spec proper
> +     * but expected by much PCI-using guest software, including Linux.
> +     *
> +     * In the interests of not being unnecessarily surprising, we
> +     * implement it in the gpex PCI host controller, by providing the
> +     * _window MRs, which are containers with io ops that implement
> +     * the 'background' behaviour and which hold the real PCI MRs as
> +     * subregions.
> +     */
>      pcie_host_mmcfg_init(pex, PCIE_MMCFG_SIZE_MAX);
>      memory_region_init(&s->io_mmio, OBJECT(s), "gpex_mmio", UINT64_MAX);
>      memory_region_init(&s->io_ioport, OBJECT(s), "gpex_ioport", 64 * 1024);
>  
> +    memory_region_init_io(&s->io_mmio_window, OBJECT(s),
> +                          &unassigned_io_ops, OBJECT(s),
> +                          "gpex_mmio_window", UINT64_MAX);
> +    memory_region_init_io(&s->io_ioport_window, OBJECT(s),
> +                          &unassigned_io_ops, OBJECT(s),
> +                          "gpex_ioport_window", 64 * 1024);
> +
> +    memory_region_add_subregion(&s->io_mmio_window, 0, &s->io_mmio);
> +    memory_region_add_subregion(&s->io_ioport_window, 0, &s->io_ioport);
> +
>      sysbus_init_mmio(sbd, &pex->mmio);
> -    sysbus_init_mmio(sbd, &s->io_mmio);
> -    sysbus_init_mmio(sbd, &s->io_ioport);
> +    sysbus_init_mmio(sbd, &s->io_mmio_window);
> +    sysbus_init_mmio(sbd, &s->io_ioport_window);
>      for (i = 0; i < GPEX_NUM_IRQS; i++) {
>          sysbus_init_irq(sbd, &s->irq[i]);
>          s->irq_num[i] = -1;
> -- 
> 2.20.1


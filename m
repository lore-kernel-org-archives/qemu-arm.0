Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp9392234lfc;
        Fri, 29 Nov 2019 10:45:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqxr/RlTYCPvI1S5QT+d+c74D6jwYI45wUsPQqmcSe44FqO6yCYk9Roa+TPogkREwxRgk6Oh
X-Received: by 2002:a50:8ada:: with SMTP id k26mr16018280edk.100.1575053144844;
        Fri, 29 Nov 2019 10:45:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575053144; cv=none;
        d=google.com; s=arc-20160816;
        b=H1Kvj0XuGRlmMTJGY38PPyiQ6UliZE6yPKgk8UFziaAvJ6joAxFYybqxft92EG1Gur
         MIxfliKGd4Xe7R2g9JZt0DWTKjKq2by2sg41VPA5veEmlYA/crmDr9S+T+bok3yyBm/T
         rF6KSPONb4FTe4jshNHFu4lz59LY86EFeJmjzKI/gFhP57+JHvTDEvF0Mb942qz/Ro57
         L/elmbGYL8iv4GGTEhnVHjCKnjKz1lrMww2chQBkCaNQ3gQ1kfIsINJwvmEbq9nyHyo8
         g+uYBBTwF2cfQj+5x8yY3AuWEAD7q+kJ+nDPDtC/oIOSuWm0S+UxAnaOe9M1J5j02rqU
         uUbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wbHRnIUN/EjXdUcXJtXLLT0G/6702axIE22+LsDF6bE=;
        b=lFZtCcs6XtMasEZR0Ppr1WtuZvBn+BWaIM9kNMiGV5DzPB+tAN0a2uC/1d3cIDLLd6
         NAlVZ07aeZ9pBBcxHpd0AdJeY8m2SvD6xAI2UTQgLZvgIME8i2y167iSK/FMiEiRfxhQ
         CRY9xw5AM4gUVbypgNrthzIiUxlrx3S/jgsbQoayY0g01J5lHzujcrmIo3Imy+npci+r
         hiHN+QComldnxP3euo0HdpL+MOtKK4udKpJNo5Zqd1g+8NtKWx7EPzqF6MD+7z0G5PVz
         HR1kRrJYj85Z1bP4aC44BkDzYa9d6Pq//eCR6ygppplw0NhQsaF08lpaZZGg1NwCZ8FH
         bqeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PgwRPJB0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7si17305051edj.96.2019.11.29.10.45.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2019 10:45:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PgwRPJB0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ialGv-00077h-QE
	for alex.bennee@linaro.org; Fri, 29 Nov 2019 13:45:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43198)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ialD2-0004o9-J1
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 13:41:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ialD1-0000kL-3R
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 13:41:40 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:43224)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ialD0-0000ft-Ry
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 13:41:38 -0500
Received: by mail-oi1-x244.google.com with SMTP id l20so26810745oie.10
 for <qemu-arm@nongnu.org>; Fri, 29 Nov 2019 10:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wbHRnIUN/EjXdUcXJtXLLT0G/6702axIE22+LsDF6bE=;
 b=PgwRPJB0ckpaookKsYqOYCtHRrDQaOdtter/6e6NL6CFxje4nFKXabqr3d4rymAtvT
 dXtgAC3UJLETnUflHTHYyUOYenljgpjfi3mkMC83VDUigXKnfLz0zVlUPGaxORnVVhmo
 XxExkSTTW5F1sahUGI0ZJhTGIkWR7w+IbgDSyl6qHQxXnSC0Zg9pnMHTQVNU7zixHB7Z
 xvfBmCgY7tgijriqAATlYG0sQLgOZj09Of6VwRibzBX0lkk9l6+Uzy5pPDj1abMcenIp
 5vBa4JBndqwH5Vkm2j8buvQ6rHDaY57+ASGqq0hxUqQrqCDf3ntNhx3UqTKhHbljH2BS
 75fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wbHRnIUN/EjXdUcXJtXLLT0G/6702axIE22+LsDF6bE=;
 b=Um2gTACMcp+hJMeWZsB1lB9SPBxoyjGU7GZ0YK0E4uA2Ph1huSMtFt1V/1CG4bzwJR
 H9tQ0kIi7LeeAsOCEeZVR3YZazSLrsDSQzjWcaG6r7kW0v4+cW+SX8e00jjn/yQOL977
 b6Idpl0NdDaxv7w5cxoyO+UyD4sbJ1Ia94R9qWLG26cAwNPCm3iVts+jzWqjZwZmxwLe
 BOKqBpkvu6UUk1YbhRtykUMGL87ZAsMGsTYRFD2rOW00q4v4QuIVx7YA9nNLgUzdBpLm
 BK/uPZv+IJbvrLDfpVffzB0PZUBJWWLFUZ7c1hrSg2d27GRl+RynhxxhCgEfYu7UXOqW
 h2Ag==
X-Gm-Message-State: APjAAAWXa4JdNUb80pFcCqTSDr4bKuixkzQ66gE98zlmB45rge0W6CwD
 yRb6JLI2DdAo2MxIYNvGnW5xj8MeeagG3ERmRDDiLQ==
X-Received: by 2002:aca:f5cc:: with SMTP id
 t195mr10518398oih.163.1575052897060; 
 Fri, 29 Nov 2019 10:41:37 -0800 (PST)
MIME-Version: 1.0
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <20191018150630.31099-7-damien.hedde@greensocs.com>
In-Reply-To: <20191018150630.31099-7-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Nov 2019 18:41:26 +0000
Message-ID: <CAFEAcA981i_W=8y+7_8JV=oMLT51TBMB8bTJJaiJJZqj6MuSAQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/13] hw/core/qdev: handle parent bus change regarding
 resettable
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Edgar Iglesias <edgari@xilinx.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A0GSClV1KtB3

On Fri, 18 Oct 2019 at 16:07, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> In qdev_set_parent_bus(), when changing the parent bus of a
> realized device, if the source and destination buses are not in the
> same reset state, some adaptation are required. This patch adds

"adaptations"

> needed call to resettable_change_parent() to make sure a device reset
> state stays coherent with its parent bus.
>
> The addition is a no-op if:
> 1. the device being parented is not realized.
> 2. the device is realized, but both buses are not under reset.
>
> Case 2 means that as long as qdev_set_parent_bus() is called
> during the machine realization procedure (which is before the
> machine reset so nothing is in reset), it is a no op.
>
> There are 49 call sites of qdev_set_parent_bus(). All but one fall
> into the no-op case:
> + 28 calls related to virtio (in hw/{s390x,display,virtio}/
>   {vhost,virtio}-xxx.c) to set a _vdev_/_vgpu_ composing device
>   parent bus just before realizing the _vdev_/_vgpu_.
> + hw/qdev.c: when creating a device in qdev_try_create()
> + hw/sysbus.c: when initializing a device in the sysbus
> + hw/display/virtio-gpu-pci.c: before realizing VirtIOGPUPCIBase/vgpu
> + hw/display/virtio-vga.c: before realizing VirtIOVGABase/vgpu
> + hw/i386/amd_iommu.c: before realizing AMDVIState/pci
> + hw/misc/auxbus.c: when creating an AUXBus
> + hw/misc/auxbus.c: when creating an AUXBus child
> + hw/misc/macio/macio.c: when initializing a MACIOState child
> + hw/misc/macio/macio.c: before realizing NewWorldMacIOState/pmu
> + hw/misc/macio/macio.c: before realizing NewWorldMacIOState/cuda
> + hw/pci-host/designware.c: before realizing DesignwarePCIEHost/root
> + hw/pci-host/gpex.c: before realizing GPEXHost/root
> + hw/pci-host/prep.c: when initializaing PREPPCIState/pci_dev
> + hw/pci-host/q35.c: before realizing Q35PCIHost/mch
> + hw/pci-host/versatile.c: when initializing PCIVPBState/pci_dev
> + hw/pci-host/xilinx-pcie.c: before realizing XilinxPCIEHost/root
> + hw/s390x/event-facility.c: when creating SCLPEventFacility/
>                              TYPE_SCLP_QUIESCE
> + hw/s390x/event-facility.c: ditto with SCLPEventFacility/
>                              TYPE_SCLP_CPU_HOTPLUG
> + hw/s390x/sclp.c: Not trivial because it is called on a SLCPDevice
>   just after realizing it. Ok because at this point the destination
>   bus (sysbus) is not in reset; the realize step is before the
>   machine reset.
> + hw/sd/core.c: Not OK. Used in sdbus_reparent_card(). See below.
> + hw/ssi/ssi.c: Used to put spi slave on spi bus and connect the cs
>   line in ssi_auto_connect_slave(). Ok because this function is only
>   used in realize step in hw/ssi/aspeed_smc.ci, hw/ssi/imx_spi.c,
>   hw/ssi/mss-spi.c, hw/ssi/xilinx_spi.c and hw/ssi/xilinx_spips.c.
> + hw/xen/xen-legacy-backend.c: when creating a XenLegacyDevice device
> + qdev-monitor.c: in device hotplug creation procedure before realize

This is a really useful analysis to have in the commit message;
thanks!

(Side note: I wonder if the sclp.c case could be reordered so
it realizes the device after parenting it? Anyway, not something
to worry about now.)

> Note that this commit alone will have no effect, right now there is no
> use of resettable API to reset anything. So a bus will never be tagged
> as in-reset by this same API.
>
> The one place where side-effect will occurs is in hw/sd/core.c in
> sdbus_reparent_card(). This function is only used in the raspi machines,
> including during the sysbus reset procedure. This case will be fixed by
> a following commit before globally enabling resettable API for sysbus
> reset.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

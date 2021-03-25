Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp609395lfg;
        Thu, 25 Mar 2021 10:12:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKu+fituBdX6D+hyd/R+mPXYtDVXXJ4DFrchrbVrTukeGO6gK3q3YcKjtoMsObjXRcb6av
X-Received: by 2002:a02:605d:: with SMTP id d29mr8320967jaf.81.1616692368301;
        Thu, 25 Mar 2021 10:12:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616692368; cv=none;
        d=google.com; s=arc-20160816;
        b=Jlinv7aty85i3iUIqzD8ABGhibQKndsLF05aB6OP2ZkKDgvx+9e2qbHRjhzARG1c3G
         W87ZGGZARtKB9az4Jr8SqaGlEotbYs5qYaPtzHZdUdueMASfN977+v/XS2Qo94ScwQfF
         udv8ibtaluQK3lhMoim+ahBEMxKdbWn8FsXD7mrTRDpLnQre/m7MPGccFiAJqAz71IxM
         lVDpHAvSH0lkTAUYGxaD641vvwDSSkIjkkf0nA0TbLKpN+o5TXIfYNHYZX2+1wbRIkZG
         tenK8g2xPK8kC8Q+kmodj0C+xS8rCvT384YQiieGEitwisfaNnChULy1H9N/DA5ojwxG
         gk1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=yd24CN/cEsMQNc/Y0vFp8HoTg/GNygss3BU1636GTgw=;
        b=P4cCYbog2nXx8BA+3Fr8VY4U0VHAAHwhAHVc5u/yg53G+IyyTahWIdj8j9l3n5hkOw
         TRFO6OozO6/XonDsvG3x07fBo6T8llCY8unUYT6YQlLHqu9XvABnIuubWoik5MEOAfFe
         bpxIFajyiY5xirpRzm3kDjnlXq1iYiGTtpygB3IOFcyCgzDXZw8Ua1F2FqdkmKczBATf
         5AOMMROmfavfP2NSh+YJs4hQ62J4Mz0NJfUH6z6inMdVImmnwzBTE9t97jH4wmZVI4CX
         28PZ9w8qCBTrETicNGBnD3UCUuKAUblk3cMt4TMyI2Vq3SWrCfpiklYVUf9ZkuGEsqjY
         G0Lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QgGnJTcA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a4si4752197jat.82.2021.03.25.10.12.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Mar 2021 10:12:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QgGnJTcA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPTXL-0002QR-J7
	for alex.bennee@linaro.org; Thu, 25 Mar 2021 13:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lPTON-0003as-LR
 for qemu-arm@nongnu.org; Thu, 25 Mar 2021 13:03:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lPTOK-0004h3-3k
 for qemu-arm@nongnu.org; Thu, 25 Mar 2021 13:03:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616691805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yd24CN/cEsMQNc/Y0vFp8HoTg/GNygss3BU1636GTgw=;
 b=QgGnJTcArgy/qT6cyJPQQ7/xkqMjpXytwbe6sjqNtAjNG+GQe/qsivnR41pjGAylHSznpc
 MXGEY/lxvaVdH+VPth5kSiGHW2kP89Bd29OHOBYwyeHS4JFHWKt1dp0JdBnpyDAaR3BlB2
 ttEzIwYLFnEAZ666j2ZB0i7OxCUSKmw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-mvQ0DV_2N7S0AIbg0niNdA-1; Thu, 25 Mar 2021 13:03:20 -0400
X-MC-Unique: mvQ0DV_2N7S0AIbg0niNdA-1
Received: by mail-wm1-f72.google.com with SMTP id n17so64820wmi.2
 for <qemu-arm@nongnu.org>; Thu, 25 Mar 2021 10:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yd24CN/cEsMQNc/Y0vFp8HoTg/GNygss3BU1636GTgw=;
 b=ZDT9cQgiw6S1XjHIefvvKAav7irOhGQbs3dYPwf5QHox5JRb0Y369fkd38Coj6NlTn
 Ve7o2gNKm3Eo/wSY5DRSp8/3mXe5DJ+LGhsIW199ECsIBQSYTjCfg/zSkjmYlf68xbtv
 cSpKA2G2zr7AwkB6LMZv2xRY3FoCRLKFoGztysu44oPiYJfu1PlMsx7s4BolyJz1411R
 Q2wWM2mZR6X4w2tnMUrs6KZzQ9TkAXGcPBvBdNzcNWSPM1ZGf58Z93GU2HlOL3TpqSmn
 6tReTZxSGCypn0jlad8sAuBrQCYlpVhO3drtBqFGFQIWPxX9+vZEHGFLHllcYEckgWyU
 6ahQ==
X-Gm-Message-State: AOAM531t9jNeAMSmgrRIMJe+kbNJN9DFDYGJ/qGfmE4lst56wPQZJ0Fx
 uuSucV6EKur9aqR8B63LP/uiuuYIhFlWuh/wWL6poT3p3d6aPNWQWu6TOxUkEIjI9fz5/OnTfth
 OWjsY0lj/KycW
X-Received: by 2002:a1c:1dd4:: with SMTP id d203mr8966828wmd.83.1616691798001; 
 Thu, 25 Mar 2021 10:03:18 -0700 (PDT)
X-Received: by 2002:a1c:1dd4:: with SMTP id d203mr8966784wmd.83.1616691797600; 
 Thu, 25 Mar 2021 10:03:17 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id m11sm8702227wri.44.2021.03.25.10.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 10:03:17 -0700 (PDT)
Date: Thu, 25 Mar 2021 13:03:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 for-6.0?] hw/pci-host/gpex: Don't fault for unmapped
 parts of MMIO and PIO windows
Message-ID: <20210325130304-mutt-send-email-mst@kernel.org>
References: <20210325163315.27724-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210325163315.27724-1-peter.maydell@linaro.org>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Arnd Bergmann <arnd@arndb.de>, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Dmitry Vyukov <dvyukov@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R6b6LYhaQZ9N

On Thu, Mar 25, 2021 at 04:33:15PM +0000, Peter Maydell wrote:
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
> The old behaviour generally didn't cause any problems, because
> almost always the guest OS will map the PCI devices and then only
> access where it has mapped them. One corner case where you will see
> this kind of access is if Linux attempts to probe legacy ISA
> devices via a PIO window access. So far the only case where we've
> seen this has been via the syzkaller fuzzer.
> 
> Reported-by: Dmitry Vyukov <dvyukov@google.com>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1918917
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
> v1->v2 changes: put in the hw_compat machinery.
> 
> Still not sure if I want to put this in 6.0 or not.
> 
>  include/hw/pci-host/gpex.h |  4 +++
>  hw/core/machine.c          |  1 +
>  hw/pci-host/gpex.c         | 56 ++++++++++++++++++++++++++++++++++++--
>  3 files changed, 58 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
> index d48a020a952..fcf8b638200 100644
> --- a/include/hw/pci-host/gpex.h
> +++ b/include/hw/pci-host/gpex.h
> @@ -49,8 +49,12 @@ struct GPEXHost {
>  
>      MemoryRegion io_ioport;
>      MemoryRegion io_mmio;
> +    MemoryRegion io_ioport_window;
> +    MemoryRegion io_mmio_window;
>      qemu_irq irq[GPEX_NUM_IRQS];
>      int irq_num[GPEX_NUM_IRQS];
> +
> +    bool allow_unmapped_accesses;
>  };
>  
>  struct GPEXConfig {
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 257a664ea2e..9750fad7435 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -41,6 +41,7 @@ GlobalProperty hw_compat_5_2[] = {
>      { "PIIX4_PM", "smm-compat", "on"},
>      { "virtio-blk-device", "report-discard-granularity", "off" },
>      { "virtio-net-pci", "vectors", "3"},
> +    { "gpex-pcihost", "allow-unmapped-accesses", "false" },
>  };
>  const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
>  
> diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
> index 2bdbe7b4561..a6752fac5e8 100644
> --- a/hw/pci-host/gpex.c
> +++ b/hw/pci-host/gpex.c
> @@ -83,12 +83,51 @@ static void gpex_host_realize(DeviceState *dev, Error **errp)
>      int i;
>  
>      pcie_host_mmcfg_init(pex, PCIE_MMCFG_SIZE_MAX);
> +    sysbus_init_mmio(sbd, &pex->mmio);
> +
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
>      memory_region_init(&s->io_mmio, OBJECT(s), "gpex_mmio", UINT64_MAX);
>      memory_region_init(&s->io_ioport, OBJECT(s), "gpex_ioport", 64 * 1024);
>  
> -    sysbus_init_mmio(sbd, &pex->mmio);
> -    sysbus_init_mmio(sbd, &s->io_mmio);
> -    sysbus_init_mmio(sbd, &s->io_ioport);
> +    if (s->allow_unmapped_accesses) {
> +        memory_region_init_io(&s->io_mmio_window, OBJECT(s),
> +                              &unassigned_io_ops, OBJECT(s),
> +                              "gpex_mmio_window", UINT64_MAX);
> +        memory_region_init_io(&s->io_ioport_window, OBJECT(s),
> +                              &unassigned_io_ops, OBJECT(s),
> +                              "gpex_ioport_window", 64 * 1024);
> +
> +        memory_region_add_subregion(&s->io_mmio_window, 0, &s->io_mmio);
> +        memory_region_add_subregion(&s->io_ioport_window, 0, &s->io_ioport);
> +        sysbus_init_mmio(sbd, &s->io_mmio_window);
> +        sysbus_init_mmio(sbd, &s->io_ioport_window);
> +    } else {
> +        sysbus_init_mmio(sbd, &s->io_mmio);
> +        sysbus_init_mmio(sbd, &s->io_ioport);
> +    }
> +
>      for (i = 0; i < GPEX_NUM_IRQS; i++) {
>          sysbus_init_irq(sbd, &s->irq[i]);
>          s->irq_num[i] = -1;
> @@ -108,6 +147,16 @@ static const char *gpex_host_root_bus_path(PCIHostState *host_bridge,
>      return "0000:00";
>  }
>  
> +static Property gpex_host_properties[] = {
> +    /*
> +     * Permit CPU accesses to unmapped areas of the PIO and MMIO windows
> +     * (discarding writes and returning -1 for reads) rather than aborting.
> +     */
> +    DEFINE_PROP_BOOL("allow-unmapped-accesses", GPEXHost,
> +                     allow_unmapped_accesses, true),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  static void gpex_host_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -117,6 +166,7 @@ static void gpex_host_class_init(ObjectClass *klass, void *data)
>      dc->realize = gpex_host_realize;
>      set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>      dc->fw_name = "pci";
> +    device_class_set_props(dc, gpex_host_properties);
>  }
>  
>  static void gpex_host_initfn(Object *obj)
> -- 
> 2.20.1


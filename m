Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1466978eje;
        Mon, 10 Jul 2023 14:41:22 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFoFXOZLVsjtioldOMVOl4vusGNI2hj1SO7v4ZcmhyjmcAS/rm+eKYpEu7xrmUPupZXLqhZ
X-Received: by 2002:a05:622a:245:b0:400:a76c:838f with SMTP id c5-20020a05622a024500b00400a76c838fmr16043232qtx.6.1689025281829;
        Mon, 10 Jul 2023 14:41:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689025281; cv=none;
        d=google.com; s=arc-20160816;
        b=d/FMIkNsf/hBsNzU+88twbGwbkjzgP/spsgATA1DFb6pavFzZutB2l3755GXKaky/C
         pLffNLo+aJ5zzEfrDDP7FkOZrhke+EAVRN3jwVaQ02PhS/YYdhdU0DyeaW7Bvzcrmjk2
         Yyd2l7UPpOb+XrI8cT/GM0xrRTbPhnzljFfPkgtaGtz9JnFauJlDZxDz/CFi9yQuvFFD
         dYzNQKl6m27s2d3+Y26FN7bIdrEyCXGVvFuBuC818VMdSH9LJabj6x+hylG29DJHSLYa
         n4qUoov1UzYsAyxVjp9CfGT0cEwPMZ/+2g7EOXrN8tcVSzQech/LdJ+qJ5rsJvyLnwvU
         RqaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=KrhPzTDrvhWFpjkK1gs8M6kGNFizrKxZ+k0c9BlLAtw=;
        fh=EoOjAfkZesDSF9reC59stfIeodNss65dHW5vS16eomQ=;
        b=B/8Xycpkak1Ct8/TyFcN1h/Qcx0Dq7jsH5CogA08/Q+iyNCJN1bUNXiHiRRV/2X8p2
         BFzuc87dh3X2bZSo4IBZen7n7D8FPUsGG6ZSQRAHE3i2URFYy8i/PkXNbbgpafa6rBDu
         d97nrjEGRS2pD+df+whsDOB7q2yULqIiqqOOhveKb4dsezS/2AcOSA/ncLqra/J9o0bw
         aUN/WevSVrF+nolaDVNqZ9WD+EZtu6pl4bwCf2H3054zlxaj1xpydyre94bCGboKPmro
         +ONCdSIhFc6GqsicqYqwJMdDtr3JcLuSTzPvVJUAXtz+gVjce0fQyKaCi71O0jDV2J81
         8nIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XRE3LqkN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2-20020a05622a000200b00403af2cf552si276755qtw.692.2023.07.10.14.41.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jul 2023 14:41:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XRE3LqkN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qIyd4-0003Th-C6; Mon, 10 Jul 2023 17:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qIyd2-0003TG-FG
 for qemu-arm@nongnu.org; Mon, 10 Jul 2023 17:41:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qIycx-0005cs-MU
 for qemu-arm@nongnu.org; Mon, 10 Jul 2023 17:41:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689025262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KrhPzTDrvhWFpjkK1gs8M6kGNFizrKxZ+k0c9BlLAtw=;
 b=XRE3LqkN2n/0Y0ReWc/npHxv1+B9yKCso+3DfEv9z7eqVbnjgjds93DwC+CEqKMbyLqpid
 UtrA0QvTKeggmluNgcoD+9aFfI1Irjx1hil3KT3iqodZYPo5z91vRlKE09FaDEcbeFlqFF
 oBqh+OHngrThnFeuVYuBA7WtHnvxZds=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-9Oksw5VfPuykFdNyhFrt_A-1; Mon, 10 Jul 2023 17:41:00 -0400
X-MC-Unique: 9Oksw5VfPuykFdNyhFrt_A-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fc07d4c2f4so18499545e9.1
 for <qemu-arm@nongnu.org>; Mon, 10 Jul 2023 14:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689025260; x=1691617260;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KrhPzTDrvhWFpjkK1gs8M6kGNFizrKxZ+k0c9BlLAtw=;
 b=kXHt3SyxC3zw2oXvGj+WiDWpY8J0ecOCGNoJB09ODqv9IRpnP9aQtl2Z1ChWaDlAaS
 qRLrsz33Ijn2pxoLRmHTPdEhBINR0siUHaYbs4NPZEA6d3A4oqPl6+wCgafkhbICj+m/
 OFNKzpMintnPP1XicejN3etsfeVyQg6g7yHlskRon9hdrDgVws2b3hdGNoqL2YeEbTcN
 p7ktj94q8mhAKwyibJnfFwQxGA9kzMTy1TKn/QzZSvkoSuabwLTABvOfbUku73CoPghp
 7JOrTOaz7OGUq81mGo0UhGjhKjGDsXh90PB/AzKoJinVcByIu79VgfjyXFvAz6VdzVtT
 nf3g==
X-Gm-Message-State: ABy/qLbrpEpe1xTLEQHoxdIOp3DN7bTZivQKs4Qn/naOThVs4u4VurkE
 vkAZ2Z4e+zdQXSJXhxo6aYG6P/UBKGlLFSr1safzaRYyISjuLG7DakEqs0DAmQwZqGnXwCy/G6y
 Hz635Z6JCETyj
X-Received: by 2002:a1c:7916:0:b0:3f8:fac0:ad40 with SMTP id
 l22-20020a1c7916000000b003f8fac0ad40mr13616753wme.29.1689025259705; 
 Mon, 10 Jul 2023 14:40:59 -0700 (PDT)
X-Received: by 2002:a1c:7916:0:b0:3f8:fac0:ad40 with SMTP id
 l22-20020a1c7916000000b003f8fac0ad40mr13616732wme.29.1689025259292; 
 Mon, 10 Jul 2023 14:40:59 -0700 (PDT)
Received: from redhat.com ([2.52.3.112]) by smtp.gmail.com with ESMTPSA id
 a10-20020a1cf00a000000b003fba6a0c881sm11288502wmb.43.2023.07.10.14.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 14:40:58 -0700 (PDT)
Date: Mon, 10 Jul 2023 17:40:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Gavin Shan <gshan@redhat.com>, Mario Casquero <mcasquer@redhat.com>
Subject: Re: [PATCH v3 3/7] arm/virt: Use virtio-md-pci (un)plug functions
Message-ID: <20230710173933-mutt-send-email-mst@kernel.org>
References: <20230710100714.228867-1-david@redhat.com>
 <20230710100714.228867-4-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230710100714.228867-4-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: rVeseZL7WRXv

On Mon, Jul 10, 2023 at 12:07:10PM +0200, David Hildenbrand wrote:
> Let's use our new helper functions. Note that virtio-pmem-pci is not
> enabled for arm and, therefore, not compiled in.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/arm/virt.c | 81 ++++++++-------------------------------------------
>  1 file changed, 12 insertions(+), 69 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 8a4c663735..4ae1996d37 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -73,11 +73,10 @@
>  #include "hw/arm/smmuv3.h"
>  #include "hw/acpi/acpi.h"
>  #include "target/arm/internals.h"
> -#include "hw/mem/memory-device.h"
>  #include "hw/mem/pc-dimm.h"
>  #include "hw/mem/nvdimm.h"
>  #include "hw/acpi/generic_event_device.h"
> -#include "hw/virtio/virtio-mem-pci.h"
> +#include "hw/virtio/virtio-md-pci.h"
>  #include "hw/virtio/virtio-iommu.h"
>  #include "hw/char/pl011.h"
>  #include "qemu/guest-random.h"
> @@ -2740,64 +2739,6 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
>                           dev, &error_abort);
>  }
>  
> -static void virt_virtio_md_pci_pre_plug(HotplugHandler *hotplug_dev,
> -                                        DeviceState *dev, Error **errp)
> -{
> -    HotplugHandler *hotplug_dev2 = qdev_get_bus_hotplug_handler(dev);
> -    Error *local_err = NULL;
> -
> -    if (!hotplug_dev2 && dev->hotplugged) {
> -        /*
> -         * Without a bus hotplug handler, we cannot control the plug/unplug
> -         * order. We should never reach this point when hotplugging on ARM.
> -         * However, it's nice to add a safety net, similar to what we have
> -         * on x86.
> -         */
> -        error_setg(errp, "hotplug of virtio based memory devices not supported"
> -                   " on this bus.");
> -        return;
> -    }
> -    /*
> -     * First, see if we can plug this memory device at all. If that
> -     * succeeds, branch of to the actual hotplug handler.
> -     */
> -    memory_device_pre_plug(MEMORY_DEVICE(dev), MACHINE(hotplug_dev), NULL,
> -                           &local_err);
> -    if (!local_err && hotplug_dev2) {
> -        hotplug_handler_pre_plug(hotplug_dev2, dev, &local_err);
> -    }
> -    error_propagate(errp, local_err);
> -}
> -
> -static void virt_virtio_md_pci_plug(HotplugHandler *hotplug_dev,
> -                                    DeviceState *dev, Error **errp)
> -{
> -    HotplugHandler *hotplug_dev2 = qdev_get_bus_hotplug_handler(dev);
> -    Error *local_err = NULL;
> -
> -    /*
> -     * Plug the memory device first and then branch off to the actual
> -     * hotplug handler. If that one fails, we can easily undo the memory
> -     * device bits.
> -     */
> -    memory_device_plug(MEMORY_DEVICE(dev), MACHINE(hotplug_dev));
> -    if (hotplug_dev2) {
> -        hotplug_handler_plug(hotplug_dev2, dev, &local_err);
> -        if (local_err) {
> -            memory_device_unplug(MEMORY_DEVICE(dev), MACHINE(hotplug_dev));
> -        }
> -    }
> -    error_propagate(errp, local_err);
> -}
> -
> -static void virt_virtio_md_pci_unplug_request(HotplugHandler *hotplug_dev,
> -                                              DeviceState *dev, Error **errp)
> -{
> -    /* We don't support hot unplug of virtio based memory devices */
> -    error_setg(errp, "virtio based memory devices cannot be unplugged.");
> -}
> -
> -
>  static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>                                              DeviceState *dev, Error **errp)
>  {
> @@ -2805,8 +2746,8 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>  
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>          virt_memory_pre_plug(hotplug_dev, dev, errp);
> -    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
> -        virt_virtio_md_pci_pre_plug(hotplug_dev, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
> +        virtio_md_pci_pre_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>          hwaddr db_start = 0, db_end = 0;
>          char *resv_prop_str;
> @@ -2855,12 +2796,11 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>                                       SYS_BUS_DEVICE(dev));
>          }
>      }
> +
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>          virt_memory_plug(hotplug_dev, dev, errp);
> -    }
> -
> -    if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
> -        virt_virtio_md_pci_plug(hotplug_dev, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
> +        virtio_md_pci_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
>      }
>  
>      if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {


How is this supposed to link if virtio-md is disabled at compile time?

Indeed I see this on mingw:

FAILED: qemu-system-aarch64.exe 
i686-w64-mingw32-gcc -m32 @qemu-system-aarch64.exe.rsp
/usr/lib/gcc/i686-w64-mingw32/12.2.1/../../../../i686-w64-mingw32/bin/ld: libqemu-aarch64-softmmu.fa.p/hw_arm_virt.c.obj: in function `virt_machine_device_plug_cb':
/scm/qemu-mingw32-build/../qemu/hw/arm/virt.c:2803: undefined reference to `virtio_md_pci_plug'
/usr/lib/gcc/i686-w64-mingw32/12.2.1/../../../../i686-w64-mingw32/bin/ld: libqemu-aarch64-softmmu.fa.p/hw_arm_virt.c.obj: in function `virt_machine_device_unplug_request_cb':
/scm/qemu-mingw32-build/../qemu/hw/arm/virt.c:2859: undefined reference to `virtio_md_pci_unplug_request'
/usr/lib/gcc/i686-w64-mingw32/12.2.1/../../../../i686-w64-mingw32/bin/ld: libqemu-aarch64-softmmu.fa.p/hw_arm_virt.c.obj: in function `virt_machine_device_unplug_cb':
/scm/qemu-mingw32-build/../qemu/hw/arm/virt.c:2873: undefined reference to `virtio_md_pci_unplug'
/usr/lib/gcc/i686-w64-mingw32/12.2.1/../../../../i686-w64-mingw32/bin/ld: libqemu-aarch64-softmmu.fa.p/hw_arm_virt.c.obj: in function `virt_machine_device_pre_plug_cb':
/scm/qemu-mingw32-build/../qemu/hw/arm/virt.c:2750: undefined reference to `virtio_md_pci_pre_plug'
collect2: error: ld returned 1 exit status
[795/3838] Linking target qemu-system-aarch64w.exe
FAILED: qemu-system-aarch64w.exe 
i686-w64-mingw32-gcc -m32 @qemu-system-aarch64w.exe.rsp
/usr/lib/gcc/i686-w64-mingw32/12.2.1/../../../../i686-w64-mingw32/bin/ld: libqemu-aarch64-softmmu.fa.p/hw_arm_virt.c.obj: in function `virt_machine_device_plug_cb':
/scm/qemu-mingw32-build/../qemu/hw/arm/virt.c:2803: undefined reference to `virtio_md_pci_plug'
/usr/lib/gcc/i686-w64-mingw32/12.2.1/../../../../i686-w64-mingw32/bin/ld: libqemu-aarch64-softmmu.fa.p/hw_arm_virt.c.obj: in function `virt_machine_device_unplug_request_cb':
/scm/qemu-mingw32-build/../qemu/hw/arm/virt.c:2859: undefined reference to `virtio_md_pci_unplug_request'
/usr/lib/gcc/i686-w64-mingw32/12.2.1/../../../../i686-w64-mingw32/bin/ld: libqemu-aarch64-softmmu.fa.p/hw_arm_virt.c.obj: in function `virt_machine_device_unplug_cb':
/scm/qemu-mingw32-build/../qemu/hw/arm/virt.c:2873: undefined reference to `virtio_md_pci_unplug'
/usr/lib/gcc/i686-w64-mingw32/12.2.1/../../../../i686-w64-mingw32/bin/ld: libqemu-aarch64-softmmu.fa.p/hw_arm_virt.c.obj: in function `virt_machine_device_pre_plug_cb':
/scm/qemu-mingw32-build/../qemu/hw/arm/virt.c:2750: undefined reference to `virtio_md_pci_pre_plug'
collect2: error: ld returned 1 exit status
[796/3838] Compiling C object libqemu-cris-softmmu.fa.p/fpu_softfloat.c.obj
[797/3838] Compiling C object libqemu-hppa-softmmu.fa.p/fpu_softfloat.c.obj
ninja: build stopped: subcommand failed.
make: *** [Makefile:162: run-ninja] Error 1




> @@ -2915,8 +2855,9 @@ static void virt_machine_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>  {
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>          virt_dimm_unplug_request(hotplug_dev, dev, errp);
> -    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
> -        virt_virtio_md_pci_unplug_request(hotplug_dev, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
> +        virtio_md_pci_unplug_request(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev),
> +                                     errp);
>      } else {
>          error_setg(errp, "device unplug request for unsupported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> @@ -2928,6 +2869,8 @@ static void virt_machine_device_unplug_cb(HotplugHandler *hotplug_dev,
>  {
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>          virt_dimm_unplug(hotplug_dev, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
> +        virtio_md_pci_unplug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
>      } else {
>          error_setg(errp, "virt: device unplug for unsupported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> @@ -2941,7 +2884,7 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
>  
>      if (device_is_dynamic_sysbus(mc, dev) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
> -        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI) ||
> +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>          return HOTPLUG_HANDLER(machine);
>      }
> -- 
> 2.41.0


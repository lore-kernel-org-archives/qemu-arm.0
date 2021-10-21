Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp90273lfc;
        Thu, 21 Oct 2021 02:03:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOw357/6gN7HHQvqodPEZXZ2itdnLNherd84gfLB4loXlbZoFX94ZN72ey9w7cIrYmsVYl
X-Received: by 2002:ab0:74c7:: with SMTP id f7mr4642172uaq.50.1634807030702;
        Thu, 21 Oct 2021 02:03:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634807030; cv=none;
        d=google.com; s=arc-20160816;
        b=oBHJRkRvg5bRg+KGhd5ctgj6SvnqVtHgpyjnFAfEqv5aVd8yfhX/g+I6lNJhvTKzGe
         y0we9Tx/6QpnURqCKAtkanq1Omso7Fyp2VmYCaq60qTEhGV7td/jTwUOweMUMoZgaf1o
         ynx2i4LbiPYMj1GbhhEfpOl5z34QSPmEMBawAs587gtP8YkwPvmLSAeRy6yGsG5hu2st
         vmUhbmNQFHxuIAngmAMLcfCBBmjzN6YFlv0vM/cdAlJgB1yGycJi3Cn60Ml46+xaIOAZ
         pc4T9In1/Az/kggdzcurBTJvfTMdLdQYqlVBA/qRwTrbWgmYv5lffGwu2LWrRZyDYgQh
         m2Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=6GTIuZ0xvETiQbv7Zq3MnvaOtgnPhrraUeqzzkC7roY=;
        b=cd82eSvDEhZEoqwyJOoIl6MemvOUmbWXJUi2EUo/HPT3dH1nS6+uCOOvcTjPrlN1ci
         5OpE5rrYbJ/ffJdLxgRCPO15dqvBEBGw5U3QnscyxgJdgvz2OP6dQnadAy2paYdmPuSv
         z0Qh3lY4nX83we3wKhfr3wL+MdQiAz+SYG6msjKEjhU5R7cqoqy+JwGOLGBvE73fY1hM
         LToVlZMH6GrLRWt8jUo7qWmn3TeNJXcvaIZ6duwV1QgfgYdJMMri+xGyZlbEGLZstAIy
         vVgxC3tsjA06xV/qv8I2yvShF/IU9PPDc3X0+9OYG2c+qomgMBM2TqMYfUESfU4bW0b9
         KI1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QfHF4f62;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n19si4986961vsj.244.2021.10.21.02.03.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Oct 2021 02:03:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QfHF4f62;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdTzI-0007Rx-QL
	for alex.bennee@linaro.org; Thu, 21 Oct 2021 05:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdTyI-0007Nz-Vo
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 05:02:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdTyF-00066o-2i
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 05:02:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634806960;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6GTIuZ0xvETiQbv7Zq3MnvaOtgnPhrraUeqzzkC7roY=;
 b=QfHF4f62AG208DvZnuH/ouFDD/icQEKQ3dzhGnPMrvqC3NPibqWD5UfFkSJe7+pLlR47h8
 tEOY8R200Tjno8YHv8aXmNguVk+OUekQEu5Gis14st10FAflpxNFK+1T7kk7GcmaItE8Wp
 N6bok7H2yGFows20bpr0I8TQNx5TkCM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-CAnFGvUIOSerhj4Ewuq67A-1; Thu, 21 Oct 2021 05:02:39 -0400
X-MC-Unique: CAnFGvUIOSerhj4Ewuq67A-1
Received: by mail-wm1-f71.google.com with SMTP id
 s25-20020a7bc399000000b0030da0f36afeso28148wmj.1
 for <qemu-arm@nongnu.org>; Thu, 21 Oct 2021 02:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=6GTIuZ0xvETiQbv7Zq3MnvaOtgnPhrraUeqzzkC7roY=;
 b=h20J5/o9c1aM0XAdiSE5A/CNrDRJm0YSWGQwxltbCMv7TC+/KZ8v+9rZrnqH5/Qdyi
 AEhDtE3HKtaKkNX+pq78CUwYE6a6R5CSZeyULF8GbWo9BHdcd5NgGM4oEgdVhGTW72HZ
 3PXnX7Se2Pk2XhmwdygvJM0auGOm3TSxyuj+vHpoBWXX/Kn8Vd9PlqsybVBgBwE8vk35
 g3l5KnHBGidBmaSYmYqYFFORT4iLHC1iNGbhRNgjf+pVr91328qLtv01A6pSJnE6ufWo
 VDGQL7XoayhP2kd8qWHstrggX1MXR+b0wbXzognSNnfyVCgUw6aBJazFze/LntCgutlc
 1FiQ==
X-Gm-Message-State: AOAM533ep0FbXJTg33ykdeiWMd+GRImlbDdQsNDmQ/lCCT7GYqOI8A3k
 ZY3ATWARRqMrKLIBwNlEY6dr0/F4rMkmQ83jEtwZBgxIlxGh4HE4fYUVA6kCH3e05K4oOwSyyNl
 aigSBYPJ+uobPAEfVcT2t/19rhpQjkEoTGt/HpRnJhMLimotWqWLC1cxw51XqpBYgld4=
X-Received: by 2002:adf:bbd1:: with SMTP id z17mr5683531wrg.61.1634806957302; 
 Thu, 21 Oct 2021 02:02:37 -0700 (PDT)
X-Received: by 2002:adf:bbd1:: with SMTP id z17mr5683482wrg.61.1634806956946; 
 Thu, 21 Oct 2021 02:02:36 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id l3sm933691wmc.37.2021.10.21.02.02.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 02:02:35 -0700 (PDT)
Subject: Re: [PATCH v5 03/12] hw/i386/pc: Move IOMMU singleton into
 PCMachineState
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, mst@redhat.com,
 imammedo@redhat.com, peter.maydell@linaro.org
References: <20211020172745.620101-1-jean-philippe@linaro.org>
 <20211020172745.620101-4-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <e20ab66e-8916-bea9-8bc6-f9717801458c@redhat.com>
Date: Thu, 21 Oct 2021 11:02:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211020172745.620101-4-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: ehabkost@redhat.com, jasowang@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peterx@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, ani@anisinha.ca,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f4g9w2r1vE1Z



On 10/20/21 7:27 PM, Jean-Philippe Brucker wrote:
> We're about to support a third vIOMMU for x86, virtio-iommu which
> doesn't inherit X86IOMMUState. Move the IOMMU singleton into
> PCMachineState, so it can be shared between all three vIOMMUs.
>
> The x86_iommu_get_default() helper is still needed by KVM and IOAPIC to
> fetch the default IRQ-remapping IOMMU. Since virtio-iommu doesn't
> support IRQ remapping, this interface doesn't need to change for the
> moment. We could later replace X86IOMMUState with an "IRQ remapping
> IOMMU" interface if necessary.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> ---
>  include/hw/i386/pc.h |  1 +
>  hw/i386/pc.c         | 12 +++++++++++-
>  hw/i386/x86-iommu.c  | 26 ++++++++------------------
>  3 files changed, 20 insertions(+), 19 deletions(-)
>
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 11426e26dc..b72e5bf9d1 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -35,6 +35,7 @@ typedef struct PCMachineState {
>      I2CBus *smbus;
>      PFlashCFI01 *flash[2];
>      ISADevice *pcspk;
> +    DeviceState *iommu;
>  
>      /* Configuration options: */
>      uint64_t max_ram_below_4g;
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 54e4c00dce..fcbf328e8d 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1330,6 +1330,15 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
>                 object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
>          pc_virtio_md_pci_pre_plug(hotplug_dev, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE)) {
> +        PCMachineState *pcms = PC_MACHINE(hotplug_dev);
> +
> +        if (pcms->iommu) {
> +            error_setg(errp, "QEMU does not support multiple vIOMMUs "
> +                       "for x86 yet.");
> +            return;
> +        }
> +        pcms->iommu = dev;
>      }
>  }
>  
> @@ -1384,7 +1393,8 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_CPU) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
> -        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
> +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI) ||
> +        object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE)) {
>          return HOTPLUG_HANDLER(machine);
>      }
>  
> diff --git a/hw/i386/x86-iommu.c b/hw/i386/x86-iommu.c
> index dc968c7a53..01d11325a6 100644
> --- a/hw/i386/x86-iommu.c
> +++ b/hw/i386/x86-iommu.c
> @@ -77,25 +77,17 @@ void x86_iommu_irq_to_msi_message(X86IOMMUIrq *irq, MSIMessage *msg_out)
>      msg_out->data = msg.msi_data;
>  }
>  
> -/* Default X86 IOMMU device */
> -static X86IOMMUState *x86_iommu_default = NULL;
> -
> -static void x86_iommu_set_default(X86IOMMUState *x86_iommu)
> +X86IOMMUState *x86_iommu_get_default(void)
>  {
> -    assert(x86_iommu);
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    PCMachineState *pcms =
> +        PC_MACHINE(object_dynamic_cast(OBJECT(ms), TYPE_PC_MACHINE));
>  
> -    if (x86_iommu_default) {
> -        error_report("QEMU does not support multiple vIOMMUs "
> -                     "for x86 yet.");
> -        exit(1);
> +    if (pcms &&
> +        object_dynamic_cast(OBJECT(pcms->iommu), TYPE_X86_IOMMU_DEVICE)) {
> +        return X86_IOMMU_DEVICE(pcms->iommu);
>      }
> -
> -    x86_iommu_default = x86_iommu;
> -}
> -
> -X86IOMMUState *x86_iommu_get_default(void)
> -{
> -    return x86_iommu_default;
> +    return NULL;
>  }
>  
>  static void x86_iommu_realize(DeviceState *dev, Error **errp)
> @@ -131,8 +123,6 @@ static void x86_iommu_realize(DeviceState *dev, Error **errp)
>      if (x86_class->realize) {
>          x86_class->realize(dev, errp);
>      }
> -
> -    x86_iommu_set_default(X86_IOMMU_DEVICE(dev));
>  }
>  
>  static Property x86_iommu_properties[] = {


Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp1766342njb;
        Sat, 6 Jul 2024 06:46:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWMnNcP+GX1oBUMeeNuIk6UyGUoSauvd7Z/AI7eRjAmTpiLaw4YrTuC8VKm2+G2q37HlXtTyuDk+bcBjmfgA9CvvkzCdar/
X-Google-Smtp-Source: AGHT+IEFWri1nUEVy3W923n7b18CkhRFXF7H4Av5oumaFOyCTjQGkxR5jZC+JZY9phkMUqKZhXFa
X-Received: by 2002:a05:622a:118d:b0:444:ab91:e067 with SMTP id d75a77b69052e-447cbf3cea3mr82469891cf.36.1720273607335;
        Sat, 06 Jul 2024 06:46:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720273607; cv=none;
        d=google.com; s=arc-20160816;
        b=qlndXALtGUqehxoKtaqFZaHGnMH/DG4nCnqf64+WfP0WvxDXJtDYswWZ1f682Oe674
         WJQP81HMPSVCuMX9+66yJQtoJTxYdFgoh/H5SQegrvlPj2ejPDAw4E9eoLYa/v7TXGzg
         XWz3QXXUAPz+aKbNOl/yGe65d7G1j0m2Me4kIwCjpCjYyV/NJpcccPZZqMxkawY6pzfa
         cKq+HBrr7oxDUNUSH2jZsgR7hFpua0oWalAMFZNh4ieBVzJMv0cpiTS6e1bVE6ffZxUl
         t/7SoA4N/nrX4rcc6OTTM9wXKqyNSye8DlegfMb6kkfoL4WD11ZhwEV8qDPOj33U4eeu
         Ew1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=UI7oL77H2OxGrANkRenH/bPErLet3daUISM2dt/boU0=;
        fh=wNCa68CS4SRgFyblFKTxLnC9H/+W/m8awbXr271CJ4E=;
        b=Muiw98n/UoHhRjxDFQVjXa+NyONiUC3aYdPYSt/H4fpv8MyOcrTFrifTWPWScc0DOw
         LikLSanKSlpJF+PpDPletvc7LQcgYN7D+X4yYrb+gFzplOA4ehGJ4RHNCO51XwRMu3AS
         O3zq8QWJ33MGzQ8mbE1Wzf79mBAGRrh1fovkTrh7AYkW6LXgAUBWNCQXkSoKIawa01OC
         tSQq4wb9gI0T4RZEp2VEfX88lPheqQLIk6NxHRfmx4DQB5CWzrfw5gkT0rU5Lkt6Uqte
         3cOnAcUq8k6eUO5+JpLBT908xt8+IbVD3emdKLiG/t5VcpKKGPsX6j9HvFrt/mWMX8Xf
         xyqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ngea1hrA;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-44664adf0dbsi167914901cf.730.2024.07.06.06.46.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 06:46:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ngea1hrA;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720273607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UI7oL77H2OxGrANkRenH/bPErLet3daUISM2dt/boU0=;
	b=Ngea1hrAp8i93M87NbH1YpeLvu3z6/bwSbZz5REycXcj/COiQdi27w+N6TlzIalBm8jemb
	OaiquzuEkCha9Lh43ps7dBrD+ZerEENz90ByveciKrZuEIXz8qnMyp8N7WKzzFgkhZrVD7
	t/FV9T/OITee/2mCM5rHxR2OH5OJpGg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-Z6emOKzMP2upGynm_quSOg-1; Sat, 06 Jul 2024 09:46:44 -0400
X-MC-Unique: Z6emOKzMP2upGynm_quSOg-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-36792df120fso1855446f8f.1
        for <alex.bennee@linaro.org>; Sat, 06 Jul 2024 06:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720273603; x=1720878403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UI7oL77H2OxGrANkRenH/bPErLet3daUISM2dt/boU0=;
        b=rfwZdmB0VkTVn5WMdJOnRVXb79cpsdDIOuCWGvrE20cf+BMLAIH2aYmwxg+BEYC7Ra
         i+21zlyi+ICBIRfQZr1bTMKUSxzoadbVE4WVaiJRNY/PYfRoi+gUnZ2AENT7x7wsJG1R
         6Irlaz0Yukjtipr/dLkVWPdMSgHeF77OVj4zOAXCLFImTAnq7fYkALBCiyGOiuJ+xxKL
         QreqwyETBT1lRxjJAceLQ7YdzBM97gfk7qwSvHhoWKcBPmC5qBIHEOeIc5DvAmic4gCr
         W9dNpNllkN5QKu7tIA6HRxnXlh2d3hBh7F3wchIwOPTFg5HY1g8OGlYCFwRLYVa9Kc+O
         o5mw==
X-Forwarded-Encrypted: i=1; AJvYcCXb+ZZJAbLNZhlaUhzDTYq7CQk8tIA3VsWOKDkIIersxoiUz47e825ryv3PUAymPUaYE2mcgVnKiS0P8Aa0ktu6a/3ZI9yO
X-Gm-Message-State: AOJu0YzyTubwgPLL7a0lbx8BpmQz3ohsoBcYDk8vl4y16dmF8JAUAM/E
	Nuacik5OReCLy8x/PWt6xnA9aQfBp3uD2pA+3MCQOFJtYv1ktqhZq7F8NVG3bhkJ8jFO8apxJxZ
	b+jQbFYLLnSff/EyhnoCuRdbiN5q/lamrIfQTVCAxBhx3oPNXE8aKzw==
X-Received: by 2002:a5d:458e:0:b0:362:3358:48d5 with SMTP id ffacd0b85a97d-3679dd65255mr4795512f8f.47.1720273603105;
        Sat, 06 Jul 2024 06:46:43 -0700 (PDT)
X-Received: by 2002:a5d:458e:0:b0:362:3358:48d5 with SMTP id ffacd0b85a97d-3679dd65255mr4795481f8f.47.1720273602616;
        Sat, 06 Jul 2024 06:46:42 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679814a276sm7629625f8f.84.2024.07.06.06.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 06:46:42 -0700 (PDT)
Date: Sat, 6 Jul 2024 15:46:40 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <maz@kernel.org>,
 <jean-philippe@linaro.org>, <jonathan.cameron@huawei.com>,
 <lpieralisi@kernel.org>, <peter.maydell@linaro.org>,
 <richard.henderson@linaro.org>, <andrew.jones@linux.dev>,
 <david@redhat.com>, <philmd@linaro.org>, <eric.auger@redhat.com>,
 <oliver.upton@linux.dev>, <pbonzini@redhat.com>, <mst@redhat.com>,
 <will@kernel.org>, <gshan@redhat.com>, <rafael@kernel.org>,
 <alex.bennee@linaro.org>, <linux@armlinux.org.uk>,
 <darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
 <vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
 <miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>,
 <zhukeqian1@huawei.com>, <wangxiongfeng2@huawei.com>,
 <wangyanan55@huawei.com>, <jiakernel2@gmail.com>, <maobibo@loongson.cn>,
 <lixianglai@loongson.cn>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
 <linuxarm@huawei.com>, Shaoqin Huang <shahuang@redhat.com>, Zhao Liu
 <zhao1.liu@intel.com>
Subject: Re: [PATCH V13 3/8] hw/acpi: Update ACPI GED framework to support
 vCPU Hotplug
Message-ID: <20240706154640.0a45c5d6@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240607115649.214622-4-salil.mehta@huawei.com>
References: <20240607115649.214622-1-salil.mehta@huawei.com>
	<20240607115649.214622-4-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: lMxxSGYi9uAK

On Fri, 7 Jun 2024 12:56:44 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> ACPI GED (as described in the ACPI 6.4 spec) uses an interrupt listed in the
> _CRS object of GED to intimate OSPM about an event. Later then demultiplexes the
> notified event by evaluating ACPI _EVT method to know the type of event. Use
> ACPI GED to also notify the guest kernel about any CPU hot(un)plug events.
> 
> ACPI CPU hotplug related initialization should only happen if ACPI_CPU_HOTPLUG
> support has been enabled for particular architecture. Add cpu_hotplug_hw_init()
> stub to avoid compilation break.
> 
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Tested-by: Xianglai Li <lixianglai@loongson.cn>
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> Reviewed-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Tested-by: Zhao Liu <zhao1.liu@intel.com>
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>  hw/acpi/acpi-cpu-hotplug-stub.c        |  6 ++++++
>  hw/acpi/cpu.c                          |  6 +++++-
>  hw/acpi/generic_event_device.c         | 17 +++++++++++++++++
>  include/hw/acpi/generic_event_device.h |  4 ++++
>  4 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-stub.c
> index 3fc4b14c26..c6c61bb9cd 100644
> --- a/hw/acpi/acpi-cpu-hotplug-stub.c
> +++ b/hw/acpi/acpi-cpu-hotplug-stub.c
> @@ -19,6 +19,12 @@ void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
>      return;
>  }
>  
> +void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
> +                         CPUHotplugState *state, hwaddr base_addr)
> +{
> +    return;
> +}
> +
>  void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list)
>  {
>      return;
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 69aaa563db..473b37ba88 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -221,7 +221,11 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
>      const CPUArchIdList *id_list;
>      int i;
>  
> -    assert(mc->possible_cpu_arch_ids);
> +    /* hotplug might not be available for all types like x86/microvm etc. */
> +    if (!mc->possible_cpu_arch_ids) {
> +        return;
> +    }

if hotplug is not supported, this function shouldn't be called at all.

[...]
> @@ -400,6 +411,12 @@ static void acpi_ged_initfn(Object *obj)
>      memory_region_init_io(&ged_st->regs, obj, &ged_regs_ops, ged_st,
>                            TYPE_ACPI_GED "-regs", ACPI_GED_REG_COUNT);
>      sysbus_init_mmio(sbd, &ged_st->regs);
> +
> +    memory_region_init(&s->container_cpuhp, OBJECT(dev), "cpuhp container",
> +                       ACPI_CPU_HOTPLUG_REG_LEN);
> +    sysbus_init_mmio(sbd, &s->container_cpuhp);

> +    cpu_hotplug_hw_init(&s->container_cpuhp, OBJECT(dev),
> +                        &s->cpuhp_state, 0);

suggest to move this call to realize time, and gate it on 
ACPI_GED_CPU_HOTPLUG_EVT being set.
Platform that supports cpu hotplug must optin, setting ACPI_GED_CPU_HOTPLUG_EVT,
while for the rest it will be ignored.

for example: create_acpi_ged() : event |= ACPI_GED_NVDIMM_HOTPLUG_EVT;

>  }
>  
>  static void acpi_ged_class_init(ObjectClass *class, void *data)
> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> index ba84ce0214..90fc41cbb8 100644
> --- a/include/hw/acpi/generic_event_device.h
> +++ b/include/hw/acpi/generic_event_device.h
> @@ -60,6 +60,7 @@
>  #define HW_ACPI_GENERIC_EVENT_DEVICE_H
>  
>  #include "hw/sysbus.h"
> +#include "hw/acpi/cpu_hotplug.h"
>  #include "hw/acpi/memory_hotplug.h"
>  #include "hw/acpi/ghes.h"
>  #include "qom/object.h"
> @@ -95,6 +96,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(AcpiGedState, ACPI_GED)
>  #define ACPI_GED_MEM_HOTPLUG_EVT   0x1
>  #define ACPI_GED_PWR_DOWN_EVT      0x2
>  #define ACPI_GED_NVDIMM_HOTPLUG_EVT 0x4
> +#define ACPI_GED_CPU_HOTPLUG_EVT    0x8
>  
>  typedef struct GEDState {
>      MemoryRegion evt;
> @@ -106,6 +108,8 @@ struct AcpiGedState {
>      SysBusDevice parent_obj;
>      MemHotplugState memhp_state;
>      MemoryRegion container_memhp;
> +    CPUHotplugState cpuhp_state;
> +    MemoryRegion container_cpuhp;
>      GEDState ged_state;
>      uint32_t ged_event_bitmap;
>      qemu_irq irq;

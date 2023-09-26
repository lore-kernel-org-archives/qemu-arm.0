Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1006475ejc;
        Tue, 26 Sep 2023 04:02:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEN101qHI3/9RRKwdq3s+2FQqDUezASjG62mtZDgCkkMsl134/nRYXGoQlb7ia21zI3bRpY
X-Received: by 2002:a05:6214:4518:b0:64c:92f8:6b11 with SMTP id oo24-20020a056214451800b0064c92f86b11mr9073648qvb.37.1695726148658;
        Tue, 26 Sep 2023 04:02:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695726148; cv=none;
        d=google.com; s=arc-20160816;
        b=V278hNZpdUGqqsrwhTY5PjtT5sSGcC+1YyubT+jecf7lTUDPtZ6JowmFmDFgKUpHPa
         lL6TmuB3mwG2IhKLsiPa30PtS+duiHMMPvbG6wmXAt8YbCv0WL5xwTYYYPl5GzRjTkj1
         Zv6GkHT+s3BH+dLQV/mOgLHwqph9qf1zFvwUIiazkhYiziWomKrM3Rft2AE66aNuNawh
         3FZrUouWdezysVnaLdVUryI9k9qKMPm3d/EfUVPnHvK/BcWIyMwY5/6HD/T781Vxa3bF
         iuXbYGXCIMwEU9GE+XcPUpkNn02N8zy+FcihG+Zj4X8Q92tC8NxvC14e9x1xTKeR9b+y
         RjxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=rNBMEgzVfYe+5R3ihfL427VL9Lc9meOuBxoZ1HI6mok=;
        fh=YsMqRVOlIuT3ozQku07v7YKaKiFtV2sb0IWATzUL7iA=;
        b=bt45tSzZLkJJnn/AwhzgA0NGsbJQfI+gn8+26oZq+uQNbl0fdXoSGoEosZGrlrPTRu
         x9CM6F4W0vKDq8svtYH1DfgMtINYZJmtzLXcBjAg0V/8Mj+luqbIAJjDkVAJceHv61Le
         280lkeuiw6l/jsCO01vxd806p1QdCN/PTe5JvVMfxyApdcRiGAP3NPH92/xX8+IrvrDC
         gjmEXTJP97XKrYKLH0EmGbOGjA4bXqfy/4YI3Hx3KLS6t47nl4CbyslKz2y/c3SgoxjO
         jmQ/V90IpXSOxk+U7lrhkd7qsH/v3pjMqkvdaQx/2IcV27OgK27ZN7afhFdSyhgu9gDK
         BUMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HymifnGa;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id b12-20020a05620a270c00b00767ccf42f41si6923779qkp.29.2023.09.26.04.02.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 04:02:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HymifnGa;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695726148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rNBMEgzVfYe+5R3ihfL427VL9Lc9meOuBxoZ1HI6mok=;
	b=HymifnGawKrIvwMmmsNFNorz81WBtvrZKYmox/gLSo7L6AYf1M+nYi9BpcHVADLinUQhJX
	Fg53E5Ew5NxZ1f7ep1Nq0g9QbmFOwvqxr7kzodMA8VnvsJKwb9qjai/f+Z0WR1ZA8Q0vy8
	MJU6p3DxkC6q0opQyBQU5ASfkXfEqGM=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-0PU4DiklMz2UUGpOXBvIuQ-1; Tue, 26 Sep 2023 07:02:26 -0400
X-MC-Unique: 0PU4DiklMz2UUGpOXBvIuQ-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2c032e30083so118983861fa.2
        for <alex.bennee@linaro.org>; Tue, 26 Sep 2023 04:02:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695726145; x=1696330945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNBMEgzVfYe+5R3ihfL427VL9Lc9meOuBxoZ1HI6mok=;
        b=CFGv6FvU1UuxusXOCaaHJfN4RIECbje4ZcbXro/Nq2Q/+9L0mEzNRztEyfPbkUgHBb
         /iqkwcxHfQwzp/jObZn+s9n/gM6wBO5ZSVqzmm5qYVLswk6ujTHSkq5IE0hlVadNb4lf
         GAtMJyCV6gJkkscy3X0aU/eS7cWdCE5vqMZTtr+EBuWSky/kylilW0dJJEdL5nCqMhY1
         uTw3VjMRtiLc+R5mj0GuohjYTvfKApBKQxE5Q//YIfxL4CtKxwEQi4xhzab0YrW6JHSL
         CdWnM3OxrVohxErLHkbZQirBDicokNMJYAqm+l7Kmr61n26ykpKvvRO/9CaXUHz7yki3
         K4pw==
X-Gm-Message-State: AOJu0YwFVVOV+pyVjWJ5blyPb40YU4F1iUGR20rzBbOkE0VGyK+y22hH
	8b9NV4SK36G4oSn+2cCJ5GEMnekNgds1d9aROSaMqnQ9NqVl6Tthpnh8+LsZNr+0KSCCseV7hev
	HqmfGBTNwiEX9s01Z
X-Received: by 2002:a2e:9a92:0:b0:2c0:28ca:940b with SMTP id p18-20020a2e9a92000000b002c028ca940bmr8648890lji.6.1695726145415;
        Tue, 26 Sep 2023 04:02:25 -0700 (PDT)
X-Received: by 2002:a2e:9a92:0:b0:2c0:28ca:940b with SMTP id p18-20020a2e9a92000000b002c028ca940bmr8648865lji.6.1695726145038;
        Tue, 26 Sep 2023 04:02:25 -0700 (PDT)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2.52.31.177])
        by smtp.gmail.com with ESMTPSA id j17-20020a170906051100b0098e2969ed44sm7608267eja.45.2023.09.26.04.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 04:02:24 -0700 (PDT)
Date: Tue, 26 Sep 2023 07:02:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, maz@kernel.org,
	jean-philippe@linaro.org, jonathan.cameron@huawei.com,
	lpieralisi@kernel.org, peter.maydell@linaro.org,
	richard.henderson@linaro.org, imammedo@redhat.com,
	andrew.jones@linux.dev, david@redhat.com, philmd@linaro.org,
	eric.auger@redhat.com, will@kernel.org, ardb@kernel.org,
	oliver.upton@linux.dev, pbonzini@redhat.com, gshan@redhat.com,
	rafael@kernel.org, borntraeger@linux.ibm.com,
	alex.bennee@linaro.org, linux@armlinux.org.uk,
	darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
	vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
	miguel.luis@oracle.com, salil.mehta@opnsrc.net,
	zhukeqian1@huawei.com, wangxiongfeng2@huawei.com,
	wangyanan55@huawei.com, jiakernel2@gmail.com, maobibo@loongson.cn,
	lixianglai@loongson.cn
Subject: Re: [PATCH RFC V2 24/37] hw/acpi: Update ACPI GED framework to
 support vCPU Hotplug
Message-ID: <20230926070112-mutt-send-email-mst@kernel.org>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-25-salil.mehta@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20230926100436.28284-25-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TUID: w8h8HhtkkzZL

On Tue, Sep 26, 2023 at 11:04:23AM +0100, Salil Mehta wrote:
> ACPI GED shall be used to convey to the guest kernel about any CPU hot-(un)plug
> events. Therefore, existing ACPI GED framework inside QEMU needs to be enhanced
> to support CPU hotplug state and events.
> 
> Co-developed-by: Salil Mehta <salil.mehta@huawei.com>

Co-developed with yourself?

didn't you co-develop this with xianglai li?

Just include his S.O.B then, and drop the non-standard Co-developed-by.



> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>



> ---
>  hw/acpi/generic_event_device.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index ad252e6a91..0266733a54 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -12,6 +12,7 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "hw/acpi/acpi.h"
> +#include "hw/acpi/cpu.h"
>  #include "hw/acpi/generic_event_device.h"
>  #include "hw/irq.h"
>  #include "hw/mem/pc-dimm.h"
> @@ -239,6 +240,8 @@ static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
>          } else {
>              acpi_memory_plug_cb(hotplug_dev, &s->memhp_state, dev, errp);
>          }
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> +        acpi_cpu_plug_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
>      } else {
>          error_setg(errp, "virt: device plug request for unsupported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> @@ -253,6 +256,8 @@ static void acpi_ged_unplug_request_cb(HotplugHandler *hotplug_dev,
>      if ((object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) &&
>                         !(object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM)))) {
>          acpi_memory_unplug_request_cb(hotplug_dev, &s->memhp_state, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> +        acpi_cpu_unplug_request_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
>      } else {
>          error_setg(errp, "acpi: device unplug request for unsupported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> @@ -266,6 +271,8 @@ static void acpi_ged_unplug_cb(HotplugHandler *hotplug_dev,
>  
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>          acpi_memory_unplug_cb(&s->memhp_state, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> +        acpi_cpu_unplug_cb(&s->cpuhp_state, dev, errp);
>      } else {
>          error_setg(errp, "acpi: device unplug for unsupported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> @@ -277,6 +284,7 @@ static void acpi_ged_ospm_status(AcpiDeviceIf *adev, ACPIOSTInfoList ***list)
>      AcpiGedState *s = ACPI_GED(adev);
>  
>      acpi_memory_ospm_status(&s->memhp_state, list);
> +    acpi_cpu_ospm_status(&s->cpuhp_state, list);
>  }
>  
>  static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
> @@ -291,6 +299,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>          sel = ACPI_GED_PWR_DOWN_EVT;
>      } else if (ev & ACPI_NVDIMM_HOTPLUG_STATUS) {
>          sel = ACPI_GED_NVDIMM_HOTPLUG_EVT;
> +    } else if (ev & ACPI_CPU_HOTPLUG_STATUS) {
> +        sel = ACPI_GED_CPU_HOTPLUG_EVT;
>      } else {
>          /* Unknown event. Return without generating interrupt. */
>          warn_report("GED: Unsupported event %d. No irq injected", ev);
> -- 
> 2.34.1

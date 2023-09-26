Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1037651ejc;
        Tue, 26 Sep 2023 05:00:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGzUcvf3MOdiS8YpM2R+jB/TCenIf7i8YlLyo/HnNecCjFxJJqQw+Be2xn+iwA34rDp2Ni
X-Received: by 2002:aa7:cd51:0:b0:523:ae0a:a446 with SMTP id v17-20020aa7cd51000000b00523ae0aa446mr9494177edw.24.1695729619443;
        Tue, 26 Sep 2023 05:00:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695729619; cv=none;
        d=google.com; s=arc-20160816;
        b=I5Oc+Uwuu9ZN9DsNwSemeZksirve+4/C5v4Vze4PZjH3HzZzrwGNXVFHM/DFC0VCjL
         69ow9dEcZqZvCOwZnz6FMM7NY7msnrv0ZCpvNCWq+E22s/W//tx3/Yvv7c10knc6BUpB
         HQHTsBkSzXHaSgXUSUHNJA4odJCrx8fsBa8C/saL92VBNGkqjBxgOPfRAeNrUybsAyzi
         5yeJTYYKfAgci1vhmXaB5XCWrmRU7g/iomHzh2Ep14XPuGniKJpcpGC0pN8ynxk1Iure
         5tc2cs+OXXacBsEY6HfqSuCQ84deCyTYrpGvPHTtpAJOtdbQprKrCySzHeItlHJDVocz
         y3+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=a4NmQkghllO1nGwm91UHl7HGCTJD6XVEi2WmtgRIkds=;
        fh=c/2wLF+PbO+AJzoD7vUhIzsugAiHxQh23wJvsCakykI=;
        b=EuKD9EP3WAGJ6MBP7MYBMxAfoWGh3tLIV5W3p4OjM3MzSRTZhC1QXKZ3GhtlTvdspY
         +B6OzGHHyZ6G5FIvIMKsLzMoVoIojo22OD0oq4fGI5i+/v+2gqPeQKUZrtpdyTY1Ac5A
         UBd1wLBK1+JopiirIK5KhDnPfHayrXh+9zDErvmP96wuPEjM1PbVR9gbxyqy8Ymi3zwW
         qOq0MRBJTmdweLDHcs/VTsmZ9nau7NIpZQIw98/s2aHarBb7KXa3GQiW7K1j0nlcXHgL
         h6t+cd8FHvsAwSS9J8iA76ZMMMUk8xc73hHFRixrvQfDARpNpP542NP6iDZIPyTrN2uF
         6pIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y0GMtna4;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id bc28-20020a056402205c00b005256b963009si5311856edb.663.2023.09.26.05.00.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 05:00:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y0GMtna4;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695729618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a4NmQkghllO1nGwm91UHl7HGCTJD6XVEi2WmtgRIkds=;
	b=Y0GMtna4vu+ES3Wm1HrWCrChMmMFIVefB6XrJPGjfq04K48K4zYZNcR6kZF+sq1HTc3lX+
	DDrCMlJpKHD4kM7C3LV7QJJFeFqxzE1ciD3H+V67PWJHShJWnOVlELnjW3rvCZNfSIngr5
	a27/39IiIB7l4fIStw9IKX03Um3iJXA=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-LhZFiNaCOBiExYOlFIkHUA-1; Tue, 26 Sep 2023 08:00:17 -0400
X-MC-Unique: LhZFiNaCOBiExYOlFIkHUA-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-50420b22ff4so13059295e87.1
        for <alex.bennee@linaro.org>; Tue, 26 Sep 2023 05:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695729615; x=1696334415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4NmQkghllO1nGwm91UHl7HGCTJD6XVEi2WmtgRIkds=;
        b=BkQ6BrL4GOZ9J1AhZvl4E9UPUKSgbsNVETrAwLLZFgowapm3GldWzLvLVqZvF90Cj3
         kGe3chn0Afe+9Ut5Gdz/1kaoV4wm6+4QLFbLU1kv20kFu/lJ0VIxH7Cfi8AtgHT+2npl
         cP3+e7JiB/JKb3glxOk4Rb7FZZsJOvxWNVA5dhP4Phudz5KMKoP7c8g9xJ2Fepngh+gP
         tnAnZ4qotrxsu0aBWMjsxNWRkr038HBfgbtKuPVqYKF74KwFzwCv3FwO2/iXxR0usZ48
         XjKqp4XlmrY5Sk2oZgec4N5L5T2lN0XTi6OYjl0SJCa4STXQA0m1ZXCgph+v7/jOD+/y
         cW5A==
X-Gm-Message-State: AOJu0YzKPTeWgkZAAyTZPoEcglwsU5ZRcGviXTTpsv1Irkl+HoLe744q
	dpMdJ7zCDyVH7OQ9o164+/hZ6vUgFpynP1346xoOYTuhCpQgdXNkreWUB4covIoNmthRI6AZdHX
	iCxyYRJ7pzW49PpmS
X-Received: by 2002:a05:6512:b0a:b0:4fb:9fa7:dcda with SMTP id w10-20020a0565120b0a00b004fb9fa7dcdamr9564737lfu.26.1695729615678;
        Tue, 26 Sep 2023 05:00:15 -0700 (PDT)
X-Received: by 2002:a05:6512:b0a:b0:4fb:9fa7:dcda with SMTP id w10-20020a0565120b0a00b004fb9fa7dcdamr9564686lfu.26.1695729615257;
        Tue, 26 Sep 2023 05:00:15 -0700 (PDT)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2.52.31.177])
        by smtp.gmail.com with ESMTPSA id c23-20020aa7d617000000b0052a1c0c859asm6802502edr.59.2023.09.26.05.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 05:00:14 -0700 (PDT)
Date: Tue, 26 Sep 2023 08:00:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"maz@kernel.org" <maz@kernel.org>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"imammedo@redhat.com" <imammedo@redhat.com>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>,
	"david@redhat.com" <david@redhat.com>,
	"philmd@linaro.org" <philmd@linaro.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"will@kernel.org" <will@kernel.org>,
	"ardb@kernel.org" <ardb@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"gshan@redhat.com" <gshan@redhat.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>,
	"miguel.luis@oracle.com" <miguel.luis@oracle.com>,
	"salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
	zhukeqian <zhukeqian1@huawei.com>,
	"wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
	"wangyanan (Y)" <wangyanan55@huawei.com>,
	"jiakernel2@gmail.com" <jiakernel2@gmail.com>,
	"maobibo@loongson.cn" <maobibo@loongson.cn>,
	"lixianglai@loongson.cn" <lixianglai@loongson.cn>
Subject: Re: [PATCH RFC V2 24/37] hw/acpi: Update ACPI GED framework to
 support vCPU Hotplug
Message-ID: <20230926075838-mutt-send-email-mst@kernel.org>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-25-salil.mehta@huawei.com>
 <20230926070112-mutt-send-email-mst@kernel.org>
 <f68a5ccc153f4971b5fbe681095a7624@huawei.com>
MIME-Version: 1.0
In-Reply-To: <f68a5ccc153f4971b5fbe681095a7624@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TUID: jrwLMU7xEtXd

On Tue, Sep 26, 2023 at 11:37:38AM +0000, Salil Mehta wrote:
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, September 26, 2023 12:02 PM
> > To: Salil Mehta <salil.mehta@huawei.com>
> > Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org; maz@kernel.org; jean-
> > philippe@linaro.org; Jonathan Cameron <jonathan.cameron@huawei.com>;
> > lpieralisi@kernel.org; peter.maydell@linaro.org;
> > richard.henderson@linaro.org; imammedo@redhat.com; andrew.jones@linux.dev;
> > david@redhat.com; philmd@linaro.org; eric.auger@redhat.com;
> > will@kernel.org; ardb@kernel.org; oliver.upton@linux.dev;
> > pbonzini@redhat.com; gshan@redhat.com; rafael@kernel.org;
> > borntraeger@linux.ibm.com; alex.bennee@linaro.org; linux@armlinux.org.uk;
> > darren@os.amperecomputing.com; ilkka@os.amperecomputing.com;
> > vishnu@os.amperecomputing.com; karl.heubaum@oracle.com;
> > miguel.luis@oracle.com; salil.mehta@opnsrc.net; zhukeqian
> > <zhukeqian1@huawei.com>; wangxiongfeng (C) <wangxiongfeng2@huawei.com>;
> > wangyanan (Y) <wangyanan55@huawei.com>; jiakernel2@gmail.com;
> > maobibo@loongson.cn; lixianglai@loongson.cn
> > Subject: Re: [PATCH RFC V2 24/37] hw/acpi: Update ACPI GED framework to
> > support vCPU Hotplug
> > 
> > On Tue, Sep 26, 2023 at 11:04:23AM +0100, Salil Mehta wrote:
> > > ACPI GED shall be used to convey to the guest kernel about any CPU hot-
> > (un)plug
> > > events. Therefore, existing ACPI GED framework inside QEMU needs to be
> > enhanced
> > > to support CPU hotplug state and events.
> > >
> > > Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
> > 
> > Co-developed with yourself?
> > 
> > didn't you co-develop this with xianglai li?
> 
> No, our effort is quite old ARM patch-set existed since the year 2020
> without any change. Please check the original patch-set here:
> 
> https://lore.kernel.org/qemu-devel/20200613213629.21984-11-salil.mehta@huawei.com/
> 
> 
> To be fair to the authors, it will not be right to add another SOB here.
> 

I see. And what's the difference with patches that xianglai li posted?
Are they both rebases of the same old patch then?

> 
> > 
> > Just include his S.O.B then, and drop the non-standard Co-developed-by.
> 
> Co-developed-by Tag has been added to ensure main authors of the patch
> get highlighted clearly.

I think I don't know the patch provenance at this point.

> 
> > 
> > 
> > 
> > > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> > > Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> > > Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> > > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> > 
> > 
> > 
> > > ---
> > >  hw/acpi/generic_event_device.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/hw/acpi/generic_event_device.c
> > b/hw/acpi/generic_event_device.c
> > > index ad252e6a91..0266733a54 100644
> > > --- a/hw/acpi/generic_event_device.c
> > > +++ b/hw/acpi/generic_event_device.c
> > > @@ -12,6 +12,7 @@
> > >  #include "qemu/osdep.h"
> > >  #include "qapi/error.h"
> > >  #include "hw/acpi/acpi.h"
> > > +#include "hw/acpi/cpu.h"
> > >  #include "hw/acpi/generic_event_device.h"
> > >  #include "hw/irq.h"
> > >  #include "hw/mem/pc-dimm.h"
> > > @@ -239,6 +240,8 @@ static void acpi_ged_device_plug_cb(HotplugHandler
> > *hotplug_dev,
> > >          } else {
> > >              acpi_memory_plug_cb(hotplug_dev, &s->memhp_state, dev,
> > errp);
> > >          }
> > > +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> > > +        acpi_cpu_plug_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
> > >      } else {
> > >          error_setg(errp, "virt: device plug request for unsupported
> > device"
> > >                     " type: %s", object_get_typename(OBJECT(dev)));
> > > @@ -253,6 +256,8 @@ static void acpi_ged_unplug_request_cb(HotplugHandler
> > *hotplug_dev,
> > >      if ((object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) &&
> > >                         !(object_dynamic_cast(OBJECT(dev),
> > TYPE_NVDIMM)))) {
> > >          acpi_memory_unplug_request_cb(hotplug_dev, &s->memhp_state, dev,
> > errp);
> > > +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> > > +        acpi_cpu_unplug_request_cb(hotplug_dev, &s->cpuhp_state, dev,
> > errp);
> > >      } else {
> > >          error_setg(errp, "acpi: device unplug request for unsupported
> > device"
> > >                     " type: %s", object_get_typename(OBJECT(dev)));
> > > @@ -266,6 +271,8 @@ static void acpi_ged_unplug_cb(HotplugHandler
> > *hotplug_dev,
> > >
> > >      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> > >          acpi_memory_unplug_cb(&s->memhp_state, dev, errp);
> > > +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
> > > +        acpi_cpu_unplug_cb(&s->cpuhp_state, dev, errp);
> > >      } else {
> > >          error_setg(errp, "acpi: device unplug for unsupported device"
> > >                     " type: %s", object_get_typename(OBJECT(dev)));
> > > @@ -277,6 +284,7 @@ static void acpi_ged_ospm_status(AcpiDeviceIf *adev,
> > ACPIOSTInfoList ***list)
> > >      AcpiGedState *s = ACPI_GED(adev);
> > >
> > >      acpi_memory_ospm_status(&s->memhp_state, list);
> > > +    acpi_cpu_ospm_status(&s->cpuhp_state, list);
> > >  }
> > >
> > >  static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits
> > ev)
> > > @@ -291,6 +299,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev,
> > AcpiEventStatusBits ev)
> > >          sel = ACPI_GED_PWR_DOWN_EVT;
> > >      } else if (ev & ACPI_NVDIMM_HOTPLUG_STATUS) {
> > >          sel = ACPI_GED_NVDIMM_HOTPLUG_EVT;
> > > +    } else if (ev & ACPI_CPU_HOTPLUG_STATUS) {
> > > +        sel = ACPI_GED_CPU_HOTPLUG_EVT;
> > >      } else {
> > >          /* Unknown event. Return without generating interrupt. */
> > >          warn_report("GED: Unsupported event %d. No irq injected", ev);
> > > --
> > > 2.34.1

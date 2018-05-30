Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4833148wre;
        Wed, 30 May 2018 07:52:00 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJJhnW2G1+03TSzyfVzgcCfgsUhRHts/3ulsowCu51lj+wPmVVkdC5zisOMn/gc2LWO5Wx3
X-Received: by 2002:aed:3c6e:: with SMTP id u43-v6mr2908092qte.59.1527691920230;
        Wed, 30 May 2018 07:52:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527691920; cv=none;
        d=google.com; s=arc-20160816;
        b=0U35ykeHxso5hgtX+nAyEGaUAHlQuyN5HL9MqZCkVwf1cnGNpYBtq1deMBlGHDPm0y
         JkG0kQx5uf4ues37hreej+v8BIs2OEvbCbKjcNs2RqpwwHCuJS5kCi5BzpGDCMqy1pdT
         HHm/O9BtbYUs8XLmxceT7hxTYaBBJ3wEBMw1ykDANbCYFXGE4BIqfn/MIebAdzHHPd7G
         OyJfXtmjsGx7Pv23GG34UwJFVSc4ZSSYKrWakrHZERUme6cY6F+r1gszvEXnzPA9o5ak
         MbEASsRfU7IZy2hWVru1BAjSusCSvnMPR8at6b+I1yYdDYnBTc6C9lENQhzLCqXg2yMw
         9xWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from:arc-authentication-results;
        bh=6pCN+rMPeLh4HeoSPyJ61vaZ5yGUqi1k2YeLoNSHXPU=;
        b=IVDPGG7o2zIQjy8mEHM6hUkQDYA/eVlonTnEEql160qQmYGIz4qKZv127amoDOMlbY
         LqaNVkcv+05ymtm4RCoXAGeJRNsc9C6Ha3FgK3fxOKuu7y1oOUtElV9sRw0G5c35lrkb
         vxyUXyK4S56lNLHTCZsZuhGay01YFHvGGOJSsLtE2TAcxjSLhSpHvyAT7l/QI92inCdt
         /odheDErLpoNCQT1VA4OZyUBRXnNuY1M4YPU+XFHKjkrD3tnyGXppZnZkGZZOYy5MK59
         HLC0tbynrzN8qLSNNIj5+14wHpJjOCytAnBmm9adz4F44DvMlRxXzlu+iYc8MuN8zUKP
         szrw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 75-v6si13442703qvb.84.2018.05.30.07.52.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 07:52:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39126 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fO2SF-0001lk-NS
	for alex.bennee@linaro.org; Wed, 30 May 2018 10:51:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fO2S5-0001kF-F2
	for qemu-arm@nongnu.org; Wed, 30 May 2018 10:51:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fO2S4-0003vy-GL
	for qemu-arm@nongnu.org; Wed, 30 May 2018 10:51:49 -0400
Received: from lhrrgout.huawei.com ([194.213.3.17]:4232 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fO2S4-0003va-9Y; Wed, 30 May 2018 10:51:48 -0400
Received: from LHREML710-CAH.china.huawei.com (unknown [172.18.7.107])
	by Forcepoint Email with ESMTP id B8281809D94D8;
	Wed, 30 May 2018 15:51:44 +0100 (IST)
Received: from FRAEML702-CAH.china.huawei.com (10.206.14.33) by
	LHREML710-CAH.china.huawei.com (10.201.108.33) with Microsoft SMTP
	Server (TLS) id 14.3.382.0; Wed, 30 May 2018 15:51:46 +0100
Received: from FRAEML521-MBX.china.huawei.com ([169.254.1.176]) by
	fraeml702-cah.china.huawei.com ([10.206.14.33]) with mapi id
	14.03.0382.000; Wed, 30 May 2018 16:51:33 +0200
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Andrew Jones <drjones@redhat.com>
Thread-Topic: [Qemu-devel] [RFC v2 5/6] hw/arm: ACPI SRAT changes to
	accommodate non-contiguous mem
Thread-Index: AQHT7SmpYI2NC6rNu0iKJTB5+4o8hKRFT3QAgAMWYuA=
Date: Wed, 30 May 2018 14:51:32 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA8386F1839@FRAEML521-MBX.china.huawei.com>
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
	<20180516152026.2920-6-shameerali.kolothum.thodi@huawei.com>
	<20180528170226.3ynif3r34yejf7tp@kamzik.brq.redhat.com>
In-Reply-To: <20180528170226.3ynif3r34yejf7tp@kamzik.brq.redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 194.213.3.17
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 5/6] hw/arm: ACPI SRAT changes
 to accommodate non-contiguous mem
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	Zhaoshenglong <zhaoshenglong@huawei.com>, Linuxarm <linuxarm@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 30ajo85vw5Bz



> -----Original Message-----
> From: Andrew Jones [mailto:drjones@redhat.com]
> Sent: Monday, May 28, 2018 6:02 PM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> peter.maydell@linaro.org; Jonathan Cameron
> <jonathan.cameron@huawei.com>; Linuxarm <linuxarm@huawei.com>;
> eric.auger@redhat.com; alex.williamson@redhat.com; Zhaoshenglong
> <zhaoshenglong@huawei.com>; imammedo@redhat.com
> Subject: Re: [Qemu-devel] [RFC v2 5/6] hw/arm: ACPI SRAT changes to
> accommodate non-contiguous mem
>=20
> On Wed, May 16, 2018 at 04:20:25PM +0100, Shameer Kolothum wrote:
> > This is in preparation for the next patch where initial ram is split
> > into a non-pluggable chunk and a pc-dimm modeled mem if  the vaild
> > iova regions are non-contiguous.
> >
> > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > ---
> >  hw/arm/virt-acpi-build.c | 24 ++++++++++++++++++++----
> >  1 file changed, 20 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index c7c6a57..8d17b40 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -488,7 +488,7 @@ build_srat(GArray *table_data, BIOSLinker *linker,
> VirtMachineState *vms)
> >      AcpiSratProcessorGiccAffinity *core;
> >      AcpiSratMemoryAffinity *numamem;
> >      int i, srat_start;
> > -    uint64_t mem_base;
> > +    uint64_t mem_base, mem_sz, mem_len;
> >      MachineClass *mc =3D MACHINE_GET_CLASS(vms);
> >      const CPUArchIdList *cpu_list =3D mc-
> >possible_cpu_arch_ids(MACHINE(vms));
> >
> > @@ -505,12 +505,28 @@ build_srat(GArray *table_data, BIOSLinker *linker=
,
> VirtMachineState *vms)
> >          core->flags =3D cpu_to_le32(1);
> >      }
> >
> > -    mem_base =3D vms->memmap[VIRT_MEM].base;
> > +    mem_base =3D vms->bootinfo.loader_start;
> > +    mem_sz =3D vms->bootinfo.loader_start;
>=20
> mem_sz =3D vms->bootinfo.ram_size;
>=20
> Assuming the DT generator was correct, meaning bootinfo.ram_size will
> be the size of the non-pluggable dimm.

Oops!. I will correct that.

Thanks,
Shameer


> >      for (i =3D 0; i < nb_numa_nodes; ++i) {
> >          numamem =3D acpi_data_push(table_data, sizeof(*numamem));
> > -        build_srat_memory(numamem, mem_base, numa_info[i].node_mem, i,
> > +        mem_len =3D MIN(numa_info[i].node_mem, mem_sz);
> > +        build_srat_memory(numamem, mem_base, mem_len, i,
> >                            MEM_AFFINITY_ENABLED);
> > -        mem_base +=3D numa_info[i].node_mem;
> > +        mem_base +=3D mem_len;
> > +        mem_sz -=3D mem_len;
> > +        if (!mem_sz) {
> > +            break;
> > +        }
> > +    }
> > +
> > +    /* Create table for initial pc-dimm ram, if any */
> > +    if (vms->bootinfo.dimm_mem) {
> > +        numamem =3D acpi_data_push(table_data, sizeof(*numamem));
> > +        build_srat_memory(numamem, vms->bootinfo.dimm_mem->base,
> > +                          vms->bootinfo.dimm_mem->size,
> > +                          vms->bootinfo.dimm_mem->node,
> > +                          MEM_AFFINITY_ENABLED);
> > +
> >      }
> >
> >      build_header(linker, table_data, (void *)(table_data->data + srat_=
start),
> > --
> > 2.7.4
> >
> >
> >

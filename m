Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9379935wrv;
        Fri, 9 Aug 2019 09:03:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwO8v4csNogfpee7/ETmiOA288ItjuukNLY8Hf/MyQ1O6/IvUwaChubGsvmhjUi5gz4uLU5
X-Received: by 2002:a17:906:5859:: with SMTP id h25mr19280331ejs.202.1565366595837;
        Fri, 09 Aug 2019 09:03:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565366595; cv=none;
        d=google.com; s=arc-20160816;
        b=OuL6A8Hqzq2oqdCXFsPzk4qDRj2ggL/P555FR9KlELTDPWUvkp1+Qa7FDAHLMxERlH
         efaTHVq+DXV0vti+7cFPcRkq7NwI5dqStApOljiBa1werTZIQ6rF9QRmFOqc70bK/PCU
         21CCxJ1gmqRaLchH3GyNMWlSBaV0Z16na1QOYJjfWxPNp6kBHfKIAAI9v4eiFA/4DA8a
         OJFvrQPe6ygeStqkzdZvYD6FFunCF2ssLbOg4q/e4XqWS73Cxb8e2X7KlX0Z0LLIPzpn
         /UzWz/9ngX0HhcEbHO4ROtSOzLfQNjAxY3im+BX/d+gjOmz9BJ4YlpeenSDFrYcwwvIP
         8Ccw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=XLeDDirrk24Yz4cG2C4ANkKTwQoJ1r+w8usG64ptrzg=;
        b=T6Vkhf00TbCK6172JcOFzGfh5vony9uDjHMBu0VgukjmAxPOSh2BrFPSleNx6G2pof
         FgrDHmmY6nG2FbkcIYSgRSByWKh9VIdD9100cwY8ND12bnXngrEKmnsfpLHGACrKRvM9
         LUzKkRoElf/ILcZGRIPExgif/AFlU5ZxMTe6q5Gy4QLAvTY5Wiw4nhmaZeOIyPuqCH0t
         412wnwc8m/d/S9OUXseWwf+u2+fm/XeDkzZStW4HpvYAzpafN2TYGd/3PngNlMrDGUkA
         zZk8w3B0q+tBqqBscQZwz4gUa0ofn5kNyZJkFkIo7sNn/h4YD5yYa8wqokHSo4QAnCXA
         LzWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11si34071730ejb.137.2019.08.09.09.03.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2019 09:03:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hw7MI-0007Tn-Sk
	for alex.bennee@linaro.org; Fri, 09 Aug 2019 12:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54921)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hw7M4-0007NI-U1
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 12:03:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hw7M3-00068M-Im
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 12:03:00 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45433 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hw7M3-00062v-C2; Fri, 09 Aug 2019 12:02:59 -0400
Received: from lhreml707-cah.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id EB33D49403AA34C5652D;
 Fri,  9 Aug 2019 17:02:51 +0100 (IST)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.132]) by
 lhreml707-cah.china.huawei.com ([10.201.108.48]) with mapi id 14.03.0415.000; 
 Fri, 9 Aug 2019 17:02:39 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
Thread-Topic: [Qemu-devel] [PATCH-for-4.2 v8 7/9] hw/arm/virt-acpi-build:
 Add PC-DIMM in SRAT
Thread-Index: AQHVQ5+cfqB1e2O8jUOXpcKQKko1GKbuG7sAgATsqLA=
Date: Fri, 9 Aug 2019 16:02:39 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA83F34B396@lhreml524-mbs.china.huawei.com>
References: <20190726104519.23812-1-shameerali.kolothum.thodi@huawei.com>
 <20190726104519.23812-8-shameerali.kolothum.thodi@huawei.com>
 <20190806152136.3afbfb4b@redhat.com>
In-Reply-To: <20190806152136.3afbfb4b@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.176.76.210
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH-for-4.2 v8 7/9]
 hw/arm/virt-acpi-build: Add PC-DIMM in SRAT
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "sameo@linux.intel.com" <sameo@linux.intel.com>,
 "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "xuwei \(O\)" <xuwei5@huawei.com>,
 "sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
 "lersek@redhat.com" <lersek@redhat.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 05qnJpZir5Cu

Hi Igor,

> -----Original Message-----
> From: Qemu-devel
> [mailto:qemu-devel-bounces+shameerali.kolothum.thodi=3Dhuawei.com@nongn
> u.org] On Behalf Of Igor Mammedov
> Sent: 06 August 2019 14:22
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: peter.maydell@linaro.org; sameo@linux.intel.com;
> ard.biesheuvel@linaro.org; shannon.zhaosl@gmail.com;
> qemu-devel@nongnu.org; xuwei (O) <xuwei5@huawei.com>; Linuxarm
> <linuxarm@huawei.com>; eric.auger@redhat.com; qemu-arm@nongnu.org;
> sebastien.boeuf@intel.com; lersek@redhat.com
> Subject: Re: [Qemu-devel] [PATCH-for-4.2 v8 7/9] hw/arm/virt-acpi-build: =
Add
> PC-DIMM in SRAT
>=20
> On Fri, 26 Jul 2019 11:45:17 +0100
> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
>=20
> > Generate Memory Affinity Structures for PC-DIMM ranges.
> >
> > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  hw/arm/virt-acpi-build.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index 018b1e326d..75657caa36 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -518,6 +518,7 @@ build_srat(GArray *table_data, BIOSLinker *linker,
> VirtMachineState *vms)
> >      int i, srat_start;
> >      uint64_t mem_base;
> >      MachineClass *mc =3D MACHINE_GET_CLASS(vms);
> > +    MachineState *ms =3D MACHINE(vms);
> >      const CPUArchIdList *cpu_list =3D
> mc->possible_cpu_arch_ids(MACHINE(vms));
> >
> >      srat_start =3D table_data->len;
> > @@ -543,6 +544,14 @@ build_srat(GArray *table_data, BIOSLinker *linker,
> VirtMachineState *vms)
> >          }
> >      }
> >
> > +    if (ms->device_memory) {
> > +        numamem =3D acpi_data_push(table_data, sizeof *numamem);
> > +        build_srat_memory(numamem, ms->device_memory->base,
> > +
> memory_region_size(&ms->device_memory->mr),
> > +                          nb_numa_nodes - 1,
> > +                          MEM_AFFINITY_HOTPLUGGABLE |
> MEM_AFFINITY_ENABLED);
> > +    }
> > +
> >      build_header(linker, table_data, (void *)(table_data->data +
> srat_start),
> >                   "SRAT", table_data->len - srat_start, 3, NULL, NULL);
> >  }
>=20
> missing entry in
>   tests/bios-tables-test-allowed-diff.h

I can't find any SRAT file in tests/data/acpi/virt. Arm/virt doesn't have m=
uch
tests in bios-tables-test.c. So does it make any difference?

> PS:
> I don't really know what ARM guest kernel expects but on x86 we had to en=
able
> numa
> for guest to figure out max_possible_pfn
> (see: in linux.git: 8dd330300197 / ec941c5ffede).

From whatever I can find, doesn't look like there is any special handling o=
f
max_possible_pfn in ARM64 world. The variable seems to be only updated
in acpi_numa_memory_affinity_init()

https://elixir.bootlin.com/linux/v5.3-rc3/source/drivers/acpi/numa.c#L298

Is there any way to test this in Guest to see whether this is actually a pr=
oblem?

Thanks,
Shameer

> It's worth to check if we might need a patch for turning on NUMA
> (how to do it in QEMU see: auto_enable_numa_with_memhp)

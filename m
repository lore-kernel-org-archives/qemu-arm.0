Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp330950wrs;
        Tue, 12 Mar 2019 03:48:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxnVu5qt4vzaykXCSQ2mFpR+YF76z5uZtTVsvI8aYqSyToifqlpWhKOr3caysX9Ohlf2+2O
X-Received: by 2002:a81:8583:: with SMTP id v125mr13420798ywf.79.1552387724587;
        Tue, 12 Mar 2019 03:48:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552387724; cv=none;
        d=google.com; s=arc-20160816;
        b=f9mB0lzwphUFIX8itN//e76IsLrnuhVZhsnWlhKePRG/AHAOI5JsJVaZ0wHsyA+FA+
         oUq3ZqK80DFtQc2rDt/KDQrxB1vxwjXOlZM9MwZckl5Oaw3OaXRjyLkB27NRKm2K1dq/
         tFMpr1Zc664UV2M001FUno9vvzLFhpvP+z5ICZgNwa0gItCJo0coNXEWeI21dRVPSbDW
         W4GXMHCynUfYN2AtOXsnM5k6/34iaOIPpx13hirXO3/nidRQGT76ZyrLyGPo7dIG+oNR
         TTrZtAxXcicUYsF9q7C8TgBdnk4h1lOD5POSOem80kWLtG+baaKFKb1SZ6E1WpRnS+1c
         Q7kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=n4mJzrt4rsZbUwFnR15+b04+swTrvvi9JGE4wy7qh8g=;
        b=BxBDSFajgYxKvyALogAzaRjrpSPrvRxZVMgO1FVIK+ZFlSifR+HAqfAKC+t/tKPPZO
         I/IRdpGdSJ96QQUHtnE3DFzjrAUZNIpwVGJPZ0wk8bVXJLAXqo71n7HjNjH5zTTD8MI1
         RJ/ya7CFrhyUrErRekMVdNSnjr6aGdXa9uJtPmxSzm2Gl0t/hm7HYjT6eAEsjo1B/RRE
         WfwTDQQUtkUojMMzEmQuwBdZ4MvG+dj3816fjE7Wbv8GKsaUCZmOknp4TfI+xgXoIMZt
         clVUGwpOsnuMnkLrY7T8w61HOUicQh2eKNIZNdYCjX2nRgeTk7x6CCC4subn9UBI/tHK
         liNg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9si4659924yby.37.2019.03.12.03.48.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 03:48:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:49509 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3exg-0004cN-0J
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 06:48:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h3eJs-0005i2-1W
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 06:07:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h3eAk-0000Lt-Iw
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 05:58:11 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45362 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h3eAk-0000Jz-B7; Tue, 12 Mar 2019 05:58:10 -0400
Received: from lhreml702-cah.china.huawei.com (unknown [172.18.7.107])
	by Forcepoint Email with ESMTP id 2C8DD6F7A78BEBCF03DB;
	Tue, 12 Mar 2019 09:58:08 +0000 (GMT)
Received: from LHREML524-MBB.china.huawei.com ([169.254.3.135]) by
	lhreml702-cah.china.huawei.com ([10.201.108.43]) with mapi id
	14.03.0415.000; Tue, 12 Mar 2019 09:57:59 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
Thread-Topic: [PATCH v2 07/11] hw/arm/virt-acpi-build: Add PC-DIMM in SRAT
Thread-Index: AQHU1aRv1riuM+Z9Uk2L+3mxlLSsTqYGiZOAgAE9ubA=
Date: Tue, 12 Mar 2019 09:57:58 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA839305718@lhreml524-mbb.china.huawei.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
	<20190308114218.26692-8-shameerali.kolothum.thodi@huawei.com>
	<20190311155513.14320cd2@redhat.com>
In-Reply-To: <20190311155513.14320cd2@redhat.com>
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
Subject: Re: [Qemu-arm] [PATCH v2 07/11] hw/arm/virt-acpi-build: Add PC-DIMM
 in SRAT
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
	"sameo@linux.intel.com" <sameo@linux.intel.com>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /bTjZC73yFQZ



> -----Original Message-----
> From: Igor Mammedov [mailto:imammedo@redhat.com]
> Sent: 11 March 2019 14:55
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> eric.auger@redhat.com; peter.maydell@linaro.org;
> shannon.zhaosl@gmail.com; sameo@linux.intel.com;
> sebastien.boeuf@intel.com; Linuxarm <linuxarm@huawei.com>; xuwei (O)
> <xuwei5@huawei.com>
> Subject: Re: [PATCH v2 07/11] hw/arm/virt-acpi-build: Add PC-DIMM in SRAT
>=20
> On Fri, 8 Mar 2019 11:42:14 +0000
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
> > index 87d66da..6cb7263 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -524,6 +524,7 @@ build_srat(GArray *table_data, BIOSLinker *linker,
> VirtMachineState *vms)
> >      int i, srat_start;
> >      uint64_t mem_base;
> >      MachineClass *mc =3D MACHINE_GET_CLASS(vms);
> > +    MachineState *ms =3D MACHINE(vms);
> >      const CPUArchIdList *cpu_list =3D
> mc->possible_cpu_arch_ids(MACHINE(vms));
> >
> >      srat_start =3D table_data->len;
> > @@ -549,6 +550,14 @@ build_srat(GArray *table_data, BIOSLinker *linker,
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
>=20
> do we care about 'Windows' guests?
> if yes then we should drop this patch,
> see commit for reasoning dbb6da8ba7e

If I understood that commit, that is reverting to use a single entry for wh=
ole
hotplug area instead of splitting into multiple entries. ie, remove
build_srat_hotpluggable_memory() and use build_srat_memory() instead,
which is what this patch does.

May be I am missing something here. Please let me know.

Thanks,
Shameer

> >      build_header(linker, table_data, (void *)(table_data->data +
> srat_start),
> >                   "SRAT", table_data->len - srat_start, 3, NULL, NULL);
> >  }


Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2172620wrs;
        Thu, 29 Aug 2019 06:45:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw5qz1f7sf6ay7LCOsrnoNES5OVUv8Ck9dtjG0l8dzHnYEpHMv+cAnNtTEiKv2tLy2sWY5n
X-Received: by 2002:aa7:db43:: with SMTP id n3mr4289315edt.136.1567086349823;
        Thu, 29 Aug 2019 06:45:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567086349; cv=none;
        d=google.com; s=arc-20160816;
        b=LENUfa5pVAoT6e30MSPn/dBfDvIlYdh/ICb5zo7nmVpWhhEQdjI8p1TGcAsKULSlLy
         IJlw+OSB86g5wP6VEfHXe4IIMDjq04F7DmwoHFaogWxqE6tkjmvyTtmBSWAHF6sBfPYD
         TCaLGfhvaqBvdH0anmw3c1mQ/EoOnVcCEuCNIKWq3rz4s4+9iWgcXoOEsP2ejW2k2qn0
         ysmFhslYqQ8X1hTve+vnLXsycYxh9K04+dTagDhSaBUgaheRqoFgVbA/9jXhoN8/9hOA
         pnRH4M/TylclSAXQj8T1L/PswGi7kQ6ij2tBG8oeqdhUUh0lC965I5vLD+jgZP44zLqP
         vRGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=cNOptuONIsxX/mSVJtpgvHdDGFO5tn09CNVGLZ6yr+s=;
        b=FD0aN3BdFSpe71a0zdaTH+OhFNTiFqYWm6qpCefRYVtTatazAqoEjR6jv19zBJ5ZCy
         2HBrNtmaK87bLk+Y0e8B7xfsMxQadSydBJ9tyXYLP/WAjSW+jffYFfI9f1HqdkJ2LlkN
         qkaWhnKA6c2qn6nSkI/QrarzBMY9hiHlWmfvx4wP0+TGHzi2CDkqR3tWU05EIQhe1jdP
         PhrvJ+PMVnqhNO6cZ+n/7LJa/LLnj9Mi3vgI4q6gOZWpEB7q01aEFptyR2yULTgtjHgw
         62X5xAArRUoS7R9ftkHQbAB/7e3/o2FEdPRrsafRlSAppK7i808lqEGFc8BpriNwhg9q
         /2vw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gs24si1179264ejb.50.2019.08.29.06.45.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2019 06:45:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i3KkG-0000qI-Or
	for alex.bennee@linaro.org; Thu, 29 Aug 2019 09:45:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58181)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i3Kk7-0000qA-16
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 09:45:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i3Kk5-0007wa-QF
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 09:45:38 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45436 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i3Kk5-0007uY-Ij; Thu, 29 Aug 2019 09:45:37 -0400
Received: from LHREML714-CAH.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id 97C3896467875FF8B1EB;
 Thu, 29 Aug 2019 14:45:33 +0100 (IST)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.92]) by
 LHREML714-CAH.china.huawei.com ([10.201.108.37]) with mapi id 14.03.0415.000; 
 Thu, 29 Aug 2019 14:45:24 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
Thread-Topic: [PATCH-for-4.2 v9 01/12] hw/acpi: Make ACPI IO address space
 configurable
Thread-Index: AQHVXkYfh6DcS0TZ1kGZvays3xLkbacR8aaAgAAORQCAACK90A==
Date: Thu, 29 Aug 2019 13:45:23 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA83F3A23B5@lhreml524-mbs.china.huawei.com>
References: <20190813210539.31164-1-shameerali.kolothum.thodi@huawei.com>
 <20190813210539.31164-2-shameerali.kolothum.thodi@huawei.com>
 <5FC3163CFD30C246ABAA99954A238FA83F36E598@lhreml524-mbs.china.huawei.com>
 <20190829104518.0995e7c5@redhat.com>
 <5FC3163CFD30C246ABAA99954A238FA83F3A2027@lhreml524-mbs.china.huawei.com>
 <20190829143810.1dc33818@redhat.com>
In-Reply-To: <20190829143810.1dc33818@redhat.com>
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
Subject: Re: [Qemu-arm] [PATCH-for-4.2 v9 01/12] hw/acpi: Make ACPI IO
 address space configurable
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
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
 "lersek@redhat.com" <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ekLfkFYbJGxV



> -----Original Message-----
> From: Igor Mammedov [mailto:imammedo@redhat.com]
> Sent: 29 August 2019 13:38
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> eric.auger@redhat.com; peter.maydell@linaro.org; sameo@linux.intel.com;
> ard.biesheuvel@linaro.org; Linuxarm <linuxarm@huawei.com>;
> shannon.zhaosl@gmail.com; sebastien.boeuf@intel.com; lersek@redhat.com
> Subject: Re: [PATCH-for-4.2 v9 01/12] hw/acpi: Make ACPI IO address space
> configurable
>=20
> On Thu, 29 Aug 2019 11:04:27 +0000
> Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:

[...]

> >
> > I think what happens is since we are now passing the memhp_io_base
> directly into the
> > build_memory_hotplug_aml() and removed the "static uint16_t
> memhp_io_base", on
> > x86, memory hotplug aml code is always built by default irrespective of
> whether
> > acpi_memory_hotplug_init() is invoked or not.
> >
> > I could either reintroduce a check in build_memory_hotplug_aml() to mak=
e
> sure
> > acpi_memory_hotplug_init() is called, or could do something like below,

> fix looks fine to me, see minor comment below

Ok
=20
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index 3995f9a40f..17756c2191 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -1873,9 +1873,12 @@ build_dsdt(GArray *table_data, BIOSLinker
> *linker,
> >          build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
> >                         "\\_SB.PCI0", "\\_GPE._E02");
> >      }
> > -    build_memory_hotplug_aml(dsdt, nr_mem, "\\_SB.PCI0",
> > -                             "\\_GPE._E03", AML_SYSTEM_IO,
> > -                             pcms->memhp_io_base);
> > +
> > +    if (acpi_enabled && pcms->acpi_dev && nr_mem) {
> double-check call path and see if
>   acpi_enabled && pcms->acpi_dev
> is really necessary

Right, looks like those are always true. I will remove those.

Also appreciate if you could take a look at rest of the series and then I c=
an
re-spin along with this.

Thanks,
Shameer
=20

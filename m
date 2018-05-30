Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4821589wre;
        Wed, 30 May 2018 07:39:44 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJAQe1pH9ebvkd/zIsE55YLqPHHtCP9T7p9KV4fxs+0ypCFfVER62xRo+j1NWZqyOwGtJ7O
X-Received: by 2002:a37:8542:: with SMTP id h63-v6mr2526160qkd.342.1527691183970;
        Wed, 30 May 2018 07:39:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527691183; cv=none;
        d=google.com; s=arc-20160816;
        b=hhHjXPxpp2Si+rF3PQfZl9EqhgkPdGYv4ag7ezvqEp9b246dQxrtcmlF7Rem5BESww
         AL/ra9wJIrbcBZBo2OAACbFAsdLBIvXFaLTW1Tkc46k3YC5DpNUAzLDtmxK19iQy/lX8
         15aRdi3x43l6P3VUUSYNeYLVqWcC4VginPckBGoXF50GG8swwQ63iPV3o8DImQdVXzEp
         u8C4Fw4B19QMlTo2wGHxXhO3hWDR0JBU0ZbInQWSg3mldc7m7M/033EOYjoEZVhuDFj9
         AJTHlr5sy+tA+0z3hC6cKmX1XWAuIG+YoVJZCSqG3q53Gkxog+K7w+2LVjigSyAcuJcR
         DHNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from:arc-authentication-results;
        bh=3m9KIEwutCTGqGtoGSayox8pNts84lwpLaXDgGrbhuw=;
        b=QpG7nSZavDVnhzefNRPILyanK+gNJw1aTeih9CAWFDrM1wKutQOG3yopXSWgnsfWGy
         0fEE+AFL53cU2LKFSQqi0BFfaKNjOu9xqfp7nzfBanZNlKLPYC2K4HAdRqJbIHdfxMtk
         KHHulY5vaD1xH8vULY6WJ25HsqAEg7EOS//v4sFcULVSDgCkoPSG9M0aPWqtGUZZHl8R
         bRM7qMXHbqcYtmH0TnRqZDMzwaYMOgqnim8XtfVgDapWU6MQ59aCSTNn4PNKUFmQ5jtc
         EgJPZlHAAoatyoCrcXCg8vDJyHn1p5fU7pD9B0iJsSn1hKVF4aFm5eflRqMeVy/EHSA/
         k3EQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g66-v6si5430836qke.363.2018.05.30.07.39.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 07:39:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39028 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fO2GN-00026K-E0
	for alex.bennee@linaro.org; Wed, 30 May 2018 10:39:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37579)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fO2GA-00024Z-ME
	for qemu-arm@nongnu.org; Wed, 30 May 2018 10:39:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fO2G7-00060w-0m
	for qemu-arm@nongnu.org; Wed, 30 May 2018 10:39:30 -0400
Received: from lhrrgout.huawei.com ([194.213.3.17]:4225 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fO2G6-0005xd-Qz; Wed, 30 May 2018 10:39:26 -0400
Received: from LHREML710-CAH.china.huawei.com (unknown [172.18.7.107])
	by Forcepoint Email with ESMTP id 30EFC437F817D;
	Wed, 30 May 2018 15:39:20 +0100 (IST)
Received: from FRAEMA706-CHM.china.huawei.com (10.206.14.55) by
	LHREML710-CAH.china.huawei.com (10.201.108.33) with Microsoft SMTP
	Server (TLS) id 14.3.382.0; Wed, 30 May 2018 15:39:21 +0100
Received: from FRAEML521-MBX.china.huawei.com ([169.254.1.176]) by
	FRAEMA706-CHM.china.huawei.com ([169.254.6.146]) with mapi id
	14.03.0382.000; Wed, 30 May 2018 16:39:14 +0200
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: [RFC v2 0/6] hw/arm: Add support for non-contiguous iova regions
Thread-Index: AQHT7Smax6XNQgKXY0+403Fmg8dvxKRFIqSAgAMLyyA=
Date: Wed, 30 May 2018 14:39:13 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA8386F1799@FRAEML521-MBX.china.huawei.com>
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
	<f365f305-175c-db54-677d-6f66719b24cd@redhat.com>
In-Reply-To: <f365f305-175c-db54-677d-6f66719b24cd@redhat.com>
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
Subject: Re: [Qemu-arm] [RFC v2 0/6] hw/arm: Add support for non-contiguous
 iova regions
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
	"drjones@redhat.com" <drjones@redhat.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Linuxarm <linuxarm@huawei.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	Zhaoshenglong <zhaoshenglong@huawei.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RlghD1v0nDFS

Hi Eric,

> -----Original Message-----
> From: Auger Eric [mailto:eric.auger@redhat.com]
> Sent: Monday, May 28, 2018 3:22 PM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
> qemu-devel@nongnu.org; qemu-arm@nongnu.org
> Cc: drjones@redhat.com; imammedo@redhat.com; peter.maydell@linaro.org;
> alex.williamson@redhat.com; Zhaoshenglong <zhaoshenglong@huawei.com>;
> Jonathan Cameron <jonathan.cameron@huawei.com>; Linuxarm
> <linuxarm@huawei.com>
> Subject: Re: [RFC v2 0/6] hw/arm: Add support for non-contiguous iova reg=
ions
>=20
> Hi Shameer,
>=20
> On 05/16/2018 05:20 PM, Shameer Kolothum wrote:
> > When the kernel reports valid iova ranges as non-contiguous,
> > memory should be allocated to Guest in such a way that
> > reserved regions(holes) are not visible by Guest.
> >
> > This series retrieves the valid iova ranges based on the new
> > proposed VFIO interface for kernel [1]. It then populates the
> > first 1GB ram as a non-pluggable dimm and rest as a pc-dimm if
> > the valid iova ranges are non-contiguous.
>=20
> Some general comments:

Thanks for going through this series.

> - what are your plans with respect to VFIO device hot-plug handling?
> IIUC, at the moment, any collision between reserved regions induces by
> hot-plugged devices are not detected/handled. I understand mem hotplug
> is not supported on aarch64. Would you simply reject the vfio device
> hotplug.

As per the new kernel changes, the _attach_group() will fail if the device=
=20
reserved regions conflicts with any existing dma mappings of the VM.=20
So my understanding is that, host kernel will in effect reject any hot-plug
device that has a reserved region conflicting with dma mappings.

> - IIUC any reserved window colliding with [4000000, 1GB] cold-plug RAM
> segment is show-stopper. How was this 1GB size chosen exactly?

Yes, any reserved window in that region might prevent the Guest from bootin=
g
with UEFI as the current solution will move the base start address . I thin=
k this is
because the EDK2 UEFI expects the base to start at 0x4000000[1]. I am not s=
ure
why this is required by the UEFI as without the "-bios" option, the Guest c=
an be
booted as long as base addr < 4GB.

> - Currently you create a single PC-DIMM node whereas several ones may be
> possible & necessary? Do you plan to support multiple PC-DIMMS node?

Yes, that is correct. This is mainly to keep it simple and with the expecta=
tion that
the valid host iova regions may not be that fragmented. I can look into ext=
ent this
to support multiple pc-dimms if there is an immediate requirement to do so.
=20
> - I have started looking at RAM extension on machvirt. I think adding
> support of PC-DIMMS through the qemu cmd line is something that we need
> to work on, in paralell.

Ok. Do you have more info that you can share on this? Please let me know.

Thanks,
Shameer

[1] https://github.com/tianocore/edk2/blob/master/ArmVirtPkg/ArmVirtQemu.ds=
c#L133

> Thanks
>=20
> Eric
> >
> > Patch #3 of this series is loosely based on an earlier attempt
> > by Kwangwoo Lee to add hotplug/pc-dimm support to arm64[2]
> >
> > RFC v1[3] --> RFCv2
> >  -Based on new VFIO kernel interface
> >  -Part of Mem modelled as pc-dimm
> >  -Rebased to qemu 2.12.0
> >
> > [1] https://lkml.org/lkml/2018/4/18/293
> > [2] https://lists.gnu.org/archive/html/qemu-devel/2016-07/msg04600.html
> > [3] https://lists.gnu.org/archive/html/qemu-devel/2017-11/msg02412.html
> >
> > Shameer Kolothum (6):
> >   hw/vfio: Retrieve valid iova ranges from kernel
> >   hw/arm/virt: Enable dynamic generation of guest RAM memory regions
> >   hw/arm/virt: Add pc-dimm mem hotplug framework
> >   hw/arm: Changes required to accommodate non-contiguous DT mem nodes
> >   hw/arm: ACPI SRAT changes to accommodate non-contiguous mem
> >   hw/arm: Populate non-contiguous memory regions
> >
> >  default-configs/aarch64-softmmu.mak |   1 +
> >  hw/arm/boot.c                       |  91 ++++++---
> >  hw/arm/virt-acpi-build.c            |  24 ++-
> >  hw/arm/virt.c                       | 367
> +++++++++++++++++++++++++++++++++++-
> >  hw/vfio/common.c                    | 108 ++++++++++-
> >  include/hw/arm/arm.h                |  12 ++
> >  include/hw/arm/virt.h               |   3 +
> >  include/hw/vfio/vfio-common.h       |   7 +
> >  linux-headers/linux/vfio.h          |  23 +++
> >  9 files changed, 589 insertions(+), 47 deletions(-)
> >

Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp403634lfp;
        Wed, 29 Jan 2020 02:36:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqzH7EFSLoL9yEz23g2pakKXvx77ws8snGy6Scqn9DV4+LwtDVD9HvYRE6PFqohoqLafyKAB
X-Received: by 2002:a05:620a:1497:: with SMTP id w23mr19356284qkj.472.1580294173191;
        Wed, 29 Jan 2020 02:36:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580294173; cv=none;
        d=google.com; s=arc-20160816;
        b=QQw2QX1d1P8Tng18tgg56zeaMyLqgPpuBbXHkiJskXT5vbRJZ9wzVjKfSgd4uznjX6
         V81cpiW4Vb6kEltB2K/4cTB+jBdYRrgDgwLmw/aYbhN7pbZEOI9nbWteZorGnWuiJ0CY
         gCWm4y39UVqSgsAfDMdX/jLaoplXFdqc5fveKm+icmPqqPda1XkQ8NHnFN2GYKVUGaA4
         vkT+GNxFXRFMUmVYgDTt6Wznc6vb5QrgRZygUrgoHjQC2xMYoTDsoMZcjyQA/hWxR3F+
         +ka0wytqqR+52fHbjVb6emEuJANoW/VfFMQLTurFyEz3Vw08dkNxT3ZbayQM1ztGFiIz
         WSBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=YytYKXeTONucTDrOlM3mgJOOe54dCCuBr4sQ4vomz+Y=;
        b=KBHWubuEr1wlT49uE7m3jYrsQ5smA6jyVDg8ORB9aG7J3BuYWxeWR/j5P+lEx4pgi6
         ME4lmZRUMTzYwEtZtcSPE5QDfKoclofZZCuUNKWaVAd9fwVDPhpVsS+Jg9J7RtVytUB3
         qGY9xwnWfNDUUB3TaK6zZSZMaeMfzV2/+17W6dIKft3U5weMo4saUXuPBrnVf/MQRi+n
         V4AN6LIj7nHv7Hnu+5bjQgDiiucnQY1l9ueAWgU128QU0RWDdCa34EKGRvw1h8VnE/uS
         kpYWe7FraYOkXALE0R4GHd2OD4vR9EwEbBmcX5wlymnLE/MnJqlTSL4XE+bQR51peCBF
         9CFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t66si1121392qkd.281.2020.01.29.02.36.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jan 2020 02:36:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iwkhg-0001b9-LK
	for alex.bennee@linaro.org; Wed, 29 Jan 2020 05:36:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47236)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iwkhR-0001b0-R6
 for qemu-arm@nongnu.org; Wed, 29 Jan 2020 05:35:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iwkhQ-0004mA-5i
 for qemu-arm@nongnu.org; Wed, 29 Jan 2020 05:35:57 -0500
Received: from lhrrgout.huawei.com ([185.176.76.210]:2066 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iwkhP-0004Y7-Vt; Wed, 29 Jan 2020 05:35:56 -0500
Received: from LHREML714-CAH.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id 8A3F61A824328CE5C8EF;
 Wed, 29 Jan 2020 10:35:49 +0000 (GMT)
Received: from lhreml702-chm.china.huawei.com (10.201.108.51) by
 LHREML714-CAH.china.huawei.com (10.201.108.37) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 29 Jan 2020 10:35:48 +0000
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 lhreml702-chm.china.huawei.com (10.201.108.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1713.5; Wed, 29 Jan 2020 10:35:48 +0000
Received: from lhreml710-chm.china.huawei.com ([169.254.81.184]) by
 lhreml710-chm.china.huawei.com ([169.254.81.184]) with mapi id
 15.01.1713.004; Wed, 29 Jan 2020 10:35:48 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "imammedo@redhat.com" <imammedo@redhat.com>
Subject: RE: [PATCH v2 7/7] tests/bios-tables-test: Update arm/virt memhp test
Thread-Topic: [PATCH v2 7/7] tests/bios-tables-test: Update arm/virt memhp test
Thread-Index: AQHVzV5G+cQh10jGFkuymacLK0srHqgAVXcAgAEtZFA=
Date: Wed, 29 Jan 2020 10:35:48 +0000
Message-ID: <77db9c11b6f248208ce50bb6a267bf16@huawei.com>
References: <20200117174522.22044-1-shameerali.kolothum.thodi@huawei.com>
 <20200117174522.22044-8-shameerali.kolothum.thodi@huawei.com>
 <6cdba6ae-928d-696b-19b2-f4f81f341f3a@redhat.com>
In-Reply-To: <6cdba6ae-928d-696b-19b2-f4f81f341f3a@redhat.com>
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
 [fuzzy]
X-Received-From: 185.176.76.210
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
 "xiaoguangrong.eric@gmail.com" <xiaoguangrong.eric@gmail.com>,
 "mst@redhat.com" <mst@redhat.com>, Linuxarm <linuxarm@huawei.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>, "xuwei
 \(O\)" <xuwei5@huawei.com>, "lersek@redhat.com" <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pv2Es4j2sTkO

Hi Eric,

> -----Original Message-----
> From: Qemu-devel
> [mailto:qemu-devel-bounces+shameerali.kolothum.thodi=3Dhuawei.com@nongn
> u.org] On Behalf Of Auger Eric
> Sent: 28 January 2020 16:29
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
> qemu-devel@nongnu.org; qemu-arm@nongnu.org; imammedo@redhat.com
> Cc: peter.maydell@linaro.org; xiaoguangrong.eric@gmail.com;
> mst@redhat.com; Linuxarm <linuxarm@huawei.com>; xuwei (O)
> <xuwei5@huawei.com>; shannon.zhaosl@gmail.com; lersek@redhat.com
> Subject: Re: [PATCH v2 7/7] tests/bios-tables-test: Update arm/virt memhp
> test
>=20
> Hi Shameer,
>=20
> On 1/17/20 6:45 PM, Shameer Kolothum wrote:
> > Since we now have both pc-dimm and nvdimm support, update
> > test_acpi_virt_tcg_memhp() to include those.
> >
> > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > ---
> >  tests/data/acpi/virt/NFIT.memhp | 0
> >  tests/data/acpi/virt/SSDT.memhp | 0
> Is it normal to have those 2 above void files? I lost track about the
> process.

I guess so :). From tests/qtest/bios-tables-test.c,

/*
 * How to add or update the tests:
 * Contributor:
 * 1. add empty files for new tables, if any, under tests/data/acpi
 * 2. list any changed files in tests/bios-tables-test-allowed-diff.h
 * 3. commit the above *before* making changes that affect the tables
 ...

After reading that again, I am not sure those empty files can be in this
Patch or not. I can move it to 6/7.

> >  tests/qtest/bios-tables-test.c  | 9 +++++++--
> >  3 files changed, 7 insertions(+), 2 deletions(-)
> >  create mode 100644 tests/data/acpi/virt/NFIT.memhp
> >  create mode 100644 tests/data/acpi/virt/SSDT.memhp
> >
> > diff --git a/tests/data/acpi/virt/NFIT.memhp
> b/tests/data/acpi/virt/NFIT.memhp
> > new file mode 100644
> > index 0000000000..e69de29bb2
> > diff --git a/tests/data/acpi/virt/SSDT.memhp
> b/tests/data/acpi/virt/SSDT.memhp
> > new file mode 100644
> > index 0000000000..e69de29bb2
> > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-t=
est.c
> > index f1ac2d7e96..695d2e7fac 100644
> > --- a/tests/qtest/bios-tables-test.c
> > +++ b/tests/qtest/bios-tables-test.c
> > @@ -913,12 +913,17 @@ static void test_acpi_virt_tcg_memhp(void)
> >      };
> >
> >      data.variant =3D ".memhp";
> > -    test_acpi_one(" -cpu cortex-a57"
> > +    test_acpi_one(" -machine nvdimm=3Don"
> nit: maybe keep the same order as before ...
> > +                  " -cpu cortex-a57"
> >                    " -m 256M,slots=3D3,maxmem=3D1G"
> and simply add ,nvdimm=3Don to above line.
> >                    " -object memory-backend-ram,id=3Dram0,size=3D128M"
> >                    " -object memory-backend-ram,id=3Dram1,size=3D128M"
> >                    " -numa node,memdev=3Dram0 -numa
> node,memdev=3Dram1"
> > -                  " -numa dist,src=3D0,dst=3D1,val=3D21",
> > +                  " -numa dist,src=3D0,dst=3D1,val=3D21"
> > +                  " -object memory-backend-ram,id=3Dram2,size=3D128M"
> > +                  " -object memory-backend-ram,id=3Dnvm0,size=3D128M"
> > +                  " -device pc-dimm,id=3Ddimm0,memdev=3Dram2,node=3D0"
> > +                  " -device nvdimm,id=3Ddimm1,memdev=3Dnvm0,node=3D1",
> >                    &data);
> >
> >      free_test_data(&data);
> >

Ok. Noted.

Thanks,
Shameer

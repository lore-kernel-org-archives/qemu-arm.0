Received: by 10.28.4.212 with SMTP id 203csp816692wme;
        Wed, 25 Apr 2018 06:25:15 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZopJREuH6KH4q/4FGydkk5qTReF/14i/S+8VdYdpPhh0fCFKuh6CsV7V5I1p7m6l6xLAdoO
X-Received: by 10.55.136.70 with SMTP id k67mr6481673qkd.250.1524662715485;
        Wed, 25 Apr 2018 06:25:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524662715; cv=none;
        d=google.com; s=arc-20160816;
        b=TeR/8/JZf05b9xI9l6/o8F4sZDgo7AF0IO6O3Uy80ojKVVhAQE5/0RZV3kj9we0iqJ
         uIcPaf3R/LGdHchqYx38h74oexBXKJTwTUyAmkixDwUZcOH+Ki0ox/rmVdhEwW/viXk/
         gLrnxJc/te0UZA9pC1pROeghgQAHxhsrD0RzOXldOBmr3RX9hiIWXIiTiStz5/siPtd/
         HzH549xNiL9r7saGk9JTkLLX21ch1fnUgMH4IlkZuTEsPbibb1cfWVgLQS+kStSfU3RT
         0gfu6fo8WrsDw9rxa2kzyYs2BaijN1Yj+tMaGueeiTc8ACe+bf39CZu33AgtpvpZtFf6
         lvzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from:arc-authentication-results;
        bh=jCirntKQl9BFqCbyEjdRq11ocPhYa4hnwzd6ypsR4jM=;
        b=aNA+3bTNhGOZ0Mgg7YOz0kP7SgU6jZY9V8d0Bac71j113Rd5l8vi4AdcPMc/Fd4qDB
         kvEBwrNjTKsP996n1heub+rnfgHdlby4hhezA7bRQkYqX0qyE9Nn4JAkpGOfP15VK/a7
         wLKk2LPH4mU+l0MK89w4DT0LbHLX1txq49z7XSGcQMa0/fBg27rw0nbGNszz+d4c6enB
         DKscixQAY0SXs6zjsGPRNrYw/DO8S/iyY5y0BVvR4vUk4l7x+8BJOTVc4CZ985D1buYi
         BqZZIrKel/HY2usPh8KE6l0D908s2pTT987QtsHV3BAZITGgiugGndlHWxlwKqS5TcAo
         Hv/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u36-v6si11607709qtb.18.2018.04.25.06.25.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Apr 2018 06:25:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36911 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBKQ6-00049c-U1
	for alex.bennee@linaro.org; Wed, 25 Apr 2018 09:25:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fBKPw-00045q-FO
	for qemu-arm@nongnu.org; Wed, 25 Apr 2018 09:25:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fBKPt-0000mW-Ay
	for qemu-arm@nongnu.org; Wed, 25 Apr 2018 09:25:04 -0400
Received: from lhrrgout.huawei.com ([194.213.3.17]:64513 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fBKPt-0000l8-5f; Wed, 25 Apr 2018 09:25:01 -0400
Received: from lhreml702-cah.china.huawei.com (unknown [172.18.7.106])
	by Forcepoint Email with ESMTP id 1FACD2CDC74C1;
	Wed, 25 Apr 2018 14:24:55 +0100 (IST)
Received: from FRAEML704-CAH.china.huawei.com (10.206.14.35) by
	lhreml702-cah.china.huawei.com (10.201.108.43) with Microsoft SMTP
	Server (TLS) id 14.3.382.0; Wed, 25 Apr 2018 14:24:56 +0100
Received: from FRAEML521-MBX.china.huawei.com ([169.254.1.156]) by
	FRAEML704-CAH.china.huawei.com ([10.206.14.35]) with mapi id
	14.03.0382.000; Wed, 25 Apr 2018 15:24:44 +0200
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Andrew Jones <drjones@redhat.com>
Thread-Topic: [Qemu-devel] [RFC 3/5] hw/arm: add scattered RAM memory region
	support
Thread-Index: AQHTXOYlQiE9hVh570Cux4XapwClL6MT5SMAgPTPhXCACDIaAIABiztQ
Date: Wed, 25 Apr 2018 13:24:44 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA83869381A@FRAEML521-MBX.china.huawei.com>
References: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
	<1510622154-17224-4-git-send-email-zhuyijun@huawei.com>
	<20171114145002.jbrw7k4n2m2rfwes@kamzik.brq.redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA83868CA39@FRAEML521-MBX.china.huawei.com>
	<20180424152932.tszber3blx32luro@kamzik.brq.redhat.com>
In-Reply-To: <20180424152932.tszber3blx32luro@kamzik.brq.redhat.com>
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
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 3/5] hw/arm: add scattered RAM
 memory region support
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
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	Zhaoshenglong <zhaoshenglong@huawei.com>,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U1e+t4NbiaEX

Hi Drew,

> -----Original Message-----
> From: Andrew Jones [mailto:drjones@redhat.com]
> Sent: Tuesday, April 24, 2018 4:30 PM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: peter.maydell@linaro.org; qemu-devel@nongnu.org; Linuxarm
> <linuxarm@huawei.com>; eric.auger@redhat.com; qemu-arm@nongnu.org;
> xuwei (O) <xuwei5@huawei.com>; Zhaoshenglong
> <zhaoshenglong@huawei.com>; Igor Mammedov <imammedo@redhat.com>
> Subject: Re: [Qemu-devel] [RFC 3/5] hw/arm: add scattered RAM memory
> region support
>=20
> On Thu, Apr 19, 2018 at 09:06:30AM +0000, Shameerali Kolothum Thodi wrote=
:
> > > From: Andrew Jones [mailto:drjones@redhat.com] Instead of using
> > > memory region aliases, it would be best if each RAM region was
> > > modeled with pc-dimms, as that would move us towards supporting
> > > memory hotplug and allow the regions to be explicitly identified
> > > (start/size) on the command line - supporting migration. Actually,
> > > how does this series address migration? What if the host we migrate
> > > to doesn't have the same reserved regions in sysfs?
> >
> > Thanks for going through this series and comments.
> >
> > I am looking into reviving this series based on the new proposed vfio
> > iova interface[1]. The vfio interface will now provide  a list of valid=
 iova
> ranges.
> > That means, instead of working on reserved regions to find out the
> > valid  memory regions, the code here will have the valid regions list d=
irectly.
> >
> > The above comment of yours mentions about modelling the memory regions
> > with pc-dimms. If I understand that proposal correctly, in case the
> > iova list has  multiple entries in it(means there are holes in the
> > memory) the extra regions has to be added as a pc-dimm slot memory.
>=20
> Hi Shameer,
>=20
> iiuc, the concern is that the valid region list may look something like t=
his made
> up example:
>=20
>  0x000e0000000 0x000000011fffffff
>  0x00180000000 0x00000002ffffffff
>  0x02000000000 0x0000011fffffffff
>  0x22000000000 0xffffffffffffffff
>=20
> You then want to avoid overlapping the holes with memory, because the hol=
es
> represent regions that may have platform devices assigned, which need to =
keep
> 1:1 gpa -> hpa mappings.

Yes, the holes are basically reserved regions not translated by iommu.

> If that's the case, then I think the biggest problem with the made up exa=
mple is
> the initial hole [0x0 0xdfffffff], as that would overlap the currently ha=
rd coded
> base of RAM (0x40000000). Indeed we were thinking that the base of RAM
> would be modeled as a non-pluggable dimm of size 1G at the 1G boundary. A=
s
> for the rest of memory (for memory > 1G), in the made up example we could
> just allocate a single pc-dimm from a memory region representing the
> [0x22000000000 0xffffffffffffffff] range without any hassle.

Right. I was more worried about a highly fragmented case where we have to
model multiple pc-dimms to accommodate all the required memory. But that
may be a highly unlikely scenario.
=20
> > Having gone through
> > the Qemu source, I am not sure what is the best way to accomplish that.
> > (of course I am not that familiar with the Qemu source). Is it ok to
> > invoke
> > qdev_device_add() from here? Any pointers on this is very appreciated.
>=20
> I'm not an expert on that (nor any of this stuff, really - hopefully what=
 I've
> written above isn't completely bonkers). I've CC'ed Igor for help.
> I've also CC'ed Eric, because of the magic word 'vfio'.

Thanks. I am moving in this direction at the moment.  Please let me know
if there is a better way of doing this, than invoking user_creatable_add_op=
ts()
for mem backend object creation and qdev_device_add() for pc-dimm dev.

> > One more point is, considering the fact that ARM64 linux kernel still
> > doesn't support hotplug memory at the moment, not sure how much we
> > gain from the pc-dimm model.
>=20
> It will eventually. Moving towards the pc-dimm model now, in order to han=
dle
> the non-contiguous memory needs, will go a long ways to enabling hotplug
> later.

Ok. I will try to come up with something and will post as an RFC.=20

Appreciate your feedback,
Shameer

>=20
> Thanks,
> drew
>=20
> >
> > Please let me know your thoughts on this.
> >
> > Thanks,
> > Shameer
> >
> > [1]. https://lkml.org/lkml/2018/4/18/293

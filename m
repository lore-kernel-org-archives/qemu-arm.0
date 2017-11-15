Received: by 10.223.150.237 with SMTP id u100csp4867936wrb;
        Wed, 15 Nov 2017 06:41:42 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbIAV+81gcq51NmZVqEpSh7f7T2D4SPgHvOfAiQM1tcL40U/X2mCiLTzHpUw/uPjCckhpLI
X-Received: by 10.13.237.131 with SMTP id w125mr1052112ywe.51.1510756902078;
        Wed, 15 Nov 2017 06:41:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510756902; cv=none;
        d=google.com; s=arc-20160816;
        b=YxBxh6u307PdNHJjrq1KLX1ni3RyAh6DJhr/R+fLNzCo4CZ7rlYstn2Cv6ryr/gLQ3
         owCBQA1yD4AlyikKc14C7xRDHT/Yrty6RwmOrfTOv4TKQowD8SRCEPKPtVMcLhoaqPPI
         QaDdkiBagVHAfyWRfNzcNiZaojvHb8KmJs5SZ800YvA13C4Tg0D6v7hfCHYC4QiJJD6j
         kAOMGPI6mJAH6/c2otykic+Q4D4O/CT/hadeVYMaF2ear75l6lAXKgXiOslIR5qYyHHw
         OpqZr9sNRdwcQ994WixD5WzO3at1RWFT8jAJYwN+91LQirdFd7/FZfcHZXl58Kl+LJNy
         ueWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from:arc-authentication-results;
        bh=VVOV5k4ebNW5Siag8oZMzDPXF3GvqDvDLnzyzSGfw1A=;
        b=O3X3DO0ZdWoDGXSZIpmv4GMpBkVEna3kSWYwEV78pBs3xPjMemP7lYhOmMpFmmmpS8
         TnbojrdbnHoUucZ3TOql10lqRtlqMvEWwxEkIM3DCD7U5NvxyWkDpMZj4INAIRNp+pFT
         buDdJRp3zbUWIL+7lJ25Br/2OKKv89lfnsBH0nYNFkuU5fPrdLLI83KDrTZwpu56ipeB
         ntI6KI7rnlRs17xtVr9hhaKGnJmg0BoHY8ooO+Qtou4KL24YQlnPXF48OsvmgQO87vFL
         yMkQtaFLIB17hoXwCi9j/tAOBU81by3qBKyfKX6ira2Rr4WzwFSRqoqMSODuhxHo7exu
         iVkA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p128si1279856ybp.40.2017.11.15.06.41.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Nov 2017 06:41:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36478 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eEysn-0005mT-Eg
	for alex.bennee@linaro.org; Wed, 15 Nov 2017 09:41:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1eEuKW-00049e-UM
	for qemu-arm@nongnu.org; Wed, 15 Nov 2017 04:50:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1eEuKT-00026u-ST
	for qemu-arm@nongnu.org; Wed, 15 Nov 2017 04:50:01 -0500
Received: from lhrrgout.huawei.com ([194.213.3.17]:30342 helo=huawei.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1eEuKT-00022B-MF; Wed, 15 Nov 2017 04:49:57 -0500
Received: from LHREML712-CAH.china.huawei.com (unknown [172.18.7.106])
	by Forcepoint Email with ESMTP id 1442D12AC0191;
	Wed, 15 Nov 2017 09:49:51 +0000 (GMT)
Received: from FRAEML701-CAH.china.huawei.com (10.206.14.32) by
	LHREML712-CAH.china.huawei.com (10.201.108.35) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 15 Nov 2017 09:49:52 +0000
Received: from FRAEML521-MBX.china.huawei.com ([169.254.1.209]) by
	FRAEML701-CAH.china.huawei.com ([10.206.14.32]) with mapi id
	14.03.0361.001; Wed, 15 Nov 2017 10:49:41 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>, Zhuyijun
	<zhuyijun@huawei.com>
Thread-Topic: [Qemu-devel] [RFC 1/5] hw/vfio: Add function for getting
	reserved_region of device iommu group
Thread-Index: AQHTXOYm3ZL42BZvgkuK5iju3HzTnqMT9TeAgAE4uHA=
Date: Wed, 15 Nov 2017 09:49:41 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA83845EDBF@FRAEML521-MBX.china.huawei.com>
References: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
	<1510622154-17224-2-git-send-email-zhuyijun@huawei.com>
	<20171114084735.68e87546@t450s.home>
In-Reply-To: <20171114084735.68e87546@t450s.home>
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
X-Mailman-Approved-At: Wed, 15 Nov 2017 09:41:25 -0500
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 1/5] hw/vfio: Add function for
 getting reserved_region of device iommu group
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
Cc: Zhaoshenglong <zhaoshenglong@huawei.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XxQ/7SPGW1f2

Hi Alex,

> -----Original Message-----
> From: Alex Williamson [mailto:alex.williamson@redhat.com]
> Sent: Tuesday, November 14, 2017 3:48 PM
> To: Zhuyijun <zhuyijun@huawei.com>
> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
> eric.auger@redhat.com; peter.maydell@linaro.org; Shameerali Kolothum
> Thodi <shameerali.kolothum.thodi@huawei.com>; Zhaoshenglong
> <zhaoshenglong@huawei.com>
> Subject: Re: [Qemu-devel] [RFC 1/5] hw/vfio: Add function for getting
> reserved_region of device iommu group
>=20
> On Tue, 14 Nov 2017 09:15:50 +0800
> <zhuyijun@huawei.com> wrote:
>=20
> > From: Zhu Yijun <zhuyijun@huawei.com>
> >
> > With kernel 4.11, iommu/smmu will populate the MSI IOVA reserved
> > window and PCI reserved window which has to be excluded from Guest iova
> allocations.
> >
> > However, If it falls within the Qemu default virtual memory address
> > space, then reserved regions may get allocated for a Guest VF DMA iova
> > and it will fail.
> >
> > So get those reserved regions in this patch and create some holes in
> > the Qemu ram address in next patchset.
> >
> > Signed-off-by: Zhu Yijun <zhuyijun@huawei.com>
> > ---
> >  hw/vfio/common.c              | 67
> +++++++++++++++++++++++++++++++++++++++++++
> >  hw/vfio/pci.c                 |  2 ++
> >  hw/vfio/platform.c            |  2 ++
> >  include/exec/memory.h         |  7 +++++
> >  include/hw/vfio/vfio-common.h |  3 ++
> >  5 files changed, 81 insertions(+)
>=20
> I generally prefer the vfio interface to be more self sufficient, if ther=
e are
> regions the IOMMU cannot map, we should be describing those via capabilit=
ies
> on the container through the vfio interface.  If we're just scraping toge=
ther
> things from sysfs, the user can just as easily do that and provide an exp=
licit
> memory map for the VM taking the devices into account.=20

Ok. I was under the impression that the purpose of introducing the=20
/sys/kernel/iommu_groups/reserved_regions was to get the IOVA regions=20
that are reserved(MSI or non-mappable) for Qemu or other apps to
make use of.  I think this was introduced as part of the "KVM/MSI passthrou=
gh
support on ARM" patch series. And if I remember correctly, Eric had=20
an approach where the user space can retrieve all the reserved regions thro=
ugh
the VFIO_IOMMU_GET_INFO ioctl and later this idea was replaced with the=20
sysfs interface.

May be I am missing something here.

> Of course having a
> device associated with a restricted memory map that conflicts with the de=
fault
> memory map for the VM implies that you can never support hot-add of such
> devices.

True.  Hot-add and migration will have issues on these platforms.

Thanks,
Shameer

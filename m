Received: by 10.223.159.74 with SMTP id f10csp4087191wrg;
        Wed, 6 Dec 2017 06:01:47 -0800 (PST)
X-Google-Smtp-Source: AGs4zMY18Aef4E1hbhtxDGZ43BsnS17Cn2mjBL/hFvl8j582P7NTye1raxJ3Vv1tN9p9nm65kQAB
X-Received: by 10.37.58.197 with SMTP id h188mr15459442yba.227.1512568906934;
        Wed, 06 Dec 2017 06:01:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512568906; cv=none;
        d=google.com; s=arc-20160816;
        b=rpH1EOGFYzNNUkEXwC9PmJtl0sZt0B1HrqzdJ3v5Eja8MWu2y/hxEG0QiP3iwMLzSb
         YQjvIRdgJh3V1NCGX6NOF85X81eCIrK5bOmQ/PKOROOUxIqqiMIA6760WAUfDvybbLMo
         xjdjVGWi6bIwObcg1gGNE/KOtHukkq1lnycfRQkAgttcBtYnMzIoOnGf6/B31gtCyLw3
         mY7zOeOrkQ13BJywLBhXlNDTuxZxrcKJl8YOn7p/rB+TWTZy6PYrG3ja7+yPSxhEgU03
         xlgJGtzLOHfiPWN1L+F8+4H7/SkfX8HR/q/FlA7rYDxcL3PdYdEHbkJpY+A1BHaZ66iK
         XiTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=MHEtRJNISRxRHI6zpZwh0GMyRltO6nHDx8Ead1EetHQ=;
        b=QNG6qr0EcEWvB2HPAW7OYWgjdhm7WOJuiJTgjrKy1M5Ye7WC8e4s5Iq1409TI435uu
         pX22RzmMXcUz1m3C1ZXmKOOwzVrOgm3GaSJYzYRemeBq59R0AtD5KF+kQKUiqgdYqPRY
         Ql8eBxm8/yItAM1u+wFnzA1MNmOV1tCTvavqwaAY03j2pA0G/o+lEhCZ9cjyGPWqe3gI
         BqAPa9gmfTqYJwVByMckBXHeEdfuDveyEzX70ghdM0HuUhBh5HUm851xFGy7ueovJ1ig
         0llfVkjUfhe9RIA/GijKnltz9uP/NBnNvPDvUBq0myukQKUeWX8mTFXna7onxJnN9SWZ
         Qqcg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w10si234803ybb.781.2017.12.06.06.01.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Dec 2017 06:01:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55807 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eMaGg-0001OZ-Dn
	for alex.bennee@linaro.org; Wed, 06 Dec 2017 09:01:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eMaGS-0001MA-9u
	for qemu-arm@nongnu.org; Wed, 06 Dec 2017 09:01:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eMaGK-0002rG-IV
	for qemu-arm@nongnu.org; Wed, 06 Dec 2017 09:01:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55572)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eMaGK-0002qC-AV; Wed, 06 Dec 2017 09:01:24 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4492B40F04;
	Wed,  6 Dec 2017 14:01:23 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-23.ams2.redhat.com
	[10.36.116.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C44176266A;
	Wed,  6 Dec 2017 14:01:18 +0000 (UTC)
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Alex Williamson <alex.williamson@redhat.com>
References: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
	<1510622154-17224-2-git-send-email-zhuyijun@huawei.com>
	<20171114084735.68e87546@t450s.home>
	<5FC3163CFD30C246ABAA99954A238FA83845EDBF@FRAEML521-MBX.china.huawei.com>
	<20171115112513.3c035023@t450s.home>
	<5FC3163CFD30C246ABAA99954A238FA8384704C0@FRAEML521-MBX.china.huawei.com>
	<20171120085745.0147df5c@t450s.home>
	<5FC3163CFD30C246ABAA99954A238FA838622618@FRAEML521-MBX.china.huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <e500dd54-04b6-5f19-316f-0598655751ea@redhat.com>
Date: Wed, 6 Dec 2017 15:01:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA838622618@FRAEML521-MBX.china.huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 06 Dec 2017 14:01:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Zhaoshenglong <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KzH5uvy/lSp7

Hi Shameer,

On 06/12/17 11:30, Shameerali Kolothum Thodi wrote:
> Hi Alex,
> 
>> -----Original Message-----
>> From: Shameerali Kolothum Thodi
>> Sent: Monday, November 20, 2017 4:31 PM
>> To: 'Alex Williamson' <alex.williamson@redhat.com>
>> Cc: eric.auger@redhat.com; Zhuyijun <zhuyijun@huawei.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org; peter.maydell@linaro.org;
>> Zhaoshenglong <zhaoshenglong@huawei.com>; Linuxarm
>> <linuxarm@huawei.com>
>> Subject: RE: [Qemu-devel] [RFC 1/5] hw/vfio: Add function for getting
>> reserved_region of device iommu group
> [...]
>>>>> And sysfs is a good interface if the user wants to use it to
>>>>> configure the VM in a way that's compatible with a device.  For
>>>>> instance, in your case, a user could evaluate these reserved
>>>>> regions across all devices in a system, or even across an entire
>>>>> cluster, and instantiate the VM with a memory map compatible with
>>>>> hotplugging any of those evaluated devices (QEMU implementation of
>> allowing the user to do this TBD).
>>>>> Having the vfio device evaluate these reserved regions only helps
>>>>> in the cold-plug case.  So the proposed solution is limited in
>>>>> scope and doesn't address similar needs on other platforms.  There
>>>>> is value to verifying that a device's IOVA space is compatible
>>>>> with a VM memory map and modifying the memory map on cold-plug or
>>>>> rejecting the device on hot-plug, but isn't that why we have an
>>>>> ioctl within vfio to expose information about the IOMMU?  Why take
>>>>> the path of allowing QEMU to rummage through sysfs files outside
>>>>> of vfio, implying additional security and access concerns, rather
>>>>> than filling the gap within the vifo API?
>>>>
>>>> Thanks Alex for the explanation.
>>>>
>>>> I came across this patch[1] from Eric where he introduced the IOCTL
>>> interface to
>>>> retrieve the reserved regions. It looks like this can be reworked to
>>> accommodate
>>>> the above requirement.
>>>
>>> I don't think we need a new ioctl for this, nor do I think that
>>> describing the holes is the correct approach.  The existing
>>> VFIO_IOMMU_GET_INFO ioctl can be extended to support capability
>>> chains, as we've done for VFIO_DEVICE_GET_REGION_INFO.
>>
>> Right, as far as I can see the above mentioned patch is doing exactly the same,
>> extending the VFIO_IOMMU_GET_INFO ioctl with capability chain.
>>
>>> IMO, we should try to
>>> describe the available fixed IOVA regions which are available for
>>> mapping rather than describing various holes within the address space
>>> which are unavailable.  The latter method always fails to describe the
>>> end of the mappable IOVA space and gets bogged down in trying to
>>> classify the types of holes that might exist.  Thanks,
>>
> 
> I was going through this and noticed that it is possible to have multiple 
> iommu domains associated with a container. If that's true, is it safe to
> make the assumption that all the domains will have the same iova
> geometry or not?
To me the answer is no.

There are several iommu domains "underneath" a single container. You
attach vfio groups to a container. Each of them is associated to an
iommu group and an iommu domain. See vfio_iommu_type1_attach_group().

Besides, the reserved regions are per iommu group.

Thanks

Eric

> 
> Thanks,
> Shameer
> 

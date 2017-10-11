Received: by 10.223.197.9 with SMTP id q9csp419683wrf;
        Wed, 11 Oct 2017 02:43:24 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDxr72MYQSjF3Dp88bEM9vcBVr1sESfStNFjIlInfgWWLwtl1ANBdw+Gm8E60ZtXHoNvDlQ
X-Received: by 10.55.155.86 with SMTP id d83mr17716043qke.311.1507715004413;
        Wed, 11 Oct 2017 02:43:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507715004; cv=none;
        d=google.com; s=arc-20160816;
        b=HkLOzFpYyLZQslIofm4qx/E5nDfYwG6uewp01h6caMkTYpt4vu7eZRMOa8gXxo97LM
         Z4rB8X8i7Y9AWpq/xQroNS2/UgAcSROMJStD3Jby4o4i+u6VXNB3ZGYJml78m2gmwECs
         t1Njyp58ZaxGCscgzQIRBPxDH0El3ahNEPM4UMd7wq5q2/ILHQk+Imc9gL7pEiIGgEva
         CYseYCCSB3p9QmwfZkxCFPtr/UqE8v5CR+TET36L/DvRUDrjj545ml9y6ZHda4UeWlop
         gqIaUDCG+cbwS4stCol51wy7sUY9DO8w9ceod2hqxRKkFHEYMEdHMLIu97iZBBSCk0K6
         73wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=b/pTwIFByMrWvbqTMPOyzMqSqkyFD4QGCebCtc/t2nY=;
        b=iuYZlIDOUbY1cQ7IABboGNpEKuHSwWyJltAJ4LwOPryLpOQewp85MiqTyEh6CVnT0m
         T58ZMpLIYbH90qQXRWL/PgZ6n2HlIHjNa67FCJSPhz/JYeqvyT2/VQH6eaRVYP8g28Vf
         un/ToXfF09JEcZYe+hS9M17aTg2d6J8WZ95eKN8n9XTH6aAsHl2srM+UPZ8IRWGX62N8
         N6gXIgGiipKITPgLmJERvLCq7fbB8zqnOOAILGi7DZBykK5lYAFlww+HwuxX8yud8zxh
         uufVqwiyBGu12zsxZvc2f/ze7WPtJJmXdhbiAyat9dZ54XVToh3FXJ8wsxCFAz/KoW1S
         rxaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l68si4342673qte.544.2017.10.11.02.43.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Oct 2017 02:43:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39864 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e2DXu-0007ws-6r
	for alex.bennee@linaro.org; Wed, 11 Oct 2017 05:43:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1e2DXm-0007wY-Lq
	for qemu-arm@nongnu.org; Wed, 11 Oct 2017 05:43:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1e2DXi-00079a-Us
	for qemu-arm@nongnu.org; Wed, 11 Oct 2017 05:43:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36158)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1e2DXi-00077p-M4; Wed, 11 Oct 2017 05:43:10 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E59E07E454;
	Wed, 11 Oct 2017 09:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E59E07E454
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-117-172.ams2.redhat.com
	[10.36.117.172])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2803918990;
	Wed, 11 Oct 2017 09:42:56 +0000 (UTC)
To: Bharat Bhushan <bharat.bhushan@nxp.com>,
	Linu Cherian <linuc.decode@gmail.com>
References: <1506494000-31982-1-git-send-email-Bharat.Bhushan@nxp.com>
	<20170927074109.GA31587@virtx40>
	<AM5PR0401MB25450ACC804B20D93C4F2D9D9A780@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<9700cf30-65ed-9c55-c1b9-14bb8deb669f@redhat.com>
	<20170927092147.GA32183@virtx40>
	<0af599c0-f859-f90c-c999-bc4a0a678768@redhat.com>
	<20171004114910.GA6932@virtx40>
	<79234c56-c524-5359-de8a-f266b19821eb@redhat.com>
	<9d173ea5-75a6-c684-7f8d-e2ec1d3eddff@redhat.com>
	<1017080b-aa5f-4a1f-9905-e65f22717cd1@redhat.com>
	<b740e8b7-5859-fd6a-1f1e-480aef6ef4f0@redhat.com>
	<AM5PR0401MB254548523AC95D0A2A8A92E69A710@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<AM5PR0401MB254512CE483DD6E684037A629A750@AM5PR0401MB2545.eurprd04.prod.outlook.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <2633883e-ed41-964b-9c27-bc36f86e9b4d@redhat.com>
Date: Wed, 11 Oct 2017 11:42:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <AM5PR0401MB254512CE483DD6E684037A629A750@AM5PR0401MB2545.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 11 Oct 2017 09:43:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 0/5] virtio-iommu: VFIO
 integration
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
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"mst@redhat.com" <mst@redhat.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"linu.cherian@cavium.com" <linu.cherian@cavium.com>,
	"bharatb.yadav@gmail.com" <bharatb.yadav@gmail.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XPZs7vQ0xAiw

Hi Bharat,

On 10/10/2017 08:42, Bharat Bhushan wrote:
> Hi Alex, Eric,
> 
>> -----Original Message-----
>> From: Qemu-devel [mailto:qemu-devel-
>> bounces+bharat.bhushan=nxp.com@nongnu.org] On Behalf Of Bharat
>> Bhushan
>> Sent: Friday, October 06, 2017 9:16 AM
>> To: Auger Eric <eric.auger@redhat.com>; Linu Cherian
>> <linuc.decode@gmail.com>
>> Cc: peter.maydell@linaro.org; kevin.tian@intel.com; mst@redhat.com;
>> marc.zyngier@arm.com; tn@semihalf.com; will.deacon@arm.com;
>> drjones@redhat.com; qemu-devel@nongnu.org;
>> alex.williamson@redhat.com; qemu-arm@nongnu.org;
>> linu.cherian@cavium.com; eric.auger.pro@gmail.com;
>> robin.murphy@arm.com; christoffer.dall@linaro.org;
>> bharatb.yadav@gmail.com
>> Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v4 0/5] virtio-iommu: VFIO
>> integration
>>
>>
>>
>>>>> Thanks
>>>>>
>>>>> Eric
>>>>>>
>>>>>> However you should be allowed to map 1 sg element of 5 pages and
>>>>>> then notify the host about this event I think. Still looking at the code...
>>>>>>
>>>>>> I still can't reproduce the issue at the moment. What kind of
>>>>>> device are you assigning?
>>>>>>
>>>>>> Thanks
>>>>>>
>>>>>> Eric
>>>>>>>
>>>>>>> Atleast vfio_get_vaddr called from vfio_iommu_map_notify in Qemu
>>>>>>> expects the map size to be a power of 2.
>>>>
>>>> Actually I missed the most important here ;-)
>>>>>>>
>>>>>>>  if (len & iotlb->addr_mask) {
>>>> This check looks suspiscious to me. In our case the len is not
>>>> modified by the previous translation and it fails, I don't see why.
>>>> It should be valid to be able to notify 5 granules.
>>>
>>> So after discussion with Alex, looks the way we notify the host
>>> currently is wrong. we set the addr_mask to the mapping/unmapping size
>>> -1 whereas this should be a page mask instead (granule size or block size?).
>>> So if the guest maps 5 x 4kB pages we should send 5 notifications for
>>> each page and not a single one. It is unclear to me if we can notify
>>> with hugepage/block page size mask. Peter may confirm/infirm this. in
>>> vsmmuv3 code I notify by granule or block size.
> 
> My understanding is that host provides supported page sizes (page_size_mask), and Size of each notification to host should be exactly best fit of supported page-size and/or multiples of supported page-sizes.
> So if guest maps 20K size (single request), and supported page size is 4K, so we can still send one 20K size request.
> Not sure I get it, why multiples of supported page-size cannot be provided in one notification to host.
I think the IOTLB API was originally devised to manage only granule or
block ^2 sizes. We might change this in the future but for the moment,
with respect to this series,  I would simply recommend to stick to the
existing API limitation and concurrently we can work on relaxing this
constraint on another series.

Thanks

Eric
> 
> Thanks
> -Bharat
> 
>>>
>>> Bharat, please can you add this to your TODO list?
>>>
>>> Linu, thanks a lot for the time you spent debugging this issue.
>>> Curiously on my side, it is really seldom hit but it is ...
>>
>> Thanks Linu and Eric, I added this to my todo list.
>> While I am still not able to reproduce the issue.  I tried with e1000 and now
>> try with ixgbe device. May I know which device can be used to reproduce this
>> issue?
>>
>> Thanks
>> -Bharat
>>
>>>
>>> Thanks!
>>>
>>> Eric
>>>>
>>>> Thanks
>>>>
>>>> Eric
>>>>>>>         error_report("iommu has granularity incompatible with target
>> AS");
>>>>>>>         return false;
>>>>>>>     }
>>>>>>>
>>>>>>> Just trying to understand how this is not hitting in your case.
>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>
> 

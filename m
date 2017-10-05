Received: by 10.223.197.9 with SMTP id q9csp473056wrf;
        Thu, 5 Oct 2017 04:55:05 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBM3N3LU3GIHFCHxmY2XJscBFhDnwrVk6DqL7P9eI8sIXacvWcLXM6r320dbqQADRvaZP0r
X-Received: by 10.237.39.103 with SMTP id n94mr10917286qtd.78.1507204505011;
        Thu, 05 Oct 2017 04:55:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507204505; cv=none;
        d=google.com; s=arc-20160816;
        b=npiS84GN0wR2cxxxUtqr+3/OI3HNyNskh6y+WkwVhGmkvoCIAoGhRoWDnNMb026gty
         fYYt2VYadOQfGn79+o1p8v8z+Aj/9jowuoTZymr4h/Y7hcW4WT1Nwt5x/de/MOxreSMz
         5A4lQwCSGrCzJVvIXxYeZ2Bh97Iwe6OAx2f6ngeMUrnO9baU8zSCdMpsS2ovCnaQawvb
         d+niUJwl9K1tHWQOrwkU6GAxmRikSkMKHAYI8B3ZqguADzDyXr5QtcpF9/YxaJqYlB6H
         jTXo7X7cNVE2cqjUcyNdyH+LsdBjZ2Z4qx2lw7Vl6qvQeffYVt5jM0RW/7dwIi/lQjZ2
         BYKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=NdmWpuzYazSlNm5a1n9QvRr5s3qRToo1D4jSONhhVGg=;
        b=Pv7/omJZiMWV5yFrQsMtOLcmuBIc9+l2kz2zbQdyUZWO4ALOB1JU2sXnMqrWnhfAMq
         HRyvLF1AkTwPXxgKOrsHjaxIJ2OHQKt9C1bbU4jyUizQCNSF4+8ccRDdGNi6CMxX+vnq
         YHFXYQBcfq8JeDf3G8c3HLyVsRil7i2C5xHosAIOyQbTjqbYSSo9GDdNKjlRRPxHPobD
         WPvOt+cYyaiXUyYuxHTdYGqQ/CfNQ/dTx5u/7r7OD8aFcLmhw+qxRmSVtEyVeh5gIjVo
         RgkxywJWDlrJRJXRnFyoEWGrpMJgPX32JPYcwTUzNhmEpexzdgQon0R6GP6+d2ES9nL9
         T2Fw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e88si4350593qtb.465.2017.10.05.04.55.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Oct 2017 04:55:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39254 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e04k4-0007Gk-J2
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 07:55:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48058)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1e04jx-0007Ga-U7
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 07:54:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1e04ju-0007WE-93
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 07:54:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58174)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1e04ju-0007VX-0F; Thu, 05 Oct 2017 07:54:54 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 709EB7E381;
	Thu,  5 Oct 2017 11:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 709EB7E381
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BEB6600C4;
	Thu,  5 Oct 2017 11:54:43 +0000 (UTC)
To: Linu Cherian <linuc.decode@gmail.com>
References: <1506494000-31982-1-git-send-email-Bharat.Bhushan@nxp.com>
	<20170927074109.GA31587@virtx40>
	<AM5PR0401MB25450ACC804B20D93C4F2D9D9A780@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<9700cf30-65ed-9c55-c1b9-14bb8deb669f@redhat.com>
	<20170927092147.GA32183@virtx40>
	<0af599c0-f859-f90c-c999-bc4a0a678768@redhat.com>
	<20171004114910.GA6932@virtx40>
	<79234c56-c524-5359-de8a-f266b19821eb@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <9d173ea5-75a6-c684-7f8d-e2ec1d3eddff@redhat.com>
Date: Thu, 5 Oct 2017 13:54:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <79234c56-c524-5359-de8a-f266b19821eb@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 05 Oct 2017 11:54:52 +0000 (UTC)
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
	Bharat Bhushan <bharat.bhushan@nxp.com>, "mst@redhat.com" <mst@redhat.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, linu.cherian@cavium.com,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	"bharatb.yadav@gmail.com" <bharatb.yadav@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3bvz7fn3HbCs

Hi Linu,
On 05/10/2017 12:46, Auger Eric wrote:
> Hi Linu,
> On 04/10/2017 13:49, Linu Cherian wrote:
>> Hi Eric,
>>
>>
>> On Wed Sep 27, 2017 at 11:24:01AM +0200, Auger Eric wrote:
>>> Hi Linu,
>>>
>>> On 27/09/2017 11:21, Linu Cherian wrote:
>>>> On Wed Sep 27, 2017 at 10:55:07AM +0200, Auger Eric wrote:
>>>>> Hi Linu,
>>>>>
>>>>> On 27/09/2017 10:30, Bharat Bhushan wrote:
>>>>>> Hi,
>>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: Linu Cherian [mailto:linuc.decode@gmail.com]
>>>>>>> Sent: Wednesday, September 27, 2017 1:11 PM
>>>>>>> To: Bharat Bhushan <bharat.bhushan@nxp.com>
>>>>>>> Cc: eric.auger@redhat.com; eric.auger.pro@gmail.com;
>>>>>>> peter.maydell@linaro.org; alex.williamson@redhat.com; mst@redhat.com;
>>>>>>> qemu-arm@nongnu.org; qemu-devel@nongnu.org; kevin.tian@intel.com;
>>>>>>> marc.zyngier@arm.com; tn@semihalf.com; will.deacon@arm.com;
>>>>>>> drjones@redhat.com; robin.murphy@arm.com; christoffer.dall@linaro.org;
>>>>>>> bharatb.yadav@gmail.com
>>>>>>> Subject: Re: [Qemu-arm] [PATCH v4 0/5] virtio-iommu: VFIO integration
>>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> On Wed Sep 27, 2017 at 12:03:15PM +0530, Bharat Bhushan wrote:
>>>>>>>> This patch series integrates VFIO/VHOST with virtio-iommu.
>>>>>>>>
>>>>>>>> This version is mainly about rebasing on v4 version on virtio-iommu
>>>>>>>> device framework from Eric Augur and addresing review comments.
>>>>>>>>
>>>>>>>> This patch series allows PCI pass-through using virtio-iommu.
>>>>>>>>
>>>>>>>> This series is based on:
>>>>>>>>  - virtio-iommu kernel driver by Jean-Philippe Brucker
>>>>>>>>     [1] [RFC] virtio-iommu version 0.4
>>>>>>>>     git://linux-arm.org/virtio-iommu.git branch viommu/v0.4
>>>>>
>>>>> Just to make sure, do you use the v0.4 virtio-iommu driver from above
>>>>> branch?
>>>>>
>>>>> Thanks
>>>>
>>>> I am using git://linux-arm.org/linux-jpb.git branch virtio-iommu/v0.4.
>>>> Hope you are referring to the same.
>>>
>>> Yes that's the right one. I will also investigate on my side this afternoon.
>>>
>>> Thanks
>>>
>>> Eric
>>
>> With the below workaround, atleast ping works for me.
>>
>> diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
>> index 249964a..2904617 100644
>> --- a/drivers/iommu/virtio-iommu.c
>> +++ b/drivers/iommu/virtio-iommu.c
>>         .attach_dev             = viommu_attach_dev,
>>         .map                    = viommu_map,
>>         .unmap                  = viommu_unmap,
>> -       .map_sg                 = viommu_map_sg,
>> +       .map_sg                 = default_iommu_map_sg,
>>         .iova_to_phys           = viommu_iova_to_phys,
>>         .add_device             = viommu_add_device,
>>         .remove_device          = viommu_remove_device,
>>
>>
>> Looks like the qemu backend doesnt have support to handle the map requests from 
>> virtio_iommu_map_sg, since it  merges multiple map requests into one with 
>> mapsize larger than page size(for eg. 0x5000). 
> On my side I understand viommu_map_sg builds a VIRTIO_IOMMU_T_MAP
> request for each sg element. The map size matches the sg element size.
> Then each request is sent separately in _viommu_send_reqs_sync. I don't
> see any concatenation. Looks Jean has a plan to check if it can
> concatenate anything (/* TODO: merge physically-contiguous mappings if
> any */) but this is not implemented yet.

Hopefully I was just able to reproduce your issue with an igb device. I
keep on debugging...

vfio_get_vaddr 1 len=0x3000 iotlb->addr_mask=0x2fff
qemu-system-aarch64: iommu has granularity incompatible with target AS


Thanks

Eric
> 
> However you should be allowed to map 1 sg element of 5 pages and then
> notify the host about this event I think. Still looking at the code...
> 
> I still can't reproduce the issue at the moment. What kind of device are
> you assigning?
> 
> Thanks
> 
> Eric
>>
>> Atleast vfio_get_vaddr called from vfio_iommu_map_notify in Qemu expects 
>> the map size to be a power of 2.
>>
>>  if (len & iotlb->addr_mask) {
>>         error_report("iommu has granularity incompatible with target AS");
>>         return false;
>>     }
>>
>> Just trying to understand how this is not hitting in your case. 
>>  
>>
> 

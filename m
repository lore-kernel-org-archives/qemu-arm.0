Received: by 10.223.197.9 with SMTP id q9csp1354408wrf;
        Fri, 6 Oct 2017 00:24:46 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBDOWT1rrNmVYnE/iVNcLoE2zPCjQGYDuGoOXmBY9GHo9MSHtFXBpMRg+EB7PR6nnxJChzg
X-Received: by 10.237.41.135 with SMTP id o7mr1667907qtd.222.1507274686101;
        Fri, 06 Oct 2017 00:24:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507274686; cv=none;
        d=google.com; s=arc-20160816;
        b=OgMVGSc4qPbEWvLLPD3uhqaJqnxKtsOV1sP0x+s8heR5mbuIdSHmPlEsNRaAHuayfa
         Fu2FOpEPnng3u9qowAEAkS6ylVyX9fG9dFHI1Hv5pA80RDcjduQguNCZtaQP8tPSQfpm
         1uRwkob3JiekUH6qreglDPxcjheCcZRjOfbcrxEm2DJ1KMSmo+kHj3rrXuFTpAq6rlYl
         KAhnkbQneQK753vxyw57Td8L2Kso86Zse6Uwy4ZYdD/UIneqeyG2WrRZaCn4H5cj1l1a
         oA+m7uvw90vogfHJcsrbOj+/NrA6hX+aHSyZK1YPqbvmmJEQDh1eMDnGgGQD/camp2s6
         olvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=eW/oUpcj9bQW6wGZ6Jo+0UnFcy7dN81y/qZQ4Isn8G0=;
        b=FagM9c5SX4PARHhTgKi9AQQI9p5vkKj4hFnNlQPu7P7DqYImenDv6G3MvNTkISuEN3
         syuila/OONKOz6cCttpGAVmh9sJOYyYodDhD/C9Mxym/TURN7LxcTtS1FEz411wrgvyJ
         vBY1k7FKRoH1iIH/XLzAtf02aEm5bncsacliYe/k/bBWSyg5h9FeHKkmrjtjFsyY2QXv
         mS53+XwZkOLkGdzQe8fS4//IkoTHLHkk2kmAhyUZh39ipAIeumXLaNVAUsMxSEY0Lxmb
         7jz23zFcFMOuDBZfJ1XSHkWzzoz8SDcHiB1F2IpT8hipnfz5okagk5YxZypVSWfoynlv
         GU+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a47si180606qte.86.2017.10.06.00.24.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Oct 2017 00:24:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43340 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0N01-0004hw-J1
	for alex.bennee@linaro.org; Fri, 06 Oct 2017 03:24:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47849)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1e0Mzr-0004gQ-Cy
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 03:24:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1e0Mzo-0006o8-8C
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 03:24:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41624)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1e0Mzn-0006nL-W6; Fri, 06 Oct 2017 03:24:32 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CC635C0587D9;
	Fri,  6 Oct 2017 07:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CC635C0587D9
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 56F7960C18;
	Fri,  6 Oct 2017 07:24:22 +0000 (UTC)
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
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <807c8076-af7b-da24-66d5-2c823dc1da34@redhat.com>
Date: Fri, 6 Oct 2017 09:24:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <AM5PR0401MB254548523AC95D0A2A8A92E69A710@AM5PR0401MB2545.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 06 Oct 2017 07:24:31 +0000 (UTC)
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
X-TUID: x8kXeOjWlr0J

Hi Bharat,

On 06/10/2017 05:46, Bharat Bhushan wrote:
> 
> 
>>>> Thanks
>>>>
>>>> Eric
>>>>>
>>>>> However you should be allowed to map 1 sg element of 5 pages and
>>>>> then notify the host about this event I think. Still looking at the code...
>>>>>
>>>>> I still can't reproduce the issue at the moment. What kind of device
>>>>> are you assigning?
>>>>>
>>>>> Thanks
>>>>>
>>>>> Eric
>>>>>>
>>>>>> Atleast vfio_get_vaddr called from vfio_iommu_map_notify in Qemu
>>>>>> expects the map size to be a power of 2.
>>>
>>> Actually I missed the most important here ;-)
>>>>>>
>>>>>>  if (len & iotlb->addr_mask) {
>>> This check looks suspiscious to me. In our case the len is not
>>> modified by the previous translation and it fails, I don't see why. It
>>> should be valid to be able to notify 5 granules.
>>
>> So after discussion with Alex, looks the way we notify the host currently is
>> wrong. we set the addr_mask to the mapping/unmapping size
>> -1 whereas this should be a page mask instead (granule size or block size?).
>> So if the guest maps 5 x 4kB pages we should send 5 notifications for each
>> page and not a single one. It is unclear to me if we can notify with
>> hugepage/block page size mask. Peter may confirm/infirm this. in vsmmuv3
>> code I notify by granule or block size.
>>
>> Bharat, please can you add this to your TODO list?
>>
>> Linu, thanks a lot for the time you spent debugging this issue.
>> Curiously on my side, it is really seldom hit but it is ...
> 
> Thanks Linu and Eric, I added this to my todo list.
> While I am still not able to reproduce the issue.  I tried with e1000 and now try with ixgbe device. May I know which device can be used to reproduce this issue?

On my side I used an i350T2 device (igb) to reproduce the issue.

Thanks

Eric
> 
> Thanks
> -Bharat
> 
>>
>> Thanks!
>>
>> Eric
>>>
>>> Thanks
>>>
>>> Eric
>>>>>>         error_report("iommu has granularity incompatible with target AS");
>>>>>>         return false;
>>>>>>     }
>>>>>>
>>>>>> Just trying to understand how this is not hitting in your case.
>>>>>>
>>>>>>
>>>>>
>>>>
>>>
> 

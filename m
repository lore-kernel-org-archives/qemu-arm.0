Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1032477wrq;
        Fri, 15 Jun 2018 09:14:35 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKI8Fp6GHpKNFZYS9/1fKbprv+ark76AN6gVmwYDfudqyocwCyINFIPQLorJDOWL1e7ycHK5
X-Received: by 2002:ac8:4445:: with SMTP id m5-v6mr2082138qtn.255.1529079275809;
        Fri, 15 Jun 2018 09:14:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529079275; cv=none;
        d=google.com; s=arc-20160816;
        b=FbAtE8RJFoMZiXa36J5byCcBqb0+QP3+XpMOb/gKqx9anWBrzw3fYjWqu8YcrE/Ngn
         +j4ZmU7LOcUbUVLWqpDNujWVzForjz05oMpgoSf4qW5AHXbfMWdQzJylsKFUbEd/1A9Q
         vjnO2t7UgGAY8K3eK2HTO1z1PryZ48SSe1gIyXFCUBpJxjOJ9SJEmN4L8ipxKzbWNKIE
         1uHmaZBiViuJ/ndHX9aFWQKa8Pgw3rlNOYwkLcEjMjE5Hv/7nxTOK0TJgvtILZqHdHD8
         KOFoS8JLd3J9Sfrql3trFPKKrC4NFDdJOkg1uWem5V24V0ege/DRtHCZtxSXMOVGVnTG
         F1jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=4NgNjkAlGHVmUnO5RXjJn2Lnl8NNQ/ge3SsMmP/8sM8=;
        b=gI/NPDNNXnNLyatjhbFwt9K+/Vbg4Dt6Co49JKCjB3zxOM+qYs9V/P+K6978XEuCOZ
         4R8SE4lwBW5A1FIwCpLq4i0MGLijc+hmvafPu7dFLJNruYsJOFTvvy4Ye6jjBNvysR4p
         XUkgjFWBY7JJzCiBGNmW4VSxMGE0MzsHjGOQrvZzPuaasn5sLK3PPW4CmoFbK8jQPDlC
         wc9E6QsRObzvx/uptOLCfCYkro12KHwRyNBblg689VuSaM4m8xJtm+H3QYAz+xWdB6PU
         FEMa89lfzoDjqth/a327CHTaHjb9F1XC9Wj/pHbNK75QjqBZg7pXwZaBKqrKjENXDtOB
         dlqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s17-v6si3104005qvl.172.2018.06.15.09.14.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 09:14:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47888 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTrMx-0001nr-82
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 12:14:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60319)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTr4S-0003aa-9n
	for qemu-devel@nongnu.org; Fri, 15 Jun 2018 11:55:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTr4R-0000qS-68
	for qemu-devel@nongnu.org; Fri, 15 Jun 2018 11:55:28 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57366 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fTr4M-0000kS-6B; Fri, 15 Jun 2018 11:55:22 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4C2A1401EF03;
	Fri, 15 Jun 2018 15:55:21 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95BAE201E8ED;
	Fri, 15 Jun 2018 15:55:19 +0000 (UTC)
To: Andrew Jones <drjones@redhat.com>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
	<20180516152026.2920-7-shameerali.kolothum.thodi@huawei.com>
	<bd67ed40-81d6-58dc-ccaf-efd8a40ca96f@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA8386F6E04@FRAEML521-MBX.china.huawei.com>
	<20180615154441.4rr5mtcnran5cf3s@kamzik.brq.redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <5723678f-fe68-2567-2827-beb63ac58598@redhat.com>
Date: Fri, 15 Jun 2018 17:55:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180615154441.4rr5mtcnran5cf3s@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Fri, 15 Jun 2018 15:55:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Fri, 15 Jun 2018 15:55:21 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [RFC v2 6/6] hw/arm: Populate non-contiguous
 memory regions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	Zhaoshenglong <zhaoshenglong@huawei.com>, Linuxarm <linuxarm@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rJfjyef6O2JK

Hi Drew,

On 06/15/2018 05:44 PM, Andrew Jones wrote:
> On Tue, Jun 05, 2018 at 07:49:44AM +0000, Shameerali Kolothum Thodi wrote:
>>>> On 05/16/2018 05:20 PM, Shameer Kolothum wrote:
>>>>> In case valid iova regions are non-contiguous, split the
>>>>> RAM mem into a 1GB non-pluggable dimm and remaining as a
>>>>> single pc-dimm mem.
>>>>
>>>> Please can you explain where does this split come from? Currently we
>>>> have 254 GB non pluggable RAM. I read the discussion started with Drew
>>>> on RFC v1 where he explained we cannot change the RAM base without
>>>> crashing the FW. However we should at least document this  1GB split.
>>>
>>> The comments were mainly to use the pc-dimm model instead of "mem alias"
>>> method used on RFC v1 as this will help to add the mem hot-plug support
>>> in future.
>>>
>>> I am not sure about the motive behind Drew's idea of splitting the first
>>> 1GB as non-plug and remaining as a pc-dimm(cold). May it is to attempt a
>>> best effort scenario, but as I mentioned in reply to 0/6, the current solution
>>> will end up changing the base address if the 0x4000000 falls under a reserved
>>> region.
>>>
>>> Again, not sure whether we should enforce a strict check on base address
>>> start or just warn the user that it will fail on Guest with UEFI boot[1].
>>>
>>> Hi Drew,
>>>
>>> Please let me know your thoughts on this.
>>
>> Could you please take a look at the above discussion and let us
>> know your thoughts on the split of mem regions as 1GB non-pluggable
>> and rest as pc-dimm.
>>
> 
> Hi Shameer,
> 
> Sorry for the slow reply - I've been slowly catching back up after
> vacation. There are two reasons to have one non-pluggable memory region
> and the rest of memory in a single pluggable pc-dimm.
> 
> 1) For mach-virt we must have the base of memory at the 1G boundary,
>    both because otherwise we'll break ArmVirt UEFI and because that's
>    a guarantee that Peter has stated he'd like to keep for mach-virt.
> 
> 2) Memory split in this way already has precedent in the x86 PC
>    machine models.
> 
> It's debatable how much memory we should allocate to the non-pluggable
> region. It doesn't need to be 1G, it could be smaller. The default
> memory size allocated to a mach-virt guest that doesn't provide '-m'
> on the command line is 128M. Maybe we should use that size?
> 
> If 0x40000000 falls into a reserved address region on some host, then
> I'm afraid the mach-virt model won't work with those devices unless the
> guest doesn't use UEFI and Peter is open to providing a machine property
> that one can enable in order to move the base address of memory.
> 
> I know Eric is looking at this problem too. I hope you guys are
> coordinating your efforts.

Yes we sync'ed together. I will send an RFC beginning of next week
addressing both
- support of >40b PA VM (based on Suzuki's series)
- addition of DIMM at 2TB, reusing the standard PC-DIMM hotplug
framework. This is something standard and similar to what is done on PC
Q35. I am reusing some of Shameer's patches, rebased on top of Igor and
David recent works.

Then we need to understand how we can use 2 hotplug regions. This is not
obvsious to me as the framework currently uses a dedicated MemoryRegion,
if I understand it correctly.

Thanks

Eric
> 
> Thanks,
> drew
> 

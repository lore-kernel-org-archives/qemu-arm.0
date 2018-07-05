Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1609161wrq;
        Thu, 5 Jul 2018 06:30:45 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcfijlH+t2948y7AgvvPOtWDNfNm79erhQYMs4dXNkEhcZJP9RTclYmNHEwhPzN5AdVVXgF
X-Received: by 2002:a37:70c1:: with SMTP id l184-v6mr5270241qkc.86.1530797445863;
        Thu, 05 Jul 2018 06:30:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530797445; cv=none;
        d=google.com; s=arc-20160816;
        b=uFU5fp/x8eG3aal9Y3DDg1YPFxAUR0TJaCCzjv22qegibAfLiLytM6gMdwPEPdyz4u
         6UVrvN07mOFL/5DTiHkkiXyyScbma1SeINf4knOMifvcLxzxX3EPbg1GwbMA1BSsnC6x
         qDpZu+MrCw+dd0zw6prkuE9lkfOc8oXXJIwkZQ14MetAKUYyFbPuV5GzC9HK76ttCtJW
         JGV/8tulk2QdCV7tY8VttCTS2oq66Yt+Ley4fAxSSZoOHzTpgAU76JMDEvTGegnuVVws
         2jXKiAGSqSyMc8xUnF6fDXDNx3ylfTstwnoRGrjrnQjwWC5VW5LZlM3xqMq57ISCudSf
         4Ejg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=TSxMqA9WTs+Z1lZxuR3ts6wi8ypjfW9pc/bgUZHrOnQ=;
        b=tGMoGRAx+qDXNnxuSfMiVM/BZgE/QlMVk917tmw4qr2+OwDsXhduQhrAi6wuhzz/zZ
         DcDA7+Mo8dB0F8sPLPPLfhxUKsjoj6fmpQ5rty7hHH1RtTDY1PipLNM8gXSWPjzS7EXb
         ItC1smqyDYxTkr/1R8xoWQPQBdX6mNMo2FS1U8s9/jPmgzIDMBZ4a7Pkov49VDbvTtNx
         7TA/1TBEgbl9pjnXtHAcKwM6rClceDqXLeyWRmApuk6zFN+Ju8BD733rKUhvKZVIhCSO
         N/XPfv851vsk7eYSHluR7fytwJ2p+2FLBf7OuFye0dtTBkUAOu6hk50CKhY4Sz9PrVV5
         MAtg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t41-v6si1792603qth.214.2018.07.05.06.30.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Jul 2018 06:30:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52847 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fb4LN-0001LF-DF
	for alex.bennee@linaro.org; Thu, 05 Jul 2018 09:30:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48384)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fb4L9-0001JC-Du
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 09:30:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fb4L6-0000pi-8Q
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 09:30:31 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48410 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fb4L5-0000kC-Ru; Thu, 05 Jul 2018 09:30:28 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 71B1F7788A;
	Thu,  5 Jul 2018 13:30:26 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-118.ams2.redhat.com
	[10.36.116.118])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A32E5215688A;
	Thu,  5 Jul 2018 13:30:25 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1530775623-32399-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8YkDgJgr5Mgv4PgpmhQDpr+61hfaxmpnQWGXocEawxdg@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <94f26745-00a2-eb8d-f6d9-d9ad4829214e@redhat.com>
Date: Thu, 5 Jul 2018 15:30:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8YkDgJgr5Mgv4PgpmhQDpr+61hfaxmpnQWGXocEawxdg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 05 Jul 2018 13:30:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 05 Jul 2018 13:30:26 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for 3.0] hw/arm/smmu-common: Fix
 devfn computation in smmu_iommu_mr
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ulAwdPsjVfDc

Hi Peter,

On 07/05/2018 02:56 PM, Peter Maydell wrote:
> On 5 July 2018 at 08:27, Eric Auger <eric.auger@redhat.com> wrote:
>> smmu_iommu_mr() aims at returning the IOMMUMemoryRegion corresponding
>> to a given sid. The function extracts both the PCIe bus number and
>> the devfn to return this data. Current computation of devfn is wrong
>> as it only returns the PCIe function instead of slot | function.
>>
>> Fixes 32cfd7f39e08 ("hw/arm/smmuv3: Cache/invalidate config data")
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/smmu-common.c         | 2 +-
>>  include/hw/arm/smmu-common.h | 1 +
>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>> index 3098915..55c75d6 100644
>> --- a/hw/arm/smmu-common.c
>> +++ b/hw/arm/smmu-common.c
>> @@ -351,7 +351,7 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid)
>>      bus_n = PCI_BUS_NUM(sid);
>>      smmu_bus = smmu_find_smmu_pcibus(s, bus_n);
>>      if (smmu_bus) {
>> -        devfn = sid & 0x7;
>> +        devfn = SMMU_PCI_DEVFN(sid);
>>          smmu = smmu_bus->pbdev[devfn];
>>          if (smmu) {
>>              return &smmu->iommu;
>> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
>> index 50e2912..b07cadd 100644
>> --- a/include/hw/arm/smmu-common.h
>> +++ b/include/hw/arm/smmu-common.h
>> @@ -24,6 +24,7 @@
>>
>>  #define SMMU_PCI_BUS_MAX      256
>>  #define SMMU_PCI_DEVFN_MAX    256
>> +#define SMMU_PCI_DEVFN(sid)   (sid & 0xFF)
>>
>>  #define SMMU_MAX_VA_BITS      48
> 
> Applied to target-arm.next, thanks.
> 
> As I was reviewing this, I checked where we allocate the pbdev array
> to confirm that it's big enough (which it is), and I noticed an oddity:
> in include/hw/arm/smmu-common.h we define the SMMUPciBus struct like this:
> 
> typedef struct SMMUPciBus {
>     PCIBus       *bus;
>     SMMUDevice   *pbdev[0]; /* Parent array is sparse, so dynamically alloc */
> } SMMUPciBus;
> 
> but in fact we don't ever have local variables of this type and the
> only place we dynamically allocate them is in smmu_find_add_as(),
> which does
>         sbus = g_malloc0(sizeof(SMMUPciBus) +
>                          sizeof(SMMUDevice *) * SMMU_PCI_DEVFN_MAX);
> 
> Is there a reason I missed why we don't just define the struct
> to have
>   SMMUDevice *pbdev[SMMU_PCI_DEVFN_MAX];

I don't see any reason either. This code is inherited from
hw/i386.intel_iommu.c vtd_find_add_as() which does the same allocation
and I cannot find any reason out there either. This is not a
justification though ;-)

Can I fix it in 3.1 or do you want me to fix it for 3.0?

Thanks

Eric
> ?
> 
> thanks
> -- PMM
> 

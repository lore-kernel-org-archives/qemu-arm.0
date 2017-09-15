Received: by 10.223.172.38 with SMTP id v35csp397281wrc;
        Fri, 15 Sep 2017 00:41:45 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDY/As8mEW4BJ9hQGjk6rcqpMMEb2lxo7DsKnDZoib71IW3HLqgRE1iH/nsqoHIZA1vghB/
X-Received: by 10.55.130.197 with SMTP id e188mr6081318qkd.203.1505461305318;
        Fri, 15 Sep 2017 00:41:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505461305; cv=none;
        d=google.com; s=arc-20160816;
        b=RjB7aS8gLsgQTWcGvZmVT7daBsFHqhVr4HkurN/QwZmN+7GG41ji0JkwZPdvpizddS
         M1NSTc2PKj35ZhhmKuodzbDqFY6VqGJE4+5PBOqI80i2vp62NP3aaV563qsSR0ba3sZ/
         XocdhwCQTJOPmKrifpcIC36rDLkaozJsvl7Mmw5v8TqV300e3GVge9A98bSYH6s9S2va
         69IHE8EY8OgsmaPLUKhTq3oZobjZDeWpJ+Dhg6zeCku5m43mKvd7OMB34f14VVxGDA9G
         kEWRQzo0Lc6StgnfV1yKqh9xVq/JGcgH+flxuGWklGK+qEwcpYuPcShKWOmE4cGWP2iP
         V5kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=Hel7M9fcb2DCUFuViq5PuzV/6BQ4EWudd837ZNKHIgQ=;
        b=xkFmOjT5d2utHXoAUH4pdPXALMbs99ce2pe/LVDh/58yUgZcrFDzcLInfS/E/bvus/
         76rVpozTYj2Iq8+VX4X/EFtC/oPGv5SJzZqpe/I8uz0sEmJeLKXLWqHYuSFY/RBMD+uH
         /cb9MdKazH5vd3gm56b4Jfd1sDl/aAdYhhMo82vv5bn+/r2vis+Rj0GFL6EroZiDAl9J
         jjO+DkKZvu38XVbky/JW53Irv/MP/NmCMyNIk06zYQt2vNc9PphW3gdSCB+1ENCU458Y
         c5+vaeXasNL7rU8YpVCUIE/EkrvSb1RX9wLjBqUllDODMwYGM3JotgGvsdW8En50Z1Pe
         xMdA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a22si355521qtc.268.2017.09.15.00.41.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Sep 2017 00:41:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51771 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dslFv-0007SJ-2j
	for alex.bennee@linaro.org; Fri, 15 Sep 2017 03:41:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dslFg-0007OZ-Rh
	for qemu-arm@nongnu.org; Fri, 15 Sep 2017 03:41:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dslFf-0005ur-NF
	for qemu-arm@nongnu.org; Fri, 15 Sep 2017 03:41:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59461)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dslFf-0005sH-Dd; Fri, 15 Sep 2017 03:41:27 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 49E8CC057FA6;
	Fri, 15 Sep 2017 07:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 49E8CC057FA6
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-116-217.ams2.redhat.com
	[10.36.116.217])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B33D878DC6;
	Fri, 15 Sep 2017 07:41:14 +0000 (UTC)
To: Tomasz Nowicki <tnowicki@caviumnetworks.com>,
	Linu Cherian <linuc.decode@gmail.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<1504286483-23327-14-git-send-email-eric.auger@redhat.com>
	<20170914092751.GA3336@virtx40>
	<4dbbccae-64e1-f4ac-4dcc-3abd9766f324@caviumnetworks.com>
	<795d99ba-e492-04ce-dda4-709682baf6cd@caviumnetworks.com>
	<4f9fc697-9e6c-5dd7-65c7-92326135aa56@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <d82cdb08-e5fe-edb1-c7a7-ca5262448f1f@redhat.com>
Date: Fri, 15 Sep 2017 09:41:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <4f9fc697-9e6c-5dd7-65c7-92326135aa56@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 15 Sep 2017 07:41:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v7 13/20] hw/arm/smmuv3: Implement IOMMU
 memory region replay callback
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mohun106@gmail.com, jean-philippe.brucker@arm.com,
	bharat.bhushan@nxp.com, mst@redhat.com, will.deacon@arm.com,
	qemu-devel@nongnu.org, peterx@redhat.com,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	christoffer.dall@linaro.org, linu.cherian@cavium.com,
	wtownsen@redhat.com, robin.murphy@arm.com,
	prem.mallappa@gmail.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: odDx1QNtlZtD



On 15/09/2017 09:30, Auger Eric wrote:
> Hi Tomasz,
> 
> On 14/09/2017 16:43, Tomasz Nowicki wrote:
>> On 14.09.2017 16:31, Tomasz Nowicki wrote:
>>> Hi Eric,
>>>
>>> On 14.09.2017 11:27, Linu Cherian wrote:
>>>> Hi Eric,
>>>>
>>>> On Fri Sep 01, 2017 at 07:21:16PM +0200, Eric Auger wrote:
>>>>> memory_region_iommu_replay() is used for VFIO integration.
>>>>>
>>>>> However its default implementation is not adapted to SMMUv3
>>>>> IOMMU memory region. Indeed the input address range is too
>>>>> huge and its execution is too slow as it calls the translate()
>>>>> callback on each granule.
>>>>>
>>>>> Let's implement the replay callback which hierarchically walk
>>>>> over the page table structure and notify only the segments
>>>>> that are populated with valid entries.
>>>>>
>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>> ---
>>>>>   hw/arm/smmuv3.c     | 36 ++++++++++++++++++++++++++++++++++++
>>>>>   hw/arm/trace-events |  1 +
>>>>>   2 files changed, 37 insertions(+)
>>>>>
>>>>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>>>>> index 8e7d10d..c43bd93 100644
>>>>> --- a/hw/arm/smmuv3.c
>>>>> +++ b/hw/arm/smmuv3.c
>>>>> @@ -657,6 +657,41 @@ static int smmuv3_notify_entry(IOMMUTLBEntry
>>>>> *entry, void *private)
>>>>>       return 0;
>>>>>   }
>>>>> +/* Unmap the whole notifier's range */
>>>>> +static void smmuv3_unmap_notifier_range(IOMMUNotifier *n)
>>>>> +{
>>>>> +    IOMMUTLBEntry entry;
>>>>> +    hwaddr size = n->end - n->start + 1;
>>>>> +
>>>>> +    entry.target_as = &address_space_memory;
>>>>> +    entry.iova = n->start & ~(size - 1);
>>>>> +    entry.perm = IOMMU_NONE;
>>>>> +    entry.addr_mask = size - 1;
>>>>> +
>>>>> +    memory_region_notify_one(n, &entry);
>>>>> +}
>>>>> +
>>>>> +static void smmuv3_replay(IOMMUMemoryRegion *mr, IOMMUNotifier *n)
>>>>> +{
>>>>> +    SMMUTransCfg cfg = {};
>>>>> +    int ret;
>>>>> +
>>>>> +    trace_smmuv3_replay(mr->parent_obj.name, n, n->start, n->end);
>>>>> +    smmuv3_unmap_notifier_range(n);
>>>>> +
>>>>> +    ret = smmuv3_decode_config(mr, &cfg);
>>>>> +    if (ret) {
>>>>> +        error_report("%s error decoding the configuration for iommu
>>>>> mr=%s",
>>>>> +                     __func__, mr->parent_obj.name);
>>>>> +    }
>>>>>
>>>>
>>>> On an invalid config being found, shouldnt we return rather than
>>>> proceeding with
>>>> page table walk. For example on an invalid Stream table entry.
>>>
>>> Indeed, without return here vhost case is not working for me.
>>
>> I was just lucky one time. return here has no influence. Vhost still not
>> working. Sorry for noise.
> 
> As far as I understand the replay() callback only is called in VFIO use
> case. So this shouldn't impact vhost.
Forget that, that's potentially called from some invalidation commands
also in vhost case.

Thanks

Eric
> 
> I can't reproduce your vhost issue on my side. I will review the
> invalidate code again and compare against the last version.
> 
> What is the page size used by your guest?
> 
> Thanks
> 
> Eric
>>
>> Tomasz
>>
>>>
>>> Thanks,
>>> Tomasz
>>>
>>>>
>>>> +
>>>>> +    if (cfg.disabled || cfg.bypassed) {
>>>>> +        return;
>>>>> +    }
>>>>> +    /* walk the page tables and replay valid entries */
>>>>> +    smmu_page_walk(&cfg, 0, (1ULL << (64 - cfg.tsz)) - 1, false,
>>>>> +                   smmuv3_notify_entry, n);
>>>>> +}
>>>>>   static void smmuv3_notify_iova_range(IOMMUMemoryRegion *mr,
>>>>> IOMMUNotifier *n,
>>>>>                                        uint64_t iova, size_t size)
>>>>>   {
>>>>> @@ -1095,6 +1130,7 @@ static void
>>>>> smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
>>>>>       imrc->translate = smmuv3_translate;
>>>>>       imrc->notify_flag_changed = smmuv3_notify_flag_changed;
>>>>> +    imrc->replay = smmuv3_replay;
>>>>>   }
>>>>>   static const TypeInfo smmuv3_type_info = {
>>>>> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
>>>>> index 4ac264d..15f84d6 100644
>>>>> --- a/hw/arm/trace-events
>>>>> +++ b/hw/arm/trace-events
>>>>> @@ -46,5 +46,6 @@ smmuv3_cfg_stage(int s, uint32_t oas, uint32_t
>>>>> tsz, uint64_t ttbr, bool aa64, ui
>>>>>   smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node
>>>>> for iommu mr=%s"
>>>>>   smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node
>>>>> for iommu mr=%s"
>>>>>   smmuv3_replay_mr(const char *name) "iommu mr=%s"
>>>>> +smmuv3_replay(const char *name, void *n, hwaddr start, hwaddr end)
>>>>> "iommu mr=%s notifier=%p [0x%"PRIx64",0x%"PRIx64"]"
>>>>>   smmuv3_notify_entry(hwaddr iova, hwaddr pa, hwaddr mask, int perm)
>>>>> "iova=0x%"PRIx64" pa=0x%" PRIx64" mask=0x%"PRIx64" perm=%d"
>>>>>   smmuv3_notify_iova_range(const char *name, uint64_t iova, size_t
>>>>> size, void *n) "iommu mr=%s iova=0x%"PRIx64" size=0x%lx n=%p"
>>>>> -- 
>>>>> 2.5.5
>>>>>
>>>>>
>>>>

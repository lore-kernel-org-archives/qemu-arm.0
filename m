Received: by 10.223.172.38 with SMTP id v35csp384467wrc;
        Fri, 15 Sep 2017 00:24:24 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAtFzGruqHBoB51HuOE+BxP9OYSzIY6y+N1odw/2r33GEwO+4uqN6Rdhqe5QC1qgqUk17NS
X-Received: by 10.200.22.21 with SMTP id p21mr34042924qtj.104.1505460264813;
        Fri, 15 Sep 2017 00:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505460264; cv=none;
        d=google.com; s=arc-20160816;
        b=Ue1C4RH5a+ONrQD9GHX5dOgRVhi1hUajb4C5aJfip8uQA2aOFY6reUHzevFHnNzxkf
         QqTdPHEG6uQfvhd8qI1G/l9BRJcKlr7f483JZSovnxHlMu5Di83l6Gn+34tLKothHED6
         1WyLujfcE+MtxTnvCfq1norL0tZUq2f2XYgY3BamKDRQ/dsZM0IxRBh1xeYMCuhtQAJ2
         24rEQovrCid+MY2DEtLL/Nr/AL0GCVB8duXCPkIHszmKT+IMc+fYcjTImfT2vTzp/f57
         xYwAiN2TImlJrEgmylvs0gg62ZzMh3NB6urtb6zQjTqMJCIAsivL7UO1HUj8VlqY6S06
         J21w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=bM5ySdbS0/5ztm6CQZLoQlFKY+iCtelscOI37gsZeHA=;
        b=r0JS0pqi7Hv/WSMPQYecWpIzOj3GxUpJUGJF5e3sGSkRNJjm5+9XTJSd7QzGd0zuRS
         u1dY97p5r8HFl+IEd3JbSu1cglh53zPoxkY8PMdPWvVw+odWwVwri4gtO+NrnnNQ8W7b
         lE9hrfbKe4iZuKDyJAVUIZrFzV5dMbj1RSZX7EdkbG8ZRaaKFsxUSkbokY/hyWru/uQ7
         ZtvMhn6qOUjwq1D07oDK8CPV9waeZOeen3Vjg3IMgydkbMvl0JiLj+o4FqBIjNmiL1Sv
         LoojYA5QtFGw11KMQ2iEXpYZc21a7QTi0J4+KDUHXzL3DCSX60fzIk0YHvtQEXhjxnMF
         nMeA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c9si325897qkh.398.2017.09.15.00.24.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Sep 2017 00:24:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51720 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dskz8-0007hR-JD
	for alex.bennee@linaro.org; Fri, 15 Sep 2017 03:24:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dskz1-0007f3-Np
	for qemu-arm@nongnu.org; Fri, 15 Sep 2017 03:24:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dskyy-0006QS-IA
	for qemu-arm@nongnu.org; Fri, 15 Sep 2017 03:24:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:25780)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dskyy-0006Pu-7x; Fri, 15 Sep 2017 03:24:12 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 537F9C0587C7;
	Fri, 15 Sep 2017 07:24:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 537F9C0587C7
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-116-217.ams2.redhat.com
	[10.36.116.217])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F9BE7AA71;
	Fri, 15 Sep 2017 07:23:59 +0000 (UTC)
To: Linu Cherian <linuc.decode@gmail.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<1504286483-23327-14-git-send-email-eric.auger@redhat.com>
	<20170914092751.GA3336@virtx40>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <403a9798-fed2-671f-fc6e-7cc0fd53c90c@redhat.com>
Date: Fri, 15 Sep 2017 09:23:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20170914092751.GA3336@virtx40>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 15 Sep 2017 07:24:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 13/20] hw/arm/smmuv3:
 Implement IOMMU memory region replay callback
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
	tn@semihalf.com, mst@redhat.com, will.deacon@arm.com,
	qemu-devel@nongnu.org, peterx@redhat.com,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	prem.mallappa@gmail.com, linu.cherian@cavium.com,
	robin.murphy@arm.com, eric.auger.pro@gmail.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org, wtownsen@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Me49ZSh31XiN

Hi Linu,

On 14/09/2017 11:27, Linu Cherian wrote:
> Hi Eric,
> 
> On Fri Sep 01, 2017 at 07:21:16PM +0200, Eric Auger wrote:
>> memory_region_iommu_replay() is used for VFIO integration.
>>
>> However its default implementation is not adapted to SMMUv3
>> IOMMU memory region. Indeed the input address range is too
>> huge and its execution is too slow as it calls the translate()
>> callback on each granule.
>>
>> Let's implement the replay callback which hierarchically walk
>> over the page table structure and notify only the segments
>> that are populated with valid entries.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/smmuv3.c     | 36 ++++++++++++++++++++++++++++++++++++
>>  hw/arm/trace-events |  1 +
>>  2 files changed, 37 insertions(+)
>>
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index 8e7d10d..c43bd93 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -657,6 +657,41 @@ static int smmuv3_notify_entry(IOMMUTLBEntry *entry, void *private)
>>      return 0;
>>  }
>>  
>> +/* Unmap the whole notifier's range */
>> +static void smmuv3_unmap_notifier_range(IOMMUNotifier *n)
>> +{
>> +    IOMMUTLBEntry entry;
>> +    hwaddr size = n->end - n->start + 1;
>> +
>> +    entry.target_as = &address_space_memory;
>> +    entry.iova = n->start & ~(size - 1);
>> +    entry.perm = IOMMU_NONE;
>> +    entry.addr_mask = size - 1;
>> +
>> +    memory_region_notify_one(n, &entry);
>> +}
>> +
>> +static void smmuv3_replay(IOMMUMemoryRegion *mr, IOMMUNotifier *n)
>> +{
>> +    SMMUTransCfg cfg = {};
>> +    int ret;
>> +
>> +    trace_smmuv3_replay(mr->parent_obj.name, n, n->start, n->end);
>> +    smmuv3_unmap_notifier_range(n);
>> +
>> +    ret = smmuv3_decode_config(mr, &cfg);
>> +    if (ret) {
>> +        error_report("%s error decoding the configuration for iommu mr=%s",
>> +                     __func__, mr->parent_obj.name);
>> +    }
>>
> 
> On an invalid config being found, shouldnt we return rather than proceeding with
> page table walk. For example on an invalid Stream table entry.
Yes that's correct. I am going to fix that.

Thanks!

Eric
> 
> +
>> +    if (cfg.disabled || cfg.bypassed) {
>> +        return;
>> +    }
>> +    /* walk the page tables and replay valid entries */
>> +    smmu_page_walk(&cfg, 0, (1ULL << (64 - cfg.tsz)) - 1, false,
>> +                   smmuv3_notify_entry, n);
>> +}
>>  static void smmuv3_notify_iova_range(IOMMUMemoryRegion *mr, IOMMUNotifier *n,
>>                                       uint64_t iova, size_t size)
>>  {
>> @@ -1095,6 +1130,7 @@ static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
>>  
>>      imrc->translate = smmuv3_translate;
>>      imrc->notify_flag_changed = smmuv3_notify_flag_changed;
>> +    imrc->replay = smmuv3_replay;
>>  }
>>  
>>  static const TypeInfo smmuv3_type_info = {
>> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
>> index 4ac264d..15f84d6 100644
>> --- a/hw/arm/trace-events
>> +++ b/hw/arm/trace-events
>> @@ -46,5 +46,6 @@ smmuv3_cfg_stage(int s, uint32_t oas, uint32_t tsz, uint64_t ttbr, bool aa64, ui
>>  smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
>>  smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
>>  smmuv3_replay_mr(const char *name) "iommu mr=%s"
>> +smmuv3_replay(const char *name, void *n, hwaddr start, hwaddr end) "iommu mr=%s notifier=%p [0x%"PRIx64",0x%"PRIx64"]"
>>  smmuv3_notify_entry(hwaddr iova, hwaddr pa, hwaddr mask, int perm) "iova=0x%"PRIx64" pa=0x%" PRIx64" mask=0x%"PRIx64" perm=%d"
>>  smmuv3_notify_iova_range(const char *name, uint64_t iova, size_t size, void *n) "iommu mr=%s iova=0x%"PRIx64" size=0x%lx n=%p"
>> -- 
>> 2.5.5
>>
>>
> 

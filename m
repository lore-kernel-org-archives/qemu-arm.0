Received: by 10.28.4.212 with SMTP id 203csp3799233wme;
        Mon, 23 Apr 2018 05:11:06 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrVr+Ac3VHifcASdHeRlF6Z/6VdswlrD1tvu/75qi6SX78c7OsYjgDOtWjGf0wHQamj8g1x
X-Received: by 2002:aed:3224:: with SMTP id y33-v6mr23995812qtd.179.1524485466162;
        Mon, 23 Apr 2018 05:11:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524485466; cv=none;
        d=google.com; s=arc-20160816;
        b=wFZHGSYWH95sVpllRHozdc9Ht4u30b+z3Aafnr6zqEcjye2NMayiffhMsiTOzmWzJj
         GqJc5Vs3dVy1Usk+/tfPMoyjwARGmAcpOYoBGxcWuPHex/IO3dsrUEbNn7dg1BIjpY8+
         SCzNJ+vCGjayENLdcZE6uQPAOp86HIusyqYa1bA/fEVa2IplL84g6Ig9TDnu6Xf9Ab+5
         ytA4lMe2ZNX09/Z5kvHMmYC+wHI2rjFrlqnqYi6aIX7t1N15/8p4wCmt0ZRrAbq1Bdcg
         C15ySgU1CmCnzr/XNkAfV6Kb0CA37vvVeOSMFivT14SFUtfHeePVtQ0MYKxqQFMylsjo
         zG1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=aPUR3EhH1BFWVpZ35pklQYczxpjieDFZTY+CXkyWLwE=;
        b=IXnyn8bjCMBvV+Z2KR4N3/D/fT0kP1yDU0y5mgqtK7CzJTJhf/ON7IU4IJHccsaZry
         kY+QifoOy4WJscvm4RIYqABQdRkoN+b8C5ruIEE2xfdKwEUfDwzTf70UmO7G+Xci0YcD
         RJjRW884mk608vqi3Nu4bT7ArAawwt3ga0OWDP73xNnZhE+KAIkTA2ghy+jAPTQtjLr4
         dZSIrzN5QLmKQg0IHXDB2aMwWhnhINMH19z8aRiPq6Fs2mWxaTSvvnr+PFQfReZeffgk
         hMDdis5HoNYVJnSp71SmgoqOdI+qS+3s+N3ygv/a4tgUP/6vNI9Tg9X9RJpamppO77IW
         xeGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y36si709074qve.75.2018.04.23.05.11.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Apr 2018 05:11:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41533 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fAaJF-0000ZU-M0
	for alex.bennee@linaro.org; Mon, 23 Apr 2018 08:11:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43151)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fAaJ7-0000YY-8j
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 08:10:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fAaJ4-0002d2-IH
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 08:10:57 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35252 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fAaJ4-0002cG-Bn; Mon, 23 Apr 2018 08:10:54 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E7B0A406E97E;
	Mon, 23 Apr 2018 12:10:52 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-141.ams2.redhat.com
	[10.36.116.141])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 231CD83B92;
	Mon, 23 Apr 2018 12:10:40 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1523518688-26674-1-git-send-email-eric.auger@redhat.com>
	<1523518688-26674-4-git-send-email-eric.auger@redhat.com>
	<CAFEAcA84iZV8vUK4DxPpuO6LwUqE=LEoW63qy=FTiF6KHvYhEw@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <677f3faa-24bd-0679-47ae-2dc9bd1c9bda@redhat.com>
Date: Mon, 23 Apr 2018 14:10:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA84iZV8vUK4DxPpuO6LwUqE=LEoW63qy=FTiF6KHvYhEw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 23 Apr 2018 12:10:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 23 Apr 2018 12:10:53 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v11 03/17] hw/arm/smmu-common: VMSAv8-64 page
 table walk
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
Cc: Christoffer Dall <cdall@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Jintack Lim <jintack@cs.columbia.edu>,
	Prem Mallappa <prem.mallappa@gmail.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 79Zz/v4aPigD

Hi Peter,

On 04/16/2018 02:59 PM, Peter Maydell wrote:
> On 12 April 2018 at 08:37, Eric Auger <eric.auger@redhat.com> wrote:
>> This patch implements the page table walk for VMSAv8-64.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
> 
>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>> index 9a966bb..6a58948 100644
>> --- a/hw/arm/smmu-common.c
>> +++ b/hw/arm/smmu-common.c
>> @@ -27,6 +27,215 @@
>>
>>  #include "qemu/error-report.h"
>>  #include "hw/arm/smmu-common.h"
>> +#include "smmu-internal.h"
>> +
>> +/* VMSAv8-64 Translation */
>> +
>> +/**
>> + * get_pte - Get the content of a page table entry located t
>> + * @base_addr[@index]
>> + */
> 
> Comment appears to be truncated ?
> 
>> +static int get_pte(dma_addr_t baseaddr, uint32_t index, uint64_t *pte,
>> +                   SMMUPTWEventInfo *info)
>> +{
>> +    int ret;
>> +    dma_addr_t addr = baseaddr + index * sizeof(*pte);
>> +
>> +    /* TODO: guarantee 64-bit single-copy atomicity */
>> +    ret = dma_memory_read(&address_space_memory, addr,
>> +                          (uint8_t *)pte, sizeof(*pte));
>> +
>> +    if (ret != MEMTX_OK) {
>> +        info->type = SMMU_PTW_ERR_WALK_EABT;
>> +        info->addr = addr;
>> +        return -EINVAL;
>> +    }
>> +    trace_smmu_get_pte(baseaddr, index, addr, *pte);
>> +    return 0;
>> +}
>> +
> 
>> +/**
>> + * smmu_ptw - Walk the page tables for an IOVA, according to @cfg
>> + *
>> + * @cfg: translation configuration
>> + * @iova: iova to translate
>> + * @perm: tentative access type
>> + * @tlbe: returned entry
>> + * @info: ptw event handle
>> + *
>> + * return 0 on success
>> + */
>> +inline int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
>> +             IOMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
>> +{
>> +    if (!cfg->aa64) {
>> +        /*
>> +         * This code path is not entered as we check this while decoding
>> +         * the configuration data in the derived SMMU model.
>> +         */
>> +        assert(0);
> 
> Prefer either g_assert_not_reached() or just assert(cfg->aa64).
> 
>> +    }
>> +
>> +    return smmu_ptw_64(cfg, iova, perm, tlbe, info);
>> +}
>>
> 
>> +
>> +/*
>> + * TODO: At the moment all transactions are considered as priviledged (EL1)
> 
> "privileged"
> 
>> + * as IOMMU translation callback does not pass user/priv attributes.
>> + */
>> +#define is_permission_fault(ap, perm) \
>> +    (((perm) & IOMMU_WO) && ((ap) & 0x2))
>> +
>> +#define PTE_AP_TO_PERM(ap) \
>> +    (IOMMU_ACCESS_FLAG(true, !((ap) & 0x2)))
>> +
>> +/* Level Indexing */
>> +
>> +static inline int level_shift(int level, int granule_sz)
>> +{
>> +    return granule_sz + (3 - level) * (granule_sz - 3);
>> +}
>> +
>> +static inline uint64_t level_page_mask(int level, int granule_sz)
>> +{
>> +    return ~(MAKE_64BIT_MASK(0, level_shift(level, granule_sz)));
>> +}
>> +
>> +/**
>> + * TODO: handle the case where the level resolves less than
>> + * granule_sz -3 IA bits.
>> + */
>> +static inline
>> +uint64_t iova_level_offset(uint64_t iova, int level, int granule_sz)
>> +{
>> +    return (iova >> level_shift(level, granule_sz)) &
>> +            MAKE_64BIT_MASK(0, granule_sz - 3);
>> +}
>> +
>> +#endif
> 
> When does the TODO case happen, and what goes wrong?
Sorry for the delay [back to the office].

This refers to
D4.2 of ARM ARM , Effect of granule size on translation table addressing
and indexing/ Reduced IA width.

"
Depending on the configuration and implementation choices, the required
input address width for the initial level of lookup might be smaller
than the number of address bits that can be resolved at that level"

For instance with 4k granule and IA limited to 35 bit, we use a 9-bit
mask here and initial level 1 offset is based on IA[30, 38] although IA
is limited to 35.

Thanks

Eric
> 
>> --- a/include/hw/arm/smmu-common.h
>> +++ b/include/hw/arm/smmu-common.h
>> @@ -129,4 +129,18 @@ static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
>>  {
>>      return  ((pci_bus_num(sdev->bus) & 0xff) << 8) | sdev->devfn;
>>  }
>> +
>> +/**
>> + * smmu_ptw - Perform the page table walk for a given iova / access flags
>> + * pair, according to @cfg translation config
>> + */
>> +int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
>> +             IOMMUTLBEntry *tlbe, SMMUPTWEventInfo *info);
>> +
>> +/**
>> + * select_tt - compute which translation table shall be used according
> 
> "according to"
> 
>> + * the input iova and tranlsation config and return the TT specific info
> 
> "translation"
> 
>> + */
>> +SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova);
>> +
>>  #endif  /* HW_ARM_SMMU_COMMON */
> 
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM
> 

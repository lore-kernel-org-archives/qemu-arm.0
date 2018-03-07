Received: by 10.28.91.67 with SMTP id p64csp188707wmb;
        Wed, 7 Mar 2018 08:24:19 -0800 (PST)
X-Google-Smtp-Source: AG47ELtoM0v80K3d8v5PDKCFR2S+xVJ8hXKOrVtsWsrqWZKReG8CshWD7QWC8dFCuqeOKU0wuY+N
X-Received: by 2002:a25:acc3:: with SMTP id x3-v6mr5084940ybd.117.1520439859772;
        Wed, 07 Mar 2018 08:24:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520439859; cv=none;
        d=google.com; s=arc-20160816;
        b=y67jqRCGIMWtRPyvKVpOfdiDj5h0GWfxdUiMIs7xfGYCRVM9jZ6kSvzLs8zTTaz2NB
         xKwNubhUz48pvhjJInBQp/LVi2fRz07xt6z0gGyES00DuF9HtXcyUOzTUv21hGqhCZ6v
         C6v8cGul1YppxWyPhJlNm9S7MQvbDLdjV5Azh4V5ddbFyqpY6mKDYkxliy29K7M5aJc3
         YE0lHmg5pgAhBljbx4edwHKSupPiHvPHN3V7sJVg5izQuX3cq9wVAxVVselmHIQIRdpL
         B/wIefFIk45lcn4S9ntqt5ru1I9cBpxG7eH/ZgMa2drm1MESGbyMKjdEDy0Nmm8vk43I
         33cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=bFgBa4q1+yVuwNHI+l6qfEdsNZApw7N8lz9nBytYcyc=;
        b=dW5dgwygKf5PRVs78x4SV/DqjrLVtiqmJ1rRH0Ksf4cYx0ezGAqYynzxzkqQrgYLo+
         IjUjx8GJgbWttIvgVm89tu/MHA5h9lM7jbhbK2NJQqFt28gb8FQNKVnhSzWEUU2eksmB
         pTJNxVD77PBQ8xm8yDSI77a6RUSkvPuh2O4EK+FHwvgEDtIMpzEuUgLCnlVspYzz0OoL
         FgiysN6mFbyZUC817GhO+P6EIBOK4AugCMKm4CH+rFpwOpHeW175J4u95AiwY3Bg3fXf
         5g5ApJstTyCrUYUllT2LBn4Msp4CTcH5DHsXndJNW+IHRNz84aVwo4Wg0gOUxpCEPOdd
         50Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u188si2974465ywd.25.2018.03.07.08.24.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Mar 2018 08:24:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34231 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1etbrX-0002Nz-3j
	for alex.bennee@linaro.org; Wed, 07 Mar 2018 11:24:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1etbrJ-0002Iw-IL
	for qemu-arm@nongnu.org; Wed, 07 Mar 2018 11:24:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1etbrG-0004dd-9d
	for qemu-arm@nongnu.org; Wed, 07 Mar 2018 11:24:05 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55320 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1etbrG-0004aI-1i; Wed, 07 Mar 2018 11:24:02 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34EBCC33F;
	Wed,  7 Mar 2018 16:23:52 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CC0D1102E23;
	Wed,  7 Mar 2018 16:23:39 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-4-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_scj3Nw+W6a7NL6bRR3ZGvUx1NLa4cWSmvfOA1BCEPgQ@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f1e870f8-9669-ffde-0556-bc8b16467356@redhat.com>
Date: Wed, 7 Mar 2018 17:23:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_scj3Nw+W6a7NL6bRR3ZGvUx1NLa4cWSmvfOA1BCEPgQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 07 Mar 2018 16:23:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 07 Mar 2018 16:23:52 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v9 03/14] hw/arm/smmu-common: VMSAv8-64 page
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	linuc.decode@gmail.com, Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vQuv9JB0jsri

Hi Peter,

On 06/03/18 20:43, Peter Maydell wrote:
> On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
>> This patch implements the page table walk for VMSAv8-64.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>> v8 -> v9:
>> - remove guest error log on PTE fetch fault
>> - rename  trace functions
>> - fix smmu_page_walk_level_res_invalid_pte last arg
>> - fix PTE_ADDRESS
>> - turn functions into macros
>> - make sure to return the actual pte access permission
>>   into tlbe->perm
>> - change proto of smmu_ptw*
>>
>> v7 -> v8:
>> - rework get_pte
>> - use LOG_LEVEL_ERROR
>> - remove error checking in get_block_pte_address
>> - page table walk simplified (no VFIO replay anymore)
>> - handle PTW error events
>> - use dma_memory_read
>>
>> v6 -> v7:
>> - fix wrong error handling in walk_page_table
>> - check perm in smmu_translate
>>
>> v5 -> v6:
>> - use IOMMUMemoryRegion
>> - remove initial_lookup_level()
>> - fix block replay
>>
>> v4 -> v5:
>> - add initial level in translation config
>> - implement block pte
>> - rename must_translate into nofail
>> - introduce call_entry_hook
>> - small changes to dynamic traces
>> - smmu_page_walk code moved from smmuv3.c to this file
>> - remove smmu_translate*
>>
>> v3 -> v4:
>> - reworked page table walk to prepare for VFIO integration
>>   (capability to scan a range of IOVA). Same function is used
>>   for translate for a single iova. This is largely inspired
>>   from intel_iommu.c
>> - as the translate function was not straightforward to me,
>>   I tried to stick more closely to the VMSA spec.
>> - remove support of nested stage (kernel driver does not
>>   support it anyway)
>> - use error_report and trace events
>> - add aa64[] field in SMMUTransCfg
>> ---
>>  hw/arm/smmu-common.c         | 232 +++++++++++++++++++++++++++++++++++++++++++
>>  hw/arm/smmu-internal.h       |  96 ++++++++++++++++++
>>  hw/arm/trace-events          |  10 ++
>>  include/hw/arm/smmu-common.h |   6 ++
>>  4 files changed, 344 insertions(+)
>>  create mode 100644 hw/arm/smmu-internal.h
>>
>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>> index d0516dc..24cc4ba 100644
>> --- a/hw/arm/smmu-common.c
>> +++ b/hw/arm/smmu-common.c
>> @@ -27,6 +27,238 @@
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
>> +static int get_pte(dma_addr_t baseaddr, uint32_t index, uint64_t *pte,
>> +                   SMMUPTWEventInfo *info)
>> +{
>> +    int ret;
>> +    dma_addr_t addr = baseaddr + index * sizeof(*pte);
>> +
>> +    ret = dma_memory_read(&address_space_memory, addr,
>> +                          (uint8_t *)pte, sizeof(*pte));
> 
> I think last time round I asked that these be done with the
> "read a 64-bit quantity" APIs and a comment that they're
> supposed to be atomic.

I was unsure about the fetch of the page descriptors themselves. I added
the comment on the fetch of STE, CD. 3.21.3 deals with configuration
structures. I will add the comment here as well.

> 
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
>> +/* VMSAv8-64 Translation Table Format Descriptor Decoding */
>> +
>> +/**
>> + * get_page_pte_address - returns the L3 descriptor output address,
>> + * ie. the page frame
>> + * ARM ARM spec: Figure D4-17 VMSAv8-64 level 3 descriptor format
>> + */
>> +static inline hwaddr get_page_pte_address(uint64_t pte, int granule_sz)
>> +{
>> +    return PTE_ADDRESS(pte, granule_sz);
>> +}
>> +
>> +/**
>> + * get_table_pte_address - return table descriptor output address,
>> + * ie. address of next level table
>> + * ARM ARM Figure D4-16 VMSAv8-64 level0, level1, and level 2 descriptor formats
>> + */
>> +static inline hwaddr get_table_pte_address(uint64_t pte, int granule_sz)
>> +{
>> +    return PTE_ADDRESS(pte, granule_sz);
>> +}
>> +
>> +/**
>> + * get_block_pte_address - return block descriptor output address and block size
>> + * ARM ARM Figure D4-16 VMSAv8-64 level0, level1, and level 2 descriptor formats
>> + */
>> +static hwaddr get_block_pte_address(uint64_t pte, int level, int granule_sz,
>> +                                    uint64_t *bsz)
>> +{
>> +    int n = 0;
>> +
>> +    switch (granule_sz) {
>> +    case 12:
>> +        if (level == 1) {
>> +            n = 30;
>> +        } else if (level == 2) {
>> +            n = 21;
>> +        }
>> +        break;
>> +    case 14:
>> +        if (level == 2) {
>> +            n = 25;
>> +        }
>> +        break;
>> +    case 16:
>> +        if (level == 2) {
>> +            n = 29;
>> +        }
>> +        break;
>> +    }
>> +    if (!n) {
>> +        error_setg(&error_fatal,
>> +                   "wrong granule/level combination (%d/%d)",
>> +                   granule_sz, level);
> 
> If this is guest-provokable then it shouldn't be a fatal error.
> If it isn't guest provokable then you can just assert.
> I think you should be able to sanitize the SMUTransTableInfo when
> you construct it from the CD (and give a C_BAD_CD event), and then
> you can trust the granule_sz and level when you're doing table walks.
OK.
> 
> You can calculate n as
>     n = (granule_sz - 3) * (4 - level) + 3;
> (compare target/arm/helper.c:get_phys_addr_lpae() calculation
> of page_size, and in the pseudocode the line
>     addrselectbottom = (3-level)*stride + grainsize;
> where stride is grainsize-3 and so comes out to the same thing.)

OK. I will simplify it and check when decoding the CD.
> 
>> +    }
>> +    *bsz = 1 << n;
>> +    return PTE_ADDRESS(pte, n);
>> +}
>> +
>> +static inline bool check_perm(int access_attrs, int mem_attrs)
>> +{
>> +    if (((access_attrs & IOMMU_RO) && !(mem_attrs & IOMMU_RO)) ||
>> +        ((access_attrs & IOMMU_WO) && !(mem_attrs & IOMMU_WO))) {
>> +        return false;
>> +    }
>> +    return true;
>> +}
> 
> This function doesn't seem to ever be used in this patchset?
> (clang will complain about that, though gcc won't.)
OK, will remove that.
> 
>> +
>> +SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
>> +{
>> +    if (!extract64(iova, 64 - cfg->tt[0].tsz, cfg->tt[0].tsz - cfg->tbi)) {
>> +        return &cfg->tt[0];
>> +    }
>> +    return &cfg->tt[1];
> 
> I'm confused by your handling of the TBI bits here. In
> decode_cd() you take the 2-bit TBI field into cfg->tbi. That's
> a pair of bits, one of which is "top byte ignore" for TTB0 and the
> other is "top byte ignore" for TTB1. But here you're subtracting
> the whole field from cfg->tt[0].tsz. Which of the two tbi bits
> you need to use depends on bit 55 of the iova (compare the code
> in get_phys_addr_lpae() and the pseudocode function AddrTop()),
> and then if that bit is 1 it means that 8 bits of address should
> be ignored when determining whether to use TTB0 or TTB1.
> 
> You also need to consider the case where the input address is in
> neither the TTB0 range nor the TTb1 range (cf fig D4-14 in the
> v8A Arm ARM DDI0487C.a, and the code in get_phys_addr_lpae()).

Yes I totally misunderstood the way to decode that :-(

> 
>> +}
>> +
>> +/**
>> + * smmu_ptw_64 - VMSAv8-64 Walk of the page tables for a given IOVA
>> + * @cfg: translation config
>> + * @iova: iova to translate
>> + * @perm: access type
>> + * @tlbe: IOMMUTLBEntry (out)
>> + * @info: handle to an error info
>> + *
>> + * Return 0 on success, < 0 on error. In case of error, @info is filled
>> + * and tlbe->perm is set to IOMMU_NONE.
>> + * Upon success, @tlbe is filled with translated_addr and entry
>> + * permission rights.
>> + */
>> +static int smmu_ptw_64(SMMUTransCfg *cfg,
>> +                       dma_addr_t iova, IOMMUAccessFlags perm,
>> +                       IOMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
>> +{
>> +    dma_addr_t baseaddr;
>> +    int stage = cfg->stage;
>> +    SMMUTransTableInfo *tt = select_tt(cfg, iova);
>> +    uint8_t level;
>> +    uint8_t granule_sz;
>> +
>> +    if (tt->disabled) {
>> +        info->type = SMMU_PTW_ERR_TRANSLATION;
>> +        goto error;
>> +    }
>> +
>> +    level = tt->initial_level;
>> +    granule_sz = tt->granule_sz;
>> +    baseaddr = extract64(tt->ttb, 0, 48);
> 
> The spec says that bits specified by the TTB0/TTB1 fields
> in a CD that are outside the effective IPS range are ILLEGAL;
> you should detect that when you set up tt->ttb and then you
> don't need the extract64() here, I think.
OK
> 
>> +
>> +    tlbe->iova = iova;
>> +    tlbe->addr_mask = (1 << tt->granule_sz) - 1;
> 
> you could just use "granule_sz" here since you have it in a local.
sure
> 
>> +
>> +    while (level <= 3) {
>> +        uint64_t subpage_size = 1ULL << level_shift(level, granule_sz);
>> +        uint64_t mask = subpage_size - 1;
>> +        uint32_t offset = iova_level_offset(iova, level, granule_sz);
>> +        uint64_t pte;
>> +        dma_addr_t pte_addr = baseaddr + offset * sizeof(pte);
>> +        uint8_t ap;
>> +
>> +        if (get_pte(baseaddr, offset, &pte, info)) {
>> +                goto error;
>> +        }
>> +        trace_smmu_ptw_level(level, iova, subpage_size,
>> +                             baseaddr, offset, pte);
>> +
>> +        if (is_invalid_pte(pte) || is_reserved_pte(pte, level)) {
>> +            trace_smmu_ptw_invalid_pte(stage, level, baseaddr,
>> +                                       pte_addr, offset, pte);
>> +            info->type = SMMU_PTW_ERR_TRANSLATION;
>> +            goto error;
>> +        }
>> +
>> +        if (is_page_pte(pte, level)) {
>> +            uint64_t gpa = get_page_pte_address(pte, granule_sz);
>> +
>> +            ap = PTE_AP(pte);
>> +            if (is_permission_fault(ap, perm)) {
>> +                info->type = SMMU_PTW_ERR_PERMISSION;
>> +                goto error;
>> +            }
>> +
>> +            tlbe->translated_addr = gpa + (iova & mask);
>> +            tlbe->perm = PTE_AP_TO_PERM(ap);
>> +            trace_smmu_ptw_page_pte(stage, level, iova,
>> +                                    baseaddr, pte_addr, pte, gpa);
>> +            return 0;
>> +        }
>> +        if (is_block_pte(pte, level)) {
>> +            uint64_t block_size;
>> +            hwaddr gpa = get_block_pte_address(pte, level, granule_sz,
>> +                                               &block_size);
>> +
>> +            ap = PTE_AP(pte);
>> +            if (is_permission_fault(ap, perm)) {
>> +                info->type = SMMU_PTW_ERR_PERMISSION;
>> +                goto error;
>> +            }
>> +
>> +            trace_smmu_ptw_block_pte(stage, level, baseaddr,
>> +                                     pte_addr, pte, iova, gpa,
>> +                                    (int)(block_size >> 20));
> 
> I don't think you should need this cast, because the argument to the
> trace function is an int anyway ?
indeed
> 
>> +
>> +            tlbe->translated_addr = gpa + (iova & mask);
>> +            tlbe->perm = PTE_AP_TO_PERM(ap);
>> +            return 0;
>> +        }
>> +
>> +        /* table pte */
>> +        ap = PTE_APTABLE(pte);
>> +
>> +        if (is_permission_fault(ap, perm)) {
>> +            info->type = SMMU_PTW_ERR_PERMISSION;
>> +            goto error;
>> +        }
>> +        baseaddr = get_table_pte_address(pte, granule_sz);
>> +        level++;
>> +    }
>> +
>> +    info->type = SMMU_PTW_ERR_TRANSLATION;
>> +
>> +error:
>> +    tlbe->perm = IOMMU_NONE;
>> +    return -EINVAL;
>> +}
>> +
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
>> +int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
>> +             IOMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
>> +{
>> +    if (!cfg->aa64) {
>> +        error_setg(&error_fatal,
>> +                   "SMMUv3 model does not support VMSAv8-32 page walk yet");
> 
> This sort of guest-provokable error should not be fatal -- log
> it with LOG_UNIMP and carry on as best you can (in this case
> the spec should say what happens for SMMUv3 implementations which
> don't support AArch32 tables).
This code should never been entered as the check is done when decoding
the CD in the smmuv3. However since it is a base class I wanted to
enphase the ptw was only supporting AArch32.

> 
>> +    }
>> +
>> +    return smmu_ptw_64(cfg, iova, perm, tlbe, info);
>> +}
>>
>>  SMMUPciBus *smmu_find_as_from_bus_num(SMMUState *s, uint8_t bus_num)
>>  {
>> diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
>> new file mode 100644
>> index 0000000..3ed97ee
>> --- /dev/null
>> +++ b/hw/arm/smmu-internal.h
>> @@ -0,0 +1,96 @@
>> +/*
>> + * ARM SMMU support - Internal API
>> + *
>> + * Copyright (c) 2017 Red Hat, Inc.
>> + * Copyright (C) 2014-2016 Broadcom Corporation
>> + * Written by Prem Mallappa, Eric Auger
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License along
>> + * with this program; if not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#ifndef HW_ARM_SMMU_INTERNAL_H
>> +#define HW_ARM_SMMU_INTERNAL_H
>> +
>> +#define ARM_LPAE_MAX_ADDR_BITS          48
> 
> You define this, but nothing in the series uses it.
removed. Actually we don't seem to need that anymore.
> 
> Also, from an SMMU perspective, it would be helpful to clarify
> exactly what addresses are involved here (input addresses,
> intermediate addresses, output addresses?) -- cf the spec section 3.4.
> 
>> +#define ARM_LPAE_MAX_LEVELS             4
> 
> This doesn't seem to be used either.
removed
> 
>> +
>> +/* PTE Manipulation */
>> +
>> +#define ARM_LPAE_PTE_TYPE_SHIFT         0
>> +#define ARM_LPAE_PTE_TYPE_MASK          0x3
>> +
>> +#define ARM_LPAE_PTE_TYPE_BLOCK         1
>> +#define ARM_LPAE_PTE_TYPE_TABLE         3
>> +
>> +#define ARM_LPAE_L3_PTE_TYPE_RESERVED   1
>> +#define ARM_LPAE_L3_PTE_TYPE_PAGE       3
>> +
>> +#define ARM_LPAE_PTE_VALID              (1 << 0)
>> +
>> +#define PTE_ADDRESS(pte, shift) \
>> +    (extract64(pte, shift, 47 - shift + 1) << shift)
>> +
>> +#define is_invalid_pte(pte) (!(pte & ARM_LPAE_PTE_VALID))
>> +
>> +#define is_reserved_pte(pte, level)                                      \
>> +    ((level == 3) &&                                                     \
>> +     ((pte & ARM_LPAE_PTE_TYPE_MASK) == ARM_LPAE_L3_PTE_TYPE_RESERVED))
>> +
>> +#define is_block_pte(pte, level)                                         \
>> +    ((level < 3) &&                                                      \
>> +     ((pte & ARM_LPAE_PTE_TYPE_MASK) == ARM_LPAE_PTE_TYPE_BLOCK))
>> +
>> +#define is_table_pte(pte, level)                                        \
>> +    ((level < 3) &&                                                     \
>> +     ((pte & ARM_LPAE_PTE_TYPE_MASK) == ARM_LPAE_PTE_TYPE_TABLE))
>> +
>> +#define is_page_pte(pte, level)                                         \
>> +    ((level == 3) &&                                                    \
>> +     ((pte & ARM_LPAE_PTE_TYPE_MASK) == ARM_LPAE_L3_PTE_TYPE_PAGE))
>> +
>> +#define PTE_AP(pte) \
>> +    (extract64(pte, 6, 2))
>> +
>> +#define PTE_APTABLE(pte) \
>> +    (extract64(pte, 61, 2))
>> +
>> +#define is_permission_fault(ap, perm) \
>> +    (((perm) & IOMMU_WO) && ((ap) & 0x2))
> 
> Don't we also need to check AP bit 1 in some cases?
> (when the StreamWorld is S or NS EL1 and either (a) the incoming
> transaction has its attrs.user = 1 and STE.PRIVCFG is 0b0x, or
> (b) STE.PRIVCFG is 0b10).
I think I don't need to as I don't support this feature at the moment:
spec says:
"When SMMU_IDR1.ATTR_PERMS_OVR=0, this field is RES0 and the incoming
PRIV attribute is used."
But to be honest I was not aware this existed ;()
> 
>> +
>> +#define PTE_AP_TO_PERM(ap) \
>> +    (IOMMU_ACCESS_FLAG(true, !((ap) & 0x2)))
> 
> Similarly here.
?
> 
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
>> +    return ~((1ULL << level_shift(level, granule_sz)) - 1);
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
>> +            ((1ULL << (granule_sz - 3)) - 1);
> 
> Maybe "... & MAKE_64BIT_MASK(0, granule_sz - 3)" ?
OK
> 
>> +}
>> +
>> +#endif
>> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
>> index 193063e..3584974 100644
>> --- a/hw/arm/trace-events
>> +++ b/hw/arm/trace-events
>> @@ -2,3 +2,13 @@
>>
>>  # hw/arm/virt-acpi-build.c
>>  virt_acpi_setup(void) "No fw cfg or ACPI disabled. Bailing out."
>> +
>> +# hw/arm/smmu-common.c
>> +
>> +smmu_page_walk(int stage, uint64_t baseaddr, int first_level, uint64_t start, uint64_t end) "stage=%d, baseaddr=0x%"PRIx64", first level=%d, start=0x%"PRIx64", end=0x%"PRIx64
>> +smmu_lookup_table(int level, uint64_t baseaddr, int granule_sz, uint64_t start, uint64_t end, int flags, uint64_t subpage_size) "level=%d baseaddr=0x%"PRIx64" granule=%d, start=0x%"PRIx64" end=0x%"PRIx64" flags=%d subpage_size=0x%lx"
>> +smmu_ptw_level(int level, uint64_t iova, size_t subpage_size, uint64_t baseaddr, uint32_t offset, uint64_t pte) "level=%d iova=0x%lx subpage_sz=0x%lx baseaddr=0x%"PRIx64" offset=%d => pte=0x%lx"
>> +smmu_ptw_invalid_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr, uint32_t offset, uint64_t pte) "stage=%d level=%d base@=0x%"PRIx64" pte@=0x%"PRIx64" offset=%d pte=0x%"PRIx64
>> +smmu_ptw_page_pte(int stage, int level,  uint64_t iova, uint64_t baseaddr, uint64_t pteaddr, uint64_t pte, uint64_t address) "stage=%d level=%d iova=0x%"PRIx64" base@=0x%"PRIx64" pte@=0x%"PRIx64" pte=0x%"PRIx64" page address = 0x%"PRIx64
>> +smmu_ptw_block_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr, uint64_t pte, uint64_t iova, uint64_t gpa, int bsize_mb) "stage=%d level=%d base@=0x%"PRIx64" pte@=0x%"PRIx64" pte=0x%"PRIx64" iova=0x%"PRIx64" block address = 0x%"PRIx64" block size = %d MiB"
>> +smmu_get_pte(uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pte) "baseaddr=0x%"PRIx64" index=0x%x, pteaddr=0x%"PRIx64", pte=0x%"PRIx64
> 
> These have some uses of "%lx" for uint64_t, which should use PRIx64
> to avoid compile issues on 32 bit systems.
OK

Thanks

Eric
> 
>> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
>> index aee96c2..0fb27f7 100644
>> --- a/include/hw/arm/smmu-common.h
>> +++ b/include/hw/arm/smmu-common.h
>> @@ -127,4 +127,10 @@ static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
>>  {
>>      return  ((pci_bus_num(sdev->bus) & 0xff) << 8) | sdev->devfn;
>>  }
>> +
>> +int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
>> +             IOMMUTLBEntry *tlbe, SMMUPTWEventInfo *info);
>> +
>> +SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova);
>> +
>>  #endif  /* HW_ARM_SMMU_COMMON */
>> --
>> 2.5.5
> 
> thanks
> -- PMM
> 

Received: by 10.25.44.15 with SMTP id s15csp2429730lfs;
        Thu, 27 Jul 2017 13:29:18 -0700 (PDT)
X-Received: by 10.55.20.144 with SMTP id 16mr7003991qku.51.1501187357876;
        Thu, 27 Jul 2017 13:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501187357; cv=none;
        d=google.com; s=arc-20160816;
        b=HXe0hUpRnp8O4dzBv6cmLrmufz34F7BiY0y55LC83Mya2aVFf4CSO+vXClWmaZ89BF
         gm4+iJmKTHDck6cH5c0RM+lpefNb+V89Q2tGTgnfcJKTJkKA+MB72mWamNwdHMy7T5O5
         rq1TSNoxteWhWRB4/irqW1POuN5wxJ3euMj2YM2zrQ5RyVus2eTqPD55ANk59G5V+HA7
         CqmIbTHimR3EZszTGf5+N5mImjEcsmc5lx9riuVrIcJ5x0xrF+faNfgwFWFditNAuEj0
         PobtPiXyhHXQw6IXkQRh89ZkCTBPFWSBbNwaSvzQ+3hLrA8NtLvUprev707uiLInOqyW
         JdSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=mZ8w+VYbM51uZukbNFZer/vlsYhLTO4RxObwBSVshYE=;
        b=w0BB1BWTEFIac/YrSEXsnqnw5F7UfIIumlMgT/CgHPW03QX49Ne6MroVwyrzx2NP5l
         3MTBJ8duPmUK7kRgNY4+yN1nOlRFj1RRa1g5MS4aYNK8HR4GWowKWm/F8pKyu75JA0t6
         Rf0rs05SM+NpwfHk1fvlHq7y3J+xzvBREniNddkbWzpSgGW1hK2G0NdQQFJLp0vDqy5j
         2xAQe/+UdVtwGZZoJtfG7nZPM5BhiWsp6wSGnIdbQVXAVkEuX2CuamPi8hHLhIb3Ew6P
         u+cEagzzWkpkzakbXbMsTNJPjoSXaAuZm1hOmrzd1cfqIXU2OeLzW9yfrVoVeLHSIvuX
         DPPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p18si5186867qta.333.2017.07.27.13.29.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Jul 2017 13:29:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44663 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dapPH-0004WF-4R
	for alex.bennee@linaro.org; Thu, 27 Jul 2017 16:29:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dapP7-0004W8-Gf
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 16:29:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dapP2-0006ha-O0
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 16:29:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40222)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dapP2-0006fb-Et; Thu, 27 Jul 2017 16:29:00 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E1142CD7F4;
	Thu, 27 Jul 2017 20:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4E1142CD7F4
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-117-118.ams2.redhat.com
	[10.36.117.118])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FAF75D9C9;
	Thu, 27 Jul 2017 20:28:47 +0000 (UTC)
To: Tomasz Nowicki <tn@semihalf.com>, eric.auger.pro@gmail.com,
	peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alex.williamson@redhat.com, prem.mallappa@gmail.com
References: <1499633493-19865-1-git-send-email-eric.auger@redhat.com>
	<1499633493-19865-2-git-send-email-eric.auger@redhat.com>
	<66fca1dd-b731-c97f-b21b-af4ea75dcb47@semihalf.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <b14389ac-c2c4-2185-8205-50a045e4e3ea@redhat.com>
Date: Thu, 27 Jul 2017 22:28:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <66fca1dd-b731-c97f-b21b-af4ea75dcb47@semihalf.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 27 Jul 2017 20:28:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC v5 1/8] hw/arm/smmu-common: smmu base class
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
Cc: mohun106@gmail.com, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mst@redhat.com, jean-philippe.brucker@arm.com,
	robin.murphy@arm.com, will.deacon@arm.com, peterx@redhat.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2tJH7nkZr/wI

Hi Tomasz,

On 25/07/2017 14:12, Tomasz Nowicki wrote:
> Hi Eric,
> 
> I found out what is going on regarding vhost-net outgoing packet's
> payload corruption. My packets were corrupted because of inconsistent
> IOVA to HVA translation in IOTLB. Please see below.
> 
> On 09.07.2017 22:51, Eric Auger wrote:
>> Introduces the base device and class for the ARM smmu.
>> Implements VMSAv8-64 table lookup and translation. VMSAv8-32
>> is not implemented.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
>>
>> ---
> 
> [...]
> 
>> +
>> +/**
>> + * smmu_page_walk_level_64 - Walk an IOVA range from a specific level
>> + * @baseaddr: table base address corresponding to @level
>> + * @level: level
>> + * @cfg: translation config
>> + * @start: end of the IOVA range
>> + * @end: end of the IOVA range
>> + * @hook_fn: the hook that to be called for each detected area
>> + * @private: private data for the hook function
>> + * @read: whether parent level has read permission
>> + * @write: whether parent level has write permission
>> + * @nofail: indicates whether each iova of the range
>> + *  must be translated or whether failure is allowed
>> + * @notify_unmap: whether we should notify invalid entries
>> + *
>> + * Return 0 on success, < 0 on errors not related to translation
>> + * process, > 1 on errors related to translation process (only
>> + * if nofail is set)
>> + */
>> +static int
>> +smmu_page_walk_level_64(dma_addr_t baseaddr, int level,
>> +                        SMMUTransCfg *cfg, uint64_t start, uint64_t end,
>> +                        smmu_page_walk_hook hook_fn, void *private,
>> +                        bool read, bool write, bool nofail,
>> +                        bool notify_unmap)
>> +{
>> +    uint64_t subpage_size, subpage_mask, pte, iova = start;
>> +    bool read_cur, write_cur, entry_valid;
>> +    int ret, granule_sz, stage;
>> +    IOMMUTLBEntry entry;
>> +
>> +    granule_sz = cfg->granule_sz;
>> +    stage = cfg->stage;
>> +    subpage_size = 1ULL << level_shift(level, granule_sz);
>> +    subpage_mask = level_page_mask(level, granule_sz);
>> +
>> +    trace_smmu_page_walk_level_in(level, baseaddr, granule_sz,
>> +                                  start, end, subpage_size);
>> +
>> +    while (iova < end) {
>> +        dma_addr_t next_table_baseaddr;
>> +        uint64_t iova_next, pte_addr;
>> +        uint32_t offset;
>> +
>> +        iova_next = (iova & subpage_mask) + subpage_size;
>> +        offset = iova_level_offset(iova, level, granule_sz);
>> +        pte_addr = baseaddr + offset * sizeof(pte);
>> +        pte = get_pte(baseaddr, offset);
>> +
>> +        trace_smmu_page_walk_level(level, iova, subpage_size,
>> +                                   baseaddr, offset, pte);
>> +
>> +        if (pte == (uint64_t)-1) {
>> +            if (nofail) {
>> +                return SMMU_TRANS_ERR_WALK_EXT_ABRT;
>> +            }
>> +            goto next;
>> +        }
>> +        if (is_invalid_pte(pte) || is_reserved_pte(pte, level)) {
>> +            trace_smmu_page_walk_level_res_invalid_pte(stage, level,
>> baseaddr,
>> +                                                       pte_addr,
>> offset, pte);
>> +            if (nofail) {
>> +                return SMMU_TRANS_ERR_WALK_EXT_ABRT;
>> +            }
>> +            goto next;
>> +        }
> 
> 
> vhost maintains its IOTLB cache and when there is no IOVA->HVA
> translation, it asks QEMU for help. However, IOTLB entries invalidations
> are guest initiative so for any DMA unmap at guest side we trap to SMMU
> emulation code and call:
> smmu_notify_all -> smmuv3_replay_single -> smmu_page_walk_64 ->
> smmu_page_walk_level_64 -> smmuv3_replay_hook -> vhost_iommu_unmap_notify
> 
> The thing is that smmuv3_replay_hook() is never called because guest
> zeros PTE before we trap to QEMU so that smmu_page_walk_level_64() fails
> on ^^^ is_invalid_pte(pte) check. This way we keep old IOTLB entry in
> vhost and subsequent translations may be broken.

Thank you for the time you spent on this. I will work on this vhost use
case asap and will let you know.

Thanks

Eric
> 
>> +
>> +        read_cur = read; /* TODO */
>> +        write_cur = write; /* TODO */
>> +        entry_valid = read_cur | write_cur; /* TODO */
>> +
>> +        if (is_page_pte(pte, level)) {
>> +            uint64_t gpa = get_page_pte_address(pte, granule_sz);
>> +            int perm = IOMMU_ACCESS_FLAG(read_cur, write_cur);
>> +
>> +            trace_smmu_page_walk_level_page_pte(stage, level,
>> entry.iova,
>> +                                                baseaddr, pte_addr,
>> pte, gpa);
>> +            if (!entry_valid && !notify_unmap) {
>> +                printf("%s entry_valid=%d notify_unmap=%d\n", __func__,
>> +                       entry_valid, notify_unmap);
>> +                goto next;
>> +            }
>> +            ret = call_entry_hook(iova, subpage_mask, gpa, perm,
>> +                                  hook_fn, private);
>> +            if (ret) {
>> +                return ret;
>> +            }
>> +            goto next;
>> +        }
>> +        if (is_block_pte(pte, level)) {
>> +            uint64_t block_size;
>> +            hwaddr gpa = get_block_pte_address(pte, level, granule_sz,
>> +                                               &block_size);
>> +            int perm = IOMMU_ACCESS_FLAG(read_cur, write_cur);
>> +
>> +            if (gpa == -1) {
>> +                if (nofail) {
>> +                    return SMMU_TRANS_ERR_WALK_EXT_ABRT;
>> +                } else {
>> +                    goto next;
>> +                }
>> +            }
>> +            trace_smmu_page_walk_level_block_pte(stage, level, baseaddr,
>> +                                                 pte_addr, pte, iova,
>> gpa,
>> +                                                 (int)(block_size >>
>> 20));
>> +
>> +            ret = call_entry_hook(iova, subpage_mask, gpa, perm,
>> +                                  hook_fn, private);
>> +            if (ret) {
>> +                return ret;
>> +            }
>> +            goto next;
>> +        }
>> +        if (level  == 3) {
>> +            goto next;
>> +        }
>> +        /* table pte */
>> +        next_table_baseaddr = get_table_pte_address(pte, granule_sz);
>> +        trace_smmu_page_walk_level_table_pte(stage, level, baseaddr,
>> pte_addr,
>> +                                             pte, next_table_baseaddr);
>> +        ret = smmu_page_walk_level_64(next_table_baseaddr, level + 1,
>> cfg,
>> +                                      iova, MIN(iova_next, end),
>> +                                      hook_fn, private, read_cur,
>> write_cur,
>> +                                      nofail, notify_unmap);
>> +        if (!ret) {
>> +            return ret;
>> +        }
>> +
>> +next:
>> +        iova = iova_next;
>> +    }
>> +
>> +    return SMMU_TRANS_ERR_NONE;
>> +}
> 
> Thanks,
> Tomasz

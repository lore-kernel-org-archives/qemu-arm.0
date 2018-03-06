Received: by 10.28.91.67 with SMTP id p64csp4113140wmb;
        Tue, 6 Mar 2018 11:44:37 -0800 (PST)
X-Google-Smtp-Source: AG47ELsKkWfgk5VhwLp1arM2FV4+pcnhdyXuWWqU4uy6A6lM+9bzoNzc3qCcGK6Yj2bVRG/Ln1m6
X-Received: by 10.129.116.195 with SMTP id p186mr12708456ywc.123.1520365477549;
        Tue, 06 Mar 2018 11:44:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520365477; cv=none;
        d=google.com; s=arc-20160816;
        b=PYKruwTjpp7rxV2gF+pmhUKhBd5eLcl0BKY4TLPwLDjt6QXo3gva5BAfaSh67r+QCZ
         O+8L3U2QBXMEihaG7NEmaVoshgj9LMLS9p791zk328ujXwaYTmUmGAZOFHjgpUhcWU+o
         Xs4lHdjCyaYwTQGa4HE5BqRu0IVK4hVrzshn9jgy5GNLbZDiQCWv0pp5Ygc9YMqTu97X
         6TixDUEJVRFLbo1tHpGQm4X3Ca5/BJijprntTXWceUbCZOayzmEoDTK3p+LhOSRJJIex
         gTO6SfzJlJ8vtoJRngU4N2GgXHJMUb8Y40apHi6+Fs9TzPmNZ6wGeuRG9BTw6zTCV69L
         ZO8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=a74C9hMJdpbl0U+lYKUoNA0FjPl1WR9fKENYHyBSNrU=;
        b=TsH+FMWJ2upBuryJcnQZyyK+BodE4R6SNcYAJ1j8JlSWye0J07nyckAH6KIOREVtHA
         deV+iubU4C+gmDwZthoDRHN8WUn4Fa7R7xRsUmOBUimg2peNllqn2urLIbqErHUktwHy
         dGtF/kc1UubTc9JoX0quoCRg//isZAvtBAfBNl2TtAlldg7mmFqvEoV5QnSlnotTjEw5
         AZJyYc5xmoeSPG08mlU6MK9IuMNHGOLeCEvRYOs6Uh1G1+nKvdyAPLj2RtjFejx8x7bR
         HNApUpOLMQrPvVJ3upFla5TH37+o04HDJ1nNE76Q4e2BwOdEQhJQB+Fu9BQ8tOHj3VBs
         yAuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bmbCm90k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v185-v6si2673730ybv.367.2018.03.06.11.44.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Mar 2018 11:44:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bmbCm90k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57785 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1etIVo-0005Ii-UT
	for alex.bennee@linaro.org; Tue, 06 Mar 2018 14:44:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59086)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1etIVc-0005Hb-HD
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 14:44:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1etIVZ-0001A0-RK
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 14:44:24 -0500
Received: from mail-ot0-x233.google.com ([2607:f8b0:4003:c0f::233]:33525)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1etIVZ-00019i-J8
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 14:44:21 -0500
Received: by mail-ot0-x233.google.com with SMTP id y11so19512373otg.0
	for <qemu-arm@nongnu.org>; Tue, 06 Mar 2018 11:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=a74C9hMJdpbl0U+lYKUoNA0FjPl1WR9fKENYHyBSNrU=;
	b=bmbCm90k/zzl/NQQSQZyGNljN7TY+GxbmnBuULv4ju8dDXa9/8+ke5sl2S+pG4kDNp
	bh1WU9FkgU++IfIOW4mYl/eUm36tjLQhtosOKsxdTB0+1qbDbGwGVku2FCQe+uw2hqhs
	fKmu96Qq30qLwd70VlZppHhwsfAn4u/SpSwE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=a74C9hMJdpbl0U+lYKUoNA0FjPl1WR9fKENYHyBSNrU=;
	b=Ss6bZEdSJ6TXSbq9RpoNpOF8h05UxkVQh9OhJCPWJG+NtV9HvJLnsaghktE6OAfecW
	FnvGL1aVZiUVpwCuwIFgNfv491W4FIBAzvBNVju/e9ggFWdzXMcw+PDcuOhaY67aRXin
	VYk5Q4BpclGRKho+2ybJp8ooufbhWVbYFo+rTZnCPPlr2kgLhXPwtJIKY93kXAVewZPb
	jhb+C1VDaX2N1MTPz+IbhHalP2c1AEJxrdcRwfaCWQ9qvdaSWWWslN+H2GpGsP/qudCY
	CDkcG1ntKDgSrpFwWYw9CNkyOiddtytXp7Ur7u5asytSbxwHiuBiGdQpEsyHHhpve5sm
	QU1A==
X-Gm-Message-State: APf1xPAzSf85EEL253mX3Y36p9W3Uj90GyWmoF4+M86GnDqie3DM/yYf
	o7ltcDbV6e/dWDXVDDcFOgZurDP7nWj99n4kt7IEpA==
X-Received: by 10.157.72.231 with SMTP id a36mr14329784otj.308.1520365460290; 
	Tue, 06 Mar 2018 11:44:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 6 Mar 2018 11:43:59 -0800 (PST)
In-Reply-To: <1518893216-9983-4-git-send-email-eric.auger@redhat.com>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-4-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Mar 2018 19:43:59 +0000
Message-ID: <CAFEAcA_scj3Nw+W6a7NL6bRR3ZGvUx1NLa4cWSmvfOA1BCEPgQ@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::233
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
X-TUID: le90LqoZ0K+8

On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
> This patch implements the page table walk for VMSAv8-64.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
> v8 -> v9:
> - remove guest error log on PTE fetch fault
> - rename  trace functions
> - fix smmu_page_walk_level_res_invalid_pte last arg
> - fix PTE_ADDRESS
> - turn functions into macros
> - make sure to return the actual pte access permission
>   into tlbe->perm
> - change proto of smmu_ptw*
>
> v7 -> v8:
> - rework get_pte
> - use LOG_LEVEL_ERROR
> - remove error checking in get_block_pte_address
> - page table walk simplified (no VFIO replay anymore)
> - handle PTW error events
> - use dma_memory_read
>
> v6 -> v7:
> - fix wrong error handling in walk_page_table
> - check perm in smmu_translate
>
> v5 -> v6:
> - use IOMMUMemoryRegion
> - remove initial_lookup_level()
> - fix block replay
>
> v4 -> v5:
> - add initial level in translation config
> - implement block pte
> - rename must_translate into nofail
> - introduce call_entry_hook
> - small changes to dynamic traces
> - smmu_page_walk code moved from smmuv3.c to this file
> - remove smmu_translate*
>
> v3 -> v4:
> - reworked page table walk to prepare for VFIO integration
>   (capability to scan a range of IOVA). Same function is used
>   for translate for a single iova. This is largely inspired
>   from intel_iommu.c
> - as the translate function was not straightforward to me,
>   I tried to stick more closely to the VMSA spec.
> - remove support of nested stage (kernel driver does not
>   support it anyway)
> - use error_report and trace events
> - add aa64[] field in SMMUTransCfg
> ---
>  hw/arm/smmu-common.c         | 232 +++++++++++++++++++++++++++++++++++++=
++++++
>  hw/arm/smmu-internal.h       |  96 ++++++++++++++++++
>  hw/arm/trace-events          |  10 ++
>  include/hw/arm/smmu-common.h |   6 ++
>  4 files changed, 344 insertions(+)
>  create mode 100644 hw/arm/smmu-internal.h
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index d0516dc..24cc4ba 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -27,6 +27,238 @@
>
>  #include "qemu/error-report.h"
>  #include "hw/arm/smmu-common.h"
> +#include "smmu-internal.h"
> +
> +/* VMSAv8-64 Translation */
> +
> +/**
> + * get_pte - Get the content of a page table entry located t
> + * @base_addr[@index]
> + */
> +static int get_pte(dma_addr_t baseaddr, uint32_t index, uint64_t *pte,
> +                   SMMUPTWEventInfo *info)
> +{
> +    int ret;
> +    dma_addr_t addr =3D baseaddr + index * sizeof(*pte);
> +
> +    ret =3D dma_memory_read(&address_space_memory, addr,
> +                          (uint8_t *)pte, sizeof(*pte));

I think last time round I asked that these be done with the
"read a 64-bit quantity" APIs and a comment that they're
supposed to be atomic.

> +
> +    if (ret !=3D MEMTX_OK) {
> +        info->type =3D SMMU_PTW_ERR_WALK_EABT;
> +        info->addr =3D addr;
> +        return -EINVAL;
> +    }
> +    trace_smmu_get_pte(baseaddr, index, addr, *pte);
> +    return 0;
> +}
> +
> +/* VMSAv8-64 Translation Table Format Descriptor Decoding */
> +
> +/**
> + * get_page_pte_address - returns the L3 descriptor output address,
> + * ie. the page frame
> + * ARM ARM spec: Figure D4-17 VMSAv8-64 level 3 descriptor format
> + */
> +static inline hwaddr get_page_pte_address(uint64_t pte, int granule_sz)
> +{
> +    return PTE_ADDRESS(pte, granule_sz);
> +}
> +
> +/**
> + * get_table_pte_address - return table descriptor output address,
> + * ie. address of next level table
> + * ARM ARM Figure D4-16 VMSAv8-64 level0, level1, and level 2 descriptor=
 formats
> + */
> +static inline hwaddr get_table_pte_address(uint64_t pte, int granule_sz)
> +{
> +    return PTE_ADDRESS(pte, granule_sz);
> +}
> +
> +/**
> + * get_block_pte_address - return block descriptor output address and bl=
ock size
> + * ARM ARM Figure D4-16 VMSAv8-64 level0, level1, and level 2 descriptor=
 formats
> + */
> +static hwaddr get_block_pte_address(uint64_t pte, int level, int granule=
_sz,
> +                                    uint64_t *bsz)
> +{
> +    int n =3D 0;
> +
> +    switch (granule_sz) {
> +    case 12:
> +        if (level =3D=3D 1) {
> +            n =3D 30;
> +        } else if (level =3D=3D 2) {
> +            n =3D 21;
> +        }
> +        break;
> +    case 14:
> +        if (level =3D=3D 2) {
> +            n =3D 25;
> +        }
> +        break;
> +    case 16:
> +        if (level =3D=3D 2) {
> +            n =3D 29;
> +        }
> +        break;
> +    }
> +    if (!n) {
> +        error_setg(&error_fatal,
> +                   "wrong granule/level combination (%d/%d)",
> +                   granule_sz, level);

If this is guest-provokable then it shouldn't be a fatal error.
If it isn't guest provokable then you can just assert.
I think you should be able to sanitize the SMUTransTableInfo when
you construct it from the CD (and give a C_BAD_CD event), and then
you can trust the granule_sz and level when you're doing table walks.

You can calculate n as
    n =3D (granule_sz - 3) * (4 - level) + 3;
(compare target/arm/helper.c:get_phys_addr_lpae() calculation
of page_size, and in the pseudocode the line
    addrselectbottom =3D (3-level)*stride + grainsize;
where stride is grainsize-3 and so comes out to the same thing.)

> +    }
> +    *bsz =3D 1 << n;
> +    return PTE_ADDRESS(pte, n);
> +}
> +
> +static inline bool check_perm(int access_attrs, int mem_attrs)
> +{
> +    if (((access_attrs & IOMMU_RO) && !(mem_attrs & IOMMU_RO)) ||
> +        ((access_attrs & IOMMU_WO) && !(mem_attrs & IOMMU_WO))) {
> +        return false;
> +    }
> +    return true;
> +}

This function doesn't seem to ever be used in this patchset?
(clang will complain about that, though gcc won't.)

> +
> +SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
> +{
> +    if (!extract64(iova, 64 - cfg->tt[0].tsz, cfg->tt[0].tsz - cfg->tbi)=
) {
> +        return &cfg->tt[0];
> +    }
> +    return &cfg->tt[1];

I'm confused by your handling of the TBI bits here. In
decode_cd() you take the 2-bit TBI field into cfg->tbi. That's
a pair of bits, one of which is "top byte ignore" for TTB0 and the
other is "top byte ignore" for TTB1. But here you're subtracting
the whole field from cfg->tt[0].tsz. Which of the two tbi bits
you need to use depends on bit 55 of the iova (compare the code
in get_phys_addr_lpae() and the pseudocode function AddrTop()),
and then if that bit is 1 it means that 8 bits of address should
be ignored when determining whether to use TTB0 or TTB1.

You also need to consider the case where the input address is in
neither the TTB0 range nor the TTb1 range (cf fig D4-14 in the
v8A Arm ARM DDI0487C.a, and the code in get_phys_addr_lpae()).

> +}
> +
> +/**
> + * smmu_ptw_64 - VMSAv8-64 Walk of the page tables for a given IOVA
> + * @cfg: translation config
> + * @iova: iova to translate
> + * @perm: access type
> + * @tlbe: IOMMUTLBEntry (out)
> + * @info: handle to an error info
> + *
> + * Return 0 on success, < 0 on error. In case of error, @info is filled
> + * and tlbe->perm is set to IOMMU_NONE.
> + * Upon success, @tlbe is filled with translated_addr and entry
> + * permission rights.
> + */
> +static int smmu_ptw_64(SMMUTransCfg *cfg,
> +                       dma_addr_t iova, IOMMUAccessFlags perm,
> +                       IOMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
> +{
> +    dma_addr_t baseaddr;
> +    int stage =3D cfg->stage;
> +    SMMUTransTableInfo *tt =3D select_tt(cfg, iova);
> +    uint8_t level;
> +    uint8_t granule_sz;
> +
> +    if (tt->disabled) {
> +        info->type =3D SMMU_PTW_ERR_TRANSLATION;
> +        goto error;
> +    }
> +
> +    level =3D tt->initial_level;
> +    granule_sz =3D tt->granule_sz;
> +    baseaddr =3D extract64(tt->ttb, 0, 48);

The spec says that bits specified by the TTB0/TTB1 fields
in a CD that are outside the effective IPS range are ILLEGAL;
you should detect that when you set up tt->ttb and then you
don't need the extract64() here, I think.

> +
> +    tlbe->iova =3D iova;
> +    tlbe->addr_mask =3D (1 << tt->granule_sz) - 1;

you could just use "granule_sz" here since you have it in a local.

> +
> +    while (level <=3D 3) {
> +        uint64_t subpage_size =3D 1ULL << level_shift(level, granule_sz)=
;
> +        uint64_t mask =3D subpage_size - 1;
> +        uint32_t offset =3D iova_level_offset(iova, level, granule_sz);
> +        uint64_t pte;
> +        dma_addr_t pte_addr =3D baseaddr + offset * sizeof(pte);
> +        uint8_t ap;
> +
> +        if (get_pte(baseaddr, offset, &pte, info)) {
> +                goto error;
> +        }
> +        trace_smmu_ptw_level(level, iova, subpage_size,
> +                             baseaddr, offset, pte);
> +
> +        if (is_invalid_pte(pte) || is_reserved_pte(pte, level)) {
> +            trace_smmu_ptw_invalid_pte(stage, level, baseaddr,
> +                                       pte_addr, offset, pte);
> +            info->type =3D SMMU_PTW_ERR_TRANSLATION;
> +            goto error;
> +        }
> +
> +        if (is_page_pte(pte, level)) {
> +            uint64_t gpa =3D get_page_pte_address(pte, granule_sz);
> +
> +            ap =3D PTE_AP(pte);
> +            if (is_permission_fault(ap, perm)) {
> +                info->type =3D SMMU_PTW_ERR_PERMISSION;
> +                goto error;
> +            }
> +
> +            tlbe->translated_addr =3D gpa + (iova & mask);
> +            tlbe->perm =3D PTE_AP_TO_PERM(ap);
> +            trace_smmu_ptw_page_pte(stage, level, iova,
> +                                    baseaddr, pte_addr, pte, gpa);
> +            return 0;
> +        }
> +        if (is_block_pte(pte, level)) {
> +            uint64_t block_size;
> +            hwaddr gpa =3D get_block_pte_address(pte, level, granule_sz,
> +                                               &block_size);
> +
> +            ap =3D PTE_AP(pte);
> +            if (is_permission_fault(ap, perm)) {
> +                info->type =3D SMMU_PTW_ERR_PERMISSION;
> +                goto error;
> +            }
> +
> +            trace_smmu_ptw_block_pte(stage, level, baseaddr,
> +                                     pte_addr, pte, iova, gpa,
> +                                    (int)(block_size >> 20));

I don't think you should need this cast, because the argument to the
trace function is an int anyway ?

> +
> +            tlbe->translated_addr =3D gpa + (iova & mask);
> +            tlbe->perm =3D PTE_AP_TO_PERM(ap);
> +            return 0;
> +        }
> +
> +        /* table pte */
> +        ap =3D PTE_APTABLE(pte);
> +
> +        if (is_permission_fault(ap, perm)) {
> +            info->type =3D SMMU_PTW_ERR_PERMISSION;
> +            goto error;
> +        }
> +        baseaddr =3D get_table_pte_address(pte, granule_sz);
> +        level++;
> +    }
> +
> +    info->type =3D SMMU_PTW_ERR_TRANSLATION;
> +
> +error:
> +    tlbe->perm =3D IOMMU_NONE;
> +    return -EINVAL;
> +}
> +
> +/**
> + * smmu_ptw - Walk the page tables for an IOVA, according to @cfg
> + *
> + * @cfg: translation configuration
> + * @iova: iova to translate
> + * @perm: tentative access type
> + * @tlbe: returned entry
> + * @info: ptw event handle
> + *
> + * return 0 on success
> + */
> +int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
> +             IOMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
> +{
> +    if (!cfg->aa64) {
> +        error_setg(&error_fatal,
> +                   "SMMUv3 model does not support VMSAv8-32 page walk ye=
t");

This sort of guest-provokable error should not be fatal -- log
it with LOG_UNIMP and carry on as best you can (in this case
the spec should say what happens for SMMUv3 implementations which
don't support AArch32 tables).

> +    }
> +
> +    return smmu_ptw_64(cfg, iova, perm, tlbe, info);
> +}
>
>  SMMUPciBus *smmu_find_as_from_bus_num(SMMUState *s, uint8_t bus_num)
>  {
> diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
> new file mode 100644
> index 0000000..3ed97ee
> --- /dev/null
> +++ b/hw/arm/smmu-internal.h
> @@ -0,0 +1,96 @@
> +/*
> + * ARM SMMU support - Internal API
> + *
> + * Copyright (c) 2017 Red Hat, Inc.
> + * Copyright (C) 2014-2016 Broadcom Corporation
> + * Written by Prem Mallappa, Eric Auger
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License alo=
ng
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef HW_ARM_SMMU_INTERNAL_H
> +#define HW_ARM_SMMU_INTERNAL_H
> +
> +#define ARM_LPAE_MAX_ADDR_BITS          48

You define this, but nothing in the series uses it.

Also, from an SMMU perspective, it would be helpful to clarify
exactly what addresses are involved here (input addresses,
intermediate addresses, output addresses?) -- cf the spec section 3.4.

> +#define ARM_LPAE_MAX_LEVELS             4

This doesn't seem to be used either.

> +
> +/* PTE Manipulation */
> +
> +#define ARM_LPAE_PTE_TYPE_SHIFT         0
> +#define ARM_LPAE_PTE_TYPE_MASK          0x3
> +
> +#define ARM_LPAE_PTE_TYPE_BLOCK         1
> +#define ARM_LPAE_PTE_TYPE_TABLE         3
> +
> +#define ARM_LPAE_L3_PTE_TYPE_RESERVED   1
> +#define ARM_LPAE_L3_PTE_TYPE_PAGE       3
> +
> +#define ARM_LPAE_PTE_VALID              (1 << 0)
> +
> +#define PTE_ADDRESS(pte, shift) \
> +    (extract64(pte, shift, 47 - shift + 1) << shift)
> +
> +#define is_invalid_pte(pte) (!(pte & ARM_LPAE_PTE_VALID))
> +
> +#define is_reserved_pte(pte, level)                                     =
 \
> +    ((level =3D=3D 3) &&                                                =
     \
> +     ((pte & ARM_LPAE_PTE_TYPE_MASK) =3D=3D ARM_LPAE_L3_PTE_TYPE_RESERVE=
D))
> +
> +#define is_block_pte(pte, level)                                        =
 \
> +    ((level < 3) &&                                                     =
 \
> +     ((pte & ARM_LPAE_PTE_TYPE_MASK) =3D=3D ARM_LPAE_PTE_TYPE_BLOCK))
> +
> +#define is_table_pte(pte, level)                                        =
\
> +    ((level < 3) &&                                                     =
\
> +     ((pte & ARM_LPAE_PTE_TYPE_MASK) =3D=3D ARM_LPAE_PTE_TYPE_TABLE))
> +
> +#define is_page_pte(pte, level)                                         =
\
> +    ((level =3D=3D 3) &&                                                =
    \
> +     ((pte & ARM_LPAE_PTE_TYPE_MASK) =3D=3D ARM_LPAE_L3_PTE_TYPE_PAGE))
> +
> +#define PTE_AP(pte) \
> +    (extract64(pte, 6, 2))
> +
> +#define PTE_APTABLE(pte) \
> +    (extract64(pte, 61, 2))
> +
> +#define is_permission_fault(ap, perm) \
> +    (((perm) & IOMMU_WO) && ((ap) & 0x2))

Don't we also need to check AP bit 1 in some cases?
(when the StreamWorld is S or NS EL1 and either (a) the incoming
transaction has its attrs.user =3D 1 and STE.PRIVCFG is 0b0x, or
(b) STE.PRIVCFG is 0b10).

> +
> +#define PTE_AP_TO_PERM(ap) \
> +    (IOMMU_ACCESS_FLAG(true, !((ap) & 0x2)))

Similarly here.

> +
> +/* Level Indexing */
> +
> +static inline int level_shift(int level, int granule_sz)
> +{
> +    return granule_sz + (3 - level) * (granule_sz - 3);
> +}
> +
> +static inline uint64_t level_page_mask(int level, int granule_sz)
> +{
> +    return ~((1ULL << level_shift(level, granule_sz)) - 1);
> +}
> +
> +/**
> + * TODO: handle the case where the level resolves less than
> + * granule_sz -3 IA bits.
> + */
> +static inline
> +uint64_t iova_level_offset(uint64_t iova, int level, int granule_sz)
> +{
> +    return (iova >> level_shift(level, granule_sz)) &
> +            ((1ULL << (granule_sz - 3)) - 1);

Maybe "... & MAKE_64BIT_MASK(0, granule_sz - 3)" ?

> +}
> +
> +#endif
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index 193063e..3584974 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -2,3 +2,13 @@
>
>  # hw/arm/virt-acpi-build.c
>  virt_acpi_setup(void) "No fw cfg or ACPI disabled. Bailing out."
> +
> +# hw/arm/smmu-common.c
> +
> +smmu_page_walk(int stage, uint64_t baseaddr, int first_level, uint64_t s=
tart, uint64_t end) "stage=3D%d, baseaddr=3D0x%"PRIx64", first level=3D%d, =
start=3D0x%"PRIx64", end=3D0x%"PRIx64
> +smmu_lookup_table(int level, uint64_t baseaddr, int granule_sz, uint64_t=
 start, uint64_t end, int flags, uint64_t subpage_size) "level=3D%d baseadd=
r=3D0x%"PRIx64" granule=3D%d, start=3D0x%"PRIx64" end=3D0x%"PRIx64" flags=
=3D%d subpage_size=3D0x%lx"
> +smmu_ptw_level(int level, uint64_t iova, size_t subpage_size, uint64_t b=
aseaddr, uint32_t offset, uint64_t pte) "level=3D%d iova=3D0x%lx subpage_sz=
=3D0x%lx baseaddr=3D0x%"PRIx64" offset=3D%d =3D> pte=3D0x%lx"
> +smmu_ptw_invalid_pte(int stage, int level, uint64_t baseaddr, uint64_t p=
teaddr, uint32_t offset, uint64_t pte) "stage=3D%d level=3D%d base@=3D0x%"P=
RIx64" pte@=3D0x%"PRIx64" offset=3D%d pte=3D0x%"PRIx64
> +smmu_ptw_page_pte(int stage, int level,  uint64_t iova, uint64_t baseadd=
r, uint64_t pteaddr, uint64_t pte, uint64_t address) "stage=3D%d level=3D%d=
 iova=3D0x%"PRIx64" base@=3D0x%"PRIx64" pte@=3D0x%"PRIx64" pte=3D0x%"PRIx64=
" page address =3D 0x%"PRIx64
> +smmu_ptw_block_pte(int stage, int level, uint64_t baseaddr, uint64_t pte=
addr, uint64_t pte, uint64_t iova, uint64_t gpa, int bsize_mb) "stage=3D%d =
level=3D%d base@=3D0x%"PRIx64" pte@=3D0x%"PRIx64" pte=3D0x%"PRIx64" iova=3D=
0x%"PRIx64" block address =3D 0x%"PRIx64" block size =3D %d MiB"
> +smmu_get_pte(uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pt=
e) "baseaddr=3D0x%"PRIx64" index=3D0x%x, pteaddr=3D0x%"PRIx64", pte=3D0x%"P=
RIx64

These have some uses of "%lx" for uint64_t, which should use PRIx64
to avoid compile issues on 32 bit systems.

> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index aee96c2..0fb27f7 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -127,4 +127,10 @@ static inline uint16_t smmu_get_sid(SMMUDevice *sdev=
)
>  {
>      return  ((pci_bus_num(sdev->bus) & 0xff) << 8) | sdev->devfn;
>  }
> +
> +int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
> +             IOMMUTLBEntry *tlbe, SMMUPTWEventInfo *info);
> +
> +SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova);
> +
>  #endif  /* HW_ARM_SMMU_COMMON */
> --
> 2.5.5

thanks
-- PMM

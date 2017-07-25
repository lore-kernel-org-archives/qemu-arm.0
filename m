Received: by 10.25.44.15 with SMTP id s15csp5023754lfs;
        Tue, 25 Jul 2017 05:12:56 -0700 (PDT)
X-Received: by 10.55.16.94 with SMTP id a91mr24321881qkh.349.1500984776851;
        Tue, 25 Jul 2017 05:12:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500984776; cv=none;
        d=google.com; s=arc-20160816;
        b=VowRYzneIqtaD17mZnCHMpEF4OMV5AD27A9cR0dOLUWODRbs0w7t7i6LmR2aSdsZa9
         nwKn5wIgnn+4TjJY+O8D8XdQK5yMiqcmX3ZaAOBtrKCWJpdwyA2R4T6D7BMFNwr2psPV
         yJB/At9Aay4TIkdVk7JA+r4ybgO3+EsYWu0JJ4Q2w6WMTKkYwJFegh4tG0HamND6h/Lo
         xdopLhR6aMmC67Mjtv1ZgYgNA4eR2GSBQ4Kp0XtWJPB6VlY5fJ6EOLovTDI4hMdnw9p2
         sK/lZDp3vHeANgvNZIRi1+5Zp2TQ87dn6oXQuvV74F0z00d7Cg9PX6D4TJ6+tIBdq5rB
         BooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=ZF5kViTSde2km2zh27dNOJ5OWQmhfY7dgS+j+LL97/Y=;
        b=lt9Ntmr+N+okkK3ul+mewwwlZozhcOLlzY4WapEC07POZBntKblkmUAnrxPi8urzBa
         lDZS3vMeXLwiFRkVBa28/GqPdPeRumD1yy2ITIag8Qq0WaCeTNMhcRMhM6SvcTOK53h+
         Hi+eRRweMV1x5ChI8bLkwKbBSfbZxQC9bpZPZfRIX2zz0n+5RrA+OvzBJ9S5fbvbjHcR
         o7z8UXFxTOlbOehE0Wx8MCHPQsFP3H1JDyjEPWVP3nI7zWbIVFBVQ4w0wt83NR+yutdq
         3w8j9nxkvXRpf4xFGfxozLdTQ6gxs+z5mw0pQe5KvT6uvro7Qh+rAd1HOvKm96oV7d3v
         iiAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@semihalf-com.20150623.gappssmtp.com header.b=KlPNTU+e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 7si9685735qth.75.2017.07.25.05.12.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Jul 2017 05:12:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@semihalf-com.20150623.gappssmtp.com header.b=KlPNTU+e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60390 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dZyhq-0004Gr-7l
	for alex.bennee@linaro.org; Tue, 25 Jul 2017 08:12:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tn@semihalf.com>) id 1dZyhl-0004G6-D1
	for qemu-arm@nongnu.org; Tue, 25 Jul 2017 08:12:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tn@semihalf.com>) id 1dZyhi-000214-7X
	for qemu-arm@nongnu.org; Tue, 25 Jul 2017 08:12:49 -0400
Received: from mail-lf0-x22c.google.com ([2a00:1450:4010:c07::22c]:38093)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <tn@semihalf.com>) id 1dZyhh-00020S-Qj
	for qemu-arm@nongnu.org; Tue, 25 Jul 2017 08:12:46 -0400
Received: by mail-lf0-x22c.google.com with SMTP id y15so55504780lfd.5
	for <qemu-arm@nongnu.org>; Tue, 25 Jul 2017 05:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=semihalf-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ZF5kViTSde2km2zh27dNOJ5OWQmhfY7dgS+j+LL97/Y=;
	b=KlPNTU+eNZLC8hSLnqWPhJBFzduuNNcSreoyDj2+TlJDW0SXPLFqXKD0aTx3zXxYPA
	PZXssmadSB7UVlvoAP/rYtSY1FrcBJLJgLJL+GzE+SE7Vfp71lyPOFMi3hZ4vBtyIsvQ
	Q/it3VyaZbWSAfy+SDsv+qUl4edx0jTu4ZSf1mSyHpsaR2UstJcvv272susbwY+4Qft4
	qIyiQ5AYKRiOJPbftLAj9hV4uicrEfLQQ9fbT7dRSuLkRhBwjLHTZYBc+bDoTlvxYrdb
	mcMeCXmOWLX7hkdGLNgNC4hwmCVP4NEeZPgQZ4MGrR5za5sijiyOhETHV3lnxJX/9gWY
	vIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZF5kViTSde2km2zh27dNOJ5OWQmhfY7dgS+j+LL97/Y=;
	b=k9peIxZvVuMZcb+9nwu8dwZc3bVEZQoMUNRBuhg1K1auin3r1v1VvBbu03QqEpZuWJ
	5QAE8FsgxEVRiQ7Z6K0yIglMUUqMl79pEkVjw8ZlGjL+MgVPpNaQIKsH9uNq1qelBrec
	oWAWJRJ3I/TM7ELl6HVXLl8H6xl0ErNSyoCvbMrRX92Z4ufCRESHWN4fYHDG+HvTkaio
	EVzvJ38K6U0XVn4m2p14Izdccechwne//jY13LDtHCe+QpvXS1QYXfWy5sFV1GcKSMFV
	btu4xkaF/fHiQg86stgZLKzICWQo7pXg4urNaBDwfqx8mETTEJ3TUuiGIisEOXUVaFrU
	eWIg==
X-Gm-Message-State: AIVw112X42MVRTZW7EIOel/7SBO0SktZNZz5FDgm5bynpilMGECP9hjJ
	pCmVJsBddDoaNsQ4
X-Received: by 10.25.230.17 with SMTP id d17mr5617730lfh.98.1500984762924;
	Tue, 25 Jul 2017 05:12:42 -0700 (PDT)
Received: from [10.0.0.85] (31-172-191-173.noc.fibertech.net.pl.
	[31.172.191.173]) by smtp.googlemail.com with ESMTPSA id
	q77sm1786249lfb.60.2017.07.25.05.12.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Jul 2017 05:12:42 -0700 (PDT)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alex.williamson@redhat.com, prem.mallappa@gmail.com
References: <1499633493-19865-1-git-send-email-eric.auger@redhat.com>
	<1499633493-19865-2-git-send-email-eric.auger@redhat.com>
From: Tomasz Nowicki <tn@semihalf.com>
Message-ID: <66fca1dd-b731-c97f-b21b-af4ea75dcb47@semihalf.com>
Date: Tue, 25 Jul 2017 14:12:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Firefox/52.0 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1499633493-19865-2-git-send-email-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::22c
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
X-TUID: jvQb5QW4kq+X

Hi Eric,

I found out what is going on regarding vhost-net outgoing packet's 
payload corruption. My packets were corrupted because of inconsistent 
IOVA to HVA translation in IOTLB. Please see below.

On 09.07.2017 22:51, Eric Auger wrote:
> Introduces the base device and class for the ARM smmu.
> Implements VMSAv8-64 table lookup and translation. VMSAv8-32
> is not implemented.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
> 
> ---

[...]

> +
> +/**
> + * smmu_page_walk_level_64 - Walk an IOVA range from a specific level
> + * @baseaddr: table base address corresponding to @level
> + * @level: level
> + * @cfg: translation config
> + * @start: end of the IOVA range
> + * @end: end of the IOVA range
> + * @hook_fn: the hook that to be called for each detected area
> + * @private: private data for the hook function
> + * @read: whether parent level has read permission
> + * @write: whether parent level has write permission
> + * @nofail: indicates whether each iova of the range
> + *  must be translated or whether failure is allowed
> + * @notify_unmap: whether we should notify invalid entries
> + *
> + * Return 0 on success, < 0 on errors not related to translation
> + * process, > 1 on errors related to translation process (only
> + * if nofail is set)
> + */
> +static int
> +smmu_page_walk_level_64(dma_addr_t baseaddr, int level,
> +                        SMMUTransCfg *cfg, uint64_t start, uint64_t end,
> +                        smmu_page_walk_hook hook_fn, void *private,
> +                        bool read, bool write, bool nofail,
> +                        bool notify_unmap)
> +{
> +    uint64_t subpage_size, subpage_mask, pte, iova = start;
> +    bool read_cur, write_cur, entry_valid;
> +    int ret, granule_sz, stage;
> +    IOMMUTLBEntry entry;
> +
> +    granule_sz = cfg->granule_sz;
> +    stage = cfg->stage;
> +    subpage_size = 1ULL << level_shift(level, granule_sz);
> +    subpage_mask = level_page_mask(level, granule_sz);
> +
> +    trace_smmu_page_walk_level_in(level, baseaddr, granule_sz,
> +                                  start, end, subpage_size);
> +
> +    while (iova < end) {
> +        dma_addr_t next_table_baseaddr;
> +        uint64_t iova_next, pte_addr;
> +        uint32_t offset;
> +
> +        iova_next = (iova & subpage_mask) + subpage_size;
> +        offset = iova_level_offset(iova, level, granule_sz);
> +        pte_addr = baseaddr + offset * sizeof(pte);
> +        pte = get_pte(baseaddr, offset);
> +
> +        trace_smmu_page_walk_level(level, iova, subpage_size,
> +                                   baseaddr, offset, pte);
> +
> +        if (pte == (uint64_t)-1) {
> +            if (nofail) {
> +                return SMMU_TRANS_ERR_WALK_EXT_ABRT;
> +            }
> +            goto next;
> +        }
> +        if (is_invalid_pte(pte) || is_reserved_pte(pte, level)) {
> +            trace_smmu_page_walk_level_res_invalid_pte(stage, level, baseaddr,
> +                                                       pte_addr, offset, pte);
> +            if (nofail) {
> +                return SMMU_TRANS_ERR_WALK_EXT_ABRT;
> +            }
> +            goto next;
> +        }


vhost maintains its IOTLB cache and when there is no IOVA->HVA 
translation, it asks QEMU for help. However, IOTLB entries invalidations 
are guest initiative so for any DMA unmap at guest side we trap to SMMU 
emulation code and call:
smmu_notify_all -> smmuv3_replay_single -> smmu_page_walk_64 -> 
smmu_page_walk_level_64 -> smmuv3_replay_hook -> vhost_iommu_unmap_notify

The thing is that smmuv3_replay_hook() is never called because guest 
zeros PTE before we trap to QEMU so that smmu_page_walk_level_64() fails 
on ^^^ is_invalid_pte(pte) check. This way we keep old IOTLB entry in 
vhost and subsequent translations may be broken.

> +
> +        read_cur = read; /* TODO */
> +        write_cur = write; /* TODO */
> +        entry_valid = read_cur | write_cur; /* TODO */
> +
> +        if (is_page_pte(pte, level)) {
> +            uint64_t gpa = get_page_pte_address(pte, granule_sz);
> +            int perm = IOMMU_ACCESS_FLAG(read_cur, write_cur);
> +
> +            trace_smmu_page_walk_level_page_pte(stage, level, entry.iova,
> +                                                baseaddr, pte_addr, pte, gpa);
> +            if (!entry_valid && !notify_unmap) {
> +                printf("%s entry_valid=%d notify_unmap=%d\n", __func__,
> +                       entry_valid, notify_unmap);
> +                goto next;
> +            }
> +            ret = call_entry_hook(iova, subpage_mask, gpa, perm,
> +                                  hook_fn, private);
> +            if (ret) {
> +                return ret;
> +            }
> +            goto next;
> +        }
> +        if (is_block_pte(pte, level)) {
> +            uint64_t block_size;
> +            hwaddr gpa = get_block_pte_address(pte, level, granule_sz,
> +                                               &block_size);
> +            int perm = IOMMU_ACCESS_FLAG(read_cur, write_cur);
> +
> +            if (gpa == -1) {
> +                if (nofail) {
> +                    return SMMU_TRANS_ERR_WALK_EXT_ABRT;
> +                } else {
> +                    goto next;
> +                }
> +            }
> +            trace_smmu_page_walk_level_block_pte(stage, level, baseaddr,
> +                                                 pte_addr, pte, iova, gpa,
> +                                                 (int)(block_size >> 20));
> +
> +            ret = call_entry_hook(iova, subpage_mask, gpa, perm,
> +                                  hook_fn, private);
> +            if (ret) {
> +                return ret;
> +            }
> +            goto next;
> +        }
> +        if (level  == 3) {
> +            goto next;
> +        }
> +        /* table pte */
> +        next_table_baseaddr = get_table_pte_address(pte, granule_sz);
> +        trace_smmu_page_walk_level_table_pte(stage, level, baseaddr, pte_addr,
> +                                             pte, next_table_baseaddr);
> +        ret = smmu_page_walk_level_64(next_table_baseaddr, level + 1, cfg,
> +                                      iova, MIN(iova_next, end),
> +                                      hook_fn, private, read_cur, write_cur,
> +                                      nofail, notify_unmap);
> +        if (!ret) {
> +            return ret;
> +        }
> +
> +next:
> +        iova = iova_next;
> +    }
> +
> +    return SMMU_TRANS_ERR_NONE;
> +}

Thanks,
Tomasz

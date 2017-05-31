Received: by 10.25.0.6 with SMTP id 6csp189769lfa;
        Wed, 31 May 2017 00:05:04 -0700 (PDT)
X-Received: by 10.55.23.195 with SMTP id 64mr25731130qkx.85.1496214304881;
        Wed, 31 May 2017 00:05:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496214304; cv=none;
        d=google.com; s=arc-20160816;
        b=FPX1UrXYUp7RmCFYZuVXWx9l74fz9qR965Q40CBfwUe6aSkSijK8laBVRhGc80Imge
         B7AY7sISAQz7f5zXKEiyIJzgSl/sx8fFdECuzfptAmd1lptiRR3D5VpTQ1sJk4DNb1E1
         lFMluBy7PO6AjBzrKf+22zq2tGuH1XPlPenqycPtH3Ed+yZPJx9csjqBUELFgueUbWQN
         s6YpWIwOr7/fqddNDDFFkYXULKVb7wU8y+8M15DbAz/4zZIsSnxS0pCSjd1SeahFTZN+
         UGZOdAr/aQaCDL0tFHsFdgFsW7eiKk3fxp9sxMXstkw1zQmHsOYjXkHUuwUyebErjO3R
         fYow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=WghjAPH2tD+LEpBBsAyy6zpAsJhSpdCJqw/de22YZlc=;
        b=1Ge7DgYRqr3TQcFot2Y1nclwBzPDb2FOJ6Z4lXdDT/JxHakV02pWxGR9WkSrMhhKMy
         a8D2V1YC/O2GBF8vnVEVnaur8YjD7aZmADKXFxhqBFsFb33ZkazzLVxJqCvwwr1UH8z3
         XQMKsK5WZeeGN7Npto3nW2DOgi7fOAB/Vq5V+Dbe7AjjyKfMQA1Ga/iS2wyla6Hd0BPm
         RGR0EX8fntGurUTg2cXr8YXkDUjUg/yjYZ2fBhT0u8tOXF8j5TWB801bvN+jaCrybms6
         X99po1ddgZVvuBpy22rv84PSZALJGQ7m4Geg/EsI57PXQaHR/kPOObGtDv7bq6INIhrV
         Bhtg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y123si1939898qkb.242.2017.05.31.00.05.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 31 May 2017 00:05:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57635 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFxgk-0005qP-7x
	for alex.bennee@linaro.org; Wed, 31 May 2017 03:05:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dFxgb-0005ou-B2
	for qemu-arm@nongnu.org; Wed, 31 May 2017 03:04:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dFxgW-0004KR-If
	for qemu-arm@nongnu.org; Wed, 31 May 2017 03:04:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37050)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dFxgW-0004KM-AC; Wed, 31 May 2017 03:04:48 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7CCA33DEEB;
	Wed, 31 May 2017 07:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7CCA33DEEB
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 7CCA33DEEB
Received: from localhost.localdomain (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C880A5C478;
	Wed, 31 May 2017 07:04:43 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1494697399-352-1-git-send-email-eric.auger@redhat.com>
	<1494697399-352-2-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8SHP+=+hXB2D3XsCdeFg5NMSqTxtjH9aEU0bE5bL-2Dw@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <aa138868-9f59-2023-926b-e2c4bc9219c6@redhat.com>
Date: Wed, 31 May 2017 09:04:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8SHP+=+hXB2D3XsCdeFg5NMSqTxtjH9aEU0bE5bL-2Dw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 31 May 2017 07:04:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC v4 1/5] hw/arm/smmu-common: smmu base class
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
Cc: Radha Mohan <mohun106@gmail.com>, Andrew Jones <drjones@redhat.com>,
	Trey Cain <tcain@qti.qualcomm.com>,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	prem.mallappa@gmail.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /oQQFweGdF04

Hi Peter,

On 30/05/2017 17:56, Peter Maydell wrote:
> On 13 May 2017 at 18:43, Eric Auger <eric.auger@redhat.com> wrote:
>> Introduces the base device and class for the ARM smmu.
>> Implements VMSAv8-64 table lookup and translation. VMSAv8-32
>> is not yet implemented.
>>
>> For VFIO integration we will need to notify mapping changes
>> of an input range and skipped unmapped regions. table walk
>> helper allows.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
>>
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
>> + * @must_translate: indicates whether each iova of the range
>> + *  must be translated or whether failure is allowed
>> + * @notify_unmap: whether we should notify invalid entries
>> + *
>> + * Return 0 on success, < 0 on errors not related to translation
>> + * process, > 1 on errors related to translation process (only
>> + * if must_translate is set)
>> + */
>> +static int
>> +smmu_page_walk_level_64(dma_addr_t baseaddr, int level,
>> +                        SMMUTransCfg *cfg, uint64_t start, uint64_t end,
>> +                        smmu_page_walk_hook hook_fn, void *private,
>> +                        bool read, bool write, bool must_translate,
>> +                        bool notify_unmap)
>> +{
> 
>> +        /* table pte */
>> +        next_table_baseaddr = get_table_pte_address(pte, granule_sz);
>> +        trace_smmu_page_walk_level_table_pte(pte, next_table_baseaddr);
>> +        ret = smmu_page_walk_level_64(next_table_baseaddr, level + 1, cfg,
>> +                                      iova, MIN(iova_next, end),
>> +                                      hook_fn, private, read_cur, write_cur,
>> +                                      must_translate, notify_unmap);
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
> It seems a bit odd that this function is recursive -- I was
> expecting it just to loop through for each successive level
> until it hits a block/page entry, as the LPAE table walk
> code in target/arm/helper.c does...

welcome back ;-)

Thanks for the pointer to get_phys_addr_lpae(). Actually I got largely
inspired of vtd_page_walk and vtd_page_walk_level of
hw/i386/intel_iommu.c which also use the same recursive form.

The peculiarity compared to get_phys_addr_lpae() is that we scan a range
of iovas and do not translate a single iova. In case a level entry is
not implemented we want to jump to the next one at the same level and in
case the entry matches a table entry we want to scan the next level
entries matching that iova range.

Does that make more sense?

Thanks

Eric
> 
> thanks
> -- PMM
> 

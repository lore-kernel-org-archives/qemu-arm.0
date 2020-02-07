Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp59777lfp;
        Thu, 6 Feb 2020 19:20:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqz3LjtQQXkFe2esKbtrynFx4zz8Iv/rS3IplYASM+A9PSU5yymAbIAXPdm/WXq7/o9lH/KH
X-Received: by 2002:a05:6830:1d7a:: with SMTP id l26mr1040101oti.138.1581045651491;
        Thu, 06 Feb 2020 19:20:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581045651; cv=none;
        d=google.com; s=arc-20160816;
        b=dSbVbgmt3C9gZB7QMznRGp3D4Gr8RBPnfPWFosNMWN3lZ9NY/JJ6AbTwtWVmQRz9hA
         ZTrZdhmipyg/2D6DekTB5El00xx3ySIhzM82XJqHesXsm1bEN4o09J3LZ9mFv8VW/8KS
         d0OTaHgre+7OD2Qcgwq6EzvG3Vphyk+r33YfEbA9atD6s1DR2JOFnjCqu2dpsTdh1Q3s
         JM+kmmN5PRiy4m6kn6ncllr6O6qdPIKaOWQsK9SB3TccmWlQxS4ZNyUz7S6WGSWJZ2cC
         6ue7DuC/9ynNFLZjKnpqtHgKtZfotW5FneNuKYV2v9Yz/YkkGBzQjQ27g0VymP7gjZMl
         ApWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=9485yQ0nISe2MwS9OnZqdxbSvjrYos/kvj7Tb1hTlOI=;
        b=SQQBZtZYsRSShILQ4Q27REh9L4GmeboybhQbMlH3KlgYJQkEBO00Tm2ZTZbxeTWVcj
         yBHSwBCFUbX9jjKsNJqxhSEjMz96v8mE4hc2VnjVDDlfOutFn3TTYzwHMJ8eHmCUvOyc
         YaqrtPmKB/W3oOAcScSU5z77iU6pu0pbKazvHjXFdrecGLDmNzkkXgBOqIvwp4ogc7G0
         mt9Gl9OK1Zxz6OUKVSaNiD07iOUb1puZCzenWM0wxBe+EbyioVq+C5qKX6WWv40jFdEn
         A59e3ILToukpvTy9nGEcyKOsVTuG9ouXKAwrg9/3a4b5J35vRjeDoxCX/IVBT7qGlDM9
         oWSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id f3si3258604oia.264.2020.02.06.19.20.50;
        Thu, 06 Feb 2020 19:20:51 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbgBGDUu (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 6 Feb 2020 22:20:50 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:9707 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726628AbgBGDUt (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 6 Feb 2020 22:20:49 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 4FC83DEDBF9E915389DD;
        Fri,  7 Feb 2020 11:20:46 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.27) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Fri, 7 Feb 2020
 11:20:39 +0800
Subject: Re: [kvm-unit-tests PATCH v3 08/14] arm/arm64: ITS:
 its_enable_defaults
To:     Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
        <maz@kernel.org>, <kvmarm@lists.cs.columbia.edu>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>
CC:     <drjones@redhat.com>, <andre.przywara@arm.com>,
        <peter.maydell@linaro.org>, <alexandru.elisei@arm.com>,
        <thuth@redhat.com>
References: <20200128103459.19413-1-eric.auger@redhat.com>
 <20200128103459.19413-9-eric.auger@redhat.com>
From:   Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <10d0630f-1464-b12a-5ad5-ee617eaa5cca@huawei.com>
Date:   Fri, 7 Feb 2020 11:20:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20200128103459.19413-9-eric.auger@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.222.27]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: hD7slNdaCw9V

Hi Eric,

On 2020/1/28 18:34, Eric Auger wrote:
> its_enable_defaults() is the top init function that allocates the
> command queue and all the requested tables (device, collection,
> lpi config and pending tables), enable LPIs at distributor level
> and ITS level.
> 
> gicv3_enable_defaults must be called before.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v2 -> v3:
> - introduce its_setup_baser in this patch
> - squash "arm/arm64: ITS: Init the command queue" in this patch.
> ---
>   lib/arm/asm/gic-v3-its.h |  8 ++++
>   lib/arm/gic-v3-its.c     | 89 ++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 97 insertions(+)
> 
> diff --git a/lib/arm/asm/gic-v3-its.h b/lib/arm/asm/gic-v3-its.h
> index 815c515..fe73c04 100644
> --- a/lib/arm/asm/gic-v3-its.h
> +++ b/lib/arm/asm/gic-v3-its.h
> @@ -36,6 +36,8 @@ struct its_data {
>   	void *base;
>   	struct its_typer typer;
>   	struct its_baser baser[GITS_BASER_NR_REGS];
> +	struct its_cmd_block *cmd_base;
> +	struct its_cmd_block *cmd_write;
>   };
>   
>   extern struct its_data its_data;
> @@ -88,10 +90,16 @@ extern struct its_data its_data;
>   #define GITS_BASER_TYPE_DEVICE		1
>   #define GITS_BASER_TYPE_COLLECTION	4
>   
> +
> +struct its_cmd_block {
> +	u64 raw_cmd[4];
> +};
> +
>   extern void its_parse_typer(void);
>   extern void its_init(void);
>   extern int its_parse_baser(int i, struct its_baser *baser);
>   extern struct its_baser *its_lookup_baser(int type);
> +extern void its_enable_defaults(void);
>   
>   #else /* __arm__ */
>   
> diff --git a/lib/arm/gic-v3-its.c b/lib/arm/gic-v3-its.c
> index 2c0ce13..d1e7e52 100644
> --- a/lib/arm/gic-v3-its.c
> +++ b/lib/arm/gic-v3-its.c
> @@ -86,3 +86,92 @@ void its_init(void)
>   		its_parse_baser(i, &its_data.baser[i]);
>   }
>   
> +static void its_setup_baser(int i, struct its_baser *baser)
> +{
> +	unsigned long n = (baser->nr_pages * baser->psz) >> PAGE_SHIFT;
> +	unsigned long order = is_power_of_2(n) ? fls(n) : fls(n) + 1;
> +	u64 val;
> +
> +	baser->table_addr = (u64)virt_to_phys(alloc_pages(order));
> +
> +	val = ((u64)baser->table_addr					|
> +		((u64)baser->type	<< GITS_BASER_TYPE_SHIFT)	|
> +		((u64)(baser->esz - 1)	<< GITS_BASER_ENTRY_SIZE_SHIFT)	|
> +		((baser->nr_pages - 1)	<< GITS_BASER_PAGES_SHIFT)	|
> +		(u64)baser->indirect	<< 62				|

I haven't seen the 'nr_pages' and 'indirect' are programmed anywhere
except in its_parse_baser(). It looks like they're treated as RO (but
they shouldn't) and I now don't think it makes sense to parse them in
its_parse_baser(), in patch#5.

> +		(u64)baser->valid	<< 63);
> +
> +	switch (baser->psz) {
> +	case SZ_4K:
> +		val |= GITS_BASER_PAGE_SIZE_4K;
> +		break;
> +	case SZ_16K:
> +		val |= GITS_BASER_PAGE_SIZE_16K;
> +		break;
> +	case SZ_64K:
> +		val |= GITS_BASER_PAGE_SIZE_64K;
> +		break;
> +	}
> +
> +	writeq(val, gicv3_its_base() + GITS_BASER + i * 8);
> +}
> +
> +/**
> + * init_cmd_queue: Allocate the command queue and initialize
> + * CBASER, CREADR, CWRITER

no 'CREADR'.


Thanks,
Zenghui

Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3237517lff;
        Thu, 19 Dec 2019 23:10:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqz4ObZIZR9ddn4zuW3UQdszQzd3feCecP9Yur8sruEhEqkloEZiQwOn3y8rf27mHXWu6+7N
X-Received: by 2002:a9d:7a4d:: with SMTP id z13mr13454715otm.148.1576825842589;
        Thu, 19 Dec 2019 23:10:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576825842; cv=none;
        d=google.com; s=arc-20160816;
        b=1AJUii22+cJiwAIA+fkKN2z8n8K0CLoHluzzg7ySX4LLtF5F/WM2B72u5Jo0l9hf7V
         +mMq2HqpyCYKwIIo7LMJnnGWtNsnF8tDWnaR3iGMDVrTXBZCfJL005BYVC00NLvk1aWv
         ZF6VB/U1whx0HjCpTdpojDAT9bldRXrMtCzHm0sFd/bY1THWWMGeK4GVbZ1K4UeWF+IN
         hDwW/r3gA0k9SHNbeFOZ8gXg1Y+cwXzenaXaXzrfoMRy6pw9Xytmbf5ym0GJw8D5SFCU
         AzTXGPLCqrMsmHHYYWuYj4L6MWSX+Jg9B+9HfqGesiISBXi8Bi4IqTLKIL4fVjzHLYz2
         xXGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=ysWeL1adi1g+5SJ0HOf9HJekQxuMUxOmdg1+CfuQHsw=;
        b=KTYulObwhDo4ekC6SO0N6DweuqF5cTSK3++iekhPd+p++eVEulpHHtGMMUf2JqBPGL
         Ilr+ek3+38TyAv2HEYc65ugoklaOQTALz7Qx0SUAIPzHlrAxyN5bW6N6ZZNJoE+T9OvB
         IDKB394CzA2uxpboKvZfd/IZlnrvr+VMSERJm9/k00240CMqkJqXC6wJTl4/iJn/lbJH
         5P6eHWaFZ0FNteMoyb4xyL2T7dwvYZ0wgKZ5kGunOVwKMP6nRK52n0K8Nna/LxOJ3Wv1
         KGPV6nyNY66l8DzoZnb8ww6Waq594hDpEZ9R87GmU7Npzscd58Z3lNvG13H9BVHrqfE1
         R2Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id l189si1722922oih.166.2019.12.19.23.10.42;
        Thu, 19 Dec 2019 23:10:42 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727269AbfLTHKl (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 20 Dec 2019 02:10:41 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7722 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727165AbfLTHKl (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 20 Dec 2019 02:10:41 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 2F8FC377EBD1CE8A33B3;
        Fri, 20 Dec 2019 15:10:39 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.27) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Fri, 20 Dec 2019
 15:10:31 +0800
Subject: Re: [kvm-unit-tests PATCH 08/16] arm/arm64: ITS: Init the command
 queue
To:     Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
        <maz@kernel.org>, <kvmarm@lists.cs.columbia.edu>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>
CC:     <drjones@redhat.com>, <andre.przywara@arm.com>,
        <peter.maydell@linaro.org>, <alexandru.elisei@arm.com>,
        <thuth@redhat.com>
References: <20191216140235.10751-1-eric.auger@redhat.com>
 <20191216140235.10751-9-eric.auger@redhat.com>
From:   Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <37c8b078-900b-a474-04a0-0273c3a32aed@huawei.com>
Date:   Fri, 20 Dec 2019 15:10:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191216140235.10751-9-eric.auger@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.222.27]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: lhzZ2BQaFeyz

Hi Eric,

On 2019/12/16 22:02, Eric Auger wrote:
> Allocate the command queue and initialize related registers:
> CBASER, CREADR, CWRITER.
> 
> The command queue is 64kB. This aims at not bothing with fullness.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   lib/arm/asm/gic-v3-its.h |  7 +++++++
>   lib/arm/gic-v3-its.c     | 37 +++++++++++++++++++++++++++++++++++++
>   2 files changed, 44 insertions(+)
> 
> diff --git a/lib/arm/asm/gic-v3-its.h b/lib/arm/asm/gic-v3-its.h
> index 0d11aed..ed42707 100644
> --- a/lib/arm/asm/gic-v3-its.h
> +++ b/lib/arm/asm/gic-v3-its.h
> @@ -113,10 +113,17 @@ struct its_baser {
>   	int esz;
>   };
>   
> +struct its_cmd_block {
> +	u64     raw_cmd[4];
> +};
> +
>   struct its_data {
>   	void *base;
>   	struct its_typer typer;
>   	struct its_baser baser[GITS_BASER_NR_REGS];
> +	struct its_cmd_block *cmd_base;
> +	struct its_cmd_block *cmd_write;
> +	struct its_cmd_block *cmd_readr;

I think we can just get rid of the 'cmd_readr'. As GITS_CREADR is
generally manipulated by the ITS, and ...

>   };
>   
>   extern struct its_data its_data;
> diff --git a/lib/arm/gic-v3-its.c b/lib/arm/gic-v3-its.c
> index 0b5a700..8b6a095 100644
> --- a/lib/arm/gic-v3-its.c
> +++ b/lib/arm/gic-v3-its.c
> @@ -188,3 +188,40 @@ void set_pending_table_bit(int rdist, int n, bool set)
>   		byte &= ~mask;
>   	*ptr = byte;
>   }
> +
> +/**
> + * init_cmd_queue: Allocate the command queue and initialize
> + * CBASER, CREADR, CWRITER
> + */
> +void init_cmd_queue(void);
> +void init_cmd_queue(void)
> +{
> +	unsigned long n = SZ_64K >> PAGE_SHIFT;
> +	unsigned long order = fls(n);
> +	u64 cbaser, tmp;
> +
> +	its_data.cmd_base = (void *)virt_to_phys(alloc_pages(order));
> +
> +	cbaser = ((u64)its_data.cmd_base	|
> +		 GITS_CBASER_WaWb               |
> +		 GITS_CBASER_InnerShareable     |
> +		 (SZ_64K / SZ_4K - 1) |
> +		 GITS_CBASER_VALID);
> +
> +	writeq(cbaser, its_data.base + GITS_CBASER);

..."(CREADR) is cleared to 0 when a value is written to GITS_CBASER."
-- from IHI0069E 9.19.3

> +	tmp = readq(its_data.base + GITS_CBASER);
> +
> +	if ((tmp ^ cbaser) & GITS_CBASER_SHAREABILITY_MASK) {
> +		if (!(tmp & GITS_CBASER_SHAREABILITY_MASK)) {
> +			cbaser &= ~(GITS_CBASER_SHAREABILITY_MASK |
> +				GITS_CBASER_CACHEABILITY_MASK);
> +			cbaser |= GITS_CBASER_nC;
> +			writeq(cbaser, its_data.base + GITS_CBASER);
> +		}
> +	}
> +
> +	its_data.cmd_write = its_data.cmd_base;
> +	its_data.cmd_readr = its_data.cmd_base;
> +	writeq(0, its_data.base + GITS_CWRITER);
> +	writeq(0, its_data.base + GITS_CREADR);

So this writeq() is also not needed.

Or I've just missed the point that this is done by intention to test
"whether the GITS_CREADR implemented by KVM is Write Ignored"?
If so, please ignore all of the comments above :)


Thanks,
Zenghui

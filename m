Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp166542lfp;
        Thu, 6 Feb 2020 21:42:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqzo81KAPAaTIq7E+waJW3+G30UC/vhTUdmOjk+Uv/aWmDb/xVHA1wzfZvwMHmhbDD1hiBDE
X-Received: by 2002:a05:6808:8d0:: with SMTP id k16mr997360oij.68.1581054132803;
        Thu, 06 Feb 2020 21:42:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581054132; cv=none;
        d=google.com; s=arc-20160816;
        b=iF9/ajaGjH/lAUTXkXoiZCynv94eufOooxoEfvezzw9jA8ekeZR5o23wKWRiJimimv
         kLAysEn5uSQgbRc7Cm63EqYmsG0oBgoLnNug3bVkbjar8IxVyielsy1xTh++ityiW187
         ifQB4/ma0VLgrpqniLzo24rKXKQbUqn9mb3dDyr4UbYFDB/xM6I6Qyixca/A9OaHF0ka
         gPYwrNdZx4rPU16LxOcRxKwmowM9k8/TO1vgvoTikwtF9gZnIA6U+kkzqIJR4+u7CFwJ
         lPHzMa3qYh1jdNKFkQzUH6NoAZwrpBnnucIaZuwsVME/dUDUQ6Yj+xVdLysWcOAMc6VM
         kJ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=Ol59viViBDDcMlYLt2+48qv9bgji/0VO2xDJM4wKTRY=;
        b=DX5ZVdFW9mTAFDdvU1/rJA9ORxvRyOaSA34ugoURQpslyu81jme9v16K784eoGvd7N
         EGDstmMgK+H9zgFMA6avbZbutRs+gquYd/eoVCHXJrqSQipCUO2zjgDD6z4UdRbRCzfd
         L2DbYUpMmszpX+oF0kOaShas5EfX/7cBWecdDKfiobJnb948SU8rsWiANRBoXYKctp0k
         l0HR1yKHuwB5M+O/PWyq0kQQ5qE0/V4zc80v+PuDOHzJKj0WbGgte4kvMA5IrChIT9Ra
         fX8186lV4N7wn38D1pk+8ZI1PpJhj44YLThm744zj3/7Wf+gD/uvjZKFOa4ZQN95jHZI
         tSNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 106si1091185oti.106.2020.02.06.21.42.12;
        Thu, 06 Feb 2020 21:42:12 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgBGFmJ (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 7 Feb 2020 00:42:09 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:50088 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725837AbgBGFmI (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 7 Feb 2020 00:42:08 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id A8F7D8F5FD0ADFE965E5;
        Fri,  7 Feb 2020 13:42:01 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.27) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Fri, 7 Feb 2020
 13:41:54 +0800
Subject: Re: [kvm-unit-tests PATCH v3 09/14] arm/arm64: ITS: Device and
 collection Initialization
To:     Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
        <maz@kernel.org>, <kvmarm@lists.cs.columbia.edu>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>
CC:     <drjones@redhat.com>, <andre.przywara@arm.com>,
        <peter.maydell@linaro.org>, <alexandru.elisei@arm.com>,
        <thuth@redhat.com>
References: <20200128103459.19413-1-eric.auger@redhat.com>
 <20200128103459.19413-10-eric.auger@redhat.com>
From:   Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <42a8964a-af3d-0117-bfac-5db6b7b832dd@huawei.com>
Date:   Fri, 7 Feb 2020 13:41:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20200128103459.19413-10-eric.auger@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.222.27]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: cb8gWrX+UzfJ

Hi Eric,

On 2020/1/28 18:34, Eric Auger wrote:
> Introduce an helper functions to register
> - a new device, characterized by its device id and the
>    max number of event IDs that dimension its ITT (Interrupt
>    Translation Table).  The function allocates the ITT.
> 
> - a new collection, characterized by its ID and the
>    target processing engine (PE).
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v2 -> v3:
> - s/report_abort/assert
> 
> v1 -> v2:
> - s/nb_/nr_
> ---
>   lib/arm/asm/gic-v3-its.h | 20 +++++++++++++++++-
>   lib/arm/gic-v3-its.c     | 44 ++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/arm/asm/gic-v3-its.h b/lib/arm/asm/gic-v3-its.h
> index fe73c04..acd97a9 100644
> --- a/lib/arm/asm/gic-v3-its.h
> +++ b/lib/arm/asm/gic-v3-its.h
> @@ -31,6 +31,19 @@ struct its_baser {
>   };
>   
>   #define GITS_BASER_NR_REGS              8
> +#define GITS_MAX_DEVICES		8
> +#define GITS_MAX_COLLECTIONS		8
> +
> +struct its_device {
> +	u32 device_id;	/* device ID */
> +	u32 nr_ites;	/* Max Interrupt Translation Entries */
> +	void *itt;	/* Interrupt Translation Table GPA */
> +};
> +
> +struct its_collection {
> +	u64 target_address;
> +	u16 col_id;
> +};
>   
>   struct its_data {
>   	void *base;
> @@ -38,6 +51,10 @@ struct its_data {
>   	struct its_baser baser[GITS_BASER_NR_REGS];
>   	struct its_cmd_block *cmd_base;
>   	struct its_cmd_block *cmd_write;
> +	struct its_device devices[GITS_MAX_DEVICES];
> +	u32 nr_devices;		/* Allocated Devices */
> +	struct its_collection collections[GITS_MAX_COLLECTIONS];
> +	u32 nr_collections;	/* Allocated Collections */
>   };
>   
>   extern struct its_data its_data;
> @@ -90,7 +107,6 @@ extern struct its_data its_data;
>   #define GITS_BASER_TYPE_DEVICE		1
>   #define GITS_BASER_TYPE_COLLECTION	4
>   
> -
>   struct its_cmd_block {
>   	u64 raw_cmd[4];
>   };
> @@ -100,6 +116,8 @@ extern void its_init(void);
>   extern int its_parse_baser(int i, struct its_baser *baser);
>   extern struct its_baser *its_lookup_baser(int type);
>   extern void its_enable_defaults(void);
> +extern struct its_device *its_create_device(u32 dev_id, int nr_ites);
> +extern struct its_collection *its_create_collection(u32 col_id, u32 target_pe);
>   
>   #else /* __arm__ */
>   
> diff --git a/lib/arm/gic-v3-its.c b/lib/arm/gic-v3-its.c
> index d1e7e52..c2dcd01 100644
> --- a/lib/arm/gic-v3-its.c
> +++ b/lib/arm/gic-v3-its.c
> @@ -175,3 +175,47 @@ void its_enable_defaults(void)
>   
>   	writel(GITS_CTLR_ENABLE, its_data.base + GITS_CTLR);
>   }
> +
> +struct its_device *its_create_device(u32 device_id, int nr_ites)
> +{
> +	struct its_baser *baser;
> +	struct its_device *new;
> +	unsigned long n, order;
> +
> +	assert(its_data.nr_devices < GITS_MAX_DEVICES);
> +


> +	baser = its_lookup_baser(GITS_BASER_TYPE_DEVICE);
> +	if (!baser)
> +		return NULL;

I think there's no need to lookup the device baser here. As the
device baser should have already been setup at initialization
time (i.e. in its_enable_defaults). And anyway, 'baser' is not
being used in this function.


Thanks,
Zenghui

> +
> +	new = &its_data.devices[its_data.nr_devices];
> +
> +	new->device_id = device_id;
> +	new->nr_ites = nr_ites;
> +
> +	n = (its_data.typer.ite_size * nr_ites) >> PAGE_SHIFT;
> +	order = is_power_of_2(n) ? fls(n) : fls(n) + 1;
> +	new->itt = (void *)virt_to_phys(alloc_pages(order));
> +
> +	its_data.nr_devices++;
> +	return new;
> +}
> +
> +struct its_collection *its_create_collection(u32 col_id, u32 pe)
> +{
> +	struct its_collection *new;
> +
> +	assert(its_data.nr_collections < GITS_MAX_COLLECTIONS);
> +
> +	new = &its_data.collections[its_data.nr_collections];
> +
> +	new->col_id = col_id;
> +
> +	if (its_data.typer.pta)
> +		new->target_address = (u64)gicv3_data.redist_base[pe];
> +	else
> +		new->target_address = pe << 16;
> +
> +	its_data.nr_collections++;
> +	return new;
> +}
> 

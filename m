Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp2526901lfi;
        Wed, 4 Mar 2020 22:30:34 -0800 (PST)
X-Google-Smtp-Source: ADFU+vv+cRnQcwHwhy1yYnVvSztlegCD5JgwXZpuJHvAAp/lBJi5m91q4PbI9ns0HfLXs0OmH0tl
X-Received: by 2002:a9d:4810:: with SMTP id c16mr1814993otf.248.1583389834418;
        Wed, 04 Mar 2020 22:30:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583389834; cv=none;
        d=google.com; s=arc-20160816;
        b=BlF7+dONcvS5lsCFEeOMgf+V8Nxip4w0pH4JGoVlJ7GaAT+KxuWJTX0htaFWY+lYvq
         74V31OiHMLVbAgupnSKOw8mj+gwJocUWXuuEOT8R8T4D2xxscr4tK8WJpqt+ssavmxht
         BeGv7YnlYlkS5s7CSOJt5VDoW/sQGOBY68fzGpxP0uMW6krBtLLupOt6QDu1sx+8fxwb
         ji+Kh3jczZaZKUP4XG7gCgMH5N2iCt3cGA0Kiu/BJhlLKEiUUaypOuGINSFIdidjekZf
         Ngikezb1DMvD9xPNJLGoCeJWQ5rY6wAC+h7Z8Z/1Xpym6khoSk2m65dpcvQ/9+kSDRcB
         9PEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=9FLf0kSwJI2C187GBsYhKR3cc8t6kUMWA4lXoOk3244=;
        b=KtgKs9wxGmTi249YUqVrHHGxtAbZdMs7ypljPmexLaknktavk4Zs0apTKI3IavLgbP
         J7EAFTiGFRQoV90dwCZIxN1mv/wmYr4ceRgnCxIUo5krLyps/zZodJkf71PQU7J8721D
         4rvn3Y6O0zFcpN8AtOGmWlTVlSjsBNdLN29m9pPrqRZnKEim15pLLt+fG+anFX7Ro8bH
         iCbzmjRWtRdtptqb7Asc7JhMLP5gvHBhs8ePaCYaTr4ZVh/27hn6jsKjsxGTMUgGlp4E
         +IZy30jrYabdm4kS/bMcR9YBgLO9S3ELIOtLHkrY1BcMC9dx3PfkI7FyzkDNAhaSJt4B
         FKxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id u4si2815847oic.115.2020.03.04.22.30.33;
        Wed, 04 Mar 2020 22:30:34 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbgCEGad (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 5 Mar 2020 01:30:33 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:11165 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725818AbgCEGac (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 5 Mar 2020 01:30:32 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 4BB4BA99A342402E1B34;
        Thu,  5 Mar 2020 14:30:29 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.27) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Thu, 5 Mar 2020
 14:30:18 +0800
Subject: Re: [kvm-unit-tests PATCH v3 08/14] arm/arm64: ITS:
 its_enable_defaults
To:     Auger Eric <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
        <maz@kernel.org>, <kvmarm@lists.cs.columbia.edu>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>
CC:     <drjones@redhat.com>, <andre.przywara@arm.com>,
        <peter.maydell@linaro.org>, <alexandru.elisei@arm.com>,
        <thuth@redhat.com>
References: <20200128103459.19413-1-eric.auger@redhat.com>
 <20200128103459.19413-9-eric.auger@redhat.com>
 <10d0630f-1464-b12a-5ad5-ee617eaa5cca@huawei.com>
 <a49227ce-355a-be35-c006-441e2adca8e1@redhat.com>
From:   Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <1b91ddb6-5139-5deb-2325-c18af7657825@huawei.com>
Date:   Thu, 5 Mar 2020 14:30:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <a49227ce-355a-be35-c006-441e2adca8e1@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.173.222.27]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: uhwEl0hV4twP

Hi Eric,

On 2020/3/4 22:26, Auger Eric wrote:
> Hi Zenghui,
> On 2/7/20 4:20 AM, Zenghui Yu wrote:
>> Hi Eric,
>>
>> On 2020/1/28 18:34, Eric Auger wrote:
>>> its_enable_defaults() is the top init function that allocates the
>>> command queue and all the requested tables (device, collection,
>>> lpi config and pending tables), enable LPIs at distributor level
>>> and ITS level.
>>>
>>> gicv3_enable_defaults must be called before.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>
>>> ---
>>>
>>> v2 -> v3:
>>> - introduce its_setup_baser in this patch
>>> - squash "arm/arm64: ITS: Init the command queue" in this patch.
>>> ---
>>>    lib/arm/asm/gic-v3-its.h |  8 ++++
>>>    lib/arm/gic-v3-its.c     | 89 ++++++++++++++++++++++++++++++++++++++++
>>>    2 files changed, 97 insertions(+)
>>>
>>> diff --git a/lib/arm/asm/gic-v3-its.h b/lib/arm/asm/gic-v3-its.h
>>> index 815c515..fe73c04 100644
>>> --- a/lib/arm/asm/gic-v3-its.h
>>> +++ b/lib/arm/asm/gic-v3-its.h
>>> @@ -36,6 +36,8 @@ struct its_data {
>>>        void *base;
>>>        struct its_typer typer;
>>>        struct its_baser baser[GITS_BASER_NR_REGS];
>>> +    struct its_cmd_block *cmd_base;
>>> +    struct its_cmd_block *cmd_write;
>>>    };
>>>      extern struct its_data its_data;
>>> @@ -88,10 +90,16 @@ extern struct its_data its_data;
>>>    #define GITS_BASER_TYPE_DEVICE        1
>>>    #define GITS_BASER_TYPE_COLLECTION    4
>>>    +
>>> +struct its_cmd_block {
>>> +    u64 raw_cmd[4];
>>> +};
>>> +
>>>    extern void its_parse_typer(void);
>>>    extern void its_init(void);
>>>    extern int its_parse_baser(int i, struct its_baser *baser);
>>>    extern struct its_baser *its_lookup_baser(int type);
>>> +extern void its_enable_defaults(void);
>>>      #else /* __arm__ */
>>>    diff --git a/lib/arm/gic-v3-its.c b/lib/arm/gic-v3-its.c
>>> index 2c0ce13..d1e7e52 100644
>>> --- a/lib/arm/gic-v3-its.c
>>> +++ b/lib/arm/gic-v3-its.c
>>> @@ -86,3 +86,92 @@ void its_init(void)
>>>            its_parse_baser(i, &its_data.baser[i]);
>>>    }
>>>    +static void its_setup_baser(int i, struct its_baser *baser)
>>> +{
>>> +    unsigned long n = (baser->nr_pages * baser->psz) >> PAGE_SHIFT;
>>> +    unsigned long order = is_power_of_2(n) ? fls(n) : fls(n) + 1;
>>> +    u64 val;
>>> +
>>> +    baser->table_addr = (u64)virt_to_phys(alloc_pages(order));
>>> +
>>> +    val = ((u64)baser->table_addr                    |
>>> +        ((u64)baser->type    << GITS_BASER_TYPE_SHIFT)    |
>>> +        ((u64)(baser->esz - 1)    << GITS_BASER_ENTRY_SIZE_SHIFT)    |
>>> +        ((baser->nr_pages - 1)    << GITS_BASER_PAGES_SHIFT)    |
>>> +        (u64)baser->indirect    << 62                |
>>
>> I haven't seen the 'nr_pages' and 'indirect' are programmed anywhere
>> except in its_parse_baser(). It looks like they're treated as RO (but
>> they shouldn't) and I now don't think it makes sense to parse them in
>> its_parse_baser(), in patch#5.
> 
> First of all please forgive me for the delay.

Never mind.

> 
> I agree with you on nr_pages. However indirect also indicates the BASER
> capability to support or not 2 level tables. So I think it makes sense
> to read it on init.

Yes, you're right. As the spec says, the Indirect field "is RAZ/WI for
GIC implementations that only support flat tables".


Thanks,
Zenghui

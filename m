Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp142960lfq;
        Wed, 16 Dec 2020 00:09:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxL3AXWDGfQu81ZuJdkFfVmEm2UblmtQgv6Fq9Ygg7Ip23vmAfgjBfzVt0VG3SLEljTAnT
X-Received: by 2002:a25:2d68:: with SMTP id s40mr50161116ybe.163.1608106156689;
        Wed, 16 Dec 2020 00:09:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608106156; cv=none;
        d=google.com; s=arc-20160816;
        b=0/k1p1icz4z0F63UN8K0E6cbolEF3XSbfs40e99EfShdh0sKnQpoxPDxyb95d42EA3
         CfpKAYcnjc4YomsWExuhnizRJ+0JlVWWl7SgU0S7DRuP8PMKQ/V1zof3kmOrebyXMZZw
         a8v4XoUDcRzs3n2HWLCEU9y+lsXZGcOaQ192/sXlzHGsK7q5uaMscAmcfMCPgC1exjdG
         IE+3GW5cKuUkE1/o4z1iUJvFxK+ptM/kf+LBdjU2b7MIMeyP9u+0ter2rydIc/dMvL3Z
         PHNegXaUCF15TW1bB810swmrcWrTc97VLewfFqp5QstlWzrpnmv2XO3oI91F0y7WTng2
         TIdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=9x798vngASS9Pho6NhjNXiRz0n8nz6ai7M6kYaw4ze4=;
        b=QEqgkNMNi2t25Di+h0eD7kOCv41jz9+gYiMEbMV+Rw/NiCr2SA04tjz7p8ke6py2/w
         r4CjJO61o6CmGvPWcf+JXauuzJf4O9iQaTShEGm66OoJ2kzsgKrh/lTO4jJL/Lz+2iv1
         DoAQLzy7ge3SEhUp8rf7LtwUej6Ci79EVdwKchCGWojyvpZ1DH07vC0f/DAIXI+5ZOmE
         hwIO5XHV5ykx4pBsPXb3AW05HMJCnTWBCXyhpFzyD7DbfPMIFU0X2hP9cprZ6Krs8GzL
         QiGZA8D/IeT3tC3ZuyFZ9OWMBoGn+3WPyjAcOdzXJvunym2QQf86yc7LXKPLoLs5q9BZ
         fUgg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g3si685288ybk.368.2020.12.16.00.09.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Dec 2020 00:09:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kpRs4-0005vb-3M
	for alex.bennee@linaro.org; Wed, 16 Dec 2020 03:09:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kpRrt-0005vO-6C; Wed, 16 Dec 2020 03:09:05 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kpRrp-0003ec-Th; Wed, 16 Dec 2020 03:09:04 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cwnms2cztzkr5T;
 Wed, 16 Dec 2020 16:07:57 +0800 (CST)
Received: from [10.174.187.37] (10.174.187.37) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Wed, 16 Dec 2020 16:08:37 +0800
Subject: Re: [PATCH 1/2] accel: kvm: Fix memory waste under mismatch page size
To: Andrew Jones <drjones@redhat.com>
References: <20201215071948.23940-1-zhukeqian1@huawei.com>
 <20201215071948.23940-2-zhukeqian1@huawei.com>
 <20201215112049.sb6kq4elecm4g4zw@kamzik.brq.redhat.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <65da7947-d2ae-5814-aad9-c0c28b206a4a@huawei.com>
Date: Wed, 16 Dec 2020 16:08:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20201215112049.sb6kq4elecm4g4zw@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhukeqian1@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, jiangkunkun@huawei.com,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com, Zenghui Yu <yuzenghui@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B9+tybzKXS0e

Hi drew,

On 2020/12/15 19:20, Andrew Jones wrote:
> On Tue, Dec 15, 2020 at 03:19:47PM +0800, Keqian Zhu wrote:
>> When handle dirty log, we face qemu_real_host_page_size and
>> TARGET_PAGE_SIZE. The first one is the granule of KVM dirty
>> bitmap, and the second one is the granule of QEMU dirty bitmap.
>>
>> Generally speaking, qemu_real_host_page_size >= TARGET_PAGE_SIZE,
> 
> Not just generally speaking, but must be. We have
> 
>     /*
>      * On systems where the kernel can support different base page
>      * sizes, host page size may be different from TARGET_PAGE_SIZE,
>      * even with KVM.  TARGET_PAGE_SIZE is assumed to be the minimum
>      * page size for the system though.
>      */
>     assert(TARGET_PAGE_SIZE <= qemu_real_host_page_size);
Yes, I noticed it, but my statement (Generally speaking) is not suitable.
Thanks for pointing it out.

> 
> at the top of kvm_init() to enforce it.
> 
> The comment also says TARGET_PAGE_SIZE is assumed to be the minimum,
> which is more of a requirement than assumption. And, that requirement
> implies that we require all memory regions and base addresses to be
> aligned to the maximum possible target page size (in case the target
> actually uses something larger).
> 
> Please remove 'Generally speaking' from the commit message. It
> implies this change is based on an assumption rather than a rule.
> 
> (It'd be nice if we had these guest memory and TARGET_PAGE_SIZE
> requirements better documented and in one place.)
Maybe someone could do this :-)

> 
>> so misuse TARGET_PAGE_SIZE to init kvmslot dirty_bmap may waste
>> memory. For example, when qemu_real_host_page_size is 64K and
>> TARGET_PAGE_SIZE is 4K, this bugfix can save 93.75% memory.
>>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>> ---
>>  accel/kvm/kvm-all.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> index baaa54249d..c5e06288eb 100644
>> --- a/accel/kvm/kvm-all.c
>> +++ b/accel/kvm/kvm-all.c
>> @@ -620,8 +620,12 @@ static void kvm_memslot_init_dirty_bitmap(KVMSlot *mem)
>>       * too, in most cases).
>>       * So for now, let's align to 64 instead of HOST_LONG_BITS here, in
>>       * a hope that sizeof(long) won't become >8 any time soon.
>> +     *
>> +     * Note: the granule of kvm dirty log is qemu_real_host_page_size.
>> +     * And mem->memory_size is aligned to it (otherwise this mem can't
>> +     * be registered to KVM).
>>       */
>> -    hwaddr bitmap_size = ALIGN(((mem->memory_size) >> TARGET_PAGE_BITS),
>> +    hwaddr bitmap_size = ALIGN(mem->memory_size / qemu_real_host_page_size,
>>                                          /*HOST_LONG_BITS*/ 64) / 8;
>>      mem->dirty_bmap = g_malloc0(bitmap_size);
>>  }
>> -- 
>> 2.23.0
>>
>>
> 
> Besides the commit message
> 
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> 
OK, I will correct it and send v2 soon.

Cheers,
Keqian
> 
> Thanks,
> drew
> 
> .
> 

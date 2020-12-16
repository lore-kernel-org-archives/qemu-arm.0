Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp144506lfq;
        Wed, 16 Dec 2020 00:12:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7+zqB0GQpSj3CwECQkiHm8vBWLCe5eS3kKu1sen+BGH5EkXY9sNChbG0EOs4lFpNqeedM
X-Received: by 2002:a25:3102:: with SMTP id x2mr47226958ybx.495.1608106321317;
        Wed, 16 Dec 2020 00:12:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608106321; cv=none;
        d=google.com; s=arc-20160816;
        b=AMzxMf8iu/HqG2y/8M8Ld1mKnUm/A9iIWDtE2Hhj9ixQJdAhhI0bGX11j0JalgzHRs
         75CSMApzT59d47ybPt5otMHR3KAhpVGNE6Eh6QpwLpeuqsFbbrXRxG21otNNLYQ8j5K5
         f7P8rLTly/biDiE+e8oY6vmbJdFWNNLyFBxHmcpRROfHQfHsEmPe68oZYK2nZ1DBqbUi
         knqpf6XmQWPWEtpEZN9NAaVwJBCj3gzlaljMMg+K5IfwudBQglp8FY/XaN3XkvK6ONZP
         oy9AjreOxy62bX/FX8J2NqogbHhfXIx5URdhUoRp/IEGFxoKGcmuMauBVcwxocp8T7dQ
         Rmsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=wzxqJoEE1K5KSswVo5Fxvw8ZvYxCEINCBQ1XSrFcMQE=;
        b=zO088QPOtwC1IEeXczTAEb1Wdtc+3y2g2PkipmBhiTRTz+gh66ODlOZbcPBUQvbf2H
         0nYTOC5UShswSAP4Yyu/smFbnbA+5ozW44hynTUH+ApdQF6ftqiBby6uSAthgscXSpXr
         MzVQSq7jDCUE9LG6PMtYfEr0W+u3VyT0kFRBp+ti0eBrnOAz00i1kC8Vn4TiSOW4p9fD
         eRlatT7x9ZsdE8IlTj6RkXcFBxK1PiscSfwVLF5cYblSrVCr0L6J0X9FgeNve7MdLPeq
         OE6enEFVa+0mkjN52jnvofY8MQ15HlrfwEYM1El/BKmVi2+5MmpejiF2wd0JkEKQ7/6U
         CH2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p10si693420ybl.137.2020.12.16.00.12.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Dec 2020 00:12:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:32882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kpRui-0007B4-OQ
	for alex.bennee@linaro.org; Wed, 16 Dec 2020 03:12:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kpRua-0007Am-2w; Wed, 16 Dec 2020 03:11:52 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kpRuX-0004bE-5D; Wed, 16 Dec 2020 03:11:51 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CwnrQ2XYpzhrNG;
 Wed, 16 Dec 2020 16:11:02 +0800 (CST)
Received: from [10.174.187.37] (10.174.187.37) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Wed, 16 Dec 2020 16:11:31 +0800
Subject: Re: [PATCH 2/2] accel: kvm: Add aligment check for
 kvm_log_clear_one_slot
To: Andrew Jones <drjones@redhat.com>
References: <20201215071948.23940-1-zhukeqian1@huawei.com>
 <20201215071948.23940-3-zhukeqian1@huawei.com>
 <20201215115541.vgbt7aaiueyw7ury@kamzik.brq.redhat.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <c45cf7ff-9fc1-09fa-63b0-2753ab9419e3@huawei.com>
Date: Wed, 16 Dec 2020 16:11:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20201215115541.vgbt7aaiueyw7ury@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhukeqian1@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: DLQ3ePizVj5c



On 2020/12/15 19:55, Andrew Jones wrote:
> On Tue, Dec 15, 2020 at 03:19:48PM +0800, Keqian Zhu wrote:
>> The parameters start and size are transfered from QEMU memory
>> emulation layer. It can promise that they are TARGET_PAGE_SIZE
>> aligned. However, KVM needs they are qemu_real_page_size aligned.
>>
>> Though no caller breaks this aligned requirement currently, we'd
>> better add an explicit check to avoid future breaking.
>>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>> ---
>>  accel/kvm/kvm-all.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> index c5e06288eb..3d0e3aa872 100644
>> --- a/accel/kvm/kvm-all.c
>> +++ b/accel/kvm/kvm-all.c
>> @@ -701,6 +701,11 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
>>      unsigned long *bmap_clear = NULL, psize = qemu_real_host_page_size;
>>      int ret;
>>  
>> +    /* Make sure start and size are psize aligned */
>> +    if (!QEMU_IS_ALIGNED(start, psize) || !QEMU_IS_ALIGNED(size, psize)) {
>> +        return -EINVAL;
>> +    }
>> +
>>      /*
>>       * We need to extend either the start or the size or both to
>>       * satisfy the KVM interface requirement.  Firstly, do the start
>> -- 
>> 2.23.0
>>
>>
> 
> It's not clear to me that this function has any restrictions on start
> and size. If it does, then please document those restrictions in the
> function's header and assert rather than return.

Hi drew,

The following code implicitly expands the clear area when start_delta is
not psize aligned.

  start_delta /= psize;

Thanks,
Keqian


> 
> Thanks,
> drew
> 
> .
> 

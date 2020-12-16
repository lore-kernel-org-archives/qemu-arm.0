Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp147555lfq;
        Wed, 16 Dec 2020 00:17:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztVoW7e5tK7atEmzkhRMiJCt+LtZsLAYHbMxELM7F1sbFt7FTcb61YmNswB4fGLX1SHxIZ
X-Received: by 2002:a25:d146:: with SMTP id i67mr41885186ybg.9.1608106652675;
        Wed, 16 Dec 2020 00:17:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608106652; cv=none;
        d=google.com; s=arc-20160816;
        b=oGNYEzNffbPBsia20WAZk2kFJidtoUQTHD84U4uwL9w37ZfRrFNCjuVrExG+/4Vehm
         uJu4SZEEfw/056fvfT9zHPOIo/d/JPIS/79IDbdAcgRux/KTvwt0GLxiz8LeTzm4icQ/
         K7DA4S6VzBqCG/pBCN7CkdPPJlTeXD/jwp4zMiPQ4eaSO3SMBX5B8kj3+uZ8UIamDKrF
         EGrer2v9nMO0NN2ZsPafBN+qZfR9gous/L8jE2U/TuDohqmsk+a1s0ReOtotcqZCBj04
         QfMrKZHT1k6zeyFd3PSLykWSj0EKCmvONh0VPXpGWlQBlqJqjLIMzGxF3xrvVY5odd5t
         h/MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=9JtKRZD4pKCl72oURT5DIQ/7zduMsZj+bEVvNpxp2P4=;
        b=WHTun+F6TUTLSb6eL8s39tg6tbuR+TkskeAf2fNeUTfPb9PJgX0vM4VzFZoEnt6ELh
         OIHphCiRdrmSI95vDClI0Es9deJ7xJmndoXjk1KAGq9v8mBgvQBVQQcPMOCxIl6LBxcT
         7YzZtPgyDUgW48hmQFSUEdWnMFfD9yyeaWEzC9pI6LCJpBx+7YPKJ9YybbSWHwqSNzr1
         Gla2Jewd4StHg9dyDUSrjUoyLnr6yCHh+d/SuPy2GtlXaguGRzHRY7zIcXt5qmzAsAw5
         ZXOXCPSAlZTHmx/ztLkadfOItxyb9wQY3o6tROPWNC/MRJ3FRV9+q4WiGH5S0tYzffiI
         Ckwg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q82si623159ybc.334.2020.12.16.00.17.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Dec 2020 00:17:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kpS04-0001FW-30
	for alex.bennee@linaro.org; Wed, 16 Dec 2020 03:17:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kpRzw-0001FN-IR; Wed, 16 Dec 2020 03:17:24 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kpRzu-0006Tn-CT; Wed, 16 Dec 2020 03:17:24 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cwnz13MbBzhs3K;
 Wed, 16 Dec 2020 16:16:45 +0800 (CST)
Received: from [10.174.187.37] (10.174.187.37) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Wed, 16 Dec 2020 16:17:04 +0800
Subject: Re: [PATCH 2/2] accel: kvm: Add aligment check for
 kvm_log_clear_one_slot
To: Andrew Jones <drjones@redhat.com>
References: <20201215071948.23940-1-zhukeqian1@huawei.com>
 <20201215071948.23940-3-zhukeqian1@huawei.com>
 <20201215115541.vgbt7aaiueyw7ury@kamzik.brq.redhat.com>
 <20201216072358.bmac5twmtoyxcna3@kamzik.brq.redhat.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <f5646840-4a41-5598-b7fb-fb3660f91d62@huawei.com>
Date: Wed, 16 Dec 2020 16:17:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20201216072358.bmac5twmtoyxcna3@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=zhukeqian1@huawei.com;
 helo=szxga06-in.huawei.com
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
X-TUID: hBXYgaQHaCwi



On 2020/12/16 15:23, Andrew Jones wrote:
> On Tue, Dec 15, 2020 at 12:55:50PM +0100, Andrew Jones wrote:
>> On Tue, Dec 15, 2020 at 03:19:48PM +0800, Keqian Zhu wrote:
>>> The parameters start and size are transfered from QEMU memory
>>> emulation layer. It can promise that they are TARGET_PAGE_SIZE
>>> aligned. However, KVM needs they are qemu_real_page_size aligned.
>>>
>>> Though no caller breaks this aligned requirement currently, we'd
>>> better add an explicit check to avoid future breaking.
>>>
>>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>>> ---
>>>  accel/kvm/kvm-all.c | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>>> index c5e06288eb..3d0e3aa872 100644
>>> --- a/accel/kvm/kvm-all.c
>>> +++ b/accel/kvm/kvm-all.c
>>> @@ -701,6 +701,11 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
>>>      unsigned long *bmap_clear = NULL, psize = qemu_real_host_page_size;
>>>      int ret;
>>>  
>>> +    /* Make sure start and size are psize aligned */
>>> +    if (!QEMU_IS_ALIGNED(start, psize) || !QEMU_IS_ALIGNED(size, psize)) {
>>> +        return -EINVAL;
>>> +    }
>>> +
>>>      /*
>>>       * We need to extend either the start or the size or both to
>>>       * satisfy the KVM interface requirement.  Firstly, do the start
>>> -- 
>>> 2.23.0
>>>
>>>
>>
>> It's not clear to me that this function has any restrictions on start
>> and size. If it does, then please document those restrictions in the
>> function's header and assert rather than return.
>>
> 
> Also, I see this patch is on its way in
> 
> https://patchwork.ozlabs.org/project/qemu-devel/patch/20201215175445.1272776-27-pbonzini@redhat.com/

Hi drew,

Thanks for informing me. I see that they are not the same patch.
The above patch fixes 64-pages-alignment problem,
but this patch handles page-alignment problem.

Thanks,
Keqian
> 
> Thanks,
> drew 
> 
> .
> 

Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2522118lfm;
        Tue, 16 Jun 2020 04:20:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCJ4H0vkuVSvRIADj9d3UutmKbJ9sABduB/qSo9t+ac0evBdeKFZS7b7ik2NAdMT7lBLwi
X-Received: by 2002:a25:ce84:: with SMTP id x126mr3237971ybe.15.1592306455163;
        Tue, 16 Jun 2020 04:20:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592306455; cv=none;
        d=google.com; s=arc-20160816;
        b=hqccslJmICBwBagzzoi/c0oSs2h5lTOmIupIbJlTsb6RGS9uV4EI+iWo2t1Ju6km3D
         CmOs+Hrj+upNpYkeg9Zb91sdVTkhI29oEa3nYzL+JrVnfVY6iF/iD25wcay9rLVg0RAv
         TaROUhyH3HjXSvphP0+I61jUsQXe3TlfvFwmaB6wkSENaqdLluR/J+oHVHbRA6Ljc8zs
         9MzOugPx/QfCDQt2qnV3bSPzidibKKbCxwJ7tlN8/FUkKledkDSqF1nRLiNArP/mc4LS
         2ZFuy6HfvO2NXL6UnZRXozkNfih/CU2rerhppALw8T3QfZnFJ8hQte+kG+IkjloAcxYi
         1uzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=U2swGT9M50vq/VigUtDlxneExiootgyyIhy95mKxyRU=;
        b=cWF/S7uyvJzotFcPygTE9ODgK+RXMU9epyXia7xaHrMG8Hl4nylKKAr57SmaBOMpOx
         cYnZbjXSob5c79vXhcQSGnL7444RqcTg5d3lh5SwoszWRMEcVFHWwi8kp68uJ8k5gqF9
         +rB/vH/hp8pTPzRdDAcWiP0u4owpqQfIuy7ktl2aKrjM8MtRiX9j8IkufB6IyWb1SzNB
         DLIrQWFnpyIN52kaiLQDDS7r7A54ZNXQD9ur22Br5Y2aXpq3jo3cukKll2Tzq9QfmH7H
         us49Q7TLdmrh/oHHQFktzRWDxXZqB6FTdn8qLhvhX8BbOu2jTKHsFEPdP/D81dmLUkzJ
         yNCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11si15815613ybb.279.2020.06.16.04.20.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 04:20:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jl9eA-0004RU-EI
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 07:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1jl9dz-0004RH-Cv; Tue, 16 Jun 2020 07:20:43 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:46716 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1jl9dx-0001RE-B8; Tue, 16 Jun 2020 07:20:43 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id EB860E7551F678AD9DF0;
 Tue, 16 Jun 2020 19:20:33 +0800 (CST)
Received: from [10.173.221.230] (10.173.221.230) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Tue, 16 Jun 2020 19:20:25 +0800
Subject: Re: [PATCH v2] migration: Count new_dirty instead of real_dirty
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20200616021059.25984-1-zhukeqian1@huawei.com>
 <20200616093551.GA2790@work-vm>
 <3a45d5a0-3acf-336d-520f-523bf588b551@huawei.com>
 <20200616095846.GA2788@work-vm>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <05e4535c-b0e8-a0ec-36d6-769fdf5ce3d9@huawei.com>
Date: Tue, 16 Jun 2020 19:20:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20200616095846.GA2788@work-vm>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.221.230]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=zhukeqian1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 05:49:05
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: zhang.zhanghailiang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Chao
 Fan <fanc.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 jianjay.zhou@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XtRBberRtThJ

Hi Dave,

On 2020/6/16 17:58, Dr. David Alan Gilbert wrote:
> * zhukeqian (zhukeqian1@huawei.com) wrote:
>> Hi Dave,
>>
>> On 2020/6/16 17:35, Dr. David Alan Gilbert wrote:
>>> * Keqian Zhu (zhukeqian1@huawei.com) wrote:
>>>> real_dirty_pages becomes equal to total ram size after dirty log sync
>>>> in ram_init_bitmaps, the reason is that the bitmap of ramblock is
>>>> initialized to be all set, so old path counts them as "real dirty" at
>>>> beginning.
>>>>
>>>> This causes wrong dirty rate and false positive throttling at the end
>>>> of first ram save iteration.
>>>>
>>>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>>>
>>> Since this function already returns num_dirty, why not just change the
>>> caller to increment a counter based off the return value?
>> Yes, that would be better :-) .
>>
>>>
>>> Can you point to the code which is using this value that triggers the
>>> throttle?
>>>
>> In migration_trigger_throttle(), rs->num_dirty_pages_period is used.
>> And it corresponds to real_dirty_pages here.
> 
> OK; so is the problem not the same as the check that's in there for
> blk_mig_bulk_activate - don't we need to do the same trick for ram bulk
> migration (i.e. the first pass).
> 
Sorry that I do not get your idea clearly. Could you give some sample
code?

> Dave
> 
>> Thanks,
>> Keqian
>>
>>> Dave
>>>
>>>
>> [...]
>>>>
>>>>
>>> --
>>> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>>>
>>> .
>>>
>>
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 
> .
> 

Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2189231lfm;
        Mon, 15 Jun 2020 18:22:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRi3uOmCnmhN6BG+keDoknz8ybe4iZBrlZLjTwldXJiuQuC5CVXX2zCvnhfwaZznwEU/aa
X-Received: by 2002:a25:b8c6:: with SMTP id g6mr550398ybm.101.1592270576575;
        Mon, 15 Jun 2020 18:22:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592270576; cv=none;
        d=google.com; s=arc-20160816;
        b=lM7I/xnR5mmBHcCdGrftKjt3NqzpkMQVhcmbmtrrcWae1zwC+5IMZFubFtGNsAOgq/
         4q96QtRCFf4sl3gETbw0Qox31Z2i9pAdBmt9uJfaZ28oNJSKN71x6qKzp9/+A2NAADaN
         HJwmwogI+NB5R9jXBmJlCKNcpTpY8kBqZBGBjpEALMfkJwrEH8JT8lbCHfRoTeSZXlxc
         3B/Iz+uECpOOVHKj/Fof7lgNHHOxEC6YAd3QdakeNIPb//GqwAR818PQN27vA02Zc3tr
         e8913+dA8eWQ9nUoXepfi0IzP4wC6OpGtn/YLLifbHpJTI/OX/GmT/+2LSSNMN4LhuCJ
         /JuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=iraqiW7jnnqluFUvnChTreEGJyD1Z1yGpZZpcTHI6cI=;
        b=BRMJYBYYy1hT+S5CGANIcerSLg4RdcMn3Qt3txVc8E9ikb2k6lciIKYTEp/DvfWN0W
         wrieqCt4nIzELfPjFbtp4usLKFJt92XJK+R3Ef6fSHuxshm4Fv66VRNHTGUhJTt81tzw
         r9uFBCMBTxuEheTSM4AQpq6DMiX53CY88HdfRFtIIOiqHD8kUULVM2fjsdZgBetYplgU
         EoL8Tj2YIiHubYKyy5u5TmjAW13FsRvfpf3rI9EC/vp8PfD1Bvb2P11bUPqpo9GIk9sR
         1UcKiruiPZ3lUkO0r2KrKVXPsA1lg2OBO8lKrBcVk/+89vLZcpVC3N535x4UCAuYkJmF
         khaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 124si14733636yba.182.2020.06.15.18.22.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jun 2020 18:22:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jl0JU-0000PQ-00
	for alex.bennee@linaro.org; Mon, 15 Jun 2020 21:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1jl0JM-0000Nn-BV; Mon, 15 Jun 2020 21:22:48 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:49526 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1jl0JK-0003Kt-3x; Mon, 15 Jun 2020 21:22:48 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E3BD2B692E6F6C204C76;
 Tue, 16 Jun 2020 09:22:36 +0800 (CST)
Received: from [10.173.221.230] (10.173.221.230) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Tue, 16 Jun 2020 09:22:30 +0800
Subject: Re: [PATCH] migration: Count new_dirty instead of real_dirty
To: "Zhoujian (jay)" <jianjay.zhou@huawei.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Paolo
 Bonzini" <pbonzini@redhat.com>
References: <20200601040250.38324-1-zhukeqian1@huawei.com>
 <3205abb1-8e47-fc19-1213-ead621711291@huawei.com>
 <B2D15215269B544CADD246097EACE7474BD38EFD@DGGEMM528-MBX.china.huawei.com>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <33d07693-eb61-3ba1-b88b-c90bf10b8864@huawei.com>
Date: Tue, 16 Jun 2020 09:22:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <B2D15215269B544CADD246097EACE7474BD38EFD@DGGEMM528-MBX.china.huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.221.230]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=zhukeqian1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 21:22:37
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
Cc: "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 Chao Fan <fanc.fnst@cn.fujitsu.com>,
 "Huangweidong \(C\)" <weidong.huang@huawei.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5gxKHkOI1nKJ

Hi Jay Zhou,

On 2020/6/15 19:50, Zhoujian (jay) wrote:
> Hi Keqian,
> 
>> -----Original Message-----
>> From: zhukeqian
>> Sent: Monday, June 15, 2020 11:19 AM
>> To: qemu-devel@nongnu.org; qemu-arm@nongnu.org; Paolo Bonzini
>> <pbonzini@redhat.com>; Zhoujian (jay) <jianjay.zhou@huawei.com>
>> Cc: Juan Quintela <quintela@redhat.com>; Chao Fan <fanc.fnst@cn.fujitsu.com>;
>> Wanghaibin (D) <wanghaibin.wang@huawei.com>
>> Subject: Re: [PATCH] migration: Count new_dirty instead of real_dirty
>>
>> Hi Paolo and Jian Zhou,
>>
>> Do you have any suggestion on this patch?
>>
>> Thanks,
>> Keqian
>>
>> On 2020/6/1 12:02, Keqian Zhu wrote:
>>> DIRTY_LOG_INITIALLY_ALL_SET feature is on the queue. This fixs the
> 
> s/fixs/fixes
Thanks.
> 
>>> dirty rate calculation for this feature. After introducing this
>>> feature, real_dirty_pages is equal to total memory size at begining.
>>> This causing wrong dirty rate and false positive throttling.
> 
> I think it should be tested whether DIRTY_LOG_INITIALLY_ALL_SET is enabled
> in ram_init_bitmaps(maybe?) in order to be compatible with the old path.
Yeah, you are right ;-)

But after I tested old path yesterday, I found that the num_dirty_pages_period
becomes total ram size after log sync in ram_init_bitmaps. The reason is that
bitmap of ramblock is initialized to be all set, so old path counts them as dirty
by mistake.

This bug causes false positive throttling at the end of first ram save iteration,
even without our DIRTY_LOG_INITIALLY_ALL_SET feature.
> 
> Thanks,
> Jay Zhou
> 
>>>
>>> BTW, real dirty rate is not suitable and not very accurate.
>>>
>>> 1. For not suitable: We mainly concern on the relationship between
>>>    dirty rate and network bandwidth. Net increasement of dirty pages
>>>    makes more sense.
>>> 2. For not very accurate: With manual dirty log clear, some dirty pages
>>>    will be cleared during each peroid, our "real dirty rate" is less
>>>    than real "real dirty rate".
> 
I should correct these commit messages for reason above :-)
> 
> 
>>>
>>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
[...]

Thanks,
Keqian

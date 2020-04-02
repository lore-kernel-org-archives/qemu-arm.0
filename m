Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1740853lfi;
        Thu, 2 Apr 2020 02:33:01 -0700 (PDT)
X-Google-Smtp-Source: APiQypICGYjbid0cbFkoo00sG6LA8dBt6kkHNpZsQG4xWqpHT2Wck9amOfNaaOXA5X8SHeiFJ2SS
X-Received: by 2002:ac8:27a5:: with SMTP id w34mr1962140qtw.124.1585819981110;
        Thu, 02 Apr 2020 02:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585819981; cv=none;
        d=google.com; s=arc-20160816;
        b=RoI6LPLWHaB+7O1uDraOAByrjWiP2JN+D7a04JOegGeSKDk02H91Cau0itmyxjf60c
         4qYRM0LuZ499J/QCiH6j2KKRpNisswo51z3rM4pjDQdh8ae1H2oNMXxLbsZyFsVLwB2k
         x0NMS6h83mhGQl0OGxWg2UOVMa6LEji7U34TyxV68zqxYBFLgowwFQ4lQwlIelN1UBKg
         UlnIippbhvpyBbEUHURXJdE/Woyun48Hf5uY02Vh+EJ6pVaE3aR63wf8lYr353yAKpMl
         GUdgT/rrQgVpLzPHrrJ4lBiSf2xyTzaxoV+4CjQRqAR+PM2UtsvHw531NXtMma27/jQk
         z8uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=HnDarC/AdynZkrCvQUPI1790hVK26fGZ5xwbAYb670M=;
        b=y0A8DgYQyTh/PdKt25/+16+w+kd8PmquGjtEadL1JNu7vfI7CoBJDbNZ7LAyAL0E9+
         E6JmO6PNuM8Y72ksQuqsaBqAFVAtIU2LF9FYtTCQbAg2TdODu4XDykzCZsggEg51/uVV
         g//zKYu/YTj0Mv8aA68m7AxwzQF/fN1gyXK11tdF5YztqkbiZimcX54RcRjObW0TPAjl
         JMktVEIFuujlJk91P6mTcsTYDnnr0rYEfjffr2o7UL7oSFXQtM+P1JFvdgJqKetvfb7E
         g4+/tq167hledbG2+oAXEl44XYqD+6ZLviBdB5asI4++1O2TctMFngCl5QC+0AxFOpkZ
         hghA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r72si3023045qke.15.2020.04.02.02.33.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Apr 2020 02:33:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jJwDc-0004aF-Im
	for alex.bennee@linaro.org; Thu, 02 Apr 2020 05:33:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55267)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fangying1@huawei.com>) id 1jJwDR-0004Wn-Ni
 for qemu-arm@nongnu.org; Thu, 02 Apr 2020 05:32:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fangying1@huawei.com>) id 1jJwDQ-0007iW-Km
 for qemu-arm@nongnu.org; Thu, 02 Apr 2020 05:32:49 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:39780 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fangying1@huawei.com>)
 id 1jJwDQ-0007f8-8S; Thu, 02 Apr 2020 05:32:48 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id CD7A650762B37136DBA8;
 Thu,  2 Apr 2020 17:32:42 +0800 (CST)
Received: from [127.0.0.1] (10.133.205.53) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Thu, 2 Apr 2020
 17:32:32 +0800
Subject: Re: [PATCH v2] util/async: Add memory barrier to aio_ctx_prepare
To: Paolo Bonzini <pbonzini@redhat.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
References: <20200402024431.1629-1-fangying1@huawei.com>
 <2f8406fa-ae18-856b-938f-a804ff1b11c7@redhat.com>
From: Ying Fang <fangying1@huawei.com>
Message-ID: <f7744148-2c91-ca3d-b8d6-99d5efc19a57@huawei.com>
Date: Thu, 2 Apr 2020 17:32:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2f8406fa-ae18-856b-938f-a804ff1b11c7@redhat.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.205.53]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: fam@euphon.net, wu.wubin@huawei.com, qemu-stable@nongnu.org,
 stefanha@redhat.com, zhang.zhanghailiang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bz9VAWsJFo1W



On 2020/4/2 16:47, Paolo Bonzini wrote:
> On 02/04/20 04:44, Ying Fang wrote:
>> Normal VM runtime is not affected by this hang since there is always some
>> timer timeout or subsequent io worker come and notify the main thead.
>> To fix this problem, a memory barrier is added to aio_ctx_prepare and
>> it is proved to have the hang fixed in our test.
> 
> Hi Ying Fang,
> 
> this part of the patch is correct, but I am not sure if a memory barrier
> is needed in aio_poll too.
> 
> In addition, the memory barrier is quite slow on x86 and not needed there.
Yes, memory barrier has impact on performance here.

> 
> I am sorry for dropping the ball on this bug; I had a patch using
> relaxed atomics (atomic_set/atomic_read) but I never submitted it
> because I had placed it in a larger series.  Let me post it now.
Thanks for your job, we'd like to do some tests if you post it.

Thanks,

Ying
> 
> Thanks,
> 
> Paolo
> 
>>
>> diff --git a/util/async.c b/util/async.c
>> index b94518b..89a4f3e 100644
>> --- a/util/async.c
>> +++ b/util/async.c
>> @@ -250,7 +250,8 @@ aio_ctx_prepare(GSource *source, gint    *timeout)
>>       AioContext *ctx = (AioContext *) source;
>>   
>>       atomic_or(&ctx->notify_me, 1);
>> -
>> +    /* Make sure notify_me is set before aio_compute_timeout */
>> +    smp_mb();
>>       /* We assume there is no timeout already supplied */
>>       *timeout = qemu_timeout_ns_to_ms(aio_compute_timeout(ctx));
>>   
>>
> 
> 
> 


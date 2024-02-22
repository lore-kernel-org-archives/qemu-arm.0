Received: by 2002:a17:906:2317:b0:a3e:79c1:d636 with SMTP id l23csp215650eja;
        Thu, 22 Feb 2024 04:48:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU36lgJgAD4EXBcTSRovVnu3DjY+q1uw+seyjlN0dTORlgk0TkgapUGcJOOyeZ3AP/3P8dCZo7bVRKJ81n7NAofnLK3+8k8
X-Google-Smtp-Source: AGHT+IE8XQ6q0dVp3ihnn8vji4wa6/OL/axOAygJkSXmBiGebVCCK6S86/GU/wirOAiJu8U+i3Zd
X-Received: by 2002:ac8:7d41:0:b0:42d:bf4d:2943 with SMTP id h1-20020ac87d41000000b0042dbf4d2943mr27362362qtb.65.1708606129871;
        Thu, 22 Feb 2024 04:48:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708606129; cv=none;
        d=google.com; s=arc-20160816;
        b=GVQ4vuZkkOkzd+u7gZCZHlUiYb2vkIZZrGZmxaW8KeL86Vws3UJg+KuSUlDeZ2hVUs
         sAChrPwLJXBfNGabQL3y6XLyy3YemdexIHFNiLD96+/mQWLIHdfZYSV3WiUkjaPw49+g
         ls8gy1Nna/oS/XplKUOzo2N4bbh/kh3B56BY18KIklurPPjIEwlJr48XY2InLTcY1X82
         iwRGU9GI4iJzg60M0vYdgD9XjyBtYLMlbu+ExoQ3sNqN81Q7LAMpu6xAo50OjqeQ4ShS
         UhV6QgOndr8GZwQVH4ILDwrNJE/b0woeKx1duMo9tyQm7FJ8yzN3FXn1O7Xhqja87rVG
         9fug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=dY1SLNYtubL1bFAuBNga+zSMxB+Ij493wdfsC5YZ5yI=;
        fh=/TX5S8kgkt7/rBZYZ+crJ/+YKPw+5BFKLYKcqwsm7JU=;
        b=Ig1jqIowZxPx2dWs0v3SDDspeFphD2FEp8UeEFLQrFejh/KMvRNgwUj0IQk1YnHRDv
         a8kKDkOrS2v6SJrklq8gP5OX0hkcZpiU0gieWj4T2HFo9nC22nLjjneTFSFkjts4lwig
         URko/hT12EM74xXyJe0SQIaBM6MKl7wfH41kLyebWUjJD5sWqE2QTb6aH44pdaWhsc09
         dde5UrVV8pqTIMfofpCRAZW8B3/J4Y4aA0UtsjiM/tq2Xlys7wcqiTCdS/LVUz90WJvL
         ZubeN1JqL5nb6FkR9h/1P3tH1T9sA5g7aoZNFZy0Lov3SkErZzaDnFbfqGNYblaXgT0s
         Kmdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5-20020ac87605000000b0042e2263b151si6385602qtq.699.2024.02.22.04.48.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 04:48:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rd8VB-0002EU-6h; Thu, 22 Feb 2024 07:48:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rd8V7-00024E-7N; Thu, 22 Feb 2024 07:48:35 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rd8V4-0003nT-Jp; Thu, 22 Feb 2024 07:48:32 -0500
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4TgXw45GmSzNln7;
 Thu, 22 Feb 2024 20:47:00 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id EB3B51400E4;
 Thu, 22 Feb 2024 20:48:24 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 20:48:24 +0800
Message-ID: <6fc40d38-7ff8-56bc-d99f-4c82f8aa6444@huawei.com>
Date: Thu, 22 Feb 2024 20:48:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [RFC PATCH v2 11/22] target/arm: Set pstate.ALLINT in
 arm_cpu_reset_hold
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
 <20240221130823.677762-12-ruanjinjie@huawei.com>
 <d7b1af7a-e03e-4ed5-b66e-e08ef56209c2@linaro.org>
In-Reply-To: <d7b1af7a-e03e-4ed5-b66e-e08ef56209c2@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=ruanjinjie@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.172,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JDk/xSKizT43



On 2024/2/22 4:43, Richard Henderson wrote:
> On 2/21/24 03:08, Jinjie Ruan via wrote:
>> Set pstate.ALLINT in arm_cpu_reset_hold as daif do it.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>   target/arm/cpu.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 055670343e..e850763158 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -357,6 +357,10 @@ static void arm_cpu_reset_hold(Object *obj)
>>       }
>>       env->daif = PSTATE_D | PSTATE_A | PSTATE_I | PSTATE_F;
>>   +    if (cpu_isar_feature(aa64_nmi, cpu)) {
>> +        env->allint = PSTATE_ALLINT;
>> +    }
>> +
> 
> Reset value of ALLINT is UNKNOWN.
> I think you should drop this patch.

Yes. I have ignore the mannual comment.

> 
> 
> r~
> 

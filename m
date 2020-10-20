Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4724823lfa;
        Tue, 20 Oct 2020 05:08:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4xNNW3eQWLRiXcpmPYHkt8376A6VTFm/EeHwpwTCeqlffkNioP0ZjeErNfjcDoWZ2Sy3I
X-Received: by 2002:a25:4907:: with SMTP id w7mr3292277yba.272.1603195690572;
        Tue, 20 Oct 2020 05:08:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603195690; cv=none;
        d=google.com; s=arc-20160816;
        b=Jkk2QTkiTGnIzJVeML7tdhJfsN97pkTPitVwU5fDIfmTLu/x/zElv/OOGnve+8C/bP
         G+SuF27fnPiFqNibC9kZg4vFS0vXhpWx6M4im5gQr6Iogyn9lDwN2G2DrhsnkLVA3zXU
         1vl/PfZ0iiXiuR7EPQIq6CNZzucGZYv48hdvqy4zIFWmrvJ/3n+Ux0QNjnDuVcASbf+V
         YGOGz9wZELSGWYaAZitCvqvo8s7qQp3XczTUO/nrXvlBUZ6FZTbbz9VbGFqNiWpRX5im
         gbs7S4j0CYkGTYM5cM4Pj0F0k8ty+i3qogeaV8U9lrhfHdlbR5YAHhMGbLwhf6eSEZAi
         2jaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=7q+T7xQtBmeYDRPqcClZmNv9N/DqAjj99xoNWc+y/dA=;
        b=t6WOGIsydifX0oxHvCndkswbrf0mGBIwufjZRRlFXPf5K2klUHKuZcbaOks2QKeIHU
         TkzI5AbnonlM75CQHeCjJtT+ItP5tPHI9b51Bv0IEqRO6oDJLCzPcNzjn3Gu/JLAyYvp
         Pc3XVLUjYbrxol6Rx/vFVMJ+34stte+ywQYBvQs9rAVQ7cnd1pgngg6ws4S/wtPvVUtE
         G4DathS0xSTYdU6rb9ZpI4EeJk0CuEPM5bJo00OsAgtwarffaCtOHZaAp06kOj8HGPsc
         NSD46aoAZtat72bsDQKu99UyxOy7wo5k5rbApWwOwuGnSS/Yk/DEaWqdtGopIFambP1o
         g9hw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f35si1622527ybj.183.2020.10.20.05.08.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Oct 2020 05:08:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUqR0-0000fi-0C
	for alex.bennee@linaro.org; Tue, 20 Oct 2020 08:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kUqQs-0000eI-MX; Tue, 20 Oct 2020 08:08:02 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2549 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kUqQq-0006mb-2k; Tue, 20 Oct 2020 08:08:02 -0400
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.55])
 by Forcepoint Email with ESMTP id 663D6AEFE741CC3AE9CB;
 Tue, 20 Oct 2020 20:07:49 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Tue, 20 Oct 2020 20:07:49 +0800
Received: from [10.174.185.187] (10.174.185.187) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Tue, 20 Oct 2020 20:07:48 +0800
Subject: Re: [PATCH] microbit_i2c: Fix coredump when dump-vmstate
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20201019093401.2993833-1-liangpeng10@huawei.com>
 <786deb83-b6f4-d778-d5ed-19f3901ad211@redhat.com>
 <0c174303-50bc-128a-26ab-c062f98cd6cd@huawei.com>
 <d45ce658-f628-ae9d-1db2-68a14d815333@redhat.com>
From: Peng Liang <liangpeng10@huawei.com>
Message-ID: <db7b6e1e-bd6c-2092-ea7c-af8398e57526@huawei.com>
Date: Tue, 20 Oct 2020 20:07:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <d45ce658-f628-ae9d-1db2-68a14d815333@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.185.187]
X-ClientProxiedBy: dggeme704-chm.china.huawei.com (10.1.199.100) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=liangpeng10@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 07:17:20
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, joel@jms.id.au, xiexiangyou@huawei.com,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u4qldNF7Cp21

On 10/20/2020 7:27 PM, Philippe Mathieu-Daudé wrote:
> On 10/20/20 1:17 PM, Peng Liang wrote:
>> On 10/19/2020 6:35 PM, Philippe Mathieu-Daudé wrote:
>>> On 10/19/20 11:34 AM, Peng Liang wrote:
>>>> VMStateDescription.fields should be end with VMSTATE_END_OF_LIST().
>>>> However, microbit_i2c_vmstate doesn't follow it.  Let's change it.
>>>
>>> It might be easy to add a Coccinelle script to avoid future errors.
>>>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>
>>
>> I tried to add a Coccinelle script to add VMSTATE_END_OF_LIST() to the
>> end of VMStateDescription.fields.  For those who are not defined as
>> compound literals, it works well.  However, I cannot make it work for
>> those defined as compound literals.  And Julia doesn't think compound
>> literals are supported currently[1].  So maybe currently it's hard to
>> check the error using Coccinelle :(
> 
> Interesting.
> 
>>
>> Thanks for my colleague Biaoxiang Ye, who wrote a shell script to find
>> the errors, I didn't find other similar errors.
> 
> Thanks for giving it a try. We could commit and run the script
> in a gitlab-ci job to avoid such regressions.
> 

The script will report all fields not defined as compound literals as
errors (the number is much smaller than that of all
VMStateDescription.fields).

-- 
Thanks,
Peng

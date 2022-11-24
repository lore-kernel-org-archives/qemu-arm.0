Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp5143020ejx;
        Thu, 24 Nov 2022 06:59:02 -0800 (PST)
X-Google-Smtp-Source: AA0mqf442V3za49/advYDNERfoDxjOqMVVZnPEQLyAUpN9w4nJfBUAgvCzwCOguwFFhQ/ZmOzPkI
X-Received: by 2002:a05:620a:201c:b0:6ce:51a0:a80e with SMTP id c28-20020a05620a201c00b006ce51a0a80emr29141824qka.591.1669301941864;
        Thu, 24 Nov 2022 06:59:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669301941; cv=none;
        d=google.com; s=arc-20160816;
        b=Twh1ZXHc5tJAw1sCeHseIp/n7GD7AXysfHkY//Pqu4kek4BM4FOKInc9d/E/aeXMus
         Flqbb/Rd1f9TBOmxfUEj6xUgbRSHbY8yAIZywKPQEuD5f7QiOGeqF1NbAcmngiSapqi/
         QOkCb9QO39CmtATII2ME5XaLboWsSpUOUEFRXASeFzTni+X3n1PPf6YHtfGWu6uD39U4
         qa86cQcNmZsiC2RKwfovWiv4ne2p8C9PiEXeGjF9itG6FV0+0tlhiH0Z57dfhEyAfozI
         V9w51uMKQ2vRpUmHfgMwhGy8DJL9sLNi3+OVbGbOvhQ5TW0RzCgq73Zc5MMjAIeWt5wo
         oH5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=GnfUw5NLay2+jcsWTqMPWMoKj2InL5qNS2PyRaWxNe8=;
        b=I4V8VewKIyacsHKdRkDs9Egn5ZwDG/yZ1fzGOxvPLU3qbneMRrEyKI3RvH/6MwzDKn
         cfs4E6VYjepx5CXbPITA2KN/+lojJVf43gQC5PpTiYiS8cBuznwQX1pmk21RfklYKXq5
         galU3KEZHRe6/zP2DDFV2+Lm5d95nwP9E7Bdrb8r3jMJElBouB/009wkMDo3EsDw7kkT
         s7sVoDvv8s3Z1fOTofm7dwl9eCuf4EFBBGD+6rBa30Uv9Pa0XNabWcXH8Chhol3vxH6P
         RhHXAQFR52ePo8i8WpmtN+KdVlndoPQrbAUIVc5UENHObUINU7hiw6hmS1yQCVyxzw+a
         2Mhw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h7-20020ac85047000000b003a615be4b4esi663041qtm.510.2022.11.24.06.59.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Nov 2022 06:59:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oyDgh-0002jL-9b; Thu, 24 Nov 2022 09:58:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liyang281@huawei.com>)
 id 1oy5pR-0002YM-MS; Thu, 24 Nov 2022 01:35:21 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liyang281@huawei.com>)
 id 1oy5pP-0001LR-33; Thu, 24 Nov 2022 01:35:21 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NHpB90BCkzHw4g;
 Thu, 24 Nov 2022 14:34:25 +0800 (CST)
Received: from dggpemm500002.china.huawei.com (7.185.36.229) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 24 Nov 2022 14:35:02 +0800
Received: from [10.110.47.166] (10.110.47.166) by
 dggpemm500002.china.huawei.com (7.185.36.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 24 Nov 2022 14:35:01 +0800
Message-ID: <a80f31eb-f77b-1e66-b34e-4078200e7a24@huawei.com>
Date: Thu, 24 Nov 2022 14:35:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: arm: gdb-stub is broken by FEAT_HAFDBS
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Changbin Du
 <changbin.du@huawei.com>
CC: Richard Henderson <richard.henderson@linaro.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, Hui Wang <hw.huiwang@huawei.com>
References: <20221124033802.meuiphlcskwu3aty@M910t>
 <CAFEAcA_=5k0Q+90AwFtisjxgrj83wd5fVJv319v8ogewuNp=KQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_=5k0Q+90AwFtisjxgrj83wd5fVJv319v8ogewuNp=KQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.110.47.166]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500002.china.huawei.com (7.185.36.229)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=liyang281@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 24 Nov 2022 09:58:50 -0500
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
Reply-to:  "liyang (CJ)" <liyang281@huawei.com>
From:  "liyang (CJ)" via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gjinuG1kglZm



On 2022/11/23 19:59, Peter Maydell wrote:
> On Wed, 23 Nov 2022 at 11:38, Changbin Du <changbin.du@huawei.com> wrote:
>>
>> Hello, Richard,
>> We just noticed the gdb-stub is broken and probably caused by commit 4a3585568
>> ("target/arm: Plumb debug into S1Translate").
>>
>> (gdb) target remote :1234
>> Remote debugging using :1234
>> 0x000000000e1716d0 in ?? ()
>> => 0x000000000e1716d0:  Cannot access memory at address 0xe1716d0
> 
> Hi -- is this fixed by commit 26ba00cf58e9f21b08f (just landed
> upstream last night) ?
> 
I pulled the mainline  which contains your commit 26ba00cf58e9f21b08f.
The problem is fixed.

Thank you very much.
> thanks
> -- PMM

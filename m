Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp309432lfg;
        Thu, 28 Jul 2022 07:28:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sTNceE7a4LCkMrHswwHUDeJTpe8/mmkVB+qiEXZxlHM8QYobUBHZMtH7tqdVQxAcO/avS9
X-Received: by 2002:a05:620a:13cf:b0:6b5:ed16:fc69 with SMTP id g15-20020a05620a13cf00b006b5ed16fc69mr20761549qkl.416.1659018492650;
        Thu, 28 Jul 2022 07:28:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659018492; cv=none;
        d=google.com; s=arc-20160816;
        b=Q+jkiOwjQIp+q+tmE8AQQOiC8hLdPyH2jfma+jAOKBpPXZT/+1uK7Qpx5x+RXadQU2
         L/IjXCKAYV0wGDJazR+OL9go90VeW3wZWz+rmV49Dx08X+IJp7ECU4Q0uL+00YZx4+4s
         JWEvNlzFAmhHvtz5BFHRoyaHJCixHFYOjs2yL1WnbamECNy31HqcntBKJEZhOs0ADCKf
         sQQJjS4qN8a+eWtiZrtHFaNp7c3VzS7Ll3CQwJk+Ii+c9yx2DWn77am7rbrYFsT6EgZX
         wINaLKE6FaBP6D2y3rLbLMp5L2eipX2l9Em0thYRsGLIj4KtdI7KzxmgO2OKbBdh43R2
         x6Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=bpMeL2HKqIesN/RtTJe+QOc1WhcntGA2Sa48pKQL7ZE=;
        b=rVpPxG541BYFZ2AATaCGXghkT+eV4AmxC65WU+55kAC9a5QsLfAMKJ/8dL+Ymxqrbx
         3/sKv5J5Bh8N7leYEdOj+oYTdF88rulT91UkOcEnt2yEZuAZDBsQBnn8A5hQo/fb0wnt
         SpUerE3rFBdUfapRigC/dR60f9z27kSYiuAvw3OodllBVnkJQkFZPaHSQVsOBOZTSgWC
         X9aNwjetmqiyz+ATizmXj0yicqG9xPH3TsemfgYC9Kp/uS8+74blV0zdaI5OMiXyw2YD
         /1ZLU5oAQ0AuXtzrRzoTOaVvWLQZIzDZP1eSbnSZvAtxxh1gV22FpIsCp4Ne+fDoRDqh
         00aQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n17-20020a05622a041100b0031d362be5afsi578365qtx.766.2022.07.28.07.28.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jul 2022 07:28:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oH4Uk-0000Fe-BQ
	for alex.bennee@linaro.org; Thu, 28 Jul 2022 10:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oH414-0006PM-CE
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:57:30 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:41139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oH411-00044n-Ul
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:57:29 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.56])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 8861C11AFB39A;
 Thu, 28 Jul 2022 15:57:23 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 28 Jul
 2022 15:57:22 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006f6f3c7d4-ab78-4df1-aa1d-6d7cf1861403,
 D5C8B4ACC7AAF03C2427E421B0C3D41118C6E647) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.11.52.30
Message-ID: <6799cfc6-fd72-4061-0707-e5089a9ee50d@kaod.org>
Date: Thu, 28 Jul 2022 15:57:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 5/8] blockdev: Add a new IF type IF_OTHER
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
CC: Markus Armbruster <armbru@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 <richard.henderson@linaro.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <venture@google.com>, <Avi.Fishman@nuvoton.com>,
 <kfting@nuvoton.com>, <hskinnemoen@google.com>, <f4bug@amsat.org>,
 <bin.meng@windriver.com>, <qemu-block@nongnu.org>, <thuth@redhat.com>, Hanna
 Reitz <hreitz@redhat.com>
References: <20220714182836.89602-1-wuhaotsh@google.com>
 <20220714182836.89602-6-wuhaotsh@google.com> <87ilnuda33.fsf@pond.sub.org>
 <YuGMFRDj3tLOIJK7@redhat.com>
 <CAFEAcA-_TkDW4tPxvmwEt-Rr6VAr_7aWNX2++CE+1G5cBPtiBg@mail.gmail.com>
 <YuKPVi9UjmZVqw5a@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YuKPVi9UjmZVqw5a@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 3d71672f-7c1b-466f-b0cf-82e05dae74a5
X-Ovh-Tracer-Id: 10791469134254869380
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduhedguddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedvudejveeftefhhffgvdelteefgfejheelveeukeevheejhefffeehueeujeevheenucffohhmrghinhepmhgrihhlqdgrrhgthhhivhgvrdgtohhmpdhoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehhrhgvihhtiiesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a6vuamHcVM6K

On 7/28/22 15:29, Kevin Wolf wrote:
> Am 28.07.2022 um 11:46 hat Peter Maydell geschrieben:
>> On Wed, 27 Jul 2022 at 20:03, Kevin Wolf <kwolf@redhat.com> wrote:
>>>
>>> Am 18.07.2022 um 11:49 hat Markus Armbruster geschrieben:
>>>> An OTP device isn't really a parallel flash, and neither are eFuses.
>>>> More fast-and-lose use of IF_PFLASH may exist in the tree, and maybe of
>>>> other interface types, too.
>>>>
>>>> This patch introduces IF_OTHER.  The patch after next uses it for an
>>>> EEPROM device.
>>>>
>>>> Do we want IF_OTHER?
>>>
>>> What would the semantics even be? Any block device that doesn't pick up
>>> a different category may pick up IF_OTHER backends?
>>>
>>> It certainly feels like a strange interface to ask for "other" disk and
>>> then getting as surprise what this other thing might be. It's
>>> essentially the same as having an explicit '-device other', and I
>>> suppose most people would find that strange.
>>>
>>>> If no, I guess we get to abuse IF_PFLASH some more.
>>>>
>>>> If yes, I guess we should use IF_PFLASH only for actual parallel flash
>>>> memory going forward.  Cleaning up existing abuse of IF_PFLASH may not
>>>> be worth the trouble, though.
>>>>
>>>> Thoughts?
>>>
>>> If the existing types aren't good enough (I don't have an opinion on
>>> whether IF_PFLASH is a good match), let's add a new one. But a specific
>>> new one, not just "other".
>>
>> I think the common thread is "this isn't what anybody actually thinks
>> of as being a 'disk', but we would like to back it with a block device
>> anyway". That can cover a fair range of possibilities...
> 
> How confident are we that no board will ever have two devices of this
> kind?

The BMC machines have a lot of eeproms.

> 
> As long as every board has at most one, if=other is a bad user interface
> in terms of descriptiveness, but still more or less workable as long as
> you know what it means for the specific board you use.
> 
> But if you have more than one device, it becomes hard to predict which
> device gets which backend - it depends on the initialisation order in
> the code then, and I'm pretty sure that this isn't something that should
> have significance in external interfaces and therefore become a stable
> API.

Can't we use the drive index ?


There has been various attempts to solve this problem for the Aspeed
machines also. See below. May be we should introduce and IF_EEPROM for
the purpose.

Thanks,

C.

[PATCH v2] aspeed: qcom: add block backed FRU devices
https://www.mail-archive.com/qemu-devel@nongnu.org/msg900485.html

[PATCH] aspeed: Enable backend file for eeprom
http://patchwork.ozlabs.org/project/qemu-devel/patch/20220728061228.152704-1-wangzhiqiang02@inspur.com/

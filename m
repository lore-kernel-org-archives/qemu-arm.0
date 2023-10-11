Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp339134ejc;
        Wed, 11 Oct 2023 13:15:43 -0700 (PDT)
X-Received: by 2002:a1c:f710:0:b0:404:746e:c601 with SMTP id v16-20020a1cf710000000b00404746ec601mr18094833wmh.9.1697055342868;
        Wed, 11 Oct 2023 13:15:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697055342; cv=none;
        d=google.com; s=arc-20160816;
        b=al3qV0+/ZLWf7ruvNhe8v1dLETPIVoLp/4r2xXT7J+4A1oy7IIujugVPgdKhx6gIl/
         FTgh79wfURETu5Ler/B/AnWFwJyjTc2pBd9BjJiRl9kjA7h2AjUsT0bnOvGj9nJcUos/
         NOSd3mbmQAbhsu0yt0BXMrbe7NV7j8Po4YGqQ8CSmbeIu5iwxXqQsKeFMXmbgceW6b9J
         mS/kMa0H0C8JkHua1IDDh+eNS0fjAQ9CKnWXjwwHhzzKpd5KBUfDsSKzZknBDNAR/XjR
         G4cQc0tC8LMjADDAC9Fm9atWqXncMoy/uarYtQmPlQDuiWOtjg7rPNq85YQIWfyHUFvh
         FYQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=cW2iLJJrsUsD80CiFP4WOikPznomVj3lGYcCHAn3vTs=;
        fh=olzqHIW6+Xsc6NXvSeGLQgLypuJFEIqmf1lfrYv8SVc=;
        b=F5E2sS3Ms/wXTQGRrzPWsZS/AnVDiqP98Nt3v6CjpR+wuDRZ+0xPz2IKPaOv4y4BS7
         HP2hwFbUO6rhKY5b85TIg+6nPsO/HF9/mNFFmmFiDAGo8rq1alBDFa1u2gfKVROTAZYb
         B+MiJ0rA2Qr1nfflJqAJtYJixvtrvUpoVLBQgKGO9M85/wgRTkOqGZeVFHJWgmQdk7cY
         hyz14ddERGUiHpTDRvidzaVMd9G6qYv/pxmpDWDp6zg2dDAjfhSwtYcMsKhHBNOwoi+U
         4oseqKcqbJ3rrIZI1wvkbDfjfElusZ1neoyFJVPRbAlQRUuuSQMbp/jQzF1thoOiFqXU
         Co1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b="hn3gU/Zm";
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net
Return-Path: <salil.mehta@opnsrc.net>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p9-20020adf9589000000b0032164a11009sor1615991wrp.10.2023.10.11.13.15.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Oct 2023 13:15:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b="hn3gU/Zm";
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1697055342; x=1697660142; darn=linaro.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cW2iLJJrsUsD80CiFP4WOikPznomVj3lGYcCHAn3vTs=;
        b=hn3gU/ZmyR+5XlHePr14DTTXGKasRnRnDvTn1lI3csqDCFvElBUClhnXtOwVP5Ry05
         SEYDMGnWLnuNRcuH5o48ftG9KqJ01Sbs8JVGXecgFrNPn/Na8bx9b4QzN3BkJ/zwW5wW
         aS58zmjlVYKysRDWnpMCKmMu9Ia9bv86/3L+prgXHYdDqQYBB0FTO53eWVbdnyyhBT+q
         9RsZlK5pQVPVxwKtWmyAGpoI0hAAy3TcYtg7DqDVV90ggFteLgOiAyqpMUk2g05bL+Hk
         QDJhH+5wB9r9ysh+m464U5qt7uboIbr4QT7XolNUAF9TnHASdCTOr7X6FQU5vhavwaqb
         oJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697055342; x=1697660142;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cW2iLJJrsUsD80CiFP4WOikPznomVj3lGYcCHAn3vTs=;
        b=LsBuoUDM/G93fEPUrW/jNmliArDogVBa72EcRXkD9E8VELehE6AW8FA8haGIPS1G1/
         Cqmfmcsrg4o7JsoaOYVIUCaeM9IDT9zMiJiMXONSjMw9qrw0KxtXCBm/q6mtcHnB50WK
         qQD6T+9yKXMU2QXrbtCVKrlyjHxzzjeQboGsnQiF4ZsDZd4UzsfxTrah8PrWgEF7M/mt
         YBVbqZBnCuSl7AVU+e+1+0yqdEldllA84xddyFTRKnz2cXIUc+NBXXi+XrLTBV5W0zpi
         PAjbuJTCFwQ6RyrBgw9UvOcOo85RLfc0iB4K+V/DyOVzSp86ZyylJrcC0e7CrgR/7s2J
         of7w==
X-Gm-Message-State: AOJu0YzggObm0CFZ3mPD8RaJZnD4HOi9bdBIi/eU43xacWzroJoLPEfm
	YtQlSxdhIIIoFrJ8p/zmZYU3ZQ==
X-Google-Smtp-Source: AGHT+IEvgl9CiBFJpoKMOTVvPFZqC6tKbEoy0eevPrhGoRNQ61gsQGKH+qVNe8LVTTMJVKenWx/9zQ==
X-Received: by 2002:a5d:6909:0:b0:317:e542:80a8 with SMTP id t9-20020a5d6909000000b00317e54280a8mr21034113wru.15.1697055342292;
        Wed, 11 Oct 2023 13:15:42 -0700 (PDT)
Return-Path: <salil.mehta@opnsrc.net>
Received: from [10.8.0.16] ([185.223.232.243])
        by smtp.gmail.com with ESMTPSA id b3-20020adff243000000b0031431fb40fasm16363365wrp.89.2023.10.11.13.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 13:15:41 -0700 (PDT)
Subject: Re: [PATCH RFC V2 00/37] Support of Virtual CPU Hotplug for ARMv8
 Arch
To: Vishnu Pajjuri <vishnu@amperemail.onmicrosoft.com>,
 Salil Mehta <salil.mehta@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Cc: "maz@kernel.org" <maz@kernel.org>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "andrew.jones@linux.dev" <andrew.jones@linux.dev>,
 "david@redhat.com" <david@redhat.com>, "philmd@linaro.org"
 <philmd@linaro.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "will@kernel.org" <will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "mst@redhat.com"
 <mst@redhat.com>, "gshan@redhat.com" <gshan@redhat.com>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
 "ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
 "vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
 "karl.heubaum@oracle.com" <karl.heubaum@oracle.com>,
 "miguel.luis@oracle.com" <miguel.luis@oracle.com>,
 zhukeqian <zhukeqian1@huawei.com>,
 "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
 "wangyanan (Y)" <wangyanan55@huawei.com>,
 "jiakernel2@gmail.com" <jiakernel2@gmail.com>,
 "maobibo@loongson.cn" <maobibo@loongson.cn>,
 "lixianglai@loongson.cn" <lixianglai@loongson.cn>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <cfcca2d3-212e-2a90-1acc-1d23105c3804@amperemail.onmicrosoft.com>
 <c6eb2290323644e89c40c834bb934f62@huawei.com>
 <721d05b7-ee2b-999c-da72-d369483cfbb2@amperemail.onmicrosoft.com>
From: Salil Mehta <salil.mehta@opnsrc.net>
Message-ID: <22929591-ebea-9a6b-914f-9f21d43931df@opnsrc.net>
Date: Wed, 11 Oct 2023 21:15:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <721d05b7-ee2b-999c-da72-d369483cfbb2@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: YtdygHTa1Cp9

Hi Vishnu

On 11/10/2023 12:08, Vishnu Pajjuri wrote:
> Hi Salil,
> 
> On 11-10-2023 16:02, Salil Mehta wrote:

[...]

>>> From: Vishnu Pajjuri<vishnu@amperemail.onmicrosoft.com>
>>> Sent: Wednesday, October 11, 2023 11:23 AM
>>> To: Salil Mehta<salil.mehta@huawei.com>;qemu-devel@nongnu.org; qemu-
>>> arm@nongnu.org
>>> Cc:maz@kernel.org;jean-philippe@linaro.org; Jonathan Cameron
>>> <jonathan.cameron@huawei.com>;lpieralisi@kernel.org;
>>> peter.maydell@linaro.org;richard.henderson@linaro.org;
>>> imammedo@redhat.com;andrew.jones@linux.dev;david@redhat.com;
>>> philmd@linaro.org;eric.auger@redhat.com;will@kernel.org;ardb@kernel.org;
>>> oliver.upton@linux.dev;pbonzini@redhat.com;mst@redhat.com;
>>> gshan@redhat.com;rafael@kernel.org;borntraeger@linux.ibm.com;
>>> alex.bennee@linaro.org;linux@armlinux.org.uk;
>>> darren@os.amperecomputing.com;ilkka@os.amperecomputing.com;
>>> vishnu@os.amperecomputing.com;karl.heubaum@oracle.com;
>>> miguel.luis@oracle.com;salil.mehta@opnsrc.net; zhukeqian
>>> <zhukeqian1@huawei.com>; wangxiongfeng (C)<wangxiongfeng2@huawei.com>;
>>> wangyanan (Y)<wangyanan55@huawei.com>;jiakernel2@gmail.com;
>>> maobibo@loongson.cn;lixianglai@loongson.cn
>>> Subject: Re: [PATCH RFC V2 00/37] Support of Virtual CPU Hotplug for ARMv8 Arch
>>>
>>> Hi Salil,
>>>
>>> On 26-09-2023 15:33, Salil Mehta wrote:
>>>> [ *REPEAT: Sent patches got held at internal server yesterday* ]
>>>>
>>>> PROLOGUE
>>>> ========

[...]

>>> Tested on Ampere's platform for vCPU hotplug/unplug with reboot,
>>> suspend/resume and save/restore.
>>> Also tested for vCPU hotplug/unplug along with VM live migration.
>>>
>>> Please feel free to add,
>>> Tested-by: Vishnu Pajjuri<vishnu@os.amperecomputing.com>
>> Many thanks for this.
>>
>> As you are aware, we have now split above patch-set into:
>>
>> 1. Architecture agnostic patch-set (being reviewed below)
>>     https://lore.kernel.org/qemu-devel/20231009203601.17584-1-salil.mehta@huawei.com/#t
>> 2. ARM specific patch-set (Would soon be following as RFC V3)
>>
>>
>> If possible, can I request you to sanity test the Architecture
>> agnostic patch-set as well for regression and provide the
>> Tested-by Tag for this patch-set as well?
> 
> Sure, I'll do.


Thanks. I have added your tag in the architecture agnostic patch-set

https://lore.kernel.org/qemu-devel/20231011194355.15628-1-salil.mehta@huawei.com/ 



>> This is to ensure these changes if accepted do not break any
>> existing features.
>>
>>
>> Many thanks again for your past efforts all these times!
> It was great working experience with you.
> And my pleasure to contribute to new feature like vCPU hotplug on ARM64 
> platform.


You are welcome.


Cheers
Salil




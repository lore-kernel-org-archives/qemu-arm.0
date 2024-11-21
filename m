Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp4979567njc;
        Thu, 21 Nov 2024 13:46:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWB5O1KjCNxomxgSnN9hdj8I1DPSMiy4vLaP1JAUJVuaaB2qA0+yMb724H+Iz07rblhiX+BkzvjHVsaoA==@linaro.org
X-Google-Smtp-Source: AGHT+IFP9nmE8/7LiLpO8y+A6O73ZaYd+lVORaicV0RTCseib4c8uTd6ShQMqaXFAk+2Qgi1GXtA
X-Received: by 2002:a05:6122:1815:b0:514:e7c3:b886 with SMTP id 71dfb90a1353d-515004ec2fbmr557273e0c.3.1732225578328;
        Thu, 21 Nov 2024 13:46:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732225578; cv=none;
        d=google.com; s=arc-20240605;
        b=IidxRBYRgUPG8XRJCMqFHtVpgCs2Zifc5alB+sDRnCR4o7ZrksRIUEk0C8vybDC6KI
         v6ff673iRsJ4e3QT+gWYGLNrbRgdUYKUrjroMzCco+tkkCp0j8yUW/Gvowo25e8Ddo6E
         wGqxHmuQ5Qm/RwRhP53Op0fb8iWGRjbRTse506K++SPJQVFTYmHHP3oAqBx6eUrFGVzI
         d9UkB4BP2yPPSOBmL+ngrkZ38W9BQzAJCOl5GvVqbnAoNobjoDEX16ewT82MLUHPXDFQ
         g/EIMsuyFH4mc+DrwkZxTgtjDb19zHs+pid4nd/LHRWgfmYfXsrmNfm01d6i+iVhuhDe
         UI0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=aoP9X5/WXYDi3CAKaUX/uDhnqsjwwUUIkJkVbZ0bukE=;
        fh=aLRR4HF7wyG6BGbiHoejr8/rNjyJA7Y9P6HQJr7t0nQ=;
        b=iOnURJfnMCESSIvilyqAFQHn41r5NndOPFEzUBqHBepmbJNM93zuzERMAdK6CvijCM
         FIqChcoZurizum50dpSarjcBS87uBu7EidvmFrO2k+CWiXtF0A7M7X7c73rWpYukaNdQ
         dcSTgoFmEiEnFZlHVghyzqZKiwxpjya6jrK0OLcJDbz3WesPtfewH2XR4rYhmlUsijGM
         e78GXlPD4lokZBno9c2utAovuKGLkeJSvjrygnAnMv+sYZOLmkW31aADfNdh1XF0FjDw
         q9XLS8UZmHlhlJy7VoS+9z53IaUWbrimWQpVjCQl/YSgmUYlNHdeAht8miIMiY7ryfQ3
         wEvQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="HPbHKco/";
       spf=pass (google.com: domain of clg@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=clg@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <clg@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4653c3d6bbesi6771761cf.144.2024.11.21.13.46.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:46:18 -0800 (PST)
Received-SPF: pass (google.com: domain of clg@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="HPbHKco/";
       spf=pass (google.com: domain of clg@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=clg@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732225578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=aoP9X5/WXYDi3CAKaUX/uDhnqsjwwUUIkJkVbZ0bukE=;
	b=HPbHKco/mg/mjt3+0zez+evEFV81z1BqakqARW+w9CTqxqxtXeD2Jtvtcm9LnFIKyRoA2s
	vyq5CsabQLDqFbMX7OtuvpPGf6r7OfmnhBDBQLsj1Wg+ECbOSpKrkCG5rza+KW2j8ip7zP
	9AxxO+EAGhkcrAlVYdMbJHMAyOcwPZs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-H-j6lzunOh-YXMAHbHfFdA-1; Thu, 21 Nov 2024 16:46:14 -0500
X-MC-Unique: H-j6lzunOh-YXMAHbHfFdA-1
X-Mimecast-MFC-AGG-ID: H-j6lzunOh-YXMAHbHfFdA
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-382440c1f83so1322370f8f.1
        for <alex.bennee@linaro.org>; Thu, 21 Nov 2024 13:46:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732225573; x=1732830373;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aoP9X5/WXYDi3CAKaUX/uDhnqsjwwUUIkJkVbZ0bukE=;
        b=kLIAHVx6PzellwktkgXcbxz5XaKVXhAvRWYTQg7yP3y1fwi8QPGvzNIETZIaCs5RND
         KZU9Y3JznlNl4P8KuTERHUW3J1nFGGG+9iyP19lz2/CWhfoi7Bv86cAag7UiiW/zJ5NY
         +ikE0sfahxnOszDzjEZ3hzhQgdAwDc/ZaNuwgneO3EyxK3zKyEdgdvA9CbjWzD9JS2DB
         +8KEu9HjhYVC9djsooc7zNweJS0mDxSjphOJZPz7AxMHRAacWIK9Vx1zB4Cm5+FJl27w
         hfLPWjPiH5k+ik+wcXVNd30JoX4ynIow0xNkbzXU6/Yy3pfp6pSJFAfgILIxvB8g76Cw
         97ug==
X-Forwarded-Encrypted: i=1; AJvYcCWiSCaCRQq/YqwpaeJEoIplUysAlk9r5jx06/oBKqAzi+JsM4jEk+/SXn7ajYLgYy9zhtl8bF6HghMeSw==@linaro.org
X-Gm-Message-State: AOJu0Yw7OIkovIJh98HSIQVFnUK7JRFX78GcNQNUbhwJ7ZDpGoiN+anB
	3GjVHvTBxUWI/4TTXgDOixu81I8MX/5/XqzbAgdKrh0y6dW1PT1CScxttyTZr1LGWRfLevKrSfu
	boDVmA17lvIzCK3ggoB+USmTLIUC/YFPklsSPckvyDh+nhwdUIK2oIw==
X-Gm-Gg: ASbGncv8tpnAAHSBKYG6Avi4briK4GWuSJ4DGt0QUdwWTGROWciVt+luZWoRnHvojw8
	EI3ZVw3mBltowMjDMukHCpdrpVENKsxBvVUf5S/C/Qcn0e3ipgah92amgMpcHyRjToEa9MZYZFb
	mojyYw4DrwQEUFuTr/gjjZdlcjsRnHWkQO6224NyQpFAb3Mw3H0iBPWw65d/m2/QhBBml2QvVzm
	p8eh1q820MxsHnJaZ7lPEb3a6uBXLiRSmxRSsGSJJuFMhNIRLiYqf7dXV+hp9ytjAPXcNw6nzTj
	jA+/lmvb3zSc
X-Received: by 2002:a05:6000:1f8a:b0:381:f15a:e91 with SMTP id ffacd0b85a97d-382604ec295mr474565f8f.11.1732225573564;
        Thu, 21 Nov 2024 13:46:13 -0800 (PST)
X-Received: by 2002:a05:6000:1f8a:b0:381:f15a:e91 with SMTP id ffacd0b85a97d-382604ec295mr474558f8f.11.1732225573210;
        Thu, 21 Nov 2024 13:46:13 -0800 (PST)
Return-Path: <clg@redhat.com>
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c? ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbedf35sm618945f8f.99.2024.11.21.13.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 13:46:12 -0800 (PST)
Message-ID: <0cbbec0d-5be0-4ec2-8791-470c70d93e33@redhat.com>
Date: Thu, 21 Nov 2024 22:46:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/39] maintainer updates for -rc2 pre-PR
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-s390x@nongnu.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <2b8f6079-f2ca-471f-8580-43352437625d@redhat.com>
 <a3935ca8-5a44-4f2a-a414-aaa39f8e193c@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <a3935ca8-5a44-4f2a-a414-aaa39f8e193c@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yQOkD4LkG22KlOgWsFi9qxHUvOhg1RQpEQ5uTONepn4_1732225574
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: nz7dHEhWi8k0

On 11/21/24 20:10, Thomas Huth wrote:
> On 21/11/2024 20.03, Cédric Le Goater wrote:
>> Hello Alex,
>>
>> On 11/21/24 17:57, Alex Bennée wrote:
>>> This is a mostly testing focused set of patches but a few bug fixes as
>>> well. I plan to send the PR in on Monday. I can drop any patches that
>>> are objected to but I think its pretty safe.
>>>
>>> Contains:
>>>
>>>    - Daniel's clean-up of functional tests
>>>    - Another avocado->function conversion from Thomas
>>>    - Update the tuxrun baseline images
>>>    - Minor fix to the rust pl011 device
>>>    - Documentation clarification on identity
>>>
>>> The following could do with some review:
>>>
>>>    tests/functional: update the x86_64 tuxrun tests
>>>    tests/functional: update the sparc64 tuxrun tests
>>>    tests/functional: update the s390x tuxrun tests
>>>    tests/functional: update the riscv64 tuxrun tests
>>>    tests/functional: update the riscv32 tuxrun tests
>>>    tests/functional: update the ppc64 tuxrun tests
>>>    tests/functional: update the ppc32 tuxrun tests
>>>    tests/functional: update the mips64el tuxrun tests
>>>    tests/functional: update the mips64 tuxrun tests
>>>    tests/functional: update the mips32el tuxrun tests
>>>    tests/functional: update the mips32 tuxrun tests
>>>    tests/functional: add a m68k tuxrun tests
>>>    tests/functional: update the i386 tuxrun tests
>>>    tests/functional: update the aarch64 tuxrun tests
>>>    tests/functional: update the arm tuxrun tests
>>>    tests/functional: Convert the Avocado aarch64 tuxrun tests 
>>
>> Do you think we could include patches 2-4 from this series ?
>>
>> https://lore.kernel.org/all/20241112130246.970281-1-clg@redhat.com/
>>
>> Only patch 3 lacks a R-b.
> 
> I had a question on patch 3 and a suggestion on patch 4 ... could you maybe address them first? Thanks!

Oh Sorry I forgot.

I did address patch 4 in my tree ... In Patch 3, EXTRA_BOOTARGS was
added by Alex IIRC to work around the console issue. We ended up
adding the sleep call. I can resend tomorrow.

Thanks,

C.

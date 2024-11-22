Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5349810njc;
        Fri, 22 Nov 2024 04:32:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU08KCoJFi4TUZwS0UWXiqBPxrPPQu/emgC40Jfx0G6chvtCp423mvawKqm0O+t+ec10hS9GVZsDzz4XQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGoq+h4Ht5EiRLIdQ6WjrSqESomg76OYXdyzpH0svzsO00y9t3jyFYlsPueFfS0kSNV8qX4
X-Received: by 2002:ac8:5dc7:0:b0:45f:890c:5f49 with SMTP id d75a77b69052e-4653cdbea29mr48961611cf.24.1732278775072;
        Fri, 22 Nov 2024 04:32:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732278775; cv=none;
        d=google.com; s=arc-20240605;
        b=b+F4YrKbZyBX0f/ZlkaP5sKbFzxJGubPnlPpWZlXL9QMN/7SlXcv2/V6fVJTz4lUDv
         ufJrCFEYFfJMRHetye0vySgKZsmWw9hfyBD59AQvxv33vYVIdyblIWmUlix1fBLVRIBh
         1in7SWuv6kZo8vrFuG1Q+cyWoCMty+Rlu2vrh8F2b3wp57sKxBoXxOPyFgI2xtIpncHq
         AzYu2SkpRqUYPNLcQ5DJl6/f7EIfSH9xBU8R8agW8m3OpIq/X7jz5awtxXq4R7GGpvOM
         M1hmQVrA+12nTWH28uPWCQfOtIOds4LbLlwWMYWRf6cIpdSAPEF3xiyV6YnxpwHlQ+DR
         Brog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=7dcLeRfvRq84WfdwQfYsnrrCw4UsQMiHXXPRYpseIFw=;
        fh=JtegCmojwK4TIoVhuWEZjz6cgv6McX8nv0ZkXc2SHEE=;
        b=ghBzTOl97BNIyQaQXQotNm2A+u5OQzxkAZZI2mQBxpNGZlsqMuRKHTXXbMZWjGXxZ+
         paYx8FbI9dCjcA96Vrv1r1jAF0NqjAMcZ5y0B8PwIxpTxl9s1eaPiSzwEk2HO0kkMCcH
         B109XPZZfHDYnyENxWDqPHrpW6rYZ+kxmE3neZG+3rnDSzof8ZohyE0aFh2l1H7OEaV/
         M4I6RrJZJ05OGHo+gYxUaAXafQQaHj5vwPCtIx73THcBeK6NA57Umq55VSdziDGYxLas
         NtITRXIXKb6N3K3erHhn3DcdnSu7ludqx7A+P27ZUWiqgKjtQPj9mDWhqGTjrNgWmfpl
         5yyw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eEECV1jO;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4666fd3b702si909591cf.41.2024.11.22.04.32.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 04:32:55 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eEECV1jO;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732278774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7dcLeRfvRq84WfdwQfYsnrrCw4UsQMiHXXPRYpseIFw=;
	b=eEECV1jO0BsXGyxkY6t7milXrxJ7XEsGTyOODJ0lsl9jI6p4NKlVK9wxGcstnAwVMl+vJp
	eY9V+tBRKsOvXxhG5VfrmXCSaIsV37OeRbPKicRXPUxh67nzS0kjvvAdPYLhuLYA7tiD16
	SnHGGgQ3rszCQjIQsFjBUyeJFpvIKuQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-nSFUVKolMmmdYw5x5mKtqg-1; Fri, 22 Nov 2024 07:32:52 -0500
X-MC-Unique: nSFUVKolMmmdYw5x5mKtqg-1
X-Mimecast-MFC-AGG-ID: nSFUVKolMmmdYw5x5mKtqg
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43157e3521dso13780325e9.1
        for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 04:32:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732278771; x=1732883571;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dcLeRfvRq84WfdwQfYsnrrCw4UsQMiHXXPRYpseIFw=;
        b=eP4n5A0K7/+9FSxF4DzUto0acHEFJfi9y5liG9aRxoAYjNH6X596ZLP4f1I1KcFiGH
         ytJ3m+kOLr3L79iyfQlw77YlqJPRjdIAd/mhLTS//wINHdt2Qcv+k9F+J6BYoM63rdR4
         bO7YOPC+omWhqh6QdOefai8h99TtGVP2YDmXofIqKvixZTCMCk2HGBFB7MOTW3JKWDYY
         8rcmBKV3jeiHK+rqh5taeaKAuxOxYWYxJwwkQX94W4zmRFz0cWLbI2i/8E7J5GRM5W6B
         bWn+mwi2uqAD/IIdm59m6FoowCCnhf9s0rP6g+IQOSYWH01NLC8iEzraDoLy4EMH4+Oa
         qLyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsjH1P0td+jwqU+IJYooAPS+aiD3THA7eXQifbGrrTy4PqOEAZFewUe3/NhYbPkO44dRtDxCAbYGoYug==@linaro.org
X-Gm-Message-State: AOJu0YwkmxsDjqSpSiYvR/Aqby/aqSLKNtQVUCH+5aKl/JZUN9sz4hYb
	D5PZKuwJrS+9isd/s7MuYpfC0Rr+UvnP5qflrPIcTkO2SMtN0mFX6S1PEGCaCw7gls/fSkC9LiV
	d/4K5Gko0o9N4zVD8X0O6mmW9WwCeETBJ5+JcumXk2DApOZTboGcfWA==
X-Gm-Gg: ASbGncttx0+k3O3l+QkGsCE6fhNI/ulM35mdMA15DCM9n+qBNdulvlLea41T7Z3T2k6
	5gzbM4HabAm2hNPRYTCQM94iW7FVRmW7d+vbZc2d0KZuTt6CUiD+QiVTtkBLkneFWZidOT1J+sW
	ecyqlnrJ+t7C6HzIZgXWe4nr/GFGyIbfnhGGkUkCIbR4kGG0q3F0QzsjVKmc/Ebx1o+LhrOQxPU
	Tk1ktYx3JqMHkJVCzXsI/FlQLV78z4k5qptQCnEaTs0Cc14gL+0MKLvR4gWuIXWzQcGiMDQjB4=
X-Received: by 2002:a05:600c:1c24:b0:426:6f27:379a with SMTP id 5b1f17b1804b1-433ce42560amr24531745e9.13.1732278770898;
        Fri, 22 Nov 2024 04:32:50 -0800 (PST)
X-Received: by 2002:a05:600c:1c24:b0:426:6f27:379a with SMTP id 5b1f17b1804b1-433ce42560amr24531385e9.13.1732278770526;
        Fri, 22 Nov 2024 04:32:50 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.206] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fb2685csm2339929f8f.46.2024.11.22.04.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 04:32:50 -0800 (PST)
Message-ID: <6133bd27-7907-4f7d-b3ef-94d7f17785c1@redhat.com>
Date: Fri, 22 Nov 2024 13:32:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/39] maintainer updates for -rc2 pre-PR
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
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
 <0cbbec0d-5be0-4ec2-8791-470c70d93e33@redhat.com>
 <ae1ee2e9-4be2-49ae-a5dc-2bc6e72a8506@redhat.com>
 <f30aa80f-613e-4a01-94ce-b2779349ece7@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <f30aa80f-613e-4a01-94ce-b2779349ece7@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Tqmo4j1R8ybeQATdEnpvm4Ka7IFGdauubS1DJB0ka70_1732278771
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 4/dIBzyEUVrl

On 22/11/2024 12.59, Cédric Le Goater wrote:
> On 11/22/24 11:47, Thomas Huth wrote:
>> On 21/11/2024 22.46, Cédric Le Goater wrote:
>>> On 11/21/24 20:10, Thomas Huth wrote:
>>>> On 21/11/2024 20.03, Cédric Le Goater wrote:
>>>>> Hello Alex,
>>>>>
>>>>> On 11/21/24 17:57, Alex Bennée wrote:
>>>>>> This is a mostly testing focused set of patches but a few bug fixes as
>>>>>> well. I plan to send the PR in on Monday. I can drop any patches that
>>>>>> are objected to but I think its pretty safe.
>>>>>>
>>>>>> Contains:
>>>>>>
>>>>>>    - Daniel's clean-up of functional tests
>>>>>>    - Another avocado->function conversion from Thomas
>>>>>>    - Update the tuxrun baseline images
>>>>>>    - Minor fix to the rust pl011 device
>>>>>>    - Documentation clarification on identity
>>>>>>
>>>>>> The following could do with some review:
>>>>>>
>>>>>>    tests/functional: update the x86_64 tuxrun tests
>>>>>>    tests/functional: update the sparc64 tuxrun tests
>>>>>>    tests/functional: update the s390x tuxrun tests
>>>>>>    tests/functional: update the riscv64 tuxrun tests
>>>>>>    tests/functional: update the riscv32 tuxrun tests
>>>>>>    tests/functional: update the ppc64 tuxrun tests
>>>>>>    tests/functional: update the ppc32 tuxrun tests
>>>>>>    tests/functional: update the mips64el tuxrun tests
>>>>>>    tests/functional: update the mips64 tuxrun tests
>>>>>>    tests/functional: update the mips32el tuxrun tests
>>>>>>    tests/functional: update the mips32 tuxrun tests
>>>>>>    tests/functional: add a m68k tuxrun tests
>>>>>>    tests/functional: update the i386 tuxrun tests
>>>>>>    tests/functional: update the aarch64 tuxrun tests
>>>>>>    tests/functional: update the arm tuxrun tests
>>>>>>    tests/functional: Convert the Avocado aarch64 tuxrun tests 
>>>>>
>>>>> Do you think we could include patches 2-4 from this series ?
>>>>>
>>>>> https://lore.kernel.org/all/20241112130246.970281-1-clg@redhat.com/
>>>>>
>>>>> Only patch 3 lacks a R-b.
>>>>
>>>> I had a question on patch 3 and a suggestion on patch 4 ... could you 
>>>> maybe address them first? Thanks!
>>>
>>> Oh Sorry I forgot.
>>>
>>> I did address patch 4 in my tree ... In Patch 3, EXTRA_BOOTARGS was
>>> added by Alex IIRC to work around the console issue. We ended up
>>> adding the sleep call. I can resend tomorrow.
>>
>> IMHO v4 looks fine now ( https://lore.kernel.org/qemu- 
>> devel/20241122090322.1934697-1-clg@redhat.com/ ) in case you want to pick 
>> it up, Alex.
>>
>>   Thomas
>>
> 
> Here is a check-functional run with this series and the v4 I sent :
> 
>    https://paste.debian.net/1336417/
> 
> This system is fast so the timeouts are more certainly tests failures :
> 
>    func-sh4-sh4_tuxrun        ?
>    func-rx-rx_gdbsim         https://gitlab.com/qemu-project/qemu/-/issues/2691

Both tests are marked with QEMU_TEST_FLAKY_TESTS, so yes, it's likely the 
flakiness of the tests.

  Thomas


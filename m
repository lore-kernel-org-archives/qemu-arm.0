Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5370289njc;
        Fri, 22 Nov 2024 05:04:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV6M3WH50PiRQMpVR7aRc4iC/pag1NGjStdiMCXjDaw+COB4AnN52sQ2iFC2H2wd877XNlf0YuRHUKAdw==@linaro.org
X-Google-Smtp-Source: AGHT+IGgQdwVenXOel3e2xLNhPJB2vUj0oe+FqaW8T78e3IbbPM+cyUS9/lgykS7ddB0o+5j4j+H
X-Received: by 2002:a05:6358:93a8:b0:1c2:fe94:abda with SMTP id e5c5f4694b2df-1ca796d05bdmr218073155d.5.1732280669133;
        Fri, 22 Nov 2024 05:04:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732280669; cv=none;
        d=google.com; s=arc-20240605;
        b=kM0iRta5A/X42PBo/ELQDE3o4tgDiRmuempwLnzmHjcPnufG5JPyhQKojYyirVnbPC
         LPlwC4GTg6PsTTepq5YI+i/zLq8zIh/D5I3LgbloKeD9s0RI19qYRyvru3msQ5gjKJ4K
         ZSZerfNG/AAK8SLOTFLgxzxK/0s8twayRnTSBQSqEg+vDM+A5ak9Cgtst0xpZcTujbYV
         8B1McD/mPNlwyfLTHW/FsmpIdAVtj4Je8Do8OIwP8xmyxfR8tnihapp3dTvu+z0XlNyc
         alAkRrJCxG0kClQa/U9NAWw1nulde5zOlf+Vx64HRSvRJ6ipMPIJAtJW9Jk/5GBvWx1i
         VFpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=dGzjvgzq8KWj8WAMo63XMBdeB5ZawNYYWPmG0JX7Dxg=;
        fh=4vw5x3Ck8AeGZeS7exQk1dDiS4doIhl/IYTYy0IqQ8A=;
        b=DaXgMJ6m6BFQlgblgjfaEdx5rO61zxd9AI+sjlbyo4f4hOs9AukbnfrpKfDA/snver
         cfShwV5pMpNz8pJix5pSE/VO7gF8ISvq3Cy2H9mKIsFhs6Aq5EEaOLky382IlwEmkvta
         jVUeB6tvN92/5ako3X3ZQ8X0Iorq7iGUycuhSyfFs31xN2bO629jxlLxob3JgG23HtdF
         WZwHL33hs4P80b8rESVo3V0DN9b8P1x16KbqN4ypmTlYhTYE6B1PK0gMomn0zjZI2f0U
         aTAWjp9wwU2Olf54Sk+MbXQCGynSSpMo7ZeKecdGpbVtmWV9KjtVn4Zi4biYYIKdN9mq
         biTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hd45xRHF;
       spf=pass (google.com: domain of clg@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=clg@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <clg@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4adda75c2a6si747255137.650.2024.11.22.05.04.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 05:04:29 -0800 (PST)
Received-SPF: pass (google.com: domain of clg@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hd45xRHF;
       spf=pass (google.com: domain of clg@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=clg@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732280668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dGzjvgzq8KWj8WAMo63XMBdeB5ZawNYYWPmG0JX7Dxg=;
	b=hd45xRHFHTNzxIuqBrUUhDGUNXtps22LdJ+Ot7iiJhB5qo4m2V6Uh94+OBhcUkf9b2vaBw
	6fwf5hglh+lwGz8ewU2lrTDW6zRFzttbBbpm9pYRcH7YeEcdRQUxFjZFVg+xjhObTu3ApB
	TBS0huMAEu4BjJdDCeggfkUDpTCY7ZQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-czCD88-XMDe0Mbd652RMzg-1; Fri, 22 Nov 2024 08:04:27 -0500
X-MC-Unique: czCD88-XMDe0Mbd652RMzg-1
X-Mimecast-MFC-AGG-ID: czCD88-XMDe0Mbd652RMzg
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4315eaa3189so18283235e9.1
        for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 05:04:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732280666; x=1732885466;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGzjvgzq8KWj8WAMo63XMBdeB5ZawNYYWPmG0JX7Dxg=;
        b=B4Nk11VmwFRRaHIEnPAP9fz6v3kIXKYt+PbxJEphaMMWERgpJXQlZMhtUrWxH+q3GO
         JqygRMf2R2wFrf6sHKc0CPIEihbXcEz3eJUrbPhORefxmsQ2tjvICFkHMQ+eel6LVPtK
         OyWLYmFpiPWzU96jRGaUpvPBgSbEZ1Sph6h+sui/JjnjvLccsrT2vdViGlJRlGgMrmF8
         LDScu7dSJiyAzbt4IS8FiwNdoqwajpU987ZTwuPTBCZgmVUmHQ6ESqL+LUODwIxtMwlM
         30diDjKPq1F8OGqFRRWQBi5xm367NSfcMgAfq2sB7UdTnyG2dJsQejw+Uv72UEa4DB8f
         ty1w==
X-Forwarded-Encrypted: i=1; AJvYcCUkNV4A/NsY0aWkX9Qfyxi1sxnlqghN9b+jYwBr5Ft5mTYRQJGx6xqhunPXtFXvASDWf0hgFyvSdIGurg==@linaro.org
X-Gm-Message-State: AOJu0Ywtri67Gfduz9aVfzmGyjgrkBQFiqczvraCMkdwOLFkc7kzIV75
	+idIxGAmawYYXLmz72m2OGoMtiDWAAclA9TONtfoE5uSuQcZhOmObNd3lq2mEaoQjYY5fJHMeP9
	gE0QXocRhU5LX7kySqC/oiCjlFnQsLlCol1UWqTKD1ZZERPmrTWiLjQ==
X-Gm-Gg: ASbGncvyUva+zUIIXkuyfFL2Bf8/TkPF3SbudBrgS0EJMOr8W1xXbNJRQqPLTKacmkb
	5+OBTBq1LWIEPsidd2NpD42H+8li8kSi6ad93D9NtybAm1/dYvzSmkk4NFzZq9TAGRyE3r26jD1
	W7iYZ7eTnymWXEi+koTrMLDZHXNd0Njl2zGnHBIp0yCZhBIvVlPBCAkLExldcc49ewSVOgxM/LQ
	0rakQxGgvsLr3b012JDUUyyhk24PHI5h6izJ39LvHJ9OUqLnR/H7n0D/mNpuBCS8dC/zkrvgPEI
	r+HAooNlUI8m
X-Received: by 2002:a05:600c:5102:b0:431:5ba1:a520 with SMTP id 5b1f17b1804b1-433ce410300mr28683185e9.3.1732280666288;
        Fri, 22 Nov 2024 05:04:26 -0800 (PST)
X-Received: by 2002:a05:600c:5102:b0:431:5ba1:a520 with SMTP id 5b1f17b1804b1-433ce410300mr28629435e9.3.1732280620995;
        Fri, 22 Nov 2024 05:03:40 -0800 (PST)
Return-Path: <clg@redhat.com>
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c? ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b45bdafbsm89742165e9.17.2024.11.22.05.03.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 05:03:34 -0800 (PST)
Message-ID: <02049f8d-0be1-4c3d-ac71-68f36ee3a985@redhat.com>
Date: Fri, 22 Nov 2024 14:03:31 +0100
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
 <0cbbec0d-5be0-4ec2-8791-470c70d93e33@redhat.com>
 <ae1ee2e9-4be2-49ae-a5dc-2bc6e72a8506@redhat.com>
 <f30aa80f-613e-4a01-94ce-b2779349ece7@redhat.com>
 <6133bd27-7907-4f7d-b3ef-94d7f17785c1@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <6133bd27-7907-4f7d-b3ef-94d7f17785c1@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ved5_eoPBOOqEuJKqJtKjiLMu_LNzCusOYLwFBsOc0w_1732280666
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: cvoCGd352PG1

On 11/22/24 13:32, Thomas Huth wrote:
> On 22/11/2024 12.59, Cédric Le Goater wrote:
>> On 11/22/24 11:47, Thomas Huth wrote:
>>> On 21/11/2024 22.46, Cédric Le Goater wrote:
>>>> On 11/21/24 20:10, Thomas Huth wrote:
>>>>> On 21/11/2024 20.03, Cédric Le Goater wrote:
>>>>>> Hello Alex,
>>>>>>
>>>>>> On 11/21/24 17:57, Alex Bennée wrote:
>>>>>>> This is a mostly testing focused set of patches but a few bug fixes as
>>>>>>> well. I plan to send the PR in on Monday. I can drop any patches that
>>>>>>> are objected to but I think its pretty safe.
>>>>>>>
>>>>>>> Contains:
>>>>>>>
>>>>>>>    - Daniel's clean-up of functional tests
>>>>>>>    - Another avocado->function conversion from Thomas
>>>>>>>    - Update the tuxrun baseline images
>>>>>>>    - Minor fix to the rust pl011 device
>>>>>>>    - Documentation clarification on identity
>>>>>>>
>>>>>>> The following could do with some review:
>>>>>>>
>>>>>>>    tests/functional: update the x86_64 tuxrun tests
>>>>>>>    tests/functional: update the sparc64 tuxrun tests
>>>>>>>    tests/functional: update the s390x tuxrun tests
>>>>>>>    tests/functional: update the riscv64 tuxrun tests
>>>>>>>    tests/functional: update the riscv32 tuxrun tests
>>>>>>>    tests/functional: update the ppc64 tuxrun tests
>>>>>>>    tests/functional: update the ppc32 tuxrun tests
>>>>>>>    tests/functional: update the mips64el tuxrun tests
>>>>>>>    tests/functional: update the mips64 tuxrun tests
>>>>>>>    tests/functional: update the mips32el tuxrun tests
>>>>>>>    tests/functional: update the mips32 tuxrun tests
>>>>>>>    tests/functional: add a m68k tuxrun tests
>>>>>>>    tests/functional: update the i386 tuxrun tests
>>>>>>>    tests/functional: update the aarch64 tuxrun tests
>>>>>>>    tests/functional: update the arm tuxrun tests
>>>>>>>    tests/functional: Convert the Avocado aarch64 tuxrun tests 
>>>>>>
>>>>>> Do you think we could include patches 2-4 from this series ?
>>>>>>
>>>>>> https://lore.kernel.org/all/20241112130246.970281-1-clg@redhat.com/
>>>>>>
>>>>>> Only patch 3 lacks a R-b.
>>>>>
>>>>> I had a question on patch 3 and a suggestion on patch 4 ... could you maybe address them first? Thanks!
>>>>
>>>> Oh Sorry I forgot.
>>>>
>>>> I did address patch 4 in my tree ... In Patch 3, EXTRA_BOOTARGS was
>>>> added by Alex IIRC to work around the console issue. We ended up
>>>> adding the sleep call. I can resend tomorrow.
>>>
>>> IMHO v4 looks fine now ( https://lore.kernel.org/qemu- devel/20241122090322.1934697-1-clg@redhat.com/ ) in case you want to pick it up, Alex.
>>>
>>>   Thomas
>>>
>>
>> Here is a check-functional run with this series and the v4 I sent :
>>
>>    https://paste.debian.net/1336417/
>>
>> This system is fast so the timeouts are more certainly tests failures :
>>
>>    func-sh4-sh4_tuxrun        ?
>>    func-rx-rx_gdbsim         https://gitlab.com/qemu-project/qemu/-/issues/2691
> 
> Both tests are marked with QEMU_TEST_FLAKY_TESTS, so yes, it's likely the flakiness of the tests.
> 
>   Thomas

func-sh4-sh4_tuxrun runs fine with :
  
@@ -46,10 +46,8 @@ class TuxRunSh4Test(TuxRunBaselineTest):
                           console_index=1)
          self.vm.launch()
  
-        self.wait_for_console_pattern("Welcome to TuxTest")
-        time.sleep(0.1)
-        exec_command(self, 'root')
-        time.sleep(0.1)
+        self.wait_for_console_pattern("tuxtest login:")
+        exec_command_and_wait_for_pattern(self, 'root', 'root@tuxtest:~#')
          exec_command_and_wait_for_pattern(self, 'halt',
                                            "reboot: System halted")

Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5291989njc;
        Fri, 22 Nov 2024 02:47:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXp9wlYfmcOrGql8B4OtaDbC3vdE9BMVk1eiC2cCWj00oMOKlKfC64yEAHbQFb0E1SWq9/8+Qmu0NNBjg==@linaro.org
X-Google-Smtp-Source: AGHT+IEHK/0bhwUWIfdTTXbJQPk1vNl8tHKDtGO2Apcoc1zlIsocm1a9v7pF2eMvElNglv2IuiLh
X-Received: by 2002:a05:6214:27c1:b0:6d4:586:6292 with SMTP id 6a1803df08f44-6d450feaf50mr30140536d6.26.1732272457583;
        Fri, 22 Nov 2024 02:47:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732272457; cv=none;
        d=google.com; s=arc-20240605;
        b=d3XpBudtWFH5UviQhXKxHlVVdzLXtJzu+KWKQq6JBf6WiE2jCRynq7iMcBj7nqEEwL
         I8omsASC4X43Y92hZjrX1Fyg6A8XKMnGNgbbEilA/9f67h//HxZ4b+KnvNuj4O/+khGb
         /yPtxzojXyPZlkRKLmnIrHqTk8aQFSlFO69KPsts87hS6oPsEFcQCK0vG2iDq3JmozrW
         FjumtG/MyoOmBnFQDNVH7x8WvlORugsNsKCrNWpfCM4Qk79BtUs6Xhdk0JzYF+S40Q3G
         wE67MA5+3FzfrhyXwSrSztG83UPnYea7oz6Qw6Cd+OvabHQTpm15fs52G+FYsdA3T1fh
         0Ujw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=EjhUJp9WVm3oviZK5yosiicB8UpQmbESDlz+6oezQj0=;
        fh=t5c4/O8IhyLrdBA5dvE50d9J2OrtBHX2EU6eL0s2JFI=;
        b=N/LF9Jei1JLsGB7YJA/R6MCTAyZDLvZCanA9azhsjA1k5pYqjnPhXi9u/OAVQ2XUSM
         PW3C4s5pGnfhPxtjU87hmNrY/SQzxA6ithnwiEENRKE47gtIWlQk8uYlxRehZ2kOVzbX
         1/N09+E9FHKqvF/ffNrJ/iBySGGdIafaaIHYruityQmsAfqoVmTErBwoY6GQyhMsYhOG
         PtkXFhS4Z7HadwA18zVgW6QWweQDXH7L1G6c4uec4DQHt5gITG+29YF55DSv2nWL5XBp
         k2DifgxlurXZN1W9iRkVVqLDBc+5nCew0swQzr+dlriLq3GbAA+wf3DqFA7rm0tYevcu
         TMDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eib91B3F;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d451b49bbdsi17221796d6.317.2024.11.22.02.47.37
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 02:47:37 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eib91B3F;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732272457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=EjhUJp9WVm3oviZK5yosiicB8UpQmbESDlz+6oezQj0=;
	b=eib91B3Fcoc9BC/9O744sqcTQPNN5yMJlQ+wIKEa2CpBk2Tw9/Jt5EMfEfkG5fu3PU6VaP
	A8kQteV7j2ZOhv/sjDqEMWFAJSGCFxa0RArLLXTxMneLdwGdfYOtK7b7xGORWh7AmfVd/2
	9K/F0nudfr7hRDx/Y7Pp+frYlAUevFQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-SImJOBUiMM2y6C1DTAPzdw-1; Fri, 22 Nov 2024 05:47:36 -0500
X-MC-Unique: SImJOBUiMM2y6C1DTAPzdw-1
X-Mimecast-MFC-AGG-ID: SImJOBUiMM2y6C1DTAPzdw
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-460d76f1d7eso28270871cf.2
        for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 02:47:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732272455; x=1732877255;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EjhUJp9WVm3oviZK5yosiicB8UpQmbESDlz+6oezQj0=;
        b=Z9IkdgAoomWnWHRNDtNj7LZKjFcLm2MA3yoF13XIJ04Mc2g2KoDByClmgvUahqLv5R
         kvMHheAMQsF4nu0Geiyl9SieY5uanvQejzGqEvN8rynteSk2xnuRT1BaXEFgZXiF7yDK
         dTKhHydH3Hu5T0sFZdpO1duakIuBNcIxpGxBu7L1VZSr0ZHSosNi1eICkHYhQHI4rUnZ
         WxaE7BCCoNH6lM7b+42LJVXA0CMhg5RmjtBW6CJ3neukrgYxhaHRy9MoqryHrIGnvQsV
         0e+CLNIVTjvllQIIOlI3+Md8/NxHClkL7XBNbAqhsPctii2rsim0RivNd99Kb2/9dH0Y
         HKzw==
X-Forwarded-Encrypted: i=1; AJvYcCXsSgV3KgoScpl7CgpGj9ujU92Y+1WfX63eG1PJDIgxFtwUJtXZWLu0zg+bo3bcPdoiAZTjIcaemU2WSg==@linaro.org
X-Gm-Message-State: AOJu0YyKaDRGI4OFf3mekgxPA/8awFTfdgrVMrWSAmkdnwhPgRG+tXhq
	O39jAGYw0abZI81eThEa0S9w1WwKdIOsU9nSdLwpgd2auB43gtNLKgJK+Q4KwCmAu02oAAQLM9d
	UgNl0GXMvNBtJ3JxjS478ZwwwtGlfbZNTBbKbmFL/cRTjiqVvayYB7Q==
X-Gm-Gg: ASbGnctcLpPC2W6lDsTUORI0k4Y4iprShKgn/r5gtNzZG+lFYoJ6CWif6Vs5ewg8ca0
	YbXTe5nq+UQfPgHZaWhxnigwTM/2M6lsdjQ/4tYOqs1wYl6k4ItpyVKSypV9oQ/uktW5J7Ye6Ys
	+Mk2+t+q+d5wYdaUpcD1f+OjiZ8J0aWobtOnhSlfRdqrJttDW72Z3IMeMr73sHIDCHSBE1/4J8L
	RANCU7pj+qWIAgEsVHORMwS0lJTutJ1N+fhBOyvyZ0OeDWNQzLY4ZNJ9r1/V+MGoeF3MPR7ePg=
X-Received: by 2002:a05:622a:1929:b0:463:9183:8515 with SMTP id d75a77b69052e-4653d568c93mr27324791cf.20.1732272455591;
        Fri, 22 Nov 2024 02:47:35 -0800 (PST)
X-Received: by 2002:a05:622a:1929:b0:463:9183:8515 with SMTP id d75a77b69052e-4653d568c93mr27324361cf.20.1732272455262;
        Fri, 22 Nov 2024 02:47:35 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.206] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4653c3d7240sm9960521cf.7.2024.11.22.02.47.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 02:47:34 -0800 (PST)
Message-ID: <ae1ee2e9-4be2-49ae-a5dc-2bc6e72a8506@redhat.com>
Date: Fri, 22 Nov 2024 11:47:29 +0100
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
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <0cbbec0d-5be0-4ec2-8791-470c70d93e33@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WQ1mHSOH_umz4TwRUXf5s_7wytcaiCF7cS4e7RVTb2E_1732272455
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: u0ZscjEvdOs6

On 21/11/2024 22.46, Cédric Le Goater wrote:
> On 11/21/24 20:10, Thomas Huth wrote:
>> On 21/11/2024 20.03, Cédric Le Goater wrote:
>>> Hello Alex,
>>>
>>> On 11/21/24 17:57, Alex Bennée wrote:
>>>> This is a mostly testing focused set of patches but a few bug fixes as
>>>> well. I plan to send the PR in on Monday. I can drop any patches that
>>>> are objected to but I think its pretty safe.
>>>>
>>>> Contains:
>>>>
>>>>    - Daniel's clean-up of functional tests
>>>>    - Another avocado->function conversion from Thomas
>>>>    - Update the tuxrun baseline images
>>>>    - Minor fix to the rust pl011 device
>>>>    - Documentation clarification on identity
>>>>
>>>> The following could do with some review:
>>>>
>>>>    tests/functional: update the x86_64 tuxrun tests
>>>>    tests/functional: update the sparc64 tuxrun tests
>>>>    tests/functional: update the s390x tuxrun tests
>>>>    tests/functional: update the riscv64 tuxrun tests
>>>>    tests/functional: update the riscv32 tuxrun tests
>>>>    tests/functional: update the ppc64 tuxrun tests
>>>>    tests/functional: update the ppc32 tuxrun tests
>>>>    tests/functional: update the mips64el tuxrun tests
>>>>    tests/functional: update the mips64 tuxrun tests
>>>>    tests/functional: update the mips32el tuxrun tests
>>>>    tests/functional: update the mips32 tuxrun tests
>>>>    tests/functional: add a m68k tuxrun tests
>>>>    tests/functional: update the i386 tuxrun tests
>>>>    tests/functional: update the aarch64 tuxrun tests
>>>>    tests/functional: update the arm tuxrun tests
>>>>    tests/functional: Convert the Avocado aarch64 tuxrun tests 
>>>
>>> Do you think we could include patches 2-4 from this series ?
>>>
>>> https://lore.kernel.org/all/20241112130246.970281-1-clg@redhat.com/
>>>
>>> Only patch 3 lacks a R-b.
>>
>> I had a question on patch 3 and a suggestion on patch 4 ... could you 
>> maybe address them first? Thanks!
> 
> Oh Sorry I forgot.
> 
> I did address patch 4 in my tree ... In Patch 3, EXTRA_BOOTARGS was
> added by Alex IIRC to work around the console issue. We ended up
> adding the sleep call. I can resend tomorrow.

IMHO v4 looks fine now ( 
https://lore.kernel.org/qemu-devel/20241122090322.1934697-1-clg@redhat.com/ 
) in case you want to pick it up, Alex.

  Thomas

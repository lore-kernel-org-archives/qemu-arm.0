Received: by 2002:a05:7022:213:b0:8f:43c:4b5e with SMTP id 19csp4351978dll;
        Thu, 21 Nov 2024 11:11:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU0DZe4FFei6yueN/m5Aesx/HStpe1OkVHonB10URrDXpuTaiBdHEPZvXxK5pEYMLPJ3G+ixAZmM530zg==@linaro.org
X-Google-Smtp-Source: AGHT+IE7oIG7antSN1PYKlD8DgTyATcMiiuYNquNv6o7TBUCyDXoj2ZZbgDE+hx9z0Nmgbsd3CF6
X-Received: by 2002:a05:6214:27ee:b0:6d4:1d9b:1561 with SMTP id 6a1803df08f44-6d450e6d1demr5013286d6.10.1732216266824;
        Thu, 21 Nov 2024 11:11:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732216266; cv=none;
        d=google.com; s=arc-20240605;
        b=Et+KyBIV7Thu++LHBWvIYpre+Qlihce+SyQGI+Wgsizlvy7JmoECu69xm68+wIOQO/
         KYwnLzMzzF0Y+TekT5iTrsYees4wqsakeQvcwXUnb5GvleIeP3kJMkHnI2bbbQn2wOMS
         zjvb3dVZlL62/h/vhoAp5mffBiHDkMCzyGoJz9UP5kWUS2LlkYhRTDpdWzdlNA8qAr8F
         5+MJEAq9g7ygvY9K2u9hMMYH0nynxoF9T1mDQ1ZU2k9QkDu9RvXh4EHPEf0OYIR18wh6
         4F5cfOZ1bsAQkT6JtOjmwzHK2v4+DrmNySBn9d56UxQmG6vlfhL1fEVCqIBUmLKAX0n/
         HFcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=jyCeNK40uxV9ePAceiXTo3bwxTN5xQG8pM7HNZY5mG4=;
        fh=rR40jaLn2uUhdaL8edOup8es3OcdiDTlm/cgjohMbQM=;
        b=CKSxfj1IteIlO4ongZi4tDlPTDxtmLq9/9roxPk5RfSYntXbhp6wiHTyTwFCTbC3Da
         lU/SIjTBT0Pz0OQGfBKITI/9MxSdCgvcEPuadWWPJdQsbNl/w5oIF4Q+cd+pU/Ze7ZeD
         dCEiutH4a/CgQlN10vFEhRBuGAk7t+bxcQPFSLkTvHI/It3WO2J/C+T1CWTcTZe4sOlr
         uIHtSwKiY5UTScC03xJzF0H9XgUCDKzIrnORA9rcfiUFpooW4hDo2NKO9T9/337trVKz
         Q5U62uxvrPSp4O5S3mcgTGybc0ym1IoBI63MiOiBlY3VjtQWp+Wl40nfy8RvdHZdIMhP
         D6sA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ae8D0Th0;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d451b8c192si1089596d6.547.2024.11.21.11.11.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 11:11:06 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ae8D0Th0;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732216266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jyCeNK40uxV9ePAceiXTo3bwxTN5xQG8pM7HNZY5mG4=;
	b=Ae8D0Th0RICvKb/dMaokxeE0tpUTY1DRYZKgN/bSwqzNeKQTad1/9RwXzUyXADcZ689v8b
	xFerQKNbsBrV45A+WCh+8g8JBZnzoIH7KKfJuC+5OQOW2kRLhVJ5Rzmt0kLptnmiiwE9Jr
	aqeVm+SRNpsIPw4srTSJ9zfyxA3etqw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-0TplVfiqNwuXPHvUlgnZnw-1; Thu, 21 Nov 2024 14:11:05 -0500
X-MC-Unique: 0TplVfiqNwuXPHvUlgnZnw-1
X-Mimecast-MFC-AGG-ID: 0TplVfiqNwuXPHvUlgnZnw
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5d00e170f0dso632230a12.2
        for <alex.bennee@linaro.org>; Thu, 21 Nov 2024 11:11:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732216264; x=1732821064;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jyCeNK40uxV9ePAceiXTo3bwxTN5xQG8pM7HNZY5mG4=;
        b=pbOdSe+/A87xj5UHpLIvv41uTTy6X3RUsQUP0uLC7gnYdS/kIOFj0Oe6TNZlthFs0l
         bQNLKggUFPbeN3Wzuy9M1DzODJZkYps0kBI8GNF+A5ctmHpYokArJURI1tm4fPAd99Rv
         CkiyiZ5n+dYSdLicTa++lygFbT5ciAkKFYsUwNZkUqRsFBihB0+TvS/CTf5xAnTlq4Ls
         8fl6HHn7UxNHjO+deTm5Fhui/DmWRWCwjgXetasFVsSUip/KBAsaZrMSQIJOqcBW9+uZ
         RaEDsV0N/nGUHw49c7qhQNs4SoSh/qEhwQwg9vdF84g7xYnAb3mNCeh8nrk09pY4HvU4
         4Kcw==
X-Forwarded-Encrypted: i=1; AJvYcCXBVigDdU01pWSw3eSXfy5tVyLPvGScAX7fiIBzTJXF2AxbcakgV5tBtOuq1Gpwj9b9A2IhpIcZIDtKUg==@linaro.org
X-Gm-Message-State: AOJu0YzjQH7NEenAJgk7GLS8Nme27xWcNFO0rDqyztFYCquF19rbzXPl
	W4xdehSlaDBLzQVQSR+KAeu4eUgXdr7gedqxJvvpKLgcJQtsmj3Pgx9lQfgeXQTUrdhtHvv/OyW
	bKRATN8N1MBZmdTCPGvQjQtNBjFzRNs9Nm+Y4txd7UwvZkRspr15wqQ==
X-Gm-Gg: ASbGncvUatVN0p3UwA1HjFo3GZmUvFJBt9LDOWnuWhWbLeBlvPznHH7eWyEBGu945EA
	O6+eoslE8cF9kKTinUG4jnrGO/h2lDENMmDxqT54IHttiLOagg9ZG4KKkyIA2fKp4qbXB4pUJcT
	+X6qQad96Ij6sWVvjBnhp4Zj9dBRhn2ycM2iQ1KMFWRg/0PIU1TnEgeMi7jmprHB4TRCS529yEj
	qNDbWBSp0u3zK86YBaVstVo8OWyp/RMsfu8FCBCyJ/f5xsybbALPeWabcs2Z/gYz5zzp+e8SaR5
	8DM=
X-Received: by 2002:a05:6402:1e89:b0:5cf:d333:eb75 with SMTP id 4fb4d7f45d1cf-5cff4cd134amr7112856a12.27.1732216264063;
        Thu, 21 Nov 2024 11:11:04 -0800 (PST)
X-Received: by 2002:a05:6402:1e89:b0:5cf:d333:eb75 with SMTP id 4fb4d7f45d1cf-5cff4cd134amr7112815a12.27.1732216263651;
        Thu, 21 Nov 2024 11:11:03 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-51-70.web.vodafone.de. [109.42.51.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d41d5basm85347a12.89.2024.11.21.11.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 11:11:02 -0800 (PST)
Message-ID: <a3935ca8-5a44-4f2a-a414-aaa39f8e193c@redhat.com>
Date: Thu, 21 Nov 2024 20:10:59 +0100
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
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <2b8f6079-f2ca-471f-8580-43352437625d@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jFM7obyRXqEWyOdn2X87TvEdk7xVRcXhb0t_NDq20zY_1732216264
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: DzZlnJgjuKNJ

On 21/11/2024 20.03, Cédric Le Goater wrote:
> Hello Alex,
> 
> On 11/21/24 17:57, Alex Bennée wrote:
>> This is a mostly testing focused set of patches but a few bug fixes as
>> well. I plan to send the PR in on Monday. I can drop any patches that
>> are objected to but I think its pretty safe.
>>
>> Contains:
>>
>>    - Daniel's clean-up of functional tests
>>    - Another avocado->function conversion from Thomas
>>    - Update the tuxrun baseline images
>>    - Minor fix to the rust pl011 device
>>    - Documentation clarification on identity
>>
>> The following could do with some review:
>>
>>    tests/functional: update the x86_64 tuxrun tests
>>    tests/functional: update the sparc64 tuxrun tests
>>    tests/functional: update the s390x tuxrun tests
>>    tests/functional: update the riscv64 tuxrun tests
>>    tests/functional: update the riscv32 tuxrun tests
>>    tests/functional: update the ppc64 tuxrun tests
>>    tests/functional: update the ppc32 tuxrun tests
>>    tests/functional: update the mips64el tuxrun tests
>>    tests/functional: update the mips64 tuxrun tests
>>    tests/functional: update the mips32el tuxrun tests
>>    tests/functional: update the mips32 tuxrun tests
>>    tests/functional: add a m68k tuxrun tests
>>    tests/functional: update the i386 tuxrun tests
>>    tests/functional: update the aarch64 tuxrun tests
>>    tests/functional: update the arm tuxrun tests
>>    tests/functional: Convert the Avocado aarch64 tuxrun tests 
> 
> Do you think we could include patches 2-4 from this series ?
> 
> https://lore.kernel.org/all/20241112130246.970281-1-clg@redhat.com/
> 
> Only patch 3 lacks a R-b.

I had a question on patch 3 and a suggestion on patch 4 ... could you maybe 
address them first? Thanks!

  Thomas

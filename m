Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp647088ejs;
        Tue, 9 Jan 2024 13:22:35 -0800 (PST)
X-Received: by 2002:a05:600c:4504:b0:40e:3edf:106f with SMTP id t4-20020a05600c450400b0040e3edf106fmr2898715wmo.35.1704835355631;
        Tue, 09 Jan 2024 13:22:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704835355; cv=none;
        d=google.com; s=arc-20160816;
        b=ZWJXU8PIQyz6sV5TRRd5K2qW4o8C/mtZZPJNf8tHBzaeB4mySCZDZS5mJbjkNKnT5S
         tU+shd3mIW+ISDkTBFFLYjTEIAyI/Hrjuq8wG03SQaUrvRt1O6bZTCY/lByV3gCOnRwN
         kPjfcUKgSH3NCy1hYoTisiz124zhkM8eNznHSP2Ykmbd3ZyeYu8hJNRcF/50Cg1G7/Iu
         f1xyo/KzTONqHHy6Tu1ViTnbeWcWkkbQXarnT3o1ufKEe3T3RLPqQPsZ2mBJBh+z/eXd
         V3JSEOuGL6u4QuF0AOGnFTqDKWHRvo1xmkT+O3SBodPca7rRLDDe3qOC31F8KOyyVQxI
         XcSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vilajE5PD5xNBjEyKKd02WV1Do39jbxVN5LpyF4myDk=;
        fh=sC2jhvJGes9ZKuASZGFqGOvDOKxpH4EPQIQTcIa403Y=;
        b=ZaGhThzyyL2dCatS5VejZOjHR3H2B6patgkpG313e4FOrF3dw9/xms6+91TB1xVbXB
         CQbZ7ue8QuSiX8LMqAQjXgxmQedsnZ1Qe3Mg6XnJlxRT3Sp5NzRlS+RY0lpSISP7QPFw
         QPk8PNO+VzCz/CtCfbe2fqkg0woM2S/aZFaBl7K1216/R1dAtTmJDL0f489Y7FgA0amr
         sUhcH5xuszRhViBDXTgYg+mk27VdyHnX+g53BYHLZBXbhp5zklVoJhLDJdbBG4jT/Heg
         0aeiimBKvg4myDXtaRbK9mDa3bg046cpuB+wHPNszypBmOWj05W54iEzqFiHlh+MR/xj
         yBdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YRaokbTP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q20-20020a7bce94000000b0040d5ab899cbsor1185348wmj.11.2024.01.09.13.22.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 13:22:35 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YRaokbTP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704835355; x=1705440155; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vilajE5PD5xNBjEyKKd02WV1Do39jbxVN5LpyF4myDk=;
        b=YRaokbTP1b5mjUa2rgmwp+hJ7hB9eceizGcZGr3JTXwz+EuhcSy4Trkei+BvfBLwju
         uTKYypNk4JHoYfn/FErF3409PZirEFISioUlmLd4qrEcKnqWjNMVHnJE842Rzl26WyGn
         gFyIJ7kp+HCJf+EP0/73OcnPQ3WdR88YZZ/pVIFY5wuKOer3IoH6Ew7iVyKbGWlBzGes
         a3YJ88yZFwUceIXrEJgQzdLZ8v9UEC4U/gsZ43wFf1O8bm9hkvlnkOLOwo3vnzoTarjh
         WZpk4Irh9Wyjs0HJ//TpawCzq0wo9+rqnrtmIi75ce/h+xldeTCxCfrrE5BwXRsv+Yd+
         R5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704835355; x=1705440155;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vilajE5PD5xNBjEyKKd02WV1Do39jbxVN5LpyF4myDk=;
        b=OEWTyKqAZ6Y5V8okMzUEgcTi/EH6AXrxVkiFG/U7NmQGpvPAKRvd3EoJQTHq3Nuw/a
         xuzFOQeINUV8x9DAvsf042lh1xGIsgavGFBuumbhUPFiarmeGEjsur+oU/LJVvJDo4OQ
         ifs3SL7AWZvC0imZ1Npi4w0ke4VZwCDHVNuEDEK8HNQ/5c6tT8Lxa0rUg3VO4E9jCKOv
         KXA6UH9DTpvW/XO7ePtEqNO5eTT8g7Gjg/y7hxF1oyKlEll2M5yRW57Q52b1416f//9T
         BwhArpaMYxf95E+7V0EZpJUfZt5M0HYVstEV88u+Q3v9cNkuA4szQULwtrX0e75Ue0HU
         bcYQ==
X-Gm-Message-State: AOJu0Yz5e5Wd/xrXKMw8fTsv4ddFIWwdT8bcrzT1MLZzPZlGgAFwNFNy
	4rtvdy5bnPNx4dD+XIviIt+7kOBV+gIxXtzj
X-Google-Smtp-Source: AGHT+IEAJEHgRoRyUHQtZpit8RRsRcQzryKB20FYHzfp1NjPrNzEae/jM666RZEIN0O3yT5dlel3NA==
X-Received: by 2002:a05:600c:4fc7:b0:40e:fba:524 with SMTP id o7-20020a05600c4fc700b0040e0fba0524mr3152487wmq.120.1704835355086;
        Tue, 09 Jan 2024 13:22:35 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (rsa59-h02-176-184-32-47.dsl.sta.abo.bbox.fr. [176.184.32.47])
        by smtp.gmail.com with ESMTPSA id bg30-20020a05600c3c9e00b0040d62f89381sm4924090wmb.35.2024.01.09.13.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 13:22:34 -0800 (PST)
Message-ID: <2fa344b7-ccd2-4e6a-8c32-5ad7e4c960d6@linaro.org>
Date: Tue, 9 Jan 2024 22:22:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/33] hw/cpu/arm: Remove one use of qemu_get_cpu() in
 A7/A15 MPCore priv
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, qemu-devel@nongnu.org, Markus Armbruster
 <armbru@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Anton Johansson <anjo@rev.ng>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Hao Wu <wuhaotsh@google.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Rob Herring <robh@kernel.org>,
 qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Xu <peterx@redhat.com>
References: <20231212162935.42910-1-philmd@linaro.org>
 <03b969d3-1947-4186-b3ee-15e3cddc5f34@kaod.org>
 <18a38b88-8f20-420c-9916-a03d1b4930a7@linaro.org>
 <38cfa9de-874b-41dd-873e-5ad1f5a5805e@kaod.org>
 <fe4d463f-b646-4b7b-9063-d16ad5dbb128@linaro.org> <87y1d6i47m.fsf@suse.de>
 <597186d9-af21-46e8-8075-f21d36c01c07@kaod.org> <87plya76cu.fsf@suse.de>
 <d5c0b9fb-8b09-4f68-b3ab-c8adffd484a9@kaod.org> <87bk9u8dhs.fsf@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <87bk9u8dhs.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: WAISGwvfhf8v

Hi Fabiano,

On 9/1/24 21:21, Fabiano Rosas wrote:
> Cédric Le Goater <clg@kaod.org> writes:
> 
>> On 1/9/24 18:40, Fabiano Rosas wrote:
>>> Cédric Le Goater <clg@kaod.org> writes:
>>>
>>>> On 1/3/24 20:53, Fabiano Rosas wrote:
>>>>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>>>>
>>>>>> +Peter/Fabiano
>>>>>>
>>>>>> On 2/1/24 17:41, Cédric Le Goater wrote:
>>>>>>> On 1/2/24 17:15, Philippe Mathieu-Daudé wrote:
>>>>>>>> Hi Cédric,
>>>>>>>>
>>>>>>>> On 2/1/24 15:55, Cédric Le Goater wrote:
>>>>>>>>> On 12/12/23 17:29, Philippe Mathieu-Daudé wrote:
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> When a MPCore cluster is used, the Cortex-A cores belong the the
>>>>>>>>>> cluster container, not to the board/soc layer. This series move
>>>>>>>>>> the creation of vCPUs to the MPCore private container.
>>>>>>>>>>
>>>>>>>>>> Doing so we consolidate the QOM model, moving common code in a
>>>>>>>>>> central place (abstract MPCore parent).
>>>>>>>>>
>>>>>>>>> Changing the QOM hierarchy has an impact on the state of the machine
>>>>>>>>> and some fixups are then required to maintain migration compatibility.
>>>>>>>>> This can become a real headache for KVM machines like virt for which
>>>>>>>>> migration compatibility is a feature, less for emulated ones.
>>>>>>>>
>>>>>>>> All changes are either moving properties (which are not migrated)
>>>>>>>> or moving non-migrated QOM members (i.e. pointers of ARMCPU, which
>>>>>>>> is still migrated elsewhere). So I don't see any obvious migration
>>>>>>>> problem, but I might be missing something, so I Cc'ed Juan :>
>>>>>
>>>>> FWIW, I didn't spot anything problematic either.
>>>>>
>>>>> I've ran this through my migration compatibility series [1] and it
>>>>> doesn't regress aarch64 migration from/to 8.2. The tests use '-M
>>>>> virt -cpu max', so the cortex-a7 and cortex-a15 are not covered. I don't
>>>>> think we even support migration of anything non-KVM on arm.
>>>>
>>>> it happens we do.
>>>>
>>>
>>> Oh, sorry, I didn't mean TCG here. Probably meant to say something like
>>> non-KVM-capable cpus, as in 32-bit. Nevermind.
>>
>> Theoretically, we should be able to migrate to a TCG guest. Well, this
>> worked in the past for PPC. When I was doing more KVM related changes,
>> this was very useful for dev. Also, some machines are partially emulated.
>> Anyhow I agree this is not a strong requirement and we often break it.
>> Let's focus on KVM only.
>>
>>>>> 1- https://gitlab.com/farosas/qemu/-/jobs/5853599533
>>>>
>>>> yes it depends on the QOM hierarchy and virt seems immune to the changes.
>>>> Good.
>>>>
>>>> However, changing the QOM topology clearly breaks migration compat,
>>>
>>> Well, "clearly" is relative =) You've mentioned pseries and aspeed
>>> already, do you have a pointer to one of those cases were we broke
>>> migration
>>
>> Regarding pseries, migration compat broke because of 5bc8d26de20c
>> ("spapr: allocate the ICPState object from under sPAPRCPUCore") which
>> is similar to the changes proposed by this series, it impacts the QOM
>> hierarchy. Here is the workaround/fix from Greg : 46f7afa37096
>> ("spapr: fix migration of ICPState objects from/to older QEMU") which
>> is quite an headache and this turned out to raise another problem some
>> months ago ... :/ That's why I sent [1] to prepare removal of old
>> machines and workarounds becoming a burden.
> 
> This feels like something that could be handled by the vmstate code
> somehow. The state is there, just under a different path.

What, the QOM path is used in migration? ...

See recent discussions on "QOM path stability":
https://lore.kernel.org/qemu-devel/ZZfYvlmcxBCiaeWE@redhat.com/
https://lore.kernel.org/qemu-devel/87jzojbxt7.fsf@pond.sub.org/
https://lore.kernel.org/qemu-devel/87v883by34.fsf@pond.sub.org/

> No one wants
> to be policing QOM hierarchy changes in every single series that shows
> up on the list.
> 
> Anyway, thanks for the pointers. I'll study that code a bit more, maybe
> I can come up with some way to handle these cases.
> 
> Hopefully between the analyze-migration test and the compat tests we'll
> catch the next bug of this kind before it gets merged.
> 
> 

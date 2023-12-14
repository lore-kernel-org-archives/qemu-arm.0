Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp2200541ejo;
        Thu, 14 Dec 2023 01:41:48 -0800 (PST)
X-Received: by 2002:a05:651c:88b:b0:2cc:1cc0:9872 with SMTP id d11-20020a05651c088b00b002cc1cc09872mr5242173ljq.105.1702546908780;
        Thu, 14 Dec 2023 01:41:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702546908; cv=none;
        d=google.com; s=arc-20160816;
        b=0QRAbuxWgb7I2XuYe6Qje4fVnsS1uMv/XPSkC1Ew0CXoXKu7n1zIMY5OHmcdG+HiV5
         9qaJtVjRpX68rbK0L8b4h4XwM8VgL0dpYlU1OHqFDR1FRaM5kfBQ3oSNr9d9frayftaM
         uubXOceu6J71S/0E02jcyQrlAtVkOfkfZRB26kogLWvyEF0laHB6g7IVzWPgouGqYR1w
         jRTbkhBk/ukUkpGoYNyN+l66IW7KPAzIJaS2DYALcQVpwblwvG/30JZDcayUjg01MICQ
         1ZVj8FY4Ofd9l7X3pzwGkCWHzGPvllxBouDchfnuwnlBbMeHPuhbDK/kJPmRZQI/QCyC
         3dyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=zaSv1cEVN2/csDxZcQM7dUaN1yjFhAc0bctNu6GYJ2s=;
        fh=vCmbVxMpffpAihipETaNtIRTtbtcjqEX+wcZBy/eFag=;
        b=mMhMrHB9OGS1LEC92ORDw+NR65vY5EVN347ZUMptEePrFVMNwsdbbIz6Gx+jo6Ep8e
         LPER8CnIJ+U/Udd5ADsiV4/bZFkmVqCFefNWaSzM/fC1ROoOMCpktRpzdy02a8D58a5g
         Z5m5zBLXPaSfgw3POllTkPxuim6Uv3bsCykZErQ3Je+nYu+/Ot0hdlI6sgi5sGxChboz
         LlMhtkuF+Ehn8Yh7pz2mUVIEH8cCK/eAgHMM5IacLoQPvtp7ZsfFQxgSmYCgnP0jHce3
         JN4L4wiDq903DOQ+DxZ4zj9reizrAcgmtkrhttGjbh7jG8au6O3gWA6Wy9Mhm1au9+xf
         nHqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W5w8HhK5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k10-20020a2eb74a000000b002cc35ec4c03sor850024ljo.0.2023.12.14.01.41.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Dec 2023 01:41:48 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W5w8HhK5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702546908; x=1703151708; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zaSv1cEVN2/csDxZcQM7dUaN1yjFhAc0bctNu6GYJ2s=;
        b=W5w8HhK5HREQzTHCeghNuObSFtJFtz09kI9wyFlcjH+moOt8VOUkmPryuaCzlYgZdQ
         sUvcPXWbwymMTWm8eTUMVM+rozXZixiv4kQNaqLHUQagFKZYGhezuZjtjGSwgDl5/+3Z
         NcNxYwR5yTV4U2FrmKmOMwDbixiUnkyq3lAycdL1sbkwQ3JsSW4TSYiCI7vrdg9tYkv7
         L3JaODE3mwYnuCFLrQQtavzAKnhKqB/Fu3AWw5P1beywZUWU3n9wzIAyHS+t0g9wPJSt
         LF/1VNpu2HXdusbQ/b0spOZ3NRddk8dGadR26/WmnRkZaaNg/Ar/n2+9ClH/ktU/e18h
         x6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702546908; x=1703151708;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zaSv1cEVN2/csDxZcQM7dUaN1yjFhAc0bctNu6GYJ2s=;
        b=vxT8zccgBKBL0YZ4nchyBvh3PfzdOH6fDiyGBJ4r+Wt2AQ10zAAhPN5pS/NS5V37Kb
         PTliNvy947bA2jcTsxMynN+bRQjZzA7YWKu08KvAdLJKg2mMA/MeFO5bVgtHiby/l54A
         AxJjmjTtH4ycmURMwAZCtmHEKPOaoWUFBbUOwgofiBgd8tToobZ/0u8lJEap416YVPK2
         mqHkLgJz/HL/JoyL2BzTFT4103GbJJJTJ8rl38tw3uvOmB8fkRF2rhqJJwCcl7RigMSG
         gpyhy+d7t2W0EEN1MhEDodrQocZPHxPpwH4LMhF3zWcl80wACznLmFV+V+4qfRu2AOol
         Wlng==
X-Gm-Message-State: AOJu0YwXxqm0OWV1XVTBXYpkjIbZ+M/W/wlCMxdJrGvjjebMzeJnvl4A
	o+OBruwwpWfnbIpMwe38AG17e6nU
X-Google-Smtp-Source: AGHT+IFUBdWXX+JjH2ebUgEKb8xFppKiJlOwr5a/u/5abODSqBse2b+tPHKVziGzfogMCqlZTYoGag==
X-Received: by 2002:a05:651c:2108:b0:2cb:2b10:ee96 with SMTP id a8-20020a05651c210800b002cb2b10ee96mr4475815ljq.3.1702546908237;
        Thu, 14 Dec 2023 01:41:48 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.199.175] ([93.23.249.68])
        by smtp.gmail.com with ESMTPSA id m29-20020a50999d000000b0054cc903baadsm6855403edb.30.2023.12.14.01.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 01:41:47 -0800 (PST)
Message-ID: <25c403f3-349a-4c4e-8470-2721881b442e@linaro.org>
Date: Thu, 14 Dec 2023 10:41:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] tests/avocado/intel_iommu.py: increase timeout
Content-Language: en-US
To: eric.auger@redhat.com, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>
References: <20231208190911.102879-1-crosa@redhat.com>
 <20231208190911.102879-4-crosa@redhat.com> <8734w8fzbc.fsf@draig.linaro.org>
 <87sf45vpad.fsf@p1.localdomain>
 <6140fc8a-4044-4891-854d-9bf555c5dd78@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <6140fc8a-4044-4891-854d-9bf555c5dd78@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: WJKlkGPl4Jkp

On 14/12/23 08:24, Eric Auger wrote:
> Hi Cleber,
> 
> On 12/13/23 21:08, Cleber Rosa wrote:
>> Alex Bennée <alex.bennee@linaro.org> writes:
>>
>>> Cleber Rosa <crosa@redhat.com> writes:
>>>
>>>> Based on many runs, the average run time for these 4 tests is around
>>>> 250 seconds, with 320 seconds being the ceiling.  In any way, the
>>>> default 120 seconds timeout is inappropriate in my experience.
>>> I would rather see these tests updated to fix:
>>>
>>>   - Don't use such an old Fedora 31 image
>> I remember proposing a bump in Fedora version used by default in
>> avocado_qemu.LinuxTest (which would propagate to tests such as
>> boot_linux.py and others), but that was not well accepted.  I can
>> definitely work on such a version bump again.
>>
>>>   - Avoid updating image packages (when will RH stop serving them?)
>> IIUC the only reason for updating the packages is to test the network
>> from the guest, and could/should be done another way.
>>
>> Eric, could you confirm this?
> Sorry for the delay. Yes effectively I used the dnf install to stress
> the viommu. In the past I was able to trigger viommu bugs that way
> whereas getting an IP @ for the guest was just successful.

Maybe this test is useful as what Daniel described as "Tier 2" [*],
that maintainers run locally but don't need to be gating CI? That
would save us some resources there.

[*] https://lore.kernel.org/qemu-devel/20200427152036.GI1244803@redhat.com/

>>
>>>   - The "test" is a fairly basic check of dmesg/sysfs output
>> Maybe the network is also an implicit check here.  Let's see what Eric
>> has to say.
> 
> To be honest I do not remember how avocado does the check in itself; my
> guess if that if the dnf install does not complete you get a timeout and
> the test fails. But you may be more knowledged on this than me ;-)
> 
> Thanks
> 
> Eric

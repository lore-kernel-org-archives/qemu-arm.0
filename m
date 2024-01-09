Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp641000ejs;
        Tue, 9 Jan 2024 13:09:30 -0800 (PST)
X-Received: by 2002:a05:600c:2111:b0:40e:51bf:cd9a with SMTP id u17-20020a05600c211100b0040e51bfcd9amr700163wml.39.1704834570050;
        Tue, 09 Jan 2024 13:09:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704834570; cv=none;
        d=google.com; s=arc-20160816;
        b=mWAEeunZ61l7XoM/0fnVLZt9FDSnsYAIz2Y6Te0yLsv1/s+oydxnce9wWTjt3y+NTC
         r4NkGOjndhC31ssf5btVw2fxY1fsYfmLNSS/IpTRTCn6RgG90H9yWRILEk80VvVo5sAe
         9HJUXi9cyFpfchhSjYJZKKtjbN+f7D1s0Bybhob/ZzgpoCdb2fCCxKR9AFkjN5xxlMgP
         JRPssR1d7vyYXTlUiUzpSoDM1ZZ0JATuulCu48JhvCsQCDQNrFTtm+kATJWJczWylocc
         YUCdR6LomFNYzMdumqFzwt8B5k3U7UWu64eKTK5XaQBNXH0B7DMWBQKueQMk3hs5W/0m
         4ENQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Wz1iXNg4TXNcOn/x7G2oIVLLHopXLlyNHKrHRtohyQo=;
        fh=wRU5kielp4IS2kICFCLYdHE13iB+78bzyZKKybLnvkQ=;
        b=xh1DlE8cbb4Pqd7dfk/DTZw0XOBtHsOjSWSW7eRV91mzdxoJpUwjbbbTXKGQYxjL9e
         nhbwZuDSDf755eJsOwDyBL2MdxqcxlogOJPenU7U6Z/NlpxggWUPi4totCJI/5PPY0JS
         KyPa7D5+FJ2U1hbEf75JRCr4CITsWlauuew8AYnDfJh5LE+LKIeSABWwkH9FR0O0hgAp
         Wvco1ybjLil9+aenGeK1IZCbgjFyKxxgqt7b6IP3FUmCbAjuZoliOFWJGmctPY0XagsP
         +JSKLKiCxYh/94u82hvG98wf11OUB7IogF2n0AAweWgvz7it1WFfkDTUwh9Jzk9HnrWM
         dAOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jRWkmdqo;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 17-20020a17090601d100b00a2b857a06ecsor350977ejj.7.2024.01.09.13.09.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 13:09:30 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jRWkmdqo;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704834569; x=1705439369; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wz1iXNg4TXNcOn/x7G2oIVLLHopXLlyNHKrHRtohyQo=;
        b=jRWkmdqovD5PMtatY13qVq+LVCjNEmlgV1eBwOlAgQPInAYuFXJEwcKrkQ+sVCGlDf
         XSZwD8d3pb0hpOnhGXitoaYjhdMKvYsP3H6zG8CtKy8gNj56YWnJsCfTXVjJ4Q7DlQ+h
         K6ljS4SKulK9vPVA3TAClj1TuVQPefkKT4JfyRBT6v4Py3hu0lRGlBoRyrLsXfPwaWyU
         6XUTD9hNAJnndRKjfGvZkZKLs0ekCURnkbfTlAHcyzo13Tsiu/uyoAJueH4ZZsWoJP3p
         snm9EFSHY0Ux9Z0EsjzXgAvZI8ZEjwehmQuVfLuAtzw4p0lWcl0Xcnv67E6arNR9ATX1
         fWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704834569; x=1705439369;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wz1iXNg4TXNcOn/x7G2oIVLLHopXLlyNHKrHRtohyQo=;
        b=s+auA7HS5mmhY0xnObpNzmxLC0USN9+zf7TUxZlOhLhYyqZPErgK9aXfx1oM6dExs4
         /6GEemxWD1ARCyaMAdfFG94lXxCtp7ISZS5OAhjk8Igf+0+OmZ+f7TiRFph5BrymIVN2
         VxvmeEdSQ7c1/f6oQxP7nbrgMMGRZRa1xG6xlVfnTgtSo9+QRuqJ8sRS2L18Ay8E8aXG
         97a8APay5RMIDxfA7izDAuZdW0FVJaXgriICGCoK9KELj4cbgvLh/9iAZDia1LxTn02U
         9cVAJmkAs7rLvyYaWNZ3i50KSoFQDuvMN13WLUtQniihpPlMh/F9GYtBBtLMxTbBmXUq
         nn0g==
X-Gm-Message-State: AOJu0Ywoeb3bWGisR9a08LHjLEYZUlFxiKJwzen4n9iV0BdtXRlLU4dN
	jslaQN5nplybGT8Z9PLyhNab9rVZ41T0qUPX
X-Google-Smtp-Source: AGHT+IHftvF2JCRBKB+z64ic95MXrpEdZp/g67kVpBlET30ZvQURGCj3M5YiV7FCXCXenqJW3Z8kkw==
X-Received: by 2002:a17:906:1914:b0:a29:905d:447b with SMTP id a20-20020a170906191400b00a29905d447bmr34782eje.96.1704834569679;
        Tue, 09 Jan 2024 13:09:29 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (rsa59-h02-176-184-32-47.dsl.sta.abo.bbox.fr. [176.184.32.47])
        by smtp.gmail.com with ESMTPSA id p22-20020a17090628d600b00a2b07693f55sm1400919ejd.166.2024.01.09.13.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 13:09:29 -0800 (PST)
Message-ID: <9a98502f-12a4-4f8f-ba54-a6e1d7a2d4a2@linaro.org>
Date: Tue, 9 Jan 2024 22:09:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/33] hw/cpu/arm: Remove one use of qemu_get_cpu() in
 A7/A15 MPCore priv
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
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
 <d5c0b9fb-8b09-4f68-b3ab-c8adffd484a9@kaod.org>
 <e2a282a5-b92a-439e-9ecf-3ea1f74deb25@linaro.org>
In-Reply-To: <e2a282a5-b92a-439e-9ecf-3ea1f74deb25@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: H4BDD+PotBM0

On 9/1/24 22:07, Philippe Mathieu-Daudé wrote:
> Hi Cédric,
> 
> On 9/1/24 19:06, Cédric Le Goater wrote:
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
>>>>>>>>> Changing the QOM hierarchy has an impact on the state of the 
>>>>>>>>> machine
>>>>>>>>> and some fixups are then required to maintain migration 
>>>>>>>>> compatibility.
>>>>>>>>> This can become a real headache for KVM machines like virt for 
>>>>>>>>> which
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
>>>>> virt -cpu max', so the cortex-a7 and cortex-a15 are not covered. I 
>>>>> don't
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
> 
> No no, we want the same for TCG.
> 
>>>>> 1- https://gitlab.com/farosas/qemu/-/jobs/5853599533
>>>>
>>>> yes it depends on the QOM hierarchy and virt seems immune to the 
>>>> changes.
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
>>
>> Regarding aspeed, this series breaks compat.
> 
> Can you write down the steps to reproduce please? I'll debug it.

Also, have you figured (bisecting) which patch start to break?

> We need to understand this.
> 
>> Not that we care much
>> but ​this caught my attention because of my past experience on pseries.
>> Same kind of QOM change which could impact other machines, like virt.
>> Since you checked that migration compat is preserved on virt, we should
>> be fine.
>>
>> Thanks,
>>
>> C.
>>
>> [1] 
>> https://lore.kernel.org/qemu-devel/20231214181723.1520854-1-clg@kaod.org/
>>
> 

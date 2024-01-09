Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp639962ejs;
        Tue, 9 Jan 2024 13:07:12 -0800 (PST)
X-Received: by 2002:a05:6512:ad1:b0:50e:6f8a:77d8 with SMTP id n17-20020a0565120ad100b0050e6f8a77d8mr3161112lfu.13.1704834432606;
        Tue, 09 Jan 2024 13:07:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704834432; cv=none;
        d=google.com; s=arc-20160816;
        b=S26MjRwGHHhdcwoQSfkC7VSzvZjR4u37VnCFpk2Hs2ERRbeWHtbp9/fAShMpwusCS8
         HgRKjMl2jf7TesohciuTmTA60cB2rOVjBZxGtvFKIqzFQccpqOqc09xwI2cI4IbFvdo3
         8uVvATKHxXJ1CSoYv1ZW/Om4R6W4X4Tpk+roIDHBTdP9p1PCFBfHJGSIfUeAGzt7Coj8
         gx4GPCrGUeGdvvEth6X0Zf7CDGRgskrFUL8LOo38WTbfQs0hqYOyjtO30TGQ2+rpuhkj
         jfcmPx70xFoXSvVNsedoP6Hp2vm/PfpwvApSpw0UgSSivH0s30iVD5JeXOfjRKf8lk7k
         KgqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8qZafctPM+UwX4cZvuInc7fljPGmMPL6uAWHty1qRno=;
        fh=wRU5kielp4IS2kICFCLYdHE13iB+78bzyZKKybLnvkQ=;
        b=QguoOxxcGa/0XabKI5mirBMGt2K0bLofI2vgaPNTPPVAWCFng4VyucNfuQtIBHKi6B
         ocr9G1p+XWDarOmnu+chqteoBoHQ3tj9CSdyrm0/XXcJRr8VhWrsZYtd/NLZ0qAml03J
         Jj6KnBegnDXoHZMh6UfIU6DHVQ81bpcokAhuJ73i+Ew6up4q1QytplZZyo7gtfTY6a8W
         3irMrFIAOM2q7ZFs52u5uawR/HJ5rcx6bJYYueo0cZfDgHzGQURRKX9EXMjOpZxOKcEf
         W+4ajPu9kME8aQl2469p3TntRYbqHHAQ2pLc7smoZhJki8HHSIQpHaFoJWnwhgLYaXJF
         ueiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iAjgprq0;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w20-20020a17090633d400b00a26a93732e7sor764799eja.4.2024.01.09.13.07.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 13:07:12 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iAjgprq0;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704834432; x=1705439232; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8qZafctPM+UwX4cZvuInc7fljPGmMPL6uAWHty1qRno=;
        b=iAjgprq0Un2Kcuns1LxedZqGwhYZxPCCrIbGrht7E8xru/AeufKn5qpuzNDZ+BghXB
         c0UBoQ5tAy31mghsZjYK/oANDuitrWxBSi/lWIuHH775CCyBVyA+/7YN34QPmUXpp5Uj
         NIuBaL29bPS+X8nMWrxSCK1Yo3gHltuefec59gCa1kDLUW09e4C4SW5je0kF8yiTfaai
         TKzaxLjsEF6PmZ1osP0YZM+ej6GzK2G1YCSScaSTBdQrRtXjW58UZMc27IT0Z076fnZv
         4tRpogsDyC9dImO1h3/CfGFnbGw3m+wGkUoaB1PlGxUM14FcljyLNYFYxabTVDFaScAa
         zaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704834432; x=1705439232;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8qZafctPM+UwX4cZvuInc7fljPGmMPL6uAWHty1qRno=;
        b=Yx5qhCgr80XV7caXM+UyhrO4wcM08VzqjCJGCsmx4+HE7Isjtjf74b7PvjQW8VMEKZ
         52Jnts7Xdts9ZjBb2oxJ1NCvNcGCF8SmK0BCt31Y2icGJb0JbzL/Z2XJyoZ4pyEBoB3W
         hy3NjyZ/HLQ+Mlj7HCKddcmvNeA2+WHiEULcbc77o2bUQmKh7keB7YJRBrRPvs6imadC
         DNHHB1jRF85FrJ/NQ/S6nB49bdA2GX8bL0PBsI3FXuLquDrDw2vzqS+8iKnGXjNDPm5O
         XfWwxrEFUlhkajst3O5sxq0LOX1Qug5vGMy/rBnUUSRULs/j7OL7hesYUjPQOTyYTe+e
         d+Zg==
X-Gm-Message-State: AOJu0Yz2tL8aPdPSeL8aLC3lgTkfxcG4quQKJhL8QRTIFuB1IVTiy8of
	lefV+ZeaEeEhQ+voD11cf0f5vXOzbTpW7+h/
X-Google-Smtp-Source: AGHT+IEke0N/q9Ya3UDP4NaKDoyQeO/zlBvXpt4IcjSE+pEPAnzBNdgacxj5IDkuJ+NmKFWxzB2JTg==
X-Received: by 2002:a17:906:168d:b0:a2b:61dd:1687 with SMTP id s13-20020a170906168d00b00a2b61dd1687mr39531ejd.116.1704834432174;
        Tue, 09 Jan 2024 13:07:12 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (rsa59-h02-176-184-32-47.dsl.sta.abo.bbox.fr. [176.184.32.47])
        by smtp.gmail.com with ESMTPSA id m14-20020a170906580e00b00a28aa4871c7sm1388316ejq.205.2024.01.09.13.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 13:07:11 -0800 (PST)
Message-ID: <e2a282a5-b92a-439e-9ecf-3ea1f74deb25@linaro.org>
Date: Tue, 9 Jan 2024 22:07:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/33] hw/cpu/arm: Remove one use of qemu_get_cpu() in
 A7/A15 MPCore priv
Content-Language: en-US
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <d5c0b9fb-8b09-4f68-b3ab-c8adffd484a9@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 7VHsLbSZOqWg

Hi Cédric,

On 9/1/24 19:06, Cédric Le Goater wrote:
> On 1/9/24 18:40, Fabiano Rosas wrote:
>> Cédric Le Goater <clg@kaod.org> writes:
>>
>>> On 1/3/24 20:53, Fabiano Rosas wrote:
>>>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>>>
>>>>> +Peter/Fabiano
>>>>>
>>>>> On 2/1/24 17:41, Cédric Le Goater wrote:
>>>>>> On 1/2/24 17:15, Philippe Mathieu-Daudé wrote:
>>>>>>> Hi Cédric,
>>>>>>>
>>>>>>> On 2/1/24 15:55, Cédric Le Goater wrote:
>>>>>>>> On 12/12/23 17:29, Philippe Mathieu-Daudé wrote:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> When a MPCore cluster is used, the Cortex-A cores belong the the
>>>>>>>>> cluster container, not to the board/soc layer. This series move
>>>>>>>>> the creation of vCPUs to the MPCore private container.
>>>>>>>>>
>>>>>>>>> Doing so we consolidate the QOM model, moving common code in a
>>>>>>>>> central place (abstract MPCore parent).
>>>>>>>>
>>>>>>>> Changing the QOM hierarchy has an impact on the state of the 
>>>>>>>> machine
>>>>>>>> and some fixups are then required to maintain migration 
>>>>>>>> compatibility.
>>>>>>>> This can become a real headache for KVM machines like virt for 
>>>>>>>> which
>>>>>>>> migration compatibility is a feature, less for emulated ones.
>>>>>>>
>>>>>>> All changes are either moving properties (which are not migrated)
>>>>>>> or moving non-migrated QOM members (i.e. pointers of ARMCPU, which
>>>>>>> is still migrated elsewhere). So I don't see any obvious migration
>>>>>>> problem, but I might be missing something, so I Cc'ed Juan :>
>>>>
>>>> FWIW, I didn't spot anything problematic either.
>>>>
>>>> I've ran this through my migration compatibility series [1] and it
>>>> doesn't regress aarch64 migration from/to 8.2. The tests use '-M
>>>> virt -cpu max', so the cortex-a7 and cortex-a15 are not covered. I 
>>>> don't
>>>> think we even support migration of anything non-KVM on arm.
>>>
>>> it happens we do.
>>>
>>
>> Oh, sorry, I didn't mean TCG here. Probably meant to say something like
>> non-KVM-capable cpus, as in 32-bit. Nevermind.
> 
> Theoretically, we should be able to migrate to a TCG guest. Well, this
> worked in the past for PPC. When I was doing more KVM related changes,
> this was very useful for dev. Also, some machines are partially emulated.
> Anyhow I agree this is not a strong requirement and we often break it.
> Let's focus on KVM only.

No no, we want the same for TCG.

>>>> 1- https://gitlab.com/farosas/qemu/-/jobs/5853599533
>>>
>>> yes it depends on the QOM hierarchy and virt seems immune to the 
>>> changes.
>>> Good.
>>>
>>> However, changing the QOM topology clearly breaks migration compat,
>>
>> Well, "clearly" is relative =) You've mentioned pseries and aspeed
>> already, do you have a pointer to one of those cases were we broke
>> migration 
> 
> Regarding pseries, migration compat broke because of 5bc8d26de20c
> ("spapr: allocate the ICPState object from under sPAPRCPUCore") which
> is similar to the changes proposed by this series, it impacts the QOM
> hierarchy. Here is the workaround/fix from Greg : 46f7afa37096
> ("spapr: fix migration of ICPState objects from/to older QEMU") which
> is quite an headache and this turned out to raise another problem some
> months ago ... :/ That's why I sent [1] to prepare removal of old
> machines and workarounds becoming a burden.
> 
> Regarding aspeed, this series breaks compat.

Can you write down the steps to reproduce please? I'll debug it.
We need to understand this.

> Not that we care much
> but ​this caught my attention because of my past experience on pseries.
> Same kind of QOM change which could impact other machines, like virt.
> Since you checked that migration compat is preserved on virt, we should
> be fine.
> 
> Thanks,
> 
> C.
> 
> [1] 
> https://lore.kernel.org/qemu-devel/20231214181723.1520854-1-clg@kaod.org/
> 

Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp2232139ejs;
        Fri, 12 Jan 2024 01:03:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4TWXXdFfnhjhvhwScJ5Ye0cNHLQ051IC8WM0L2zb+xYnBSxVAZnNDFGdvKnvMtE9OXiPm
X-Received: by 2002:a17:902:9344:b0:1d4:8be0:4494 with SMTP id g4-20020a170902934400b001d48be04494mr464135plp.125.1705050237172;
        Fri, 12 Jan 2024 01:03:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705050237; cv=none;
        d=google.com; s=arc-20160816;
        b=tHbTl/SWM5hqcp+gHHTUUjCJHtM2YyvObGxQDVe2kogOJECHUnov54fKitQqM/xPqy
         4gtsQU6cW1wnysH9cVFHLqpj323Rcb2BygKQCO39oSDvtWDvga7kDLep940q+383S7fV
         2IJ3vp/zX33iCEMxApelg0TyXGZX5k+pBuUg4cPeGhwaOGXNeW52XIybXA9krjfMgzq+
         Vveij7FhTN2TNtcFl3ugYQC+6666A1xB4h0zexLhk+xr42Fxo7h4SjyfwQRIs0BZOIza
         xcLywrMB6xm1kdNJHRBZugWWicH0OJ7DygFDeZ05dJBLAATNmlilXOfHE/KNXmcfNrXp
         vwCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=Xy2PvNzdSgPWlt3JcggwSOi8nAK9NJT00bLUMAPTxJA=;
        fh=CU1yliy8VciVniJeXkDzVDPqn+p4xkeFpW8viYzYwFY=;
        b=N5XSB4BcDFXDVMTw/tN7y6gRM5cWEOy+WVSpGI0K3am2vn8f0rN/YDAaVXrBJ3Hzdw
         zlHNUv+lzMzVyJP7xQLVewL30cHgYyAYq6YQQDLI9+NX4BIKymrcnUCYyj+5/JCxw3kf
         6r37NrPRFLNrUs73C//adSpme8DS7QIcdFSfsZ/QjEeFYUSS56WjARcoTVgCt5ZwSDsi
         wX48eeW1WqRhqAnVphJVqZZ7DHowT1KfKcSI2PoYKwlYqgCkqAJKXOAlaG9/Jw2q+SrT
         VmNccBG1IQXopCpXmtDf2Lre9LgPV+WEV8gtz9SXnT23rL1agLV+DJLqVrj0DNZZ50F/
         XCUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=qink=iw=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=qInK=IW=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=qInK=IW=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org. [150.107.74.76])
        by mx.google.com with ESMTPS id jf7-20020a170903268700b001d37369fe10si2661950plb.106.2024.01.12.01.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 01:03:57 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=qink=iw=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) client-ip=150.107.74.76;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=qink=iw=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=qInK=IW=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TBFvY6vwqz4x43;
	Fri, 12 Jan 2024 20:03:53 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TBFvM6cJDz4wc6;
	Fri, 12 Jan 2024 20:03:43 +1100 (AEDT)
Message-ID: <17419ee0-11f4-4082-bd91-212449ab1da8@kaod.org>
Date: Fri, 12 Jan 2024 10:03:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/33] hw/cpu/arm: Remove one use of qemu_get_cpu() in
 A7/A15 MPCore priv
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
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
 qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <38cfa9de-874b-41dd-873e-5ad1f5a5805e@kaod.org>
 <fe4d463f-b646-4b7b-9063-d16ad5dbb128@linaro.org> <87y1d6i47m.fsf@suse.de>
 <597186d9-af21-46e8-8075-f21d36c01c07@kaod.org> <87plya76cu.fsf@suse.de>
 <d5c0b9fb-8b09-4f68-b3ab-c8adffd484a9@kaod.org> <87bk9u8dhs.fsf@suse.de>
 <2fa344b7-ccd2-4e6a-8c32-5ad7e4c960d6@linaro.org> <ZZ4Qrfis4XHWGN0j@x1n>
 <87cyu9hgit.fsf@pond.sub.org> <ZZ44iQRPrdDpfov7@x1n>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <ZZ44iQRPrdDpfov7@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 5t8GmEqa0xo4

On 1/10/24 07:26, Peter Xu wrote:
> On Wed, Jan 10, 2024 at 07:03:06AM +0100, Markus Armbruster wrote:
>> Peter Xu <peterx@redhat.com> writes:
>>
>>> On Tue, Jan 09, 2024 at 10:22:31PM +0100, Philippe Mathieu-Daudé wrote:
>>>> Hi Fabiano,
>>>>
>>>> On 9/1/24 21:21, Fabiano Rosas wrote:
>>>>> Cédric Le Goater <clg@kaod.org> writes:
>>>>>
>>>>>> On 1/9/24 18:40, Fabiano Rosas wrote:
>>>>>>> Cédric Le Goater <clg@kaod.org> writes:
>>>>>>>
>>>>>>>> On 1/3/24 20:53, Fabiano Rosas wrote:
>>>>>>>>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>>>>>>>>
>>>>>>>>>> +Peter/Fabiano
>>>>>>>>>>
>>>>>>>>>> On 2/1/24 17:41, Cédric Le Goater wrote:
>>>>>>>>>>> On 1/2/24 17:15, Philippe Mathieu-Daudé wrote:
>>>>>>>>>>>> Hi Cédric,
>>>>>>>>>>>>
>>>>>>>>>>>> On 2/1/24 15:55, Cédric Le Goater wrote:
>>>>>>>>>>>>> On 12/12/23 17:29, Philippe Mathieu-Daudé wrote:
>>>>>>>>>>>>>> Hi,
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> When a MPCore cluster is used, the Cortex-A cores belong the the
>>>>>>>>>>>>>> cluster container, not to the board/soc layer. This series move
>>>>>>>>>>>>>> the creation of vCPUs to the MPCore private container.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Doing so we consolidate the QOM model, moving common code in a
>>>>>>>>>>>>>> central place (abstract MPCore parent).
>>>>>>>>>>>>>
>>>>>>>>>>>>> Changing the QOM hierarchy has an impact on the state of the machine
>>>>>>>>>>>>> and some fixups are then required to maintain migration compatibility.
>>>>>>>>>>>>> This can become a real headache for KVM machines like virt for which
>>>>>>>>>>>>> migration compatibility is a feature, less for emulated ones.
>>>>>>>>>>>>
>>>>>>>>>>>> All changes are either moving properties (which are not migrated)
>>>>>>>>>>>> or moving non-migrated QOM members (i.e. pointers of ARMCPU, which
>>>>>>>>>>>> is still migrated elsewhere). So I don't see any obvious migration
>>>>>>>>>>>> problem, but I might be missing something, so I Cc'ed Juan :>
>>>>>>>>>
>>>>>>>>> FWIW, I didn't spot anything problematic either.
>>>>>>>>>
>>>>>>>>> I've ran this through my migration compatibility series [1] and it
>>>>>>>>> doesn't regress aarch64 migration from/to 8.2. The tests use '-M
>>>>>>>>> virt -cpu max', so the cortex-a7 and cortex-a15 are not covered. I don't
>>>>>>>>> think we even support migration of anything non-KVM on arm.
>>>>>>>>
>>>>>>>> it happens we do.
>>>>>>>>
>>>>>>>
>>>>>>> Oh, sorry, I didn't mean TCG here. Probably meant to say something like
>>>>>>> non-KVM-capable cpus, as in 32-bit. Nevermind.
>>>>>>
>>>>>> Theoretically, we should be able to migrate to a TCG guest. Well, this
>>>>>> worked in the past for PPC. When I was doing more KVM related changes,
>>>>>> this was very useful for dev. Also, some machines are partially emulated.
>>>>>> Anyhow I agree this is not a strong requirement and we often break it.
>>>>>> Let's focus on KVM only.
>>>>>>
>>>>>>>>> 1- https://gitlab.com/farosas/qemu/-/jobs/5853599533
>>>>>>>>
>>>>>>>> yes it depends on the QOM hierarchy and virt seems immune to the changes.
>>>>>>>> Good.
>>>>>>>>
>>>>>>>> However, changing the QOM topology clearly breaks migration compat,
>>>>>>>
>>>>>>> Well, "clearly" is relative =) You've mentioned pseries and aspeed
>>>>>>> already, do you have a pointer to one of those cases were we broke
>>>>>>> migration
>>>>>>
>>>>>> Regarding pseries, migration compat broke because of 5bc8d26de20c
>>>>>> ("spapr: allocate the ICPState object from under sPAPRCPUCore") which
>>>>>> is similar to the changes proposed by this series, it impacts the QOM
>>>>>> hierarchy. Here is the workaround/fix from Greg : 46f7afa37096
>>>>>> ("spapr: fix migration of ICPState objects from/to older QEMU") which
>>>>>> is quite an headache and this turned out to raise another problem some
>>>>>> months ago ... :/ That's why I sent [1] to prepare removal of old
>>>>>> machines and workarounds becoming a burden.
>>>>>
>>>>> This feels like something that could be handled by the vmstate code
>>>>> somehow. The state is there, just under a different path.
>>>>
>>>> What, the QOM path is used in migration? ...
>>>
>>> Hopefully not..
>>>
>>>>
>>>> See recent discussions on "QOM path stability":
>>>> https://lore.kernel.org/qemu-devel/ZZfYvlmcxBCiaeWE@redhat.com/
>>>> https://lore.kernel.org/qemu-devel/87jzojbxt7.fsf@pond.sub.org/
>>>> https://lore.kernel.org/qemu-devel/87v883by34.fsf@pond.sub.org/
>>>
>>> If I read it right, the commit 46f7afa37096 example is pretty special that
>>> the QOM path more or less decided more than the hierachy itself but changes
>>> the existances of objects.
>>
>> Let's see whether I got this...
>>
>> We removed some useless objects, moved the useful ones to another home.
>> The move changed their QOM path.
>>
>> The problem was the removal of useless objects, because this also
>> removed their vmstate.
>>
>> The fix was adding the vmstate back as a dummy.
>>
>> The QOM patch changes are *not* part of the problem.
>>
>> Correct?
> 
> [I'd leave this to Cedric]
> 
>>
>>>>> No one wants
>>>>> to be policing QOM hierarchy changes in every single series that shows
>>>>> up on the list.
>>>>>
>>>>> Anyway, thanks for the pointers. I'll study that code a bit more, maybe
>>>>> I can come up with some way to handle these cases.
>>>>>
>>>>> Hopefully between the analyze-migration test and the compat tests we'll
>>>>> catch the next bug of this kind before it gets merged.
>>>
>>> Things like that might be able to be detected via vmstate-static-checker.py.
>>> But I'm not 100% sure, also its coverage is limited.
>>>
>>> For example, I don't think it can detect changes to objects that will only
>>> be created dynamically, e.g., I think sometimes we create objects after
>>> some guest behaviors (consider guest enables the device, then QEMU
>>> emulation creates some objects on demand of device setup?),
>>
>> Feels nuts to me.
>>
>> In real hardware, software enabling a device that is disabled by default
>> doesn't create the device.  The device is always there, it just happens
>> to be inactive unless enabled.  We should model the device just like
>> that.
> 
> It doesn't need to be the device itself to be dynamically created, but some
> other sub-objects that do not require to exist until the device is enabled,
> or some specific function of that device is enabled.  It is logically doable.
> 
> Is the example Cedric provided looks like some case like this?  I am not
> sure, that's also why I'm not sure the static checker would work here.  But
> logically it seems possible, e.g. with migration VMSD needed() facilities.
> Consider a device has a sub-function that requires a sub-object.  It may
> not need to migrate that object if that sub-feature is not even enabled.
> If that object is very large, it might be wise to do so if possible to not
> send chunks of junk during the VM downtime.
> 
> But then after a 2nd thought I do agree it's probably not sensible, because
> even if the src may know whether the sub-object will be needed, there's
> probably no good way for the dest QEMU to know.  It can only know in
> something like a post_load() hook, but logically that can happen only after
> a full load of that device state, so might already be too late.

If features can be dynamically enabled by the OS, after negotiation
with the platform, the source should prepare for all possible
scenarios and migrate all models supported for a given configuration.
The OS could choose to enable a feature on the target which was not
enabled on the source before migration.

Thanks,

C.

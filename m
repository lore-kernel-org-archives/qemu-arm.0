Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp2223909ejs;
        Fri, 12 Jan 2024 00:41:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8shsbRzffMkD6+41WjPLRWNx9luPtMrw2/Ows+g8IcSj1t6HtuzBhZWZlQYgmHsawise4
X-Received: by 2002:a05:6808:1208:b0:3bc:9d7:31b1 with SMTP id a8-20020a056808120800b003bc09d731b1mr686126oil.80.1705048915928;
        Fri, 12 Jan 2024 00:41:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705048915; cv=none;
        d=google.com; s=arc-20160816;
        b=YrnxLQHz8fh+lECIrQ1hQ2o1LmiVrt75t62R7ue57S68/UGl+/rCdB+j+AimDh+U7k
         7BDxp76lWTRosHh8yFU0zKDAXuBywBos/tCXyRSOeW5GwNsw+Ho2OnlmVpFUZ1YWpIO9
         9BBf924vpPyVnoIsoBeAnpQv8UcOh1YXv37YAp8veg/lvmoNhu8h0FNt6yHEQSLcNV7H
         XPU7c4+Mt6wskdXZxQYtjk2nX47k/nKmeoeIz9dP7dyaX2S9p4fqQDYrcH3ah9MZgyRL
         4aoX9S5snZnrjWWGSfqtk2j6W4GgANR66N3z2qJ6gnisiZsj0HVOu20AlopAn7wYCVj4
         cBJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=y87Kn2Yk05NQixI1LSzupbsLw4Vjk9K3Db3SBqeSUlU=;
        fh=Dw9DkLGIfa7inU+dVOo5HDGXaKVSyGvILCtDDVhcyjQ=;
        b=oteWFMxdLrGhPwaAJ8nsfOhfA2WJindDRdrQN+e3fnJ1ZP+fcFZB5oYgUmHa/IH28/
         21KJC/uIEIYCyNtJePWfgKnlhm5K7wWAS82neYAxjCWJ6sQwd6mi/OAKU4EtUyp9jUHf
         GbrmI+higbFNrnNo+3xsX/FYPFNs/41ZPfImNObNWjeWLQwtPUQ8371vyh1odtfpmF/t
         1vMOIMyRswoDrOoKS+dy3u+1QeE6a8Adu1wypap4ApY0kOTvX4xtps/3i7zWfStTGpaU
         8o67OOqPrNjrm/9IEGnBzeqynl4snmbsmg4i9l5uY99A72fNSYnCW1dghj4YkXdDLerW
         g7QA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=qink=iw=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=qInK=IW=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=qInK=IW=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org. [150.107.74.76])
        by mx.google.com with ESMTPS id eb14-20020a056a004c8e00b006d9ac93cf24si2857148pfb.14.2024.01.12.00.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 00:41:55 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=qink=iw=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) client-ip=150.107.74.76;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=qink=iw=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=qInK=IW=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TBFQ94vg5z4wnw;
	Fri, 12 Jan 2024 19:41:53 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TBFQ00S4Qz4wc8;
	Fri, 12 Jan 2024 19:41:43 +1100 (AEDT)
Message-ID: <43f11470-c29f-4f8a-b5ed-5b83303738cb@kaod.org>
Date: Fri, 12 Jan 2024 09:41:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/33] hw/cpu/arm: Remove one use of qemu_get_cpu() in
 A7/A15 MPCore priv
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>
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
References: <03b969d3-1947-4186-b3ee-15e3cddc5f34@kaod.org>
 <18a38b88-8f20-420c-9916-a03d1b4930a7@linaro.org>
 <38cfa9de-874b-41dd-873e-5ad1f5a5805e@kaod.org>
 <fe4d463f-b646-4b7b-9063-d16ad5dbb128@linaro.org> <87y1d6i47m.fsf@suse.de>
 <597186d9-af21-46e8-8075-f21d36c01c07@kaod.org> <87plya76cu.fsf@suse.de>
 <d5c0b9fb-8b09-4f68-b3ab-c8adffd484a9@kaod.org> <87bk9u8dhs.fsf@suse.de>
 <2fa344b7-ccd2-4e6a-8c32-5ad7e4c960d6@linaro.org> <ZZ4Qrfis4XHWGN0j@x1n>
 <87cyu9hgit.fsf@pond.sub.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87cyu9hgit.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Smysk7WcOKaR

On 1/10/24 07:03, Markus Armbruster wrote:
> Peter Xu <peterx@redhat.com> writes:
> 
>> On Tue, Jan 09, 2024 at 10:22:31PM +0100, Philippe Mathieu-Daudé wrote:
>>> Hi Fabiano,
>>>
>>> On 9/1/24 21:21, Fabiano Rosas wrote:
>>>> Cédric Le Goater <clg@kaod.org> writes:
>>>>
>>>>> On 1/9/24 18:40, Fabiano Rosas wrote:
>>>>>> Cédric Le Goater <clg@kaod.org> writes:
>>>>>>
>>>>>>> On 1/3/24 20:53, Fabiano Rosas wrote:
>>>>>>>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>>>>>>>
>>>>>>>>> +Peter/Fabiano
>>>>>>>>>
>>>>>>>>> On 2/1/24 17:41, Cédric Le Goater wrote:
>>>>>>>>>> On 1/2/24 17:15, Philippe Mathieu-Daudé wrote:
>>>>>>>>>>> Hi Cédric,
>>>>>>>>>>>
>>>>>>>>>>> On 2/1/24 15:55, Cédric Le Goater wrote:
>>>>>>>>>>>> On 12/12/23 17:29, Philippe Mathieu-Daudé wrote:
>>>>>>>>>>>>> Hi,
>>>>>>>>>>>>>
>>>>>>>>>>>>> When a MPCore cluster is used, the Cortex-A cores belong the the
>>>>>>>>>>>>> cluster container, not to the board/soc layer. This series move
>>>>>>>>>>>>> the creation of vCPUs to the MPCore private container.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Doing so we consolidate the QOM model, moving common code in a
>>>>>>>>>>>>> central place (abstract MPCore parent).
>>>>>>>>>>>>
>>>>>>>>>>>> Changing the QOM hierarchy has an impact on the state of the machine
>>>>>>>>>>>> and some fixups are then required to maintain migration compatibility.
>>>>>>>>>>>> This can become a real headache for KVM machines like virt for which
>>>>>>>>>>>> migration compatibility is a feature, less for emulated ones.
>>>>>>>>>>>
>>>>>>>>>>> All changes are either moving properties (which are not migrated)
>>>>>>>>>>> or moving non-migrated QOM members (i.e. pointers of ARMCPU, which
>>>>>>>>>>> is still migrated elsewhere). So I don't see any obvious migration
>>>>>>>>>>> problem, but I might be missing something, so I Cc'ed Juan :>
>>>>>>>>
>>>>>>>> FWIW, I didn't spot anything problematic either.
>>>>>>>>
>>>>>>>> I've ran this through my migration compatibility series [1] and it
>>>>>>>> doesn't regress aarch64 migration from/to 8.2. The tests use '-M
>>>>>>>> virt -cpu max', so the cortex-a7 and cortex-a15 are not covered. I don't
>>>>>>>> think we even support migration of anything non-KVM on arm.
>>>>>>>
>>>>>>> it happens we do.
>>>>>>>
>>>>>>
>>>>>> Oh, sorry, I didn't mean TCG here. Probably meant to say something like
>>>>>> non-KVM-capable cpus, as in 32-bit. Nevermind.
>>>>>
>>>>> Theoretically, we should be able to migrate to a TCG guest. Well, this
>>>>> worked in the past for PPC. When I was doing more KVM related changes,
>>>>> this was very useful for dev. Also, some machines are partially emulated.
>>>>> Anyhow I agree this is not a strong requirement and we often break it.
>>>>> Let's focus on KVM only.
>>>>>
>>>>>>>> 1- https://gitlab.com/farosas/qemu/-/jobs/5853599533
>>>>>>>
>>>>>>> yes it depends on the QOM hierarchy and virt seems immune to the changes.
>>>>>>> Good.
>>>>>>>
>>>>>>> However, changing the QOM topology clearly breaks migration compat,
>>>>>>
>>>>>> Well, "clearly" is relative =) You've mentioned pseries and aspeed
>>>>>> already, do you have a pointer to one of those cases were we broke
>>>>>> migration
>>>>>
>>>>> Regarding pseries, migration compat broke because of 5bc8d26de20c
>>>>> ("spapr: allocate the ICPState object from under sPAPRCPUCore") which
>>>>> is similar to the changes proposed by this series, it impacts the QOM
>>>>> hierarchy. Here is the workaround/fix from Greg : 46f7afa37096
>>>>> ("spapr: fix migration of ICPState objects from/to older QEMU") which
>>>>> is quite an headache and this turned out to raise another problem some
>>>>> months ago ... :/ That's why I sent [1] to prepare removal of old
>>>>> machines and workarounds becoming a burden.
>>>>
>>>> This feels like something that could be handled by the vmstate code
>>>> somehow. The state is there, just under a different path.
>>>
>>> What, the QOM path is used in migration? ...
>>
>> Hopefully not..
>>
>>>
>>> See recent discussions on "QOM path stability":
>>> https://lore.kernel.org/qemu-devel/ZZfYvlmcxBCiaeWE@redhat.com/
>>> https://lore.kernel.org/qemu-devel/87jzojbxt7.fsf@pond.sub.org/
>>> https://lore.kernel.org/qemu-devel/87v883by34.fsf@pond.sub.org/
>>
>> If I read it right, the commit 46f7afa37096 example is pretty special that
>> the QOM path more or less decided more than the hierachy itself but changes
>> the existances of objects.
> 
> Let's see whether I got this...
> 
> We removed some useless objects, moved the useful ones to another home.
> The move changed their QOM path.

They interrupt controller presenter objects were quite useful :)
 From what I recall, we moved them from an array under the machine
to the CPU object, so the interrupt controller presenter states
previously under the machine were not there anymore and this broke
migration compatibility.

Sorry for the noise if this is not a problem anymore. It was at
the time and we found a way to work around it; I should probably
say we hacked our way around it. Nevertheless, this was kind of
a trauma too because since I never dared touch the QOM hierarchy
of a migratable machine again. Migration is complicated.


> The problem was the removal of useless objects, because this also
> removed their vmstate.
> 
> The fix was adding the vmstate back as a dummy.
> 
> The QOM patch changes are *not* part of the problem.
> 
> Correct?
> 
>>>> No one wants
>>>> to be policing QOM hierarchy changes in every single series that shows
>>>> up on the list.
>>>>
>>>> Anyway, thanks for the pointers. I'll study that code a bit more, maybe
>>>> I can come up with some way to handle these cases.
>>>>
>>>> Hopefully between the analyze-migration test and the compat tests we'll
>>>> catch the next bug of this kind before it gets merged.
>>
>> Things like that might be able to be detected via vmstate-static-checker.py.
>> But I'm not 100% sure, also its coverage is limited.
>>
>> For example, I don't think it can detect changes to objects that will only
>> be created dynamically, e.g., I think sometimes we create objects after
>> some guest behaviors (consider guest enables the device, then QEMU
>> emulation creates some objects on demand of device setup?),
> 
> Feels nuts to me.
> 
> In real hardware, software enabling a device that is disabled by default
> doesn't create the device.  The device is always there, it just happens
> to be inactive unless enabled.  We should model the device just like
> that.

yes. That's how we modeled the two interrupt modes in pseries. The
machine has two interrupt controller devices model always present
and the cpus, two interrupt presenters. SW negotiates with the
platform (QEMU) which mode to activate. This is the only way to
support migration with an OS that can choose such complex features.


For the context, POWER9 introduced a new flavor of HW logic for
interrupts, which scaled better on large system (16s) and guests
with newer OS could dynamically switch the SW interface to choose
the new implementation.

Thanks,

C.


> 
>>                                                              and since the
>> static checker shouldn't ever start the VM and run any code, they won't
>> trigger.
> 

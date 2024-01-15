Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp106660ejf;
        Mon, 15 Jan 2024 01:05:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+2ZEpCNa7ZdU9o0Yjd9Uc4ICc+mpwBVrWs600ZAOc69KATFEGBYDwu5ceLM85D/tFzAh3
X-Received: by 2002:a17:90a:6003:b0:28e:272:4727 with SMTP id y3-20020a17090a600300b0028e02724727mr1894044pji.0.1705309518520;
        Mon, 15 Jan 2024 01:05:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705309518; cv=none;
        d=google.com; s=arc-20160816;
        b=0YE+VNr62a/k/kh5AP4fiO1z0NdUT1Fy+rjrdA4LdlIWa1JAmj2tJ2r/Swwoks7vHw
         gr2TEz1kBw6BCj+dPYZd1c9Iny84K0Kan60daO1v4ePOO7XLaaZtPcmFiDoZmGp7yXHE
         4huXrMKxizjnswLKMwm9/4Hn1OT1IRKkds2SoajjdWawAvtb2vfSVAIdm9Fxg2Y5+PHN
         cjPrXtp930+eucGwSCpoVJXH69f7qZr3F6UJdfBgAir7iuXk02+JMN7gShHNOFtJ5gZ8
         BsjCLHd6dUk9/Pb3Q1buuRm+B8y/ITKAFNfFIR/ceBOHQuVJvspWjJ+jwJFx5gMU0onZ
         /UDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=BcYty4B4yUSYTNgnowoFcjlasHrdCVm0qNnTRXMcDKc=;
        fh=6BJLbSgDP+13DvE3/k0EcyypWvOeKepkYLZSR9LCZDE=;
        b=Y625YrO/Q+OBxv/fD1zXBzMU6Nlvp3P65R+gSR0D2Ln0UHXVIDgy4MGa5Kx/qrpOrq
         Ei2NXExkKCbifVzjnUEh0nPoBWMK37nwtwGXr9/fcJiX10oZdVYlhU94ZIoJPiB7CDlW
         Vgeh0edRBLLrmm6BD40qJ3QcrCHsZMob30TkuvqbrOD/o7gLUjYoYciJcnv8vTglLDDB
         G8CNB9t9JKKP0pdnMD+7KofIZTmeAq+AINfznfMvNKbP6Q6QWlkQWeAu2d1nKMkfLtPG
         D5BDL51XbkwME107STcR1k7UpqIuCnoPkWt1/wWskFUwwWAhPGjnzO6Pvy9V/j7m/KvW
         Ih1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=oxar=iz=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=oXar=IZ=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=oXar=IZ=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org. [150.107.74.76])
        by mx.google.com with ESMTPS id h4-20020a17090ac38400b0028ce3d29f34si8708420pjt.39.2024.01.15.01.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 01:05:18 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=oxar=iz=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) client-ip=150.107.74.76;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=oxar=iz=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=oXar=IZ=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TD5nm1HzLz4xG4;
	Mon, 15 Jan 2024 20:05:16 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TD5nS6d6bz4xFj;
	Mon, 15 Jan 2024 20:05:00 +1100 (AEDT)
Message-ID: <17903567-5c5c-4492-b9cf-eaaae7d903cf@kaod.org>
Date: Mon, 15 Jan 2024 10:04:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/33] hw/cpu/arm: Remove one use of qemu_get_cpu() in
 A7/A15 MPCore priv
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Tyrone Ting <kfting@nuvoton.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
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
 <87cyu9hgit.fsf@pond.sub.org> <874jfl8gwf.fsf@suse.de>
 <1d58a31b-3a8b-4a56-b9bc-dded024ac7dc@kaod.org> <871qamfhu8.fsf@suse.de>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <871qamfhu8.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ieuGazk2i161

On 1/12/24 20:54, Fabiano Rosas wrote:
> Cédric Le Goater <clg@kaod.org> writes:
> 
>> On 1/10/24 14:19, Fabiano Rosas wrote:
>>> Markus Armbruster <armbru@redhat.com> writes:
>>>
>>>> Peter Xu <peterx@redhat.com> writes:
>>>>
>>>>> On Tue, Jan 09, 2024 at 10:22:31PM +0100, Philippe Mathieu-Daudé wrote:
>>>>>> Hi Fabiano,
>>>>>>
>>>>>> On 9/1/24 21:21, Fabiano Rosas wrote:
>>>>>>> Cédric Le Goater <clg@kaod.org> writes:
>>>>>>>
>>>>>>>> On 1/9/24 18:40, Fabiano Rosas wrote:
>>>>>>>>> Cédric Le Goater <clg@kaod.org> writes:
>>>>>>>>>
>>>>>>>>>> On 1/3/24 20:53, Fabiano Rosas wrote:
>>>>>>>>>>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>>>>>>>>>>
>>>>>>>>>>>> +Peter/Fabiano
>>>>>>>>>>>>
>>>>>>>>>>>> On 2/1/24 17:41, Cédric Le Goater wrote:
>>>>>>>>>>>>> On 1/2/24 17:15, Philippe Mathieu-Daudé wrote:
>>>>>>>>>>>>>> Hi Cédric,
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> On 2/1/24 15:55, Cédric Le Goater wrote:
>>>>>>>>>>>>>>> On 12/12/23 17:29, Philippe Mathieu-Daudé wrote:
>>>>>>>>>>>>>>>> Hi,
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> When a MPCore cluster is used, the Cortex-A cores belong the the
>>>>>>>>>>>>>>>> cluster container, not to the board/soc layer. This series move
>>>>>>>>>>>>>>>> the creation of vCPUs to the MPCore private container.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Doing so we consolidate the QOM model, moving common code in a
>>>>>>>>>>>>>>>> central place (abstract MPCore parent).
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Changing the QOM hierarchy has an impact on the state of the machine
>>>>>>>>>>>>>>> and some fixups are then required to maintain migration compatibility.
>>>>>>>>>>>>>>> This can become a real headache for KVM machines like virt for which
>>>>>>>>>>>>>>> migration compatibility is a feature, less for emulated ones.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> All changes are either moving properties (which are not migrated)
>>>>>>>>>>>>>> or moving non-migrated QOM members (i.e. pointers of ARMCPU, which
>>>>>>>>>>>>>> is still migrated elsewhere). So I don't see any obvious migration
>>>>>>>>>>>>>> problem, but I might be missing something, so I Cc'ed Juan :>
>>>>>>>>>>>
>>>>>>>>>>> FWIW, I didn't spot anything problematic either.
>>>>>>>>>>>
>>>>>>>>>>> I've ran this through my migration compatibility series [1] and it
>>>>>>>>>>> doesn't regress aarch64 migration from/to 8.2. The tests use '-M
>>>>>>>>>>> virt -cpu max', so the cortex-a7 and cortex-a15 are not covered. I don't
>>>>>>>>>>> think we even support migration of anything non-KVM on arm.
>>>>>>>>>>
>>>>>>>>>> it happens we do.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Oh, sorry, I didn't mean TCG here. Probably meant to say something like
>>>>>>>>> non-KVM-capable cpus, as in 32-bit. Nevermind.
>>>>>>>>
>>>>>>>> Theoretically, we should be able to migrate to a TCG guest. Well, this
>>>>>>>> worked in the past for PPC. When I was doing more KVM related changes,
>>>>>>>> this was very useful for dev. Also, some machines are partially emulated.
>>>>>>>> Anyhow I agree this is not a strong requirement and we often break it.
>>>>>>>> Let's focus on KVM only.
>>>>>>>>
>>>>>>>>>>> 1- https://gitlab.com/farosas/qemu/-/jobs/5853599533
>>>>>>>>>>
>>>>>>>>>> yes it depends on the QOM hierarchy and virt seems immune to the changes.
>>>>>>>>>> Good.
>>>>>>>>>>
>>>>>>>>>> However, changing the QOM topology clearly breaks migration compat,
>>>>>>>>>
>>>>>>>>> Well, "clearly" is relative =) You've mentioned pseries and aspeed
>>>>>>>>> already, do you have a pointer to one of those cases were we broke
>>>>>>>>> migration
>>>>>>>>
>>>>>>>> Regarding pseries, migration compat broke because of 5bc8d26de20c
>>>>>>>> ("spapr: allocate the ICPState object from under sPAPRCPUCore") which
>>>>>>>> is similar to the changes proposed by this series, it impacts the QOM
>>>>>>>> hierarchy. Here is the workaround/fix from Greg : 46f7afa37096
>>>>>>>> ("spapr: fix migration of ICPState objects from/to older QEMU") which
>>>>>>>> is quite an headache and this turned out to raise another problem some
>>>>>>>> months ago ... :/ That's why I sent [1] to prepare removal of old
>>>>>>>> machines and workarounds becoming a burden.
>>>>>>>
>>>>>>> This feels like something that could be handled by the vmstate code
>>>>>>> somehow. The state is there, just under a different path.
>>>>>>
>>>>>> What, the QOM path is used in migration? ...
>>>>>
>>>>> Hopefully not..
>>>
>>> Unfortunately the original fix doesn't mention _what_ actually broke
>>> with migration. I assumed the QOM path was needed because otherwise I
>>> don't think the fix makes sense. The thread discussing that patch also
>>> directly mentions the QOM path:
>>>
>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg450912.html
>>>
>>> But I probably misunderstood something while reading that thread.
>>>
>>>>>
>>>>>>
>>>>>> See recent discussions on "QOM path stability":
>>>>>> https://lore.kernel.org/qemu-devel/ZZfYvlmcxBCiaeWE@redhat.com/
>>>>>> https://lore.kernel.org/qemu-devel/87jzojbxt7.fsf@pond.sub.org/
>>>>>> https://lore.kernel.org/qemu-devel/87v883by34.fsf@pond.sub.org/
>>>>>
>>>>> If I read it right, the commit 46f7afa37096 example is pretty special that
>>>>> the QOM path more or less decided more than the hierachy itself but changes
>>>>> the existances of objects.
>>>>
>>>> Let's see whether I got this...
>>>>
>>>> We removed some useless objects, moved the useful ones to another home.
>>>> The move changed their QOM path.
>>>>
>>>> The problem was the removal of useless objects, because this also
>>>> removed their vmstate.
>>>
>>> If you checkout at the removal commit (5bc8d26de20c), the vmstate has
>>> been kept untouched.
>>>
>>>>
>>>> The fix was adding the vmstate back as a dummy.
>>>
>>> Since the vmstate was kept I don't see why would we need a dummy. The
>>> incoming migration stream would still have the state, only at a
>>> different point in the stream. It's surprising to me that that would
>>> cause an issue, but I'm not well versed in that code.
>>>
>>>>
>>>> The QOM patch changes are *not* part of the problem.
>>>
>>> The only explanation I can come up with is that after the patch
>>> migration has broken after a hotplug or similar operation. In such
>>> situation, the preallocated state would always be present before the
>>> patch, but sometimes not present after the patch in case, say, a
>>> hot-unplug has taken away a cpu + ICPState.
>>
>> May be. It has been a while.
>>
>> For a better understanding, I tried to reproduce. QEMU 2.9 still
>> compiles on a f38 (memfd_create needs a fix). However, a
>> QEMU-2.9/pseries-2.9 machine won't start any recent OS because
>> something broke the OS/platform negotiation process (CAS) ...
> 
> Thanks for letting us know it still builds. That motivated me to try as
> well. Although it took me a while because of python's brokenness.
> 
> The issue was indeed the difference in preallocation vs. no
> preallocation. I don't remember how to do hotplug in ppc anymore, but
> maxcpus was sufficient to reproduce:
> 
> src 2.9.0:
> $ ./ppc64-softmmu/qemu-system-ppc64 -serial mon:stdio -nographic -vga none
> -display none -accel tcg -machine pseries -smp 4,maxcpus=8 -m 256M
> -nodefaults
> 
> dst 2.9.0 prior to 46f7afa:
> $ ./ppc64-softmmu/qemu-system-ppc64 -serial mon:stdio -display none
> -accel tcg -machine pseries-2.9 -smp 4,maxcpus=8 -m 256M -nodefaults
> -incoming defer
> 
> (qemu) migrate_incoming tcp:localhost:1234
> (qemu) qemu-system-ppc64: Unknown savevm section or instance 'icp/server' 4
> qemu-system-ppc64: load of migration failed: Invalid argument
> 
> As you can see, both use 4 cpus, but the src will try to migrate all 8
> icp/server instances. After the patch, the same migration works.
> 
> So this was not related to the QOM path nor the QOM hierarchy, it was
> just about having state created at machine init vs. cpu realize time. 

Ah ! of course, the machine is created in an init handler.

Thanks Fabiano, for the diagnostic and the time you took to reproduce
and analyze. I had this bad assumption of constraint between QOM vs.
migration and any change made me uncomfortable. You cleared it.

Good that we are deprecating this hack in a couple of versions.

> It
> might be wise to keep an eye on the QOM hierarchy anyway as it could
> make these kinds of changes more evident during review.

Clearly,


Thanks,

C.



>> I removed the pre_2_10_has_unused_icps hack and worked around
>> another migration compat issue in IOMMU ... Here are the last
>> trace-events for migration :
>>
>>       QEMU-mainline/pseries-2.9 -> QEMU-2.9/pseries-2.9
>>
>> 1016464@1705053752.106417:vmstate_load spapr, spapr
>> 1016464@1705053752.106419:vmstate_load_state spapr v3
>> 1016464@1705053752.106421:vmstate_load_state_field spapr:unused
>> 1016464@1705053752.106424:vmstate_load_state_field spapr:rtc_offset
>> 1016464@1705053752.106425:vmstate_load_state_field spapr:tb
>> 1016464@1705053752.106427:vmstate_n_elems tb: 1
>> 1016464@1705053752.106429:vmstate_load_state timebase v1
>> 1016464@1705053752.106432:vmstate_load_state_field timebase:guest_timebase
>> 1016464@1705053752.106433:vmstate_n_elems guest_timebase: 1
>> 1016464@1705053752.106435:vmstate_load_state_field timebase:time_of_the_day_ns
>> 1016464@1705053752.106436:vmstate_n_elems time_of_the_day_ns: 1
>> 1016464@1705053752.106438:vmstate_subsection_load timebase
>> 1016464@1705053752.106440:vmstate_subsection_load_bad timebase: spapr_option_vector_ov5_cas/(prefix)
>> 1016464@1705053752.106442:vmstate_load_state_end timebase end/0
>> 1016464@1705053752.106443:vmstate_subsection_load spapr
>> 1016464@1705053752.106445:vmstate_load_state spapr_option_vector_ov5_cas v1
>> 1016464@1705053752.106447:vmstate_load_state_field spapr_option_vector_ov5_cas:ov5_cas
>> 1016464@1705053752.106448:vmstate_n_elems ov5_cas: 1
>> 1016464@1705053752.106450:vmstate_load_state spapr_option_vector v1
>> 1016464@1705053752.106452:vmstate_load_state_field spapr_option_vector:bitmap
>> 1016464@1705053752.106454:vmstate_n_elems bitmap: 1
>> 1016464@1705053752.106456:vmstate_subsection_load spapr_option_vector
>> 1016464@1705053752.106457:vmstate_subsection_load_bad spapr_option_vector: (short)/
>> 1016464@1705053752.106459:vmstate_load_state_end spapr_option_vector end/0
>> 1016464@1705053752.106461:vmstate_subsection_load spapr_option_vector_ov5_cas
>> 1016464@1705053752.106462:vmstate_subsection_load_bad spapr_option_vector_ov5_cas: (short)/
>> 1016464@1705053752.106465:vmstate_load_state_end spapr_option_vector_ov5_cas end/0
>> 1016464@1705053752.106466:vmstate_subsection_load_bad spapr: spapr/cap/htm/(lookup)
>> qemu-system-ppc64: error while loading state for instance 0x0 of device 'spapr'
> 
> This trace this seems to be something else entirely. I'd be amazed if
> migrating mainline vs. something that old worked at all, even on x86.

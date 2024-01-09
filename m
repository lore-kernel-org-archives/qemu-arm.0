Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp550633ejs;
        Tue, 9 Jan 2024 10:06:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGObLoDmxy8X1R66U/q3UvEAjal8nbH0+7e9LDWHeo5p+kqOKGsy4BkNKUKT+9J2J3lAJbH
X-Received: by 2002:a17:902:7845:b0:1d5:4ba:c143 with SMTP id e5-20020a170902784500b001d504bac143mr5335866pln.130.1704823605011;
        Tue, 09 Jan 2024 10:06:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704823604; cv=none;
        d=google.com; s=arc-20160816;
        b=G66/Ml3Ch4Wvbu4AboMxPG+EbwPel+8ifNRwgLmcwlYPvPEzpiXF56q78QOug9yq6C
         UmpFGsLWmlemoyMMmfdM6ky5Taxh9DGnbBJ+v9fQicaSRZqvTz1l1RGp8ddA9Ts/sCkQ
         9T/xtas3JtyymjkL5sVE7unQkltSInT29u5oM/KfJUOOrn4XnatV+LExA+8WDe+XBU4+
         R/wZw31EUU8AvyjHCp/GCAm/l0BwSnXOPNegMSxUTuEiK6fVc/uChwxiJe/0lCo6ZLOa
         KEZ7ACUN12pOOuI4TckGeN+ebXT4LU4sND/NvsVrpAcSnlEAG8uS1n/QcBPoD+ZYxBdE
         jVww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=GdiBYgKqjNYQ1bcQDmCrXPsjtYR7xjzw0ydo9N8/qD8=;
        fh=imwoQFzikunaWxODekeFXoUboiSHzGdlklFTQPaRD40=;
        b=rp2DyCXYneTG+DqMBTsPb2BKF0UOwooHeBsmf9ZGsFyRJ3wBbo4i3CQaMbkCXALOhr
         yryMJUk1zLH1Y1K/M4lcW3aoWEF9B6kZa+gS6GUZ8QTMr9TlfaEN51dEgE8x+ZMXN+if
         NsS2nX6xCRkYnik8q7gOSDoMGQm6cxU2xUdLUypAjIo6DAJufV5xIRxt5UenyM+H/3hj
         E9fs81p69FJKk0avRCa9psip0eYCFtYuCN+JcKw0991LTogWq48msKvuNfr7MyN9pQWw
         hov7hIHv9QJ32fGTuo2uMfSb7MdirdihHyPS9E/XSpKrmBhCgmy04xe2LpVPquASCnwj
         j5eg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=gpa9=it=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=Gpa9=IT=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=Gpa9=IT=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (mail.ozlabs.org. [2404:9400:2221:ea00::3])
        by mx.google.com with ESMTPS id a19-20020a170902ee9300b001d4af8e295bsi1824640pld.116.2024.01.09.10.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 10:06:44 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=gpa9=it=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) client-ip=2404:9400:2221:ea00::3;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=gpa9=it=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=Gpa9=IT=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4T8f5G0RL4z4wx8;
	Wed, 10 Jan 2024 05:06:42 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T8f561MDXz4wbR;
	Wed, 10 Jan 2024 05:06:33 +1100 (AEDT)
Message-ID: <d5c0b9fb-8b09-4f68-b3ab-c8adffd484a9@kaod.org>
Date: Tue, 9 Jan 2024 19:06:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/33] hw/cpu/arm: Remove one use of qemu_get_cpu() in
 A7/A15 MPCore priv
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
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
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87plya76cu.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: fec7NFC3JYbC

On 1/9/24 18:40, Fabiano Rosas wrote:
> Cédric Le Goater <clg@kaod.org> writes:
> 
>> On 1/3/24 20:53, Fabiano Rosas wrote:
>>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>>
>>>> +Peter/Fabiano
>>>>
>>>> On 2/1/24 17:41, Cédric Le Goater wrote:
>>>>> On 1/2/24 17:15, Philippe Mathieu-Daudé wrote:
>>>>>> Hi Cédric,
>>>>>>
>>>>>> On 2/1/24 15:55, Cédric Le Goater wrote:
>>>>>>> On 12/12/23 17:29, Philippe Mathieu-Daudé wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> When a MPCore cluster is used, the Cortex-A cores belong the the
>>>>>>>> cluster container, not to the board/soc layer. This series move
>>>>>>>> the creation of vCPUs to the MPCore private container.
>>>>>>>>
>>>>>>>> Doing so we consolidate the QOM model, moving common code in a
>>>>>>>> central place (abstract MPCore parent).
>>>>>>>
>>>>>>> Changing the QOM hierarchy has an impact on the state of the machine
>>>>>>> and some fixups are then required to maintain migration compatibility.
>>>>>>> This can become a real headache for KVM machines like virt for which
>>>>>>> migration compatibility is a feature, less for emulated ones.
>>>>>>
>>>>>> All changes are either moving properties (which are not migrated)
>>>>>> or moving non-migrated QOM members (i.e. pointers of ARMCPU, which
>>>>>> is still migrated elsewhere). So I don't see any obvious migration
>>>>>> problem, but I might be missing something, so I Cc'ed Juan :>
>>>
>>> FWIW, I didn't spot anything problematic either.
>>>
>>> I've ran this through my migration compatibility series [1] and it
>>> doesn't regress aarch64 migration from/to 8.2. The tests use '-M
>>> virt -cpu max', so the cortex-a7 and cortex-a15 are not covered. I don't
>>> think we even support migration of anything non-KVM on arm.
>>
>> it happens we do.
>>
> 
> Oh, sorry, I didn't mean TCG here. Probably meant to say something like
> non-KVM-capable cpus, as in 32-bit. Nevermind.

Theoretically, we should be able to migrate to a TCG guest. Well, this
worked in the past for PPC. When I was doing more KVM related changes,
this was very useful for dev. Also, some machines are partially emulated.
Anyhow I agree this is not a strong requirement and we often break it.
Let's focus on KVM only.

>>> 1- https://gitlab.com/farosas/qemu/-/jobs/5853599533
>>
>> yes it depends on the QOM hierarchy and virt seems immune to the changes.
>> Good.
>>
>> However, changing the QOM topology clearly breaks migration compat,
> 
> Well, "clearly" is relative =) You've mentioned pseries and aspeed
> already, do you have a pointer to one of those cases were we broke
> migration 

Regarding pseries, migration compat broke because of 5bc8d26de20c
("spapr: allocate the ICPState object from under sPAPRCPUCore") which
is similar to the changes proposed by this series, it impacts the QOM
hierarchy. Here is the workaround/fix from Greg : 46f7afa37096
("spapr: fix migration of ICPState objects from/to older QEMU") which
is quite an headache and this turned out to raise another problem some
months ago ... :/ That's why I sent [1] to prepare removal of old
machines and workarounds becoming a burden.

Regarding aspeed, this series breaks compat. Not that we care much
but ​this caught my attention because of my past experience on pseries.
Same kind of QOM change which could impact other machines, like virt.
Since you checked that migration compat is preserved on virt, we should
be fine.

Thanks,

C.

[1] https://lore.kernel.org/qemu-devel/20231214181723.1520854-1-clg@kaod.org/

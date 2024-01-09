Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp438316ejs;
        Tue, 9 Jan 2024 07:03:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHl1uc8U3gsqyAqzcY9ZDxsJupCtLO7s2bKX4Uis+OX46ZdkuGX1I+YNXBcvZYZ9CKF0fEs
X-Received: by 2002:a17:903:2345:b0:1d4:c7d5:3587 with SMTP id c5-20020a170903234500b001d4c7d53587mr3558409plh.9.1704812589440;
        Tue, 09 Jan 2024 07:03:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704812589; cv=none;
        d=google.com; s=arc-20160816;
        b=cm0odvh0i5PHulcYaczVJxqAa6nUhsjAPaomZ9LqBMVElOQ3QN6M9fSmrH1wFehxwB
         rLWxHveQiMkb/S/RtrcKXMrx0CXxPENP8x/vzcPkW5XTwWBU/8Wgrs6aDePuFoJpuOST
         iFjLPTLKeUdlnwlY4xSEHcVSCoMD9YUNQWT3o2onaTf7fI0aSnWXcen66NzHbIMFR+sc
         BXJq9e/jNMucK6iTXiDmESfIUyfUVnzSY/vGRx4R4vn1XaiIkN6E29InP6Uk2DklgECi
         Ofn1iWVvxuFWBsiubVUlI0JbANJTq3hVXzkJGshuwgYK4jym12BtOZBjKMf2NnvW57Lx
         xd7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=9U64oeySMrM4xdb3rGJdLUjGw0r7kuNLRsCddm2X+FE=;
        fh=imwoQFzikunaWxODekeFXoUboiSHzGdlklFTQPaRD40=;
        b=K1dKcB7ZEI37KXnJ8KVfZWkjFRnvOzKD4VpFW7VDcF9uYd1106+RTC3XcoTkOz3VLa
         RZXv+DG8StjRxGUOI4l3nfh579a1eRQooOBiRWbL/0+DY+qxQxK0PNwKznIkfhxNymDx
         UCFkCBUUzuI+4Zp7VSeULqK6ZjWXArjQyXB19F6aEVXrh4YaFsAEsdH//FBmaMpz0y+M
         jMVc2AAJsmOIoFZSfGbWDvkY/GKGex8qyaQzEfateQNjrDeUysGFWh67umHOERRyNtkw
         PnN5rtH9JcLD/Nwpd/oCbVLVhQXVPKT1geqdiLoW3G/RWIHSJJqpzKkpFf3naBq6onX1
         0r4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=gpa9=it=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=Gpa9=IT=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=Gpa9=IT=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (mail.ozlabs.org. [2404:9400:2221:ea00::3])
        by mx.google.com with ESMTPS id jh14-20020a170903328e00b001d4666effbesi1613763plb.195.2024.01.09.07.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 07:03:09 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=gpa9=it=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) client-ip=2404:9400:2221:ea00::3;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=gpa9=it=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=Gpa9=IT=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4T8Z1P6zKQz4xG8;
	Wed, 10 Jan 2024 02:03:05 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T8Z1G1RxHz4xFD;
	Wed, 10 Jan 2024 02:02:57 +1100 (AEDT)
Message-ID: <597186d9-af21-46e8-8075-f21d36c01c07@kaod.org>
Date: Tue, 9 Jan 2024 16:02:53 +0100
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
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87y1d6i47m.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: EuBMZTBMC4k1

On 1/3/24 20:53, Fabiano Rosas wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> +Peter/Fabiano
>>
>> On 2/1/24 17:41, Cédric Le Goater wrote:
>>> On 1/2/24 17:15, Philippe Mathieu-Daudé wrote:
>>>> Hi Cédric,
>>>>
>>>> On 2/1/24 15:55, Cédric Le Goater wrote:
>>>>> On 12/12/23 17:29, Philippe Mathieu-Daudé wrote:
>>>>>> Hi,
>>>>>>
>>>>>> When a MPCore cluster is used, the Cortex-A cores belong the the
>>>>>> cluster container, not to the board/soc layer. This series move
>>>>>> the creation of vCPUs to the MPCore private container.
>>>>>>
>>>>>> Doing so we consolidate the QOM model, moving common code in a
>>>>>> central place (abstract MPCore parent).
>>>>>
>>>>> Changing the QOM hierarchy has an impact on the state of the machine
>>>>> and some fixups are then required to maintain migration compatibility.
>>>>> This can become a real headache for KVM machines like virt for which
>>>>> migration compatibility is a feature, less for emulated ones.
>>>>
>>>> All changes are either moving properties (which are not migrated)
>>>> or moving non-migrated QOM members (i.e. pointers of ARMCPU, which
>>>> is still migrated elsewhere). So I don't see any obvious migration
>>>> problem, but I might be missing something, so I Cc'ed Juan :>
> 
> FWIW, I didn't spot anything problematic either.
> 
> I've ran this through my migration compatibility series [1] and it
> doesn't regress aarch64 migration from/to 8.2. The tests use '-M
> virt -cpu max', so the cortex-a7 and cortex-a15 are not covered. I don't
> think we even support migration of anything non-KVM on arm.

it happens we do.

> 
> 1- https://gitlab.com/farosas/qemu/-/jobs/5853599533

yes it depends on the QOM hierarchy and virt seems immune to the changes.
Good.

However, changing the QOM topology clearly breaks migration compat,
at least on the Aspeed SoC. The question is : do we care ? For Aspeed
probably not, but the series should say so.

Thanks,

C.



  
> 
>>> We broke migration compatibility by moving the IC object in the QOM
>>> hierarchy of the pseries machines in the past. These changes might
>>> be different. Here is the QOM tree of the ast2600 SoC.
>>>
>>> before :
>>>
>>>     /soc (ast2600-a3)
>>>       /a7mpcore (a15mpcore_priv)
>>>         /a15mp-priv-container[0] (memory-region)
>>>         /gic (arm_gic)
>>>           /gic_cpu[0] (memory-region)
>>>           /gic_cpu[1] (memory-region)
>>>           /gic_cpu[2] (memory-region)
>>>           /gic_dist[0] (memory-region)
>>>           /gic_vcpu[0] (memory-region)
>>>           /gic_viface[0] (memory-region)
>>>           /gic_viface[1] (memory-region)
>>>           /gic_viface[2] (memory-region)
>>>       /cpu[0] (cortex-a7-arm-cpu)
>>>       /cpu[1] (cortex-a7-arm-cpu)
>>>
>>> after :
>>>
>>>     /soc (ast2600-a3)
>>>       /a7mpcore (a7mpcore_priv)
>>>         /cpu[0] (cortex-a7-arm-cpu)
>>>         /cpu[1] (cortex-a7-arm-cpu)
>>>         /gic (arm_gic)
>>>           /gic_cpu[0] (memory-region)
>>>           /gic_cpu[1] (memory-region)
>>>           /gic_cpu[2] (memory-region)
>>>           /gic_dist[0] (memory-region)
>>>         /mpcore-priv-container[0] (memory-region)
>>>
>>>
>>> Thanks,
>>>
>>> C.
>>>
>>>
>>>

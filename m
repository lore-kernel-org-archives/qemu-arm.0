Received: by 2002:a17:906:cc9:b0:a28:7ef3:d049 with SMTP id l9csp12968ejh;
        Tue, 2 Jan 2024 08:41:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWUjdX/qk30KD7Nl+cwDPFc+fwN4FGVM/F6nB4JOPXvT8AzsJfvrW8vLFgO7d7zwXYTHWq
X-Received: by 2002:a05:6e02:1a6b:b0:35f:f9a0:68f4 with SMTP id w11-20020a056e021a6b00b0035ff9a068f4mr12308394ilv.109.1704213687538;
        Tue, 02 Jan 2024 08:41:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704213687; cv=none;
        d=google.com; s=arc-20160816;
        b=JS79lodHC3jciSLEGN/f4pyzBy1etzOsMTwl1HQ45tpz+R9+T7xk+j7qZYcO6NNBTe
         zoK9JmAxmdvbcdI9AzpBiyN69YtiwK/mTEbs4nww3IEAOIetH9X9A4XoDTS2nPf5o0Me
         4ODnonfPMeTBH7IltGVlVdB2wwV1UQHhwbND0Sz3/k5ZSsQZA6kIHh6kTJvouXUpKH+B
         +CDgxJXXX0/sU5IbsTqKG3M8McFJqcQyny0lAOGFArCD6WZCDASDvqOS0YOzRMnf/WNZ
         HsKYYPqWhtnzccd6xpU1HyiO7OpimMGKlyZayVeqDCPM1KU2DrUYFCDogI7XLxP49S49
         SWaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=viR0raTW3E0Pgb5rL75oEejPdska3gt+1j6e7kS1WNc=;
        fh=lJ+1OkBYM5/tcmoRoErqEEjSI3NSSg3P2v8GA0uBP1M=;
        b=ehxyahEGEQABabXLzn6WmUk3xp2T9DbH5knbSrXmczoAepeOt5t4hGO9erOJn5fMic
         LTARlNIGchqiuK92WG/YyO+d/0WuzNNiM++v+497u7bKZwaaVYCQWRpHfWhenee5azGv
         z8zxGtNjpONkXljNK0D5XSjN9ZLmJ86F0Dw5bxc+IxQQP8G6A6S0oacvcyNcF6A5Y16M
         97HlnKiB6kBbIOhNCFpY5VpYwRivNkADuSX3DK7asA0rX7HN9/sMOOV4uDpu7xCkwCQM
         DP6rq4deVjxPjyzdoqqhPyZqMHKBQPsQCh1tFOF/nXVvzNjm1A7yBcrtBIne5xuWR+hZ
         2XAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=hBD0=IM=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org. [150.107.74.76])
        by mx.google.com with ESMTPS id t14-20020a63f34e000000b005cd98356cc5si19604836pgj.902.2024.01.02.08.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 08:41:27 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) client-ip=150.107.74.76;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4T4JX374jHz4x5r;
	Wed,  3 Jan 2024 03:41:23 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T4JWw1vlvz4x1t;
	Wed,  3 Jan 2024 03:41:15 +1100 (AEDT)
Message-ID: <38cfa9de-874b-41dd-873e-5ad1f5a5805e@kaod.org>
Date: Tue, 2 Jan 2024 17:41:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/33] hw/cpu/arm: Remove one use of qemu_get_cpu() in
 A7/A15 MPCore priv
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
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
 qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20231212162935.42910-1-philmd@linaro.org>
 <03b969d3-1947-4186-b3ee-15e3cddc5f34@kaod.org>
 <18a38b88-8f20-420c-9916-a03d1b4930a7@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <18a38b88-8f20-420c-9916-a03d1b4930a7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 3Fen2p1IdP0k

On 1/2/24 17:15, Philippe Mathieu-Daudé wrote:
> Hi Cédric,
> 
> On 2/1/24 15:55, Cédric Le Goater wrote:
>> On 12/12/23 17:29, Philippe Mathieu-Daudé wrote:
>>> Hi,
>>>
>>> When a MPCore cluster is used, the Cortex-A cores belong the the
>>> cluster container, not to the board/soc layer. This series move
>>> the creation of vCPUs to the MPCore private container.
>>>
>>> Doing so we consolidate the QOM model, moving common code in a
>>> central place (abstract MPCore parent).
>>
>> Changing the QOM hierarchy has an impact on the state of the machine
>> and some fixups are then required to maintain migration compatibility.
>> This can become a real headache for KVM machines like virt for which
>> migration compatibility is a feature, less for emulated ones.
> 
> All changes are either moving properties (which are not migrated)
> or moving non-migrated QOM members (i.e. pointers of ARMCPU, which
> is still migrated elsewhere). So I don't see any obvious migration
> problem, but I might be missing something, so I Cc'ed Juan :>
We broke migration compatibility by moving the IC object in the QOM
hierarchy of the pseries machines in the past. These changes might
be different. Here is the QOM tree of the ast2600 SoC.

before :

   /soc (ast2600-a3)
     /a7mpcore (a15mpcore_priv)
       /a15mp-priv-container[0] (memory-region)
       /gic (arm_gic)
         /gic_cpu[0] (memory-region)
         /gic_cpu[1] (memory-region)
         /gic_cpu[2] (memory-region)
         /gic_dist[0] (memory-region)
         /gic_vcpu[0] (memory-region)
         /gic_viface[0] (memory-region)
         /gic_viface[1] (memory-region)
         /gic_viface[2] (memory-region)
     /cpu[0] (cortex-a7-arm-cpu)
     /cpu[1] (cortex-a7-arm-cpu)

after :

   /soc (ast2600-a3)
     /a7mpcore (a7mpcore_priv)
       /cpu[0] (cortex-a7-arm-cpu)
       /cpu[1] (cortex-a7-arm-cpu)
       /gic (arm_gic)
         /gic_cpu[0] (memory-region)
         /gic_cpu[1] (memory-region)
         /gic_cpu[2] (memory-region)
         /gic_dist[0] (memory-region)
       /mpcore-priv-container[0] (memory-region)


Thanks,

C.



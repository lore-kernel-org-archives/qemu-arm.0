Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp2197085ejs;
        Thu, 11 Jan 2024 23:29:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFW4SVnamPSQ5Qum6ddVGZYOOSRwwt6aIUsfqIhkjLOxSl2qcT4keEyipMwslyf68xmr7zZ
X-Received: by 2002:a05:6359:6b89:b0:175:a79e:21b3 with SMTP id ta9-20020a0563596b8900b00175a79e21b3mr919955rwb.13.1705044588017;
        Thu, 11 Jan 2024 23:29:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705044587; cv=none;
        d=google.com; s=arc-20160816;
        b=VTHYhDr9MVB3glyOx6jEwar8oa9GVJAnxGLEWlbIhxoErepFEs4FH+ppDzKwx1LrSy
         quCOCniqcpiQn9PWoNtDQbf/f/2AMEzNRFech5SE8D2Beff8z9wmlf2wYa08P5hAqKWi
         G8r8jjqbLyA+KgD0nb4tMFrwLJL/lNbYaKuYSmNmfnfHf64d/7iXbAYFJ8xIzuZJucan
         TCdLQYUpUXImjq0GqxE84+7VuXr1AY9CrDfnp335gpccKUk+jidm6ul55rLx+qnLac3z
         mpCO5i6xHS1V0Tomws5ZUBU2WF3yYFwKdaj9njvZhlPEdsxePduOaDAPQ6q9n6psDrBn
         fE+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=3MKp4q6DIcWNusf2Q6B9NpiRfoilXcQMK56ltvlweRY=;
        fh=VwstGSR0xcOYJhziV7z8p6b90WYb250cJKKwgb72cNg=;
        b=P1pTEw38JAysQDbMGMsHj8wm6mOi/lkmEYLsEWa0kQGZ4uN+Zy37aNGJGQEiKjpho4
         i0BqBLrODIou8JQRMV/UkG6BV8Sh07VaCK9SMQak1X/m6nPSaOHo1z29nqCL3swNy2W3
         UB2FkwyhKdFlVHeq8HcotV4qujzTQmy7wC/iGK65Y0n80BcUDkT/ORRsclDFwp7Ek3h4
         eeGtr5LmLMl5hR18fILan1i5j37eFkoDdJQYGOdG1TaC5lHckrOVTPNAfXNYbj02MR/B
         bfwtqfhxNDSNnKuTxwfHhYBzuO0kHYWc5rTbT8nMv/X6g1jo19UBq9wmslAIYKpK4dL2
         AGyw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=qink=iw=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=qInK=IW=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=qInK=IW=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (mail.ozlabs.org. [2404:9400:2221:ea00::3])
        by mx.google.com with ESMTPS id t12-20020a056a00138c00b006d979da61b9si2776724pfg.338.2024.01.11.23.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 23:29:47 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=qink=iw=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) client-ip=2404:9400:2221:ea00::3;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=qink=iw=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=qInK=IW=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TBCpw5K6fz4wnw;
	Fri, 12 Jan 2024 18:29:44 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TBCpl1z17z4wc6;
	Fri, 12 Jan 2024 18:29:35 +1100 (AEDT)
Message-ID: <2c03b5a7-9f6d-49af-8931-00e1fb14065d@kaod.org>
Date: Fri, 12 Jan 2024 08:29:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/33] hw/cpu/arm: Remove one use of qemu_get_cpu() in
 A7/A15 MPCore priv
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
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
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <e2a282a5-b92a-439e-9ecf-3ea1f74deb25@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: H+XEGOqkcqOr


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
> We need to understand this.

Nothing complex,

$ wget https://github.com/legoater/qemu-aspeed-boot/raw/master/images/ast2600-evb/buildroot-2023.11/flash.img

$ qemu-system-arm -M ast2600-evb -net user -drive file=./flash.img,format=raw,if=mtd -nographic -snapshot -serial mon:stdio  -trace vmstate* -trace save* -trace load*

$ qemu-system-arm-patch -M ast2600-evb -net user -drive file=./flash.img,format=raw,if=mtd -nographic -snapshot -serial mon:stdio  -trace vmstate* -trace save* -trace load* -incoming tcp::1234

stop the VM in U-boot before loading the kernel because QEMU does not
support migrating CPU when in secure mode. That's how I understood what
Peter told me.

(qemu) migrate tcp:localhost:1234

...
vmstate_load_state_field cpu:cpreg_vmstate_array_len
vmstate_n_elems cpreg_vmstate_array_len: 1
qemu-system-arm: Invalid value 266 expecting positive value <= 223
qemu-system-arm: Failed to load cpu:cpreg_vmstate_array_len
vmstate_load_field_error field "cpreg_vmstate_array_len" load failed, ret = -22
qemu-system-arm: error while loading state for instance 0x0 of device 'cpu'

Thanks,

C.

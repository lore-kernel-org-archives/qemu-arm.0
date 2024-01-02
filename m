Received: by 2002:a17:906:eca:b0:a27:dfb7:c645 with SMTP id u10csp1331004eji;
        Tue, 2 Jan 2024 05:52:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG25P3BK4DLPKFYb3HhFKTrGRupCVcHtS3h0Y3H83FxZ2rmgPmHITqlZroebcmhY/CnvZvn
X-Received: by 2002:a17:902:e88d:b0:1d4:be56:888b with SMTP id w13-20020a170902e88d00b001d4be56888bmr978812plg.1.1704203564136;
        Tue, 02 Jan 2024 05:52:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704203564; cv=none;
        d=google.com; s=arc-20160816;
        b=zoXRyv9iIWSPNxBtQzwl37r3NpAawaFdTEyE3XkQ6zYtAZ17KJT96nmWIlinQ4NFJp
         GJhgBxt5P8LRTNDF62wa7Py0a2lGrDvL5ngzwlhpJjbzOzHAKz71+PU4JpnDVGDqlErv
         ZvTTTolmcS7blXV5/iKBHVuKE3vCRLP4iLmuvLhdK8A727owxXRzwOSZYGWYAMabaYYg
         /DKEsJurXLLVUYCyKGH4RRvoSkuZz9/MfyMvW2ooV4GpuvKCD9Rt4IQ5hOjsiPPUFgtH
         fhvWzIiYRqGQGfRUSbb/cATDHMJromwYhtv+oSbB6FTlyE9L4RPe/zYgtQREh5ofcYct
         wRhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=gUw6914ZNFnqUDDDhb6VvywE8ERaa6Zsc15Qkyz5uEE=;
        fh=+E/US/1Ju6gLetNBGXtM+LAEvu+9GnutnPYZSrJVors=;
        b=yyUciB8va0/EopQ6nBjUuQIy/sHCwwx4zm+4xwslSyolxf1olvCP5LfuGz4VjeaEyI
         By6moMHvbWnym5DFcqbdPd/MZ3FJTZrv4902LlQQVugTlz8678Bp6pF8IxCLACDv59Gq
         NhS8uggeIKIRlKW0Iz0uArMm9stxFImkbfC1nFdDmvcfekjjwFbtquiyLHQOSdqcl/eU
         MvOSaf3SNvhvQBa23ovs1XcbBn63dhafEV2g8i0jbknOQVh2WAcj3HmjN8dXU2fd2Quk
         M9pk3RlrOSgyv1hO2516f5ZwUXuOZnrid3K6zMgSWiEUtbkRW6cfJ2lxWp010twy06qz
         bOOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=hBD0=IM=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (mail.ozlabs.org. [2404:9400:2221:ea00::3])
        by mx.google.com with ESMTPS id m7-20020a170902768700b001d4b3f51b85si3712583pll.484.2024.01.02.05.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 05:52:44 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) client-ip=2404:9400:2221:ea00::3;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4T4DnQ1sssz4x5K;
	Wed,  3 Jan 2024 00:52:42 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T4DnJ5slHz4wny;
	Wed,  3 Jan 2024 00:52:36 +1100 (AEDT)
Message-ID: <20a0ffb6-ac44-4c87-b49a-fec4a479f171@kaod.org>
Date: Tue, 2 Jan 2024 14:52:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/33] hw/arm/fsl-imx6ul: Add a local 'gic' variable
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
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
 <20231212162935.42910-4-philmd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231212162935.42910-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: T42qqc4fqkDd

On 12/12/23 17:29, Philippe Mathieu-Daudé wrote:
> The A7MPCore forward the IRQs from its internal GIC.
> To make the code clearer, add a 'gic' variable.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



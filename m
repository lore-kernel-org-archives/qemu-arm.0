Received: by 2002:a17:906:eca:b0:a27:dfb7:c645 with SMTP id u10csp1331264eji;
        Tue, 2 Jan 2024 05:53:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDSszEYvpDwFOrLeeIOH9G6Wuv0/vSTdGhrYDwqtxk/GVKkRLMnsQSqVJIA1F6BeglHOLT
X-Received: by 2002:a17:902:64d0:b0:1d4:32e2:3f4a with SMTP id y16-20020a17090264d000b001d432e23f4amr7554658pli.5.1704203599653;
        Tue, 02 Jan 2024 05:53:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704203599; cv=none;
        d=google.com; s=arc-20160816;
        b=u+9z/bS/3emUlmwY4dV0XHkdyVoUs1HucYG3Q234YaoksOVHt3HwgsnXS4GhRbyA/T
         UQl1APjLib475JZ1z1ZAzrsCfljd6pLeHlpv63kW/kAqUocVgGJrw26IcC19+ecJapDW
         nBm673uEWoU+MD0hDPdtb63SOatxQrqCrKkbaMqnjeqc3yGVvLZuO1R3qjCYHKMPphNu
         R1mLNeoC0P1kWaghITNdrtkbnSGWW6cw0S+b1BYJzyL4gil5RFsFoEISBTO/bgPmkg3Q
         q6tXuETn094J/mvGwjgmWvXOtBBfVDw8ZasFMCvH6GNPpDtkipuwtjEzX/8zlJn2wvrA
         UCRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=gUw6914ZNFnqUDDDhb6VvywE8ERaa6Zsc15Qkyz5uEE=;
        fh=+E/US/1Ju6gLetNBGXtM+LAEvu+9GnutnPYZSrJVors=;
        b=qOdMR0I0lHAb9JciWCwrfERVfHOWeJBsaf0RzssjGLaYW7vYwzGSkTOmeox+C1KyFy
         soCNrxTbGFuCw6gvtFXihnnqTOLQN942GPDOVut8x0hcYzojqwmHLHOsYtneOIR/sLV1
         lxzUVd6/ukQEO0dxW6GEuxqa3RC71unhWwIDR8xotk+DQBzaKPNiNy7Q5Ojof3yHcElw
         QBcLOnWjmTS0zfuOWn2t+k1SO1gR4dNbFfFtwr3rTCgF+XOsnhErozyq40SekLgH8OQc
         ISR3e36GDqslsKx2KUjAQ04PagnmoDZpmoBV+DrZSRc6wYARZ2JndDQdSmPCtsNAR4l/
         SgqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=hBD0=IM=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (mail.ozlabs.org. [2404:9400:2221:ea00::3])
        by mx.google.com with ESMTPS id l12-20020a170903120c00b001d485a81276si9781669plh.262.2024.01.02.05.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 05:53:19 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) client-ip=2404:9400:2221:ea00::3;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4T4Dp446DTz4x5l;
	Wed,  3 Jan 2024 00:53:16 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T4Dnz1TLxz4x5h;
	Wed,  3 Jan 2024 00:53:10 +1100 (AEDT)
Message-ID: <03959676-a070-4a2f-a6ff-32d55aa9c6dd@kaod.org>
Date: Tue, 2 Jan 2024 14:53:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/33] hw/arm/fsl-imx7: Add a local 'gic' variable
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
 <20231212162935.42910-5-philmd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231212162935.42910-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Hrm+6KravanJ

On 12/12/23 17:29, Philippe Mathieu-Daudé wrote:
> The A7MPCore forward the IRQs from its internal GIC.
> To make the code clearer, add a 'gic' variable.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


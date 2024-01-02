Received: by 2002:a17:906:eca:b0:a27:dfb7:c645 with SMTP id u10csp1335062eji;
        Tue, 2 Jan 2024 06:00:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEawM1BaH4i0hl6ePmlQs5Go66GO+PD0NRcGNzC+F838SoR0WyXkFdPgeuPKk1DR9Axzxg7
X-Received: by 2002:a05:6a21:7889:b0:197:1bdb:cc7b with SMTP id bf9-20020a056a21788900b001971bdbcc7bmr669791pzc.0.1704204054866;
        Tue, 02 Jan 2024 06:00:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704204054; cv=none;
        d=google.com; s=arc-20160816;
        b=SqAqolHhsHEVGTJ3HmE8bhshGRPbd2bTEeN1ImScfW2K2QGc7jxCoHo9vKX87iD4HL
         6sSECvvnGadU8k36URUpHzsuBWjeS1nJiRpLu05vi6u4sm6t2i32U6Rxkf/5BJcR+K1G
         921LjaDCyVLIIuI1BPwuvXuZ/k2kl4kuL3Lds4aLK3RRX8RsgGFPkbEQ0UfLcPhSkLET
         x08vIKLtcE8WWYqoIEGauxJABj7TztvZ3TTELluMXwbK9kuZvjtXu/kGn3rQOFHBPTz6
         8hS7yWlXFVKuuArKhVMcoEAEVQunkinQ4eGfddAC5R6eo2RFGmF45K1mWdyJ0wui38eo
         o4bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=IFm6zSp4h1f54ELewwhE5JS+WBm82RYV/2sylnYxGjY=;
        fh=+E/US/1Ju6gLetNBGXtM+LAEvu+9GnutnPYZSrJVors=;
        b=K7VxpvOqE+EeGW5L3Y5r1j/PzG/Ip8DA5U2kgmlxpwc05LC4UnPG/EjSmeFeUosnpk
         FqDyX8WLP/3XdV87xjbD39t+wFwNN5luY07HghmXLdR5KtJeOsddomWssJ1lbm2zs1nU
         6h3ce+X9weSqeFNWLRab+aaKpStKofnZKbmJ1zG/JsZxgxpqO6+MH314oBprkzdVy1yh
         bYVNQaIt3/Xup/mXwwze1QeY5sQbCfjhDrQb19ATMp0LOcIBvw3/nnOuSKppc54IYnLA
         Tr3M5x5DIG05shIsOJTtLYDkG8Bq6fSD9ycbiSzYRV6Usk1x+cDdzcnZPbpWeFz3gNJy
         p+hw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=hBD0=IM=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org. [150.107.74.76])
        by mx.google.com with ESMTPS id a40-20020a056a001d2800b006d9a6f39e36si16064680pfx.252.2024.01.02.06.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 06:00:54 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) client-ip=150.107.74.76;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4T4Dyr0p9Pz4wny;
	Wed,  3 Jan 2024 01:00:52 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T4Dyk4nBFz4wcX;
	Wed,  3 Jan 2024 01:00:46 +1100 (AEDT)
Message-ID: <e4a0b3e1-40e4-4ab1-91a0-c8337b93bb86@kaod.org>
Date: Tue, 2 Jan 2024 15:00:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/33] hw/cpu/arm: Merge {a9mpcore.h, a15mpcore.h} as
 cortex_mpcore.h
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
 <20231212162935.42910-10-philmd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231212162935.42910-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 2wFp7enj9RSb

On 12/12/23 17:29, Philippe Mathieu-Daudé wrote:
> Merge Cortex-A{9,15} MPCore devices in the same header.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



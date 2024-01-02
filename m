Received: by 2002:a17:906:eca:b0:a27:dfb7:c645 with SMTP id u10csp1331670eji;
        Tue, 2 Jan 2024 05:54:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtEI0n+LrnQjEWzwYROeFX0EQEC0OxFulhw7mGKJEFMWh+V5qip3Uy2IsTf5hxrIOZS/+y
X-Received: by 2002:a17:903:2442:b0:1d4:11a8:a2a8 with SMTP id l2-20020a170903244200b001d411a8a2a8mr8717872pls.57.1704203653805;
        Tue, 02 Jan 2024 05:54:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704203653; cv=none;
        d=google.com; s=arc-20160816;
        b=sURuLs3kYvo5INBWLv7LtVCPDTSzJ240KSibuXgj66ZHgMlNRQTOTK579IP0lTwj51
         1Fc7NNgrUrDajNzSx5prkF5nD/eBrXzja2rHG5H3toAxo7Dn//jr2x628z25igCcVyPz
         UvTTFN5aDEd5DZdQ7lzpMrNs6NCXdj8R2UaXfRA9iv/vdygqn3Mg1Jvvd7+iDHF9OAEo
         Cn47OzVXnbsxOgpacdjGcmDRUYPfJrYnPdwXfCeDEZYR8oQvGCcBzVCLmzvDjUuZwkMp
         /AyUqI/97aSkhLjwOvZfWyBU0ifegE5Qj/8je9IwINBcm6yfEXdcLgloNPMcvUzwgSzU
         v/9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=PbVuPeIzo3TABEyolY/ZRg7+dcJsxXuwgGW5gK29vvI=;
        fh=+E/US/1Ju6gLetNBGXtM+LAEvu+9GnutnPYZSrJVors=;
        b=WbR8YyiDruW4qkAaqNR/cDIJvUPUL6MGG24rJphZCV5v9VnNxqIMcqgFE5kndwExVV
         MwRo7S0hhGz0kiBzWSbxG2tS53JzbmVzeRuLAJK3nBGyG/G6gtBB4uzAaBGKkMSZ1lkD
         4tPeHVbE3iPp1mgSbrHSjTcjeaYZKGxQneqBOHqD4c9mHmllqu/Tf8FKfFFdtdcowsuU
         gyr4b/rMH7FCqh4jdDfsatJkMtjhgT88EAcqTIKJAXolZhU3e9XBIiF7wxxPULA/JDAk
         5W3j6zafhlHeXN3z7P3i2d+gNvGTrF6x8+KSN2I+45UALRv0bUCMEVKQM/gxEsH4i0uA
         ECdw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=hBD0=IM=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org. [150.107.74.76])
        by mx.google.com with ESMTPS id i10-20020a170902c94a00b001d3e51eabb1si19509048pla.399.2024.01.02.05.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 05:54:13 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) client-ip=150.107.74.76;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4T4Dq76Mr4z4x5k;
	Wed,  3 Jan 2024 00:54:11 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T4Dq22cWNz4x5h;
	Wed,  3 Jan 2024 00:54:06 +1100 (AEDT)
Message-ID: <cb7ac3c5-4fda-4979-b701-54460ab2cfb1@kaod.org>
Date: Tue, 2 Jan 2024 14:54:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/33] hw/cpu/arm: Rename 'busdev' -> 'gicsbd' in
 a15mp_priv_realize()
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
 <20231212162935.42910-7-philmd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231212162935.42910-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: z6psYz/vK+ee

On 12/12/23 17:29, Philippe Mathieu-Daudé wrote:
> 'busdev' is the internal GIC as SysBus device.
> Since we already have a 'gicdev' variable for the GIC as QDev,
> rename 'busdev' as 'gicsbd' to make it clear we access the IRQ
> lines from the GIC.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



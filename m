Received: by 2002:a17:906:eca:b0:a27:dfb7:c645 with SMTP id u10csp1331396eji;
        Tue, 2 Jan 2024 05:53:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQEjX8it/2PL5L97oJDkVFO5jEjScm5w5YA/W0F5V0tFzt+IcmW2X+RX/dNCMPtj5Anom5
X-Received: by 2002:a17:902:7088:b0:1d0:6ffd:6119 with SMTP id z8-20020a170902708800b001d06ffd6119mr16784200plk.59.1704203616012;
        Tue, 02 Jan 2024 05:53:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704203615; cv=none;
        d=google.com; s=arc-20160816;
        b=AV4q/M20+Og4Q54KVHUM5XLy0P/efWMRxc06vEw4ppXjmkGqnu0ZqaXf4UzxsWbCmd
         97ZYZAQb4VIG2hVKIzTVcPxRILGjDPIrEpAFO67TriDykGFa6oSsfi9Dv2m1ErBy5TnZ
         nXtmhtx82CdDaz1EzsJK+mbxt9cUMCnXrPADsNDfgGzrPETgznj1v1oTm+wy5RO6RpIY
         gaofvUEK5ivGl/EunhKRsmq7Yh99wco7CY+Y2my6Cs6CPwAx00PNiwNXXvkfdn2G0/Jv
         LhOAvFb/FxuonoGYqxQAUhlDnkgCh8Hjl1GrPi6qqkK0ajmwaJG+d10ltdYSEmb/yni6
         HLLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=5YJV8A9N3SOvOu8+pXCAyu70lISyRyojVCwCWYV8mNk=;
        fh=+E/US/1Ju6gLetNBGXtM+LAEvu+9GnutnPYZSrJVors=;
        b=CG8EjYokYTYbnDjd0pt1hxwgcW0LCuKoljegfBXXCS+6REKYu77dcTslSK2N8q0VVl
         VEZT0P2Db39pPW/Op8LRu35VqpnK46yVJtrtyBZtt9cJ/l53xbJVkKkhJ9V+sRT+bAf+
         rNzfS56sO446ow2bjrIYfoaYqQ/L7LwzngQePryfSn8G0P6RRRirmkz1S06DuQVKQY7M
         PrHKtZU0U/3EpVq/zVhy5CP5Iazk7j7SPtNODu0UY6va+yk+uNlxiOdoyXZALyKOy8ZO
         u7xTwnQrmAsizWNroO92s3awtji4iWmUn1Zwg5+RyA1QJ3yfdjwS6mWdD99TLkQLLChk
         Y72A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=hBD0=IM=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (mail.ozlabs.org. [2404:9400:2221:ea00::3])
        by mx.google.com with ESMTPS id f16-20020a170902ce9000b001d4752f541fsi11629119plg.461.2024.01.02.05.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 05:53:35 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) client-ip=2404:9400:2221:ea00::3;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4T4DpP6lNnz4x5k;
	Wed,  3 Jan 2024 00:53:33 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T4DpJ4PGkz4x1v;
	Wed,  3 Jan 2024 00:53:28 +1100 (AEDT)
Message-ID: <4f4307ae-442b-4dbd-b3d5-528679dc10d7@kaod.org>
Date: Tue, 2 Jan 2024 14:53:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/33] hw/cpu: Remove dead Kconfig
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
 <20231212162935.42910-6-philmd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231212162935.42910-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 8cRcoBcm6LQt

On 12/12/23 17:29, Philippe Mathieu-Daudé wrote:
> ARM MPCore Kconfig are defined in hw/arm/Kconfig.
> hw/cpu/Kconfig is never used, remove it.
> 
> Fixes: 82f5181777 ("kconfig: introduce kconfig files")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



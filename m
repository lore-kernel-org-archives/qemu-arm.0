Received: by 2002:a17:906:eca:b0:a27:dfb7:c645 with SMTP id u10csp1350666eji;
        Tue, 2 Jan 2024 06:23:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQHBbVvhdafe0BRYf8TVqaYF4gQHscIp/pZ8jL/WaJj/oLZH269vIdHxQXhdrVuRIpbCK0
X-Received: by 2002:a17:902:680b:b0:1d4:638f:3ff6 with SMTP id h11-20020a170902680b00b001d4638f3ff6mr12298022plk.66.1704205429719;
        Tue, 02 Jan 2024 06:23:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704205429; cv=none;
        d=google.com; s=arc-20160816;
        b=Zpxl6wk29MwN7v+L+2TJuCCqz0naLdN2CBixbwd7341awUbYGbomQReaSU69YHD9/Q
         6sBdxjsArf+eiEVu1/bU/FxB3+yGXrMbjb1VxsrPAGNPi3m92BrH0/EZbL1si+ajj68k
         /5yW+9MR7nskulG7/7rOJHy164IIzh6rEWu2YiPaUL0PG549WVahe9DhmQJXhTA9oPTS
         cYx2qJD80SHCv1CDXa5SvDfiWS7ygi/qtzhJQBiiW4pjtFXIOUMpUOPTR9Q/z6/I4i/J
         25GDj4WTN2PT6xAR6o5aAlk/JCin9xEKRfmdAUx28sV/ExXq/6Z8riu5QCbMPYJms5eq
         wYgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=hR/FHoMgI6SJnNhy5tjuZqpaE1DtYT+DfFE2T30jEmA=;
        fh=+E/US/1Ju6gLetNBGXtM+LAEvu+9GnutnPYZSrJVors=;
        b=HhllB2M9jZrgWR3C56mgOjCdUozkELkGcih8wdw3VZ2zPU75K/PgyPpGietpbINxeG
         27U3FfnqUwkca0J2oaMdBSA6U2wPQDmYQq8ZabkNj45EtasopJfUXSDAEPTjUQBDb84n
         TsVc9rNuP0NlROoFAzs3Vty4bHSKgiq+2kiZDxnbeTNN1D1916/Rh39G6zB6FjvjebJn
         hyfDOe4dHjjWsMC+bVf544kuMuI/tAKXS6Am7EY7D5DQpAOy7+4ymnFzSkGhBX3aZ2+X
         Uey/EUoIYZ21Nn/KrpgomQzeVmaG3qRf4KQPj3czeSM2Qxwmn30ta0LAHRWOANyaSTOr
         UUuw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=hBD0=IM=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org. [150.107.74.76])
        by mx.google.com with ESMTPS id p8-20020a170902e74800b001d41eb814b8si18364429plf.149.2024.01.02.06.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 06:23:49 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) client-ip=150.107.74.76;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4T4FTH5n2pz4wxx;
	Wed,  3 Jan 2024 01:23:47 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T4FTB3MyQz4wnx;
	Wed,  3 Jan 2024 01:23:42 +1100 (AEDT)
Message-ID: <5afcc9a5-7329-461f-a2d2-1be50ae57b80@kaod.org>
Date: Tue, 2 Jan 2024 15:23:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/33] hw/cpu/arm: Create MPCore container in QOM parent
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
 <20231212162935.42910-13-philmd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231212162935.42910-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: xsJgLX1L7uyK

On 12/12/23 17:29, Philippe Mathieu-Daudé wrote:
> Move the memory region container creation to the abstract QOM
> parent. Children set the region size via the class 'container_size'
> field.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



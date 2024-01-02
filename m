Received: by 2002:a17:906:eca:b0:a27:dfb7:c645 with SMTP id u10csp1333150eji;
        Tue, 2 Jan 2024 05:57:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJtSpiIKbWtvdoXZtK1omk+cRGPEIccH2oTMzaoVYt84hZJMh4tYAyMaFAlRvztgd0EyeE
X-Received: by 2002:a17:90b:3a81:b0:28c:21f0:cdfd with SMTP id om1-20020a17090b3a8100b0028c21f0cdfdmr19209885pjb.15.1704203848479;
        Tue, 02 Jan 2024 05:57:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704203848; cv=none;
        d=google.com; s=arc-20160816;
        b=fB6qZJnS3fvLquF0sQVfLUk3N2I6WY+2dqyJhkiXWKHPDtfTwjpDnaM5iHL0xPcZKI
         Jr1qP+zLnHJIE/i7LsyOWq2hyhx0vIBFkYHy6zNJHeAuf6oSHlRncwM1H2xFWuSQzRqm
         JeMzy1xw+jIpMZvGp15xwwId2bqGiMQVv5ak1pqrHBUUD3HPNfXBYzj9nh10W+MyJeka
         24pILMY+OgFAN4DGSKbBgPgDk/tXaG7Xccml9lP1s1oi6JsNl3sQCe95Q2cVqLStcDEo
         9+PorU1ceWNIOnITiWaQHBblva+NpwCSSSVTarXo7FC+ag9nrkAS3fW+AXr0/QFH9r+z
         l/UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=h/aX1PKCFqkmp3r9sSZLOHQSn7UfxmoMxsi+LSJ4epw=;
        fh=+E/US/1Ju6gLetNBGXtM+LAEvu+9GnutnPYZSrJVors=;
        b=flntVMDfsBE0FA1l5WrwYzCG2+J53voKjvESJ+s4tBwfTaQAyvOfCVUtG2ZV0b0NZ0
         dVolTDB90G2EQ2qlEc25By8jo8ij1AWylvylPHTuTvBDAcLY3bN16eyPiOgLeStZcl3D
         P3RaSnY6aMsi4UwCoN88SggJeDQrG4gbzRK9rqAZlv5otoLGHKQLiqB9KjzPkkPXetFd
         SzS1vdLIO/2gOFWxO+DDiW+ImeSSJArGvf5+46CjOEMJKLy1VxAHif3LfMhAS4CupfB/
         2Mr7A7f3/H/IL6CxJnYyDHAvfcTwQ3yApEleTDHf6O+phSnS5pkqWHIZmkkeQMhp54qV
         Azug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=hBD0=IM=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org. [150.107.74.76])
        by mx.google.com with ESMTPS id lp1-20020a17090b4a8100b0028cd441d51esi2682060pjb.27.2024.01.02.05.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 05:57:28 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) client-ip=150.107.74.76;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4T4Dts5l4pz4x5k;
	Wed,  3 Jan 2024 00:57:25 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T4Dtm0yHNz4wcM;
	Wed,  3 Jan 2024 00:57:19 +1100 (AEDT)
Message-ID: <3f134382-a68f-4daf-acfe-64a9e11cda5f@kaod.org>
Date: Tue, 2 Jan 2024 14:57:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/33] hw/cpu/arm: Alias 'num-cpu' property on
 TYPE_REALVIEW_MPCORE
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
 <20231212162935.42910-8-philmd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231212162935.42910-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Su//OmEClWjz

On 12/12/23 17:29, Philippe Mathieu-Daudé wrote:
> No need to duplicate and forward the 'num-cpu' property from
> TYPE_ARM11MPCORE_PRIV to TYPE_REALVIEW_MPCORE, alias it with
> QOM object_property_add_alias().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



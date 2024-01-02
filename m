Received: by 2002:a17:906:eca:b0:a27:dfb7:c645 with SMTP id u10csp1330820eji;
        Tue, 2 Jan 2024 05:52:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwJP4+FqUYsSAVFJF6XgnspYHwyxyf5GSlLxFRj5f2cyWh1uXtzSzSgcWmefHgv7bLgKJd
X-Received: by 2002:a05:6a21:606:b0:195:39bb:46c7 with SMTP id ll6-20020a056a21060600b0019539bb46c7mr6320282pzb.18.1704203541307;
        Tue, 02 Jan 2024 05:52:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704203541; cv=none;
        d=google.com; s=arc-20160816;
        b=hG0SrAb1qkHUl7tFbWpmeIWDPOXQwNZ/53jNq+S3DNZBxyHQb1JonmEjtMAA9bPAcV
         S4lZLWdgEmBZAWRCaEUuLIej1D/yRYLU/60S1YAILodi+QEnt86fmrJ2GkbUcfFwPQww
         mFBgABqo8X4atGK37hy5R4TPdQf0nsyKACB306GO4kOkI00O/7xjubAOA8mvZgOccNLh
         HcbHJXXooVRcazPqu2XJLYD7zD4CnVeok1yLyVz5EzHVEZ+bi4lK82zVvwWSc9vMttJR
         yZflD5B2Sup+HmJd/5ITqSFI66spfCe7cBQB3bBbdAf/b3eIPx5aEsrtQ/+NH79rKi91
         Drow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=owxPDpokfLXl0BnIPNrkWP28di+3AWEwYO8Qua20rlo=;
        fh=+E/US/1Ju6gLetNBGXtM+LAEvu+9GnutnPYZSrJVors=;
        b=gIwhCwBAWKzxO/nvPMOScFeZsAIL9XruA7i4Wgi3Nlefk/MQAruwz0gkQgFOOFyfGS
         SM5hxuzXfi6X4Gw82ISig4HupO9FVza8ac0zyYY4OPoat3nNZWvFHUMSMKD7Ffubk4XY
         tGjC9GCTbfb31rZgOkgJvRVcZ4itDNGQr48MHZeTRpLJipt2Bg+Hr9mg6YRkeorYpuXF
         E459Jh4FWVIZmW0eXpcY5WwfS/dxj0SxO0joc5CLlNLNRTEif+u3ZZU24bcRJgThCOZH
         WnCwH0Nu9SI6VKkboRY+1LsJx0vtYw9ZwfH3ZDs20BgYi660my+/WHYG5B7rx9slAh3P
         pLjw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=hBD0=IM=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (mail.ozlabs.org. [2404:9400:2221:ea00::3])
        by mx.google.com with ESMTPS id t19-20020a056a00139300b006d9a65816adsi16310777pfg.136.2024.01.02.05.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 05:52:21 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) client-ip=2404:9400:2221:ea00::3;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4T4Dmz32Hpz4x2P;
	Wed,  3 Jan 2024 00:52:19 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T4Dms6tp3z4wny;
	Wed,  3 Jan 2024 00:52:13 +1100 (AEDT)
Message-ID: <4d36f06f-2167-4c85-9223-9805908b04b3@kaod.org>
Date: Tue, 2 Jan 2024 14:52:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/33] hw/arm/fsl-imx6: Add a local 'gic' variable
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
 <20231212162935.42910-3-philmd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231212162935.42910-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: fbC+7LJDdYYz

On 12/12/23 17:29, Philippe Mathieu-Daudé wrote:
> The A9MPCore forward the IRQs from its internal GIC.
> To make the code clearer, add a 'gic' variable.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



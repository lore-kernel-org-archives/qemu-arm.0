Received: by 2002:a17:906:eca:b0:a27:dfb7:c645 with SMTP id u10csp1350542eji;
        Tue, 2 Jan 2024 06:23:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF20b8furwBubquEoaTBGa02L+AQC4pLUSa7gm2OMJQ04DmXC3vSw5bbl5dnAJIas0prbHQ
X-Received: by 2002:a17:902:6849:b0:1d4:70e5:e188 with SMTP id f9-20020a170902684900b001d470e5e188mr4140167pln.94.1704205414681;
        Tue, 02 Jan 2024 06:23:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704205414; cv=none;
        d=google.com; s=arc-20160816;
        b=rpBSksT6/E1KDnl4uJTd7WxflfE+f1PqT8iSnvustz7vFP7Ddi4avoBN16d1PxSIB3
         F++c69HIGFrf+mA9eKhjI4ULN6X0QuVlBWjSF32ILwQP27zgt2BA8WPfmyZ/3Ir6V/Lf
         3VxxIb8EHKubga+mykCCzoCrg8L6kMPysLMLmlsfezN7+vuopDk16zWqMeZGOgBN2Y0N
         ky/fqS0xt4mVLPPVliZghLOQ0lOM9rzoydC+DmrGeh711Xyu5uumhmScubC9MHQujpgc
         dg0FOUG9rpZ1v4j9FLPQNqHNAxwW17V4I3edCPk71dG9YhOqjBvajXj3n6gdagTvKZBy
         6ZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=hJRBgHW/jpP6hegUq+xJakfs8R2odzvHhV6w3Pir+AY=;
        fh=+E/US/1Ju6gLetNBGXtM+LAEvu+9GnutnPYZSrJVors=;
        b=T4geH0b0W99DG2sFNbJ8iyOpp8JpvLQ6ueNHuE4BEPwWP286NE4U57HRa2COgqGeUl
         RxSyhANE8mjxmSs3jcPM8Ic5ZtwKNcty+cEGuHOWW+obttPPD91m/sN+wkeUakpvE+oF
         58YrgDp2dCyS7q5Vio+t1NZoAVxFTouers8V7Sykijx+OSsbyJKLEJksBv4jFV2y4H0R
         MMr5D6psk1tuobFV5wgcn/AGG3PBsLOOpOCAg85kX+TF0wok9/VjhvWeamUUCuKmi8Ui
         4wfkuvseAnopIh/MNSZol34dgvyg4bELlYYaj/UOGvQd/t2ehJA7dSUcV4giLQFReR8Z
         izcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=hBD0=IM=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org. [150.107.74.76])
        by mx.google.com with ESMTPS id e5-20020a17090301c500b001d3ac97bc75si18593560plh.455.2024.01.02.06.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 06:23:34 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) client-ip=150.107.74.76;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4T4FT02qWTz4x1v;
	Wed,  3 Jan 2024 01:23:32 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T4FSv0QZgz4wnx;
	Wed,  3 Jan 2024 01:23:26 +1100 (AEDT)
Message-ID: <069fbb45-8a3c-479a-bfa1-f033e614b0d2@kaod.org>
Date: Tue, 2 Jan 2024 15:23:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/33] hw/cpu/arm: Have A9MPCORE/A15MPCORE inheritate
 common CORTEX_MPCORE_PRIV
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
 <20231212162935.42910-12-philmd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231212162935.42910-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: GkqHMs3r4Tni

On 12/12/23 17:29, Philippe Mathieu-Daudé wrote:
> TYPE_CORTEX_MPCORE_PRIV becomes the common parent to
> TYPE_A9MPCORE_PRIV and TYPE_A15MPCORE_PRIV.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



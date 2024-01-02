Received: by 2002:a17:906:eca:b0:a27:dfb7:c645 with SMTP id u10csp1350466eji;
        Tue, 2 Jan 2024 06:23:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkvsjDyrpJjgx8p7gX1vYLxqNpQ09C1gwcJRpS07+goGRllMdt4/+o/s1cFkHeYcyYOC5u
X-Received: by 2002:a17:90a:b38f:b0:28b:512a:858b with SMTP id e15-20020a17090ab38f00b0028b512a858bmr20840185pjr.9.1704205402811;
        Tue, 02 Jan 2024 06:23:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704205402; cv=none;
        d=google.com; s=arc-20160816;
        b=I1ZvLp0Apom2BAGe+M7x0MyAlXZS1RzEgn8fBffauqn4Lb0CVGlAG0cBtIfGpal5Wv
         brMnyAiTjO9ad6KJVQR6G4K364D45C+uhmitnpLHKZQGEg45ZKI8EiWrdUhdpRXswh1f
         3C4meioO2YaUZNBPk2YvH8c4ZTS1la+lxAsQNEjp5jmaKJUgshhJBbnsY1EqPyIkRRPv
         PjQDYGtkhnajSIZPOlKI4S7N01Vm94EpO1Jo5BVPhri06MIUG31CMyQO+bovSJy4hj7A
         PnfwpqnDSbdHtDKMt/zB40F6PydKtIHF0E7cfWGEZ6+NAKTMoAJAZXYcDidsJZdTwzwb
         XTNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=voZJt4HUhQqw4+67MOeTxlsCUGkC4ciXNE5oAjdLHEI=;
        fh=+E/US/1Ju6gLetNBGXtM+LAEvu+9GnutnPYZSrJVors=;
        b=oFK7ctRyefyo3oZUYnwrRQa/hTsVdhrMSwuZR9KKQ4SlHcCc+zBZADdJxySuQnhMr+
         sIwPIbp5aR8v5PYU9DtPP921YEcpLQh7TYzNZnW71RQ+uCuQ6m6JrKPDYom3w/UbFBAe
         HfqVQwusS60xLx/USS53l/RFMZeXwHmts8KsxntXWFUnwfmAiaCrhX4WgMvuRuyZYKPx
         uzaTLEOQqu+nVT2XVlymOFGFojXBUsiUX34ujtuLY4Xk4ByRWBdIYXJORm+WJu/Y31z9
         yCLvAMQpegvbH+kkzT50QLql/Y0ke6fEiKwZVVfhmiLY01lqO96gGe/+lnUSI68j7CTb
         ANkA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=hBD0=IM=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org. [150.107.74.76])
        by mx.google.com with ESMTPS id pq9-20020a17090b3d8900b0028c3759b263si16162184pjb.62.2024.01.02.06.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 06:23:22 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) client-ip=150.107.74.76;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4T4FSl4p1kz4wxx;
	Wed,  3 Jan 2024 01:23:19 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T4FSd32Ffz4wnx;
	Wed,  3 Jan 2024 01:23:13 +1100 (AEDT)
Message-ID: <9b0f3123-f854-4268-9c76-6fc94bc60298@kaod.org>
Date: Tue, 2 Jan 2024 15:23:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/33] hw/cpu/arm: Introduce abstract CORTEX_MPCORE_PRIV
 QOM type
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
 <20231212162935.42910-11-philmd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231212162935.42910-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 9isrhHqxRRl8

On 12/12/23 17:29, Philippe Mathieu-Daudé wrote:
> This type will be common to A9MPCORE/A15MPCORE devices.
> 

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


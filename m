Received: by 2002:a17:906:eca:b0:a27:dfb7:c645 with SMTP id u10csp1330600eji;
        Tue, 2 Jan 2024 05:51:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxz5i5J64pL/SaaRG33Z9cK5It4SGjsIQyV9R9sE07d880DT+skYFjYW7LYq/XRLf/Ph+u
X-Received: by 2002:a05:6358:99a0:b0:170:4ac0:f9ef with SMTP id j32-20020a05635899a000b001704ac0f9efmr19675663rwb.15.1704203512451;
        Tue, 02 Jan 2024 05:51:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704203512; cv=none;
        d=google.com; s=arc-20160816;
        b=slEoXFcdQSnulw5tRirT7hcuimk5Qg0qEht8+QzkAyoQ/h6Qq8qCcXt+noopb0CSHt
         Q+FtCVjus+FxieGFNRBa/Scx6OxriQaB6yudRPiwoOK2VlTHnSCadp8MGAC9P5RtO0HF
         olSKG05ShZHG/YshZ3QHi6pIkbnb7Zh3+J61NuNEqN7grim7THeTatLZUsn/WmtBlT68
         w9HR/emn01ylqlCbKcuU163Vgb/+NlwoBZtr8fc6D/+jwzqLnk4qwwu5uunAco8QCAcb
         Qcz3C1U7/OPkS3KO07tkFEWMR948TXE0vmk0zsbhJq5FvU4qLLTfMAEZ1BgU/pufXnHL
         /S/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=ifRTJbqsPpe0z3UF+zpp4mk+08/YLvl8j9SjX4ZE8hk=;
        fh=+E/US/1Ju6gLetNBGXtM+LAEvu+9GnutnPYZSrJVors=;
        b=zxUcgjF7sQu15psMSBWta65SyYDjMlK3C3cvFTFjTWDwK9aNj2IG/F8kFsDeeMk8Q3
         KPmgWP5LzPPK0zYSNlhj8InSITjqzvqj47jz+VWE7/HN8XRHs9xbTdZHWRRQfON06S8K
         1XNxAfzGhyd9F4eS7S6/nTduhsHrWROocF/L2LPw+j/QucKgtWasAsR3khBytGEa1q3Y
         B9i3G5ygpqt7VGZL8hwXEmxVOH/F2/1KpO44eoAvepF8tGWfaDsXn88i5FFXytKZh3PF
         RgbVvZE4+Zs5pYBJT9+b93fa6VwuXHLZMio0TZv6I2vqz5jjiUt1230S+wz/jLWWAe1v
         CeVA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=hBD0=IM=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (mail.ozlabs.org. [2404:9400:2221:ea00::3])
        by mx.google.com with ESMTPS id 24-20020a630c58000000b005cd8486d5ccsi20777302pgm.65.2024.01.02.05.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 05:51:52 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) client-ip=2404:9400:2221:ea00::3;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4T4DmP25YBz4x22;
	Wed,  3 Jan 2024 00:51:49 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T4DmF2HQtz4wnx;
	Wed,  3 Jan 2024 00:51:40 +1100 (AEDT)
Message-ID: <a15e671a-9193-4e0a-b2e2-1e7a20eb914e@kaod.org>
Date: Tue, 2 Jan 2024 14:51:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/33] hw/arm/boot: Propagate vCPU to arm_load_dtb()
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
 <20231212162935.42910-2-philmd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231212162935.42910-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: FwkYw4DPcYqI

On 12/12/23 17:29, Philippe Mathieu-Daudé wrote:
> In heterogeneous setup the first vCPU might not be
> the one expected, better pass it explicitly.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



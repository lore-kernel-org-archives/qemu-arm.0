Received: by 2002:a17:906:eca:b0:a27:dfb7:c645 with SMTP id u10csp1333382eji;
        Tue, 2 Jan 2024 05:58:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJ9+QXCSF6mCmNdzohE0g8lANnABuvtIIsk0lUN90XC4UYfZqfSB6dfRxkCm16Z/l07QAB
X-Received: by 2002:a62:b51a:0:b0:6d9:b112:ef85 with SMTP id y26-20020a62b51a000000b006d9b112ef85mr11970644pfe.48.1704203881506;
        Tue, 02 Jan 2024 05:58:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704203881; cv=none;
        d=google.com; s=arc-20160816;
        b=yCf0eso1y5owe4wCLN+cfgTf29ndPHBYKDloTGWkTBzr8dvGmv8PXB/Mw9MJpnyR7P
         h9Pnyg6L2CImgkGTE8Tie9xQMX62jh0fJOTPDYiANFOQsHCJzH3Boq+O5RCyZ1KVvIkb
         J+cM5I7hxcb4Wg41Ru/4ImIRZRCo0FyYIAXYboJdE/MY5oBSYJmf99m64ogb337+nN7F
         FHEyeH+1M6EX6bsw+RHiy4C4nYXX08/9qqAEeOFeMxVBn3/XWqMHcXne/TQyGoCiJIAV
         x5uhc/0DUq+7jDlYtS5h4OhaWwMWrVevwUVAsJuag9jZnEOEYYkP+uz/GwE3j9F3TGOZ
         TFaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=Rl87MdO7l81mfqKyWE/mKyTl2e1fth/C/psDn9aAa+I=;
        fh=+E/US/1Ju6gLetNBGXtM+LAEvu+9GnutnPYZSrJVors=;
        b=yOwnrVp0M7ZjAj4qEX89GnokJyQY5QoIW+gS2PYIwbsN0LLzY4QYhg4Lq7unYvXeMu
         VMIgCP7D3QM5+U1C89KixshkSGI3ikBit8gWsEOZifYYR3oRAqgN6Xvdv9RwSOfjmkKA
         2spQRDapzB4iRiTUDLXym0P0/6R24okxBDhXAwqDqgFzSu78jJ9lbwgb8xCk6UqP3lmS
         D6wcD4ul1zLyvvZzLNotecD/z97fHhU5fDeaZ2sa9GKhPnPuOxQ6ZglJZJYUCxCS8SMc
         xGyaWgrQINBXtQy7I2UxxZqmtfYLlMhujb5eYQz1XDpf9U5n9dsgz8yDaLVzy3OCNcwj
         3Vfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=hBD0=IM=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org. [150.107.74.76])
        by mx.google.com with ESMTPS id h190-20020a6383c7000000b005cdfe5eddf5si16661134pge.105.2024.01.02.05.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 05:58:01 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) client-ip=150.107.74.76;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4T4DvW4Dv2z4x5q;
	Wed,  3 Jan 2024 00:57:59 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T4DvQ1z3Sz4wcM;
	Wed,  3 Jan 2024 00:57:54 +1100 (AEDT)
Message-ID: <d4211b88-f0e2-4cd7-b2ad-64f2159dfdce@kaod.org>
Date: Tue, 2 Jan 2024 14:57:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/33] hw/cpu/arm: Declare CPU QOM types using
 DEFINE_TYPES() macro
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
 <20231212162935.42910-9-philmd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231212162935.42910-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Iu3CMARhZxBv

On 12/12/23 17:29, Philippe Mathieu-Daudé wrote:
> When multiple QOM types are registered in the same file,
> it is simpler to use the the DEFINE_TYPES() macro. In
> particular because type array declared with such macro
> are easier to review.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



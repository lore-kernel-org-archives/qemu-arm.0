Received: by 2002:a17:906:eca:b0:a27:dfb7:c645 with SMTP id u10csp1064633eji;
        Mon, 1 Jan 2024 16:11:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnQ/3JLuSe2jn4c9tARHn9hFhS9nksbe5cQDxCTUSvZu/sM6lhu/0TktLgJdSDYXjruEHE
X-Received: by 2002:a05:6871:3a21:b0:204:438a:ac3 with SMTP id pu33-20020a0568713a2100b00204438a0ac3mr18859037oac.65.1704154293258;
        Mon, 01 Jan 2024 16:11:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704154293; cv=none;
        d=google.com; s=arc-20160816;
        b=sJPd6hAqO2jOpFdB8uhFVflaln8B/lUyd4oAQJ8RyjuJMoXNkMKtwWkI33n4d+CwnG
         /MYqkX/4qt4MJG1T/SI+PV/G78Mhr71y2uTXwyGHTiHUI131pCYhydB7aGW5etEumWXX
         2sGFuimrFk2LuMsSlapayPhl3tqmxFPZma4Empr5ZmnKsTOY2K/gKDaXLNcTvIQdjdbF
         WgAR2sHcmd/c14RAz7FvRyRLBNYNG7VLeBQjrJb780nJY33k9zx60P+m/wF+ybtWpOke
         7TfFJmLEnQRC10HIbMduMqv1jyNcTl0XxqwbNGSQA7yudfsa4YB1Enzj17cubDRFFjmv
         rKaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:dkim-signature;
        bh=weh08tZKSKDDmoMpcPHoWfnvsNdSNM6cDkIsSxqlShY=;
        fh=QUgk1LONbRB7BnnW7OdyAHbDp4VhxXQKCB+pX1OgQHI=;
        b=cjNoUC2qu9LBWdsKc8vpAobYpmdA6wBKG/+LAKVJokVjttoX1GurUEJsXs1Mp1bT0y
         tezxGzNOPGdD0RDr1qQQby8TXYcs2IO7QKHE1I62e7BTEEsfP+Edz71nQYGY7NyuOdf3
         nlx0FgOoilQGGGHYkAA2V8Jq8YpFfcgPwaLoPZp5PxUVdu7ZC6tKEb+nUQj5csPTkSe7
         PWUjExK7Cv4jfZol9aGYu4IzY5RkxfLKtmZgzQSkTMP9CtZC+kDjhg0hOfDSy0kwauWP
         YhA/S4ALV7ErgJEZrL0ALaK+cgL0ORhPCCy7hTrUrt/i4X4zbK6N6CLRY0Ah/WzPEebZ
         ifPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=OmSHmBwd;
       spf=pass (google.com: domain of andrew@codeconstruct.com.au designates 203.29.241.158 as permitted sender) smtp.mailfrom=andrew@codeconstruct.com.au;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <andrew@codeconstruct.com.au>
Received: from codeconstruct.com.au (pi.codeconstruct.com.au. [203.29.241.158])
        by mx.google.com with ESMTPS id cg19-20020a056a00291300b006d0a6b4b95dsi15622720pfb.384.2024.01.01.16.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 16:11:32 -0800 (PST)
Received-SPF: pass (google.com: domain of andrew@codeconstruct.com.au designates 203.29.241.158 as permitted sender) client-ip=203.29.241.158;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=OmSHmBwd;
       spf=pass (google.com: domain of andrew@codeconstruct.com.au designates 203.29.241.158 as permitted sender) smtp.mailfrom=andrew@codeconstruct.com.au;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from [192.168.68.112] (ppp14-2-68-9.adl-apt-pir-bras31.tpg.internode.on.net [14.2.68.9])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id F11B720075;
	Tue,  2 Jan 2024 08:11:23 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1704154289;
	bh=weh08tZKSKDDmoMpcPHoWfnvsNdSNM6cDkIsSxqlShY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OmSHmBwdmeFiUzpRkGAg8FQzxPW22/rSq/wYrrUA2hOgo4Sgf87OOQxZYnMpo/xiy
	 86s0kkSHYOfE7q9jOvMqJ0b9t6aJhoaGWmemHxfB3oGQojaUAL+7Qbag6LQdwwcejM
	 N18GHo2QGbSs5EDlUair6u2cspIDl6AVbJ+KffGEt5fftxuvbDXNocJRU+QarWf7+V
	 eV5fNDHMkAmIplFDaF53dmcA2wcKT/WyGxa8u7nSQjjhrEU8M7Y2U8rS2rK1MhRpVr
	 vPNaF6USvsHc6b2UvGZ36kLYsdzwwoOHhxx5lipLbzTqkp+3Yxe0RexHBIScFq2x8m
	 BI43JcfIl6oDQ==
Message-ID: <92d9cfc4f56ecda0b0d451e44bb9eef81e70211a.camel@codeconstruct.com.au>
Subject: Re: [PATCH 22/33] hw/arm/aspeed_ast2600: Let the A7MPcore
 create/wire the CPU cores
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Tyrone Ting <kfting@nuvoton.com>, 
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Manos
 Pitsidianakis <manos.pitsidianakis@linaro.org>,  Eduardo Habkost
 <eduardo@habkost.net>, Joel Stanley <joel@jms.id.au>, Alistair Francis
 <alistair@alistair23.me>,  Anton Johansson <anjo@rev.ng>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, Hao
 Wu <wuhaotsh@google.com>,  =?ISO-8859-1?Q?C=E9dric?= Le Goater
 <clg@kaod.org>, Jean-Christophe Dubois <jcd@tribudubois.net>, Igor
 Mitsyanko <i.mitsyanko@gmail.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Rob Herring <robh@kernel.org>,
 qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Tue, 02 Jan 2024 10:41:22 +1030
In-Reply-To: <20231212162935.42910-23-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
	 <20231212162935.42910-23-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-TUID: vhxQ8E4HyteP

On Tue, 2023-12-12 at 17:29 +0100, Philippe Mathieu-Daud=C3=A9 wrote:
> Set the properties on the a7mpcore object to let it create and
> wire the CPU cores. Remove the redundant code.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>

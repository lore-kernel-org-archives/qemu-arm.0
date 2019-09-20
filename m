Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2542091wrp;
        Fri, 20 Sep 2019 08:18:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw+vDPPi4qTCD8803rAo5DHEXVGM4R9KrQ/nKa+BhjiwqsMrN4JjQyd4F3Q31d37xUTFJ34
X-Received: by 2002:a50:918d:: with SMTP id g13mr22414519eda.64.1568992694916;
        Fri, 20 Sep 2019 08:18:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568992694; cv=none;
        d=google.com; s=arc-20160816;
        b=xU68gnubt5iZ6m3zYtq7MfDnWkeyQwseSTTXeSvemVAaE+dkvAR6iCg3MrkS7i+qYS
         1knnuJVWMWyZaqosiHcE0qP0nHcXaTEzYc4p/Q/zLH/k++h3ZW51VzQ+NTWt9u1Frb3w
         6Cy7ilK4XWfYlcNS2y1CFeTcp1zpYoYGoDHFXFnjKcrrYdy3R8gEO4/TtJHGg9E5drM4
         Rp1Ky7ajXtZx0Z/QQJYZdxrqtSiBiywxf5hLr6f9o1cbsNK6gJsAv+p7VTcLisxUPpcu
         FieElUbrsD7MfCVKNfYUiqh+hc8KFA697IuKOJDburuExWCtfHSRs9upa+Gx8LYDgsV8
         Wl3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=6bGbkoJSxOLtGodxvAXxu04n8K0WlRIGcJ4BwfUZSW8=;
        b=yORlSZA8qtkjdzvSipog+w9GO5T5HJA/IvzlY2it1KYbg3jDEWCghaKmNyzfnf3tvO
         wKooU1q0Nfr3V2rQx4tOAv3E6yAbYGc+YAQdnuJ568wO4+zDpqFewyBM/0VVre2kfEJi
         dIN/ve4sUWQ/NoGdhSqYWqKoatmwZpMngi/d4CkDJO/1e34Q5DkbAZZifkryPE2u7cey
         Vnp9IxMsciwKCsJHHUno+xVQj6Zs/Ll+fVYq/DHptuUWBIY7lP/+nvOw/14cVWcFuuRV
         W6/X8o9HpIROqbqPLFPK5rjZ/F3xYWJ9UbtYTTaJY1uD2Dj9///xfBlJgvUvX5ebPISF
         ZVqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z6si1588630edm.316.2019.09.20.08.18.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2019 08:18:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iBKfl-0001Jl-Ob
	for alex.bennee@linaro.org; Fri, 20 Sep 2019 11:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42124)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iBKf1-0001IU-DY
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 11:17:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iBKez-0000Xa-Id
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 11:17:27 -0400
Received: from 2.mo178.mail-out.ovh.net ([46.105.39.61]:50671)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iBKez-0000Wh-DD
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 11:17:25 -0400
Received: from player758.ha.ovh.net (unknown [10.109.143.24])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 98C6879DEA
 for <qemu-arm@nongnu.org>; Fri, 20 Sep 2019 17:17:23 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player758.ha.ovh.net (Postfix) with ESMTPSA id A6D12A15B613;
 Fri, 20 Sep 2019 15:17:18 +0000 (UTC)
Subject: Re: [PATCH 17/21] aspeed/soc: Add AST2600 support
To: Joel Stanley <joel@jms.id.au>
References: <20190919055002.6729-1-clg@kaod.org>
 <20190919055002.6729-18-clg@kaod.org>
 <CACPK8XffSK65RAc-kgbZrvxbr9cEF3uYEu6_tpN=9oDwrNgs-w@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <176fc141-f928-2d54-c951-c3e3e2b99675@kaod.org>
Date: Fri, 20 Sep 2019 17:17:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XffSK65RAc-kgbZrvxbr9cEF3uYEu6_tpN=9oDwrNgs-w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 17114523011765210027
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvddvgdekiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.39.61
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZmKa1qUJrK2T

On 20/09/2019 06:35, Joel Stanley wrote:
> On Thu, 19 Sep 2019 at 05:52, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>>
>> Initial definitions for a simple machine using an AST2600 SoC (Cortex
>> CPU).
>>
>> The Cortex CPU and its interrupt controller are too complex to handle
>> in the common Aspeed SoC framework. We introduce a new Aspeed SoC
>> class with instance_init and realize handlers to handle the difference=
s
>> with the AST2400 and the AST2500 SoCs. This will add extra work to
>> keep in sync both models with future extensions but it makes the code
>> clearer.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> Reviewed-by: Joel Stanley <joel@jms.id.au>
>=20
> One small addition below. If you don't resend I can do a follow up patc=
h for it:
>=20
>> +
>> +static const int aspeed_soc_ast2600_irqmap[] =3D {
>=20
>> +    [ASPEED_ETH1]      =3D 2,
>> +    [ASPEED_ETH2]      =3D 3,
>=20
> We need to add ETH3 and ETH4 here. They look like this:
>=20
>     [ASPEED_ETH3]      =3D 32,
>     [ASPEED_ETH4]      =3D 33,
>=20

I will include them in :=20

  [PATCH 19/21] aspeed: Parameterise number of MACs

Thanks,

C.

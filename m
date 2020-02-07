Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp251601lfp;
        Thu, 6 Feb 2020 23:24:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqwWRVisNYIb4qfAyoXfGYiYuE5WUEpBBq778aM0zPEJIEYTmRG4o3jspsd5LHcV4pBmZjJp
X-Received: by 2002:ac8:4092:: with SMTP id p18mr6201339qtl.19.1581060269911;
        Thu, 06 Feb 2020 23:24:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581060269; cv=none;
        d=google.com; s=arc-20160816;
        b=n3Tcn1gwGq4e0sXyIwql4HNmyxzG2NQWJIIs2kHSpK4a19AnvtnuhFNo6dQP6b5CVU
         UmSJfyzGlh/TXSQfTjX/GZAwaVU+WssRBfCa6LClUakk+KkWdp7w0SheMsHeAT3aXqu6
         6NHWSNeRZnqkuUs9KQfidAAcy3zv/qmbOApi3GNPM6AgpSoH3ic7aWXmWhN7NmnldLCq
         SGmgBBG2yUsN2Qf+M4zM6SG3kSsdE0YycX/AzvnPhvIa3aEGbyH02Fbu47E5sqpoRcc+
         IyBThuey8pJSwCB7HH5ikI2UPD+CYY1tDd0SxMPR2YeU0TOyOs0hk4KObABUkEdkCnXM
         7nPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=8ie3TJwPzwxiD+N752dPbRjCn0QckzvbJIy0+7cu00U=;
        b=csAbHXbpnSu4jq8YrBE56Tyw12WS2Z2yz7gQnE8P3XK+YiW+Jw+f28rRREsQHejklL
         UUOT9jy0ubv6H2HfjhIn7ZKPxBWQnokmdmDb02sZKxB0GGWLMpUzgi3LhFGDdFqORCJF
         fhzy8xmXz510fkZiHC34lmbrdVoXX2Hx+SE60XFg2qqz/6Vvbkls76s0CgsMBQlJzTBP
         pY400weq9m/oVTUZoVrO4MA6txGSk/p84myucthIroK/QLPI9ROKEETk9yUR8eWXQ4x2
         2i0WG1wTdeVE/jR9Dt7MNdetvC8mwho698BxWBV756UXvcGTTRoICTSCKpzqukK4oYYq
         Ih7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u22si944966qkm.81.2020.02.06.23.24.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 23:24:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izy05-0002IX-BW
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 02:24:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58718)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1izxyQ-0000Oz-6s
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 02:22:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1izxyP-0005bE-8U
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 02:22:46 -0500
Received: from 11.mo1.mail-out.ovh.net ([188.165.48.29]:56050)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1izxyP-0005Zh-2T
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 02:22:45 -0500
Received: from player714.ha.ovh.net (unknown [10.108.57.188])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 83CF11ADC7C
 for <qemu-arm@nongnu.org>; Fri,  7 Feb 2020 08:22:43 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player714.ha.ovh.net (Postfix) with ESMTPSA id 779F5F082EC8;
 Fri,  7 Feb 2020 07:22:31 +0000 (UTC)
Subject: Re: [PATCH v2 3/4] m25p80: Improve command handling for unsupported
 commands
To: Guenter Roeck <linux@roeck-us.net>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>
References: <20200206183219.3756-1-linux@roeck-us.net>
 <20200206183219.3756-3-linux@roeck-us.net>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f1f8af75-c1a6-482c-395d-9dab67ef2cc0@kaod.org>
Date: Fri, 7 Feb 2020 08:22:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200206183219.3756-3-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 1171780329806531504
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrheeggddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejudegrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 188.165.48.29
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mwwz7Evrgv5F

On 2/6/20 7:32 PM, Guenter Roeck wrote:
> Whenever an unsupported command is encountered, the current code
> interprets each transferred byte as new command. Most of the time, thos=
e
> 'commands' are interpreted as new unknown commands. However, in rare
> cases, it may be that for example address or length information
> passed with the original command is by itself a valid command.
> If that happens, the state machine may get completely confused and,
> worst case, start writing data into the flash or even erase it.
>=20
> To avoid the problem, transition into STATE_READING_DATA and keep
> sending a value of 0 until the chip is deselected after encountering
> an unsupported command.
>=20
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>


Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

> ---
> v2: Split patch into two parts; improved description.
>=20
>  hw/block/m25p80.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 53bf63856f..8227088441 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -1161,6 +1161,11 @@ static void decode_new_cmd(Flash *s, uint32_t va=
lue)
>          s->quad_enable =3D false;
>          break;
>      default:
> +        s->pos =3D 0;
> +        s->len =3D 1;
> +        s->state =3D STATE_READING_DATA;
> +        s->data_read_loop =3D true;
> +        s->data[0] =3D 0;
>          qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Unknown cmd %x\n", val=
ue);
>          break;
>      }
>=20


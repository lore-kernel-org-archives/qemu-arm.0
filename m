Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp334467njb;
        Tue, 13 May 2025 00:05:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWcnlSkiha02sI3frHZb+uWW7CHfkhfJmf/7Wj83ZZfK7j0pjco95/j91vvqDuQpJAJPmtv04lpo0IpHg==@linaro.org
X-Google-Smtp-Source: AGHT+IFFzFKd0WIWWDBwbk758DAuANBXDg6I2TftO/X9bNhV2uTLNvO2bRlDWV+lxhEukKpaV5fv
X-Received: by 2002:a05:6214:c8b:b0:6ea:d393:9634 with SMTP id 6a1803df08f44-6f6e4795886mr247880476d6.3.1747119923992;
        Tue, 13 May 2025 00:05:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747119923; cv=none;
        d=google.com; s=arc-20240605;
        b=g8N5yRbft2Y6NwkwB2xQsv+1iKaJYsnuZXiCiPsNQeas4n0CVZtD6Hwps/Uc2yqKCi
         k9qXGxOFy0iFC9qTj/pvRlazhS9TmciHnKF2Kn39ESBv1KW3nJXlx5OvECsW6imjYQey
         h2Texzejt4p5zPun3hdaXEb5SdO8DE2XGusE+mxp3msYKUzGshL9geP5b2Bo717fFYMK
         BgCFcLtNtibPgsmFbqLeUxvrXBo3wxC6MUV/Us30FROk3qm/0nftOiKdoi7Y+q2bNm6X
         JwQDMEYEW5GdOthRhRNtdod5UvW/e+zegvdP52IiWBSjgw/1ldlPpT2L9p4hoXGZt6Bk
         0GkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=sm03/Q/lzf8bEEwW8ivqKXEvcHKm+6g5c9M+WRgVk3k=;
        fh=RMScUtJiBDbawk2pInzonOlcFxOF5Le/X77FfUonBLw=;
        b=eFEM5SfdZvDFhHIzMDGzehm7ovfxGqiW630nWNMbqzy3l62TEL0ai+uPSm82XcOKHB
         jVdI60+FaibEPP0MccaSha80A7EtVLX/sgIZvasXxNXLGb4F1zU/2BIeKBffK3eggKsf
         vosicnkk4fpUpw2zxaf7qsY6cHqXvj3p6LTDfSdfKl9iV6WbgjJRnp5H0RacMFsEUdXm
         9Xw+ZowPiH0GRm4byVuUp/u8JiG6nCAanaq/NfJUa0oKxp8FJbcGX5FyLwMrTYtK7VE7
         JTZZaQk2Gpm9U7RNgbY2al1dsqyapeHKO4pwgjGpVZPDrenBi45gmtG7ZmdjRpTao4ww
         mjmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (no key) header.i=@nongnu.org;
       dkim=pass header.i=@beckhoff.com header.s=mail2022r header.b=X6TACYEj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=beckhoff.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4948687bcecsi16494431cf.430.2025.05.13.00.05.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 00:05:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (no key) header.i=@nongnu.org;
       dkim=pass header.i=@beckhoff.com header.s=mail2022r header.b=X6TACYEj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=beckhoff.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEjh8-0002HS-3R; Tue, 13 May 2025 03:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <C.Koehne@beckhoff.com>)
 id 1uEjh0-0002Gj-M7; Tue, 13 May 2025 03:04:46 -0400
Received: from netsrv01.beckhoff.com ([62.159.14.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <C.Koehne@beckhoff.com>)
 id 1uEjgy-0005R9-CA; Tue, 13 May 2025 03:04:45 -0400
DKIM-Signature: v=1; c=relaxed/relaxed; d=beckhoff.com; s=mail2022e; 
 t=1747119880; bh=sm03/Q/lzf8bEEwW8ivqKXEvcHKm+6g5c9M+WRgVk3k=; h=
 Subject:Subject:From:From:Date:Date:ReplyTo:ReplyTo:Cc:Cc:Message-Id:Message-Id;
 a=ed25519-sha256; b=
 1aB1fKGwB/NkgKIq/i5lrp/h6DzngWzXl3LR0WrqMOjKxvuHwWItqYiG1wOq2M9mMl10whHuaQTRGDH5bvnVAQ==
DKIM-Signature: v=1; c=relaxed/relaxed; d=beckhoff.com; s=mail2022r; 
 t=1747119880; bh=sm03/Q/lzf8bEEwW8ivqKXEvcHKm+6g5c9M+WRgVk3k=; h=
 Subject:Subject:From:From:Date:Date:ReplyTo:ReplyTo:Cc:Cc:Message-Id:Message-Id;
 a=rsa-sha256; b=
 X6TACYEjAW2IWbfG2m0rfO6CNDKEeMR8wAwjsrNcgvecd0VELHkOAUPkeLxGENldnXRcP77licLrsfZO0ms9kK0ykKZWPBi20o8b11St3OP1aynX7s/gJxFlPAFWRA3sf8hgDHPaSjpcE2jMAmIbfRIvq40jbtBDqs7DSwMdtXXVzEXNkKZ50RGaEgFLFMSLXys0RlACWVOWH86JVB9GnyqK46iZoQ1bPWMigOEIkDj1qK8hkppQjSWqTnD7xp0y7bVH6AhekE1nH2NEqrtSkMVmbsyQzxQxjaje4TMJ2gQs5B47I0Pevf75EV7pDUZuoXPU7HrJ3EaDF/Y3BE3thQ==
Received: from 172.17.2.111 by netsrv01.beckhoff.com
 (TLS-ECDHE-RSA-WITH-AES-256-GCM-SHA384); Tue, 13 May 2025 07:04:39 GMT
Received: from ex10.beckhoff.com (172.17.2.111) by ex10.beckhoff.com
 (172.17.2.111) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 13 May
 2025 09:04:38 +0200
Received: from ex10.beckhoff.com ([fe80::3762:2101:fb4e:8ffa]) by
 ex10.beckhoff.com ([fe80::ab7f:9a91:d220:441b%12]) with mapi id
 15.02.1748.010; Tue, 13 May 2025 09:04:38 +0200
From: =?utf-8?B?Q29ydmluIEvDtmhuZQ==?= <C.Koehne@beckhoff.com>
To: "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>
CC: =?utf-8?B?WWFubmljayBWb8OfZW4=?= <Y.Vossen@beckhoff.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, "alistair@alistair23.me" <alistair@alistair23.me>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>
Subject: Re: [PATCH 05/21] hw/dma/zynq: Notify devcfg on FPGA reset via SLCR
 control
Thread-Topic: [PATCH 05/21] hw/dma/zynq: Notify devcfg on FPGA reset via SLCR
 control
Thread-Index: AQHbmAca5jtbyEnGik22643XdTO7ZrO0p/aAgBuxBgA=
Date: Tue, 13 May 2025 07:04:38 +0000
Message-ID: <cd2f3e8f128df4dfb067ec541ac7f6ebf7ee18a0.camel@beckhoff.com>
References: <20250318130817.119636-1-corvin.koehne@gmail.com>
 <20250318130817.119636-6-corvin.koehne@gmail.com> <aAu0T_XTt2uwermj@zapote>
In-Reply-To: <aAu0T_XTt2uwermj@zapote>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.17.62.149]
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="=-+72oS1c9DCYwkUFXd1t5"
MIME-Version: 1.0
Received-SPF: pass client-ip=62.159.14.10; envelope-from=C.Koehne@beckhoff.com;
 helo=netsrv01.beckhoff.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PiAZSE0J8NBD

--=-+72oS1c9DCYwkUFXd1t5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2025-04-25 at 18:11 +0200, Edgar E. Iglesias wrote:
> CAUTION: External Email!!
> On Tue, Mar 18, 2025 at 02:07:56PM +0100, Corvin K=C3=B6hne wrote:
> > From: YannickV <Y.Vossen@beckhoff.com>
> >=20
> > When the FPGA_RST_CTRL register in the SLCR (System Level Control
> > Register) is written to, the devcfg (Device Configuration) should
> > indicate the finished reset.
> >=20
> > Problems occure when Loaders trigger a reset via SLCR and poll for
> > the done flag in devcfg. Since the flag will never be set, this can
> > result in an endless loop.
> >=20
> > A callback function `slcr_reset_handler` is added to the
> > `XlnxZynqDevcfg` structure. The `slcr_reset` function sets the
> > `PCFG_DONE` flag when triggered by an FPGA reset in the SLCR.
> > The SLCR write handler calls the `slcr_reset` function when the
> > FPGA reset control register (`R_FPGA_RST_CTRL`) is written with
> > the reset value.
>=20
> Could you please refer to the specs where this is described?
> I couldn't find it...
>=20
>=20

Looks like we've misread the specs and our loader code. Our loader writes a=
 one
to PCFG_DONE and FPGA_RST_CTRL and then polls PCFG_DONE, so we thought that=
 it's
related. However, we've rechecked it and on hardware PCFG_DONE isn't reset =
on
this write. According to the spec, PCFG_DONE is a Write 1 to Clear register=
 but
it won't reset when the condition for setting PCFG_DONE is still true. We'r=
e
going to fix this in v2, thanks.


--=20
Kind regards,
Corvin

--=-+72oS1c9DCYwkUFXd1t5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEgvRSla3m2t/H2U9G2FTaVjFeAmoFAmgi7wQACgkQ2FTaVjFe
Amqamg/+KYgwrZE0oh2oaoB0fnHJiuSTVKbPMTwASvQ9OO+TxvwawV3sRw6Zi2f4
lb62rC/kBpkLXH3H9qpYve/UqAlAH8km04dMyHXt3f5rH3dUgW8daszsmToJH1AN
D5Qc0OLM5dgL1Rrl0KYL4+IB3+SSKanB35iY7AAtVXiKr+k5+Mm7WkyZft5rakd+
1OPRdu+Or9zO8LmTkQZ2sRM9QbK/9et4G3+OoPmEOiVAXY9k68OCdg/Ul8Jh4KYv
zSg4QO5MlB4BzfL0tVdAzaEA9aFvtIksX1P88frUmMqjeI0aolxPnjLaPo7JPA2D
egdO+3gwSqcWZbJsurqq5kthAGVLCb/pVHFPG4/jh8p4sPm0jHSfnM3rb4r5UUJx
N+LdOaNPGpf4tGPATLbpvj7JQC6SmjlG76QjjjvZDCQlZ1vHHipwPO3Hl+AbPqni
PKdryBhZqo0GbBFeH2EMqKgab/U3qwRFbjreyrYsTmKVqBWDzsscjMWe/JcG9GR7
g234icW964mrXcwdOe5+A+a15kTpFwLFuDkumH5cwyYGuVimsuS/1mA6ki93TBBI
J/FyD1AhpK3PKe8jo03mFTtKoiHqR/9iP8ojsinbnaJqszHVtutXwumaGSXVjmbU
RJDWvg4SiwNQLfiRCU30G3o0PZm3Im2ZQZrZrBvRKAQrzot9nGc=
=Xxnp
-----END PGP SIGNATURE-----

--=-+72oS1c9DCYwkUFXd1t5--


Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8EBE92FC4
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Dec 2025 19:36:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vaJ2I-0001Oz-OB; Mon, 29 Dec 2025 14:36:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ2H-0001Np-G1
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:36:09 -0500
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ2E-0008IU-Ut
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:36:09 -0500
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-4ee147baf7bso3866831cf.1
 for <qemu-arm@nongnu.org>; Mon, 29 Dec 2025 11:36:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767036965; cv=none;
 d=google.com; s=arc-20240605;
 b=C9Fb5dF8izwxqgSjJdkK0+DIuGgnMcwrC/AFw3uXtUnAn6XdwGHG5y/sWHeD8rm+pb
 z8PiDno5rk/p4J4zE0Wl+vz9JqWS5MMNd5w8SKgA2ancNmsehMV0OPV3rLuULKr3doJB
 0Dne/i3rB+mNHxy94lYm+FR1ryHQ8yTQ9vfGpQYxc0HUoyyK7g9HYCKxcAX7rgIzOnAF
 paaHSyMxgLJfc5sB7FJlqHS+hy6CLCg01Kqg6M8fLyOTHzjmywlIkGWTnUxc8hqhBAef
 rRvSbZvxQYdW2QyF9TEBCXZSsE3m+nTORNsA0WnrNCESIzfkU1BGzYWujefvYhG/J/V2
 1Lwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ZRR3yxbpq2V3CkfGHou7Vzmk0iQ3VJchRoplq3BvZaI=;
 fh=sJS8/ZPcs2XlFHzHsRrGuKKzqQ2r4t62mjDtMNHYBPs=;
 b=Wup0tWT4vhbEij0MOjl7dfhcZqkVJe+DXG/NXFZxRYNnmcIMLAM71fOJSYmUMNPL/u
 zVm46LpnjvDAMPG0Ha/oysI7CI2dF89/5gHJXhCa8zoa+yZPIZUok/NUDKKmuPkoZhVP
 afYPQFZF8ll01Gg1Z9piPDJAikO/gCRQAAm+OguKy+aeHu/3FpxEmTfcOKT9rrvVy7Ps
 Wnv583RR18R+HX/Ewn72jV2K588NeZTQa6ZMdUIfuLomNFpsmG9SYMxcL9KK47MYp6/D
 U4iOTgUXN+iGkg7OYHENv+iVPBXIKwIGWJpxMOC+YYD/i8FFgfBBJBYMgD0B3HoDQne6
 G8Hw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1767036965; x=1767641765; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZRR3yxbpq2V3CkfGHou7Vzmk0iQ3VJchRoplq3BvZaI=;
 b=28mw1Cwf5x8BpqD0K2whQapPDZpFqtyQfBpK4aI0e9kUjEqo0GsUnLzlb/q4Mm5emS
 Q+0DH70GM0yI35CTFvdmIyg1+O8XeFA1p0Elw629v+oOSWw0jyPz/xvE4xITPGSs9mSU
 cfhc9FK2N/EaeXG1GzqmYFTkmJF4i2BJ4i4JjCSDeVRbyFbxKjha9IwGzH9uWgjjSfse
 zcDZwcHlhJ8weQF+qKYl15Eud7rywcA3VAjHzse5qsa7lVrP35IIySMzoVuBE9lMblGM
 66UIHi241G+EtjDrj1s+2IOun6acrHTzdrtZKD+6DS+XmWm+qoOLZowZoiais/iNJVSn
 UWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767036965; x=1767641765;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZRR3yxbpq2V3CkfGHou7Vzmk0iQ3VJchRoplq3BvZaI=;
 b=Vf/qF2JJ9WqlmL9LnkZ2Xa3RbtCb3F74CLM1k0IoTTYHwe5bCELBqJ5ikD1vrBXqCv
 6B58GWvXjIIdGCrkbzCgvmSg3Btt6p5G1pQFMTlIH+tcex1gcXWYU5X4C9XSESlrPoNU
 vsSY1FUa7QvVUbvt/KQK1HyPLLzCVEGn+gqtsUHwSugAM2IlrdCw/Ba/SOcdqmQt08ej
 +fvhiVc3m8QjEOGcETXFqTCM/2AbAYPMorjhQqYHOOCAsnzFJSrNS1vR6roS35BggsxG
 WvBlSPKG+Pld1UPcU0zkffXLWgOObQrfdMrylNzcf3c0YCSY9WyPVinbOH1cobSzGhyn
 PnjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUARbCEedfVmqA0aSJXOQMaHLKBUG40MaNJlUVrOvGfyHSLApQ5bpYThLNOQdnMOf/EtqyFOk3+Q==@nongnu.org
X-Gm-Message-State: AOJu0YwjzI+qCZFeer4XZTHKm5Dz/gt093Iu+DeeRkgXBIJgvU64ksrx
 Nk7TdjxOpfqygB6dUQZuQSzgFY7ZYSWLB5mKLVlcd6bi/YbCzuc4Lt9Z51Q22/f4XsFCDBw7nEc
 bhYCIimeFSLb+LMrIl7pvRQBtRB9h0BAEnWuP+IAx
X-Gm-Gg: AY/fxX43+gHaGszE/8KVRnPIpwpUKPfq+jx0j3tGIx42IJPLZUXbgW7uWVDE6kq1h/O
 Eu+Tm4zGR7oxIGk7cZxrzoAC6wd8r/gl6fzFa8kGHVLxS1nwOD2QvuCeU28tnEy3RVSkwmbCMi+
 pwL2Q4tMxNLEeG43QwnMHu94mTPX3cXJr2P2GBkvWFUH88goLo88yXe4HmOXL+mhDrjJot+D6Lc
 34jFFQp2jXaviNvRCfcJ1q4cWkccI2GghZOizcYW8FphWSJRfOtUmBwrDHOlecWBcGLjxviVzLc
 J2eUDYpmyKZN7kTaAmF2jNBXFQ==
X-Google-Smtp-Source: AGHT+IGt38XSoG40pMa5YuNcdYBSB7uZ/EHfwgb+wVPmZUzlrS9ccxGMkQIbQafNyTPL7DW2K31uGc/D5qsIyf934Hc=
X-Received: by 2002:a05:622a:102:b0:4f1:aa29:7796 with SMTP id
 d75a77b69052e-4f4e5f88cd9mr31392371cf.15.1767036964658; Mon, 29 Dec 2025
 11:36:04 -0800 (PST)
MIME-Version: 1.0
References: <20251224014203.756264-1-kane_chen@aspeedtech.com>
 <20251224014203.756264-7-kane_chen@aspeedtech.com>
 <465b0714-bd08-40b5-9cf9-5cd206e8548b@kaod.org>
 <SI6PR06MB76312852C6243B1F48202A89F7B0A@SI6PR06MB7631.apcprd06.prod.outlook.com>
 <55adfce4-0dbc-492a-b586-4c46df78007a@kaod.org>
 <SI6PR06MB76318E7A596008386B0AE51CF7BFA@SI6PR06MB7631.apcprd06.prod.outlook.com>
 <ed07c0f2-737d-4d65-917f-d39d02c37063@kaod.org>
 <006fa26f-6b84-4e82-b6e1-7d1353579441@kaod.org>
In-Reply-To: <006fa26f-6b84-4e82-b6e1-7d1353579441@kaod.org>
From: Nabih Estefan <nabihestefan@google.com>
Date: Mon, 29 Dec 2025 11:35:53 -0800
X-Gm-Features: AQt7F2ogMb0AC9i6qx8BM0zRYMH-1rriH9lHCIQsM2s8FJdC6js1NAlttpR3eDY
Message-ID: <CA+QoejXzjvyLA0Pp0xJjCsrwSyegSBRBs-MaT7yP41Nd2B9BcQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/19] hw/arm/aspeed: Integrate interrupt controller
 for AST1700
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Kane Chen <kane_chen@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Troy Lee <troy_lee@aspeedtech.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=nabihestefan@google.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, Dec 29, 2025 at 8:51=E2=80=AFAM C=C3=A9dric Le Goater <clg@kaod.org=
> wrote:
>
> +phil
>
> On 12/29/25 12:41, C=C3=A9dric Le Goater wrote:
> > On 12/29/25 11:00, Kane Chen wrote:
> >>> -----Original Message-----
> >>> From: C=C3=A9dric Le Goater <clg@kaod.org>
> >>> Sent: Sunday, December 28, 2025 1:51 AM
> >>> To: Kane Chen <kane_chen@aspeedtech.com>; Peter Maydell
> >>> <peter.maydell@linaro.org>; Steven Lee <steven_lee@aspeedtech.com>; T=
roy
> >>> Lee <leetroy@gmail.com>; Jamin Lin <jamin_lin@aspeedtech.com>; Andrew
> >>> Jeffery <andrew@codeconstruct.com.au>; Joel Stanley <joel@jms.id.au>;
> >>> open list:ASPEED BMCs <qemu-arm@nongnu.org>; open list:All patches CC
> >>> here <qemu-devel@nongnu.org>
> >>> Cc: Troy Lee <troy_lee@aspeedtech.com>; nabihestefan@google.com
> >>> Subject: Re: [PATCH v4 06/19] hw/arm/aspeed: Integrate interrupt cont=
roller
> >>> for AST1700
> >>>
> >>> Hello Kane,
> >>>
> >>>> Thank you for the suggestion. Since I need to submit a v5 patch to
> >>>> split the I2C code changes anyway,
> >>>
> >>> Can you please introduce the bus label property at the end of the pat=
ch series ?
> >>> Please consider adding a functional test and updating the documentati=
on too.
> >>>
> >>>> I will handle the naming adjustments and other minor fixes myself in
> >>>> that version.
> >>>
> >>> Thanks,
> >>>
> >>> C.
> >>
> >> Hi C=C3=A9dric,
> >>
> >> If I move the bus label property to the end of this patch series, it w=
ill trigger
> >> a test failure in the current patch series.
> >
> > Which test ?
> >
> >> To avoid this, I plan to move the bus
> >> label changes into a separate patch series and submit it before the AS=
T1700
> >> series. I believe this approach ensures both series pass the tests pro=
perly.
> >> What are your thoughts on this?
> >
> > I would like to understand the issue first.
> I see.
>
> The AST2700 functional tests fail :
>
>         self.vm.add_args('-device',
>                           'tmp105,bus=3Daspeed.i2c.bus.1,address=3D0x4d,i=
d=3Dtmp-test')
>
> The "bus label" proposal renames the IO expander I2C buses (32) to avoid
> the name conflicts :
>
>            /aspeed.ioexp0.i2c.bus.0 (i2c-bus)
>            ...
>            /aspeed.ioexp0.i2c.bus.15 (i2c-bus)
>
>            /aspeed.ioexp1.i2c.bus.0 (i2c-bus)
>            ...
>            /aspeed.ioexp1.i2c.bus.15 (i2c-bus)
>
> Since this will be exposed in the user API, it would be best to avoid
> introducing poorly chosen names. Having so many I2C buses (48) in a
> single machine is somewhat new in QEMU and I am not aware of any naming
> convention for this.
>
> May be others do ?
>
> Thanks,
>
> C.

I'm not aware of any convention, but I'd argue the current naming with
the bus label makes sense. A i2c bus on the main machine is
"aspeed.i2c.bus.%d" which clearly makes it easy to differenciate but
see that the two busses are somehow related. Maybe it'd be worth
changing the `aspeed_i2c_class_init` to make this relation more
obvious by not using TYPE_ASPEED_I2C_BUS but use the string
explicitly?

Thanks,
Nabih


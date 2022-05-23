Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3614086lfh;
        Mon, 23 May 2022 09:43:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYWnGYE1GI+6Brl3kCpYtZ2mSSKFu0NGWaxb3+BfX2hOTxaxJyr0nDT+2lZcqasxehEk3I
X-Received: by 2002:a05:620a:1902:b0:5f1:8f5d:b0f2 with SMTP id bj2-20020a05620a190200b005f18f5db0f2mr14535107qkb.60.1653324189232;
        Mon, 23 May 2022 09:43:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1653324189; cv=pass;
        d=google.com; s=arc-20160816;
        b=KqsB/ZNNTfWOL/iX+3VL9U3LzOC+Tm3nS7OAmyFWKrhNOgIVU6n5KvKstgeLT6vxkZ
         hXCfkbEs0XHvxB2Ek8CxA8ev0l/lmva4fu2F6T88drXIv1E5FadKTR40paRs/sO5ia22
         x1OkBSDc0w2pxSndVlBJpslq6Wm6QdbpA0Luex++roObL4Xwd7f/WDDHfDSM03QoNvY5
         GqPSrc1nrmZlyPgNtmWCE2iFX48URsN1gqP1j4OOtAtrflXZvd4H567xQGXGx4wfqLc1
         ani78zIgfpoFUB90k/UXGjvyaeMd29UtKlR1QQxhXv2xD4Ku9AwfKOhDsCNtfJbw34dF
         XqBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:organization:references:in-reply-to:date:cc
         :to:from:subject:message-id:dkim-signature;
        bh=HSDqLNIbiAlIIj112gAv+SfiMnROsQCmP+UefJmb0TM=;
        b=zRvtxpgrp2cpYMTCgbYzgQukjxkUb0Kk6fHCYEF+f6A/hdAllX0yCyicbwCjCjJaZb
         nQmbpZB8tJt+ryITAoex8LnlBldKiTue3YK5zdQYYWFceKtbaSf/jZc5YMapVvGQ8b/j
         DFV/agdbpda0GPsPK2m6G+bHX2P7u4I8eVb0lvFARm+DmEXUwGiKL5Xx1ZWXwmr6X3VO
         Z4qprPs24Dv+JNl4jm/OWomBEVmvrDis++IfKt0fG90iLZivCg68jz7Pab5v7VUfChvP
         2mD9oqaKmHMA9IlGLz3s+3XouACyqfvLqHmjBqm1RoompaaPktMvmv5zcLaqsOjsFqp2
         3Tiw==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@icenowy.me header.s=zmail header.b=G9PnyKMT;
       arc=pass (i=1 spf=pass spfdomain=icenowy.me dkim=pass dkdomain=icenowy.me dmarc=pass fromdomain=icenowy.me>);
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iw1-20020a0562140f2100b00461c75e7fffsi2802390qvb.113.2022.05.23.09.43.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 May 2022 09:43:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@icenowy.me header.s=zmail header.b=G9PnyKMT;
       arc=pass (i=1 spf=pass spfdomain=icenowy.me dkim=pass dkdomain=icenowy.me dmarc=pass fromdomain=icenowy.me>);
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ntB9A-0005fo-OS
	for alex.bennee@linaro.org; Mon, 23 May 2022 12:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uwu@icenowy.me>)
 id 1ntB74-0004BE-26; Mon, 23 May 2022 12:40:58 -0400
Received: from sender4-op-o18.zoho.com ([136.143.188.18]:17886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uwu@icenowy.me>)
 id 1ntB72-0007Zn-0k; Mon, 23 May 2022 12:40:57 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1653324043; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PuiyuF0gMrnHd1B9Ro7m/XlPwk3wtlPoXhsNNgKEO+p3BZc68NyPkb2xLlEkmfdLtO6/WkhUT05fORXovZ2fxUr/pAxUiTiFoS4lgp7P8kQQ0pjzHJ2ZQ2VFK4tFIxF7ZPxRY6hp35XloltPdgwq8ihEQ08gCFrl4RmRMLxmMN4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1653324043;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=HSDqLNIbiAlIIj112gAv+SfiMnROsQCmP+UefJmb0TM=; 
 b=mWsXDKJgo8PYo9ezpXkHWCK46kthQYqHDXfBJYdm+J8KB/n+FUoVhTUJ7N+Tlf7dvXMwLXpiZjpghKeU5FYaTRkrv3baNqz8DO5dqAqvLinuTei/BDsub4OBu2lszbsbLiKeMGGBW11xgNK63fsQWWIxn1ZKRX3HOI4qTe+mNUk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1653324043; 
 s=zmail; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=HSDqLNIbiAlIIj112gAv+SfiMnROsQCmP+UefJmb0TM=;
 b=G9PnyKMTJeAnoIIKUt8wnnFBkdxsMD+wsIplzUK6h2q4yEUh3qpbcZcEkoOmvCeg
 ZXKufRgwCXIcohFIVsy+pN2U0FcT/MXa6i9hQIC2Z5shT6zeOGt1kGYfjcwI58FWpjQ
 4Tni+lif2vFR0i73F2T7gIVB6QKtsOCJw9Xv4r/0=
Received: from edelgard.icenowy.me (59.41.161.142 [59.41.161.142]) by
 mx.zohomail.com with SMTPS id 165332404077472.6018843189238;
 Mon, 23 May 2022 09:40:40 -0700 (PDT)
Message-ID: <a7bdef698925136964b2215b94bcd53e1f153048.camel@icenowy.me>
Subject: Re: [PATCH] hw/sd/allwinner-sdhost: report FIFO water level as 1
 when data ready
From: Icenowy Zheng <uwu@icenowy.me>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>, Niek Linnenbank
 <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Tue, 24 May 2022 00:40:36 +0800
In-Reply-To: <CAFEAcA-5CxTPdzbwubjRvw-KwOAnW1vPP3O+acvURPD0kwXfMg@mail.gmail.com>
References: <20220520124200.2112699-1-uwu@icenowy.me>
 <CAFEAcA-5CxTPdzbwubjRvw-KwOAnW1vPP3O+acvURPD0kwXfMg@mail.gmail.com>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.18; envelope-from=uwu@icenowy.me;
 helo=sender4-op-o18.zoho.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d42aV56mSJX3

=E5=9C=A8 2022-05-23=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 15:14 +0100=EF=BC=
=8CPeter Maydell=E5=86=99=E9=81=93=EF=BC=9A
> On Fri, 20 May 2022 at 13:42, Icenowy Zheng <uwu@icenowy.me> wrote:
> >=20
> > U-Boot queries the FIFO water level to reduce checking status
> > register
> > when doing PIO SD card operation.
> >=20
> > Report a FIFO water level of 1 when data is ready, to prevent the
> > code
> > from trying to read 0 words from the FIFO each time.
> >=20
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > ---
> > =C2=A0hw/sd/allwinner-sdhost.c | 7 +++++++
> > =C2=A01 file changed, 7 insertions(+)
> >=20
> > diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
> > index 041e45c680..b66fd9bce7 100644
> > --- a/hw/sd/allwinner-sdhost.c
> > +++ b/hw/sd/allwinner-sdhost.c
> > @@ -114,7 +114,9 @@ enum {
> > =C2=A0};
> >=20
> > =C2=A0enum {
> > +=C2=A0=C2=A0=C2=A0 SD_STAR_FIFO_EMPTY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D (1 << 2),
> > =C2=A0=C2=A0=C2=A0=C2=A0 SD_STAR_CARD_PRESENT=C2=A0=C2=A0=C2=A0 =3D (1 =
<< 8),
> > +=C2=A0=C2=A0=C2=A0 SD_STAR_FIFO_LEVEL_1=C2=A0=C2=A0=C2=A0 =3D (1 << 17=
),
> > =C2=A0};
>=20
> Is there documentation on this hardware available somewhere?
> The Linux kernel driver for it doesn't seem to have a #define
> for this bit 17.

For the specific version on H3,
https://linux-sunxi.org/File:Allwinner_H3_Datasheet_V1.2.pdf .

>=20
> In an ideal world we'd actually emulate the FIFO itself
> (our pl181 and bcm2835_sdhost models do this, for example).

Interesting, I will check it.

> -- PMM



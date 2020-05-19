Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3538427lfb;
        Mon, 18 May 2020 17:39:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHmAIeCR9MhuBjJYS8Nbt6FS94HFso79xstrahJ6qMuw02s0sm/kw5OOXaBaz3Br3C9aCe
X-Received: by 2002:ad4:5684:: with SMTP id bc4mr19193556qvb.85.1589848771051;
        Mon, 18 May 2020 17:39:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589848771; cv=none;
        d=google.com; s=arc-20160816;
        b=rWRn6oQOlOStchVMogflPixICPLICqOCyWI4V1FCn0ZqWTuTVJgW82FLlZEi4HKVrg
         ScX1tdzBKuEZcBfaiXLYPwnWHeGIEL2x9U/zTWvvygyaXQFTRDuruIW+PM+m6btIuoYU
         uQF8S1VpI0lQBJc+OaWX4MNbYLmNi2UVIIfGBkDjRdZyqHeV5k4L86Vb3dJgMpDF9KwB
         FaLQDDjWktUXz4ZSiHFZxi0Nny7BrApMpIb+c22bSZeMdBzVqXMeNKljuP9x5EhE4Ri/
         KWWgTHSuZDulqp4xHfrfxI6USJLDz7brfqmv5QTI/2vyw1P7cpCHJSY7T5kT473KrnsD
         fkvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=XHr1u4Up0QpG/c/A3SDWCSoQmzZzYbzXevGQqA1OMKo=;
        b=ndHyZFnqfEnpCaBJnc7o4KVgeKz4XjDBkdYv6EH7z4ZJy1NfBdYckARsS65dXYKn4N
         KUg2QTRNoaccElsjlXgdg9f87n1hek57HRmliZeqqOucHzOK5Uti82tNumATAkk9nMYn
         p29zd8Nf8qbTB5Y6Zirsw7sXSNoaLD74xpmRGbQUk3vfYOCClVUXqdJ8RBQ17UEeNtaN
         8FWpYmJ5SYvQ2hrr3INJY+URAx6zZ1xHpggoKlG/eK5zf5D4I8+dA3cIfst0/VP2PCcb
         FX2FlbXrBmuknKb5UcoPeXt3mjx7yWgrNI/EIxe4E14IJ3loM+tpW519rXIAfOoUO7pG
         B6fA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=lvLNfHNK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h207si6327259qke.16.2020.05.18.17.39.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 17:39:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=lvLNfHNK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jaqI6-0005Ad-CA
	for alex.bennee@linaro.org; Mon, 18 May 2020 20:39:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1jaqHj-00058G-US; Mon, 18 May 2020 20:39:07 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:41638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1jaqHh-0004Lh-NR; Mon, 18 May 2020 20:39:07 -0400
Received: by mail-ej1-x643.google.com with SMTP id x1so10341810ejd.8;
 Mon, 18 May 2020 17:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XHr1u4Up0QpG/c/A3SDWCSoQmzZzYbzXevGQqA1OMKo=;
 b=lvLNfHNKiG8o0SqLjl2nCcZzw9vBV4OE+lBoxXHzK+MozzrdbUUCn2of2X8BJrR+KZ
 5FEDgw36ldHQ/jtvF8FR2943+7l0EV/OARDlnPzJpti3x+tLtLh4wKUnF8d5dFMcmCfS
 34jSvxo17Y9AgjuBPgHSbaK0ocLQz5AJTiYuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XHr1u4Up0QpG/c/A3SDWCSoQmzZzYbzXevGQqA1OMKo=;
 b=QOY68aEe7pvIyZulGCmf1tOyzJ3Urao8I7VsSFmY7h66JXMnWB3SzM17wClwfUAnVQ
 8h3+Pz+ivviXSGiVqZpvkMtNF7aeb36xyYcmxjFu4rRvNJQM1G8ENYt5ioigV469BrBd
 AyNBTBoXKQlKo6v2PEw/yhYyOER1Tckldh90XE4rfDod9Y3L/aThBtr41vN+9KhBRAtv
 /KC1XCCwzRMv7SZiZVBdN6C+jG2aWNcmlT//hI8I43+sUSYyGKF9zD9WM44sB5hFP6Id
 sSiwnS/eFOFwiHB7ocpH4/YP0Jrvxr5hL6wiMwveCaPX/R/XQTvKARJCiothG23O5TV+
 Pv3w==
X-Gm-Message-State: AOAM532Rk9wtZTVqRSmHUTP1XWdarCRVBBtpg6Re9MhSUoh6S3o4zEKJ
 4f6+fdcHJtZ8lUz0c8G8l/r/jH3NAE7SqfMxAxs=
X-Received: by 2002:a17:906:1f87:: with SMTP id
 t7mr13935251ejr.50.1589848743574; 
 Mon, 18 May 2020 17:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-5-armbru@redhat.com>
 <9fc4a6e2-fa90-ba62-91cf-e22eb3ef4cdc@kaod.org>
In-Reply-To: <9fc4a6e2-fa90-ba62-91cf-e22eb3ef4cdc@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 19 May 2020 00:38:51 +0000
Message-ID: <CACPK8XcxVrA3E-c=jkszXd2Z6PMLO=tWDF60DTu-E3cyUdXD2A@mail.gmail.com>
Subject: Re: [PATCH 04/24] aspeed: Don't create unwanted "ftgmac100",
 "aspeed-mmi" devices
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OQOFC3mgk7Lv

On Mon, 18 May 2020 at 12:19, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 5/18/20 7:03 AM, Markus Armbruster wrote:
> > These devices are optional, and controlled by @nb_nics.
> > aspeed_soc_ast2600_init() and aspeed_soc_init() create the maximum
> > supported number.  aspeed_soc_ast2600_realize() and
> > aspeed_soc_realize() realize only the wanted number.  Works, although
> > it can leave unrealized devices hanging around in the QOM composition
> > tree.  Affects machines ast2500-evb, ast2600-evb, palmetto-bmc,
> > romulus-bmc, swift-bmc, tacoma-bmc, and witherspoon-bmc.
> >
> > Make the init functions create only the wanted ones.  Visible in "info
> > qom-tree"; here's the change for ast2600-evb:
> >
> >      /machine (ast2600-evb-machine)
> >        [...]
> >        /soc (ast2600-a1)
> >          [...]
> >          /ftgmac100[0] (ftgmac100)
> >            /ftgmac100[0] (qemu:memory-region)
> >     -    /ftgmac100[1] (ftgmac100)
> >     -    /ftgmac100[2] (ftgmac100)
> >     -    /ftgmac100[3] (ftgmac100)
> >          /gpio (aspeed.gpio-ast2600)
> >          [...]
> >          /mii[0] (aspeed-mmi)
> >            /aspeed-mmi[0] (qemu:memory-region)
> >     -    /mii[1] (aspeed-mmi)
> >     -    /mii[2] (aspeed-mmi)
> >     -    /mii[3] (aspeed-mmi)
> >          /rtc (aspeed.rtc)
> >
> > I'm not sure creating @nb_nics devices makes sense.  How many does the
> > physical chip provide?
>
> The AST2400, AST2500 SoC have 2 macs and the AST2600 has 4. Each machine
> define the one it uses, generally MAC0 but the tacoma board uses MAC3.
>
> Shouldn't the model reflect the real address space independently from
> the NIC backends defined on the command line ?

Agreed, the MAC hardware is present in all instances of the AST2600,
so they should be present in qemu. Only some boards wire up a network
device to the other side.

It would be advantageous for us to be able to specify which device is
being connected to on the command line. Currently we do this by
connecting all devices up to the one we care about which is an ugly
workaround.

> How should we proceed in such cases ?
>
> Thanks,
>
> C.
>
> >
> > Cc: "C=C3=A9dric Le Goater" <clg@kaod.org>
> > Cc: Peter Maydell <peter.maydell@linaro.org>
> > Cc: Andrew Jeffery <andrew@aj.id.au>
> > Cc: Joel Stanley <joel@jms.id.au>
> > Cc: qemu-arm@nongnu.org
> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > ---
> >  hw/arm/aspeed_ast2600.c | 2 +-
> >  hw/arm/aspeed_soc.c     | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> > index 71a0acfe26..0a6a77dd54 100644
> > --- a/hw/arm/aspeed_ast2600.c
> > +++ b/hw/arm/aspeed_ast2600.c
> > @@ -188,7 +188,7 @@ static void aspeed_soc_ast2600_init(Object *obj)
> >                                sizeof(s->wdt[i]), typename);
> >      }
> >
> > -    for (i =3D 0; i < sc->macs_num; i++) {
> > +    for (i =3D 0; i < nb_nics && i < sc->macs_num; i++) {
> >          sysbus_init_child_obj(obj, "ftgmac100[*]", OBJECT(&s->ftgmac10=
0[i]),
> >                                sizeof(s->ftgmac100[i]), TYPE_FTGMAC100)=
;
> >
> > diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> > index cf6b6dd116..7ca860392a 100644
> > --- a/hw/arm/aspeed_soc.c
> > +++ b/hw/arm/aspeed_soc.c
> > @@ -203,7 +203,7 @@ static void aspeed_soc_init(Object *obj)
> >                                sizeof(s->wdt[i]), typename);
> >      }
> >
> > -    for (i =3D 0; i < sc->macs_num; i++) {
> > +    for (i =3D 0; i < nb_nics && i < sc->macs_num; i++) {
> >          sysbus_init_child_obj(obj, "ftgmac100[*]", OBJECT(&s->ftgmac10=
0[i]),
> >                                sizeof(s->ftgmac100[i]), TYPE_FTGMAC100)=
;
> >      }
> >
>

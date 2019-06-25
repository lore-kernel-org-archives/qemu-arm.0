Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4607893wrg;
        Mon, 24 Jun 2019 23:48:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxQiPUrlqW3O6C9i+DRhixa1A8DyiYd4k23/FCUwIouyNRpZfx7BCOOGYvEcAAklF+Pt248
X-Received: by 2002:a50:92c4:: with SMTP id l4mr65864498eda.34.1561445297134;
        Mon, 24 Jun 2019 23:48:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561445297; cv=none;
        d=google.com; s=arc-20160816;
        b=aO13UqTejn8v7msfa4osMWbm180KVOvqsn5v1uACfcQ0rAXTe7Ba4Yd6fdNb3ldUtI
         Sbo9Iz2TMcnkRqAUjrbj+W/y0hHo5oNfhPeTD14aewW3Jq+bpdTx+ejpkSHM7Sy+AI2j
         TR20DSxjfpsPJxZ9wFB5QwacqUVY1IKyJaaTR/nPifw4DAZTMx83cKW6kkkD8qi5en/3
         mGuAOMsBHp7OLxbeoOHABtDEj3z4rT+eL8GEOb4dIUrIwMXkhZWzjyNF/VtQ6oGKBvj0
         Nr7gGMmP0/xspGVQ+OCf6R19y19frcwT+YsQknJRGyVUgoHkwnhewnrEN4smpAxqqBLx
         iONQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=Qgw/UEmTi+EnyEYVz+R14jW+cx7uhlztrfnIC1iFJkA=;
        b=u7rtcxFqOS5Z5hcPK6wGKxSHKOmAk6rPvd39fVsOuDTe5yeF0/IHcw2zgBCMUBAXk9
         T1b04sw2xqRXqTWrJiZx7W5unt+T0iJG8PHP3QGx2dGOezRsyGF2iS2YcspgKrVVklab
         w2gEo2qNtmvlPz4SFzFBU6iLAejFN2+InOPm8mypnpikzIR/xipjAsjb3WH7TJrsDbst
         +w41eosR66D7mG0XDa0UDVz6J9+iQq76+bKdRawxaKBVrHHfyNtaYB+ifdQRc+Ospc5G
         24Fq5jUU+XRxT9Aexpzh23iPd0gh2mJa9/h4ozhd+XK/NsWH558PWOaK9FmbvNzvfOI6
         RUnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=c6uZPUud;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b24si10801637ede.402.2019.06.24.23.48.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2019 23:48:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=c6uZPUud;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56864 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hffFY-0003NE-80
	for alex.bennee@linaro.org; Tue, 25 Jun 2019 02:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54905)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <joel.stan@gmail.com>) id 1hffFQ-0003Mp-Js
 for qemu-arm@nongnu.org; Tue, 25 Jun 2019 02:48:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1hffFP-0006XN-CG
 for qemu-arm@nongnu.org; Tue, 25 Jun 2019 02:48:08 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:35126)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1hffFO-0006WW-Ru; Tue, 25 Jun 2019 02:48:07 -0400
Received: by mail-qk1-x741.google.com with SMTP id l128so11734058qke.2;
 Mon, 24 Jun 2019 23:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Qgw/UEmTi+EnyEYVz+R14jW+cx7uhlztrfnIC1iFJkA=;
 b=c6uZPUudMoomhfjYM4Ec0lS2jtRu3EyRTYNcegeqdXSjsWI92qmE0cnZ4jUO71MXNh
 VAMBcJuk6VQLjzIcuQWbDMVlSkI7swjP8Oy3RC0+QKbzIp2RN6BTUxrf/0PvZkh+2SpZ
 MrPRUrE4ChWW+AhH0IYQtmOVVvUfp9aZYADzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Qgw/UEmTi+EnyEYVz+R14jW+cx7uhlztrfnIC1iFJkA=;
 b=eAYr9nyXZyXDqqDjg3dtGgOz4yIUfd6kczIU0hUozhVxxx24zWxwtYyS2tJoH2E0Sp
 gcvmmCepY9zvhnf5lTjJR7iK5k6LeaChP4ClIdM8B+aK6stsTO8qt2HrwNRMhF1bMLKj
 HNE+Y+gZ7Tg0aRgsxysUdIMuX4aR84iSNBiUZFQP6aUsS0G9hUxjonkI5/jqdNlimpHL
 F720iX0XksjbA28KiMxl9SeDdMeCZWhQRedFciGEAuXPYz/wS+udwXHreNu/rr/a7G/J
 Lc8BEMD+MJZIBqpbpZq7vvgm8hDltg9ICiK8BN9/rO8bwN3YfXondt6cST4i7HG5j08q
 z/Xw==
X-Gm-Message-State: APjAAAVeyl0lwkvuK1aka2QEk8bpmCgfOMu/vis41P8uDtxvsIf254ic
 Ps/NiGbg6Wo2impJyLj4SPAVV4DN5zxhuQQUrlg=
X-Received: by 2002:a37:b0c6:: with SMTP id
 z189mr76395184qke.208.1561445284779; 
 Mon, 24 Jun 2019 23:48:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190621065242.32535-1-joel@jms.id.au>
 <6aec047c-81bd-e179-6fad-4bee896ea7a2@kaod.org>
 <21bd02d0-d051-e730-bfb9-bca2f57babe8@redhat.com>
In-Reply-To: <21bd02d0-d051-e730-bfb9-bca2f57babe8@redhat.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 25 Jun 2019 06:47:52 +0000
Message-ID: <CACPK8XcVZ68g+6BCvAszZubJOE1Y=Ac2EvZ84u_740Lo4Rqx1A@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::741
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] aspeed: Link SCU to the
 watchdog
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
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oHE93Go3IArH

On Fri, 21 Jun 2019 at 09:06, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 6/21/19 10:25 AM, C=C3=A9dric Le Goater wrote:
> > On 21/06/2019 08:52, Joel Stanley wrote:
> >> The ast2500 uses the watchdog to reset the SDRAM controller. This
> >> operation is usually performed by u-boot's memory training procedure,
> >> and it is enabled by setting a bit in the SCU and then causing the
> >> watchdog to expire. Therefore, we need the watchdog to be able to
> >> access the SCU's register space.
> >>
> >> This causes the watchdog to not perform a system reset when the bit is
> >> set. In the future it could perform a reset of the SDMC model.
> >>
> >> Signed-off-by: Joel Stanley <joel@jms.id.au>
> >
> > I was keeping this patch in my tree (hence the Sob) hoping that
> > someone could find the time to study the reset question. But this
> > patch is useful as it is and I think we should merge it.
> >
> > Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >
> > Thanks,
> >
> > C.
> >
> >> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

> >> --- a/hw/watchdog/wdt_aspeed.c
> >> +++ b/hw/watchdog/wdt_aspeed.c
> >> @@ -44,6 +44,9 @@
> >>
> >>  #define WDT_RESTART_MAGIC               0x4755
> >>
> >> +#define SCU_RESET_CONTROL1              (0x04 / 4)
> >> +#define    SCU_RESET_SDRAM              BIT(0)
> >> +
> >>  static bool aspeed_wdt_is_enabled(const AspeedWDTState *s)
> >>  {
> >>      return s->regs[WDT_CTRL] & WDT_CTRL_ENABLE;
> >> @@ -222,6 +225,13 @@ static void aspeed_wdt_timer_expired(void *dev)
> >>  {
> >>      AspeedWDTState *s =3D ASPEED_WDT(dev);
> >>
> >> +    /* Do not reset on SDRAM controller reset */
> >> +    if (s->scu->regs[SCU_RESET_CONTROL1] & SCU_RESET_SDRAM) {
>
> This would be cleaner as an static inlined function in
> "hw/misc/aspeed_scu.h" IMO, maybe 'bool scu_sdram_is_reset()'.

I will take this suggestion on board in the future when I model the
watchdog reset behavior in more detail.

>
> Anyway the patch looks sane:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Thanks.

Joel

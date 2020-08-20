Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1491124lfy;
        Thu, 20 Aug 2020 09:24:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQBckRV+P76rkvCXZ37NAMv5wZYemCc9XIM0+C/1aC2rwnsUaWsSLgETdkQiOcSsUXpayC
X-Received: by 2002:a25:d195:: with SMTP id i143mr6440617ybg.277.1597940668144;
        Thu, 20 Aug 2020 09:24:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597940668; cv=none;
        d=google.com; s=arc-20160816;
        b=ISCGb5GoLk3EWdMEwXFHRK9DW7fpXCiRYGN78PImlazlXnuT7t5UUrj65C3PuvgSsx
         GTddTjLI+ZdLWfgGIiAZjT/JgMM0YCx3xqu7HAZqqMNKS18VTf3CCs8lzjY2HlPUViq7
         Fn1bK/TQq0eDQaY4u+K6L7FoU9DaVR0GNAlwjeIA1z9WKLRpN2HAZMlJB90n5HBEHNZ/
         0E83pU4i0UvnB3G2QN4ApQkBzTCcK4fKg44sltQKvHGxceYXnmGdeOFSVqU2E+SYTh+h
         qAuYE7YM65TI1Nk21ZT1gu6UBx78ljF20GBFsoX66EyfBx3yAiBuTvuMmPpry149A124
         Lu1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Ehvs5f2nY3oQkJhvkODAEHBM5vFLkij2WxLo6jDIerk=;
        b=ieC6YuC7+JxX6THMzMiRFalapyt9HIv8ucYPmXtDMMzDKdAtOpRdI0wVIrPSjwFRDL
         MfUAQabqLP7ck1forrbAqLUThJ3BvmmHvOKv6pI0YMwMWyraqghllcoBeP16rj5cUAK3
         Rjiy644Kws4hWfUjubRwlCL4cXRYWxLXAOjgUYtu8Dpy3JmQsNibxW6M8Atbo3mL1osh
         dwhD49IVqsGkTwdgKLH3mHhapGyvTmYOMa0BjIQ72/OQV2FBrd4/ThEr4A6nUaFZlK6g
         BbhOEqfbk1wI4SRA42zPSquJKHknzpgUGbnwKUKHBgSqyRXgwgSRXgJ0lXrPtEZanZvh
         e3cQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=jlOVpBE7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7si2446664ybc.432.2020.08.20.09.24.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Aug 2020 09:24:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=jlOVpBE7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:40070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8nMZ-0002lq-F7
	for alex.bennee@linaro.org; Thu, 20 Aug 2020 12:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1k8nMS-0002lP-71
 for qemu-arm@nongnu.org; Thu, 20 Aug 2020 12:24:20 -0400
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42]:34115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1k8nMQ-0000mb-HZ
 for qemu-arm@nongnu.org; Thu, 20 Aug 2020 12:24:19 -0400
Received: by mail-vs1-xe42.google.com with SMTP id a127so1395616vsd.1
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2020 09:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ehvs5f2nY3oQkJhvkODAEHBM5vFLkij2WxLo6jDIerk=;
 b=jlOVpBE7OpX/K1g52mdFZoTJC/XwqxL5J+r4h4alGqSeB3pG1n9VC7JasXluWwLQYp
 payJ9aGUc9RuTOcZS5BTxg0iJ4iv/UZFYfXt2mrMYhc0vuAV714p7jEfx9rje9Rh7hNj
 DKsNLyhAluUxhhVbL1/XAoTa3ovGdT6E8qjpGf28r9donS39Li6Pi9U82FUbMzn/XI7v
 /8SyeduW90NsjaTRJWmFy3YA12mB+KUsStjckZPQeFO6Mg5cJJHoMhROGECIShGCUTOV
 gtrdAfYfa/OL9awzYQcLE+hnK4xkzB2x9c9Ze2aQmQ2RSS9Rz5MAaJmNURBfUQNucAXs
 2giQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ehvs5f2nY3oQkJhvkODAEHBM5vFLkij2WxLo6jDIerk=;
 b=Ofd+BH97nIUcHOr7otrA4/BGM7U1g5aTvMxQBzTYA5Gm6VD6By3+MvoYF+h1dzs/9p
 +Iao/JgFO4Skr0btUysrzIBUQXRvC+K7Qab5qBFD3fj23prBE0QVfR+lMHZ6LRmTyLJh
 95ZJeRUEWGIEnJffzmaUoR8K5eERG0CnnKlxENrBYd0jswiTb2J/jm4BqVwI5jPhW+Q8
 Jy3HShmVezcf3+xDZPT2IGFT0SWQZ9cgQjFcGzgTUgbKDomEbmeagwKp+p8fTfqrPuq1
 jh0veKRJ9TXXd6cB9ArgXOaKtTeql89Gccwr7quOpV+M7ofg1i+Tz4nnNR5VrY0uRVGr
 L9ag==
X-Gm-Message-State: AOAM531vB1i97Kqt9BvaFhdgqmCWxazqB6zNSGTUaZ4pRq+vlqtRH159
 AmIOa2rYx1qjdnZUDv+ezmyYFSWBRHa4y8frAepaMQ==
X-Received: by 2002:a67:cd10:: with SMTP id u16mr2407255vsl.152.1597940656886; 
 Thu, 20 Aug 2020 09:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200811004607.2133149-1-hskinnemoen@google.com>
 <20200811004607.2133149-14-hskinnemoen@google.com>
 <64f8cd56-306e-4961-488b-36c666894a54@amsat.org>
 <CAFQmdRbvSKYJ00tE_79Eh+gW_ge8kEco=1gqFtvMcoJGraozdw@mail.gmail.com>
 <CAFQmdRZCk5Rqb1C2TRCEUMaKmF608g2_Or8mLCTSG03nCQ1Ygg@mail.gmail.com>
 <28a30c64-7cc5-4b4f-2be2-b3d3af511cb1@amsat.org>
In-Reply-To: <28a30c64-7cc5-4b4f-2be2-b3d3af511cb1@amsat.org>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Thu, 20 Aug 2020 09:24:05 -0700
Message-ID: <CAFQmdRYFLUdbs5mj3zHzNN1y+bvQXCrtGhY_iOLVfnydGxM0Jw@mail.gmail.com>
Subject: Re: [PATCH v7 13/13] tests/acceptance: console boot tests for
 quanta-gsj
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>, 
 CS20 KFTing <kfting@nuvoton.com>, Cleber Rosa <crosa@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Eric Blake <eblake@redhat.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e42;
 envelope-from=hskinnemoen@google.com; helo=mail-vs1-xe42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: db8jyVKb/Ann

On Wed, Aug 19, 2020 at 10:29 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> +Eric / Richard for compiler optimizations.
>
> On 8/20/20 3:53 AM, Havard Skinnemoen wrote:
> > On Tue, Aug 11, 2020 at 8:26 PM Havard Skinnemoen
> > <hskinnemoen@google.com> wrote:
> >>
> >> On Tue, Aug 11, 2020 at 1:48 AM Philippe Mathieu-Daud=C3=A9 <f4bug@ams=
at.org> wrote:
> >>> INTERRUPTED: Test interrupted by SIGTERM
> >>> Runner error occurred: Timeout reached
> >>> (240.45 s)
> >>>
> >>> Is that expected?
> >>
> >> I'm not sure why it only happens when running direct kernel boot with
> >> unoptimized qemu, but it seems a little happier if I enable a few more
> >> peripherals that I have queued up (sd, ehci, ohci and rng), though not
> >> enough.
> >>
> >> It still stalls for an awfully long time on "console: Run /init as
> >> init process" though. I'm not sure what it's doing there. With -O2 it
> >> only takes a couple of seconds to move on.
> >
> > So it turns out that the kernel gets _really_ sluggish when skipping
> > the clock initialization normally done by the boot loader.
> >
> > I changed the reset value of CLKSEL like this:
> >
> > diff --git a/hw/misc/npcm7xx_clk.c b/hw/misc/npcm7xx_clk.c
> > index 21ab4200d1..5e9849410f 100644
> > --- a/hw/misc/npcm7xx_clk.c
> > +++ b/hw/misc/npcm7xx_clk.c
> > @@ -67,7 +67,7 @@ enum NPCM7xxCLKRegisters {
> >   */
> >  static const uint32_t cold_reset_values[NPCM7XX_CLK_NR_REGS] =3D {
> >      [NPCM7XX_CLK_CLKEN1]        =3D 0xffffffff,
> > -    [NPCM7XX_CLK_CLKSEL]        =3D 0x004aaaaa,
> > +    [NPCM7XX_CLK_CLKSEL]        =3D 0x004aaba9,
> >      [NPCM7XX_CLK_CLKDIV1]       =3D 0x5413f855,
> >      [NPCM7XX_CLK_PLLCON0]       =3D 0x00222101 | PLLCON_LOKI,
> >      [NPCM7XX_CLK_PLLCON1]       =3D 0x00202101 | PLLCON_LOKI,
> >
> > which switches the CPU core and UART to run from PLL2 instead of
> > CLKREF (25 MHz).
> >
> > With this change, the test passes without optimization:
> >
> >  (02/19) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_a=
rm_quanta_gsj_initrd:
> > PASS (39.62 s)
> >
> > It doesn't look like this change hurts booting from the bootrom (IIUC
> > the nuvoton bootblock overwrites CLKSEL anyway), but it's not super
> > clean.
> >
> > Perhaps I should make it conditional on kernel_filename being set? Or
> > would it be better to provide a write_board_setup hook for this?
>
> QEMU prefers to avoid ifdef'ry at all cost. However I find this
> approach acceptable (anyway up to the maintainer):
>
> +static void npcm7xx_clk_cold_reset_fixup(NPCM7xxCLKState *s)
> +{
> +#ifndef __OPTIMIZE__
> +    /*
> +     * When built without optimization, ...
> +     * so run CPU core and UART from PLL2 instead of CLKREF.
> +     */
> +    s->regs[NPCM7XX_CLK_CLKSEL] |=3D 0x103,
> +#endif
> +}

I think this is actually a problem regardless of optimization level.
Turning optimization off amplifies the problem, but the problem is
still there with optimization on.

This does not affect booting a full flash image, as these fixups (and
more) are done by the boot loader in that case.

Havard

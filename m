Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2731614lfo;
        Tue, 8 Mar 2022 15:08:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylO02m6OOXjFgFOZQowcaV8wX4yKJ63KW84XmhSOtEvuRqv1A1RFdWk/2hw9mkybzJVXzE
X-Received: by 2002:a25:ac8b:0:b0:628:b4da:4c2f with SMTP id x11-20020a25ac8b000000b00628b4da4c2fmr14650625ybi.177.1646780906534;
        Tue, 08 Mar 2022 15:08:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646780906; cv=none;
        d=google.com; s=arc-20160816;
        b=YL5CN3uSArn2q7D2XLiE7nZagKDiD8CByjK+MFmDnCHryIdBYYIuuU5Ka5vKLyOiWU
         4LQd6pd9jBHalHCcLkVBjdfiBvQKfP39zp8WJnSkjlsRFZYobaIPotUVWz7Ci7jrAqri
         AoUDOOSEF/lqGpgh8WH8A/wj+SzwNqwT65HRhMC7bDoDu6GC0Q4eBemOBBgkaoIsk7JF
         Dyz1s01Bwu/c3HTJQ9u0RdbosMqY+AVcXrbMskXMSD6I16WHdMMHuMQ+3goMyb0u+lx+
         NefiKwgN9PtzHU6R+op+EYIXHcEIMUtqMKt1jCwW7CfFGwE1X3RvPcTaDr7g7FQb5Ip9
         KpIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=x57LrVMiCqoasIMX7qOPQGjVS39cCnI7YTtBC7jqjMw=;
        b=kT2hZlG37+opf2ndx/savWXrt4hOc6Sx3510txExRv36kZRdqalq1aPWQmWG9cSIWw
         tVAWbpf1cxyKtinp7HIGs/vE+SWkdo/v3lSFjosrlB/MUm+BP2ekl6TrD8uLXZMq/7Rg
         9MwThARPFlt5MareTYOFSsTZOf+78pfBn8X9TmIffATRlr1mLh676P+jdW1t+z6sb0Fc
         vlaWDV8M8uKcOUvpHz5UHDU8tiKvR4/X7AWVQkSadj4ySWEOuBKtxRoAOlnq/4clf7d9
         CLE4j13gSD1BSpDspb2hNM3w0wfnNHyqRuW/QfA4p3xwqF/YcI8BwKSOL5PN9Q1BO+8F
         ZB1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=jTxy4wYd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6-20020a056902020600b005ff9cadbdb9si210789ybs.241.2022.03.08.15.08.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Mar 2022 15:08:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=jTxy4wYd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRiwL-0005oE-R3
	for alex.bennee@linaro.org; Tue, 08 Mar 2022 18:08:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nRivf-0005ml-8Q; Tue, 08 Mar 2022 18:07:43 -0500
Received: from [2607:f8b0:4864:20::f34] (port=46870
 helo=mail-qv1-xf34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nRivd-0000k0-3M; Tue, 08 Mar 2022 18:07:42 -0500
Received: by mail-qv1-xf34.google.com with SMTP id j5so655648qvs.13;
 Tue, 08 Mar 2022 15:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=x57LrVMiCqoasIMX7qOPQGjVS39cCnI7YTtBC7jqjMw=;
 b=jTxy4wYdncvKt5UmA4pG9PUdxqeQwsrlgQERnDZjHUXWbHnAZfTDkEhkULzXGXxfuB
 A7t+s8bGVFjWZlXpWXriQ2mvPMPbb7HhgqIwk0W3ykJCMKzWSBl4IQGKJuc+EydSLHFD
 IACVNwsCGno+3RrJi7PM7TOGjkX7RpWyabvG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=x57LrVMiCqoasIMX7qOPQGjVS39cCnI7YTtBC7jqjMw=;
 b=q2xaSQDnmB4EWX4Hl8dyH1Mun3bl/Hj/JVLHfcRNpE1WiAywyIFiIO3TPFaESsLpbL
 YQpf0clpH3Xf0SCbTYeaKGk/xgLAl5X0oZuBRlqe+cuG4HD+zkU2bsEOAZ8V1xUOJ+7U
 HGki3JD+Y9j4lQDWOpusqCRp03GgkaeBuj8EFTypHANmWw9Fij3DTodTU9ncct4ZznrQ
 JCP3lZkuy5eLBaa+S/m9Sjb9QzoP1b7SQmDTYkiFUd87xwQaWiJZkr/6sRNphBd0yBTX
 nxuzsFzU4uBxCylaf6TSkBS1ujNpzQm+XXOV+3eE9PqCswj2H925jja6ll+7dyE2dJML
 Qxug==
X-Gm-Message-State: AOAM5326O23c8R6rygCviDW/YkWnfpoVxTCPxuMF41OnpoQ6LoNKBWoE
 jDUr1y012ZIGbaaYiLZZwIpnoPV+WnUyARAsebI=
X-Received: by 2002:a05:6214:c67:b0:435:bbb2:5c40 with SMTP id
 t7-20020a0562140c6700b00435bbb25c40mr1558358qvj.21.1646780856340; Tue, 08 Mar
 2022 15:07:36 -0800 (PST)
MIME-Version: 1.0
References: <20220305000656.1944589-1-patrick@stwcx.xyz>
 <20220305000656.1944589-2-patrick@stwcx.xyz>
 <790dd79a-4c5e-207e-86a9-9351694f0427@kaod.org> <YiZySh+cdxL7ddKI@heinlein>
 <2b9aed65-5cdf-0647-dc25-7cc9d488aaa6@kaod.org> <YieRIkiREVhRUXxZ@heinlein>
In-Reply-To: <YieRIkiREVhRUXxZ@heinlein>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Mar 2022 23:07:23 +0000
Message-ID: <CACPK8XedOz2d4uL3Zti3vOzMSBK1+TVg4eQXsOONC9RXDRoRcA@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/arm/aspeed: add Bletchley machine type
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=joel.stan@gmail.com; helo=mail-qv1-xf34.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JrNF996j4l8U

On Tue, 8 Mar 2022 at 17:23, Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Tue, Mar 08, 2022 at 09:14:07AM +0100, C=C3=A9dric Le Goater wrote:
> >
> > >> There are two flash devices on the FMC. I can fix it inline since
> > >> it is the only change I would request.
> > >
> > > Yes, there are.  I think all of the Facebook systems have dual FMC, f=
or
> > > redundancy in hardware, but we can get by in QEMU with just a single =
one.
> >
> > yes, the kernel will complain though and I don't know how robust
> > the spi-nor based driver is. I think you sent a patch for a related
> > issue.
> >
> > The newer spi-mem driver should be fine.
>
> Oh yes.  I already forgot that I'm running with that patch since Joel add=
ed it
> to our backport 5.15 branch.  One of the reasons I wrote that patch was t=
o make
> QEMU not kpanic. :(
>
> >
> > > I'll see however you fix it up and see I can update all the other sys=
tems as
> > > well.
> >
> > ok. may be for 7.1 then.
> >
> > > We have an internal patch to expand the CS on FMC to 2 but we haven't
> > > upstreamed it yet and I'm worried it will break some users w.r.t. the=
 CLI
> > > changing for adding images.
> >
> > Yes. That's the problem. I am afraid some CI systems will break with
> > these change in a newer QEMU. The command line options will need to
> > adapt.
>
> My recollection is that the Romulus CI uses a branch of QEMU that at this=
 point
> is rather old anyhow.  We should be able to fix up the CI scripts at the =
same
> time we upgrade.

It looks like that branch missed the 7.2 boat. Given it's imminent
release, we should update the branch to Cedric's aspeed-7.0 when 7.0
is tagged.

With this branch could do CI on Rainier (or S6Q, or transformers) with
the eMMC image. I think there's value in doing CI on both eMMC and SPI
machines.

I'd like to see a boot test added for all of the machines in CI. Most
(all?) machines will get to bmc standby by booting on a generic Qemu
machine, such as the evb.

The machines that do have more of the system modelled could boot that
instead, and in the future add further tests.

>
> Are you or Andrew J maintaining that branch?
>
> > > My recollection is that the Romulus CI on OpenBMC relies on the PNOR
> > > being the 2nd argument.
> >
> > That's the initial assumption made years ago. First mtd device is FMC,
> > second is the PNOR. It is reaching its limits.
> >
> > I am looking at improving the command line argument to support:
> >
> >    -drive file=3D<file>,format=3Draw,id=3Ddrive0 -device mx66l1g45g,bus=
=3Dssi.0,drive=3Ddrive0
> >
> > which we would clearly define the topology. Adding a cs=3D[0-5] or and
> > addr=3D[0-5] is the next step.
>
> Seems fine to me.
>
> --
> Patrick Williams

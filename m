Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp420407lfq;
        Wed, 13 Jan 2021 05:12:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDvHZ22n874a52Pt15GKjQpfKZSTZS5eSFtpy9nzf5tT6SGzqcfyUKe1w9QAhOnF39I05u
X-Received: by 2002:a25:d457:: with SMTP id m84mr3509679ybf.63.1610543564639;
        Wed, 13 Jan 2021 05:12:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610543564; cv=none;
        d=google.com; s=arc-20160816;
        b=mBAEb09acw90mSWUq3CAHWuTOKbJ18qovkRR+hIRnhnAucvWOIKdh0e6l5eHNobfoe
         ezAEVW+l7Fod29ssHMJOL7HipORWHaRvyLqVK2MisWPN9uou5m117FVEdyRZMRs5ILYL
         jK9t7A7xhZeaWtDZiXhVNFgqeIkeM3rjR1q8MFUovc3+2Kqro4bqO+ktWXAXltDxK7bM
         j1gMZoZqGs0aXqpmeDY+2NN1qtcK/EvmMVHNBN6AbhF22DKm7T6Jm9H23xH6ea0JMbZD
         7iH3auo85IPYHve0rmaOBHvRRMx0HelPflc8tVHOwXedHDgvbRiY8amZjGYKfjv8zYiZ
         W4fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:organization:message-id:date
         :subject:to:from;
        bh=avpM3ir21Tj+JRQ4qIEmrnv+2paX4U5/PNyus7tqRm8=;
        b=wBZrfn4UDUIhFSbnR/v2NlrWruwVXxE90OnUu2Lhtt33oJrfrUOX4Gxp8GNW5AIVTS
         JvF/N2uYOtvIfBtybaQvg9GQj3wMCP2fpYNgSJlITH1ra/665c0GmAigLsNSMkIRQCzt
         VhpbUnb2n5ypfsuKv5Aw1ZmAYGnhS1MCnAJAb4+slVW2usVteflllkwvBaIrxvxiH6r7
         8L+4qkcpjDPWebaMkqPS0xCPxMGAq0EBpQse/EEVShP6GlhXrLLoB93WTjTJET8iRnYg
         yjbjJ6bzLkGIi5HsrssowJcvpJGYFrPz0apL+klWasqLkb1nsQ1n8Y01Vq1P895rNgrD
         cFHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y63si2175367yby.344.2021.01.13.05.12.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jan 2021 05:12:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzfx6-0001kO-0e
	for alex.bennee@linaro.org; Wed, 13 Jan 2021 08:12:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kzfwd-0001ja-4y; Wed, 13 Jan 2021 08:12:15 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:45692
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kzfwZ-0005TT-H6; Wed, 13 Jan 2021 08:12:14 -0500
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id B855C5FC25;
 Wed, 13 Jan 2021 14:12:05 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi.denis.courmont@huawei.com>
To: qemu-arm@nongnu.org
Subject: Re: [PATCH 17/19] target/arm: add ARMv8.4-SEL2 extension
Date: Wed, 13 Jan 2021 15:12:04 +0200
Message-ID: <4284476.LvFx2qVVIh@basile.remlab.net>
Organization: Huawei Technologies, Finland
In-Reply-To: <6ffaca60-2fa0-ac7d-b430-0bbaee18b25a@linaro.org>
References: <12681824.uLZWGnKmhe@basile.remlab.net>
 <20210112104511.36576-17-remi.denis.courmont@huawei.com>
 <6ffaca60-2fa0-ac7d-b430-0bbaee18b25a@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: caoiWSxk27Kq

Le tiistaina 12. tammikuuta 2021, 23.30.39 EET Richard Henderson a =C3=A9cr=
it :
> On 1/12/21 12:45 AM, remi.denis.courmont@huawei.com wrote:
> > From: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
> >=20
> > This adds handling for the SCR_EL3.EEL2 bit.
> >=20
> > Signed-off-by: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
>=20
> The patch title seems to have gone awry.
>=20
> > @@ -2832,9 +2832,19 @@ static bool msr_banked_access_decode
> >=20
> >          }
> >          if (s->current_el =3D=3D 1) {
> >         =20
> >              /* If we're in Secure EL1 (which implies that EL3 is AArch=
64)
> >=20
> > -             * then accesses to Mon registers trap to EL3
> > +             * then accesses to Mon registers trap to Secure EL2, if it
> > exists, +             * otherwise EL3.
> >=20
> >               */
> >=20
> > -            TCGv_i32 tcg_el =3D tcg_const_i32(3);
> > +            TCGv_i32 tcg_el;
> > +
> > +            if (dc_isar_feature(aa64_sel2, s)) {
> > +                /* Target EL is EL<3 minus SCR_EL3.EEL2> */
> > +                tcg_el =3D load_cpu_field(cp15.scr_el3);
> > +                tcg_gen_sextract_i32(tcg_el, tcg_el, ctz32(SCR_EEL2), =
1);
> > +                tcg_gen_addi_i32(tcg_el, tcg_el, 3);
> > +            } else {
> > +                tcg_el =3D tcg_const_i32(3);
> > +            }
>=20
> You can't test an aa64 feature without verifying that the cpu has aa64
> support (if the cpu is strictly aa32, the aa64 registers are
> undefined/uninitialized).  So:
>=20
>     if (arm_dc_feature(s, ARM_FEATURE_AARCH64) &&
>         dc_isar_feature(aa64_sel2, s)) {
>         ...
>=20

Hmm, yeah. Should this be an ifdef on TARGET_AARCH64 instead?

Also do we need to revector the exception code, or leave it mostly duplicat=
ed=20
as is?


> With those things changed,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>=20
>=20
> r~


=2D-=20
R=C3=A9mi Denis-Courmont



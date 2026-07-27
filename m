Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717A7C53219
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Jul 2026 09:41:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woHpE-0004Wo-6c; Mon, 27 Jul 2026 05:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woHp7-0004W3-ON
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 05:40:38 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woHp6-00041K-5c
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 05:40:37 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-81ea0b7d137so11222507b3.2
 for <qemu-arm@nongnu.org>; Mon, 27 Jul 2026 02:40:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785145234; cv=none;
 d=google.com; s=arc-20260327;
 b=D+jE5DfAyM3ruELdZxJT1g87QGQUg3AekLf9nAYljPzzzZK3TfCA60IClvmcmiVW6v
 8l6DdXShvUI+2Ak0xGbY5AtIAmXR/N/ZJbB6T261+yJiUI2Gr1c0q6nycF8b77D7acBu
 3oqyNgLwHgCGG8FuUi9radVHHRgSi/h7UT8ght2zd2uxdfSVClbcdXjIkRzgdUlLdxkO
 RlYfiJh9kHbcEhEoEclL2JnSPrlQM7dAB+v8mGD3TAzidhyXCQ9zI3Aq8cb8A1VGPY/b
 TXGKPNO1oL/yrTrriFGim30TyZaHB1kkFs8xOPsIR6SUVtw0cHTzcRlV7Gzd5TAYNXT4
 /Tkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=PBjTSeUZsflLVbw7xBkJvO6XZnbCoCdD8ANczblZNo8=;
 fh=Q5oOZIDCBFfhyxGxvqWt2I/iNa6GTqIfi+9XUz5PmJo=;
 b=WTFS36snwDMQ9MD3AvVAOnCtTsTrCYs18DMyXr2juyShN/YP1NDknm6G/fXLEPCtc9
 L/iYdidu19iwkW9WgbSTljaLoFslxB/1tucJr/5wAxsY2cX++6QtAMDGEcpkvDL+aFRw
 PpXPdtizjY2vm2kdp7OU/adzOAQKhAKnu9swNCWNXXVeaJA10UIGnpM4t4fJyRdwxpoc
 hcckii3BjyCbFbGj9Vye7IGgbpUi1T25TS34E+vjr1lvNoOcRv6sgYMqbCgx6qyyGHTP
 +OKCBLi7swcMe3jcjyZKwR8l1xiExYu1jHigpRoKYND0Yonu2A4NUKciCS477ojIcQ5n
 1TNg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785145234; x=1785750034; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=PBjTSeUZsflLVbw7xBkJvO6XZnbCoCdD8ANczblZNo8=;
 b=auhL/E6baoMO/Arp+3G8jUsM0b6Gp72n/RVQcvycajzAlZ3rDBvdbThaSEbga0GfRt
 5kHaXvfHOuaL2WkF5OdgzZMopSHb9g9n1JS4h9E4DsAnYLR/YKu6JWdqlUGe9uY+JTqb
 hW4lgqcFRcGxyfusa9/Nri1gEqaqcvKZtrxzx7vSkAXpH403NMomHxRNIF1NWIw6SwKD
 Rr42tIIkXVo3IOkDMjGQREbYqFnSbygaGWrain8/sDXAG7CXwKN9VniHee45agEiL8kV
 4Yrca/EItXJuQ7ak1aASsd7vuV++3wJ+2B2IWApHExPbFmLgKViYD05DyFpZNMq1mcdB
 UDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785145234; x=1785750034;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=PBjTSeUZsflLVbw7xBkJvO6XZnbCoCdD8ANczblZNo8=;
 b=CSjS8WjUMAcLfuU0UTXctmjM4D5baHqsFrETlBvqiT+u/Dp05mAwbv4RXNQtN1TXdK
 GRUVplht6F1JDS+XaTv1sEV0cK0EiOZWBY8ijS/6gNb6qWipPsuhQBYl5ln8+S15c+zu
 dOcrzCLvZMMyOyPxw1lBPa8gdnnwzxOqzXtOYPgz9d1bmmvMkQrZw6u+/leP6udvMzjB
 xv5ATDw5luDR6l+dCnvf17liyffBkWJL0h0xNwipnOW96S77H4waz6LJEeY8ca3Y2oQr
 NmHWdNOqLiGyrzmy6GfxPV0oHFiFxxsCIDajToRG20/H6TtSLaccPiUNkou8lY3M3Aw4
 3wxA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqh+u70AEIHjooGKsZl5ThB3xISCdCKdE+h+Al0aSXy+fplpj0QREFJmMBjUrNh/8pFamiDe1IxJA==@nongnu.org
X-Gm-Message-State: AOJu0Yz6qWok2yb0QR/0s6zwXFlJdhsag+Uh60Ps0h+tW5ih7AqT+nf2
 tS7O/W0HO0ji4fjjd4YmbNIV7h65v8ZkAtnRnH80KPPL5yCE25IPj7xtTHeYd7bjbX/0B7ZfeFJ
 OF/niStLK9ULtym7JxKjjZdSDO/kT+Nfo9ljWzDdYVg==
X-Gm-Gg: AR+sD10n6/6cbBy6AdE31KwuUDbUtd0i0iFYkwHc503t/pMAe0kZEZudkZ5mS4x5p3p
 3kYx7UjgLF7ZYyCjnhodlJfoapeff592n+4gR60qTffbojZmcz/lqggz2FxXMNwYGk/rImsVtuX
 6AM5ia9QaXgf2XVWo+BO+E6P6pt0ONSrpty+SJbH8W7uB6bCFY5uxtwSfuXDzA9WvtcLl/Sr1Zl
 8sfE/M0XTA2lMJ1IfbusBFHAcHU8NUvaucSCsRL74/vEYNHD0vCCV3dwPPsm4mXrVbAkBUzqKeR
 WkgkbU5tubRWRqrXarc1I2+kv9SWsgn8nRNDT7EJ+bnEHQ==
X-Received: by 2002:a05:690c:23c3:b0:81d:6eec:fe22 with SMTP id
 00721157ae682-81f69e3c454mr25026727b3.44.1785145233740; Mon, 27 Jul 2026
 02:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260627063208.33642-1-bin.meng@processmission.com>
 <CAEUhbmV_BfLT9_F9OPH8VvwCZ_8Th+swHu833E0sjYCkj-k_=w@mail.gmail.com>
 <CAFEAcA_or9830t85sHAq-PJegJ4OQ1ef=1wGpfcmiHFmVO0Jkw@mail.gmail.com>
In-Reply-To: <CAFEAcA_or9830t85sHAq-PJegJ4OQ1ef=1wGpfcmiHFmVO0Jkw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jul 2026 10:40:21 +0100
X-Gm-Features: AUfX_mzuI-g41sAHPNQBRaHlejpBAA267EXL6C-ySZodXaLZvwLAC9wcaeE1o7g
Message-ID: <CAFEAcA-JDuWrmNcEhwT+MwKqVmhW+BWW8+CMAz4muBA9W61jSQ@mail.gmail.com>
Subject: Re: [PATCH] docs/system/arm: Update Nuvoton OpenBMC image guidance
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Bin Meng <bin.meng@processmission.com>, qemu-devel@nongnu.org, 
 Hao Wu <wuhaotsh@google.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Tyrone Ting <kfting@nuvoton.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 13 Jul 2026 at 10:20, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Wed, 8 Jul 2026 at 16:50, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Sat, Jun 27, 2026 at 8:12=E2=80=AFPM Bin Meng <bin.meng@processmissi=
on.com> wrote:
> > >
> > > Describe the current OpenBMC target naming and release status for
> > > Nuvoton machines. The latest 2.18.0 release no longer includes GSJ,
> > > so point users at older 2.14.0 sources and explain how to find
> > > Jenkins MTD artifacts.
> > >
> > > Signed-off-by: Bin Meng <bin.meng@processmission.com>
> > >
> > > ---
> > >
> > >  docs/system/arm/nuvoton.rst | 54 +++++++++++++++++++++++++++++++++--=
--
> > >  1 file changed, 49 insertions(+), 5 deletions(-)
> > >
> >
> > Ping?
>
> The docs change looks OK to me as far as formatting goes, but
> could a Nuvoton maintainer review it, please?

In the absence of any response from the Nuvoton maintainers,
I'm going to take this into target-arm.next.

> PS: if quanta-gsj is no longer supported by OpenBMC should we
> consider deprecating (and eventually dropping) it in QEMU ?

I think this is still an interesting question to think about
for 11.2.

thanks
-- PMM


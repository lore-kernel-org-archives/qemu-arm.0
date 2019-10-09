Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1105712wrm;
        Wed, 9 Oct 2019 08:55:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzbmCAwlbKt16BmzdpXLCgFu6e9z9epqWY7EkBUYmySH+WCyKVO1yIhzEx2rA7nK/dzbdvz
X-Received: by 2002:a37:278e:: with SMTP id n136mr4269374qkn.151.1570636528188;
        Wed, 09 Oct 2019 08:55:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570636528; cv=none;
        d=google.com; s=arc-20160816;
        b=beXHpJ0Wq/etrX1X+4U2gtG6pja5rw3unEjw4RFKszJyfOryX1ubKGZtefKQlPVcnb
         6qfiK8cleqoELuSVwUvUZdcWJA/VDwVt9nEh8o9heU1wrQHpBtfw1ETe+vvIKvAWZxbP
         NsQgJ3MXjHqXKFaqCE6inflDETiNOOjgPnfPsHGTjdw+Y5i/J0HtThUVM90tbYhDuQrH
         M5g/2hxs9QzEyL9x+0RIH3UdGcwiKqfV1x/wr0D0JjafruCmd8pUx+EZguBdDXuBW3XA
         xLY2CdxTNNcDYxd22UmiLjhhvHzfwIAbD/mHWnttcO6Mri5xw/kZAZF+1kkyPeeYGqpZ
         ICgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lgL2mDDmYj1/4g4TCl9w9hB1SMlAcpvAzp24mjG0lxE=;
        b=YeU+T9U6PlUIoo82YR92isDxxBeRURZ5fkmIJzzGFHapUNVgivbvXUIVF0ALK79TA/
         hw44BWBrycTAShGkZG0aR8gLgfFhQHKpg2H4PIZsu78MrtmVQIbwjSc/x6PrRZcwpQzS
         Gfz28hoVbo8ECbCdExxpYl5qs1E+ePA1cJM0ITvS2ISCJdh1QAd0RlRSfYmgHqhdEHSD
         G+Pk8qlPKZqU4BlTaM2BopeBdWyjbxPEiFqzkX+RaJpHPYTodtxa5JcTL1J5WIkp8XAS
         eUkLIxeNV1xD3XfoPBPrvBhT2shgZ3mQ2cEXtlDOx5X8fwKKc46jtL0y2Z39lPSYaba2
         788w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JH0+Gws4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h1si2269982qvj.198.2019.10.09.08.55.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 08:55:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JH0+Gws4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIEJC-0002wg-Vi
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 11:55:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45638)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liq3ea@gmail.com>) id 1iI1sv-0001hy-K7
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 22:39:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liq3ea@gmail.com>) id 1iI1jO-0005Wl-UW
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 22:29:40 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:34259)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <liq3ea@gmail.com>)
 id 1iI1jM-0005TG-0y; Tue, 08 Oct 2019 22:29:36 -0400
Received: by mail-ot1-x342.google.com with SMTP id m19so411448otp.1;
 Tue, 08 Oct 2019 19:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lgL2mDDmYj1/4g4TCl9w9hB1SMlAcpvAzp24mjG0lxE=;
 b=JH0+Gws4mdUwwSM9zq7WkWzeV78/Yk9gvM8WYHas8SNvcSnCVT8RnOoMzVRygzMwv5
 hFzc/HXnHmQi76HRZMVqn7SuM916TYLZ4E+BTPrHyalUUWPlwDbudaHEZL6ZLbdSbEnn
 TsVlFnU4YCPbIwfNIQ+joJLSQ8uoPnaeaGuJMpiSv+ON2j1wqkUbdaAzM/PW8Ct73nwz
 e1ESZywQrIaWr1PZtKSL5d1AG+TwjfWgyIOJY3iNezVlH+aZjrB41MmKToT1qb0uryQO
 bqORRQPYTdqcgRLTLgcox7DivT85BgixWETJ6RuewvHOMSoOgBcxbvts3GQuDTIZwj8k
 GrXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lgL2mDDmYj1/4g4TCl9w9hB1SMlAcpvAzp24mjG0lxE=;
 b=agL1sXhQ7JhtoN221bT7d1MLntukvay5k9fgv2ypW2lwQHDVZPHCvVskdJCuZix9eH
 ID+cdU2YLqT5LO9sQxG2ut5YtuwvU6Z8cXnw3hJg8x6+j+NcvXt260hU2GHMhnoqknXB
 HeSO14FXGsfKkuH7GndOiZhy/Cluxf07PZr0J3yZVJd++0Q6aXRGqxDMx0QUHdKh+cg0
 8T/KV0OMDhoZlOElp0mAC9tHSYLDfJg+wTWNJkB8UBSITRVOOC/DnKTORogD29/Lciwa
 26lRnaC7WSrvTzPvLJkqsCGSkgUXiuu8BQLDPvTcNKY8WuSLpHj1qk0vHB5DDUmL5Dkm
 EpMA==
X-Gm-Message-State: APjAAAXCk7qcKxU+nQKUnzdu+3E4juONvAFRGgrfumFbIzO6pTxr9iJk
 ofHkDQU2JrzlHdck1pjpdwOQRVTvZhpT+GBvBIw=
X-Received: by 2002:a9d:6d11:: with SMTP id o17mr1008539otp.333.1570588174507; 
 Tue, 08 Oct 2019 19:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20191008142539.7793-1-philmd@redhat.com>
In-Reply-To: <20191008142539.7793-1-philmd@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Wed, 9 Oct 2019 10:28:58 +0800
Message-ID: <CAKXe6S+JX_O8pUS-vtJSML5c4qTqoX-PWWfTYQLJVq6DPO37Zg@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] hw: Convert various reset() handler to DeviceReset
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000003ae50e0594710e5b"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 Qemu Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CRqqSWKaV90M

--0000000000003ae50e0594710e5b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =E4=BA=8E2019=E5=B9=B410=E6=
=9C=888=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=8810:47=E5=86=99=E9=81=
=93=EF=BC=9A

> Since v1:
> - Removed the pci-host devices
>

Hello  I want to know why  remove this?

Thanks,
Li Qiang


> - Removed the vmcoreinfo conversion (elmarco) but add a comment.
> - Added Igor's R-b tag.
>
> Following the thread discussion between Peter/Markus/Damien about
> reset handlers:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg617103.html
> I started to remove qemu_register_reset() calls from few qdevified
> devices (the trivial ones).
>
> Regards,
>
> Phil.
>
> v1: https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg06367.html
>
> Philippe Mathieu-Daud=C3=A9 (8):
>   hw/acpi/piix4: Convert reset handler to DeviceReset
>   hw/isa/piix4: Convert reset handler to DeviceReset
>   hw/ide/piix: Convert reset handler to DeviceReset
>   hw/ide/sii3112: Convert reset handler to DeviceReset
>   hw/ide/via82c: Convert reset handler to DeviceReset
>   hw/isa/vt82c686: Convert reset handler to DeviceReset
>   hw/input/lm832x: Convert reset handler to DeviceReset
>   hw/misc/vmcoreinfo: Document its reset handler
>
>  hw/acpi/piix4.c      |  7 +++----
>  hw/ide/piix.c        |  8 +++-----
>  hw/ide/sii3112.c     |  7 +++----
>  hw/ide/via.c         | 10 ++++------
>  hw/input/lm832x.c    | 12 +++++-------
>  hw/isa/piix4.c       |  7 +++----
>  hw/isa/vt82c686.c    | 11 ++++-------
>  hw/misc/vmcoreinfo.c |  1 +
>  8 files changed, 26 insertions(+), 37 deletions(-)
>
> --
> 2.21.0
>
>
>

--0000000000003ae50e0594710e5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; =E4=BA=8E2019=E5=
=B9=B410=E6=9C=888=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=8810:47=E5=86=
=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Since v1:<br>
- Removed the pci-host devices<br></blockquote><div><br></div><div>Hello=C2=
=A0 I want to know why=C2=A0 remove this?</div><div><br></div><div>Thanks,<=
/div><div>Li Qiang</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
- Removed the vmcoreinfo conversion (elmarco) but add a comment.<br>
- Added Igor&#39;s R-b tag.<br>
<br>
Following the thread discussion between Peter/Markus/Damien about<br>
reset handlers:<br>
<a href=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg617103.htm=
l" rel=3D"noreferrer" target=3D"_blank">https://www.mail-archive.com/qemu-d=
evel@nongnu.org/msg617103.html</a><br>
I started to remove qemu_register_reset() calls from few qdevified<br>
devices (the trivial ones).<br>
<br>
Regards,<br>
<br>
Phil.<br>
<br>
v1: <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg063=
67.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive=
/html/qemu-devel/2019-09/msg06367.html</a><br>
<br>
Philippe Mathieu-Daud=C3=A9 (8):<br>
=C2=A0 hw/acpi/piix4: Convert reset handler to DeviceReset<br>
=C2=A0 hw/isa/piix4: Convert reset handler to DeviceReset<br>
=C2=A0 hw/ide/piix: Convert reset handler to DeviceReset<br>
=C2=A0 hw/ide/sii3112: Convert reset handler to DeviceReset<br>
=C2=A0 hw/ide/via82c: Convert reset handler to DeviceReset<br>
=C2=A0 hw/isa/vt82c686: Convert reset handler to DeviceReset<br>
=C2=A0 hw/input/lm832x: Convert reset handler to DeviceReset<br>
=C2=A0 hw/misc/vmcoreinfo: Document its reset handler<br>
<br>
=C2=A0hw/acpi/piix4.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 +++----<br>
=C2=A0hw/ide/piix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 +++-----<br>
=C2=A0hw/ide/sii3112.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +++----<br>
=C2=A0hw/ide/via.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 ++++------<br>
=C2=A0hw/input/lm832x.c=C2=A0 =C2=A0 | 12 +++++-------<br>
=C2=A0hw/isa/piix4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +++----<br>
=C2=A0hw/isa/vt82c686.c=C2=A0 =C2=A0 | 11 ++++-------<br>
=C2=A0hw/misc/vmcoreinfo.c |=C2=A0 1 +<br>
=C2=A08 files changed, 26 insertions(+), 37 deletions(-)<br>
<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote></div></div>

--0000000000003ae50e0594710e5b--

Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp4333128lfi;
        Fri, 6 Mar 2020 07:27:05 -0800 (PST)
X-Google-Smtp-Source: ADFU+vt5TBniy7pv4yi5meA2I7E1n/o4t9L+nti5MvuUMDnHIu+avz+3P0GXL+4+hD0My3qYIESG
X-Received: by 2002:ac8:754f:: with SMTP id b15mr3043248qtr.342.1583508424847;
        Fri, 06 Mar 2020 07:27:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583508424; cv=none;
        d=google.com; s=arc-20160816;
        b=az+4cyE0Coe/tbmdpjyuarqczg6jKTTC0vN4awwaafF3ZQKFogF/AVUaft83T8dgKq
         LxwdroRoA4CfIgMRNp5KhnFHaqPF9O8wl+WKjAoWdNxY9GTZGk933Tib9obJl8+AAXkc
         nTQs2BRfOwdhO0ia0M24+kpwlaWpodH8dw/NDIQLIXoFGa32lS3+VWcbY4rPsQOUGqGg
         sHZTx6nwNi1PJxpsJaXL2bLhMmAwxoiUoDM8s3U0CZdbPKOGFKvQNHyqdDyqqXV8QD/5
         gvyRUzitaEP4N5rwMffTcwqx00JV/n4uDMdRVwOcgDACcTq3G2n6C+e4xEkifbZ5G5ZF
         HMGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=SmKbef1K1bn3gPNovfSeYozznacE1/UtTcbvPnbnux4=;
        b=NOMXeVTor18Jyc+2PtwgjdiXfdKKb1C3Q8VSgn+HGZFxlaokxckUGftT2aCrX5suJA
         54LeVVwMSaaqDddGaJz2/bjmoKr1S/0lVJUvcJj53MvOwOsP6kwgXcKzfkCrzrJYEujQ
         wMEf3zWcv2zkiytmzYWHExec47VVKT+NIRw+bY9q0KgM+NfHK+NZdXdUcf4jGgKFqH+m
         O8uuE9VSX1j/zpriKgf5Gv2YD+M65OQeugsS3y9N3/Jc80EEtlBXvm5zknWBvuxnobOh
         Pb5H9pfwLfJSDXMW757SsUX5Coc59FQqToLylnUm6BdUjLOnXWh7xXmUOdUqUAPOorKo
         LzJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11si1281397qvy.137.2020.03.06.07.27.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Mar 2020 07:27:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38177 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jAEsS-0007kY-AJ
	for alex.bennee@linaro.org; Fri, 06 Mar 2020 10:27:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51111)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1jAEsJ-0007hB-2i
 for qemu-arm@nongnu.org; Fri, 06 Mar 2020 10:26:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1jAEsI-0005za-0o
 for qemu-arm@nongnu.org; Fri, 06 Mar 2020 10:26:55 -0500
Received: from 9.mo179.mail-out.ovh.net ([46.105.76.148]:57047)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1jAEsH-0005xm-Qu
 for qemu-arm@nongnu.org; Fri, 06 Mar 2020 10:26:53 -0500
Received: from player789.ha.ovh.net (unknown [10.108.42.145])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 6D1CD15E3B7
 for <qemu-arm@nongnu.org>; Fri,  6 Mar 2020 16:26:52 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player789.ha.ovh.net (Postfix) with ESMTPSA id 7EDB9102D211E;
 Fri,  6 Mar 2020 15:26:32 +0000 (UTC)
Subject: Re: [PATCH 3/6] hw/net/rtl8139: Simplify if/else statement
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200305175651.4563-1-philmd@redhat.com>
 <20200305175651.4563-4-philmd@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b53d8a77-544b-c7c4-b208-13dacc437913@kaod.org>
Date: Fri, 6 Mar 2020 16:26:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200305175651.4563-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 7763079858530520019
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudduvddgjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejkeelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.76.148
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
Cc: qemu-ppc@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OEui29jrOgu0

On 3/5/20 6:56 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Rewrite:
>=20
>       if (E) {
>           return A;
>       } else {
>           return B;
>       }
>       /* EOF */
>   }
>=20
> as:
>=20
>       if (E) {
>           return A;
>       }
>       return B;
>   }
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

> ---
>  hw/net/rtl8139.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
> index ae4739bc09..ef3211537f 100644
> --- a/hw/net/rtl8139.c
> +++ b/hw/net/rtl8139.c
> @@ -808,11 +808,11 @@ static int rtl8139_can_receive(NetClientState *nc=
)
>          /* ??? Flow control not implemented in c+ mode.
>             This is a hack to work around slirp deficiencies anyway.  *=
/
>          return 1;
> -    } else {
> -        avail =3D MOD2(s->RxBufferSize + s->RxBufPtr - s->RxBufAddr,
> -                     s->RxBufferSize);
> -        return (avail =3D=3D 0 || avail >=3D 1514 || (s->IntrMask & Rx=
Overflow));
>      }
> +
> +    avail =3D MOD2(s->RxBufferSize + s->RxBufPtr - s->RxBufAddr,
> +                 s->RxBufferSize);
> +    return avail =3D=3D 0 || avail >=3D 1514 || (s->IntrMask & RxOverf=
low);
>  }
> =20
>  static ssize_t rtl8139_do_receive(NetClientState *nc, const uint8_t *b=
uf, size_t size_, int do_interrupt)
>=20


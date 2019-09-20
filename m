Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1953781wrp;
        Thu, 19 Sep 2019 22:03:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzbzqq4qVVr12uFJyhwP7wrJfIpIteZUFhMkooaAw04tp4gh+WZ9Wt5Olm9rSCxystqVZQI
X-Received: by 2002:a17:906:80d9:: with SMTP id a25mr17598990ejx.222.1568955807622;
        Thu, 19 Sep 2019 22:03:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568955807; cv=none;
        d=google.com; s=arc-20160816;
        b=iGfub4x9fbR/hL9X8nW/ZCV+wo79tQEHHoLNRmIpHDHpyPITnDPH3P+pkMPKMv91Jn
         Yye5HGReCPdoDLfDweiZ8btMrmV/aHDez0yCt1QChlceBfBTc09vCoK7MKoRDYsSMygp
         Vz8vlWDqbCEMVuOMTWH1HNDO60+5/kWFS0W1WPhR5bT0SEoTa9pg6LmRHkeKrl0DTNyN
         FCfACbwJ2zYLKp6I++Yc9e7Gbx2kcWqZLx2zRVCuLWeGvEIdrws7uE2B5Ylbj7YHOQg1
         NEScMgijRcDW6jnDhSzvftCKYPkvrp3sbIwXbhh/tEnE5OpjbvLaWJx9xBasJxo6ofym
         ZeXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=svyUs4NrWaVOqTlyzKtZko0aPQsadZqzKrC58rkDqdI=;
        b=lkeFFRqRKDOKfvu6Qw5+178NIDaZzzEW45aDcLg5O8BOA0MH1xY5zFy1MJR9CxJCff
         wf/rvdPcO18QYkO8q0aNWFzqDfe/rrFR9l1Dr0KQn6QjI1FOQwru+TZQTSTUUy1R+pOe
         JaYDSZkGHOA/vTvdiznI3CTIypTHwJ1MesQXsRKRTcBzBslLF6hlpyHVSuq3BXMBT0Pl
         Kv0PHDOXropfhM+a+x8VXz2uaM53T648MvFi+gRZMvOKZAK3atEEuV49Y+rKY56Muu0Y
         6yViyhNoWHna8MlcTpyESy8WkdlpZaHTLc50XyjM2Qpq2Mq+iT+EGfYyVy+p32tKprRD
         R3lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=VxcXdKEp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id se14si430918ejb.322.2019.09.19.22.03.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 22:03:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=VxcXdKEp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iBB4o-0004gq-IU
	for alex.bennee@linaro.org; Fri, 20 Sep 2019 01:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36905)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iBAx7-0006sR-Po
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 00:55:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iBAjT-00053e-AH
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 00:41:24 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:44811)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iBAjT-00053Z-6y; Fri, 20 Sep 2019 00:41:23 -0400
Received: by mail-qt1-x842.google.com with SMTP id u40so7163922qth.11;
 Thu, 19 Sep 2019 21:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=svyUs4NrWaVOqTlyzKtZko0aPQsadZqzKrC58rkDqdI=;
 b=VxcXdKEp/JtI7hx/YGOcU0mbewkt0foJOA9rGUg2zfJFZUNSanRxExBGTC69c8uQ4X
 2wIDRjjxXP5tjQaTTmuuU4KvOqXdRhHhmDS74c5rGMtGucozMawFrUxlWFS/3C32fK0v
 9mcpv+T4GAH9atlOwZ+L2gSZasv7QJ2eSulZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=svyUs4NrWaVOqTlyzKtZko0aPQsadZqzKrC58rkDqdI=;
 b=m3xDlZkpH23ymZ9q0GW8qof4HpOBYZ3VgEvHIHNVa1mLiAht5ze//mxiF3rnMS5Wgh
 zmkxzxAEs7faeYmRWc/T+lQoPi8Ccz51MTRxUKYjGbQt1vDJjMHq0Y9Mjwb3KDvH59J7
 hEAxnVwsA3qycoxvUetfHSPlUsZ3n7O2julh2R0m4tvpGP4EvgDNGjcYxfSQYNeWhAFq
 UzUSl6l+RRMbGvlImw/n2F7Pj/oFgEzRdSQYUb/Iy75EifA1qPmYNCHjv7W2m3S1h7t3
 iK5MDhemIEP1dXNViH+19Vt1g8VH+P9SzzJA9a7N0b1f+XN5mfDWXvYqpNTCruUstdOQ
 2UEw==
X-Gm-Message-State: APjAAAWl7GNTfIIU9+WMTHA8QFXPAIQ61Myk+JWBTDB8NOS8h9/5ad7e
 4OPp15P4lNV2eYX7UFO/VkmW7CChcjhUNrZv4yk=
X-Received: by 2002:ac8:2d8b:: with SMTP id p11mr1240701qta.220.1568954482563; 
 Thu, 19 Sep 2019 21:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190919055002.6729-1-clg@kaod.org>
 <20190919055002.6729-2-clg@kaod.org>
In-Reply-To: <20190919055002.6729-2-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 20 Sep 2019 04:41:11 +0000
Message-ID: <CACPK8Xfyuz=nbkNj+UgzGYcz0OV0M0mXoQkkwSWfW-COj8K+4Q@mail.gmail.com>
Subject: Re: [PATCH 01/21] aspeed/wdt: Check correct register for clock source
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::842
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
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Amithash Prasad <amithash@fb.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r9B2yEu18bAB

On Thu, 19 Sep 2019 at 05:50, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> From: Amithash Prasad <amithash@fb.com>
>
> When WDT_RESTART is written, the data is not the contents
> of the WDT_CTRL register. Hence ensure we are looking at
> WDT_CTRL to check if bit WDT_CTRL_1MHZ_CLK is set or not.
>
> Signed-off-by: Amithash Prasad <amithash@fb.com>
> [clg: improved Suject prefix ]
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

A patch from the Open Source Firmware Conference! Thanks Amithash.

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/watchdog/wdt_aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index 9b932134172c..f710036535da 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -140,7 +140,7 @@ static void aspeed_wdt_write(void *opaque, hwaddr off=
set, uint64_t data,
>      case WDT_RESTART:
>          if ((data & 0xFFFF) =3D=3D WDT_RESTART_MAGIC) {
>              s->regs[WDT_STATUS] =3D s->regs[WDT_RELOAD_VALUE];
> -            aspeed_wdt_reload(s, !(data & WDT_CTRL_1MHZ_CLK));
> +            aspeed_wdt_reload(s, !(s->regs[WDT_CTRL] & WDT_CTRL_1MHZ_CLK=
));
>          }
>          break;
>      case WDT_CTRL:
> --
> 2.21.0
>

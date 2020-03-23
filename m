Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1626314lfi;
        Mon, 23 Mar 2020 09:02:49 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtpmLb5S3xLJt5ee/hTVV/vBdJiQTywng0n7knTPCXx2jsgroinXE46BFILJXiMBPJZTqxD
X-Received: by 2002:ad4:5808:: with SMTP id dd8mr14394485qvb.191.1584979369664;
        Mon, 23 Mar 2020 09:02:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584979369; cv=none;
        d=google.com; s=arc-20160816;
        b=jS2bLmK+wwOv+XUxXKdRJro4l9gfBUyUdsMX1KWY6GNsaohcgprNPXQT/o15YwTOrh
         Wu8b4Tt0updOTTAoH9iTdtWP4RezahHvqpyFpno9GzQIHkU+YJs4IHWyuFatoghJjstW
         vXDfwVffOviPSaUOciRi7IHt7deZoiPTpDZ49j6B4oIk6UKwvr0Z10CPZNhM79xKG+Fb
         Jkf9SeVUdH17Um1m5MxDlytBi7FJaRetfLe/690M8DkKl3e9Q/E/vV5AJzQUJ0fJ7Vnh
         guWJ1EGt77IRGgzd17z0GTvpYIzoV9cPdBiQJLWCBsep3aXBS0+R2Q3bQ36SsjcC/EHG
         4i0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=3+zyZBOZgnwvj6HjjkL9VZ1uuTPjSF+4X1NUFEoixK8=;
        b=JITKwG/uliYv4gNl8GdgbcFwz1swJ29GLe+JBW0cYthnQwnvxaFiAwi6RbPY3K84ep
         PKgYJpSu3gD/n0ngohI5SYuedmEjnApAXN2i5nYK+zTkFNmGE14DU6Kbd2dVKXXZwN8A
         JcoKH97nS0cM+Ao0cdqj0I4nrHZcAahLJ5Fak7uBG9mNtmplzYRiREzpSWwb6QbRt7LB
         fy26NlSRlDP/vFm79g5L1A3uCvogHj/SBMgPZvKFy12lk6SOK6QLQlXuJIGSSPCsdq/6
         ZDPVh7uDFx0y/ThqEc2i2sLvSdlsBrVIhJ3HUKbZeNLo68UZonWiI2dcU4Zz4Vvi6D0T
         Nohg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=P5qT6cS8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h58si5242560qtb.270.2020.03.23.09.02.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 09:02:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=P5qT6cS8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGPXM-0005rm-Qi
	for alex.bennee@linaro.org; Mon, 23 Mar 2020 12:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60425)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jGPVE-00041e-0k
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 12:00:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jGPV9-0005qc-6w
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 12:00:35 -0400
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943]:41410)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jGPV8-0005qW-Vy; Mon, 23 Mar 2020 12:00:31 -0400
Received: by mail-ua1-x943.google.com with SMTP id l7so5163559uap.8;
 Mon, 23 Mar 2020 09:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3+zyZBOZgnwvj6HjjkL9VZ1uuTPjSF+4X1NUFEoixK8=;
 b=P5qT6cS8WdtDBs/RaI8BcVZFtcAZvKg37b7J4V+WkUawV3bPJQwrFoUQrPgnDFy7bk
 /1sXtAbKdBx0CvBH4Nl1W3DJbzssBJHYK76OGovRSZRAWy5BXy+9DITHrmHkX4tynDpb
 HQXUfllfeTdbz61GlwN7GQuOgHZJaLHTftocgR7hJEnur+DuF29VaVomBuPTt/G/ya1f
 hjCDok7Ep8TSQ8SynaG5tX73xrxoeGn8xcrhdRF46Ed5PrSk8c1nOEiPLQu8V36PNbu6
 8cCz44AwQFk2XXZClq68BDVCpkQseLSrJB73m2nTy/1pzLw/fBB9LHDeP9/wpfA2joyw
 1Jdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3+zyZBOZgnwvj6HjjkL9VZ1uuTPjSF+4X1NUFEoixK8=;
 b=mub9rgF4In92f80lcvpib8AVZBZJ89dYk0b7mLVdpHfucvbEQW0m9Ux3b63+KH6too
 J5WBydEhItcbEmq2LuGfMuRwcMd9Y2JK93nZz7F+IsBfojdzmhB/Xo/XKv6SsirnP/7K
 7zB72OXpEK3fKLYk76Ah8/OqSjha3Oia+a081mxnDKXhfZYAYOBIYaB8bteWAnL999be
 9D/jeSFEoil5RLPRWS6yU7uGmhOL0neLVQ55eFQonAyCbqsHd18lNfb/dub7hB/2kg4b
 iEHVcyiARB8Sw1CeKMYApCCavCm9pLlC4/uQLktJMrfHDm7uNo9xl1GfumYJ7uVp4DD4
 Y9rw==
X-Gm-Message-State: ANhLgQ2eM/FDYiSVm4awUpVHOUgmEo2iCkSc1GUkzqqqPu4qq/cfpJ83
 7mPj1EKQFEkGJpdlvioUXdpMZPaL8PjqgrurAfI=
X-Received: by 2002:a9f:3311:: with SMTP id o17mr15011469uab.30.1584979230391; 
 Mon, 23 Mar 2020 09:00:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200321144110.5010-1-philmd@redhat.com>
 <20200321144110.5010-9-philmd@redhat.com>
In-Reply-To: <20200321144110.5010-9-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Mar 2020 08:52:30 -0700
Message-ID: <CAKmqyKMHq58PA3epAE8gjhHdyrOPz12JDPtPezVyPzeFK0xutA@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 v2 08/11] hw/timer/exynos4210_mct: Remove dead
 assignments
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::943
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xMcmHqN9FdPD

On Sat, Mar 21, 2020 at 7:50 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Fix warnings reported by Clang static code analyzer:
>
>   hw/timer/exynos4210_mct.c:1370:9: warning: Value stored to 'index' is n=
ever read
>         index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
>         ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   hw/timer/exynos4210_mct.c:1399:9: warning: Value stored to 'index' is n=
ever read
>         index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
>         ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   hw/timer/exynos4210_mct.c:1441:9: warning: Value stored to 'index' is n=
ever read
>         index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
>         ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/timer/exynos4210_mct.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
> index 944120aea5..c0a25e71ec 100644
> --- a/hw/timer/exynos4210_mct.c
> +++ b/hw/timer/exynos4210_mct.c
> @@ -1367,7 +1367,6 @@ static void exynos4210_mct_write(void *opaque, hwad=
dr offset,
>
>      case L0_TCNTB: case L1_TCNTB:
>          lt_i =3D GET_L_TIMER_IDX(offset);
> -        index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
>
>          /*
>           * TCNTB is updated to internal register only after CNT expired.
> @@ -1396,7 +1395,6 @@ static void exynos4210_mct_write(void *opaque, hwad=
dr offset,
>
>      case L0_ICNTB: case L1_ICNTB:
>          lt_i =3D GET_L_TIMER_IDX(offset);
> -        index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
>
>          s->l_timer[lt_i].reg.wstat |=3D L_WSTAT_ICNTB_WRITE;
>          s->l_timer[lt_i].reg.cnt[L_REG_CNT_ICNTB] =3D value &
> @@ -1438,7 +1436,6 @@ static void exynos4210_mct_write(void *opaque, hwad=
dr offset,
>
>      case L0_FRCNTB: case L1_FRCNTB:
>          lt_i =3D GET_L_TIMER_IDX(offset);
> -        index =3D GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
>
>          DPRINTF("local timer[%d] FRCNTB write %llx\n", lt_i, value);
>
> --
> 2.21.1
>
>

Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp207936wrq;
        Mon, 4 Jun 2018 15:42:32 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKHymcFJTF3DTCg4+PciXF3czPI8hrsW0XI+lXOl4q/XQM1rVyLt57VyU/Wa+9vZDWJM91a
X-Received: by 2002:a37:1f0c:: with SMTP id f12-v6mr20065017qkf.376.1528152151993;
        Mon, 04 Jun 2018 15:42:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528152151; cv=none;
        d=google.com; s=arc-20160816;
        b=guLZ45NCVysOsUXHh6dFcbWhO2tPaFknmeQZjf7ZUHlkdXnaPw6nmbOvxNF1ii32RJ
         3IrXaNpkTyK1tn0fqkzc1/HsgYXmnOUSqEbo26LxMFo9aF3KcwQ46/r2pW0Oq2at80ir
         pUxp9FNyVN1g5w4Pdav9INAd3GwXNgGb+X3EMgbEiRkvnQDHTU5mbIVCEjFW02aY/abT
         nLWeAka6OUtmG31C2yn0DyZqmCGoXUHM7y6C5IGEMZ4ouFUc5toTCfh3dhBv/BnSUSAN
         OCOv/C+CSLxXU3VwDfwQeBNUj3pFqbYqoVtGbq9LgRoX2i/CfEiEPXUT+Dtqs9G6L+dD
         CCdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=B8qe5JWNm8OF4FR54uyWzPDuhfuwAMbAyQrtS5WqfDg=;
        b=XIRtG60aRiiIt/GVsWYqLvaKuUW0qmE8bvPPQ9GpmYSKrEbuLJt5OG5/9Nb1zbo4AR
         Wtol7YmrctHaPMA5zF+9QcSQu7fFcUazOL2HDgPq42KS7iIl+WwC8mt7isEDxOUUILr9
         bnzp1BWcBhznd+oyNVwWvingvniiG0XKgKBNRzbkKGeUKiCTOYJYGGoZpH3tveTD438x
         JSAUxJGwfD43T0TcghCMXtf9N6K2Jy3HW/A8tNIv8pCyZSuFp99Pw6IrXkoE1q+qvNQA
         pChgtIUOPXou6HlxduS9ABz+ZhvR9eMwIJydJjZkuysvTxT7sgc/y5XclNObY7ILrfD+
         nfpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WctB88En;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b13-v6si1411754qvm.187.2018.06.04.15.42.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jun 2018 15:42:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WctB88En;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42233 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPyBL-0005iD-Fd
	for alex.bennee@linaro.org; Mon, 04 Jun 2018 18:42:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fPyB5-0005gc-Ra
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 18:42:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fPyB4-0005zM-NZ
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 18:42:15 -0400
Received: from mail-lf0-x233.google.com ([2a00:1450:4010:c07::233]:41215)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1fPyB4-0005y4-FP; Mon, 04 Jun 2018 18:42:14 -0400
Received: by mail-lf0-x233.google.com with SMTP id d24-v6so433645lfa.8;
	Mon, 04 Jun 2018 15:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=B8qe5JWNm8OF4FR54uyWzPDuhfuwAMbAyQrtS5WqfDg=;
	b=WctB88EnLfqlpzf2syFSZbT774Ft1JxeIpKdyktMrwYt1SL20j7NXCoHYYgXOSmIa0
	1JscwEc5fN9TwR5grkMvQbzSy83j3sKvTCAqq6G9QuVH1dnENrOVood8kV4xRr2xg3Hh
	T4EYzOd2VKZBhvCsSpRbfRkoQVLD5fhyTAmcZ1xgOgp+6OsK8K405Zxy6Afw5VWTD6Mq
	J6ZerPjAkLZ19uC0YKwdU2KCDqNj8Mr+cvfpsnpLSgUJvgrPhgC6biPlLi8XTeNrNhPZ
	uDwRO8BJfYA69xh6ld/aqNbgNBTowUO8m0ubn9IAtuyv7GOv60joOjc5/GH3GOkC6Hrx
	vgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=B8qe5JWNm8OF4FR54uyWzPDuhfuwAMbAyQrtS5WqfDg=;
	b=iRpFckOXEMgJMejhL71xL0szr7L5okGwaHu2b75pVwChwgBKf0DdLCWgj6kbs5cRy7
	SB24zMhclEVjAst3pzgmp1G0UP1Cxtc2agDsLmgzwLnnA+guGSEwgMMJ0MuJ/RcY/0S/
	Mj7BhK+YOVJzFeE38ScVznBzStJ0mHyeqHWQNxTfMNbUL3bREiFpW4qq5juCC0t+BeVC
	1cmp6PWFhQcUGZSW6R2JUGQAxkiy32nuPGlpg2wj1MGI+oxIUIX0XIp0M08e8/Z1CQM4
	JKEde4OsFfl7gjc3MYPOoy59hMCa2ACKnbOCLfAQjA/Uqg7kl2eqenu7nslB3cmax0u6
	+gCg==
X-Gm-Message-State: APt69E1eYTB/DNC4QdrV1p7w6b5vKZ/23dlvqL/7Wg25fFueM4myjDR0
	WWCFhJmJ/8fOUnAxnWKUC1KVeLuHu6pkO79ZeSk=
X-Received: by 2002:a19:dd0b:: with SMTP id u11-v6mr65439lfg.100.1528152132840;
	Mon, 04 Jun 2018 15:42:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:98c6:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 15:41:42 -0700 (PDT)
In-Reply-To: <20180603000827.30872-8-f4bug@amsat.org>
References: <20180603000827.30872-1-f4bug@amsat.org>
	<20180603000827.30872-8-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 4 Jun 2018 15:41:42 -0700
Message-ID: <CAKmqyKNL001nOWYGXGQTtQm4SeEUYL4r6RAOhR6aB-wr=tNJLA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::233
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 7/8] sdcard: Reflect when the
 Spec v3 is supported in the Config Register (SCR)
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TID5wTW6vOnd

On Sat, Jun 2, 2018 at 5:08 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/sd/sd.h | 1 +
>  hw/sd/sd.c         | 7 +++++--
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
> index 7c6ad3c8f1..b865aafc33 100644
> --- a/include/hw/sd/sd.h
> +++ b/include/hw/sd/sd.h
> @@ -57,6 +57,7 @@
>  enum SDPhySpecificationVersion {
>      SD_PHY_SPECv1_10_VERS     =3D 1,
>      SD_PHY_SPECv2_00_VERS     =3D 2,
> +    SD_PHY_SPECv3_01_VERS     =3D 3,
>  };
>
>  typedef enum {
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index da65f2b178..83426da133 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -315,11 +315,14 @@ static void sd_set_scr(SDState *sd)
>      if (sd->spec_version =3D=3D SD_PHY_SPECv1_10_VERS) {
>          sd->scr[0] |=3D 1;        /* Spec Version 1.10 */
>      } else {
> -        sd->scr[0] |=3D 2;        /* Spec Version 2.00 */
> +        sd->scr[0] |=3D 2;        /* Spec Version 2.00 or Version 3.0X *=
/
>      }
>      sd->scr[1] =3D (2 << 4)       /* SDSC Card (Security Version 1.01) *=
/
>                   | 0b0101;      /* 1-bit or 4-bit width bus modes */
>      sd->scr[2] =3D 0x00;          /* Extended Security is not supported.=
 */
> +    if (sd->spec_version >=3D SD_PHY_SPECv3_01_VERS) {
> +        sd->scr[2] |=3D 1 << 7;   /* Spec Version 3.0X */
> +    }
>      sd->scr[3] =3D 0x00;
>      /* reserved for manufacturer usage */
>      sd->scr[4] =3D 0x00;
> @@ -2067,7 +2070,7 @@ static void sd_realize(DeviceState *dev, Error **er=
rp)
>
>      switch (sd->spec_version) {
>      case SD_PHY_SPECv1_10_VERS
> -     ... SD_PHY_SPECv2_00_VERS:
> +     ... SD_PHY_SPECv3_01_VERS:
>          break;
>      default:
>          error_setg(errp, "Invalid SD card Spec version: %u", sd->spec_ve=
rsion);
> --
> 2.17.1
>
>

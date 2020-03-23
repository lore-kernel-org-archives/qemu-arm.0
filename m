Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1619366lfi;
        Mon, 23 Mar 2020 08:57:14 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtvqUkomJWKyUWTzOoD70+aWj/BjXOOXV8wq2x7RHMpDpZ1SSEWt2DPtC8Y8uA9UO86au7r
X-Received: by 2002:a05:6214:138a:: with SMTP id g10mr21508199qvz.231.1584979034254;
        Mon, 23 Mar 2020 08:57:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584979034; cv=none;
        d=google.com; s=arc-20160816;
        b=SygiLK2WJ2fXh3BXYdKVK4zJtEYWwK6On8wGYrx2CuVe2AUu6hF3zuxx5eoE4FS9dc
         hbyHSuKDZXd6JzTb+w+c1Aa0s0paIb+bar9DOVcPjYj9JRwJn+udbkA66X7LRWaMpIU/
         nL5UCUFPfZmqAJTprRGOXadgIo2CNqh9o9CFA62IR0IHjhn2sMZkSTFC8wK4ulue4Bvv
         yIgUb/EYSGxJWCr5JHAgbdwLiqqqBpToEas7rw7hnHKALjjZrdCcmAL6mH86gFjhAbcS
         JEWtrafeVeaLcge3GAXUl3Fdr5rMTfns+GGq08BctKUt/k77Hntvvl4zM6Cp6ZJh+Nzs
         E0OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=9sdYk+m9VIBNOHQO5FBubdeWBpMknt0oInCQuRCvabk=;
        b=NrmpV9GJUbWv70BPnLN06ktIi00i/kgIOXbkQ7RUb4zrCT5zh9X5IbZOgumSFoPA+J
         WXF/oVIWoHrTB6WYYryVFNomYtQGMzH/9bdQx186q5phwZEeJr7dWdlw12DMmwqWLRU1
         jZUDSZ2YNbCqusdeXeihicYxdgSCirFg/g10Nt5fl0T01xNR61HSWqLT7o3tC9p/Rcax
         NsgduAgMpfoaIntjcT2MX5S75N+x0LIFC1DTRyx1BZ/Tm+Iya1dwTCdC1hsOXxfkMlkC
         zOycMd0ixPXZ+RbMZjqsG/ez2NZbMSyK5dbscKJGRnz4OxpMDADAV7sFOCl7Cz9tZ0GV
         vS1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HcvVC9rS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6si8641967qth.281.2020.03.23.08.57.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 08:57:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HcvVC9rS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGPRx-0007cN-Lf
	for alex.bennee@linaro.org; Mon, 23 Mar 2020 11:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59394)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jGPRf-0007Ij-N8
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 11:56:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jGPRe-0003j6-BP
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 11:56:55 -0400
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941]:36388)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jGPRY-0003gE-7A; Mon, 23 Mar 2020 11:56:48 -0400
Received: by mail-ua1-x941.google.com with SMTP id o15so3297539ual.3;
 Mon, 23 Mar 2020 08:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9sdYk+m9VIBNOHQO5FBubdeWBpMknt0oInCQuRCvabk=;
 b=HcvVC9rSVzeRmghwV0dJsoagZ9/o/EtcUICpPdEIItvD2CqprcMlHNhVhCnPJJc5Tx
 3KOABXPct/V6qgxgaWbeDQzF3wmc+p90p0SfGgCKsHr1WzlXcq23piVpb+ec2qkDNljR
 kW+b5UlTu44XqnxCgwSQhU116gSDExzlDkwzciQK4y8hN41rAr9ETxr4dY8DDWUSFFD+
 Q8zR8vUkJLDb8SIT+EboUmo+QwO1Fqfaq+LpSv8gCPnsPnDOdBuffmdhM3aYVB354Koq
 iQ5zOQrKZPQY0ioj6PmUQIl7ahzn7ohtnG+6QijI8n/hcVbEZtmjbHNTa8wLxFsw2yf+
 hw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9sdYk+m9VIBNOHQO5FBubdeWBpMknt0oInCQuRCvabk=;
 b=uGGR7pdo/lPhesTzHc7maVYJiL4IEOd0WI4iGjtz+b0xXvxLE/tH7HOO+9rByErCin
 bUy32z3O3T3J8N67Bq29HV9IuCV/Gv0uPrEfCCWs1htCiqf1A25CRHEp+8vvfoUNLQ+P
 O+zAAIjDMRH5G/TzNPxmAVxRoudac65zuf8zjSlNQyNY453/a8MnC3ZeJIX8mHitlGEU
 tEM56F/RtBmS50MkWc/r7hzAURSMFu1ZV6djhDIXNBGqByo2y6vjBB0+mmw0pHy7yxK1
 x2SVHNBwunQ2tV3TfjeM7AYG5EefGkzwZIViysPWz0CfLZDOWsGso68PERjYHV/MUNTR
 puhw==
X-Gm-Message-State: ANhLgQ1e+CPpsiJOHeLqDB4lsdO4No9Z5vHwn2T26mbhJJoElu5lkTpi
 GzYfCT3JPqqt9mLzHMmrN7fYybPZq5wjJ5hQtfI=
X-Received: by 2002:a9f:2964:: with SMTP id t91mr7715691uat.21.1584979005734; 
 Mon, 23 Mar 2020 08:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200321144110.5010-1-philmd@redhat.com>
 <20200321144110.5010-2-philmd@redhat.com>
In-Reply-To: <20200321144110.5010-2-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Mar 2020 08:48:47 -0700
Message-ID: <CAKmqyKNRs-ARh9vcV_TywnM1dBfQtMfUXV94sHTjY2BSE7=4hQ@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 v2 01/11] block: Avoid dead assignment
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::941
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LgGbr3kR+q7h

On Sat, Mar 21, 2020 at 7:42 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Fix warning reported by Clang static code analyzer:
>
>   block.c:3167:5: warning: Value stored to 'ret' is never read
>       ret =3D bdrv_fill_options(&options, filename, &flags, &local_err);
>       ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Fixes: 462f5bcf6
> Reported-by: Clang Static Analyzer
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v2: Keep 'ret' assigned and check it (Markus)
> ---
>  block.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/block.c b/block.c
> index a2542c977b..a6f069d8bd 100644
> --- a/block.c
> +++ b/block.c
> @@ -3165,7 +3165,7 @@ static BlockDriverState *bdrv_open_inherit(const ch=
ar *filename,
>      }
>
>      ret =3D bdrv_fill_options(&options, filename, &flags, &local_err);
> -    if (local_err) {
> +    if (ret < 0) {
>          goto fail;
>      }
>
> --
> 2.21.1
>
>

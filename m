Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1866084lfm;
        Thu, 23 Apr 2020 06:08:21 -0700 (PDT)
X-Google-Smtp-Source: APiQypKiFUPJrnv5xgEL20WL7IUamCFaVLp0KxcUctca4TXJVnsUCnRTDhqF0P7EQW7GSp2Fqfmt
X-Received: by 2002:ac8:1b97:: with SMTP id z23mr3826553qtj.294.1587647301341;
        Thu, 23 Apr 2020 06:08:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587647301; cv=none;
        d=google.com; s=arc-20160816;
        b=NEEPnfwUixOt/jaVv6pPD/sJbQ0lriZZAfd9gkA3hcA9UFZfC58E9tyk80Sf7/PzeP
         W2INnc4RU5Pq+IdixgyQISJicIkzrriDW7Nn6LNcjhsskEhFxbDIl40nwz9fBxaQ9mDL
         f1pK1vclEup4TaUoKxB/qjx8ldcXFIKNaI0qjJ81HNYPESzeLu+qMy7xsnHyfs4lCByd
         Cf2ZmiFslCSoLe7R5zWvUu+uk6K9VKUZM/rQkPLJ0BceV0pQbSD84apOOkrVyZSd64UJ
         waCU7XHDexXXpV4I1ysF/KVrLY0zxokWEnS9aHl8c+UZDk74D22RB2ezvqIf+rfIXqu5
         3w+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=izWOxLMJjKKCnsghAObjTqVGDsbWvFY0EQ2g9sbVDxk=;
        b=KRq36IP9M0Q2pju2UDa49kXskd6ibcEDMZZXBx8GBHSZM2aBwcuWXlTkIC6AVk+hb6
         l7nuPHSykNBCTeDw+1zrgMCZZcCv3YDG6yvnZh+Y0eRCabku7SVrIoZFThUC0prIYWSH
         P2kEf+iXqMGLd7U7r5JKmagjN0aSjBJa0yiiYjzt/32oYm0/cHKzaVfv+k51/0KrJWc5
         4RlqB3uMv0McjFDRDYMvY9vRwW7iTmJa2Ez1Rje0/iIm3B+uhQJdzjg5LYcbB+idBXZY
         5BV7zjqWiDqIvYkOvzT7P9vOsU3WTAx81tCkM6QjE6EixwVKNcPojx3RuhQ8E1E65okI
         XD/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ie5BKlxX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 63si1363489qki.15.2020.04.23.06.08.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 06:08:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ie5BKlxX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRbaW-0004wA-Pj
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 09:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40092)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent.desnogues@gmail.com>) id 1jRbaO-0004uR-Km
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 09:08:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <laurent.desnogues@gmail.com>) id 1jRbaO-0002sH-8z
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 09:08:12 -0400
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:42173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent.desnogues@gmail.com>)
 id 1jRbaJ-0002ZT-9U; Thu, 23 Apr 2020 09:08:07 -0400
Received: by mail-il1-x144.google.com with SMTP id t12so5423640ile.9;
 Thu, 23 Apr 2020 06:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=izWOxLMJjKKCnsghAObjTqVGDsbWvFY0EQ2g9sbVDxk=;
 b=Ie5BKlxXQRs99oIr9v3g7SL6OBw+Q958VLMxta5lVxEfLG+paNjp6tQzOUHWKGgsxP
 0VPUFvuJkVjmUqx5EkGUunFJ+dxYvHSWbtjWiWaCm0Gfe0y1pdPcVVfEGP1tqd6PnC2K
 WjhlrALAtE0/5s3EUajW6LsQRXT1zr1xFOkVy6Ay5LkCfRBR3KbjqWQ6DeCbJNyBWXfZ
 vXYe94Xqx4walh09lFeXAC6gkHubfMa4G0WSlJFVjHKR+IgXI7vCssUJO2TdAvNrEE9/
 QebOivfzVOdKO9y7AAlVJ1b0VbeTFPYObjIvbe2j68dYTYqKlTDpOxBGKOu5CicSECNA
 3p7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=izWOxLMJjKKCnsghAObjTqVGDsbWvFY0EQ2g9sbVDxk=;
 b=BoWPh0TncelMzTfhAEsqh7uH7aMwavqYdpe6U8+O8lyiGTS2wWksEt/daPu8oZPJ22
 rtns9cKNouDjEWCB+runv7k04QSkUFq5AbS414oPcZOnJjhBeF6dj4YhyTdVxgf8qSVS
 pPB7B3O2TGfG2mTymDyRxXyIiBaLpz1KFs80mpd9L/D0BDR7TyYpQcLupE3LhFJHVM9t
 oKrqtsxjKp0lT/u8tkwQnxvFtaHJlWRCXsLK83pCidjfKoH8K3M0tUwW0276NejDyqXk
 V8Njn0P6dxLoOp/aYOnG8yrL9hMJ1Ou5Gn8AtR4APDcA+hYDwqWBsNBK1yYQJN5P3goz
 HTUA==
X-Gm-Message-State: AGi0PuaMfOARYow0Ad5/5QwD+tgohtcGTzyjapVvO14ACWZ9MN6ZDrB8
 3DlBnNMUnHnGHTdAtwxnAw/a52VkTyzNMczWbKo=
X-Received: by 2002:a92:690e:: with SMTP id e14mr3336683ilc.22.1587647285396; 
 Thu, 23 Apr 2020 06:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200423124305.14718-1-f4bug@amsat.org>
In-Reply-To: <20200423124305.14718-1-f4bug@amsat.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Thu, 23 Apr 2020 15:08:06 +0200
Message-ID: <CABoDooOz7MZ6DWajfQU1s3mK8Cf_U06pjHcoPW9Tat5+gKGdGw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Use correct variable for setting 'max' cpu's
 MIDR_EL1
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::144;
 envelope-from=laurent.desnogues@gmail.com; helo=mail-il1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::144
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MmmM/+xnk+iN

On Thu, Apr 23, 2020 at 2:44 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> MIDR_EL1 is a 32-bit register.

In fact MIDR_EL1 a 64-bit system register with the top 32-bit being RES0.

So the right fix might be to change midr field size, just to be future proo=
f :-)

But if we stick to a 32-bit midr then:

Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>

Thanks,

Laurent

> This fixes when compiling with -Werror=3Dconversion:
>
>   target/arm/cpu64.c: In function =E2=80=98aarch64_max_initfn=E2=80=99:
>   target/arm/cpu64.c:628:21: error: conversion from =E2=80=98uint64_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} to =E2=80=98uint32_t=E2=80=
=99 {aka =E2=80=98unsigned int=E2=80=99} may change value [-Werror=3Dconver=
sion]
>     628 |         cpu->midr =3D t;
>         |                     ^
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/arm/cpu64.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 95d0c8c101..4eb0a9030e 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -620,12 +620,12 @@ static void aarch64_max_initfn(Object *obj)
>           * code needs to distinguish this QEMU CPU from other software
>           * implementations, though this shouldn't be needed.
>           */
> -        t =3D FIELD_DP64(0, MIDR_EL1, IMPLEMENTER, 0);
> -        t =3D FIELD_DP64(t, MIDR_EL1, ARCHITECTURE, 0xf);
> -        t =3D FIELD_DP64(t, MIDR_EL1, PARTNUM, 'Q');
> -        t =3D FIELD_DP64(t, MIDR_EL1, VARIANT, 0);
> -        t =3D FIELD_DP64(t, MIDR_EL1, REVISION, 0);
> -        cpu->midr =3D t;
> +        u =3D FIELD_DP32(0, MIDR_EL1, IMPLEMENTER, 0);
> +        u =3D FIELD_DP32(u, MIDR_EL1, ARCHITECTURE, 0xf);
> +        u =3D FIELD_DP32(u, MIDR_EL1, PARTNUM, 'Q');
> +        u =3D FIELD_DP32(u, MIDR_EL1, VARIANT, 0);
> +        u =3D FIELD_DP32(u, MIDR_EL1, REVISION, 0);
> +        cpu->midr =3D u;
>
>          t =3D cpu->isar.id_aa64isar0;
>          t =3D FIELD_DP64(t, ID_AA64ISAR0, AES, 2); /* AES + PMULL */
> --
> 2.21.1
>
>

Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1834388lfm;
        Thu, 23 Apr 2020 05:35:28 -0700 (PDT)
X-Google-Smtp-Source: APiQypIMU//J6uf6H+Imng2e8ZRyIwEXMpTAlbWkpjIqjyI9aBj6lJxNbJwFfHYocbwCOk/Y9K0y
X-Received: by 2002:ac8:12c2:: with SMTP id b2mr3716032qtj.7.1587645327873;
        Thu, 23 Apr 2020 05:35:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587645327; cv=none;
        d=google.com; s=arc-20160816;
        b=CaJoQvcKHCFA/lPpq2Qli2d1Si+fySw7qGofV16VSC8YdePUqfUSiB88X8yPfZ9oCx
         6GUJX74EDwLhh5Ws+WY+e+jiVjNzzluMDhkFhCD5hto1l/Po40senzICoVLn90DpP2c8
         4cj990MTtF0PZ8XvpVWVPWSK8O5whGHDIpLAaqR7ujO8heNePT3LJS/Euui5sPnVhqMZ
         nrt/Geg8DctUXMDqJvszHn2ccVuvKrTAwyyCZku1aa5O7rUhyYOQuiJPF5WfawYmc2du
         sVpcUSjOFvzLUW2Z8m/fWvxLp5bX+XBuyCswMh3kxemcuA+kL/XhRay/B1RWPIw2r/SX
         iXEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version;
        bh=nEDf5mxj4Ya/1xWAyK0uMzyWdgw+j9J1oE1Euva5YQE=;
        b=PLwZiM5KoVH/7N7hLKgFcX8izW/wJ0HhauEhrI8pSIoeH1ENcHy6vGYHhkQYUigUbg
         K5Je4zi1g6OrRdQBr4sS4aHIuIezT0LNuzAXuhDlrjWhTt1lPFaVnPhRcK3gTONIHPus
         GMXxgK8eNMbt1yHHz/Bu5Nq/ZxPF4dc7a8oVlA+PjHTYm1H135LQQEXLdmN2qlmtkksh
         VDFqS4NaP4hFYmlX6pRrbmX47jfx7JRs4MngePeIhIoQRV/IdkexwQ0zSwQMIeyNRoep
         qcYlVnBDf31VYftXcQcIRRfTJydlCupXXH+Hqc4dg3cN0snzs5zWbOr4kzS+SJ5CRXaW
         aHEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n197si1297689qke.152.2020.04.23.05.35.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 05:35:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:42434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRb4h-0007ZX-BF
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 08:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56834)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jRb3N-0006MK-Md
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 08:34:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jRb3K-00048H-75
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 08:34:04 -0400
Received: from mail-yb1-f196.google.com ([209.85.219.196]:41830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jRb3I-000413-0Q; Thu, 23 Apr 2020 08:34:01 -0400
Received: by mail-yb1-f196.google.com with SMTP id a9so3038840ybc.8;
 Thu, 23 Apr 2020 05:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nEDf5mxj4Ya/1xWAyK0uMzyWdgw+j9J1oE1Euva5YQE=;
 b=EIfWtAtCQB/JXi7ds3T9d5DyCCEnnoXlYyzLWi17ZSJ4Hamf7EiIGiZ5YZg+O2f4CS
 cckcmxF41mleQmvb8ihnZxhZWkNJCLJRZrx3fp/kKhHdoCSN51rQo+jeYaEmc8A5IBc0
 +uwefPI0n6FtkOCtqsQPMo1IwqOjXZZJQxetVs660F9ecB3OV8ooJYbmLk4YfDsDhml6
 5vTQ6+/izYM4NOCBLKitEisfNaldaU2rcfavkJ4WlZz2R2tZ5MQwY/U4vie7mTM3dn8p
 2uPcC6zS8HgLojA9uLSjYRA6QAnlal+1/W78b211PqPdzIHI76vqgZInZBcZTwQCYAoL
 SO7Q==
X-Gm-Message-State: AGi0PuY0fx0/RDTbcZe8wtS/rDqhIKwBV37cIcQNWExzJDhAWDiNM+0J
 N4SFXm6u7i8PlrR2VNZhyK75Ldq11+f7dFjD1dcnz6dr6W4=
X-Received: by 2002:a25:6a09:: with SMTP id f9mr4502446ybc.316.1587645238123; 
 Thu, 23 Apr 2020 05:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200423110915.10527-1-peter.maydell@linaro.org>
In-Reply-To: <20200423110915.10527-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 23 Apr 2020 14:33:46 +0200
Message-ID: <CAAdtpL4nHgtrVNvAEOOba75vj6JcsfMPyicUmMSH9SOs3ovAZQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Use correct variable for setting 'max' cpu's
 ID_AA64DFR0
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.196;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-yb1-f196.google.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 08:33:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 209.85.219.196
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hiJSYLXJ+6sj

On Thu, Apr 23, 2020 at 1:09 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> In aarch64_max_initfn() we update both 32-bit and 64-bit ID
> registers.  The intended pattern is that for 64-bit ID registers we
> use FIELD_DP64 and the uint64_t 't' register, while 32-bit ID
> registers use FIELD_DP32 and the uint32_t 'u' register.

Variable names could be improved...

>  For
> ID_AA64DFR0 we accidentally used 'u', meaning that the top 32 bits of
> this 64-bit ID register would end up always zero.

-Wconversion CPPFLAG helps but there are so many places to fix that we
are not using it:

target/arm/cpu64.c:711:13: error: conversion from =E2=80=98uint64_t=E2=80=
=99 {aka
=E2=80=98long unsigned int=E2=80=99} to =E2=80=98uint32_t=E2=80=99 {aka =E2=
=80=98unsigned int=E2=80=99} may change
value [-Werror=3Dconversion]
  711 |         u =3D cpu->isar.id_aa64dfr0;
      |             ^~~
target/arm/cpu64.c:712:13: note: in expansion of macro =E2=80=98FIELD_DP64=
=E2=80=99
  712 |         u =3D FIELD_DP64(u, ID_AA64DFR0, PMUVER, 5); /* v8.4-PMU */
      |             ^~~~~~~~~~

>  Luckily at the
> moment that's what they should be anyway, so this bug has no visible
> effects.
>
> Use the right-sized variable.
>
> Fixes: 3bec78447a958d481991
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> ---
>  target/arm/cpu64.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 95d0c8c101a..4c7105ea1a1 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -708,9 +708,9 @@ static void aarch64_max_initfn(Object *obj)
>          u =3D FIELD_DP32(u, ID_MMFR4, CNP, 1); /* TTCNP */
>          cpu->isar.id_mmfr4 =3D u;
>
> -        u =3D cpu->isar.id_aa64dfr0;
> -        u =3D FIELD_DP64(u, ID_AA64DFR0, PMUVER, 5); /* v8.4-PMU */
> -        cpu->isar.id_aa64dfr0 =3D u;
> +        t =3D cpu->isar.id_aa64dfr0;
> +        t =3D FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5); /* v8.4-PMU */
> +        cpu->isar.id_aa64dfr0 =3D t;
>
>          u =3D cpu->isar.id_dfr0;
>          u =3D FIELD_DP32(u, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
> --
> 2.20.1
>
>

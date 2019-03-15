Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp1573701wro;
        Thu, 14 Mar 2019 20:51:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx464c5c8uoEQJh9wMjtvWEsCmiamCn93KQG+1LXnRvxkisXXmU5fcPsXupxzM8gRmkVpGE
X-Received: by 2002:a5d:6711:: with SMTP id o17mr722669wru.268.1552621918947;
        Thu, 14 Mar 2019 20:51:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552621918; cv=none;
        d=google.com; s=arc-20160816;
        b=hGzYa2dHnupFtaEaJU+hZbMHUzBxdrUDKyLlrP74vkROIM52mrQfGzMLoKMpuyopgJ
         7YDveo6S0ED9cjdTpqTLVjk0lObcT4x4TQyZqWuZlufcbcgvKIr3FxrUkhcl6ELbYWPP
         oWUb2ThC0IOM9bSF+SekldJCivu+9I+kJWHLy2UQMeIAjHw7FGkRi3d8GKugFyVrRPfF
         Rtu5VL9UWYyq2uwAnWhmbq64gnkX0PJRH7mPy/MjLtNKEDOP1a3qurDrPuNN6mjz3NBW
         Y7MEjSx2+ntyJNB5ahHEUg/z7rErffDuDd4fer2fnXjE20w/c2ylHIZsu7xUI6Pc5ofp
         mRqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=OEjmjCNxQbyBqPn2xmpMJOBjpvButXFkupUHmUjdWqw=;
        b=jrouYVS/q8+RNpdCBegl9X//ABzuR2xka6+WsdY43LrcgAN5KumklgszViS1ULbdI7
         qwRS5Jj5Bn9NJ9QYnfTjpoCwaTDOYxUMUlEHTjjp6ZoLwJ8a3689dOAQUTHCc7wVvZyi
         oeM1nN1mj3kBuRjJgcKGKZ5+jnogFLbj+ATDaspTqITV2gwhN7CokFIczM4c/AkbX0UV
         f/3jLfUZJDmcujiFK1WdaWL23qHmnMzfagTFs8vLl63JMZdtXFOEzDx5ZYolE0wjWNry
         dIvWkhpHSDF4VihOMzFhtu1bb+wlEe45vFE+oHPwpVaRPqkbCfSONdKsnIwY8JezfP78
         Q8eA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=P0ZTQC9J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q2si543503wrd.40.2019.03.14.20.51.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 20:51:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=P0ZTQC9J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:49014 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4dt0-0001sd-1b
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 23:51:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1h4ds0-0001oq-21
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 23:50:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1h4dry-0005MD-Iy
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 23:50:55 -0400
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:34782)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1h4drx-0005LB-Rr; Thu, 14 Mar 2019 23:50:54 -0400
Received: by mail-qt1-x844.google.com with SMTP id k2so8718223qtm.1;
	Thu, 14 Mar 2019 20:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=OEjmjCNxQbyBqPn2xmpMJOBjpvButXFkupUHmUjdWqw=;
	b=P0ZTQC9JNtLgRJlrNFIcGA1CNaMu5QcU3o6c1DbjEEOpAn72rdzzK8MiAqB332XLEX
	mg8cB7zAKL5rGzRbcWHDyRFiIDkytVpc7qxtHnIZztamaKMNHjSnMJ8yvQCsIc9CEgQY
	e7eoknjA/JMzEStBI4FER7ESNixGIAdnPgM7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=OEjmjCNxQbyBqPn2xmpMJOBjpvButXFkupUHmUjdWqw=;
	b=QKYyURpc+IPTslgIXS484deZ0uju6iz3exxciuXXZGJUIeHcict43Iya1MbX+KfzqK
	cqRNVrBYPf6iqTM4kxQm4CNKf4THuQf6ZqwsaF8D8ZinY5srMt/a15WPMF28Monno99g
	huEjMX3v+nvPoIHN6cpXaLkXcbor8DHLtNGrydTWrO3M6wfqRilx1khIb4kY1f0B3lj8
	Af3zz8f968nO/rG+NQWtBMqvt8aPgS7WbDYDSL2AT1dKYJqV9PT3Qrp2V9F7ByuBvarM
	Ct6fc6+gFjb8Pzr90PcQsm+bxpUdFZr7onifIg+qokTUT0x4Lfp/08PxmATjhHmYN+3T
	uvLw==
X-Gm-Message-State: APjAAAW/h/LuIZ0d9YcSNvpJ5G5890OWr+vhc99H1n4dpNA0bs1/NKNS
	pIaCvIuLf+y27UBuIpP9hts8JbzthW0Pw6+njbw=
X-Received: by 2002:a0c:b035:: with SMTP id k50mr956495qvc.85.1552621852354;
	Thu, 14 Mar 2019 20:50:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190315032629.21234-1-richard.henderson@linaro.org>
	<20190315032629.21234-17-richard.henderson@linaro.org>
In-Reply-To: <20190315032629.21234-17-richard.henderson@linaro.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 15 Mar 2019 03:50:41 +0000
Message-ID: <CACPK8XcT3zmSFY_-aFfJ+rE979tHKwyd8Yjev=22f0A2c082sQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::844
Subject: Re: [Qemu-devel] [PATCH v3 16/23] aspeed/scu: Use
 qemu_guest_getrandom_nofail
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a4EPwY01WtyR

On Fri, 15 Mar 2019 at 03:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The random number is intended for use by the guest.  As such, we should
> honor the -seed argument for reproducibility.  Use the *_nofail routine
> instead of rolling our own error handling locally.

Nice!

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> Cc: qemu-arm@nongnu.org
> Cc: C=C3=A9dric Le Goater <clg@kaod.org>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/misc/aspeed_scu.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index c8217740ef..ab1e18ed4b 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -16,7 +16,7 @@
>  #include "qapi/visitor.h"
>  #include "qemu/bitops.h"
>  #include "qemu/log.h"
> -#include "crypto/random.h"
> +#include "qemu/guest-random.h"
>  #include "trace.h"
>
>  #define TO_REG(offset) ((offset) >> 2)
> @@ -157,14 +157,8 @@ static const uint32_t ast2500_a1_resets[ASPEED_SCU_N=
R_REGS] =3D {
>
>  static uint32_t aspeed_scu_get_random(void)
>  {
> -    Error *err =3D NULL;
>      uint32_t num;
> -
> -    if (qcrypto_random_bytes((uint8_t *)&num, sizeof(num), &err)) {
> -        error_report_err(err);
> -        exit(1);
> -    }
> -
> +    qemu_guest_getrandom_nofail(&num, sizeof(num));
>      return num;
>  }
>
> --
> 2.17.2
>

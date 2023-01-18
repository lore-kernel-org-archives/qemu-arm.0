Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp274283ejc;
        Tue, 17 Jan 2023 22:54:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvkVtQlYZwAOSr4e08Bvo2KOMHeln1oYsvcSQPiabILX1YroFgE2apE31ff0xro36TKyyVj
X-Received: by 2002:ac8:470a:0:b0:3ab:8d12:e281 with SMTP id f10-20020ac8470a000000b003ab8d12e281mr7992013qtp.66.1674024879111;
        Tue, 17 Jan 2023 22:54:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674024879; cv=none;
        d=google.com; s=arc-20160816;
        b=AEOX841ajpqQQM4pdHYBysIi0waTgJO2XJzJ0ZvSafUJVa/iThfRwxOSaxK0G5rVQz
         0PxPuh61E6eb0dNsq0VNqXBsXcETxrwqJb1j4lv27JoLb4vGrmxU5HHK/yk63f9l8IKZ
         GZpGCWSEwjgUEDTjCJfT9aNo0Q8+0Uij79BBAohR2vNDXvGm0+Q5kjDUizgpDnvK/xBK
         aOu3fGK6kIyCpKaYOJCBsSaykHgYOXBVFwYS8ErrrxtC1BPBWWLlcgggekIwhTV83ImM
         vSvg7gv9y+aRjMI3QMvJaQeDdwvT0WHXvlpcapIIZIy2I3A+LvRI0HbI7PaFD9r/TnUg
         5nyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=J4tIJwMVf1KPdNevhXqAd5NlgY0tz5HV8fZGUnAW25g=;
        b=OqRs5FnDPxXtkYYflr3wJnqriAb4+49out78VfQpCjCQH7GNHR8R9AB3RfyQNjOpjp
         +LsFYswRu6WurZREuIA3xe9B0kP58XPHfvECK0+L/hBs8hwiQtvH6HMj8+zdCJW77+tU
         nJZZEd/OKUMMFxOLIMhvkLZ5wv/2vMa3/ercQOcCeQp3nsAW4i6mGVOwPZniSFJLJI+1
         EUbjvy/EoyluwSSwhS3Wj/JfLS0/9bUwQCFD/n2Pigxs7SOcwXcVZ9A03hy6xIlmILdH
         /Nn76nAuf27/X6fWWvRcOFceSVRi3rV1vmX/nwtqczHdcXAV5rN6zJMkoHZwUGvfH1vh
         dHiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=Y6DnVJlS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ou4-20020a05620a620400b0070683c22520si3207945qkn.282.2023.01.17.22.54.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 22:54:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=Y6DnVJlS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pI2Kk-0001T7-9d; Wed, 18 Jan 2023 01:54:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pI2Ki-0001Sn-7U; Wed, 18 Jan 2023 01:54:04 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pI2Kf-0001do-03; Wed, 18 Jan 2023 01:54:03 -0500
Received: by mail-ej1-x636.google.com with SMTP id az20so61770222ejc.1;
 Tue, 17 Jan 2023 22:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J4tIJwMVf1KPdNevhXqAd5NlgY0tz5HV8fZGUnAW25g=;
 b=Y6DnVJlS+/xoKvFq+97oJEnL29ZlY3xgiHcvTFACz6db1BS3+PAoO7UrGyQxovffHd
 qxGMF1+okAEwxNeHjEXsvr+RryUAKncygMhACDM98ROLspz28cbE8iHH8/vEf6ZwrFFN
 dG50gYbjwXeNsEacEoZTBtx7dJ2piH59K9Mvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J4tIJwMVf1KPdNevhXqAd5NlgY0tz5HV8fZGUnAW25g=;
 b=CR5YcnoFr3MMPmXF6OVGMq03XcukPfMLmjl0USwoY+qHc0/pzapcY1sS/jfcHJz7eP
 vGOvwgJzpw5hFNe1V9tgAielnLL+dQVDRFMZJVKl0eqR7tpYVEePfe8hz4vOOxPH/F9V
 fDP6XuSKGT7WAyLtwkg+4wua8ybVvneNRQIIyTnwtwq8K1OilwSY18BQB9toOmfD82LI
 VXS7f6FngOM0CFxwfhCofAhi6s9DgH+eqj6uhim5wwwuif5/jUQ8TOYsXkWD7iKwML/T
 KUzVjmAX4pt9hjPGeNk6YQoQbZnAAEngg9LNiz+WakumnLdfts1u6dm3b7VKoPeNL7QI
 L9Nw==
X-Gm-Message-State: AFqh2kpfwXplmO6pyXna2iT1fHTm5+NlUFigUGdWCJGDp6TrFJ3d2MLU
 A8WINsRepvGZE2d+ORR/VFDY7k7QB5+K9Ysmsd8=
X-Received: by 2002:a17:906:3b85:b0:7c1:4665:9684 with SMTP id
 u5-20020a1709063b8500b007c146659684mr769954ejf.23.1674024838773; Tue, 17 Jan
 2023 22:53:58 -0800 (PST)
MIME-Version: 1.0
References: <20221230113504.37032-1-philmd@linaro.org>
 <20221230113504.37032-5-philmd@linaro.org>
In-Reply-To: <20221230113504.37032-5-philmd@linaro.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 18 Jan 2023 06:53:46 +0000
Message-ID: <CACPK8XcdKGvQGOeBKQXRhYVZKO5k8jCv_1syNbZr8YPufaSjLg@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] hw/arm/aspeed: Use the IEC binary prefix
 definitions
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Troy Lee <troy_lee@aspeedtech.com>, 
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Peter Delevoryas <peter@pjd.dev>,
 Steven Lee <steven_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Peter Delevoryas <pdel@fb.com>, Peter Delevoryas <pdel@meta.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wipeaF9ngvXj

On Fri, 30 Dec 2022 at 11:35, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> IEC binary prefixes ease code review: the unit is explicit.

I strongly prefer the existing code; it tells you the size without
having to do maths.

>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Peter Delevoryas <peter@pjd.dev>
> ---
>  hw/arm/aspeed_ast10x0.c | 3 ++-
>  hw/arm/aspeed_ast2600.c | 3 ++-
>  hw/arm/aspeed_soc.c     | 4 ++--
>  3 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index 122b3fd3f3..3500294df7 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -10,6 +10,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qapi/error.h"
>  #include "exec/address-spaces.h"
>  #include "sysemu/sysemu.h"
> @@ -348,7 +349,7 @@ static void aspeed_soc_ast1030_class_init(ObjectClass=
 *klass, void *data)
>      sc->name =3D "ast1030-a1";
>      sc->cpu_type =3D ARM_CPU_TYPE_NAME("cortex-m4");
>      sc->silicon_rev =3D AST1030_A1_SILICON_REV;
> -    sc->sram_size =3D 0xc0000;
> +    sc->sram_size =3D 768 * KiB;
>      sc->spis_num =3D 2;
>      sc->ehcis_num =3D 0;
>      sc->wdts_num =3D 4;
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index a79e05ddbd..72df72a540 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -8,6 +8,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qapi/error.h"
>  #include "hw/misc/unimp.h"
>  #include "hw/arm/aspeed_soc.h"
> @@ -619,7 +620,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass=
 *oc, void *data)
>      sc->name         =3D "ast2600-a3";
>      sc->cpu_type     =3D ARM_CPU_TYPE_NAME("cortex-a7");
>      sc->silicon_rev  =3D AST2600_A3_SILICON_REV;
> -    sc->sram_size    =3D 0x16400;
> +    sc->sram_size    =3D 89 * KiB;
>      sc->spis_num     =3D 2;
>      sc->ehcis_num    =3D 2;
>      sc->wdts_num     =3D 4;
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 2c0924d311..677342c9ed 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -517,7 +517,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass=
 *oc, void *data)
>      sc->name         =3D "ast2400-a1";
>      sc->cpu_type     =3D ARM_CPU_TYPE_NAME("arm926");
>      sc->silicon_rev  =3D AST2400_A1_SILICON_REV;
> -    sc->sram_size    =3D 0x8000;
> +    sc->sram_size    =3D 32 * KiB;
>      sc->spis_num     =3D 1;
>      sc->ehcis_num    =3D 1;
>      sc->wdts_num     =3D 2;
> @@ -544,7 +544,7 @@ static void aspeed_soc_ast2500_class_init(ObjectClass=
 *oc, void *data)
>      sc->name         =3D "ast2500-a1";
>      sc->cpu_type     =3D ARM_CPU_TYPE_NAME("arm1176");
>      sc->silicon_rev  =3D AST2500_A1_SILICON_REV;
> -    sc->sram_size    =3D 0x9000;
> +    sc->sram_size    =3D 36 * KiB;
>      sc->spis_num     =3D 2;
>      sc->ehcis_num    =3D 2;
>      sc->wdts_num     =3D 3;
> --
> 2.38.1
>

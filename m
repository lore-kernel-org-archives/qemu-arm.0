Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1501490lfb;
        Fri, 20 Nov 2020 09:29:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJysKfv7f9DOWeYRhPDIVsjeARmqDucb93zYtSMBrATz5E1cZ8W6fBxx5Qvsxl4qmUElvWEH
X-Received: by 2002:a25:512:: with SMTP id 18mr19544824ybf.266.1605893362788;
        Fri, 20 Nov 2020 09:29:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605893362; cv=none;
        d=google.com; s=arc-20160816;
        b=GGWUyQkE/gjMFGDbe+E7baBP1gw6W6LJOTTFrJgnNR1GydGrPYIti3mWY9ugwFeFvb
         UvU41Pt9GUoVyZwwqyuoPxgjC8geTX+cywZaogzC7PP+KX3XPbM8p0fqhGe2exDaycFx
         mpIoacIw+LR6eOaAnFNwgCk9J7Knj7Avc3FrSgwrZDotfFy9kTIemwrf2O3i3Hwm6i1m
         O8i0xfrjlyQ4dpuFLiosR8vV6W/e5tYwZ08RzHvP0pDGvuwernH7lAziGAomglQ2TWlr
         ciKqB7ly4TdrPhtuMoarhmZ9DwezbYnmWE+b4mG2pDm/Eg597j0IwMqB7EL/zm9Ude0R
         h7Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9RZvWXlVz+1NpVbn62266BSYs/8NKhQu7/3HqMOcaIs=;
        b=rDqKa47Na3EMN7Ovdv1cwJsIkXR41eEgiSyS5iLhI7yopMXKwHRXyL+TpAYrquzdnF
         g+pOKlRCDXJa0090ShPgpie7xnhaAWA4qHXjhpkqbZv0lSswC0n7R+LsfyMbn7o6J8he
         oFBTmBtwgXKfZQRXMwPZ1FZIFq/Qt4wL3QSwhwyqUrB77BFlljMcrwxkZ29OoQlGX2ZW
         TTwJGYJyasOuijInLqfz3scHNEb2fJr5cgjT+a6KYn3HW0FmJZhQJ2+U5NjtL1mpChIX
         YejLHLDip5BcLJBeH8ROWW3Jv6UM3sVBM0F2ty2JucIwVGb7FNL17Bbswo6fW95v2cFQ
         eQ8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cJyQpsuS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g38si3334542ybi.291.2020.11.20.09.29.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2020 09:29:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cJyQpsuS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kgADq-0007Gk-5b
	for alex.bennee@linaro.org; Fri, 20 Nov 2020 12:29:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1kgADh-0007Fc-6c; Fri, 20 Nov 2020 12:29:13 -0500
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:44948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1kgADf-0001mm-Ls; Fri, 20 Nov 2020 12:29:12 -0500
Received: by mail-io1-xd31.google.com with SMTP id o11so10684174ioo.11;
 Fri, 20 Nov 2020 09:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9RZvWXlVz+1NpVbn62266BSYs/8NKhQu7/3HqMOcaIs=;
 b=cJyQpsuSrlfNHMHRPOMucojSIbQ6nCmuvlQWRKM3+Bhr/jRshvGtUNr9tOMCM0d6mF
 XNxlWKcOZY9CePbV9A33sqBBHtfDv3zxwtgB0NJRZZLh4Z021g29Uw9sf7AuhkOie/w+
 xKs5JHxlNtT3Nr88RhXHcmYWlXLAI4NsOFYh42vnCTTmKTNfEvRPGB+Bm2FzPKAzUmzU
 c5nGLGlMkF8JskOSpXnxHRqbgOEmGx8HBOK3sXhZ8q+NyINJYLjO7L9nk0MpfW9bq3df
 sbvKIUeHDFJ2Shvov8GbEKrYpCQXx18aM9n27EumZwglqyL49ch0Q0o4Px8BfBxd707q
 v4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9RZvWXlVz+1NpVbn62266BSYs/8NKhQu7/3HqMOcaIs=;
 b=TvLa+MxdYmK1uZqJcLOkDf3MOhqBWGF1sckd2dsh4bwhlPhVM9YlnE3LRptkMe1tm3
 Fz+bsqmmyE676Ef7khb7GnBGn9k+QMdpiSowE2OvLa4k2YSZggW22ZjHOzegtQBY+zjj
 E4inHsf1Fu085OvwBPQWE7oxehwsCWeA/rKlJsihun51r6q940JIKmxVgZ0ffIujwyOZ
 /i/gVjQg7/PrcjZ+JkvlZduNYaVSZEu6XWH4Iumr0X5Lz3CJ72C4U9wAqGJ9ABUh1uEO
 RnL0wripD8ibhyF+3Ao6VTojtiFPqg59QXkA3GfXi6PW6rWD0j68gfEqOk8Lthn2VLOr
 voDQ==
X-Gm-Message-State: AOAM532pcdMNfrp9ALUJdZgLnXYLtPeAb+6n/JYYZhzwUVZ2h8TMddBD
 RKaAkeVd1T8mH68Q6nPkz2sTx/7Ipu96aq+6EKI=
X-Received: by 2002:a05:6638:10ef:: with SMTP id
 g15mr20228421jae.85.1605893349892; 
 Fri, 20 Nov 2020 09:29:09 -0800 (PST)
MIME-Version: 1.0
References: <20201120154545.2504625-1-f4bug@amsat.org>
 <20201120154545.2504625-5-f4bug@amsat.org>
In-Reply-To: <20201120154545.2504625-5-f4bug@amsat.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Fri, 20 Nov 2020 18:28:58 +0100
Message-ID: <CAPan3Wr0Dd3XnK9Sd8UM8yoq39VE4ZG_czeuooBTAFnUeCRuZw@mail.gmail.com>
Subject: Re: [PATCH-for-5.2 4/6] MAINTAINERS: Fix system/arm/orangepi.rst path
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000aae8e105b48d2e80"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gh0Fk7FUzr2n

--000000000000aae8e105b48d2e80
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Op vr 20 nov. 2020 16:46 schreef Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>:

> Fixes: 0553ef42571 ("docs: add Orange Pi PC document")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>

---
> Cc: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2623cf85f66..311a55317ce 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -559,7 +559,7 @@ S: Maintained
>  F: hw/*/allwinner-h3*
>  F: include/hw/*/allwinner-h3*
>  F: hw/arm/orangepi.c
> -F: docs/system/orangepi.rst
> +F: docs/system/arm/orangepi.rst
>
>  ARM PrimeCell and CMSDK devices
>  M: Peter Maydell <peter.maydell@linaro.org>
> --
> 2.26.2
>
>

--000000000000aae8e105b48d2e80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Op vr 20 nov. 2020 16:46 schreef Philippe Mathieu-Daud=
=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt;:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">Fixes: 0553ef42571 (&quot;docs: add Ora=
nge Pi PC document&quot;)<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank" rel=3D"noreferrer">f4bug@amsat.org</a>&gt;<br></bl=
ockquote></div></div><div dir=3D"auto">Reviewed-by: Niek Linnenbank &lt;<a =
href=3D"mailto:nieklinnenbank@gmail.com">nieklinnenbank@gmail.com</a>&gt;</=
div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
---<br>
Cc: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">nieklinnenbank@gmail.com</a>&gt;<br>
---<br>
=C2=A0MAINTAINERS | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index 2623cf85f66..311a55317ce 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -559,7 +559,7 @@ S: Maintained<br>
=C2=A0F: hw/*/allwinner-h3*<br>
=C2=A0F: include/hw/*/allwinner-h3*<br>
=C2=A0F: hw/arm/orangepi.c<br>
-F: docs/system/orangepi.rst<br>
+F: docs/system/arm/orangepi.rst<br>
<br>
=C2=A0ARM PrimeCell and CMSDK devices<br>
=C2=A0M: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" targ=
et=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt;<br>
-- <br>
2.26.2<br>
<br>
</blockquote></div></div></div>

--000000000000aae8e105b48d2e80--

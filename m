Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp9419087lfc;
        Fri, 29 Nov 2019 11:12:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqz0gXmb1GHbW8RO1QWLXCvReKn0ozHYPUJ9AuhHdZl1hyQn28nY5BkKSZpmCSFZHr2fLcH5
X-Received: by 2002:ae9:f711:: with SMTP id s17mr17842617qkg.238.1575054747953;
        Fri, 29 Nov 2019 11:12:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575054747; cv=none;
        d=google.com; s=arc-20160816;
        b=meQ2rxZMD2KBS80NYGsNj08QMdy1657UQv6+HgM8tETlyzrNzUYofx8UOyJSgKZ9+d
         b4xyxYvtBEGWQPGCYpMVE0fcdlJmb0b0S6pnI7ecvf1shBiU695Irx6HODGUhTYn5Bbq
         VcBFXRW4DkAZJrNGan88qv3vWslcUHfIRYmHkq472U9JvS5/KkA8xrMzlpdSCfbusbw9
         gkvSzKKlPy07T7mp8dPpCayg6wbElSseC2AIlPUkpNrAmeS3Qf8vgDn1tobgGrrHIjOc
         gg6ygZ5lLel1xebC38jBIXpMYnoFyE5LUhAdxdP9zwNhmUoclB9syfCCLByzmyvvQETr
         79IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=HCgtPr845B2uezEWIf0YsHqUlkKctP/29CRYu6CMd48=;
        b=eHTpASN+7DYc/LIyH2hL/Rn3aDg2E7Sbttfj/PucugUp5I5wwvOIoi9QgXBsyFUf5F
         41ElzuHXUZhPqE49CT1NdzNPS1EQ2m9Kk36fEcdk3DanwFV7W6JcnKdIt+NR4G9cz0Bq
         WzsIz/6i2f3+DgdgnRXF1tMHV+abNHE7S79ldcxg9qNDJHOLTfzGw5tK0iSyfU+TeKyE
         vyChXyNpiOs/Y7v3j3IGB0kXcdUqO9TAQjuQa1gP7v5kATS4FFz1mtdBEt8T0J+EX+PU
         QYl1uokRmFlLN6KnI9Uc+kqqF8ZKEH90FiTyXcXRl0hipXzMs4utwXOlF9YZzh0IdA7s
         13Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RqCKpxF0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j1si13637366qkm.174.2019.11.29.11.12.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2019 11:12:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RqCKpxF0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ialgm-00029j-Bg
	for alex.bennee@linaro.org; Fri, 29 Nov 2019 14:12:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52071)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ialag-0000YD-Sk
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 14:06:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ialaZ-0006gz-HL
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 14:06:02 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:33587)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ialaZ-0006Y7-Bk
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 14:05:59 -0500
Received: by mail-oi1-x242.google.com with SMTP id x21so19784228oic.0
 for <qemu-devel@nongnu.org>; Fri, 29 Nov 2019 11:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HCgtPr845B2uezEWIf0YsHqUlkKctP/29CRYu6CMd48=;
 b=RqCKpxF0ubH7YuN6IHRysAOic/R7j+8y7KB0bVFxAHLVKXJ34ssu6VLoZRlEScWNHW
 vRLC4zvfgCrKsZBwaGoMnOp0aWaz7h0LHu/Qg3TySxKFeXAC19pTgtWyWgVqy43zglpJ
 /+2jxMgUsJHYDzQR0PLmT64EHjBhOxS1ZCPNCNw1i3wKB4+T6UbJZoGKcPCI0K5Zezs7
 WclMYC0B9M1pGhwx/NKPZGfbhBwweBH7ge3ClsafMXqzr9/mTjSlNb0a1TlXxMK3Xx7A
 qwcED8kr6niSScuud36zVqb7Bw/dbVlZpH49kUiGzrsvQHKboIIHC1f1OP/t8D47mVxq
 BW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HCgtPr845B2uezEWIf0YsHqUlkKctP/29CRYu6CMd48=;
 b=WUJ+qjzpxjSIbMAtwTt+WzB0LhRreddLvsgCwMAj4ddxmidTRZFPFxL7lUfVz143Gc
 1Hco9Xf02u1Ciqw+kyM0+nDxN6XgHc6d+SPjnRrjO0U5ssWGDGZW8wQnzRXNs5hDYnMS
 EJ88AtyKC+xkJLAzfW7r+Epr5UXOFm2SfAnsEENzjtidWp/7QxVtGqViXNUc1zZ+NWJG
 mbyrrQJnrvI1O84Am9N14elysbNf76mdW3mn97pxzwCk+g10hPORp9C8L8WMJ9HoOwTd
 CZntCxL0W47a9RrtBZyE/59f07epH+pXkHNnUhRzjpXCZ+1oa0WzawAFRPGq7falsN1k
 JqiA==
X-Gm-Message-State: APjAAAWR1jFRNLQNkPzfAHC8xlK+6EDlr7utDvnra56HQ6tGQrh4q03y
 yb5y2z5l4URtCNtKcPbCB10V6xKikX35fSAPlJV/tw==
X-Received: by 2002:aca:f484:: with SMTP id s126mr10843226oih.48.1575054357126; 
 Fri, 29 Nov 2019 11:05:57 -0800 (PST)
MIME-Version: 1.0
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <20191018150630.31099-13-damien.hedde@greensocs.com>
In-Reply-To: <20191018150630.31099-13-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Nov 2019 19:05:46 +0000
Message-ID: <CAFEAcA-YiD6B1wMTrOvj5=QbYY3uuqdbJbSP57zg3S86nU=k-Q@mail.gmail.com>
Subject: Re: [PATCH v5 12/13] hw/gpio/bcm2835_gpio: Isolate sdbus reparenting
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Edgar Iglesias <edgari@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kmflyc+XOLV1

On Fri, 18 Oct 2019 at 16:07, Damien Hedde <damien.hedde@greensocs.com> wro=
te:
>
> Split gpfsel_set() in 2 so that the sdbus reparenting is done
> in a dedicated function.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Cc: qemu-arm@nongnu.org
> ---
>  hw/gpio/bcm2835_gpio.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/hw/gpio/bcm2835_gpio.c b/hw/gpio/bcm2835_gpio.c
> index 91ce3d10cc..81fe07132f 100644
> --- a/hw/gpio/bcm2835_gpio.c
> +++ b/hw/gpio/bcm2835_gpio.c
> @@ -75,7 +75,10 @@ static void gpfsel_set(BCM2835GpioState *s, uint8_t re=
g, uint32_t value)
>              s->fsel[index] =3D fsel;
>          }
>      }
> +}
>
> +static void gpfsel_update_sdbus(BCM2835GpioState *s)
> +{
>      /* SD controller selection (48-53) */
>      if (s->sd_fsel !=3D 0
>              && (s->fsel[48] =3D=3D 0) /* SD_CLK_R */
> @@ -86,6 +89,7 @@ static void gpfsel_set(BCM2835GpioState *s, uint8_t reg=
, uint32_t value)
>              && (s->fsel[53] =3D=3D 0) /* SD_DATA3_R */
>              ) {
>          /* SDHCI controller selected */
> +        sdbus_reparent_card(&s->sdbus, s->sdbus_sdhci);
>          sdbus_reparent_card(s->sdbus_sdhost, s->sdbus_sdhci);
>          s->sd_fsel =3D 0;>      } else if (s->sd_fsel !=3D 4
> @@ -97,6 +101,7 @@ static void gpfsel_set(BCM2835GpioState *s, uint8_t re=
g, uint32_t value)
>              && (s->fsel[53] =3D=3D 4) /* SD_DATA3_R */
>              ) {
>          /* SDHost controller selected */
> +        sdbus_reparent_card(&s->sdbus, s->sdbus_sdhost);
>          sdbus_reparent_card(s->sdbus_sdhci, s->sdbus_sdhost);

The commit message says it's just splitting the function in two,
but these two hunks are adding extra calls to sdbus_reparent_card().
Why do we need to call it twice ?

>          s->sd_fsel =3D 4;
>      }

thanks
-- PMM

Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1170597wrm;
        Fri, 18 Oct 2019 09:55:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyjl53VM39zZb7wyDDY5j/OWovSNwKxN4AphRg11jhGG2FqofUFTsG3AizPAYxQIpH1nBHg
X-Received: by 2002:a17:906:160f:: with SMTP id m15mr9308812ejd.217.1571417750195;
        Fri, 18 Oct 2019 09:55:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571417750; cv=none;
        d=google.com; s=arc-20160816;
        b=VNFaZL4jAZxIhZPMhpwXrLp0HSe/m3irjsI3txTv+74SVUpaaQnoqskB3IAeJ+DQYJ
         Qk5IubwrSegko+uY3BlMKsgkraQXzneFQ0ZG6LJo2+WRrC6jj3CkwggO47PYZNw+h2Nz
         xgjQu3f7ZMRVdB7+SahltVmCN362WSeb112HuQQqAHvmnbCpjYdotagonyRcexFachIr
         SIfBbczxjyd2uJY78e3Ay4crG2Uc0x+6Jbti92Wpgul2NKDaD6KVrtvC+b0PU70x1oMt
         zluZAeLrhukn3GN+ln2KhrmMqmXPEfYd5jac+5X/QZcCE4ZcPNTYX8ZI8mnAIYVApnt7
         DRIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=KIqYcN4FSabwWJ3EPSLj/Q3uwagcQXwMI+yuJRNBrF4=;
        b=bsIFhqiD+DH/TM2ldZnisO2cDlqlpImzRzAZsfUdS+VvXQT8a1ECIeOCQUEc1qoVsn
         xh1VIldNMy7mGpgSIWa2U1KjM4vazwuDf6jSmZeqebhEp7zrWdnqYgvHUzI5LlnWkM1/
         Z1W/XTnfqbh3HSiY2UBCr3Y04KUPuosYeVTIeAlN77Ivdxm0d7pEpITIFaTHawKPmoLh
         73ChZ0O6IYgeOMTkqTfJsjj6eLpXExyGopHPFemHWF8ZbhyzGjBgtg3WgvGOeR+ozssC
         xhy24ySduapx5ieTJW/B622coHKimZ07WgKK0JUv2rdatiFH5qLG6fuuZVnXuy0eQrga
         nnlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nkdj+3a6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o25si3598627ejc.361.2019.10.18.09.55.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 09:55:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nkdj+3a6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLVXY-0007Xt-Pd
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 12:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54271)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iLVXO-0007XX-CG
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 12:55:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iLVXN-0002aK-Ev
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 12:55:38 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:41734)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iLVXN-0002Zt-7c
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 12:55:37 -0400
Received: by mail-oi1-x243.google.com with SMTP id g81so5771757oib.8
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 09:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KIqYcN4FSabwWJ3EPSLj/Q3uwagcQXwMI+yuJRNBrF4=;
 b=nkdj+3a6EqPpqBX6Avm4dz4XEK12yBIae31nzHYYwk3fPN/vhIQ7Deg6a3ozdbNdkD
 5pQmOMIR3p79vPSw+NrghEjmqBCumybY8lYob+WnHnORYdmjiFB2yzflW8OtXtpFXy7E
 oMqJoc+Nb9/XVJVZWfoalnnKt4JwtQG4P2LeOAtAXRHon8NWW/O9KaJiE/P5zFtWPcR6
 IGfLx2ttOEVU//pEIU/ATYde00YjTWZZrSMz+iNNAWwuGZmF1xAqqJ3o3fhzu6yK3b9p
 h95HNjqDHcWgZvHfRpvgDJo/hhQ0aTvcnbiqCCCKVAS+ZD2Wd16VyDJdHDlrsL4bvCJi
 qWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KIqYcN4FSabwWJ3EPSLj/Q3uwagcQXwMI+yuJRNBrF4=;
 b=PTOJTe9VfpAk0U+8mamW97GXWD5UnbRpPBE5QvZ8afpzV7ydKa3KDSpUfJPnh7Mh0X
 Gl7WiAKNw4nh06+reRhqQE1rxMM71zTUBJ431ROuHgnLsHzaiBeqyP/2q/t4Yc6qo3f5
 8Yz5UDpG0/XLsvdyIAh210dULNMsDlfdq2sqEjPGhMHgBIX6cg+OcMCb2MFGX4OMjXmd
 CgxH7iVN8j8PksfcyxW2eV8FrLqlvHdhcm740TqjlrzygAi7OF/dUSnkv5R1cTYMXXth
 rXdu2N0VWsfkBOTTeSP8FYlqj/6xSfBCZyte7SIB2hc+6VRbr1SPIIiUlbR8A/VQz9dl
 iUFg==
X-Gm-Message-State: APjAAAXhM8RRLFLg43AhrXcFtiWFUrZ3o2sMA9YTDPtR6+JnhDH726Q0
 nMIRZ7T9VAL8kT1DvKnQp9PRLuQQMrAIaF+BzGYhwQ==
X-Received: by 2002:aca:2b08:: with SMTP id i8mr8477417oik.146.1571417736275; 
 Fri, 18 Oct 2019 09:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
 <20191018154212.13458-11-marcandre.lureau@redhat.com>
In-Reply-To: <20191018154212.13458-11-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Oct 2019 17:55:25 +0100
Message-ID: <CAFEAcA_0EFdyxfVgnyH=O7HSoZUi7xDLaNRyXt0dRCE7Dr2x6w@mail.gmail.com>
Subject: Re: [PATCH 10/14] omap-intc: remove PROP_PTR
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +5WJmtWTsb6c

On Fri, 18 Oct 2019 at 16:43, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Since clock are not QOM objects, replace PROP_PTR of clocks with
> setters methods.
>
> (in theory there should probably be different methods for omap1 &
> omap2 intc, but this is left as a future improvement)
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
> diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
> index 2fda996648..6b7897ba27 100644
> --- a/include/hw/arm/omap.h
> +++ b/include/hw/arm/omap.h
> @@ -67,6 +67,16 @@ void omap_clk_setrate(omap_clk clk, int divide, int mu=
ltiply);
>  int64_t omap_clk_getrate(omap_clk clk);
>  void omap_clk_reparent(omap_clk clk, omap_clk parent);
>
> +/* omap_intc.c */
> +#define TYPE_OMAP_INTC "common-omap-intc"
> +#define OMAP_INTC(obj)                                              \
> +    OBJECT_CHECK(omap_intr_handler, (obj), TYPE_OMAP_INTC)
> +
> +typedef struct omap_intr_handler_s omap_intr_handler;
> +

If you add
/*
 * TODO: Ideally we should have a clock framework that
 * let us wire these clocks up with QOM properties or links.
 */

> +void omap_intc_set_iclk(omap_intr_handler *intc, omap_clk clk);
> +void omap_intc_set_fclk(omap_intr_handler *intc, omap_clk clk);
> +

then
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1172190wrm;
        Fri, 18 Oct 2019 09:57:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy91nWFUqQ8LKccQFTZ/YpMVOyYJsd4S4JCHrM7f8TaVBCxWVzVFlLTcJUQy3Vaohn3PJAL
X-Received: by 2002:a05:6402:1b88:: with SMTP id cc8mr10675913edb.22.1571417846761;
        Fri, 18 Oct 2019 09:57:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571417846; cv=none;
        d=google.com; s=arc-20160816;
        b=LdEbI6BfHG9XxD67Wq+q0q3o9cVpiCeZMPxOgINzb845Ts6czkUIg6FGFe1iJsk2NZ
         ntpcoTa5lDQ+8ffhsn391c9Kl45BEXMIAwoaRMhgy1n967H3kN+ykplkuvU2RXooCA1l
         64yMzxx0brSjT2gKJKAwoJbqw0CejFQF2So/NCWsYi5l9kf9VEqD4xxjdnDzDpMxnw/E
         9fpiz1ItKHyDNxiN5e+tqoLRUPweTv311eL/WBei7TBdVNkwDSaFDA3gPBVxYiUMgYoS
         lipD+n3tnBIfz4s+Lw4h9UOl4dUwD3GEm1fjuL7FSxl5XfK1rYFKMchUWmZo3vBFuaMj
         FvoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=sOWtQrHTKjxi6eKLrTm4FD/JgZSHaFrNufEN4q1uYrU=;
        b=JiX9Ve7sPF0KiES0Su3SdvTHjA3EiBhl2x3NbiEJtMHya9/7YuD53BV0qjHucw8Kbw
         bYf4HYB57XXaNLMMaihtSRMo3go92nWzSqPuPbQxbUK2Un5C8yxH1/k/8MITP2QBg2c3
         ec9KbXAfbax+NdfV/uFr9gnuPt8hL3NUvhfS71aLxGH7cjZ0781CMRbXx/64+J8ItcOt
         3kotqZypmWzogtcbUhHezc/sAokYx1sFSBcmLjEDXRBu2qFDhHEo6Rs8+5nbOgJQf2uu
         IkrkJPwQgBOq6a30CKv2NqVlWoKFua90c3NKY5dDOfswvV04AZMB+bTTJ95UAYjBZxhl
         Fi/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iE58Of0t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12si4297106edc.50.2019.10.18.09.57.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 09:57:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iE58Of0t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLVZ7-0000Qd-Of
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 12:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54523)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iLVYY-000094-2N
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 12:56:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iLVYW-00037C-U5
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 12:56:49 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:44131)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iLVYW-00036y-Oh
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 12:56:48 -0400
Received: by mail-oi1-x242.google.com with SMTP id w6so5761406oie.11
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 09:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sOWtQrHTKjxi6eKLrTm4FD/JgZSHaFrNufEN4q1uYrU=;
 b=iE58Of0t2+AvOHWyPemnQIHExeYDZxkd4GLafIgQzAPsqjza6GS3oB8wjZMrbM5BS7
 NIFUq23W85HyiQ3RaXql24PYhiyhyHs0/FH6h9L3e3Yd1ZX1hWm6KIowoI+PIeSVoroo
 d/Z+yUaJEneRkbIdXZBw22KIdqoc7SfPSpi8IDnzuJlJ11bAaFswKsG2Nx6+R2G9AZjj
 2uWMNxABl+s1US1uws0Yn9EVGR7rqwACZddBLoTAfiIo7JjAS9qBVSXqtAAvqRKB3uFZ
 CJyKZSoY0vYA6DMqf92Qucja7ZNSM2vuSQMq1m5AOJwBElNQLO4RHRBHNfyULPaPxcHn
 Toug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sOWtQrHTKjxi6eKLrTm4FD/JgZSHaFrNufEN4q1uYrU=;
 b=TFfUC2cw/SDdjYm/Ci9GPisU7qxpTOEC2b5wSEBpw/lzlcTL/iVWQ8zehHfTg9yMl7
 Tnjt+I4QcUNfoeBKrinI79PIvzIx4fnOciwaWHNADOyimu9cyFtFuDa0QW+TmEF+J8Eq
 SlFtoFDAA3F3hDfEToFoEKKtmbHXMvqEZGB2kb1ouhVrdDSdmLLB9ezu+cpEV8K+ixXi
 GjeEnMTFg6N3Y6C97D13nntbt1YaA8q5qA4gPKTVo536TtMcbE6jq78zwQsr4NMPpMXi
 xQEUAm1RTP/HYqQskWJksg8eDrqqgzvRoqk8rsb0hD1iP4eDnYDYpqPx97fbVEwQf92m
 dfoQ==
X-Gm-Message-State: APjAAAXM3hc9WNBBNWRHMvOum0KnrGc4ePMWeDXGcqqFN3jNyU7RtFOS
 JbHMfv3ihrm+fdA4CgjzMT7dJdYpcXbELYTJfV+8pQ==
X-Received: by 2002:aca:3b41:: with SMTP id i62mr8487090oia.48.1571417808015; 
 Fri, 18 Oct 2019 09:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
 <20191018154212.13458-12-marcandre.lureau@redhat.com>
In-Reply-To: <20191018154212.13458-12-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Oct 2019 17:56:36 +0100
Message-ID: <CAFEAcA-L8iEkcJwDnTK5fw6PS30fGgk2z0OZoa0EfdBM7K2rKA@mail.gmail.com>
Subject: Re: [PATCH 11/14] omap-i2c: remove PROP_PTR
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
X-TUID: INWc/2Ge1YXO

On Fri, 18 Oct 2019 at 16:43, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Since clock are not QOM objects, replace PROP_PTR of clocks with
> setters methods.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---

> --- a/include/hw/arm/omap.h
> +++ b/include/hw/arm/omap.h
> @@ -77,6 +77,15 @@ typedef struct omap_intr_handler_s omap_intr_handler;
>  void omap_intc_set_iclk(omap_intr_handler *intc, omap_clk clk);
>  void omap_intc_set_fclk(omap_intr_handler *intc, omap_clk clk);
>
> +/* omap_i2c.c */
> +#define TYPE_OMAP_I2C "omap_i2c"
> +#define OMAP_I2C(obj) OBJECT_CHECK(OMAPI2CState, (obj), TYPE_OMAP_I2C)
> +
> +typedef struct OMAPI2CState OMAPI2CState;
> +
> +void omap_i2c_set_iclk(OMAPI2CState *i2c, omap_clk clk);
> +void omap_i2c_set_fclk(OMAPI2CState *i2c, omap_clk clk);
> +

With a similar TODO header comment (or perhaps this is close
enough to the one from the previous patch that it doesn't
need repeating)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

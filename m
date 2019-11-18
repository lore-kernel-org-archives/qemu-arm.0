Received: by 2002:a19:fc0b:0:0:0:0:0 with SMTP id a11csp145554lfi;
        Mon, 18 Nov 2019 06:54:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqxnZ6RnAa5WagyN49Mnr+BDyJE/ygcW16fzpHAFdFSF2uSiiNNNdAczTi07MhE1UVtfHK3v
X-Received: by 2002:a0c:87b5:: with SMTP id 50mr26763057qvj.143.1574088896724;
        Mon, 18 Nov 2019 06:54:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574088896; cv=none;
        d=google.com; s=arc-20160816;
        b=uCobAj3yaokMndw8k7tkZIm/llemf+WRKOV32kRixgu27MV1wV67cPrHXNp9VPAfEP
         IUTLaTKD41QTpgd/oHm3Jpd/2uRHgHLRWsnez8Q3pDeTf1hCJBSCEwpC/qaiUB2GEYV8
         2yhcLvwyV0foODZU4T+RyfiIAwY7qh/YcKkCXWkHxVz1cwebwdOouiWGtarp8+SScmmB
         cilic5v3oO72tkD2qQd7H0BwQXqdQA/X8HxpZ/Xp1Te4r2832nIwMZkHAHj89fyH0a0/
         6peOMg5o4crXvfU/rqG/WZSAYRsVxr1rfoag9aNMjtDyhWZnlaHPAyO/o7KqbKfuPRrk
         moJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=IJ1R95Tq2U323m+SrNCc2wMVXEs4GOpGTfqI2NZcmwo=;
        b=TSrn4ZbDOXDqGtmckZch7dpEcqzv2REdsC3M+4/ggWl70tJDVYD092awPeANt/Wx8f
         aZ6wdjxJCjRM1JUntW/YmPWEtWbK08oOlXboYKPww8WPqeSZ6LLZ3EbvmipbvOHXxDG9
         AB0f6/l9kO6LvcUvGyu3SiBXBl2W/XHuW3Kva3CGVfNtoMjIek6TBZZBYVIpWyBQw/jB
         VjhCqY//mLao6rSqPm3cGSeSRuallCiPpjmrK/HEE258DmnCdTfadhmRflbobCL7gp9V
         vMS8e1D/DAMYlYvD3zGaNQiuMINQKr5TSXkN44BdVwxgM3R244jHrTckyTYr95qyxbk3
         sWQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VRCDATzX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k23si11453764qki.204.2019.11.18.06.54.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 06:54:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VRCDATzX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWiQa-0002oS-5s
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 09:54:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60832)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iWiQS-0002o9-36
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 09:54:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iWiQR-0001Qf-0f
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 09:54:47 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:40636)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iWiQQ-0001QF-Or
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 09:54:46 -0500
Received: by mail-oi1-x243.google.com with SMTP id d22so8593276oic.7
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2019 06:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IJ1R95Tq2U323m+SrNCc2wMVXEs4GOpGTfqI2NZcmwo=;
 b=VRCDATzX6fFSmHaGj0S21jhf1EqmtxJILSjPyKwXvO7b5JN09YRIFMMl/8PbJ54Pic
 Jw5q11TRpKkautVM3DyUko2IV5cY+JYTTYw5Hw2Sk7XgxBquqZvjmEV1k1D7+fQI3vR8
 njVlrfGSmmzzCZPW91bXTuDeaQn7fKqylRuXuYGWukQd/bg2jvY6C9/T75s/4a67oGpl
 G6PkipQOsSvGf9SfnpBLqHmg/VZ/mVLqH3dbzFkkwY3HvUeuvkGOD4XTGK7NxEPNdmga
 jTzMKfEKWrT3dTufgZ23NJIFrc9ZMRNsdfEhlFEeu+JVJsJXSBcJsLAeMLdLC2N/RSWL
 127w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IJ1R95Tq2U323m+SrNCc2wMVXEs4GOpGTfqI2NZcmwo=;
 b=XGOy1eQKk9hs8PzDpG6rljAgOcnBkgfifoZ1UnHzwEsYeuKjcJe0DgVrwF6LhXrSUP
 xHCl8CH75zWFWS52nQ5MEDLkFdToprRqQRugIX9WjcirL3mdJbbKoZgDsLprCoOBmQMY
 lfvucKPwciVcAFnHgt/p5gJ5hWK8Ilcf1ba10h9kBKGJPaNa4Nab1BdMCF8X2yTqUDpy
 RCsv/RlccSHr8dHGsQ+DBvL+/Jmc0E5+aMe1dPk3ge+CAFNFxrAJAOEvcyoj3Mu8su6I
 EkndpRTVvGAcXnoQc8geWAagj654ZdT//LJxFPk8Ym9hpCmVGoWkGC6n15G/DNCX+Way
 mmZA==
X-Gm-Message-State: APjAAAVCscc76foS+CkWPDkz/0UfRykFk2k17VTrN9XrHYjQiR/izzAM
 TcwTXIBEBuEbP8dcIrigCUTJcsL77xS6cggj8RAbGA==
X-Received: by 2002:a05:6808:b04:: with SMTP id
 s4mr20768047oij.163.1574088885660; 
 Mon, 18 Nov 2019 06:54:45 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-15-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-15-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2019 14:54:34 +0000
Message-ID: <CAFEAcA_2ct-fOfBGgNExjCrjg7WKb-Xp44GghHWXiW2+3HjWbg@mail.gmail.com>
Subject: Re: [PATCH v3 14/33] serial-mm: add "regshift" property
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
 Paul Burton <pburton@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
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
X-TUID: XQJK8itE12kS

On Wed, 23 Oct 2019 at 18:34, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> And a property and rename "it_shift" field to "regshift", as it seems
> to be more popular (and I don't know what "it" stands for).
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

I have no idea what it_shift means either (I had a look in the
git history but it seems to have been added with that name
very early on when the commit logs were generally not very
informative); 'regshift' sounds good to me too.

> +static Property serial_mm_properties[] =3D {
> +    DEFINE_PROP_UINT8("regshift", SerialMM, regshift, 0),

This could use a comment describing what the property does.

> +    DEFINE_PROP_END_OF_LIST(),

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

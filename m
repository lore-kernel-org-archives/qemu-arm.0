Received: by 2002:a19:fc0b:0:0:0:0:0 with SMTP id a11csp157540lfi;
        Mon, 18 Nov 2019 07:03:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqxend6f52MpvrBKAEpQPjVmh0YnT1UyxE91tdKfVgWxu+9HSdiiqCvgUZhvD7hjZ0NqG5Cp
X-Received: by 2002:ae9:c30e:: with SMTP id n14mr24677858qkg.24.1574089435045;
        Mon, 18 Nov 2019 07:03:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574089435; cv=none;
        d=google.com; s=arc-20160816;
        b=JAd4KkvuwAXUTctxVY4EMRc5PdCrghgPdsbxDX2Al0gZejO3IFQ+yhz5FJPDBAm914
         svNWE5NkHZI/Ndhg5cBswjSlfpE+WjPcffnofQCFfRHKqUsCVEHO7DazNdeKvwwS5wav
         QTTmwHdRUUXnzcutvDPy+bquhsbQalQy0QQB2VET4F0GTmCFE5ZqgUU9ugA3kJD80XfS
         IH3H9JXbErs3H+gbWHSjkzoh2qAHa+WMoSQitynEEYxZfk+mCBrqF2LOMn+ybjCSrXSh
         vlBtMEWueFRvJlVxZM90UdtLSIOYjN16OlubxhkL/RiOEUFIvAZgdE7sdK3E5vbPsotz
         LIsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Kup+OjCW82IEaimKWKBPzaRe659Et8pbAD30ottMu8o=;
        b=gTOST/c77l6UhjS8P6/af++EjJ7ZDLFI/jaLLBKv8DQXBdcEYj3zRsySmOKw/kPs6G
         PWQ8kG/Abzsxo2ERiBCsVngD/+TobtFprSRNtnacCdNjhrWU3Fo4DWAKKN0oveZlAcRh
         h6Y/0k8+bE0KGxTONpuWVE03NKLWL1TT3zv8fIH4IM+i7Uwtg5lKtLvllTcX88LMGY4m
         fjtwgeNUELrv6RvbHslUrQSQMYPcveEoR2VwMmdMxBVvpxL0CukM/r92GK3kGhn2eLqR
         9sOy1tT9aJp9QCy+YdsuYeGduEmRzBbZZu0mvk8GWa+j8ldNx1TRiiGynOtHVDkHa76X
         67YQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KlRy++5I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d55si11438787qte.264.2019.11.18.07.03.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 07:03:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KlRy++5I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWiZG-0005to-Dd
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 10:03:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33675)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iWiYj-0005sW-QV
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 10:03:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iWiYg-00060Y-RF
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 10:03:20 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44815)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iWiYa-0005tw-Ni
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 10:03:14 -0500
Received: by mail-ot1-x344.google.com with SMTP id c19so14734236otr.11
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2019 07:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Kup+OjCW82IEaimKWKBPzaRe659Et8pbAD30ottMu8o=;
 b=KlRy++5IN8/ITrMOf28Zpi4o0LqKmUY8CMxprP1+L9tjaNA/wwy4EJPU52M/0xIMLE
 hCgr8y4GjXJyebzHiEQSz+CdiqB037e4tKsbHfEzjstyb/OMoz5nIlHKIWfRLFTwh6pt
 TmcYA6X6M7cV7S3uOKdtWPPFg2SwEku1B8+rpYqsZ9DQKGKP/UzFhTTu4bddGMwlwOvh
 N06PBR6SzbIKbGlyOROosRzF1rni/oHIKP4y3y0Y/gOAi9Sg13TEgrdD4zdynCicLm7C
 07Yv0c5J7wyXTq+WJNCRhls+PtB3MPntTDJWMAP/lRPHEdkYIyS4M6add9ocQEpPOjj7
 7lwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Kup+OjCW82IEaimKWKBPzaRe659Et8pbAD30ottMu8o=;
 b=WtirozyNlpzTpqIm27xs1vbvla/ZQqOnaz0bqUawScuVrHf0xGysyYD3AXvcDqtX5P
 gusw5yyJkUFbIqmzFggIu4Rl4JYnojirWBbnEDLaCef5qmbHxMr3Fh8WL4ybKW+I0I/B
 FTYo2wIoYntQDNhdpfpVA6gxf9+NMCGdHYHt7VvCOsLN+MEAx4fXUUxbj9dsh8m/aaeA
 nsECUgIHPblkYx+KW5oWYlnQ55M7fkiTdykXIHV2DEEzpSeIinh4HVwF/R0WhotwnwvU
 gqmjLiXm5InO476ehHQbf8aw6bgylzjt8v6zUeGMOblQIQQSv1qZBYHsTf3cSR/+ld40
 o0kQ==
X-Gm-Message-State: APjAAAU/gSXHjwiIY2npj4JsawMRVwhf0dLmzE+BqKhbep7KCcPVNsCI
 NSc8gzuFBZ/fJfzgO753EyeBaZohdjn/0k1kZnDEGA==
X-Received: by 2002:a9d:7ac2:: with SMTP id m2mr22878561otn.135.1574089390518; 
 Mon, 18 Nov 2019 07:03:10 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-16-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-16-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2019 15:02:58 +0000
Message-ID: <CAFEAcA97SUwPxcZq-5BQyPgb7geBsgu46dpc1zTj4gBGZ2WwAQ@mail.gmail.com>
Subject: Re: [PATCH v3 15/33] serial-mm: add endianness property
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
X-TUID: JuUbKCfOpf52

On Wed, 23 Oct 2019 at 18:34, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Add a qdev property for endianness, so memory region setup can be done
> in realize.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/char/serial.c         | 2 ++
>  include/hw/char/serial.h | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index c28cfc94fd..2f7667c30c 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -1081,6 +1081,7 @@ SerialMM *serial_mm_init(MemoryRegion *address_spac=
e,
>      qdev_prop_set_uint32(DEVICE(s), "baudbase", baudbase);
>      qdev_prop_set_chr(DEVICE(s), "chardev", chr);
>      qdev_prop_set_int32(DEVICE(s), "instance-id", base);
> +    qdev_prop_set_uint8(DEVICE(s), "endianness", end);
>
>      qdev_init_nofail(DEVICE(s));
>      qdev_init_nofail(DEVICE(self));
> @@ -1102,6 +1103,7 @@ static void serial_mm_instance_init(Object *o)
>
>  static Property serial_mm_properties[] =3D {
>      DEFINE_PROP_UINT8("regshift", SerialMM, regshift, 0),
> +    DEFINE_PROP_UINT8("endianness", SerialMM, endianness, DEVICE_NATIVE_=
ENDIAN),

Again, a brief comment documenting the property here would be nice.

>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
> index 759c85976d..2d0802a909 100644
> --- a/include/hw/char/serial.h
> +++ b/include/hw/char/serial.h
> @@ -86,6 +86,7 @@ typedef struct SerialMM {
>      SerialState serial;
>
>      uint8_t regshift;
> +    uint8_t endianness;
>  } SerialMM;

(The type-checking on the property-setting macros doesn't let
us define this as 'enum device_endian'.)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

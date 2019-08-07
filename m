Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6685162wrv;
        Wed, 7 Aug 2019 08:24:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzMD5Tncw8gMlDWNSerJvFMPJcDu1wi3li2ilV0HrN32Hu6ry0OzzidzXUE2KfWqGpFBLfQ
X-Received: by 2002:aa7:dad6:: with SMTP id x22mr10402545eds.122.1565191491369;
        Wed, 07 Aug 2019 08:24:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565191491; cv=none;
        d=google.com; s=arc-20160816;
        b=uJq178ClUCG9vhzMMsSM4HEfLrCz5TbRJDZB83x6dJoarrpZLzfDT6+zJaBeJNlW7N
         v8rilRUtvMiS0ownWC0U8QRwgOiX5BgVuQ61Nxeb+KI2dk2mfk+Db41pEGwkhMwpPRVe
         i+VpLGLXe0hSsexj8EgQOcKX9IBQiI1hboeHRY1kXykWRavcSoP9cGRyznxZeObsUlYd
         mshNnmrHncPGWziiONErESD/YgzOK+jscd1cZheoqiQpB7DbaQJRgb5FEWJNhK3qct94
         j+Yv4e/U/CSiFRD/LyeAqHqLKd3q3XtW90leekOCYRGe7CNi7tCECdDvXqjWH9iwdO0c
         75Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YdkekqoaTpJxIRdIwiyZhbH3wPAqKNGC2ktF0UKNBVs=;
        b=CHscMeactTkRC2KJwbgxZmz52V2ZBzABVGetH0w3GJOKgXlb3u/cZ06FsfO2S/ssXF
         svaaFqzWpfIV4dvHrDGDs+bNeU4EAKJrAA1vq8lD9i4kEMYvjejeBz2WUayspZXfu5aD
         EPI8xgRj+Q9FjpBHQaRu4MRqhVbK1IOIxmCvNfbidHBvNjtXU8l/M++t2yR+pm6ukSX5
         p6vz3Jq7YcjJup2baTJghGc+pvqz3Ei6foh3iOqULwCYFMBYyZ5aBNJmbwLVXOCx4B5K
         lCWXqgq+ZpIZoVgSicWhhjsZ3VB0qXlfTCvWFnZyfQh++Ekdp6BLeXEjYNt1jWQUittj
         cb1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=r6E6UjPe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c42si35223405eda.70.2019.08.07.08.24.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 08:24:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=r6E6UjPe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvNo2-00054i-Fa
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 11:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53160)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hvNnv-000528-Rc
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:24:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hvNnu-0001PP-NG
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:24:43 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:42324)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hvNnu-0001Ol-I5
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:24:42 -0400
Received: by mail-ot1-x343.google.com with SMTP id l15so105839524otn.9
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 08:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YdkekqoaTpJxIRdIwiyZhbH3wPAqKNGC2ktF0UKNBVs=;
 b=r6E6UjPeYTxu7lDh1PnHIGhkvyjHEuNLUpklCf2DrtvDLp31pth6VTRPs4hDn5uRbK
 BwQ23dlE93x0BEQV4xDgImr883j2gHnXPbrQQcTI2n+7TtzCegdcxkOt9MbetsaLX8A3
 kyCdAUSlKX+MB/U4bLd88Nc9wSbW9+uzq/P2uFT0qTvDT+rDDazF5tMVkDgNT0l3IIaC
 ipeFrqthO5vQ1dujfzsp79PdiQwvN5aSMHrkGRGWIFPwOQ3lZLPZiT85saisz9VOINdg
 eOELN7TWkN9j2KNbVIUcVu5bYXm8+gl1Ng9aK/0vDm4Tskkxy7XfcXLm2yV+SYqkCrZ7
 nn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YdkekqoaTpJxIRdIwiyZhbH3wPAqKNGC2ktF0UKNBVs=;
 b=ekkL0If9wm/5R0uOypSaR0QDNLQFzjauYkYzz+BamZXzyWlVkl+g+XQ2x3lawoUsWj
 PrVnmGdGT6QfmQnyhH06zBidAFgSx1CPgtlEBdgamCOsL6quD7i4QFparjX7JRmsJrw6
 jVqBWZxIF3HYVLH14Kq7Y4XEfIF9JaH62zuR9WpWNLVvCEvgaz980/IX30EBXA8dfvhy
 MUKYbwOP+WYVn15F2u0MRm28y9g7Y4J3gUCSq+NutX1JiTJki6vHmQp7XpaAYApUybmZ
 3vFg+zlwhKROeJROBPhyFLMb1Hs27rAbE1rAuDLV4mi97jg49I6YdKY4Mylqgl/B7k0D
 cixg==
X-Gm-Message-State: APjAAAXTlLgWAVRtafgckLz8delXvw5oh+5zNIxmXMp11iVghZdoGYOz
 0gMImdsWnkzh1x/3wkeccWv8AITRvVJucOiw429AEA==
X-Received: by 2002:a6b:5103:: with SMTP id f3mr9695959iob.142.1565191481717; 
 Wed, 07 Aug 2019 08:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-12-damien.hedde@greensocs.com>
In-Reply-To: <20190729145654.14644-12-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Aug 2019 16:24:30 +0100
Message-ID: <CAFEAcA-WPX153SSC-M6y8LLzO86GaPvxATo1hu4e-UzkH8MXRg@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v3 11/33] hw/s390x/ipl.c: remove
 qbus_reset_all registration
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
Cc: Fam Zheng <fam@euphon.net>, Collin Walling <walling@linux.ibm.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>, Hannes Reinecke <hare@suse.com>,
 Qemu-block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L0iyDwL+47k4

On Mon, 29 Jul 2019 at 15:59, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Replace deprecated qbus_reset_all by resettable_reset_cold_fn for
> the ipl registration in the main reset handlers.
>
> This does not impact the behavior.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  hw/s390x/ipl.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
> index 60bd081d3e..402770a2c9 100644
> --- a/hw/s390x/ipl.c
> +++ b/hw/s390x/ipl.c
> @@ -234,7 +234,11 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
>       */
>      ipl->compat_start_addr = ipl->start_addr;
>      ipl->compat_bios_start_addr = ipl->bios_start_addr;
> -    qemu_register_reset(qdev_reset_all_fn, dev);
> +    /*
> +     * TODO: when we add some kind of main reset container / domain
> +     * switch to it to really benefit from multi-phase.
> +     */

I think this comment misses the mark a bit. Here's my suggestion:

/*
 * Because this Device is not on any bus in the qbus tree (it is
 * not a sysbus device and it's not on some other bus like a PCI
 * bus) it will not be automatically reset by the 'reset the
 * sysbus' hook registered by vl.c like most devices. So we must
 * manually register a reset hook for it.
 * TODO: there should be a better way to do this.
 */

> +    qemu_register_reset(resettable_reset_cold_fn, dev);
>  error:
>      error_propagate(errp, err);
>  }
> --
> 2.22.0
>

thanks
-- PMM

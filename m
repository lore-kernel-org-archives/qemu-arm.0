Received: by 2002:a19:fc0b:0:0:0:0:0 with SMTP id a11csp199905lfi;
        Mon, 18 Nov 2019 07:35:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqyr6EHhQy2PgF9wJgU3j4+OLgx7uaGQ9xXjq8tQ+LWW0cKE8mLE2K/Mn3AcMUxi2z5n8ohP
X-Received: by 2002:a5d:6351:: with SMTP id b17mr15294611wrw.126.1574091308999;
        Mon, 18 Nov 2019 07:35:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574091308; cv=none;
        d=google.com; s=arc-20160816;
        b=zzgfPP2Xta5eAF9vjCFf12syDKNmCADMlC4l8h4ge62QctpFUA3QW4hB3fBCVx5aZQ
         iFY+Qe+tuOf/uVGByzeCYIVLNgE1Q5G7mYYm2zdIyKeJYNIIlu63mzWgb7q1LAPoy89z
         T/SI/NyIOPbvdMvlvxmDnsP0pWGaAaGCI6zWaHX4EH16u00NOJg7CkooDogo95hk3Lpj
         6R2wgaUU3nc7qq/0ZJtDGW6IEIUwLbfM223urwgRFrqCC4cuWKnmT6+tCn4Dgqp7rKbj
         yx1NXhvxUa+UIuYRv4h+Pezaiajd0u++eNZRH5TuAqfvINraVmuFcNg3mEGGs1xbeReu
         34cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=lFcD0c4XBd2VxlKYJhUQ7FMwh9UM1pbxiLuaAZ2es24=;
        b=n2CYdc0tORalI9qdU/Fov/iqgmjNymkyw7zGCPPQrcy/UGcEpjOiKx6X8Bqj9EnxNG
         0MoT6c3VGzfxESZmlLx2BP1h4vHoEHllDQM6b6HXwzcmvXLC/r5Gtucwiimt2p/ExmEG
         bLmU4tU48XKTnUFEBPIWDyGYqYvpvJE4AXpB6vG+vi8YWCcDC3RpQjz1ypom6SNq8aJr
         RvtqKHO9jr/n3DScsAbByP5pn919PxIm3/5NxhzC4AsnrZP6Ztdglf0n7/lWzhYKKlWD
         Y1jIKx3m98uLs/s31SNHYtGpIAYQg9T3RhhmbrNyG8fUGtuxjhG/K3uV5qwdTT0ucd8Y
         w24g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UPHMGIFL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id be7si11609347edb.438.2019.11.18.07.35.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 07:35:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UPHMGIFL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWj3T-0006ne-P8
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 10:35:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38730)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iWj3I-0006ke-Dc
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 10:34:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iWj3H-0005jJ-CC
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 10:34:56 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35924)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iWj3H-0005ii-6o
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 10:34:55 -0500
Received: by mail-ot1-x343.google.com with SMTP id f10so14870484oto.3
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2019 07:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lFcD0c4XBd2VxlKYJhUQ7FMwh9UM1pbxiLuaAZ2es24=;
 b=UPHMGIFLFrii9wDXK0ssxifqPC2W7RSbhjBdstsfKPW3KdiEcgJdk3TrtfQ4EitH0P
 dTJx9OWYXgnptDTRX3kM4pFfA+pNafwKJeCda/9mZoV1ydjmf1a5NnuuNTM8xtlxcPoj
 hno+Rwzu4Yt2zt+9nZ/+G6ohmsIFgsiVUZH1VGm2C2Uq3aFCp7lCKoUr9FG3kdocTR6O
 4kvcnaJ2t25XUEp4vpjyHIUdGmAvAvUOf39AFL9mNBGxLRIiirk+bPvuET1cYZOrp94N
 ZY+E+DlBNbJ+V/ooB338QuGLk6zhmHlz5jVLgiCVUHpNj6h7KBRmAHvzYMCwXs41KbC0
 /v2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lFcD0c4XBd2VxlKYJhUQ7FMwh9UM1pbxiLuaAZ2es24=;
 b=H+Hg55t28uB+mce/WAoF3ip0YbitDwNjRcMeGHJan72UNeYi+8lq0wGrHeyVTwS4ub
 IiQaGigiMrlts/ODGjl4K9qNHT1n5D/XDZSDXevpCPj7I2WCWXlTF+dxK2ofb0WCNT/M
 8WPNRfNhc1nD/tUAaYyvF+HAKepMYj0lBratC4EJBq1tyD13niwbrlPOLb991J4TF4hi
 6ObbLnIKM8ZFwVeJYixrJwVpEgohNGPQUrAdXVXRpAtnVfzrE97qjLtt3415AsYjfqNO
 UaP8zruWhNEsosrxCgsc9OyebpUzsaul0zqzZW7a9+49syob2SVdD8t8jP1UfUViSi/m
 hx6w==
X-Gm-Message-State: APjAAAUQ13M+4JeGldZnEtKYwKwZAVCN5qNwKRiqIyNk6N3w010QcRgI
 ODJUqyG8vUqCkBf1L9yBlU2QHvhm9dyh9JzDjGnLoQ==
X-Received: by 2002:a9d:7ac2:: with SMTP id m2mr23006601otn.135.1574091294327; 
 Mon, 18 Nov 2019 07:34:54 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-25-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-25-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2019 15:34:43 +0000
Message-ID: <CAFEAcA_R1Ne+H5k-PYEjqX+d7G55kZNh2QTxq2WN5bv1U3K=Ng@mail.gmail.com>
Subject: Re: [PATCH v3 24/33] leon3: use qemu_irq framework instead of
 callback as property
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
X-TUID: wKwmp4zGzmEH

On Wed, 23 Oct 2019 at 18:34, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> "set_pin_in" property is used to define a callback mechanism where the
> device says "call the callback function, passing it an opaque cookie
> and a 32-bit value". We already have a generic mechanism for doing
> that, which is the qemu_irq. So we should just use that.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---

This is probably a good place to put a comment:

/*
 * This device assumes that the incoming 'level' value on the
 * qemu_irq is the interrupt number, not just a simple 0/1 level.
 */

> -static void leon3_set_pil_in(void *opaque, uint32_t pil_in)
> +static void leon3_set_pil_in(void *opaque, int n, int level)
>  {
> -    CPUSPARCState *env =3D (CPUSPARCState *)opaque;
> +    CPUSPARCState *env =3D opaque;
> +    uint32_t pil_in =3D level;
>      CPUState *cs;
>
>      assert(env !=3D NULL);

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

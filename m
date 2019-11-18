Received: by 2002:a19:fc0b:0:0:0:0:0 with SMTP id a11csp105237lfi;
        Mon, 18 Nov 2019 06:22:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqyTdIfx23E9duBgrjYcwy/3TBODM+os3cPXPPG2MWp+X7nxozJwrzCeZxzitpFYELhjUG9M
X-Received: by 2002:a37:a51:: with SMTP id 78mr23968475qkk.112.1574086936782;
        Mon, 18 Nov 2019 06:22:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574086936; cv=none;
        d=google.com; s=arc-20160816;
        b=0KLgO30JDLG4UPyQUs7PdonMKerZhVSkjJ2sXZ1qZBHwokwP1jAv3YGHehXVpcdWdO
         DMUDNrZHC6wp6bqIcWTBg+o6DtxS6wB3MVL0zoHeOnql1A3gNwsADGVyG/roOp1Y7xah
         1mQcVjBnxjMhurGX+OOoY0CMePPgyYjTl5eGMIDheTDM3HOoyAN0T1jWNgwTMcfnKvf0
         SbYCXjmW62FhwuL8QvVQ8eZ0Q05+vacmiE0oSkTfOL/cLuZuTzYBVm7hIKXr7AEFUcND
         YpIlUph5Hah1bPZ4x7VIsRzvtpaNHFNe75usDLgDL5MLt2PD/YpmhS1u9iRUvpJ1JZFI
         pTkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=l93epJzFpah5Lo/MulLniiewH8jSfpIFwFL/5sKh+Kc=;
        b=rp0jmZQ7RJ8n5uw9wyvoRq4d0klsl3MFdt0PQxfMmkEQS4DKL/tcs6DaQuKcOMJUhV
         bXzGB8FGlTw67IMxRN8ATGAUrhign75YusKlHs0IIMsoFbnVdzEE/hmzEK4fupPcp/rB
         EQ7w1D85LqG4l0PCJFjFcjGwmm1pL+XRkI7tlvNyz4KHDN2t3Db7DZk5fU1Sa5rwysu6
         YSudfpzrQHcQ0O2ukvw3MIrPftz1ab0av/QTYQ43kgLc3o191TFzYAaq76rqJx6RbQTm
         b3bs2YF2LOXXYaie5yEMp1aVuuRmdj/XD++uJ3UCseV7NzwrXKTSzDAQ1hNKXNPIS7xP
         grWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EP6ovBvC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a199si10698338qkg.316.2019.11.18.06.22.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 06:22:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EP6ovBvC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWhuy-0001hP-3n
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 09:22:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54803)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iWhuj-0001g0-VD
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 09:22:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iWhui-00035F-S4
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 09:22:01 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:38426)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iWhui-00034b-Mo
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 09:22:00 -0500
Received: by mail-ot1-x343.google.com with SMTP id z25so14647261oti.5
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2019 06:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=l93epJzFpah5Lo/MulLniiewH8jSfpIFwFL/5sKh+Kc=;
 b=EP6ovBvCAAIrd3+bgy0sclgtvgfeFLigivyh+FkhqifJO6vm6XSBd3Vx89pL/KqR90
 u3GUboNWo80GsCYA8G5p1hUsXGiYjBKSIVk+n4r6M/DIE3Zv+Vcd+9IN35GHNnoPMhJN
 F2bo/f4M3D1r72/aShlpHDQ5/+Q7dYk2GxCsF+0PdRTETJ9YzM3EfpxdnTwrm/qY53J1
 cDUxv1js+UCrGb2vuPPEzoHoz9u8j0xSYsqkJMuMQ8PclohBX1VERtthUHkhS8T3abRT
 +9McBNPjpMJiy0TZp2rlfkqcMw2iEVHWcHdOLa5sjPAo+uNr8FWDdDKT17JZyJ6rHXMh
 xZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l93epJzFpah5Lo/MulLniiewH8jSfpIFwFL/5sKh+Kc=;
 b=mBemVQBq7Iu9rCQf9GgViUDp+uzVPhbul8AGGBpW4coFwmG4S8RBahIrjX0kqTjTqZ
 odHvKKsrLojWpeIZfMimND7NTDXWKOYQyjTZUlpiTudKxbEFRiDzsYxpqs7qG+CCnLvN
 4VIf+azOiVUkYLsgyu/wi72FdDpxR87Pa3npwrTgdDMyqC2jMFohuJvE1Iwzfo25OwlH
 v+Fn0F1bpsHKkl1OEw8tJr7LlIvuu/rzpR3LQNnKwW2J6w0kBSxS2sfG4BpKCCE7LAxR
 oXNekiO5iNezzTXrSqn0C004YWaAyrNiFbfX5udll7+9QziffheuTyINaHJZL0+mpJEH
 TZug==
X-Gm-Message-State: APjAAAVcM7QGMcp7EJqcw1mqLXwidnanSl+CzjtJr0NCrPrepOVmWftA
 HFKvnW59acosobpSB4sLlbQzQ9sjFZfxRyh6x7mtxw==
X-Received: by 2002:a9d:68cc:: with SMTP id i12mr8746oto.97.1574086919611;
 Mon, 18 Nov 2019 06:21:59 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-8-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-8-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2019 14:21:48 +0000
Message-ID: <CAFEAcA8GHqiaHSKdTjzTY_mWxYpDLZhXLYc98kjPGLUnzsG3oQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/33] serial: register vmsd with DeviceClass
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
 Paul Burton <pburton@wavecomp.com>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 Magnus Damm <magnus.damm@gmail.com>,
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
X-TUID: 8Qx86Kx5RX4E

On Wed, 23 Oct 2019 at 18:33, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> QOM-ify further.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/char/serial.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index c839035fdd..4af8b0ce4c 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -990,8 +990,7 @@ SerialState *serial_init(int base, qemu_irq irq, int =
baudbase,
>      s->baudbase =3D baudbase;
>      qemu_chr_fe_init(&s->chr, chr, &error_abort);
>      serial_realize_core(s, &error_fatal);
> -
> -    vmstate_register(NULL, base, &vmstate_serial, s);
> +    qdev_set_legacy_instance_id(dev, base, 2);
>      qdev_init_nofail(dev);

Did you test whether migration still works from a QEMU
version without this patch to one with it? (The migration
vmstate code is too complicated for me to be able to figure
out whether passing the 'dev' pointer makes a difference
to whot it names the state sections and whether the
'qdev_set_legacy_instance_id' suffices to avoid problems.)

thanks
-- PMM

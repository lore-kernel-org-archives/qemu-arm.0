Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1180626wrm;
        Fri, 18 Oct 2019 10:04:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyJMs9tTmA55+JoiGvgATOPoLReFh89xz8wAfkTArr0yC52CSkcSVXH4CwSDqHYD0M5w9LP
X-Received: by 2002:a37:98c1:: with SMTP id a184mr9156851qke.119.1571418271916;
        Fri, 18 Oct 2019 10:04:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571418271; cv=none;
        d=google.com; s=arc-20160816;
        b=G5RxMiw8NL1GcxTtcklDqS4fKfa9P0tucQMm3YGrGry2/1Y08hwZVt3t7s4AwFsFO7
         yRgXD+gCbAgfoEbFWZ7JZ2La1g7JTjEuSU71qZGLbhc9UCqv/0EFirZD1SQgpDnnk+kY
         FtbkUNgeh5/4qsRaQkl9ei8Vc7VoVDhBZ5HcopwJQUCDQ39mQLWHn1r0zKZwUO/gwaeR
         Z7BVFvaE4FvNgNuIqi2XBmrsVQd/hvp2Gixo8yt65MuyxQyfgTQYByE2/9FP6QjMeDrf
         J08N2sKpyVzbk6/MIhGFt7rp1/ZwID33M3fARHDdkIRzad5g3rtToRHEPTpu6qvXwslx
         /Ouw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=WVKvXy/k4bmcrnabZV01yHQR2X27eIY5N79+C3UM4WE=;
        b=oyeEABV6/xAuf80k9qq2tjSxyRrzcAmwbYz5uJVEmSFIapYmgAzcaJTDkbvNC08lm7
         8ergpwW4YjximfZyoMFI338ncBnNo5uX7wEhb38AlZKStbnnQEER70/ZQrCnZ2fFqMQa
         CgrtqXeUy1/V0tkKz1nmcX1NyQHM4vx94PM5lpb2OqasUrhGsOgmVDqNMQJDhKfQH+0H
         uDk3CyK1OQaWZughQuKmA51oXe0ayJKZ2+HZp8LYnu0X46r3Kq8hjkCejCXo1iKL58Dh
         HVyPpDjz7PnbZ0ZHkNJeJPcH+F+l+9EfkYYpzJXy/CL0xoMx1gsoksbTG1nnJguoQDu4
         mnIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 57si6544101qvu.68.2019.10.18.10.04.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 10:04:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLVfz-0005gD-64
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 13:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55569)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iLVfc-0005dT-L7
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:04:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iLVfb-0007nD-AU
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:04:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:16934)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iLVfb-0007mL-0Y
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:04:07 -0400
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 057DC693F5
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 17:04:06 +0000 (UTC)
Received: by mail-wm1-f72.google.com with SMTP id q22so2589776wmc.1
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 10:04:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=20VL07eZ6pVWeEvn8kJv/AgmnvUHrvm1zFQD1xroqRA=;
 b=hD2kB2wGPibawK8j+ZfZCXnPWj4JV1PRHqy0jvsmWVc+5jgVTcDO+5u/8P3Jj/boxO
 QeEyFqb6RkRtvqpfJnQtUaiv9+/e2m29R1Vp0cb3WlQ1wksX1MM6448xG+xXISjZ+WYL
 R1csQsE3ZYYjgC4rAYM3x/WkglRMrNUcgMDqjQ0z3PWTvTv0jBgmmcSQ/tFtedZwrdD+
 GgjiqBXW0w55DYVlpQCFV1waCJziCzKsdoBpEyaZStRRJy5oieDJMJwHAN3sKGLgJRhl
 oR7cMOqaD1laT2Qy9PfLVngq/hUsgs8/HtnIjLc9/OhW3IHJqIchWcvy9Hpzirvqywz6
 dd9g==
X-Gm-Message-State: APjAAAUya9EuTMvAI1infEjJKmKKeF5o7Uu/luki8pHyLskmGyag357d
 BcCn36/EYl+6eybwejWg9mc2ATcWVXEnCBBYWMMnBJiKpaBtw4W1DsrGWibB+TdRXmIYHqXqQew
 2Gsc9tS00N++D
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr8657941wrn.29.1571418244762;
 Fri, 18 Oct 2019 10:04:04 -0700 (PDT)
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr8657901wrn.29.1571418244445;
 Fri, 18 Oct 2019 10:04:04 -0700 (PDT)
Received: from [192.168.1.36] (14.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.14])
 by smtp.gmail.com with ESMTPSA id s9sm6805467wme.36.2019.10.18.10.04.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Oct 2019 10:04:03 -0700 (PDT)
Subject: Re: [PATCH 07/14] RFC: mips/cps: fix setting saar property
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
 <20191018154212.13458-8-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e13cbf70-e7a3-904c-f230-c42f75d5adbc@redhat.com>
Date: Fri, 18 Oct 2019 19:04:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191018154212.13458-8-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Magnus Damm <magnus.damm@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bux2I5f7iGsX

On 10/18/19 5:42 PM, Marc-Andr=C3=A9 Lureau wrote:
> There is no "saar" property. Note: I haven't been able to test this
> code. Help welcome. >
> May fix commit 043715d1e0fbb3e3411be3f898c5b77b7f90327a ("target/mips:
> Update ITU to utilize SAARI and SAAR CP0 registers")

This seems a MIPS feature that is not fully mainstreamed, I suppose we=20
miss the DSPRAM patches, see:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg638373.html

This code is currently not reachable:

$ git grep saarp
hw/mips/cps.c:98:    saar_present =3D (bool)env->saarp;
target/mips/cpu.h:1103:    int saarp;

Unfortunately the author email is bouncing:

host mips-com.mail.protection.outlook.com[104.47.46.36] said:
550 5.4.1 [yongbok.kim@mips.com]: Recipient address rejected:
Access denied [BN3NAM04FT027.eop-NAM04.prod.protection.outlook.com]
(in reply to RCPT TO command)

> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/mips/cps.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/mips/cps.c b/hw/mips/cps.c
> index 1660f86908..c49868d5da 100644
> --- a/hw/mips/cps.c
> +++ b/hw/mips/cps.c
> @@ -106,7 +106,7 @@ static void mips_cps_realize(DeviceState *dev, Erro=
r **errp)
>           object_property_set_bool(OBJECT(&s->itu), saar_present, "saar=
-present",
>                                    &err);
>           if (saar_present) {
> -            qdev_prop_set_ptr(DEVICE(&s->itu), "saar", (void *)&env->C=
P0_SAAR);
> +            s->itu.saar =3D &env->CP0_SAAR;
>           }
>           object_property_set_bool(OBJECT(&s->itu), true, "realized", &=
err);
>           if (err !=3D NULL) {
>=20

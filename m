Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp835390lfg;
        Thu, 20 Feb 2020 09:56:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqytRhDYe6hmKsoEOEPykLnRS8w7b/I3gp6VBQxBrtRjILjwSiblpg/fVqZ1kcOEYqL+NSBa
X-Received: by 2002:aed:2ac5:: with SMTP id t63mr26780724qtd.315.1582221418922;
        Thu, 20 Feb 2020 09:56:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582221418; cv=none;
        d=google.com; s=arc-20160816;
        b=myImPHx8am9+ZGTJNEEPWSv5ESZB3bsY87TVN5vaLS+GYAEmAigbJOsYYZP6k0Xuib
         eqPbpEu2opM5HmMfndlC78soips6tco5Fr9Haof1LXviLAFw287Tm4Kjof/FsYPijvQ1
         S1snSsL4F0nDTDjTHaOx3DUHfo7psGpJPBuqf7YiGGPyPl/mnSsSpi54f2FDJnBgCtBe
         zRHMctwqvCVrpUNWT015fJP/uS6UEj7o/VauCTRLEOtYH8fKysjSd1gpuE8pvecxH9aZ
         sMzp6ZS9Mqr7gg/UhTx5t2rZREHBfSUfagq+DU9FtA8+N3waMXea9SyB287O7muze7f6
         lscQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=aTgTw/kLl0fBctrw+cPBCDKisJ+8JE/FiweQ50VxrGk=;
        b=MKFikf5vGZGwy2zzCoc1X4FvMbfd01X4JW2rBrmEUVbe6X83CnSr8mYhsFbpznJjT5
         holJ4rbF40nMa3tHEB0aZSXptvFOcXTIkrf3L5HQl464u+72OP7mhEXP9ih5nAoNpj0N
         i6ruYK/UvDTp3ue1OhPti9fw29SuA8u4pfQAJ1lxtCt4EzMv5RrlgxlOnLfkuaGP0zrB
         7PI+9KcgnZ0+WBgf2qsHfLx5shqermWlTjaLme+LgY/I4jiqa3K+Qq3etIBa1vDmnimk
         GXpcoaFajkNJ7GEbId3EBgKaRz1i1ShPKyc7ceLPV4Whe2+7Oa5IzId8QdyDE8Bpkj5i
         bk0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rrAZdKmT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w23si130761qka.223.2020.02.20.09.56.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2020 09:56:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rrAZdKmT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4q4I-0006AB-Bj
	for alex.bennee@linaro.org; Thu, 20 Feb 2020 12:56:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45004)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j4q49-00068Q-Vb
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 12:56:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j4q48-00056W-Vf
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 12:56:49 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:37149)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j4q48-00056G-PK
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 12:56:48 -0500
Received: by mail-ot1-x344.google.com with SMTP id b3so3305772otp.4
 for <qemu-arm@nongnu.org>; Thu, 20 Feb 2020 09:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aTgTw/kLl0fBctrw+cPBCDKisJ+8JE/FiweQ50VxrGk=;
 b=rrAZdKmTvKdn9kNyhbIOtgWv70ftOWuZdxuxuVt372yTLlhh1qt9cJm5R9h4oR9p/T
 Do1vkKPtQ8cQ7Pucgt2HAo4zdzyyGWiOBiBnSG4hT8ZYuBX0f9y9lVyR9/YrwShzHEBt
 QoylH9H0asdR+8NkkHlbtFsPEefC6VeH63hZuXCXa15uJsg7jnG1QyAG51d33wIZTLLq
 ZwV5yULerVJF3fG7WD9556WOrDnm4t9J9FXkuICiry5AEjrH08QJowPaxotJAq7J7+Kx
 N2w+boJ1sd9OQcdAs0GRY2iaS3xs8RsmHAQu9edPL+Obku9nbPjklvHaC6WmPe2u/C0f
 4Atw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aTgTw/kLl0fBctrw+cPBCDKisJ+8JE/FiweQ50VxrGk=;
 b=TwxWfM59p6uYkSaaOJTF7mEjOQhtKGo9qs8AnQuHzAyUOMGNEGEoaWTwuQCRgKUZnA
 KHNUrysjd/E4dRQkMQ2Gph1hwdnxvv7IU8EBi0A42LtAs3WmZsEj2QWwC2edo6BfQoLf
 qt4i2fbDWC5O9aDi/iLFdFnB7OTJteeovSda/rMzzVeRVCR2mEDT8AQMRG+rK/dCfkfd
 H/uhUL9Hjf/TQqEKpRwshf4B5Y25rT4f8KGf7O1TYzyClWwXW+1pG2OOTCE/7uQCDoey
 4qcqi1y/gw/yRngf3Fo4JejKk7g0p4Q90Ex5xQQmjgdpgO6z86v3qp6XZ/GQnxtvfrUx
 DElg==
X-Gm-Message-State: APjAAAUBbvUxX+H28tHhhIGkPu6VQ5444uPWuFyJTkoTe604vNEDdtQB
 vimRstr0e/2Bn6647Q9RT/cyrnbwiba8jcJyT2utGw==
X-Received: by 2002:a9d:68d9:: with SMTP id i25mr12483446oto.135.1582221408022; 
 Thu, 20 Feb 2020 09:56:48 -0800 (PST)
MIME-Version: 1.0
References: <20200217032127.46508-1-pannengyuan@huawei.com>
 <20200217032127.46508-3-pannengyuan@huawei.com>
In-Reply-To: <20200217032127.46508-3-pannengyuan@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Feb 2020 17:56:37 +0000
Message-ID: <CAFEAcA_AxCVaAgho3g2q=kCifSdhz9Qi72eoVAM9gRjb3-_Sog@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw: move timer_new from init() into realize() to
 avoid memleaks
To: Pan Nengyuan <pannengyuan@huawei.com>
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
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, mav2-rk.cave-ayland@ilande.co.uk,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Euler Robot <euler.robot@huawei.com>, andrzej zaborowski <balrogg@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RnH1AhY/ENxB

On Mon, 17 Feb 2020 at 03:22, <pannengyuan@huawei.com> wrote:
>
> From: Pan Nengyuan <pannengyuan@huawei.com>
>
> There are some memleaks when we call 'device_list_properties'. This patch=
 move timer_new from init into realize to fix it.
> Meanwhile, do the null check in mos6522_reset() to avoid null deref if we=
 move timer_new into realize().
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> index 19e154b870..980eda7599 100644
> --- a/hw/misc/mos6522.c
> +++ b/hw/misc/mos6522.c
> @@ -465,11 +465,15 @@ static void mos6522_reset(DeviceState *dev)
>      s->timers[0].frequency =3D s->frequency;
>      s->timers[0].latch =3D 0xffff;
>      set_counter(s, &s->timers[0], 0xffff);
> -    timer_del(s->timers[0].timer);
> +    if (s->timers[0].timer) {
> +        timer_del(s->timers[0].timer);
> +    }
>
>      s->timers[1].frequency =3D s->frequency;
>      s->timers[1].latch =3D 0xffff;
> -    timer_del(s->timers[1].timer);
> +    if (s->timers[1].timer) {
> +        timer_del(s->timers[1].timer);
> +    }
>  }

What code path calls a device 'reset' method on a device
that has not yet been realized ? I wasn't expecting that
to be valid...

thanks
-- PMM

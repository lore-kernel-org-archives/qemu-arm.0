Received: by 2002:a19:fc0b:0:0:0:0:0 with SMTP id a11csp78039lfi;
        Mon, 18 Nov 2019 06:03:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqzpGTG87ySEXdLGVTGtTckvTg5WCsFrjwgRHEm2aJGzxtzvwdY70NLJSH6HOKQv1ux8C+ED
X-Received: by 2002:a37:a406:: with SMTP id n6mr24918500qke.308.1574085780701;
        Mon, 18 Nov 2019 06:03:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574085780; cv=none;
        d=google.com; s=arc-20160816;
        b=X/ViNTl9bl+NadO/3mcDg5ng6A+X/FYOtol5D0SrNZz3Qeh2mh2AYJr6HxLdHe6jIG
         NpTm2v/gkvaxWPiN0I+b/5tUNYewKH+s10BnDZlxbY7QW/TAmwtJRvbdEk+aWBg8Se6y
         sOwcTvYVYnyH0KVPQye4s4mCJw5SxBlZ2a2Fy2dVXQ1QQbeGILBx9uWJiwMdJuJhJiNo
         EDvLS7bAvzpEaK0maWq6UdKaDYfCVruUO+nv6p7bH5Tab0h+a4aSQH3mxDxXHtgcO2TI
         QYVl7GD1TBqzzZBFNwYjAak4A+Q0LYnirURTMx6lJCf3AFFCYiflwmI6Sqv6vQ4KCMs1
         FWgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=/T65KmuUv9KdpGF5zOQDRozywkHbk0CrYcHeiYnnPBg=;
        b=lpmINdSAYqIlJjGCRL4DVNRDxcqCEeTsZfZc727hk7u1E6FqyzP1ZrfbSz3CjwnRD/
         JHQ+GDU0nsziNA8ne2Jhb2xAfwd1jZARMoYfLnLeN+Ec13IHAh4i9CgrBvbZiPvrxuDq
         6/VnPguc9ejAwOJEVVoz6Khu6CtfCnd6O9T5nS+PqrFbdK6l2TUCaO9Vx3TyFx7e0QeB
         KbZIUEv+AhpL2KT2+xBOr23JpOrj3SYFpqMLK6aN9KaoEnevzDVEWbyHSJEvdtJz/MlY
         6JkMRPWnkA4yS2ilNBMiGOjQPkPeCr5yyTC6YgpEz6AE2DnS7K7Fz4h00Ffv3bYfG/oc
         uhEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DfGPNMW2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 137si10999413qkg.323.2019.11.18.06.03.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 06:03:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DfGPNMW2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWhcJ-00005c-NT
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 09:02:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51432)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iWhc6-0008UQ-FF
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 09:02:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iWhc5-0003z5-Fj
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 09:02:46 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46505)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iWhc5-0003xs-9V
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 09:02:45 -0500
Received: by mail-ot1-x344.google.com with SMTP id n23so14541004otr.13
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2019 06:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/T65KmuUv9KdpGF5zOQDRozywkHbk0CrYcHeiYnnPBg=;
 b=DfGPNMW2gRBbzB0k4kr56zhYtd98ylHty1567A2VSisu/DJBsOVweuUK0gI3dNCbDM
 CRfs4xMG9VtoEpfhP9F2lgkGl4h8pY6xDiFYS4o0a+NwEIOub9RzQ0Bkw1uQciwjuMTS
 dgIWDFCLY4qvy5IoLGb8dR2BrV3y/2pvELKHbixWCkYPlLr3ybRJW0HByrs0j2ZGRaVv
 EUF+McO0FVYSlfO7RCM5H8eO1Dfc9UieUSPg2IpzRwCbBIKfepojh+W5Tkx63EU2smef
 xlibInvSG5SlvKg6nRc7DD7lOfrRySKnKF9NisrlX5GdMbYgfsVIREPyATxMJsQrKb7r
 7IxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/T65KmuUv9KdpGF5zOQDRozywkHbk0CrYcHeiYnnPBg=;
 b=aTgeD5nXaTOnjRrAekc+bVow0SEE8LkbRRfkv/emVuGFy5DzCFK1mZZ5FjwAiNNcVj
 fYGK8IOLPmg19aBX8mCAB5eNVWe+LVRYGcd8vicjXJGcF6WKIqcwmSTEKzbb1J7iW4Mu
 Pu6Sdd/tgjhCsb2+iJaHWx0IpE+72jCMjQ13xpx2RKbY/+e52hEmqXY7/Ac88blAHxg+
 iQOmrkDMPNdmfndkm9Pi6qsEMDkXyl8l8g31Sqyjc7gPItN++GNV2FCSFupAbmVL8LGA
 4u5+cf2TF9xGhsEouPrzatnLYJtmfv2/tKLBsuG+v1gYyzO85s4jEcr2sBYXTC59gRDE
 8KJQ==
X-Gm-Message-State: APjAAAW3YtC+XWP/97v35Ng9y3Q/w2Y7rxkYGQ3Sec77wtEwFi8dw8Zm
 hyhbIJB6IfdCKNHpEoRbv0wiuNIPa3VyBXWjmsGrpg==
X-Received: by 2002:a9d:68cc:: with SMTP id i12mr20742749oto.97.1574085764633; 
 Mon, 18 Nov 2019 06:02:44 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-3-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-3-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2019 14:02:30 +0000
Message-ID: <CAFEAcA8q7AHR2Azsy9C7_xynoGVtbX+nRPhJaq4iiu6krvuDiQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/33] sysbus: remove unused sysbus_try_create*
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
X-TUID: 3wlqTkzrXY9n

On Wed, 23 Oct 2019 at 18:32, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/core/sysbus.c    | 32 --------------------------------
>  hw/i386/pc.c        |  1 -
>  include/hw/sysbus.h |  9 +--------
>  3 files changed, 1 insertion(+), 41 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

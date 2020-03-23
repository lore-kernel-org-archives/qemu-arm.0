Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1630770lfi;
        Mon, 23 Mar 2020 09:06:29 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsZ4tVJL5LQ8TedDxUmLq6JVrvLVY0744ZRVtEMS4+4uIpG/iXcVBteA8Dc/6ITjYo78Tci
X-Received: by 2002:a37:d285:: with SMTP id f127mr21573766qkj.107.1584979589316;
        Mon, 23 Mar 2020 09:06:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584979589; cv=none;
        d=google.com; s=arc-20160816;
        b=ck/zhVg1p4IlzH7S5LxXhb2b7jB0amOLkeS1d+mJm1KEpaNxKP4lwscxXV7sqJYLRF
         EuI+qEk2EUJNvmUxM4L5rEz9BpDKwpoa2CDBbQu3mj5HZYEzel0I+UMovE12XYE+/Srn
         5PqbKPi7QsGYoAZ0w2lMFOiRqy3Yznp+s1ACtxF9Iqp8fUphmJ8eaD3piySU97aQjtMr
         Fn6QrtWxtzbZ0l4o3OW5QsQ4/oTRWtG0+1M13A/vOprLfOUjEY3ARyR7gGAnGiVUw/4i
         v+uRjxX1gDoFqXy/AlFC+R3WhKF6dVfeRqXrqf27dNagYv5df/vUDE5SKpadGAW+0ZvW
         XnzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=fsrpN92Ba+Aa9m7v+VX26eF17EC615gTnf9oEpSQUIo=;
        b=jHVVT+miKPFLxCG2lbpT4H0K9jB5wLPcIooQHL1KX5D3dKl+ScDFOAyucwtYEoFv4P
         P7+UAUCYnLsYDff80P9G49Ty363/WvrTUhg5X7wZQJ/PQzb5fQYuwoKZbQybvagZ7Nmj
         ncakBgn0YWMoGQZre9yrkYYc/DyBLI53IuA0AcrHPSOQMAVbu+Pb/uSQYM0h54iJGTdR
         Vi/iQOs8EwJzF1G21CJrW0KNcHRiVvYFgSM/yffFkWECrkxBsebaAl+hF5OvIcSf4/9D
         vTF1mrKHvM/sg33wMQZTRcW5MROl2hsca45/LEdHp5+T0Yruj84q3djStjXWFA1YPRmn
         PzLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fIta0b3W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y185si7949824qka.96.2020.03.23.09.06.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 09:06:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fIta0b3W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGPau-0004aC-NV
	for alex.bennee@linaro.org; Mon, 23 Mar 2020 12:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60583)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jGPVp-0004aG-As
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 12:01:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jGPVk-00063P-AW
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 12:01:13 -0400
Received: from mail-vk1-xa41.google.com ([2607:f8b0:4864:20::a41]:38267)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jGPVj-00062g-HI; Mon, 23 Mar 2020 12:01:08 -0400
Received: by mail-vk1-xa41.google.com with SMTP id n128so3933163vke.5;
 Mon, 23 Mar 2020 09:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fsrpN92Ba+Aa9m7v+VX26eF17EC615gTnf9oEpSQUIo=;
 b=fIta0b3WQ2+spUBaLKMDjsMq+ianR0y/AIw+47jDyDVL6A/UGtUSbq8OkKQgtjFnQN
 5AclorZoxpOXULKGAmLOZabYemG9EtaLb/JNxTaeB88Nw2Wy6Bc2OORWs5EVhsGH55k2
 gOh8cqIT/b1VnJnhNCRXW+bNVqwIZkY5Fji/T4sBBhZuuJpBYTI4jccp5nqmguMmyhL6
 OIcW4+2D2E8ITTHQ9Vj25x0VEgjZkIhxSzCVOGZAzSGhqC12Zkm8/MWdkp+AEO4HEMCY
 ShwcqgwNxSighXJKnfVznmXMr9q/cfLswgxB90neJHcW+FGm+4oB2T/NFFeS0mewVpOm
 49Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fsrpN92Ba+Aa9m7v+VX26eF17EC615gTnf9oEpSQUIo=;
 b=AfnOmTb5MxPvs9JMstEKRt0hA3gspk6JV1BPgxF5fI1xJoUlnL5+H8gog5opERcqjZ
 ACcr49WR/s0F8vIzcgNwQ/Gq539WKmewIJ7SAWDPgZrvcDfQ+q+xriTk2AqjTYj/yEbz
 EXsNZkM+uRiH59kFkAu6eeXixUsu/Virt8yTTmkzNdxLz3D3q9kPW1jrqF92Q2SN/yWQ
 YfiB0dlBAXYVe6eZecoqIvUVV0VvqfnoM+Gb6ayEqBo/EY6wX8Yf5BRfDz5aSqznj8fO
 k99qBJfL/Rghc5knXv6rG/8MVNCIa4BmWYCyOHI05pKAewZPMqYQ8PGdUnOY+j178sWI
 bZlw==
X-Gm-Message-State: ANhLgQ3dpY2BCYITY4Sw0cTb7bqO13kRG7sohfBo2Cko2weGMVw8Xijo
 7C24J6NrlkEvkG/9+ZatM+L4Qag7FvOtIxrrHJ8=
X-Received: by 2002:a1f:a2d0:: with SMTP id l199mr14863251vke.77.1584979266742; 
 Mon, 23 Mar 2020 09:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200321144110.5010-1-philmd@redhat.com>
 <20200321144110.5010-10-philmd@redhat.com>
In-Reply-To: <20200321144110.5010-10-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Mar 2020 08:53:09 -0700
Message-ID: <CAKmqyKPa-zc949L=G3gCdA50KQq0GbhE3zqoOTjTatPnsm5Oew@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 v2 09/11] hw/timer/stm32f2xx_timer: Remove dead
 assignment
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::a41
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7ZQ/uxYJmpvZ

On Sat, Mar 21, 2020 at 7:52 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Fix warning reported by Clang static code analyzer:
>
>     CC      hw/timer/stm32f2xx_timer.o
>   hw/timer/stm32f2xx_timer.c:225:9: warning: Value stored to 'value' is n=
ever read
>           value =3D timer_val;
>           ^       ~~~~~~~~~
>
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/timer/stm32f2xx_timer.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/timer/stm32f2xx_timer.c b/hw/timer/stm32f2xx_timer.c
> index 06ec8a02c2..ba8694dcd3 100644
> --- a/hw/timer/stm32f2xx_timer.c
> +++ b/hw/timer/stm32f2xx_timer.c
> @@ -222,7 +222,6 @@ static void stm32f2xx_timer_write(void *opaque, hwadd=
r offset,
>      case TIM_PSC:
>          timer_val =3D stm32f2xx_ns_to_ticks(s, now) - s->tick_offset;
>          s->tim_psc =3D value & 0xFFFF;
> -        value =3D timer_val;
>          break;
>      case TIM_CNT:
>          timer_val =3D value;
> --
> 2.21.1
>
>

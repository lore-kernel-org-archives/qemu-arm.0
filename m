Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1510703wrq;
        Wed, 23 Oct 2019 15:40:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwlBBmHuVlr21NVareozsvBvWawBAKpu4dqQanSsohFHt5KTrqedUMQJfBGvWn30D7iXjHV
X-Received: by 2002:a37:6212:: with SMTP id w18mr3966308qkb.204.1571870435819;
        Wed, 23 Oct 2019 15:40:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571870435; cv=none;
        d=google.com; s=arc-20160816;
        b=yS0E0E5nIGatTU7xnDc5rMv4vqEB35ozdOqfZVg86SF8iLdk9fNZ0M2Wec0xVs9BuX
         TUn5iFPKeyXloYloD/LcnvrJgPsM0SwkhaWGnM+grp8DlQUlAFD11EkfnDeYTVqWTJMh
         RNzLRdFOHgwKtq33YblK1xCAyjKw9gSe1B6xSZMRQFYVn1yk6wI9fPHZKXuIp6mJYmvu
         dKskOosL2iOWR8SFvcvnP3bSq31l57jLvLUa8F5v+cPOoLwakHroolU+UAPbzaxiw10e
         rUAmIdzEeK9XYqlph+DhNMd8dLGciV/VURoaPE6QqulBTQgNQVk3dYANYhqqV97VFzhm
         a+Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=6PFIMtA+ZheRka+1CbW7a1NPvEEK7CmhJeUNG0fNc0o=;
        b=CbZX1Bs8fZ6aqoIXoMtJe7hcaDlcbhM6LYo4fMFrP97naKafbNOSClLLrFG0BzR/x5
         L+l8dGz08Rx8PHIJ3drPg2mhLkHUueZjRdfz/8wjloqWf2PMTrni76WAg7H2F10Mq0S3
         j0WCIh8pCFmYmrF7SvLB88ZqJSzaf8AosNCsjiPnSo7mBKlqsQuntq/2Nd9f1dkg0GUp
         5XSA8t7WK7tb1QyzAJ3/mb/rh+j8p2dEqluv14z7yDX6DMvrnIu2EAUyI3JFYQJU5mi+
         olk5PmKcHQVvDZqtgt0Ol1wcKUxxNH45m/SRbhdMAtaxbniYo642QOiaouWxdjjieXSr
         3ebQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k88si20213323qte.149.2019.10.23.15.40.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 15:40:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNPIt-00022w-R7
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 18:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57705)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iNPIc-00020E-G5
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 18:40:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iNPIY-0000L1-My
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 18:40:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38394)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iNPIW-0000HC-Mt
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 18:40:10 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5602D3DE31
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 22:40:07 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id a6so8933137wru.1
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 15:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y50bH1dlPq4kc/K8E41rdMkHO6I3Jt/+zrd6imb4awE=;
 b=bGZgxUJcZ0vsdcfsU311Y5siw4pSo1KNfhEpsmrkti6QMQSfoTmBnqgeWt+h3wrcPi
 4+oiFMhPE00GqN/x1kWlHOC9bU46yqqx7TcOuKpqFM7Y8BYFDrULWf5cjHSvjyWgGJS/
 IG1h3xvKxI+NR3CfBRa45a3ALSzKIAT/bU1kwXmnqeb/YEofq5ntPxkQqTQC5cMvmDDQ
 tytek5g4dgkz+W8mjoLQCQ/zTjoi27MZHPS6fUXJiMQ7VjP3nsTEY2DQiIujxjEhasy0
 vSix1+wvaJVUUAlcT7MeoX5/093ySwNaykb8TDeYQYIcTXG74vPi2X7lqkQjN6ytVPtL
 LwWA==
X-Gm-Message-State: APjAAAU3bzijjYeQraZwdqIE1ecgsedGfQqnNBlE8yBnImVWy8YDsDHJ
 /TWXuLaod8FVP8O78WnjViXjxLvdxsmQEETGop9OxlPscmsj2YMTpgzzYqzmXz8badmCRIyvlmx
 p2ZrWEts4EV01
X-Received: by 2002:a1c:9894:: with SMTP id a142mr1901880wme.70.1571870406103; 
 Wed, 23 Oct 2019 15:40:06 -0700 (PDT)
X-Received: by 2002:a1c:9894:: with SMTP id a142mr1901868wme.70.1571870405923; 
 Wed, 23 Oct 2019 15:40:05 -0700 (PDT)
Received: from [192.168.1.41] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id 79sm954560wmb.7.2019.10.23.15.40.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2019 15:40:05 -0700 (PDT)
Subject: Re: [PATCH v3 09/33] serial: add "baudbase" property
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-10-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5e92433d-f9a3-72a1-3792-4bfa7cd16b01@redhat.com>
Date: Thu, 24 Oct 2019 00:40:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191023173154.30051-10-marcandre.lureau@redhat.com>
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
 Jason Wang <jasowang@redhat.com>, qemu-ppc@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabien Chouteau <chouteau@adacore.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Burton <pburton@wavecomp.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K5onvKg+5vma

On 10/23/19 7:31 PM, Marc-Andr=C3=A9 Lureau wrote:
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/char/serial.c         | 5 +++--
>   include/hw/char/serial.h | 2 +-
>   2 files changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index 09e89727a6..069d8715d0 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -988,7 +988,7 @@ SerialState *serial_init(int base, qemu_irq irq, in=
t baudbase,
>       SerialState *s =3D SERIAL(dev);
>  =20
>       s->irq =3D irq;
> -    s->baudbase =3D baudbase;
> +    qdev_prop_set_uint32(dev, "baudbase", baudbase);
>       qdev_prop_set_chr(dev, "chardev", chr);
>       serial_realize_core(s, &error_fatal);
>       qdev_set_legacy_instance_id(dev, base, 2);
> @@ -1002,6 +1002,7 @@ SerialState *serial_init(int base, qemu_irq irq, =
int baudbase,
>  =20
>   static Property serial_properties[] =3D {
>       DEFINE_PROP_CHR("chardev", SerialState, chr),
> +    DEFINE_PROP_UINT32("baudbase", SerialState, baudbase, 115200),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>  =20
> @@ -1070,7 +1071,7 @@ SerialState *serial_mm_init(MemoryRegion *address=
_space,
>  =20
>       s->it_shift =3D it_shift;
>       s->irq =3D irq;
> -    s->baudbase =3D baudbase;
> +    qdev_prop_set_uint32(dev, "baudbase", baudbase);
>       qdev_prop_set_chr(dev, "chardev", chr);
>  =20
>       serial_realize_core(s, &error_fatal);
> diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
> index 180cc7c24e..3dc618598e 100644
> --- a/include/hw/char/serial.h
> +++ b/include/hw/char/serial.h
> @@ -58,7 +58,7 @@ typedef struct SerialState {
>       CharBackend chr;
>       int last_break_enable;
>       int it_shift;
> -    int baudbase;
> +    uint32_t baudbase;
>       uint32_t tsr_retry;
>       guint watch_tag;
>       uint32_t wakeup;
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

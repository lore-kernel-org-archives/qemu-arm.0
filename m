Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1507064wrq;
        Wed, 23 Oct 2019 15:37:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwN6Mao1Zjmf7x5hZzJIqAa71ow9ToInNI6/m+KUVVGxHHXjoFrAoP6EwimDvmilfZ+c37v
X-Received: by 2002:a17:907:213c:: with SMTP id qo28mr20589447ejb.43.1571870242180;
        Wed, 23 Oct 2019 15:37:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571870242; cv=none;
        d=google.com; s=arc-20160816;
        b=RD0ps6iHu/npp89jC5N6bwJKYrqnsyMLzROCy6vay7mq/0cQ8RogamVy9k0nC6l+5Y
         AkxpBA5oSJto5fOUuWT0N9zt7ibx1m//pPz9cgRqH6nUo46RXNdg9KGZVn4M6aa+cRxK
         C3sFbNpXdjd8b5vQMygmck6Gm6VRrqoKZQ1JfKnptFA7VitmelzXmgVdvLTomco23CZF
         UkoPKz+nRbJH/rQMSdBF8VRQ4hVMgtrc2IL71vuQEMBbV68l2hd8wnUpssqHdvTlGHlD
         qq+mqjp9zDqjUG4d4+O2bEqPHHOlQyyqXxHUZF+LwEsHpY2qXGLhKyPzJwdSqqYUhyn0
         sg6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=7Sse0EKSvHgKNL9YFWH2cMe8M5pJxWLrP7H1VnWzISc=;
        b=P3rpIVozOaz358XctjlkJq5l5F3/Kp11bS8Vndj92qw8crBXg896hdxTghtGl5+YQR
         YLBr+E8YNqLAkbyTORJM0P9RLSOlyQYKNn7AnXZpAeCVdvP39Q4BS9XK5IkC8zpWxB1W
         BX9tHjhiD96EDbb4d2uV+BMiqfvuvnTs+b4TWlC47n8BhYoGQ54sYrNCDNdWfKMh18mC
         /Wbyu/IKlnvR3d7+ALHOSzz/qezHJmb4xd2pJGGVXN0xZ1KY6PA9/v63AedQrPbjzocM
         Waoi/IKDjCuxbtfOU+pWXzfe60Q8kQP37NFjFuESDTEBDosvd/FmkGUx0zYXMBoAYrwH
         ITzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s21si11036644edm.311.2019.10.23.15.37.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 15:37:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNPFp-0005ct-21
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 18:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57190)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iNPFa-0005XR-8h
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 18:37:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iNPFY-0007ZA-8h
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 18:37:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55606)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iNPFY-0007Yn-0A
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 18:37:04 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1F92D4E919
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 22:37:03 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id i10so3660081wrp.7
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 15:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bgWeqBVMk+gZhXCPpPyJ795Ly2kNdj/BZXQC2iCRw1w=;
 b=CAndwX+T7MyzqyHLaO1V7CJ5QqrhYRVSNQprjUgc5pu7U54bTusdE0B/gUUUKMOI52
 ZkYctLxOuIZb2da+rYtxCzTQIfYEPdQQgbzP6AW6LYAkOYrqcAUmYt/GPCHUa7BTR0u8
 JquZ/Zm+1/g1FyRcLStKiVCNkji0yhHHLk5Ippcj0ix2yrdReJbLWOR5ymzmvVAtaSED
 NjqNy/2BCeei89w1sKZnM7Rv2aVqA3XxRdMtaUOyyw9pk00nqqer5QHO6lM9mafRQTB9
 inEvsNACM70qiV2pmcvFQbgyqh1bzOVAr5ixWxH6EWTvd+FziLPm35s5iLWeHzzKO5F5
 rISg==
X-Gm-Message-State: APjAAAU0GsmEmaW+PjizbL/Oj009IeCUqBzuNE3z4uzB4edIGWoXLLQJ
 2SsHaXcuwv2eDSk+ukEL7vyvsBJGcnVHEI+OYcAIvuewx1QwRKIn1TqLNKSon1n1dZhjux6n5/Z
 aD3NleBPlrYDq
X-Received: by 2002:adf:a4cf:: with SMTP id h15mr879331wrb.222.1571870221856; 
 Wed, 23 Oct 2019 15:37:01 -0700 (PDT)
X-Received: by 2002:adf:a4cf:: with SMTP id h15mr879301wrb.222.1571870221672; 
 Wed, 23 Oct 2019 15:37:01 -0700 (PDT)
Received: from [192.168.1.41] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id o11sm470934wmh.28.2019.10.23.15.37.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2019 15:37:01 -0700 (PDT)
Subject: Re: [PATCH v3 03/33] sysbus: remove outdated comment
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-4-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4bc674ec-fed3-1341-80c5-5bf526ef01e1@redhat.com>
Date: Thu, 24 Oct 2019 00:36:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191023173154.30051-4-marcandre.lureau@redhat.com>
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
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Paul Burton <pburton@wavecomp.com>, Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Mao Zhongyi <maozhongyi@cmss.chinamobile.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aiTtzzH4LDc9

On 10/23/19 7:31 PM, Marc-Andr=C3=A9 Lureau wrote:
> The init callback is no more since commit
> 817a17fc60f44e29a1944b60d32f45ea127f0cf9 ("core/sysbus: remove the
> SysBusDeviceClass::init path")
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>   include/hw/sysbus.h | 4 ----
>   1 file changed, 4 deletions(-)
>=20
> diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
> index 2eb0484388..c4a1c0adfa 100644
> --- a/include/hw/sysbus.h
> +++ b/include/hw/sysbus.h
> @@ -24,10 +24,6 @@ typedef struct SysBusDevice SysBusDevice;
>  =20
>   /**
>    * SysBusDeviceClass:
> - * @init: Callback function invoked when the #DeviceState.realized pro=
perty
> - * is changed to %true. Deprecated, new types inheriting directly from
> - * TYPE_SYS_BUS_DEVICE should use #DeviceClass.realize instead, new le=
af
> - * types should consult their respective parent type.
>    *
>    * SysBusDeviceClass is not overriding #DeviceClass.realize, so deriv=
ed
>    * classes overriding it are not required to invoke its implementatio=
n.
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5492884wrp;
        Sun, 29 Sep 2019 00:02:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzDAuXf9MmCjjS2keiHPlpagMoFMoPom9KcB7bwuuBt3T69azi4RnlCaaz1XbwUPf8WaaMR
X-Received: by 2002:ac8:434e:: with SMTP id a14mr19463583qtn.278.1569740559517;
        Sun, 29 Sep 2019 00:02:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569740559; cv=none;
        d=google.com; s=arc-20160816;
        b=EXjuoRvLc4AdcdemOM26y1A/w1hLXRMWCXgZFXv43VYGD15U7VwfCfXuKOgLLQxh4w
         8TfQxBL19jsBZ7nZaLWTEnIilAjlSVID9lN8ex8Wk0VlsWvSxaS8bg1tmHItI/XfJ89Y
         Ml/q5V5ktqdkp49MEaBZ6G1tv2P75Rcz4ICb66Qurbg6mlGU1fFYQr7wlmyaNTW2/zj6
         7e+dcyuFf+MM9dcqGe4+yopn8Fbuorm3YWPyca6XKbzEV/PvyL8GbIwyBySM54EkODWU
         YI1bLmECX3Iw8qVgqe3MLisXlkvfBtr/sRPUTyGRJil+942Cf0NdfDgrUklqlNGk+J+s
         yrkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:references:in-reply-to:date:to:from:subject
         :message-id:dkim-signature;
        bh=aTjM0Vqa+j9qU1fkiZJNLaRwCamX5h5TIzCgksf4YYY=;
        b=EzywD4nl+OckDpn0jKKvcBQIMdJEiV79BAFUi+8xetLuBRgHFQOSqQMtheTpm6g8Zh
         bQlJJXMUB2Ttk6f5b1WUDHkOZBOb5ghwE5iklWju+VF3AOaNp3/7vXG1MnJKU2xvrvCk
         RgK4h3HmoX8CcHCHqcibZa3mVdJABX0dqJqh8WhmTXAafm0c+0EebLpFgh1xpD1jRFw3
         uJzzIVqZt0gyKFJtysrpfrLPFWUjHNI7D29wrYE0yZ2fXPWmTfqJTTB5/YkA2TZWi3TM
         G5F5311xCWi+4E4HZ4vEEU6xWUxgLywhvnbYdKGSSXYdh7oHbMtDwmjaOH/HrfBdN9he
         IYhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AQVXoi+T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s2si10079587qtj.253.2019.09.29.00.02.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Sep 2019 00:02:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AQVXoi+T;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iETE6-0001jh-VK
	for alex.bennee@linaro.org; Sun, 29 Sep 2019 03:02:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52960)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <estebanbosse@gmail.com>) id 1iETD2-0001iG-Ji
 for qemu-devel@nongnu.org; Sun, 29 Sep 2019 03:01:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <estebanbosse@gmail.com>) id 1iETD1-0004My-Cb
 for qemu-devel@nongnu.org; Sun, 29 Sep 2019 03:01:32 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:37339)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <estebanbosse@gmail.com>)
 id 1iETD1-0004L7-6H; Sun, 29 Sep 2019 03:01:31 -0400
Received: by mail-wm1-x341.google.com with SMTP id f22so9386456wmc.2;
 Sun, 29 Sep 2019 00:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=aTjM0Vqa+j9qU1fkiZJNLaRwCamX5h5TIzCgksf4YYY=;
 b=AQVXoi+TF1rnJ/eh5Ou+/C9aWRfJ9M6bGJyzRdKdmg5Ww3GMhjIXv0cd2OVafv3yxN
 nRx46A/giYfkfDUXT0j8CtXrXdUmJ+h/KZsJH+Pqb1vxcTA2qa6TIqGaC443byHjCWVk
 N2pX2FD00VkHQmr69Gy3KyjCULvE0YjvOpRlTVtIBGXHr5VA/G8VKdfxZSJhnLhe+WMa
 Z057V3ou+8sAzgftBoyrQc87QU7tQP1AxQG8dMne3ivutLJRtnyfG4FNHV7GuQsp5e8G
 5J8AfFbXZhhB93OHlXpJTfXFxuAdV03UNSZfIVLorkwER3RdoOJqKiyTGcGPOr7NhF3F
 kGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=aTjM0Vqa+j9qU1fkiZJNLaRwCamX5h5TIzCgksf4YYY=;
 b=dZMfXXqKqtNn+xBstgDTQvDkkb+LVbsPSY5dow9aw1JqJVuEJ7XjuOZ1Koxh4eREQE
 6g9X4kdmKOFotxXhjCOqrgjXHJQJO//m5IesqnjQSaYVB0M1vJJtxalulC6pH4z/lTMc
 jKVHEW2kuUuKdULIgsLM77REwzeGGPT6mTmyXi/JJCGfxQ6drsoOqoFTXpA0ZVSxPykp
 KU1xMd+XxDwBa0EKyme/SvecM5ErFqIPiMaeeS3Yz/Kb6j8bFc0v/IbU/6UxiPOH0Knm
 rCkNbAG8l1/YBbQeKqwB3RGRQOMBbjIqChWlMmmTtriw3LyyoD6oB1mP108gvCNr3gyj
 nnBQ==
X-Gm-Message-State: APjAAAVaa+GTGaIBxTA8TFA49Bavpl0uZQOpEQRBAGWVgCxIAG/gJw5i
 sFdXPrf1bL81SHYoiRtPx24=
X-Received: by 2002:a1c:a942:: with SMTP id s63mr12963915wme.152.1569740489763; 
 Sun, 29 Sep 2019 00:01:29 -0700 (PDT)
Received: from ?IPv6:2a01:c22:b04f:b200:7a70:bbc8:8101:45be?
 ([2a01:c22:b04f:b200:7a70:bbc8:8101:45be])
 by smtp.gmail.com with ESMTPSA id q192sm16026929wme.23.2019.09.29.00.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Sep 2019 00:01:29 -0700 (PDT)
Message-ID: <d02a29663183b8963bc34a0d1b031442d997ab62.camel@gmail.com>
Subject: Re: [RFC PATCH 03/14] hw/misc/bcm2835_property: Handle the 'domain
 state' property
From: Esteban Bosse <estebanbosse@gmail.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Peter
 Maydell <peter.maydell@linaro.org>, Andrew Baumann
 <Andrew.Baumann@microsoft.com>,  qemu-devel@nongnu.org, Pekka Enberg
 <penberg@iki.fi>,  =?ISO-8859-1?Q?Zolt=E1n?= Baldaszti <bztemail@gmail.com>
Date: Sun, 29 Sep 2019 09:01:19 +0200
In-Reply-To: <20190904171315.8354-4-f4bug@amsat.org>
References: <20190904171315.8354-1-f4bug@amsat.org>
 <20190904171315.8354-4-f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e752GWn+AZ63

El mié, 04-09-2019 a las 19:13 +0200, Philippe Mathieu-Daudé escribió:
> The kernel is happy with this change, so we don't need
> to do anything more sophisticated.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/misc/bcm2835_property.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
> index 399f0d9dd5..d8eb28f267 100644
> --- a/hw/misc/bcm2835_property.c
> +++ b/hw/misc/bcm2835_property.c
> @@ -127,6 +127,14 @@ static void
> bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
>              resplen = 8;
>              break;
>  
> +        case 0x00030030: /* Get domain state */
> +            qemu_log_mask(LOG_UNIMP,
> +                          "bcm2835_property: 0x%08x get domain state
> NYI\n",
> +                          tag);
> +            /* FIXME returning uninitialized memory */
> +            resplen = 8;
> +            break;
> +
>          case 0x00038002: /* Set clock rate */
>          case 0x00038004: /* Set max clock rate */
>          case 0x00038007: /* Set min clock rate */

Searching this property in the kernel, I found a lot of properties not
implemented. 
https://github.com/raspberrypi/linux/blob/rpi-4.19.y/include/soc/bcm2835/raspberrypi-firmware.h#L41
Are the properties only added when they are necessaries for the
standard kernel use?



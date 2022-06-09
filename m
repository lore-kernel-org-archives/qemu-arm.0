Received: by 2002:a0c:fd46:0:0:0:0:0 with SMTP id j6csp4090327qvs;
        Thu, 9 Jun 2022 06:12:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCN6UpqZRqyHrPh8ny9fQjPyuPwoPeZViTgv0t+/F6g4oqnIB5BN1MVAZdVaBsw29TkZYl
X-Received: by 2002:a05:622a:104d:b0:304:ec74:f7aa with SMTP id f13-20020a05622a104d00b00304ec74f7aamr17126165qte.109.1654780345645;
        Thu, 09 Jun 2022 06:12:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654780345; cv=none;
        d=google.com; s=arc-20160816;
        b=ES+bK+tscTuiUk1ne93h3ZdcL7NojI0uCaVemc6oUgTX5YNIk5lPY+UeOXxD6xduyj
         ixcBlb940TOiuslKZHlYPrXppJFmValL2UhO2iwdgwhpD5ODheih9VGrDYNYgSSIqSUJ
         ZUGlGOCuIU/vqRnU4CuUTgh3dlCpb/9F93PKWqVpxu2FRvPsPGfpngFMORdOLjt2eE+D
         uR/XeGfIcZJR0LyIVm9ayTYa0dLPXA3/xHYWQI0OM+TuvewBdfCRFPI1uZFZt84xTCVI
         1Darm2QDJ8V0JAm6a3gnugnHoSX6/sk9CR+i78MhACbxPD9STf1dkANS0zy60UsFa9WR
         iGMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=twoIaDQGo7IO7tLSZBCdsHybIfo61vQYmCYuEG26Lrs=;
        b=oGE74vU42uVPYuIva5PIMzG9NrcWi+hGLzVz2lpfXbz6vUDsMLZXbYoA5DYyCAuor3
         D4mGIUPygW0ZjP3DU3disLlB+C9x3zQRlZUv42W/z1ixIJMOJAo3+GeC6aOaHJKvhNZa
         4C8nPBjQPyXtpFeMFbIlc2d+zMOZnwrlAYQMsX6wZO7IRWd1LLxyBX33HtKxg85W2TiZ
         rahYP02CK/8mdWhxQKZvWorVz/rE6K38uUbPIUNgoMy4WUyyo70VzMKByZcPSMnVynza
         sXDZjqXelu3izYWAPwNhEuRSy5ICWB5PtOXBG6oLZ5PEvhpFp5Te7VYsKtxfCa6x4ZOZ
         ud9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sIpfySLA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fq10-20020a056214258a00b0045a97625777si12203341qvb.134.2022.06.09.06.12.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 06:12:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sIpfySLA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzHxZ-0006Ka-5g
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 09:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFn6-0004kx-KY
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 06:53:31 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:36928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFn5-0006zS-2n
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 06:53:28 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-31332df12a6so88791337b3.4
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 03:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=twoIaDQGo7IO7tLSZBCdsHybIfo61vQYmCYuEG26Lrs=;
 b=sIpfySLApKHz8WDHPQcdMoh++nmpw3/JSK505m3x6iY7+WZ4wv6abD0ypS+zDFPs4M
 t6vW6DdkWOkm4jWBiE1U3f9gHLTum8pllg/s00oISyFV2Viv3rys9oPkwrc41TLiKNkA
 8FYEPcYugEWbXlOn2S07PLQhgTYh//n8F385C5J4tz7+bCyZU28J5IPsaQMtB7zlXmWM
 22Yuc+Gc+ODEZAdyJdVabhdO1xsyo766O/YIrdw/CzSvsfiGjbcn8NkIb1liqvKzG1al
 6P30Trep7E79phxBtlbKTs6UiAvK5gvIFtBtsymY4tAQZgFFfaHdQk4Fl3Q2nBjvR9Gk
 mPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=twoIaDQGo7IO7tLSZBCdsHybIfo61vQYmCYuEG26Lrs=;
 b=4no61bE9mvKXpLzMBIBLeeTcdS1XTLTAcZL5AeIS3XmNlDn674x9Oqz4pHpPCfS1dH
 JukxO26xIWHHH7QtSi19SDwQHxwOyYAgdos9gPfYHhwxtT8qL/lqfbOfeS+d6waiNsqe
 LQ7FirBo0j2h111Lb6+Z/lOVW+0dEoywpHZnnkdp/vRgc+nE/x2PkUcKcochB/pGItDx
 9ERnlTuEdwF+z03mVLQwYROGrJb4NkWiAOIOkGVYBISmC8+coiJ7HTjm5pYOaMaDJBZO
 PcYI38mZIwEolSvXwxL8oWe5gxTZDnZlTY+iBk108QJd9DdAQFE6lrBv9pHdn1sixh9Z
 uO/A==
X-Gm-Message-State: AOAM5327r80z/rgNzg5FpVY36Ilo5elcz7ptVeXjFRJ347WN1R4WmjlE
 60heDfaHg9EDUMrmTLBltX+PTWIIgR8/qtFpOQ1RSA==
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr42442863ywb.257.1654772005845; Thu, 09
 Jun 2022 03:53:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-27-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-27-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 11:53:15 +0100
Message-ID: <CAFEAcA-VHn9qWQdUgOHDy6QQwuGwf5p2BXUOjG-zq4NPenf2PQ@mail.gmail.com>
Subject: Re: [PATCH 26/50] pckbd: implement i8042_mmio_init() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /7hjZi8tsswm

On Sun, 22 May 2022 at 19:19, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This enables use to expose the register memory region of the I8042_MMIO device
> using sysbus_init_mmio().
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/pckbd.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
> index addd1f058a..c407c082e2 100644
> --- a/hw/input/pckbd.c
> +++ b/hw/input/pckbd.c
> @@ -683,6 +683,13 @@ static void i8042_mmio_realize(DeviceState *dev, Error **errp)
>                            "i8042", s->size);
>  }
>
> +static void i8042_mmio_init(Object *obj)
> +{
> +    MMIOKBDState *s = I8042_MMIO(obj);
> +
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->region);
> +}

You don't initialize s->region until your device realize function;
you should only call sysbus_init_mmio() after that, so this line
belongs in the realize function too.

thanks
-- PMM

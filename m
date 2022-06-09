Received: by 2002:a0c:fd46:0:0:0:0:0 with SMTP id j6csp4097279qvs;
        Thu, 9 Jun 2022 06:21:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzM9THTRlvaBesNwm9bqBVhBR7r/fnkCmDSCEuR9BDk9PofaR+w2qQYK5WAaIUTg3JU9UBx
X-Received: by 2002:a05:6214:2b9e:b0:464:62bb:c3c1 with SMTP id kr30-20020a0562142b9e00b0046462bbc3c1mr30593963qvb.27.1654780915880;
        Thu, 09 Jun 2022 06:21:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654780915; cv=none;
        d=google.com; s=arc-20160816;
        b=yAzYpAEv30GKCHXHCrj0cTZY6t8dSYjcldd2Zj9m9h334xkZl7U4gazOg2oipMtPCO
         qs7cZ+YMsrHJR9vHVFKrezWNr2+Tx61f+6kcNbHom5qUbvse6htLP18YOVSaVbRdBgwE
         ggFJGSgxD0mGuSh4Jn8jhUzQ9NKRyd5bAUwCdz28iz3vs5LrBSKbfMLERgdTZZhwkERb
         iwZsISAi4tdH06oipSLHnulEMhy4Uz1OqgifIZK+Arf5sOzpPcLUb5jtAU/N3ySjdrQ/
         2I7E8fsNIVmmgwUIqhI49/GbavUAh3Kq7Au0vQz+o7yXvLq3+5dfsXjg6GttT2hNIpbe
         R/cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=L1l2AkFeu+46U5Eyndc4iecTzpW3aS/bGOrPHDFYJqQ=;
        b=s5brondBC8b3WmsU2TfK1HEAn21UJ+omPu8ftnEnPoBle5RZwaqYF2uKnYX5Fb5pgk
         UeyU3yPvURLQOB8hQX5NaAK2qdipKo+LVhIeZjz7wYMEHk8XEDeTay+hPJEp6+F9Ur2H
         6t2RoL+WbvoLl9oQHQa962qS/rWKRoudgkU1l5lONynUX3dvMnsrVP/36OE4+IWNovbf
         LQTbRRAyLvCCQ5HBXz51kPzxVhb7ZGyU2WpdabdHNufw+nfn33DDM/YMnJ571yOfZuOu
         yCfmLyfl6k/X8sEB+lKRu+RCqyLNxCsvMXJXLY+gE4qW+xp/RUrCWRmziGuEJwpC3aUL
         lcMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KGvl45rN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11-20020a056214076b00b0046b9f322394si6256969qvz.524.2022.06.09.06.21.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 06:21:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KGvl45rN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzI6l-0001I1-Fq
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 09:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFjD-000320-O0
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 06:49:29 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:44838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFjB-0005MZ-Dn
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 06:49:26 -0400
Received: by mail-yb1-xb35.google.com with SMTP id y188so11619977ybe.11
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 03:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L1l2AkFeu+46U5Eyndc4iecTzpW3aS/bGOrPHDFYJqQ=;
 b=KGvl45rNXTpuFr0aX2YeKlojBV84v2+/vY0pRUILeRr7whZIek/T4IGLO3Gl1VrcLt
 j7pPbwSx/KBlSzVWesTZOZNns9cWYvRdcud6VZ1vCvIP7QvQrfoncc+lUTZrMlL1w3bv
 +XgjjcWxI5Xc1RBdMuhUMOOR0r0WswtLt3Nu2+pI9BL3b3jhJvvd6O/HmGF1CTgTIMV0
 bJKVTftckaQ6UD9s/UgdOhH7ypVJNGDKOSrePXE5akcEWgdh9q1UHoxwLbG9sxkWNX0n
 E863/mVsS1NwqgIpjUa4oDAqWuafUAExGRZTfHKiu9sDIW2jd9jO/qQTND815ZMMt6+V
 HNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L1l2AkFeu+46U5Eyndc4iecTzpW3aS/bGOrPHDFYJqQ=;
 b=cfQe6LApVcPy1D+9reEGoKp5bE2A+z+X+CZEGKniv/Kazxn2xU+skargwKqkIoTArq
 HxqZlOz+EWCvOpEExLhcZJCADLEfV8hr9uOe42FkMPBTRcj4O0f6KHBIvEdUt5EJlJEI
 dO0JzO9dQRaKrwGpfW5TLSiLFyocD99KNC3bKL6d43U619iD8x1DXo2+SECNBM12Iu/J
 D5kxjIfB94wywy9v436arnEOK9gjeflJwKXHvH1YJoEKLYk5ehks2XWNc9QCeLMnOvAk
 1vztqfypZdhja/AM6bqAopqHg2XWVnlN4rv/b8BNTwfsBw5j4edq4XD1YLTpputuKtip
 IDkQ==
X-Gm-Message-State: AOAM533Cwt1IM3+aGw3sJkR1oajY/QZBjuKPYB1jZ5/HIMRqxqBpJK2h
 YqK27D5ONwyLy2zNJB/YmIr/mitu8aMfcquFkyXaTaDMMCY=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr39616759ybq.67.1654771764515; Thu, 09
 Jun 2022 03:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-23-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-23-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 11:49:14 +0100
Message-ID: <CAFEAcA9UcEHGE0BL5Dz3mVC+T9Z4XrMidhxFGWR92sMQ-0rrEA@mail.gmail.com>
Subject: Re: [PATCH 22/50] pckbd: implement i8042_mmio_reset() for I8042_MMIO
 device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: V9IRLHOiF8iP

On Sun, 22 May 2022 at 19:19, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This allows the I8042_MMIO reset function to be registered directly within the
> DeviceClass rather than using qemu_register_reset() directly.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/pckbd.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
> index bbdd3bc568..df443aaff2 100644
> --- a/hw/input/pckbd.c
> +++ b/hw/input/pckbd.c
> @@ -665,10 +665,20 @@ static const MemoryRegionOps i8042_mmio_ops = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>
> +static void i8042_mmio_reset(DeviceState *dev)
> +{
> +    MMIOKBDState *s = I8042_MMIO(dev);
> +    KBDState *ks = &s->kbd;
> +
> +    ks->extended_state = true;
> +    kbd_reset(ks);
> +}

extended_state is not runtime guest-changeable state, it's a
device property that's set at device creation time. So we
shouldn't be setting it to 'true' here, but instead in the
device init or realize function.

thanks
-- PMM

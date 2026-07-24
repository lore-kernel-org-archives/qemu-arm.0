Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B2CC531C9
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Jul 2026 14:36:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wnH0J-0004pG-0A; Fri, 24 Jul 2026 10:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sef1548@gmail.com>) id 1wnGBd-00058D-0M
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 09:43:37 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sef1548@gmail.com>) id 1wnGBb-0001G5-LF
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 09:43:36 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-47de0093c42so420452f8f.3
 for <qemu-arm@nongnu.org>; Fri, 24 Jul 2026 06:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784900614; cv=none;
 d=google.com; s=arc-20260327;
 b=IOVzkVNZkXs09IqX34qV1rshu694RDjn5ooXqxyI/x5Z2MpLXdpKOmvr3k1rv5ihsC
 5e06i3MIY/RC+n1QFTXG7zyMfm6q+/WUn35tVVyDIlJ2ti6BMs5//Flshb7cdheXJZIT
 v3SoVkpixAGc7rbMOmfCJMlSJ5GTrHtLzhdToQCzGkMRZHVy+YO8ZW/OS7bHSy+Uw+Ys
 kq0QKAW0w9z5ODw29tIOlR7ePPy6MLNxAMl0JcCW4ADHTm4nSw1+XgTCHA1UpZZYzOIT
 rsOWOCGYVDRJ4lJbWfAT+Kh3tDc36UO5tn6HRGgATZsEwpJ/LxdkL1z7f4F6zM2ZytaU
 DxIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=AUVUTr/HgNRCnwG1yMKM1SC4paeEuvPkbXDF+YwNfeE=;
 fh=uRale/ebC7L6J6N+PcooztnFL3lVzLoJOkkhWWyS6EU=;
 b=NZciExXg85LzYkAI69QI/NfbPIcch39s8ffsecyoWfI3o0mY9zsv8XQtnQcPXWTgNk
 IiF4ORigo/ESVxRvFPldrj5C6uTu4lZshYJJXs9chHyaPTcAoK6qEdHTwvjmY4MIfvAO
 J/1R754UPLauH/Q5UgoJuD0ho0O7FMAcpJrtjKbrkCWWiCPhGhAlyiVJd60eMjvEqgV4
 z/Jm0eXZdxXbT47DIEcC7zaS7G945SKRjgCHI9xVmUmOGkAO3Kcy2HxSOQMWklIfzBDn
 bqVFqV5hTMMw/qCkyHZXW67quWQPmMdtJ3LidlQO3iblFTIZZ6aaMAYrll/pIXewXPLm
 WmvQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784900614; x=1785505414; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=AUVUTr/HgNRCnwG1yMKM1SC4paeEuvPkbXDF+YwNfeE=;
 b=due2kkYEls7SeKP/IH71Uy2etBbZNewclcAYCvSF6kuY+k2PE35AQJ3Qu7IBY90v26
 jZjH0qdS+YE4VIZjIBcLxfEYvxpe1VBN7etLaFfZGyTRZZB1uSP58vsorhw2ktNLGI7i
 9sFcec8AssLfu8uS0ypNn2exjpu7iukheNvcEe5hkGvbqhsr18TA6hf7m08UKsdFiMm3
 N7X4c+cFZwRd5KSvP1LDNhx+hBmcd9QR0aV0rK2x5udPguoicu3bQDnU6y+ed8MxRP9W
 wu3L2DW5hmVggVbTdjWV3SNdPGXsTZYWdqUxr4un84G/MrbndCVGJYBdxpcGk+HUHmB+
 jn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784900614; x=1785505414;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=AUVUTr/HgNRCnwG1yMKM1SC4paeEuvPkbXDF+YwNfeE=;
 b=LtGRBxazQ1io/IsKOmeYROrfVoYSY5tFPXsmliCubHmZ4eiR/8rlDFRiFGvr11WouP
 iut1xTL9ESroLaDgT8YsHcr8JboRIxJIf3+furL5ffiJfPl/ikQSGnbCFtIBk4x8oMbj
 OCud0Qg/nA+VYX+V5ZQrF4iCtppmPWpELPuVkO2toSys2ccDxtOM8QzGh7sJJZv/1/Wj
 2y7uorDSX1+7hHVy2DddKITWzs/hw5Ab9fL89Hx2WwMX2pcdG7nYSIm3Ca1SF7vfHPnF
 J2RjSanZCS8kHneACFOznd83RjeFft4m2AP0wFgngxNJSve8KVJYX/6OvaEpYeW5PTvU
 Mx7g==
X-Forwarded-Encrypted: i=1;
 AHgh+RqBdZLJOu7CIzAiLQLdx/vLro/c1Mds06JEn0svGKwTa8DHji+NVBqSyugOLlMxiRuTDKAkvF0EoA==@nongnu.org
X-Gm-Message-State: AOJu0Yy6GvLlbf/xhCdN5u/gqLR3FrjcwBjywQLBEGCnVM41q8pOlmBK
 y1QVXX1vtgvWMJWniYz96esneFXcdqhIFgHnTBH5UqhZ8yDcT5KS64Yd2EwOqlkkEurgHYuCoXn
 fkiy3Tlm58cz56YBmqcUS+/Wxy8dknNI=
X-Gm-Gg: AR+sD13/ygDu1Tknl6asN1kl1/J6gAAGOJm4wA1s1MptkoRhIZDUjBFow4+nslgkqj7
 dZvWGpXNi4M3DkbQPSaJxsRPdmOg7iO/IuNgCOjZGtSm2+eRnOahTV8l1Nc8OHLksC5W1icU2kl
 yH8PqEHWqwZWeo7QUhJSOdVM0SEaq/coeSWz258H9Wpav0jACrOVeTWp7KzMsTnB8ZIUcRuhuZY
 o4vbmmn+q4cGgf3ncOIF485NPXJXA8mI++IOKNqE79VsAYbwMKHqVIZg1yzYhP1mRCSfpCKhpal
 sQ0zQgO4HNbch6WepiE8
X-Received: by 2002:a5d:5f86:0:b0:47d:dfc6:b28b with SMTP id
 ffacd0b85a97d-47f8d754476mr9310919f8f.30.1784900613772; Fri, 24 Jul 2026
 06:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260724124220.24152-1-22925483+botszhuang@users.noreply.github.com>
In-Reply-To: <20260724124220.24152-1-22925483+botszhuang@users.noreply.github.com>
From: Nick Huang <sef1548@gmail.com>
Date: Fri, 24 Jul 2026 21:43:22 +0800
X-Gm-Features: AUfX_my5LtMTa1rm8qHS320kbXroc8KMzN7IthO5D5FQzuPYwhuIi8ONzqT2mBI
Message-ID: <CABZAGREnda=cKM504On5qz2jF1VRwpAAAPFSoZC6SaVDeRE5jg@mail.gmail.com>
Subject: Re: [PATCH] fix BCM2835_I2C_CLKT
To: botszhuang <huang.botsz@gmail.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, philmd@mailo.com, 
 qemu-arm@nongnu.org, 
 botszhuang <22925483+botszhuang@users.noreply.github.com>, 
 botszhuang <botszhuang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=sef1548@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 24 Jul 2026 10:35:42 -0400
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

botszhuang <huang.botsz@gmail.com> =E6=96=BC 2026=E5=B9=B47=E6=9C=8824=E6=
=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:51=E5=AF=AB=E9=81=93=EF=BC=9A
>
> hw/i2c/bcm2835_i2c: Correct CLKT register offset
>
> The Clock Stretch Timeout (CLKT) register for the BCM2835 I2C controller =
is actually located at offset 0x1c, not 0x20.
>
> The previous incorrect value caused the guest OS to read from and write t=
o the wrong memory address when configuring the I2C timeout, which could le=
ad to unexpected controller behavior.
>
> Update the BCM2835_I2C_CLKT macro to match the hardware specification.
>
> Signed-off-by: botszhuang <botszhuang@gmail.com>
> ---
>  include/hw/i2c/bcm2835_i2c.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/hw/i2c/bcm2835_i2c.h b/include/hw/i2c/bcm2835_i2c.h
> index 45f876df22..519c65f765 100644
> --- a/include/hw/i2c/bcm2835_i2c.h
> +++ b/include/hw/i2c/bcm2835_i2c.h
> @@ -38,7 +38,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(BCM2835I2CState, BCM2835_I2C=
)
>  #define BCM2835_I2C_FIFO    0x10                  /* FIFO */
>  #define BCM2835_I2C_DIV     0x14                  /* Clock Divider */
>  #define BCM2835_I2C_DEL     0x18                  /* Data Delay */
> -#define BCM2835_I2C_CLKT    0x20                  /* Clock Stretch Timeo=
ut */
> +#define BCM2835_I2C_CLKT    0x1c                  /* Clock Stretch Timeo=
ut */
>
>  #define BCM2835_I2C_C_I2CEN     BIT(15)           /* I2C enable */
>  #define BCM2835_I2C_C_INTR      BIT(10)           /* Interrupt on RXR */
> --
> 2.43.0
>

Tested-by: Nick Huang <sef1548@gmail.com>
--=20
Regards,
Nick Huang


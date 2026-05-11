Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889DBCD37AC
	for <qemu-arm@archiver.kernel.org>; Mon, 11 May 2026 14:48:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMRvx-0006UC-5m; Mon, 11 May 2026 10:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMRvo-0006Pe-9F
 for qemu-arm@nongnu.org; Mon, 11 May 2026 10:48:33 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMRvm-0002OH-8r
 for qemu-arm@nongnu.org; Mon, 11 May 2026 10:48:28 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-bcc9fdc959cso281774766b.2
 for <qemu-arm@nongnu.org>; Mon, 11 May 2026 07:48:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778510902; cv=none;
 d=google.com; s=arc-20240605;
 b=aexNRc6GtsXMKriplCezLcY4g1foMzMQgh+GBqPBoFRdU7PHKzCQr4c+CBDghfDY6K
 7ZehS0OtDhs49WPlRZ8G6nvtAjakZQ2fjpmQEsyqHpzWC+IxQ4HV/66Xz3fHNhj/1GnJ
 SV3bkNs+tVVhu5hHq6n37zLH/d8Q3noqfGjkHHVFNtAlc4PxbBDQjRkT8nV05JgJpM5K
 uBvWkc3i7PqoQfIEteDI88wBgDFxrsUQztF4n2PqKSFptzY5ByJecW18rTZoz9QmbKdP
 dh8rOFVYpIJtz/jp+BMb1E1+pJwdgtjzKjnD1l67Gv1jjMjQR0OT7r9NjRAh7S3hvdG7
 cKFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=PWJxoxz6bXD5xX/7icrkmlXM2C8ow3SYmXGh1OIVtkQ=;
 fh=DK5C60vGgoJRE/lYxLFTwqj/hnZ6r3Nigc6769h7JGg=;
 b=CqrFK6l59eA/7jLiTw2Ng+FSWbmiTZ1uipGR9pLj4dmH8pEAhh/BEMRq1Bgg5p3vIh
 w6camgu4KaCnBDKLYrYRw3aiSCZAn+DnqeyvKWFrYYquop00hrABBJKnyZhTlChEJaU7
 wGLzI8gReXI2ee6KPaFkbqFHdSC68dwKAZgokMxJwjE9ix6r4Cr8rhkV7QzcETo5EMDG
 6hD1d9RH6ezisiACYtKDESRk4FtgDh3QbMHHSOviJgDdS2nEFMKEtr7rwrESkFrvqhD0
 rkVHiYjHv9diz6iTPYyGkTEPWMk8N9E4u7IMK3KNgSIZBnVwuQTL9sIPju+sSuQilqUs
 1sag==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778510902; x=1779115702; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PWJxoxz6bXD5xX/7icrkmlXM2C8ow3SYmXGh1OIVtkQ=;
 b=WRsxlT5KICTzv0MsTEnx26TAQ4b1TtN7R0pEc0LUKrRQz7RVtx1I/CzNiWG/9jgVSn
 tA/raix2Yf3e+WL5sF3XO8PTKtSMrgs2RL4u0X0OZpAG+saEwjtina47u1qB4ihdVAQQ
 Wdkbn3qGSMXnM1ezfe/3ecmivn0Ojct08vLimft6QOnZByDXOscNK77pDORa+fgc9+dK
 G2EchMkZ/8nMaE5HpqkhYBmSjfGNohQClT0fHklCKHjkjuqiUo2wvPo7jsrNgD+hlIr8
 A8d1v8uEjiqQJazcPe752xu4HP6f8TkCy7s7zC1x8spnYRXloZPTP1tYupmbL8Msf47N
 NhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778510902; x=1779115702;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PWJxoxz6bXD5xX/7icrkmlXM2C8ow3SYmXGh1OIVtkQ=;
 b=egyOfrlEfSaVJ/a+5kh8/HcAwl7uLM+jmCXL8CdxzZX2U1eNTpEWUSf1s9llGf9/+C
 mbdwcbZoO4pLdr20ldO1bbirTRAmOoYU2scITYWIUFN8B0CuRrAatL2BRqU3ltM+f758
 fL8qpAq0A/a7k/IO2AJPNyN9/IDXk9Y5nsZUoXpAUDtEpYKAtlK/uxjxiQbmY7y2wHZt
 eq/FBfrtFtAhS6FzT4TuV7GZlngCiV3HoJqhxlwY0Qcr/9SDm+DlMKTp51BPzV/Jps3W
 aNfjgfS+jESZmzRK/sEq9Pr5IqOWTMxogtF/MkwJ+aHPhR7RNWh9UTnP2LnJgEPNlB0h
 JOyA==
X-Gm-Message-State: AOJu0YwPCVlmFIhg1H56L1CADlBgfUiAU35f90ZrPWUVgs1KdrImEeaa
 oQ/p0nBG4hnmNTB8oyynjY42Xx90qb9jQwDsMFIL+vJ2kJCYXIT2onZMtaaJ6j8SO+rW/cvKaZ8
 DeVlFSjvsZ0WcWO+xtOxLg2cGbDhQ6zu5I0kC0gsZ0X+Se1yqLdZe
X-Gm-Gg: Acq92OG+P8sEQh3wSdCLH3wdfOfDPAeNyLg8FllpsBMMPDLdIWidJaHfvDNrfeEOGHb
 k7Jp+bEoZtKU1JlH3TCQkoDJ/c7Ps97L/KQxqApjBaUr50HX/wcIEL/HMzWkVFU9mjW+j4+CswD
 v6yCHM5CP2v6DLBmhDhHjI3wpM4RbhGWrUxKoUyVlPT5DflboVfhg22ea89YXa4yxvWmJ564B2m
 5ajHcLEvvc+WkNE/YvuqUm259NFZ+U55KXdj3J7MyP1Q8AiVG+eLUN4mdef3hMN/1smk7R1lG8B
 krdIc1RcHJHzFTWGnauPOCvPgqXAClPOm09XQ3YsCzuAsUzMJLNMBKYQ2OdjhcHXlgYsfEgnqD2
 TZA==
X-Received: by 2002:a17:907:2d2a:b0:bd2:2657:9b7f with SMTP id
 a640c23a62f3a-bd226579ff1mr15516466b.44.1778510902069; Mon, 11 May 2026
 07:48:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260501162634.4092394-1-peter.maydell@linaro.org>
In-Reply-To: <20260501162634.4092394-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 May 2026 15:48:08 +0100
X-Gm-Features: AVHnY4Ke74-rHdd7oNHHu8_a75Gv12LA2ZSPZd-O17t0MakMwH2_0Q5sZa39nIM
Message-ID: <CAFEAcA8nVfzFrQ8y5x9_Qp62QogVcvN09Q0JkqcFrJv73g80oQ@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c/microbit_i2c: Don't index off end of
 twi_read_sequence[]
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi; ping for review?

thanks
-- PMM

On Fri, 1 May 2026 at 17:26, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> If the guest tries to read more bytes from our fake stub I2C device
> than we have provided, we incorrectly read one byte beyond the end of
> this array. Avoid this, and instead keep reporting the RXD register
> as containing the last byte of the "data transfer".
>
> Cc: qemu-stable@nongnu.org
> Fixes: 9d68bf564ec ("arm: Stub out NRF51 TWI magnetometer/accelerometer detection")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3408
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/i2c/microbit_i2c.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/hw/i2c/microbit_i2c.c b/hw/i2c/microbit_i2c.c
> index 2291d6370e..d9689b6f1a 100644
> --- a/hw/i2c/microbit_i2c.c
> +++ b/hw/i2c/microbit_i2c.c
> @@ -41,8 +41,13 @@ static uint64_t microbit_i2c_read(void *opaque, hwaddr addr, unsigned int size)
>          data = 0x01;
>          break;
>      case NRF51_TWI_REG_RXD:
> +        /*
> +         * Return the next byte from our fake data sequence. If
> +         * the guest keeps reading the register after that, keep
> +         * returning the same last byte value.
> +         */
>          data = twi_read_sequence[s->read_idx];
> -        if (s->read_idx < G_N_ELEMENTS(twi_read_sequence)) {
> +        if (s->read_idx + 1 < G_N_ELEMENTS(twi_read_sequence)) {
>              s->read_idx++;
>          }
>          break;
> --


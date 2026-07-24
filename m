Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50245C531C9
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Jul 2026 14:36:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wnH0H-0004nj-BN; Fri, 24 Jul 2026 10:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sef1548@gmail.com>) id 1wnGaO-0000Ag-FS
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 10:09:12 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sef1548@gmail.com>) id 1wnGaN-0004kG-1B
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 10:09:12 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-495437bb891so5124015e9.1
 for <qemu-arm@nongnu.org>; Fri, 24 Jul 2026 07:09:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784902148; cv=none;
 d=google.com; s=arc-20260327;
 b=Fh9I2eocHIyJD4JvVX4L0eIRufpZ4bnsk7LjT3ws3za7L64HM51O6+C9MQumnlrzpQ
 Mp88+TkuZV9iAAzEeqiJYDjq86H2z3nIVmRAAnAWZlYWfLUhIDEuo6eWXUW/q7xFuvQ/
 d+8Deg/WGJcJMpElvr9uLCtjDJlb7eBBLlYFsI+W/sS3lKEm3wSpcAZuhdYM5ewLeWNJ
 X8Gvjh5790xBacjYW8yvv++EFnh9I48U6pK7vvvt6/mhBTsBhhVXWNblsjFNjGo9Y2T6
 oofZvP///wdVCskHZ+OJgj5z5SMokEMdoXZcr281Q6mn++/YZ/MQdylUICsdPrQNgCLe
 B+DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=V6oyUglO8Xu1C1gsvw104MavYBVhw711ANAZceOpkdA=;
 fh=moHr0cIq8L7ncnr6irHqk4EtC5JFdMZes5gEq2BufSU=;
 b=pl17ftHvY+kR2Tl4lZjFckduhoaDPCJ1Qed6gF0CdRDZ8LKrq4fJgjCq/ZCDx7A3gJ
 zbAb2g8P6obcAnDqA3CWeH8vn84jZMTgXp4IP7Bhd7kj4+74qjHixGPKjY6p2bl2Yd6y
 bAOPF/DBp81aJOof7XC3Y7PbJikqqDedhnNgYWtKmewhu0vnIQITzxa4XYDcOhxYiSXc
 oUiTvoV71ghd1RD+gbZORuoW/bc+Nk61Mid7JvnbNecEkn7QdolRqR8LGwojt4PProMt
 MJ5UGEdyTmJaCVGJNDL+WQxKjcrFF97f8HSg+KF4Ep6ZbmHzTGZUiVV6OOqXaubsWy0S
 ESlQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784902148; x=1785506948; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=V6oyUglO8Xu1C1gsvw104MavYBVhw711ANAZceOpkdA=;
 b=E02d9S3L8lnz3tQfrjTmzCRL5P++DJe+mPg5jaxlE1m7zPmZomV3C7oYvLlDbA1L4c
 a/BR08pzr8lrbhDHLbxITLb5m4UIHU2md2dDZWJUf9Vw2wTWHKjdI6XxJ+wGePdDv6As
 x3xEZ8h5A9B6bXEAiDK8qiZzNEuvw67Z95GEsMZkag4OqgCbozMvN99DXMWXmnLrcphd
 5A4qVycZ2Pm5rfLWC6ab51GWtGDIecrJYahTgdCWBUwSvUNCt3hTceXX+MhuNJQoPtkJ
 alsBNC9UINHo43jAYTNE9eHJ336YtlsLG7TJNGjYYZI/8ZMDwk0iznzL0pjG1AnBXJvo
 0ONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784902148; x=1785506948;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=V6oyUglO8Xu1C1gsvw104MavYBVhw711ANAZceOpkdA=;
 b=HZ5W1QCuOALmuc+gV0on9h3Nw4lZiMrQp/CrtWuKjeF9sGjZaVTOtxHlxRoW+zPtlU
 gs+DodrjtiewYG8uv+XwidZa5C61nagKJDGbNcZzibve81ua1eEfxuA0TO2CK9JxGeJT
 k95N65MHSh5Mlw6Sa8ITPjhbsTWp2pftwdaPG3P8enoldWHTMLvEcC6BW2Nt4eCsv3W8
 1jsOcYwxEJMtLRIhuJXyGc7aqYwKAD7d8ZpClj2T//Ql3fHkWS3K09FwLliCQB+t3y5y
 H3AS6+wYJXsYPLlxvhhu/uN0xjae7P6IoUmjL3QxX/cLzNNiCdevKY+7FeTkSrsLFdHw
 Z6/w==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro0Gk3Xm/Dn+ZuBuHNK4wM9iMQsEXRjV2yTE9tBuGLT6bugcOTWZLKkVJ6fN4PKuELzDG8f/pVJKw==@nongnu.org
X-Gm-Message-State: AOJu0YxXbC7kk1EL9P7AlnfUDEcNfpW5+ioZ6wUggP7TaNCGVD1pjoWi
 Xstg/J9lhu66m6UcH6sinwW6p2Hlrcsez1vK25HmvR2lKRS/VHpU0MdXmUoEJ4Byq9vq4qgdtTB
 ENGi5dXQt8xkFEylUGtZBCowf+0TTpLc=
X-Gm-Gg: AR+sD10eU15nF3fHfU7af/Y1qEDqyXktrprV+eGObaCEzYdwN6KxvwUelJSFUWgF11m
 wXU442YDJ/U8HOLdvibdVu+MJJpvvNkgLQxBLDSwzCZutKJIVykbnVtZbYip9Fyb6lwLEehugc5
 AhPllH7u3AGgnW5Nb6zu8FEaqO7veqcW0qAFXdko8iQtiVyyqLy1yuoxTtLq4oUEUAHNsbHC1r5
 0rS7Mx16amjhMKOcS1Gh3aVHae8hwpkZmICQaRu7p8sNt53a6JjdpQCNqzdftyUIJuKf1PhJTMj
 XKyo06iLs1B0mW915n+R
X-Received: by 2002:a05:600c:2e52:b0:493:e686:6134 with SMTP id
 5b1f17b1804b1-49690c4c2e5mr7489625e9.7.1784902148075; Fri, 24 Jul 2026
 07:09:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260724124220.24152-1-22925483+botszhuang@users.noreply.github.com>
In-Reply-To: <20260724124220.24152-1-22925483+botszhuang@users.noreply.github.com>
From: Nick Huang <sef1548@gmail.com>
Date: Fri, 24 Jul 2026 22:08:56 +0800
X-Gm-Features: AUfX_mwhSGrqK_Cbl8DuTmHu1n6J0AA6iD6abXkHfJeehD7bkiXRDWAWyBZgdxE
Message-ID: <CABZAGRF6=PLA0FqKfyY2riSKHzCh_dKCdG1vJ3Cvj4hqTJttwg@mail.gmail.com>
Subject: Re: [PATCH] fix BCM2835_I2C_CLKT
To: botszhuang <huang.botsz@gmail.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, philmd@mailo.com, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=sef1548@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 24 Jul 2026 10:35:44 -0400
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
Hi
Tested-by: Nick Huang <sef1548@gmail.com>
--=20
Regards,
Nick Huang


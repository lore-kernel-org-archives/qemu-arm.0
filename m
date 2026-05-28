Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61308CD6E44
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 12:55:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSaFp-0007ZX-M6; Thu, 28 May 2026 08:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSaFn-0007Yc-Vt
 for qemu-arm@nongnu.org; Thu, 28 May 2026 08:54:28 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSaFl-00079u-GB
 for qemu-arm@nongnu.org; Thu, 28 May 2026 08:54:27 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-7dc6d090381so7541697b3.2
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 05:54:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779972863; cv=none;
 d=google.com; s=arc-20240605;
 b=AHEnXBj0aBDJSo/uVo+Tb4YrBTnnrrVGbS5sQl2wzSJ+wJ5RP9lSvyExefpIsV3Uii
 IrWjn6tuMHxiz3cFbq4AAnWCx6e+EL1wbs7nLZpD1QNVzsqrhmATc0XRHxd0KnsP7/zD
 wwW+RgswV9diE4f4oslg9rBu0yLoUaNc6mZ/5dyzQYme/xwi5Q54JWWQMb+s6B9CmuaT
 ZcaBS+CoWeoRD7dxOQdKL8LU+BMhpG9lc+Gayf5pS0BQmdz3lRnfeHetFJQ9fQ3jFYBz
 +7xa+3n8mLb0xc+wIsUo3l7pWG2ML9tsjuOS5n6VZlN/k+dxMoyp6tTHWTaLBjlG++Nj
 en+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=DAv25ndm3MvnTR5ZhnygaG9HStfvAseM/0GXjVRpQAo=;
 fh=dsTVWq7xYWNBIdMmM2dBsXIV5ZaPadlTb3u1X5z7EUc=;
 b=J/r4JdhwvWfhr/U2PZwuyH/WOCgdie+PbcmHyDjOCe7UCf9yS55q3+M8XDJp5w8SnQ
 13VxtCu/7MSCvppTbvNjjuYC/PLYNtTKIURWMrfT9+Na14T9aFZqNbqw4nUmQNeOIAi7
 BV++WzO4GNmYb97DajnmnAHCW/De1drJjvj17Qm4KbLd0QXK6RCHbNFWXpm+sLwhT6cw
 rAF1Ke6xu22GZ65j98K308MTacsAOcu3CAyCexVXReazirD4igULDA9W9Sz1e9/iSnUs
 MC6h/6C7hoG5k2h4HDxhfrHxbp5JhWodpxSgfI/8NUDZeI+PJORgy3eg3S4fhXU5Dqk6
 iXkw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779972863; x=1780577663; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DAv25ndm3MvnTR5ZhnygaG9HStfvAseM/0GXjVRpQAo=;
 b=gPTQzvaXiuqBIkY+aBJlI2YhccX8GGiLfbKsQm3j18EwIkbYSsf08UWFdFY36Kr2Hd
 RpMw7zvsLJbEEUZeWQ1Av9f0eg4E/hYij1ByVLgDT+4V7rSEke7H5VEUp6CTdn0IOCHy
 bFPOPBEwMGgKeLZKtO+P067syNVmE/3fGeQ04m6kCx6xkNrMTrFM1y5V74bDq0G7/aef
 oL3jwW9IOopYjxGc3ivFobqQxmSr3c462+Nr7LP4ddxnPddUG1KJEb444mzwdo7MlzV4
 btDncYas1+bxwfYacOIAo/qpcpJR/8Iis6Qf0afuT8Fw6DpXF3tayXf15oKnwZsKVJJc
 Cy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779972863; x=1780577663;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DAv25ndm3MvnTR5ZhnygaG9HStfvAseM/0GXjVRpQAo=;
 b=DO2vH4ozhUUEO/b+9pV65SL+HvyiXrs7b9RNtyxIqUslmJYEkuV2MalHlL2vEDMmde
 7fDcJGdI9q6uSciEurNK1J1TwDwF5vNI2WREjUAMIzTTpjp7pnZVVFKCOvHyi+SkPuL7
 oCWx7ZYMV7tEz2X8X3ZgBQo2QIeiTGKGCswJ7P3mfX2cE3HVtoa1aQuajbSfFYzb3G6E
 jCM7cu+e6hUWK/NKRq21lkRHk3fRTbFf+/NTSz7IxD3AAWRZmHetNfLYqZENCiEa0Lfg
 IapVxhMLVWjvJWHYva2jYkM8CdWolSAYZbwZVZV28m5F6wsM5Hp/gS6V1AnrkYBoANR8
 c+ew==
X-Forwarded-Encrypted: i=1;
 AFNElJ+wSRQuE9uV67qrxMpP+eKbjN5MgVzuPx8YV5ImupWM0mhigfH80Txwhq9BD8X8+9Hui2yoV6FhWg==@nongnu.org
X-Gm-Message-State: AOJu0Yym1lj8RWfSpJbH/muy5t3QUkP5GlzyAIm1jzHYY0nX3YNYikJ8
 NuDtM0G5p0XrEZFdKsRYEFZTfgqIRDE8ViZzFCsVu7S9zNqG28SLAQQq5GkbDivT0aHKT3twKzZ
 SDez3l8wLUG5DDUWMDrlBNbtkKSniQ/1hhVxoo0ATlw==
X-Gm-Gg: Acq92OFFpNCOOdvQMNobbnOddrGCnkjCTFZEsGwDfY4qYUIfQSAOTcild7LjiVIhLNe
 I9BE9lukZh7YCgHagZpOQyLoD8tGjnFHPUpbAf1Jn561YWjRMbUF33uZEA//T91yE2JqcnVqToR
 Vu3lIYOscnn+6YXyCO/KDyXW/Z5zFuwk5+iYnpGwD5+uzUaGRfs2VdVOeoJaw4+RuiqDYMckkbB
 EAgt2A2mWgY7VG1Nl+9I2/cv0KyDIUUU1oazgX9gTEZCsX0si6OlT4W9X6m+q0/oo3LMVCsQOGN
 HbwbiOdpTy+5xUX6xpVv4Gg7bfZ71AwqkKv3QZmRxkq3GxJdp8z75jJMfVE4nhTcguQ/z+7l1zW
 oUA==
X-Received: by 2002:a05:690c:8f:b0:7dc:605d:7a9a with SMTP id
 00721157ae682-7dc606cc504mr29399047b3.12.1779972863322; Thu, 28 May 2026
 05:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260518073401.11279-1-corvin.koehne@gmail.com>
 <20260518073401.11279-14-corvin.koehne@gmail.com>
In-Reply-To: <20260518073401.11279-14-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2026 13:54:10 +0100
X-Gm-Features: AVHnY4IreIkBoesA2_tEVETtj4-KfeK-IdJBI6F4ZpWadK6mhQ4ymOFms6DVOqs
Message-ID: <CAFEAcA_CKm+wjtMh1nQTiVK8W4GDgBXbzugCaoqCvyjXHrVbJQ@mail.gmail.com>
Subject: Re: [PATCH v7 13/16] hw/timer,
 cpu: Add Clock API support to A9MPCore timers
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>, 
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 18 May 2026 at 08:34, Corvin K=C3=B6hne <corvin.koehne@gmail.com> w=
rote:
>
> From: YannickV <Y.Vossen@beckhoff.com>
>
> Add a clock input to a9gtimer, arm_mptimer and a9mpcore. a9mpcore
> distributes the clock to the other timers. If no clock is
> connected, falls back to 100 MHz for backward compatibility with
> existing machine types.
>
> Frequency calculation now uses the input clock and prescaler
> values according to ARM Cortex-A9 MPCore Technical Reference Manual.
>
> More information about the A9MPCore timers can be found here:
> https://developer.arm.com/documentation/ddi0407/c/timers-and-watchdog-reg=
isters?lang=3Den
>
> Signed-off-by: YannickV <Y.Vossen@beckhoff.com>

> -/* Return conversion factor from mpcore timer ticks to qemu timer ticks.=
  */
> -static inline uint32_t timerblock_scale(uint32_t control)
> +static inline uint32_t timerblock_scale(TimerBlock *tb, uint32_t control=
)
>  {
> -    return (((control >> 8) & 0xff) + 1) * 10;
> +    uint64_t prescale =3D (((control >> 8) & 0xff) + 1);
> +    uint64_t clk_hz =3D clock_get_hz(tb->clk);
> +    assert(clk_hz !=3D 0);
> +    return muldiv64(prescale, NANOSECONDS_PER_SECOND, clk_hz);
>  }


This causes "make check" to fail, because we hit the assertion
in various of the qtests. Could you investigate, please, and make
sure you have a clean pass of "make check" and "make check-functional"?

thanks
-- PMM


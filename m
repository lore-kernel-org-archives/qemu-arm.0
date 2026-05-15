Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509A0CD4851
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 08:08:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNnaZ-0001Oz-Bi; Fri, 15 May 2026 04:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNnaX-0001OB-CW
 for qemu-arm@nongnu.org; Fri, 15 May 2026 04:08:06 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNnaU-0002Ms-H6
 for qemu-arm@nongnu.org; Fri, 15 May 2026 04:08:05 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-65c2cd216c9so10404887d50.3
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 01:08:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778832481; cv=none;
 d=google.com; s=arc-20240605;
 b=kgFSGY2VuunD0tTmGjRUHgPszy6CKCbYyv+tqppBOeW0XrwQDTg0uLnvwt3PBpKoel
 RgnVfZgIfM5OJPOf94cIn2colJimkhwYnXtWBdXTvZHCbfbwSWYyvUPhDkO6QJPiOWuB
 AnGVAKeoHvq8U6h7B+lQhJuWDCVQ8Azis7vqzrEyp1ZpS6p8yK/j9/HvHvA0nNwdIvOg
 ZDGq+m2ENK+fx4jrnDlEoQVpp+D6bHnk0irH7bj1HMWuABKwNNFgMT/bUfVaZuDZLKOJ
 jrewDWuViU6NYPOn4epbJYmKlmuXpRcVKezD+6IAXFhNMf0zaCcSGU/oD+QFBbY8B30T
 DBSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=M38U+qau2ZNRXxqkBse09esbSNx2agZ8RpJXMdZSfNM=;
 fh=VtO6B2DNMg7o+VKfsIosKZI4XCssmhnGB1ChlPJudb4=;
 b=AW77NjUa6ZQ/sSfuFowOENN2hP74rXx2z330lUhaFq8A16c+0qcnxUNWi0XhngScVX
 UjtOLikIIKr+Vl7NcU/lJB9H8falJhDOTelyf3sbFXPW7XHeGnpyhv1yc0iswx8nwsN0
 E6n/T/x0jQASyUzYaoCnxgv5ShlH07ErLp6I9HXrZWNDN0vbD1QI9y+hRSjZWMzcZj4S
 c8jZaCI4egAgr48EWb5/n2B76yUplwaf4Z72crS690+JCNw1Ftq2qxo6hGwigSoyhw/U
 oJU5qtd+uOkATpxfsT5h77nCgNxiqmF4YrAkGTh2etlnCrJ0mKSAY+m0Zaym6TFPhT6k
 wBDQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778832481; x=1779437281; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M38U+qau2ZNRXxqkBse09esbSNx2agZ8RpJXMdZSfNM=;
 b=YxCt+A7EXWqpOD7Yz71spAQlQFkjkRx5IPjhcjWGY4QvDmInJx49UkqAuGgBSKomn5
 otbFz2Vuds3cB9R9K2t02MQ8p46nnFzhIdRyaeXn5bu+nqi2QgkejKIdOoAA1vJWfru/
 A1wHEUZScsYQZvX5SF3Y/fHib+yt/Z+PNC3NRUovRkLcxxRIOYcJ4X6KrSzjhOuAeEWj
 JSX0lniSAOZizCKIfOJ0GmvZg/Tr3Xwd2xM+lRq9Vn5rAyufnkuaWEgtV+T9AGP8oo27
 xl5dlEzyR3pP8Z/DlvZRB72WrO53VeipL9OfRocXnYEmd/luUTzZy5m+/ZPeHLL2uKtr
 Mn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778832481; x=1779437281;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=M38U+qau2ZNRXxqkBse09esbSNx2agZ8RpJXMdZSfNM=;
 b=Vj0+8J7Y1dZ7cqe3Y2w60X7ykAeT+BHNyZ/QlXd6z65arwijJlu3cpEZT912CTpcBq
 7Gl6cTvTDU6P9PwH/f7Rx94xlDBUO720xZhh/ZfoFgtlQkFoSXsxNWKrAaxGjSj4aFMU
 T3Mnx24XLWxm2Dt3uAO4Jop+0k4tYNg4lTv8x6N+DBih0lnbjW5hP6R4SYt4OUksb1kE
 mZf0eaYE17kdwL1KY1RLpPtwtWqhp9BsiIxxBuDsbQmgSS5aoX8a2Svz4ysCHFFg74KT
 uRBlIirYdLZt2QM6jGOvJcuwGu69Awo0c6je7UDD5R74MqRsCbTGlH9e7CzubL+VR0OW
 rS0g==
X-Forwarded-Encrypted: i=1;
 AFNElJ/4JSKoOTWfsJBOq07TbiYCXgljksfLrRbe8j8oSpkvIZgE5ro5tJYEQLdmebFWCKRppoS/yoe6KA==@nongnu.org
X-Gm-Message-State: AOJu0YwPiq0rPrnys9ljVGyGjJ7Gi50VUb5L7PPdRoHN3QBd4yXaSS5u
 rtzm505Dk0rQwZoBOhVsXvNcK64JVVd0RYKYN8BzbRQehUv4E/OE6VwQWSzVuP+JgM6updic8+S
 pSd8pgwC+8K3eW/mnycMahDP9fo0dZITTbNWdPyTGBg==
X-Gm-Gg: Acq92OFoKtGhoDotF66cfHXuLgDJkvvrEUGKm+lJcOgK75TVqEeqTKCbiWvZzYBxHm0
 Nvjq+Dr28uGZDUJLUfwd3yuO9hJ6GpqCvdG4kHDN53AvqbSZfQ6G+sULwAcGi9tsUj3ZuIzmuVT
 N/zVzhlyn37vHy4da9EcIR/MyUITpQRIUxOQrmVZFrtbdDMTwE3BrIVT8q4SaTSKSJY0lgq9NJ5
 KRcpFl7Z9yfzJFS2oGE+4JRHDb0hXRFPAh+Un92qzsVC0yzoZRERxBM7P8uG/JnPhFImCC9S+It
 6u2sjPC+gjDDUl6CtgaxEeBZBhq4vuYc9QY7gHpq9seFewXVokwudGRKEIEXWF4ee+fxzpGXaVJ
 3nw==
X-Received: by 2002:a05:690e:4805:b0:651:b962:bc22 with SMTP id
 956f58d0204a3-65e2287ec6bmr2226820d50.63.1778832481213; Fri, 15 May 2026
 01:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260513105517.146706-1-corvin.koehne@gmail.com>
 <20260513105517.146706-15-corvin.koehne@gmail.com>
In-Reply-To: <20260513105517.146706-15-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 May 2026 09:07:49 +0100
X-Gm-Features: AVHnY4LHAtvJmrOcDB073I3s7MbAb6OwCgvCs7qiYwGmBtJr-sH_Iri2D47nYFA
Message-ID: <CAFEAcA-_-peZnCUhXMT1HGvHmFa0Xje1wnH8gd1tkgVpxPLo0A@mail.gmail.com>
Subject: Re: [PATCH v6 14/15] hw/arm: Add new machine based on xilinx-zynq-a9
 for Beckhoff CX7200
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-arm@nongnu.org, 
 =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>, 
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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

On Wed, 13 May 2026 at 11:55, Corvin K=C3=B6hne <corvin.koehne@gmail.com> w=
rote:
>
> From: YannickV <Y.Vossen@beckhoff.com>
>
> Introduce a new machine type 'beckhoff-cx7200' that inherits from the
> xilinx-zynq-a9 machine. The CX7200 is an industrial PC based on the
> Xilinx Zynq-7000 SoC.
> The machine preserves all standard Zynq features (boot-mode selection,
> SPI, UART, Ethernet, etc.) while adding CX7200-specific hardware
> components.
>
> Signed-off-by: YannickV <Y.Vossen@beckhoff.com>

This also still has unaddressed code review issues from last
time around:

https://patchew.org/QEMU/20251204093502.50582-1-corvin.koehne@gmail.com/202=
51204093502.50582-15-corvin.koehne@gmail.com/

-- PMM


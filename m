Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88CDF3092B
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 10:08:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vy5dD-00064C-8k; Thu, 05 Mar 2026 05:08:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vy5cn-0005Xu-Cr
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 05:08:11 -0500
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vy5cl-0007ZQ-Mf
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 05:08:09 -0500
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-64ca09f2056so5719149d50.2
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 02:08:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772705286; cv=none;
 d=google.com; s=arc-20240605;
 b=aI/Mb05smvnLJ7ac98gBrr13xEuxrV2Wbskc1KRhFL3rBJ9NiJz7K185fr6GLI1uJT
 qbBo2mS1+ltD5HVI0AcdYdMRwYfFUqegL8dM4mTfKUCTkakG8LTeAylSY3rSA2xK0yyn
 rbQzNZMaqlxR8D8oY9LVsKsmJ2olA/e0fctISike/vjo3/rGiK+/swm89tjpJxewzaKJ
 MGs7RGaEPYzmOsSgodfrKms6Ic68CH0aSjUgJGssYt0ZViI2EINZ0YSeBeuOLsMMzKqe
 7XYuBWmi7cNLLS15jqSOmHstFM1dZL70bStdrhiJFJSqkc6cuPO5Sy63cHLzkzVi9v/p
 fUrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=zkHjZt0x99k4YWi8QXUYX0HQDy0YamUUJ+u8aYP7oGU=;
 fh=rzd1HULq56ioUztp5upngEINhqTY8RYDUR0YOujSKAY=;
 b=AZtirRhAhhGDnP561wwpRIqlf9PIPmszkaQ0ci5fl94Ns1R7e2UC4ei8ghYaEwuLof
 AAOq6Ucqdcb//gO/VCQANyQ/K/rQPzEknsSSafYPbjpuulVsYqo4+dgRKfts57abIWvd
 ditY+sxiq084ykAsXmB5IarPnm1gM9w/6HIyXfoPkoVgCkZRY5MOSYBI0+nQHK//luFd
 lAVElrnNaq350LWx8yijwVjUB6X91WdLILU3z5JWfQ84DQx+SYwOjAuq1Q2PZzhZA4Mi
 h+SEqLgZsRt7c2HF1OgZFnYyteO5Zfut/X4xujOufpgn8fuEh9aMWiS3M+B3jxwHAFeL
 NNVw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772705286; x=1773310086; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zkHjZt0x99k4YWi8QXUYX0HQDy0YamUUJ+u8aYP7oGU=;
 b=mC3Rt9kb0m1PKQgxm1hba1cXJYPIjlikA5AJT0HJZE/MWrSZHan81h/gyc9XfR3Vl1
 dPJMwctA+m3tvg5Z5H2cT4bEWYp+Gh6Kvk0AusRSXfrOGfIEVnUmYMSnJDz6Jhc9+hU4
 /C4Xq0emCdSsKhMWxai8wL1ubmvBAo1kRzg3FbvtLZOinsjBZmYvXAgI0E72iwVRIU5Y
 Lr5TARtpVLy8IWwM6gcqPlq7J4ouZQy3jbyXAGe7ktFMKcF3ImurZAMNOpnUM0Fw+mJT
 W8ZEvF8XBsJPZtxiVFyEID2otLUmdU7m5HC3Sk6irlItQ+GyA+dbr2s5gP+gIke8Coo1
 uh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772705286; x=1773310086;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zkHjZt0x99k4YWi8QXUYX0HQDy0YamUUJ+u8aYP7oGU=;
 b=vFlNFiRBuWxzlzbncIbNkDzFzma8jPYZGinYX6k6XAECtFf5IBPggMjJ57CjdnWS7x
 kXSbPqC3xoztSs8ZBwe197HqWtU/5SJd7R8BeBp5yY31e4NQ3yai+KdbzshuTVmkG8aL
 4BTVM6QcdTDNK1nu3xtXA3lZAQg0OqT20YoufRhoGw5LHXL6x6IcShg4FtO8A3bOgVIB
 QbYMru2TZCUNF5qPusp2b4Soe4KzIewuCjpAP3K0KrxsybdtNIymKtE+5qUdvOsJR/w+
 jBdDBdoMPWcsyAPNzpStPEuQs7kj6NWK77vHPc6cP1M6TFWb/k64AtYc8ZFnC4laDwyn
 IMUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZhBaRl+Uy+fyfXb45EqYU6tamfEr4wtrgoAow5RmiqwcDAm6FDT6f2oisub0kzpgWCBloD1A9EQ==@nongnu.org
X-Gm-Message-State: AOJu0YxO/47jn829DoZTn4hLEqSEkbacrKW3s3CeKyRfuW/n/lRmg8KC
 Z3dTZ9DPEeBuKWcS6za1gtBUhsLD1skeW5WDrWuaKq5wb2RVx1MMFE7kdsgHCBJweZ88oDZ8UoQ
 kLICVCnH/ZyxFiEXTUW98PaWHqGuEOHyX1BKler87zA==
X-Gm-Gg: ATEYQzzedJ9BY/cbQV6CHtDloGXflyiFucU3aNRNxaIxEEaOrjEC3A3QfinTq9TT8ma
 cjyJjB0DPnmEet1jSoog8FAtaZtqhbKq+3fzTXGU9BjLJGlHaEZt2GA/aMMrhQ2dtyGOUN32ss9
 GAV9oejO6D6JGoT+7rdfwwrcGUlgCyDxhZBa4nqZm4DRwWGiE1H+1tE317MYwYN1i9HlkoaYHNO
 IuTOdcVb3RnXYphh55QnjPbX0FFUBt6uTPrUJOCjvu/LGm5dyGxCzmBp1H4Z/bE1JMSXd9AD/G7
 uy175XQimiLZyiPHXYkltA9JVJE+L/GAXR3X1+pLHv5DSqWzhU6YRbYnFFhJE61UMQQ=
X-Received: by 2002:a05:690e:686:b0:63f:af33:e413 with SMTP id
 956f58d0204a3-64cf9b53c47mr3156827d50.24.1772705286434; Thu, 05 Mar 2026
 02:08:06 -0800 (PST)
MIME-Version: 1.0
References: <20260303222143.142741-1-shentey@gmail.com>
 <20260303222143.142741-14-shentey@gmail.com>
In-Reply-To: <20260303222143.142741-14-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Mar 2026 10:07:55 +0000
X-Gm-Features: AaiRm52qPVcoirAhaPCCzH_ptcnJXie7oefaIEI3VyjjfVEq-Ul9wkTC1aVKdcU
Message-ID: <CAFEAcA91+=5ronWLL8hX2vqGQJepdD_SoLtchcn7U11fvYP9=w@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] hw/char/serial: Plug into reset framework
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Helge Deller <deller@gmx.de>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Troy Lee <leetroy@gmail.com>, Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-arm@nongnu.org, 
 Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Tue, 3 Mar 2026 at 22:22, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Now that SerialState inherits from SysBusDevice we can take advantage of
> having the reset method called by the bus hierarchy rather than having
> to plug and unplug it manually.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/char/serial.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


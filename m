Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F9DFC5938
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Feb 2026 11:46:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvZp0-00082m-6z; Thu, 26 Feb 2026 06:46:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvZoy-00082G-0M
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 06:46:20 -0500
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvZow-0003J9-1U
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 06:46:19 -0500
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-7986d231b3cso20131707b3.1
 for <qemu-arm@nongnu.org>; Thu, 26 Feb 2026 03:46:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772106376; cv=none;
 d=google.com; s=arc-20240605;
 b=Z9aUiNSk/1KOYMGeDQeYXAjtKexSZmIJndUhZYEB2tpUJVfs+0GF/Y9X9+POQ71kvm
 wtpnq25YY4x2DmG0cMqAXvdsfyRxFoCy0JWkxnih6VM4b3peosTYocCDCuVToYsm1Naq
 1F+wOtFcOZQUJ9i4rtKHPl9FSeilM7wRIiDonGHOfFlCoSSVK5zU1NIToL6Me0zDomCR
 p+Obt9F3AZmMNf6KDOpv7d2Dg+fldl3mju3CQ2jU68vOviPoOOzqxW458z8OPdeMEDXV
 LvXtzrSCI+ps0wHAZRoektsO2WzvXFiccPiZr2ViIdY1PkAri6s5sW0tikTaBiZiqAN1
 Yg8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=/Aez1Kdnth4y80iFJd/7PoGi4+eP+jSI8m9FRnz1iqs=;
 fh=SYOba1vwBOfkiYaxYQTtIMBjes390Ke4DNwOeNZsXdU=;
 b=KhzZHI0C6yLmG5zUnKGUhvohoTFLc0UWjRityYG9GZXAYxrawwkXkZefmPp7yH1XZs
 qNSTPwiVSdB3iquxvMUDOkg3K8GSzC19vITPFhQyQVOAbVWHMt47s9GoaJDRYKEB8D6s
 G7IS3WY2qu0dCmIoeHpIHXF+be2+x9DFS4P53pQlnNkw2sSek/JBFtJE3uRYMShfCxV/
 5L/VtlYqq13BbzSi7I1mpaxPkGQf5jGaIi8DV0eo1gMwOMElX8cUYil5OzN+hB+Fem7d
 IdpJP6W8zbdV2nl8KtcaN+dZ6E2Ad0UdO99ibds36a219Tl3qBPvQ+ATKeocOpCQUHT8
 1nlw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772106376; x=1772711176; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Aez1Kdnth4y80iFJd/7PoGi4+eP+jSI8m9FRnz1iqs=;
 b=t1+65Qj5ssf9pVORD9HadU9JSZ066p92YE5r+XBNf/iWJYnB0MzGeBBnel9dIyKVMe
 972/zi+rUAINN3+L4O54i58SXceluO11PzSsFGgfsecwuz2sHFlKHn2FTrfqUHKFqX/H
 x/XgoVO4PESRieGTEhAmUp/g34Fsxf5q9q8Sx4nHuLn7lQiCWeEihgHa4bLhlLdn1oZC
 RYTXSTpTbzpOpCLykrQaW1jQFTgY+zLeR45SGS6tiymy3cNxQp0vmhmZtgfZEKgE0Rt0
 0PXpHOu/VM+pPgQtY3ADcl1dXQYdfx6YyLPMpoyMHMQ09TAp6J8m4z4tTJSXWpgQ2pJy
 sgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772106376; x=1772711176;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/Aez1Kdnth4y80iFJd/7PoGi4+eP+jSI8m9FRnz1iqs=;
 b=FkRvBplge6W+YdOwscWjTYuzNIZ1wmjGr+LkjqdamCFpOPG2nm2A1/gA2vDrveJ2z2
 x7ncph2a7TEgrPzXxHHu7IzrQDM7acVG3slF5qJJeGPAECTVVEzgsDR/ZSUeo7Wi2P+S
 ov80HFgFtXg4UGILJDHZXdOlrY6Wslnm9VXvLn9o2kNLdDLDi09+FtMN3xx8uODzSdF6
 WNVDtPb8zoPR60cY+JpizGz9zcrKvIpVGO8wnrvNjkfsS3y+/MXHpBxDEszbYsu8GWc0
 TZn7rM3K8wPqbGKxHUKXbQrAsYSMEGpkrTCwRAyiLeMRyWk/QVxuGYkE47YWfk0twsL/
 ipoA==
X-Gm-Message-State: AOJu0YwtNeCkuaPCHHiUCvwP8erlY/6IctYNwsTdEGuCdHV9QqqhnCJN
 FnxsTvohz/duEp6zLKLEF+7nJk0Z6V7r75G1yo9t9cmWeJaEKdFa1vTw6TAPquuReA63PPmSpYq
 VvJGWcu83MlTx4XJaQbQbbAlcYJwRtEU+Sp5od7uuMA==
X-Gm-Gg: ATEYQzxJFyIRWjHPxSGpzYDHAhUvBRNVqolyv+oNhcfdR44CQhAPAvtSnaPVlgAPNto
 SH4+tHjunW7MK4bAM5sZ48Em0RV5IN+lvDtj1GIfvM5NN1/Uii57oH0lUJqXKAoad5XyguHTBsg
 nnmsl497f3Hrqw80Sgw/9PzghECMcxxe1Xoic6rXzZCpH6ymwOJ3XHmFZZpfyY30rBY0b+mB0XA
 FvJLsQTZwFuxP6MPvLgJ7MPaw2eE1nSmRzNSOfwIP01nsCI4u+t3FvdDuDx8cxNpnLNuwtD0VkX
 h6vStFyLOV5iiHynIpKYtPXNU3pCZpiaNGd1DIUdUAb1zI8QO7nJl03EekPhhc5Kjv4=
X-Received: by 2002:a05:690e:16db:b0:64a:e1e3:77d4 with SMTP id
 956f58d0204a3-64cb6f13152mr1285500d50.23.1772106376469; Thu, 26 Feb 2026
 03:46:16 -0800 (PST)
MIME-Version: 1.0
References: <20260202133353.2231685-1-peter.maydell@linaro.org>
 <20260202133353.2231685-2-peter.maydell@linaro.org>
 <de487ce6-8e8d-4f30-b4d7-cd55c488f36b@tls.msk.ru>
In-Reply-To: <de487ce6-8e8d-4f30-b4d7-cd55c488f36b@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Feb 2026 11:46:05 +0000
X-Gm-Features: AaiRm52bRuia-bcPT0VVSoWgrAnv7t4-xFfv_xOoRi3lvqE-HZA5ImAvwtUc9sU
Message-ID: <CAFEAcA8OPk=ufv7y3NjS1hAT46Dz5uZrS5NHhqVLAvE7Nihhdw@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] target/arm: Account for SME in
 aarch64_sve_narrow_vq() assertion
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Sat, 21 Feb 2026 at 07:14, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> On 02.02.2026 16:33, Peter Maydell wrote:
> > In aarch64_sve_narrow_vq() we assert that the new VQ is within
> > the maximum supported range for the CPU. We forgot to update
> > this to account for SME, which might have a different maximum.
> >
> > Update the assert to permit any VQ which is valid for either
> > SVE or SME.
> >
> > Cc: qemu-stable@nongnu.org
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> > CC stable on this one, because it might also be a problem for
> > a CPU with both SME and SVE but where the SVE max VL is less
> > than the SME max VL.
>
> Hi!
>
> I suppose this one makes sense for 10.0.x (LTS) series too. There,
> I had to cherry-pick another change for this one to work, -
> v10.0.0-1910-gc48d0471be "target/arm: Introduce ARMCPU.sme_max_vq" -
> it appears to be harmless for 10.0.x and makes this fix to work there.
>
> Please let me know if I should've resolved this in some different
> way, for example not picking up this change for 10.0.x :)
>
> The result are the topmost 2 commits at
> https://gitlab.com/mjt0k/qemu/-/commits/05271d6e00894ef47267133dedd6a69c2=
a3147a5

Yes, I think that's OK and it's reasonable to do this backport.
The combined 2 changes are at least safe, because the MAX()
means we're relaxing the assertion so it fires less often.

-- PMM


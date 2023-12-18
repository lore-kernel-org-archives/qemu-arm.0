Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp845438eji;
        Mon, 18 Dec 2023 06:54:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxWHmjKP60h/YrPpKc91EdPvsfvPtt/i4cGVo6AHFQwMUQ2VmjZ13jffsscD5cU0MYYnxg
X-Received: by 2002:a05:6000:881:b0:333:2fd2:5210 with SMTP id cs1-20020a056000088100b003332fd25210mr7456869wrb.137.1702911250507;
        Mon, 18 Dec 2023 06:54:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702911250; cv=none;
        d=google.com; s=arc-20160816;
        b=HacZ/3Cuntj3+2EcYjiug0i2eSfRAs1DU2Epem/zIsmhakh/RVV4qVKV5sSfPWkXy6
         iasuuntzB09KIhnBf5gZq9Xvs6ncVXyw279I6q2KfC5Swq0YBAZ8kgLYSqctW8sK7LBu
         DAnOFtFcib8oYQjei2hvn8nQX95EI0j3CwfGrTXTz4RPOjWovzMGjPbfSOiXEA8CHuvJ
         PvxN02QibWkEkzHfw7nWp/G34DsvDOau2JkENx+hGlwSpi1fgVJHPESMfygxU+QC1hvP
         ShOS8MdtNzcP2oa+NW2dCQv3Cys/RZXBOLcMmnVCRAKjkcufYRPrSUwB76xfusBi/Cgl
         OSKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=N0GisI5Cj/+d1y5wO4vQHvEhnw40IXcjJYnIm9AP1y8=;
        fh=zkiJL7/844h+udaU7d3wJCcJ5XLeEN8uDQnXx7VAkoc=;
        b=eoA+H4pYUxVHSx6Bwlt6gWV/7+O3jnGzJg2PSQLfA4Z5s4zVS9eOS3XnStZZH7ezx6
         GXt5sWK+7tJHiVOCVFcVA/p7vNVtC+f9LE3ERjWYD6AV/tHyJG8HcD47QCvIBwK7XP7H
         3Uwn6ZNN9r2tClP9XZ0Q5ilZ3ew71x6gIKIBsgraVn6MDvO36y5ucj2OQi9gq8eazQnR
         awMRt1Xz1EeAp7douJqXWDsaBsNwZLG/q4NLGwO+5W9aTSA+8PxQBibbqWvIo2koa7Iu
         l0a3nYL2feFFnKoTXh3PdxFmgGhJi1HJHifxnBPYv/jXKkJkgK9tZ1LdU8wWrmqY2YJ3
         O0+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ugoJ1A4i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6-20020adff106000000b003365df5c6d8si2579774wro.835.2023.12.18.06.54.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 06:54:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ugoJ1A4i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFF0G-0006qY-IW; Mon, 18 Dec 2023 09:53:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFF0F-0006ph-Au
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 09:53:55 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFF0D-0005PX-NX
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 09:53:55 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-54f4f7d082cso3852668a12.0
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 06:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702911232; x=1703516032; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N0GisI5Cj/+d1y5wO4vQHvEhnw40IXcjJYnIm9AP1y8=;
 b=ugoJ1A4i+mOkey/KtfYUzRQl6pN7zZq7qIjuyjfp4cKkLRyp9kjDJjVV/Mfkizeufb
 uRmMQWQx0ZGedStMBmyJPZ4E14Q0XjWfHZCmkD2CVrLhZi3ocpi/TfHrb+2qdRRU1X9+
 VrziMDLym4SNStv459PxK4cjrNFqFuB4KR5iMDLaPyMXams3jGjD8EgsKKnaiczoXwr0
 VA6+R6RLvUc97Ei+PYOuaEpmk621lf5nEOi/sJoInkUUNEzGqLe1T7qfNUxO1zUwwS5q
 UmhnpQdoWYZpOzCnq52GUpYAK6O/1i6eZ4CpdHZhzxy8HWh2cLRHnm06QCVS2MLG6UUV
 Ngyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702911232; x=1703516032;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N0GisI5Cj/+d1y5wO4vQHvEhnw40IXcjJYnIm9AP1y8=;
 b=AycdQX/CM5HXy0p9J5uZeUXKu36bB+u3KuQp3lY33bvtYvZUpEq/d8hrgo+ve9rkHE
 iSj2l0MqIJOrjvVEVGa4wh3WWDTf175Nsgq1W9f7dK/PnGv0+qtc+sgg+gtsKLNXUvcf
 18/eC2RLR73XZqmEYA7dzaxQ0dz4IhLKFER8xVr6kcWsoejr6phZfh+Q6NQU8jdEF+lc
 X3dhQAQNDKuuTEtlhmWITjuvy+tl67qHB4QhSOyHm4Oxq/nMt/0y/6TZS5saGcbM5ZQ1
 sl4J77U5/nRo4w4IqXzkrQNf9FykdGnx9NyjN8/melK2HYMRZvSFfN//3sWhNPuO8U4H
 5h5A==
X-Gm-Message-State: AOJu0YzIPVlh83CfAkCsi3mpdBRuzRU6K4cOIc0N3ScOukS4NFxzRoNl
 cV/if90h+asmktjnrztS1F41fQtNh4aYdjlQpIu3bg==
X-Received: by 2002:a50:85c6:0:b0:54c:7b90:f40a with SMTP id
 q6-20020a5085c6000000b0054c7b90f40amr10520015edh.4.1702911232016; Mon, 18 Dec
 2023 06:53:52 -0800 (PST)
MIME-Version: 1.0
References: <170256739558.25729.14053113716470464567-0@git.sr.ht>
In-Reply-To: <170256739558.25729.14053113716470464567-0@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Dec 2023 14:53:39 +0000
Message-ID: <CAFEAcA_kYruv-b8_FzSTAE+yKh6PTYjHHbFEfiqOVwDR462kpg@mail.gmail.com>
Subject: Re: [PATCH qemu v3 0/2] Add minimal support for the B-L475E-IOT01A
 board
To: "~inesvarhol" <inesvarhol@proton.me>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alistair@alistair23.me, 
 philmd@linaro.org, ines.varhol@telecom-paris.fr, 
 arnaud.minier@telecom-paris.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RlwJ47NWiY2+

On Thu, 14 Dec 2023 at 15:23, ~inesvarhol <inesvarhol@git.sr.ht> wrote:
>
> This patch adds a new STM32L4x5 SoC, it is necessary to add support for
> the B-L475E-IOT01A board.
> The implementation is derived from the STM32F405 SoC and NetduinoPlus2
> board.
> The implementation contains no peripherals, only memory regions are
> implemented.
>
> Sorry about the inconsistency in licenses in v2, I changed them.
> Should I clarify anything further? Thank you.
>
> Changes from v1 to v3:
> Changing the MIT license to GPL.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
>
> In=C3=A8s Varhol (2):
>   hw/arm: Add minimal support for the STM32L4x5 SoC
>   hw/arm: Add minimal support for the B-L475E-IOT01A board
>
>  MAINTAINERS                             |  15 ++
>  configs/devices/arm-softmmu/default.mak |   1 +
>  hw/arm/Kconfig                          |  11 +
>  hw/arm/b-l475e-iot01a.c                 |  70 +++++++
>  hw/arm/meson.build                      |   2 +
>  hw/arm/stm32l4x5_soc.c                  | 268 ++++++++++++++++++++++++
>  include/hw/arm/stm32l4x5_soc.h          |  59 ++++++

Can we have some documentation for the new board model, please?
That should be a new file under docs/system/arm/, that you
then list in docs/system/target-arm.rst (note the comment there
about what order the ToC should be in). The docs don't have to
be super comprehensive, but should at least:
 * describe what the board is
 * briefly list the supported devices
 * list any missing features or other limitations
 * describe any machine-specific options (you don't have any yet)
 * if there is an easy open source guest that will run on the board,
   some instructions for how to do that (this part isn't mandatory)

docs/system/arm/orangepi.rst is a good example of the format/structure.

(If you pass configure '--enable-docs' that will ensure that it
builds documentation and doesn't skip it because you're missing
a dependency.)

Then subsequent followon patchsets that update the model to
add new devices etc will likely also patch the docs to add
items to the "supported" list.

thanks
-- PMM

Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp179336ejc;
        Fri, 27 Oct 2023 06:04:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyTj+qXtECKRE/6BDQaFpysl+AbG7fBRs3IwsP5wP+/5a+iWM2FTrqNsMN8Nc/nR8fY6aj
X-Received: by 2002:a81:b722:0:b0:5a7:e726:13f7 with SMTP id v34-20020a81b722000000b005a7e72613f7mr2792786ywh.8.1698411850943;
        Fri, 27 Oct 2023 06:04:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698411850; cv=none;
        d=google.com; s=arc-20160816;
        b=UyQJq6iVBVEr+lh3iwCguVD+0ox3xD5B5SaxrXo+heuhnAOcdCu1s2UN0RE6N7QEIH
         JTvjxtmdvrBPa4tIb0GIT1FX34AY3IyIpxgMa3jGIs2zgVKuDryBl4lTdK09E4C9pj5L
         RWkRt5iSnHY2TMjJrdTCdp2d2xoDlXU7A+A+lLSCEbs4BNUEcyqFXWt1TZ9vmkwlA0u/
         6k6LV7relMsfrsWrnJ1SNirCmUClMxyTigXB97wXihk67zL/uew9Qbc/kx+pB2y/1Pmv
         w9JYeVMalkAPpjCy/MNa12pz88uxhbnFoSafd7Fuf8Vt1cggnYQo0UjL5FL9cMbf7K46
         Rh3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=OmaGEdYLfcwVW8My/wzbArbg0lEcMY/dWqxgdaVVC3Y=;
        fh=SvHDuYAzdQV5U08zdZH97tLIUUiEaLY00f4mdxmyTQw=;
        b=yR0F1mKx26K+SsUfLHboWrz3ZaXbjAA9tmyp+LZkvm0aj2QwMxB6eJw+0qTB0kU3Rj
         FrtAqN6Lupuz2Ps+rUjMsB2Je99rawbI64d7Fwh4X2jC17x0VVzF2oiMfZJkBMQZ/1hf
         uEtHaLbzYTYSkS2AGUevTbY6lrbW8C0Y+hPSSLtcMLLpTTVfczoEWbZEGanPO2VgBad/
         VSMT1KqlZtrnw8k1wWfF30otmUf8fpZ/T8/LUj1Ee+vTIVVvS2WGFuyLmcSAzT70sjwZ
         V7FyLhZ2aWuEHhvKxR2D0AEfhEonn5IFwMHzPlibs1kLPKe9reEDQnhf8RIfOMHOVNgS
         vhgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XO6eKtJf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h7-20020a0dc507000000b005706597c051si2405236ywd.145.2023.10.27.06.04.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Oct 2023 06:04:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XO6eKtJf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qwMVB-0006vf-P0; Fri, 27 Oct 2023 09:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qwMV9-0006uz-UP
 for qemu-arm@nongnu.org; Fri, 27 Oct 2023 09:03:48 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qwMV6-0005Ke-K8
 for qemu-arm@nongnu.org; Fri, 27 Oct 2023 09:03:47 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-53e3e7e478bso3160928a12.0
 for <qemu-arm@nongnu.org>; Fri, 27 Oct 2023 06:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698411823; x=1699016623; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OmaGEdYLfcwVW8My/wzbArbg0lEcMY/dWqxgdaVVC3Y=;
 b=XO6eKtJf80cEFys6eUSgYKS714mNNmDDj6t8XSkfRKgDRzAixRmxHBPNXyfOiuOrxX
 cQQ0kVqsOS6GNSwFtTIyxl6WA9ovPGR/RBYyb/vSfdeLxdR0vAOu/0Nryd8W7P9dWeCn
 Xz8poWhpaLwpYdwnUH0e0kyhrslKfaw9gvrguyLncG4C1s3UY7Fv/vm6NRd80KsBeq2l
 bb/vviNJaBzJ/+/XE5lSSW5O+KDBhRGhlyunIQjwT1SGFiGrVvgSb1xMc28GB+2AlGBh
 wOrRkzr/OZIxv49Z3mGBYms2fHW+6rLqoJURSkhh60ZwloK7wntN4vZuNEAvKyTHyrbs
 BkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698411823; x=1699016623;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OmaGEdYLfcwVW8My/wzbArbg0lEcMY/dWqxgdaVVC3Y=;
 b=Re6Tw8lOQYY515LtMhQL2hmbRs9W6AFe/sK7dzHkPVvSQZzwp+VlnCQgc/20nSuYjy
 HHlx1LJJJ9w/IwisaW6hIMCBL2wzKNO5CIugo9aS7oWcHWV42rskyRbYP7iR9f472xkQ
 nVA8lvoY0KCw2ipd1Ze0ad6MMmAReocy1t0Ieg+Msw0Q6BoCbpGM/j7mQ0zhXeAyefLR
 qOyYO5PUAD1wnFF54b855SKkxNR/DhAPXEnzrJF2nBXOcpg2/HJpDlyOYpbslRlldNAP
 fTVYKtkD8nqfeu6Rzy+6EATIYT6OGHU/VhTiYr+bm1afqcMGtfrvaglAmoz4ePzLW8mB
 gxRw==
X-Gm-Message-State: AOJu0YxRJYPRBbcp5ZvdImIxjAvBgn6QZfd0pBnufU0s4JCQObcPH3be
 rBxmglILQGJTNfFGl4FqizVU4wEBGN5Y5J/yDprQKA==
X-Received: by 2002:aa7:d613:0:b0:533:9df5:ede with SMTP id
 c19-20020aa7d613000000b005339df50edemr2045806edr.14.1698411823037; Fri, 27
 Oct 2023 06:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20231017193217.1512868-1-tong.ho@amd.com>
 <20231017193217.1512868-3-tong.ho@amd.com>
In-Reply-To: <20231017193217.1512868-3-tong.ho@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Oct 2023 14:03:32 +0100
Message-ID: <CAFEAcA9v+E0UEkV6T=_jhB656Z+eugR_JA3kQitamHUWcAK9Aw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] hw/arm: xlnx-versal-virt: Add AMD/Xilinx TRNG
 device
To: Tong Ho <tong.ho@amd.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair@alistair23.me, 
 edgar.iglesias@gmail.com, richard.henderson@linaro.org, 
 frasse.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RnxBRx8aTsaQ

On Tue, 17 Oct 2023 at 20:32, Tong Ho <tong.ho@amd.com> wrote:
>
> Connect the support for Versal True Random Number Generator
> (TRNG) device.
>
> Warning: unlike the TRNG component in a real device from the
> Versal device familiy, the connected TRNG model is not of
> cryptographic grade and is not intended for use cases when
> cryptograpically strong TRNG is needed.
>
> Signed-off-by: Tong Ho <tong.ho@amd.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

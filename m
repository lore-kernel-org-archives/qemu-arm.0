Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp624711njb;
        Fri, 4 Oct 2024 11:24:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWAQ0N/L9xLEs8QcZSMkFXoD/X9n2H+yZncZERhEkw3MkaIBT6kMJJcQbZaPVefOpV5T0OeN3Xwz2KQTw==@linaro.org
X-Google-Smtp-Source: AGHT+IFbIcuAM892wnQLkTZ7Bm631vBrINOCh1AiRMnhS/P+vf/dERZgHll0Xgnq7WJ75hwOFj97
X-Received: by 2002:ac8:594d:0:b0:456:80d4:812a with SMTP id d75a77b69052e-45d8d06f932mr134145941cf.6.1728066242271;
        Fri, 04 Oct 2024 11:24:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728066242; cv=none;
        d=google.com; s=arc-20240605;
        b=kK51kM+A9BcOLM9cn0lvJW5D/MSKv55j6U/BD69LQuLqd7e5wH76dibR7KinE8DhXm
         QjDzNUlhGixMdWAqzFXj6vYE1kL6uoS0DwZ1kRMr37V92eDuVNvSFu+GSqmvXaS7tWsF
         9T+x4F3u/BAIp0LdV88eSedIMe5KiVzjn5tyfUkYk2hhL7E7iLCsM58tTz9mKHJESu/O
         6lghqc6AcdX7CH8NR8GdCJjcuFBOsKXU6wecRb5FY9ujii2Wu/Kyvu3epQYhWHV5YYYb
         A+KWR1yakEFZZNr/t8xWGycwYRns0qXNIhYyHRK3fKZSSCUznqE5eZXJzTektckYByZ8
         8zGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=fvLlRdLKJPdszF4enlY1FyhGNngo4mPeyHf5RkZPKts=;
        fh=gc5KcyZvb5EukBWAcAqJYJFzy2j7OfIVnH14NzjLUiU=;
        b=RqH8PEtlRZKNOnBH9owdZr9ieu7f8ga/rqLNesH+AhV3frRl8nyeESi2ByeyvF7aRI
         C8Y3WDj/qWizblqk/hbAUB/mr7mdeG1SxoSJD2vewOeCa6dyOYnToBtlwm3clSiLByJD
         FDfKZLlq7Sia1gX7qbzRY/z+yeGtJWmEc+M5IpUHdSKNl+28Y8ivlEsIQ9jmGVMd4BYV
         SSNHYlsV65uLvHbeEKIPx8hgyEAF9BcfNTGUAyWeIURyeS8LXTNhwkGoN7lPVK909rnZ
         HN5mTicFmKWKvPLFCLmZiud8PNtU6fsem7xB1ex3/zYKPKlC6Qg75dzNvOdPDGm22lBG
         yHZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZETUI8Ot;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae75615b31si18760885a.104.2024.10.04.11.24.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2024 11:24:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZETUI8Ot;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swmxi-000105-Dv; Fri, 04 Oct 2024 14:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swmxh-0000zu-6B
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 14:23:33 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swmxe-0002Ww-IN
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 14:23:32 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c8952f7f95so2720195a12.0
 for <qemu-arm@nongnu.org>; Fri, 04 Oct 2024 11:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728066209; x=1728671009; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fvLlRdLKJPdszF4enlY1FyhGNngo4mPeyHf5RkZPKts=;
 b=ZETUI8Otv/Y81YdypVCMRb7hTjZrP9QmoN1fEZbc5yIaHQoXNanb/dGswBxakgdcpu
 Hif6tiYLEDqPghb2izMVoxySnUMRbJqp9ivPIPusYGl8R8Dl3Cl3V95+pLAaw2Ve3NAX
 lSKY5udcQy/EoByyrW+dy7el5baBu7/cciPMDfzpC/W4YbAPUzaaB2wsNye22c5R1Q6I
 B3PYLA9fX5q9OTHxdObWuK1uREGSiv1jA3yWbiDRKRAN7iO7e04b7xcVSDKYEK4sD9oX
 d4Tq1mhRPc4p8hQgPulRT/LtbbfHvRDW8+tx5/rK6eePRh9HQEApfAuXihnzSJGpKfcB
 oQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728066209; x=1728671009;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fvLlRdLKJPdszF4enlY1FyhGNngo4mPeyHf5RkZPKts=;
 b=BrqSo6O0SpIY5V5P1Wvt/AjNhFb24EBVScW3fbZeUNZFl/1e8pVCch/1z64PXRGvqO
 HAPv0CumBhACVl/B9KLZn80I0FbXCBzuDdlrxDaIrpxmvVUiqZZU5CqWQVAGri4Dtpos
 YsdD6sxP72Mwo4N2lberUF2LQvvrYo08lKQR1UrD93wRlyY5QryVEwfgcDkHUEIu6P1p
 Jvqb3TCcHZbqUi2vkjpXLZd4bADjeKeS5O1t8BOMTX0m+CXFzCKIEQyPxNrOlAcUKdaK
 sjGXoeCKtKOWt4YNWlCHTssfgcMMC+IdBaeklW3RYvyvP35bw8V920JPzHb5zr3HM+Vb
 IxMw==
X-Gm-Message-State: AOJu0Yw13yNt8ud0tCupQLZjSzmBuEcKKItEtA6tNbFyBxJoGTV0vN2B
 GWWZBIBmbUrtFkwFeUZaUUeQ0ODrwedK2q/T/lhfaGBh42z5xWdXbGiumoPiHemAh/4s3Dj787h
 OKfFDGE1z4z1jpi7HBjbt/w76LTPUkMG2MI4WGA==
X-Received: by 2002:a05:6402:440b:b0:5be:ee30:9948 with SMTP id
 4fb4d7f45d1cf-5c8d2e14ea3mr2502999a12.8.1728066208313; Fri, 04 Oct 2024
 11:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240927150738.57786-1-rcardenas.rod@gmail.com>
 <20240927150738.57786-3-rcardenas.rod@gmail.com>
In-Reply-To: <20240927150738.57786-3-rcardenas.rod@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Oct 2024 19:23:16 +0100
Message-ID: <CAFEAcA-6xoyYHJK-ZEHL9OzPwj4367ZqQ5d1DqA0hNKMhczV+w@mail.gmail.com>
Subject: Re: [PATCH 3/4] STM32: new GPIO device
To: =?UTF-8?B?Um9tw6FuIEPDoXJkZW5hcyBSb2Ryw61ndWV6?= <rcardenas.rod@gmail.com>
Cc: qemu-arm@nongnu.org, alistair@alistair23.me, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: kLHTF8jMMcXc

On Fri, 27 Sept 2024 at 16:08, Rom=C3=A1n C=C3=A1rdenas Rodr=C3=ADguez
<rcardenas.rod@gmail.com> wrote:
>
> Generic GPIO class for STM32 devices. It can be used for most of STM32 ch=
ips.
> Note that it does not implement configuration locking mechanisms.
>
> Signed-off-by: Roman Cardenas Rodriguez <rcardenas.rod@gmail.com>
> ---
>  hw/gpio/Kconfig              |   3 +
>  hw/gpio/meson.build          |   1 +
>  hw/gpio/stm32_gpio.c         | 386 +++++++++++++++++++++++++++++++++++
>  hw/gpio/trace-events         |   8 +
>  include/hw/arm/stm32.h       |  41 ++++
>  include/hw/gpio/stm32_gpio.h | 109 ++++++++++
>  6 files changed, 548 insertions(+)
>  create mode 100644 hw/gpio/stm32_gpio.c
>  create mode 100644 include/hw/arm/stm32.h
>  create mode 100644 include/hw/gpio/stm32_gpio.h

Oh, I forgot -- could you consider adding some tests for the
new device? We have tests already for stm32l4x5_gpio in
tests/qtest/stm32l4x5_gpio-test.c which you can probably use
as a pattern. You can add the test cases as an extra patch on
the end of the series.

thanks
-- PMM

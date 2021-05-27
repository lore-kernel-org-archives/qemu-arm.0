Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp170907lfm;
        Thu, 27 May 2021 02:28:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxNEvMANMbU2PMReHmf3ZrQlHqGfGsBINvEYtCn6qCAk1yWu3aJAMMXWRfpIfnHwXysvUx
X-Received: by 2002:a25:ba83:: with SMTP id s3mr3385130ybg.280.1622107700141;
        Thu, 27 May 2021 02:28:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622107700; cv=none;
        d=google.com; s=arc-20160816;
        b=FzslRnKOQY4SU+qva65rHOUcA03gORJ0Oz6+LUBnG0MglTEaHJ+s6P5Jur9gRnglnb
         WgeExTYru1zhB88DEfjqtwVp8UCWyCLvRZ/ZKSpBgRZFHuzIrwPgnfrlV5znrEM/Wnxk
         sLe67BAocYEIZwn5WnsafVIel1xmixQGYyjsxcUK0UJOVf9hnkedt+rdgbfHbdVmKET6
         XKdxfqLcsrwiy4CCBlVZzb6fbu0yLwMk8hROPzhqbX+umWiF716PcmmR0a3X+9oeFp6F
         nsmbmJhLyyAV662v8qrcls2z0xjhG5gXT/R7PddbWBPXVSRvvA1HIArbKSJJa+xPuh+C
         s1pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=107pA0QjTIX+m6t0IRQ+DHQqazt1HtFlkQYv1e+lqZE=;
        b=Cl6Ps/LqNEzGxYG1GeEbPKKgoZYnulsGfhBwDd+WVNgj77FL+tOlYqW4N30JDLGGtQ
         VyQY8KIeDBg+O+YOFtb3YZxoG+OhxolOpPxWIWRIH/P+3Ny4VFGK+zkf8lMK8ZjdbAmW
         JJqVDMIQGVlUOO9/8WdJ1K5JDQqnGMLwR7IFrvepmbzPM/bgwyDcyDKKAUobeXNemXSC
         JrSQmFI6QPPpcRUNQNHCeVyVJe5MaKBRatCoCawEYYgiv2nvD1krtj4ffwwkqrL1TMEO
         BEMYwkV8zTsk8NMyvolc/yeol/1RYYUkofMaNgUThH7TuoP2HSuxNKwLRX0/g6/lllwv
         h1wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AQCdy68U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m63si1982637ybf.426.2021.05.27.02.28.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 May 2021 02:28:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AQCdy68U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lmCJP-0001DG-Ha
	for alex.bennee@linaro.org; Thu, 27 May 2021 05:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmCJH-0001Bd-3b
 for qemu-arm@nongnu.org; Thu, 27 May 2021 05:28:11 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:34506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmCJE-0002jh-5G
 for qemu-arm@nongnu.org; Thu, 27 May 2021 05:28:10 -0400
Received: by mail-ed1-x52a.google.com with SMTP id r23so87632edw.1
 for <qemu-arm@nongnu.org>; Thu, 27 May 2021 02:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=107pA0QjTIX+m6t0IRQ+DHQqazt1HtFlkQYv1e+lqZE=;
 b=AQCdy68UecWyE5JdxgBqiCgWuLrj07kGsiYkHkLbt0ivMCF12ifJcOMJPSeEHtKvii
 uGvittTDL9KMhOq3k4aEpN+p+3iXgfcnQ3Y1/gimwM7AXvUYiWGHYa8URP1L+mCL1BxB
 U+0/VfJPcxI2ZUPG+xq/eO6/CL5jP/E+faKdpVW9NIq6GSy17l5MNbxa0eKO/Y8afPRv
 rJ8MrAPvmfqxsiJS1ewuvvv8kP0Mji7IVCYl0uMhp4qw4w7zqnCYchtZDJFe1YdCKNLm
 uwu6/m9CS5Afm0TfAdXMck5JWZ5o2U5coGaBloDKPU8rFvuSdved23Q158r9U/Gc/NuF
 hkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=107pA0QjTIX+m6t0IRQ+DHQqazt1HtFlkQYv1e+lqZE=;
 b=W1YRL4dA5me1/g4w+tH/vI6M8C0E6giQm5iWO8M23JwvWwYw9wm43QC+4LtDWFfpI5
 ikrGvlwI8P1SweTgoEYP+3n3C8HaiWdvxjXpxzomODBuvq1cKNU0ozpK6zh77fACOtln
 xVUs7dnWQWFU5i6Mt09dXA2NLZ2nY9OFuY4Zjz97A+xaOAgBcLbe1xopGnNRlhOsbinn
 /Bwy/tweB4c4MPkI2/W8SFFsbREK8+IhXeBoz8phsi9VSLXna2IfS0Ee4nV/bl4yZt8Q
 Cc53BQttX1el8lBi8fdnwI8kUh0hPXxYaWjyl3l35LRLo2UlctgdinyRTzB1VmZKyjil
 yO3A==
X-Gm-Message-State: AOAM533RnGdYCUZuUWiT2Ryg/p+RTMKJcxnlmFFTx298ddChWDNsDlBU
 AudU6Ip+nZ5AcLtfr44PqJZ/2B7cvFiCbfoYCL5CXg==
X-Received: by 2002:a05:6402:190e:: with SMTP id
 e14mr3124478edz.146.1622107685890; 
 Thu, 27 May 2021 02:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210519200942.2223292-1-f4bug@amsat.org>
 <20210519200942.2223292-2-f4bug@amsat.org>
In-Reply-To: <20210519200942.2223292-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 May 2021 10:27:39 +0100
Message-ID: <CAFEAcA-G2Gtd+mCAUXGtL0OJXUwTt=zFAWe0WPvkhSeiAuLnUQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/usb/Kconfig: Introduce USB_CHIPIDEA symbol
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pxZtlRqoS8gD

On Wed, 19 May 2021 at 21:09, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Currently the TYPE_CHIPIDEA model is only built when the IMX
> machines are built. Since it is not specific to IMX, add its
> symbol to allow other machines to use it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/Kconfig     | 4 ++++
>  hw/usb/Kconfig     | 3 +++
>  hw/usb/meson.build | 2 +-
>  3 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index b887f6a5b17..585de92f00a 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -385,6 +385,7 @@ config FSL_IMX25
>      select IMX_I2C
>      select WDT_IMX2
>      select DS1338
> +    select USB_CHIPIDEA
>
>  config FSL_IMX31
>      bool
> @@ -403,6 +404,7 @@ config FSL_IMX6
>      select IMX_USBPHY
>      select WDT_IMX2
>      select SDHCI
> +    select USB_CHIPIDEA
>
>  config ASPEED_SOC
>      bool
> @@ -447,6 +449,7 @@ config FSL_IMX7
>      select PCI_EXPRESS_DESIGNWARE
>      select SDHCI
>      select UNIMP
> +    select USB_CHIPIDEA
>
>  config ARM_SMMUV3
>      bool
> @@ -460,6 +463,7 @@ config FSL_IMX6UL
>      select WDT_IMX2
>      select SDHCI
>      select UNIMP
> +    select USB_CHIPIDEA
>
>  config MICROBIT
>      bool

Missing "select USB_CHIPIDEA" in "config FSL_IMX31" ?

(Side note: is it worth moving the FSL_* config sections so
they're all next to each other? We seem to have allowed them
to become separated by some other unrelated sections...)

thanks
-- PMM

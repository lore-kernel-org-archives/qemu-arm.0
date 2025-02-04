Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp320258njb;
        Tue, 4 Feb 2025 08:16:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVd4ixOZRtoS6dG7wuez4ym8kmMlMXU1amEaSrhPDvdE3qh+7huEUmTnU353qsHAFSV+SQil8WdFClcMw==@linaro.org
X-Google-Smtp-Source: AGHT+IEYg07ni2pS52+YGa0CPKWzca3b7BCqPrfuatMBMr0nP8NyhkJKzvWgkeos/W2owPDsRt2N
X-Received: by 2002:ad4:5742:0:b0:6d4:254f:1c8e with SMTP id 6a1803df08f44-6e243c7d3d2mr450108576d6.37.1738685798657;
        Tue, 04 Feb 2025 08:16:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738685798; cv=none;
        d=google.com; s=arc-20240605;
        b=bHMv9pDhOEJvgklQerbMZV9HNYVYfVoE/6C9Bi5DjiVasiLKMyT9SPE4TGlKWIGZIb
         uyv0SBRMSPjy5b9fv6KWb5YewwvfgYv5sx7eRznubXSq90mZBkMoFI82UdaY0446JEs9
         VnDuGwlbJFbOQrvs4DaM3Uenia2KbmRHBr8d6dj60VF18Dov5ZvJptlQUBe2la+nh6P8
         JJ0vz+qH0/0GjIHrrWTNFnrcUZFt7ZZ96omg3/K/3dG+Pjxy24n7rVPp3bM2ddJxUEOt
         6uLGoKCb6OhbdwGHeJO8OdHOCotQ6+us9z2mgHu0n8H3mR3u8xDnq9wtQV6pr8be3/Yu
         IwBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=cN5v5WX4Jvg+QKU02xZK5mgsO2zG9IePeE/6vqvKS7M=;
        fh=bkCr8YGdZKa/VjP8PkZkMrIQTAu9pr3e90RwzsW5UvU=;
        b=EcrikyvxlqYOlNoT+z0HZSMnt//sFyslE+M0oBGqtV80Awm+UkV0ixyc98Q1WtJux1
         H8UAlzlcPqSboP3u9/oem6umM67zOf4rKjyQfnwsEYiSEZ69Fb+B7c5IZ5QogY1tsv2R
         vvpF44MNFMoFD92KWWa9mUxGHzRAwHAhsN3v5vXmHJxEWcyG4EjK+1YiDvFzohExevFB
         ABhD9XSxt7zHxTIX09yK9H00v2EqlwBdvuRipg00QoZOT9ee0R8GxZX09YCsZMIIf/pe
         PaiqA2LCF7hzU9WkGxRg5GwKSZQzhokBbEye1rXqRQ7mpIvjpaoIeHAupXmb1GuiL6ee
         Va9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JaMew2qR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e41feb91b8si33198856d6.180.2025.02.04.08.16.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 08:16:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JaMew2qR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfLbH-0006wZ-Ex; Tue, 04 Feb 2025 11:16:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfLb5-0006ZV-Rf
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 11:16:24 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tfLb3-0007g7-VZ
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 11:16:23 -0500
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e573136107bso6170558276.3
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 08:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738685780; x=1739290580; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cN5v5WX4Jvg+QKU02xZK5mgsO2zG9IePeE/6vqvKS7M=;
 b=JaMew2qRauw2GeINZ4QYghpxiyk/ndVpNQZ0xssOoCcWMtY+R1FuBMG92VMJVkPdEn
 pvhx1q5yA7nsESMia4cCYwMIyKzM0F5uy83OfZy3uDSbTcDdga3FTx74SU0H09w8lz5Y
 /l7X+u3XHeUH+PE76i5Zua5vnJHQtbd0Xub38Vzn5/UcYfdZSHjVoVSlr6p13FW0Uik1
 CZyhej751odirMeFunpSZm3IYT2xHb43lbKJdeg6rXqDfRtQn6AThxQmresAL8Z9aUvR
 acVpKK2GLqsLoja4+xgamUtl7qUwGp2UXBtNbovHeDYr+xzyTHrfRi0Q4uy47D2q5URo
 X50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738685780; x=1739290580;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cN5v5WX4Jvg+QKU02xZK5mgsO2zG9IePeE/6vqvKS7M=;
 b=HkqBZhLhE2hJXCE/j250j2G8KYHfqc6tARUYcNQ0pmgK2q8suga+cCU5h+uiTsfx+5
 A/PYrfyTj+Xmk68z4U/l9dJpRbB1TUnc82pmuNjDKxcVewS95UBHKM11U6PZDLnYaWrQ
 lEtPC0FTHlYMpHrzcnFAfCU3sWj6/MPuiiphRMh96bXWVosbMAKBrjN4ZwY9kwe0/orK
 KzBK9E9NoOFQowOKSa0/TzthY+bFDAfCe7YjYWVMd1SZKmEdCrlmWVWgh/AMYY/VfiOz
 ErCBXp2p0527BzG+5NnWSd9c/t7pA2+o4TEPiQPWCHyVPUBzlGa6IA911wjNcJRWuQiM
 vRCQ==
X-Gm-Message-State: AOJu0Yzr3s+U6I1spnx1AKnt3cOUCb1Vyk+zEGwjRI2TuBGmNEE38I2X
 lMaw0bHUMHYEw+CNg2f4LT8T45Y+aEgT6G3QHuoskopuk/qoyAAIQpUFy+9eG9XgbG+vE0sjq3h
 KaMxUMyk1VMSlgwtfcuQUtQQkPSGe337ui7vQLg==
X-Gm-Gg: ASbGncs9XKnopsa2KXYEFTS3NMQb8qzQc4ujTdQja+l/K/psJgqpFhpQfkYHjGZ41qo
 b2fROJanztECY0EpWZ5NShJfcZGqxPnDO2GBS+f7Mjj2Fmb3s+TahOTFbMbZ0Zpm/dQQ45YhkSg
 ==
X-Received: by 2002:a05:6902:118d:b0:e30:ebdf:9643 with SMTP id
 3f1490d57ef6-e58a4a9a3ecmr20690911276.8.1738685780466; Tue, 04 Feb 2025
 08:16:20 -0800 (PST)
MIME-Version: 1.0
References: <20241226082800.2887689-1-wuhaotsh@google.com>
 <20241226082800.2887689-2-wuhaotsh@google.com>
In-Reply-To: <20241226082800.2887689-2-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2025 16:16:08 +0000
X-Gm-Features: AWEUYZluLquo9Dd8GO82kC-rfniy6KI9xmm5PPwFTxxCAO4yfjSDlj6XtvJirJo
Message-ID: <CAFEAcA_LO0N2vkyx30gLKY9EyVzsA7xZ+Z2oJrvgJ8_XHVw_eQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/17] docs/system/arm: Add Description for NPCM8XX SoC
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, titusr@google.com, hskinnemoen@google.com, 
 venture@google.com, pbonzini@redhat.com, jasowang@redhat.com, 
 alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8LXpvaLLvap8

On Thu, 26 Dec 2024 at 08:28, Hao Wu <wuhaotsh@google.com> wrote:
>
> NPCM8XX SoC is the successor of the NPCM7XX. It features quad-core
> Cortex-A35 (Armv8, 64-bit) CPUs and some additional peripherals.

This should go at the end of the series, once you've added
the new machine types it documents.

> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  docs/system/arm/nuvoton.rst | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
> index 05059378e5..0a1916fb99 100644
> --- a/docs/system/arm/nuvoton.rst
> +++ b/docs/system/arm/nuvoton.rst
> @@ -1,12 +1,13 @@
>  Nuvoton iBMC boards (``kudo-bmc``, ``mori-bmc``, ``npcm750-evb``, ``quanta-gbs-bmc``, ``quanta-gsj``)
>  =====================================================================================================

You should add the names of the new boards in the title.

> -The `Nuvoton iBMC`_ chips (NPCM7xx) are a family of ARM-based SoCs that are
> +The `Nuvoton iBMC`_ chips are a family of ARM-based SoCs that are
>  designed to be used as Baseboard Management Controllers (BMCs) in various
> -servers. They all feature one or two ARM Cortex-A9 CPU cores, as well as an
> -assortment of peripherals targeted for either Enterprise or Data Center /
> -Hyperscale applications. The former is a superset of the latter, so NPCM750 has
> -all the peripherals of NPCM730 and more.
> +servers. Currently there are two families: NPCM7XX series and
> +NPCM8XX series. NPCM7XX series feature one or two ARM Cortex-A9 CPU cores,
> +while NPCM8XX feature 4 ARM Cortex-A35 CPU cores. Both series contain a
> +different assortment of peripherals targeted for either Enterprise or Data
> +Center / Hyperscale applications.

The correct capitalization for "Arm" is "Arm".

>
>  .. _Nuvoton iBMC: https://www.nuvoton.com/products/cloud-computing/ibmc/
>
> @@ -27,6 +28,8 @@ There are also two more SoCs, NPCM710 and NPCM705, which are single-core
>  variants of NPCM750 and NPCM730, respectively. These are currently not
>  supported by QEMU.
>
> +The NPCM8xx SoC is the successor of the NPCM7xx SoC.

There should be a bullet-point list below here which
lists the new machine types.

> +
>  Supported devices
>  -----------------
>
> @@ -62,6 +65,8 @@ Missing devices
>     * System Wake-up Control (SWC)
>     * Shared memory (SHM)
>     * eSPI slave interface
> +   * Block-tranfer interface (8XX only)

Typo: "transfer"

> +   * Virtual UART (8XX only)
>
>   * Ethernet controller (GMAC)
>   * USB device (USBD)
> @@ -76,6 +81,11 @@ Missing devices
>   * Video capture
>   * Encoding compression engine
>   * Security features
> + * I3C buses (8XX only)
> + * Temperator sensor interface (8XX only)

Typo: "Temperature"

> + * Virtual UART (8XX only)
> + * Flash monitor (8XX only)
> + * JTAG master (8XX only)

thanks
-- PMM

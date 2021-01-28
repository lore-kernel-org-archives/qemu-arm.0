Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp416089lfo;
        Thu, 28 Jan 2021 09:32:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzO/R+migytvkNLS2mxSO2ruMJd4OX8hHJlLS0UFaVd61ESMjrkBcW2zHwhpHjJiSJ/IFrE
X-Received: by 2002:a25:ac9e:: with SMTP id x30mr292983ybi.287.1611855148777;
        Thu, 28 Jan 2021 09:32:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611855148; cv=none;
        d=google.com; s=arc-20160816;
        b=xols3f8ENgBXXknWhqCQgKC1Q74E4GPA1hEGwmubYcF0ZLLdZmN1ErOpifJeaa36PK
         Du95SS9z8JDIXkqn0XYJaTMIrNouyscQHEWiUL5iEyCCHOS847uTlF4Yl7/HPY7p5KFV
         ePeThLtU4FdabhCP1szBYju2aQ6AiF4OvwUb8rNwqLqK8SMEnq5mY6ohQuf0ZKvoMvLO
         BzMRt0uB9OD9uUYpiuopS63dQok5vBtA8Pbi3jQZt5c85tEfiuo61omAemx05tTG4mL1
         4km1QC8jN0etUw9O8DcS+ccRAVql9spyx2p82amczhURw6rGLCsbwHWuX/3pnm4A6U1D
         LL1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GR92uWHbhhdDZc0WH5I5nCMOgJmbOUxJ102ykzoRMaM=;
        b=J2s7B09+dKMitZ7heT9o5DCiq6nnwMLYorpHQrWhcRBlgD0Rs7yeNDQF42fcKnQ33J
         uI66mf3FelHJZHfx5esklUgrwNRkJ5NdoHBx/cqMgFlmik+szNZjdklnqW1UBR15p1oO
         QYqHNcpcXa+5XfCThyvF5GxwNddiSt+ju9ErMvjD74jwyLMT6QNs3tduDWjIRjY9Bmvg
         7aOdeGza44FO5NIrXAIRyFO92BpJxsDmA2r8xNszjvPrA0w4pTlDnIUUxwzEPp8h8N3N
         5Zb33RCmpuvjNZhiImyVlEPKy39ajO6y817HIAe8lrCRPCvkzYcVPQLb8d6w0qEYCSq8
         GGkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QkD7rWho;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s140si6380486ybc.20.2021.01.28.09.32.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 09:32:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QkD7rWho;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5B9g-000728-37
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 12:32:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5B6J-00054B-BA
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:28:59 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:33856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5B6H-0003A7-Ej
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:28:59 -0500
Received: by mail-ed1-x532.google.com with SMTP id d22so7558071edy.1
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 09:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GR92uWHbhhdDZc0WH5I5nCMOgJmbOUxJ102ykzoRMaM=;
 b=QkD7rWhoXccRrVzPcP88aGPUs3kgzYaCzQ2JuyhbILNeO9P7vA46ZKVqAj0zVHHp2a
 73sNRLBTP9QWAvnKgGen5TjayMUfMBxD07+Rn08Ah5f7Gu1d4WofN9J/YHkJEvkKd3+c
 rc4jvBgSIs/srU8NBkLkAjSFbAG1L2maqdMtkN4pjYI9jl2fovvQlqC151Knhhd/yDbJ
 sPtzoWlHAo3lugOZRyvUZzis7DmrFHBXAWNwqqUPYPy5rEnwXNUvQDFDfDlNCWDIeVA2
 u1UpqmTKKW67LsrE1as0qYcZ+P2+JJivlgUytr50XK3vjCDluG4u2fEK1GNMPeOTp0Bd
 KAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GR92uWHbhhdDZc0WH5I5nCMOgJmbOUxJ102ykzoRMaM=;
 b=dbseD5jErU/in/ar0nxxFMnutTARNqoPe0blUVkigOGPA5vnByoSQS8qZ5MeNgDR84
 LhZEbTFC/tWkt9oKWbqQSfstLrLLjryVSbxHjF7wbo9GGPRe1xqZHw+q0fWat6EcUQmE
 s7cBvSZCatBYi43H8JztNBkFpiBP894nSIjVjylfjAM/q+fQC8uaQpnT05XYt9+9xGrk
 bbvLj3/Goo0jW3uajaJRHPZYAihObokW7b7VzjQMYcp5SL1wDsLQ8pk3lMf42nbE0wfa
 WZn4+aONq11QmeF1S4/+0dsxdC7b2rUMXQcDdsnvwelFQiE5DpAR4zF25gSfOHA1toON
 5bTg==
X-Gm-Message-State: AOAM530LHptV6GVuws5zOVDROAblHdyuWZxydbVCehwScnS/pFtsVAyG
 x+PZ1aFpmZcGpy6nncpU0dJCc0kBRUURvX+DCiRTmg==
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr718345edd.52.1611854935720; 
 Thu, 28 Jan 2021 09:28:55 -0800 (PST)
MIME-Version: 1.0
References: <20210126193237.1534208-1-wuhaotsh@google.com>
 <20210126193237.1534208-3-wuhaotsh@google.com>
In-Reply-To: <20210126193237.1534208-3-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 17:28:44 +0000
Message-ID: <CAFEAcA8xJdqY0C9VUe1LUfhPP3q6c9Enh+GqqVdqR6NAqBLOMw@mail.gmail.com>
Subject: Re: [PATCH 2/6] hw/i2c: Implement NPCM7XX SMBus Module Single Mode
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J93yK7p9a97p

On Tue, 26 Jan 2021 at 19:32, Hao Wu <wuhaotsh@google.com> wrote:
>
> This commit implements the single-byte mode of the SMBus.
>
> Each Nuvoton SoC has 16 System Management Bus (SMBus). These buses
> compliant with SMBus and I2C protocol.
>
> This patch implements the single-byte mode of the SMBus. In this mode,
> the user sends or receives a byte each time. The SMBus device transmits
> it to the underlying i2c device and sends an interrupt back to the QEMU
> guest.
>
> Reviewed-by: Doug Evans<dje@google.com>
> Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  docs/system/arm/nuvoton.rst    |   2 +-
>  hw/arm/npcm7xx.c               |  68 ++-
>  hw/i2c/meson.build             |   1 +
>  hw/i2c/npcm7xx_smbus.c         | 766 +++++++++++++++++++++++++++++++++
>  hw/i2c/trace-events            |  11 +
>  include/hw/arm/npcm7xx.h       |   2 +
>  include/hw/i2c/npcm7xx_smbus.h |  88 ++++
>  7 files changed, 921 insertions(+), 17 deletions(-)
>  create mode 100644 hw/i2c/npcm7xx_smbus.c
>  create mode 100644 include/hw/i2c/npcm7xx_smbus.h
>
> diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
> index a1786342e2..34fc799b2d 100644
> --- a/docs/system/arm/nuvoton.rst
> +++ b/docs/system/arm/nuvoton.rst
> @@ -43,6 +43,7 @@ Supported devices
>   * GPIO controller
>   * Analog to Digital Converter (ADC)
>   * Pulse Width Modulation (PWM)
> + * SMBus controller (SMBF)
>
>  Missing devices
>  ---------------
> @@ -58,7 +59,6 @@ Missing devices
>
>   * Ethernet controllers (GMAC and EMC)
>   * USB device (USBD)
> - * SMBus controller (SMBF)
>   * Peripheral SPI controller (PSPI)
>   * SD/MMC host
>   * PECI interface
> diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
> index d1fe9bd1df..8f596ffd69 100644
> --- a/hw/arm/npcm7xx.c
> +++ b/hw/arm/npcm7xx.c
> @@ -104,6 +104,22 @@ enum NPCM7xxInterrupt {
>      NPCM7XX_OHCI_IRQ            = 62,
>      NPCM7XX_PWM0_IRQ            = 93,   /* PWM module 0 */
>      NPCM7XX_PWM1_IRQ,                   /* PWM module 1 */
> +    NPCM7XX_SMBUS0_IRQ          = 64,
> +    NPCM7XX_SMBUS1_IRQ,
> +    NPCM7XX_SMBUS2_IRQ,
> +    NPCM7XX_SMBUS3_IRQ,
> +    NPCM7XX_SMBUS4_IRQ,
> +    NPCM7XX_SMBUS5_IRQ,
> +    NPCM7XX_SMBUS6_IRQ,
> +    NPCM7XX_SMBUS7_IRQ,
> +    NPCM7XX_SMBUS8_IRQ,
> +    NPCM7XX_SMBUS9_IRQ,
> +    NPCM7XX_SMBUS10_IRQ,
> +    NPCM7XX_SMBUS11_IRQ,
> +    NPCM7XX_SMBUS12_IRQ,
> +    NPCM7XX_SMBUS13_IRQ,
> +    NPCM7XX_SMBUS14_IRQ,
> +    NPCM7XX_SMBUS15_IRQ,

Would be nicer to put these in their correct place in numerical
order, ie above the PWM IRQs rather than below them. (The list
is otherwise already in numerical order.)

>      NPCM7XX_GPIO0_IRQ           = 116,
>      NPCM7XX_GPIO1_IRQ,
>      NPCM7XX_GPIO2_IRQ,
> @@ -152,6 +168,26 @@ static const hwaddr npcm7xx_pwm_addr[] = {
>      0xf0104000,

> +static const VMStateDescription vmstate_npcm7xx_smbus = {
> +    .name = "npcm7xx-smbus",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_END_OF_LIST(),
> +    },

Looks like you forgot to fill in the fields in the vmstate :-)

> +};
> +

thanks
-- PMM

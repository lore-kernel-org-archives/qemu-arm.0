Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp552178lfq;
        Fri, 8 Jan 2021 06:41:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwFEhAY4jKRBaFad9QWz1kBLyP2+Bru3QyhqaIH/J2pIHgRNU9zKO6ZuMGvkNJNXwE6lba
X-Received: by 2002:a25:3003:: with SMTP id w3mr4879735ybw.315.1610116865610;
        Fri, 08 Jan 2021 06:41:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610116865; cv=none;
        d=google.com; s=arc-20160816;
        b=GK3JXJ+yCLeWU9qNvDOE3Fn7lrAJP7BGFng6nUk5ZshT9f/uCUmeeq1vqBJmwfb+yJ
         t6CPoCxIMAjN3hvxMtVlGPiFRvp97BkHQtSEwb6fkR3oBw+xXdDI4UAkjCiEoJlHHkjr
         M3pIjUUmp9RHL9Z/KfsbSZEqH2sgNtSRedsBXm7GdZ4fPTmxTxnOxTl/WFIdPsuvc34x
         lmTsHpJh9dPmKhZzA1VUD6nwVnk+yJt8PibAeTxcFU+evQZnUgLo5uMQKcGn9mkgtakq
         4ErrvhtmTDuF4MRnunqXgVVOdLfbWNZJZe3aTyyPbcTEmOShXl6C+hKBTAOY0O78YcT2
         LZ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0LN0oJ+aDXDrxZB9Pk6yCOmV3Ijg+90M2UtZfIHI3O4=;
        b=Q6BcmaT618kf0Bt6ehT+yWXd0HQYLZmWPTyp+DJttf28DeDkpF2XhiaoYb9FjnBqId
         Lz2xykOqlwZmPLrw/m/eWLES8F7OtXrmRX6dIJeMpF7hid61L93+bs1wWVP99WSRtayU
         zr746UBOWhIVsWyqOt7bsKlYt6JiDb55zd3C8xuXa27ekfJLVgCndnG3d+MJUXvCt3Sm
         7dDNecApM1jJ3piAGSjNwdXqC143EUdYYDblum+BO770FjtuM6jx8T97xmwAzR4gpaAc
         gF8x1zurzJFnxvlGZTF2pxjvFJG7x7E6iYIFHFZ0A6s6EP1Cb3zjjcfl4r5wPFIlrBGs
         ULig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="VXu/8weX";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 85si8876294ybc.447.2021.01.08.06.41.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 06:41:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="VXu/8weX";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxswr-0005Bc-0Y
	for alex.bennee@linaro.org; Fri, 08 Jan 2021 09:41:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxswT-0005BN-0O
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 09:40:41 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:42050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxswN-0008V0-Fk
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 09:40:40 -0500
Received: by mail-ed1-x530.google.com with SMTP id g24so11374439edw.9
 for <qemu-arm@nongnu.org>; Fri, 08 Jan 2021 06:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0LN0oJ+aDXDrxZB9Pk6yCOmV3Ijg+90M2UtZfIHI3O4=;
 b=VXu/8weXQ0FxTvNjve83Qdip8M722NsQYnoU7s5oqQ29iH9FwdSRFw1eZAAJoQIfs7
 JlOYLN7EroM7t2PatILsH2Dnt2hEcUS3DwM2DaDxpaQczeRysMYDRwh2qri3YUHU9iV0
 kKgaTDBE1D6ES/jLPmQ2CYBAieNo2qXBSV2VANNcF98c8HwUskr5R9/31/8QJicDuAPo
 pGDe23KL+l7C0drQJQsIuJ53JGRghi8bjblk59X7deU9U839M0KvXMmVsBTH56ztw+Z7
 CllISCHhkjMsrnDs+3fBJ0dY90CwDqAboOApaXFN4/qsD4lLciQsQh3v92j+VfAQOHb8
 UFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0LN0oJ+aDXDrxZB9Pk6yCOmV3Ijg+90M2UtZfIHI3O4=;
 b=IsDv697gduEcr4w027VSmodk27wwRziTOXmpM1PyfNHIV9SIvySxmC5NGmmBY5cOwi
 8M/lRe3n0qhDW09RYVMM6vrrqSq76DqnXqIPwA68goEfTai/wHcSehrFilv9fy6njes+
 SfrYTKXYXQvK5ElhbTn2IHaCbgNSgbQN/4u/wzAbwMI15yp6ABh9SG+wVrnFAZbEp8JO
 0sP0TIjjwWcQn4YYxfbmpE9X1RhuOUqvmfnuZXsJRCIDGFwV5zZhqbCTwhKpvB85Zhrw
 MY8pmkpMzB5rP2b5Bp6PzT83SU7AnEQXDVoFVfxq4HNeb3hZPdf8OUQrW7xm+PEwI/D/
 xLrA==
X-Gm-Message-State: AOAM533EdewnBwlYXvt6jWIUHNybrsYWEkIt7yn6x9LzeIk8eXN9ndsT
 WgTBqYDFZTXQnIAJa4GzG+f0ZBzCX8yLNiQK4I04fw==
X-Received: by 2002:aa7:d915:: with SMTP id a21mr5399953edr.251.1610116833710; 
 Fri, 08 Jan 2021 06:40:33 -0800 (PST)
MIME-Version: 1.0
References: <20201202144523.24526-1-bmeng.cn@gmail.com>
 <20201202144523.24526-2-bmeng.cn@gmail.com>
In-Reply-To: <20201202144523.24526-2-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 14:40:22 +0000
Message-ID: <CAFEAcA9weaHgHTZBmEeveOxaakpeQTAvqrKGG6pZAprr=DcpWQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/ssi: imx_spi: Disable chip selects in
 imx_spi_reset()
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2kwRmVb/fQG3

On Wed, 2 Dec 2020 at 14:45, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>
> When a write to ECSPI_CONREG register to disable the SPI controller,
> imx_spi_reset() is called to reset the controller, during which CS
> lines should have been disabled, otherwise the state machine of any
> devices (e.g.: SPI flashes) connected to the SPI master is stuck to
> its last state and responds incorrectly to any follow-up commands.
>
> Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
>
> ---
>
> Changes in v2:
> - Fix the "Fixes" tag in the commit message
>
>  hw/ssi/imx_spi.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> index e605049a21..85c172e815 100644
> --- a/hw/ssi/imx_spi.c
> +++ b/hw/ssi/imx_spi.c
> @@ -231,6 +231,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
>  static void imx_spi_reset(DeviceState *dev)
>  {
>      IMXSPIState *s = IMX_SPI(dev);
> +    int i;
>
>      DPRINTF("\n");
>
> @@ -243,6 +244,10 @@ static void imx_spi_reset(DeviceState *dev)
>
>      imx_spi_update_irq(s);
>
> +    for (i = 0; i < ECSPI_NUM_CS; i++) {
> +        qemu_set_irq(s->cs_lines[i], 1);
> +    }

Calling qemu_set_irq() in a device reset function is a bad
idea, because you don't know whether the thing on the other
end of the IRQ line (a) has already reset before you or
(b) is going to reset after you. If you need to do this then
I think you need to convert this device (and perhaps whatever
it's connected to) to the 3-phase-reset API. (But you probably
don't, see below.)

Usually the approach is that the device on the other end
of the line is going to reset its state anyway, so there's
no need to actively signal an irq line change.

If this is required only for the case of "guest requested
a controller reset via the ECSPI_CONREG register" and not
for full system reset, then you can handle that by having
an imx_spi_soft_reset() which calls imx_spi_reset() and then
does the qemu_set_irq() calls, so full system (power-cycle)
reset still goes to imx_spi_reset() but guest-commanded
reset via the register interface calls imx_spi_soft_reset().

thanks
-- PMM

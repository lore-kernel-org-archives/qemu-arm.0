Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2636085wru;
        Mon, 1 Jul 2019 06:09:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyPKAFllV8w3G+xC18xADnDVO+g5r3OTM9oREmjZeSsIo54jnmPipMm6rfqGPxT7h9l2JfM
X-Received: by 2002:a50:ad48:: with SMTP id z8mr28855775edc.66.1561986554193;
        Mon, 01 Jul 2019 06:09:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561986554; cv=none;
        d=google.com; s=arc-20160816;
        b=zSs2qLJXa37WpQn9olhLx4YXUCqxmWly0DV6N9pZRrYm85RgoqJ04GO7OirRcKeQNV
         1GsAqIcSwFk+tJs2BIKyn0DP2CnOhN1lV5QdFuB78yJlEzklHCeAaQ+TC166T/U5YHlc
         M0Z/hjFxcVV41O2FNw9zdigeSIRH/u9B9xwJuKXBPtgWsiqUHmPAfua86dfcNKE0BkGc
         c1m8JpC5BrEJcymmIIC6C1DN42HiJb2IoHAjzMC3Xm5771fqoFGRRWc0d9jBgys6WUVk
         eMWyCfRkG7OImoNCCx5PoDa+A9bBzs610lTB3LlJv6Z4WFMfqG+yWshe5qjOMpUBJAdk
         yIjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=GFpVemuNL7UhbLtjtR7O0P9wazBxTV9UABGaJgXIshY=;
        b=F3jPJcQ0qb1XyKVYgm8SFt1zItUXysVUnK3vVZ3sH6JEauzOtl5OByHqezxhfdt+Us
         ncUZLV0X7VQjWI/W/vMB2rvpM6IWkUknlJKU/tV6F1x5RmwB41HlhBdbjHKO7ONf9qQ+
         cvhyMaJzcPj34B4crgKlL2jys1Oh+cHWeye9jY+I0TvzuFEk4H+w9BCnN17+m48BBhw0
         CimXUa6iK6ostQVSzsNlm6biBzFVb3VQS72w45XU+VPqPKK2ihpn7kd6wq8sN6k6Isoh
         6oDJPda4uQaM0XdO7NqGP+m0wpsC+FLF4locEfhRngiV1H9KMTEvcDqcOp4fMenqzLy9
         rIOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dCStNmCP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g14si7167732eje.238.2019.07.01.06.09.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 06:09:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dCStNmCP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhw3V-0004tK-70
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 09:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36700)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hhw1l-0002hK-1O
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 09:07:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hhw1e-0007on-Cw
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 09:07:24 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:33272)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hhw1U-0007J9-P2
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 09:07:12 -0400
Received: by mail-oi1-x242.google.com with SMTP id u15so9756334oiv.0
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2019 06:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GFpVemuNL7UhbLtjtR7O0P9wazBxTV9UABGaJgXIshY=;
 b=dCStNmCPt9WreNdovNC0xder7dlBrJLvhhkZWT1qlkbg4dEiQbVJB3ZbzBGNofHaJl
 FdyLODZlX5wuBaaQjzrsBf5KNT6WqFQN3Ic3lxvAxailNNP4JBrxfpVQE0dqc+jlP5V4
 y6cLwJ7TG4Z1hLR8v02XTRhZgCp6CpJ47hmnvZLTLioFGv8C0N+OByjGnj71F3UzXNaw
 1mtn3Ig4tnqxTIoYmKuvwEnvmMVroXAVbyiaiRyb6CwK8zKAY6PyNE2k5cq5hPmNKIIX
 fMKNg/r6sksMRIRK+6U9rEoyp8Q4W1Zt1k9mRUKF7lW9W15sjyfYxlCw5VNlDPlILwNk
 BMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GFpVemuNL7UhbLtjtR7O0P9wazBxTV9UABGaJgXIshY=;
 b=JDCoW+5vtpVfr6i24GeF9if2IehHORxs+IZRtVXGDsf4APMT1bgqg/G5iJrcDjANgu
 F3wfgkFBtw0mcV8apbRqdprKIWnr63t0wlQs+alJ+dFroK3KoQ4kXwzpO4tzwjM5XtDL
 NSuQ0Po8+Rxzlz9Q3bhIEbiUclkzyCfUtOZBbVssv8OwFIj9OqKAcKMjdVI5WK8ErdU3
 tEUWUbxenuMjg8yZZBdMUfLznmjsLvgb2vEHV10861kVaVc/O9aq+dP0ifitnEDgvAct
 4aed2R6psanyBRrvryiEm0s29+rXQZvxRuhX+xXBDwEoX6RDPpnzJGJ3KB0u2FQM4mFM
 3+IQ==
X-Gm-Message-State: APjAAAUAaEGzjdqSdW65ZC36jeDExFWdpCxA0MWQg2izIN4X7ZuSLaPw
 qHc9PXH/guXd54whIu/cT9yYM51r7BSG/SWOawOopg==
X-Received: by 2002:aca:ac48:: with SMTP id v69mr6542560oie.48.1561986407265; 
 Mon, 01 Jul 2019 06:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190618165311.27066-1-clg@kaod.org>
 <20190618165311.27066-16-clg@kaod.org>
In-Reply-To: <20190618165311.27066-16-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 14:06:36 +0100
Message-ID: <CAFEAcA-J+bS2-EtX6pTFYJ1XMaNLx0roYEoQMxV_=-mwMSPDgg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH v2 15/21] aspeed/smc: add support for DMAs
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /W7gqUwNCdSS

On Tue, 18 Jun 2019 at 17:55, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The FMC controller on the Aspeed SoCs support DMA to access the flash
> modules. It can operate in a normal mode, to copy to or from the flash
> module mapping window, or in a checksum calculation mode, to evaluate
> the best clock settings for reads.
>
> The model introduces two custom address spaces for DMAs: one for the
> AHB window of the FMC flash devices and one for the DRAM. The latter
> is populated using a "dram" link set from the machine with the RAM
> container region.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Acked-by: Joel Stanley <joel@jms.id.au>
> +/*
> + * Accumulate the result of the reads to provide a checksum that will
> + * be used to validate the read timing settings.
> + */
> +static void aspeed_smc_dma_checksum(AspeedSMCState *s)
> +{
> +    MemTxResult result;
> +    uint32_t data;
> +
> +    if (s->regs[R_DMA_CTRL] & DMA_CTRL_WRITE) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: invalid direction for DMA checksum\n",  __fun=
c__);
> +        return;
> +    }
> +
> +    while (s->regs[R_DMA_LEN]) {
> +        result =3D address_space_read(&s->flash_as, s->regs[R_DMA_FLASH_=
ADDR],
> +                                    MEMTXATTRS_UNSPECIFIED,
> +                                    (uint8_t *)&data, 4);

This does a byte-by-byte read into a local uint32_t...

> +        if (result !=3D MEMTX_OK) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: Flash read failed @%08x\=
n",
> +                          __func__, s->regs[R_DMA_FLASH_ADDR]);
> +            return;
> +        }
> +
> +        /*
> +         * When the DMA is on-going, the DMA registers are updated
> +         * with the current working addresses and length.
> +         */
> +        s->regs[R_DMA_CHECKSUM] +=3D data;

...which we then use as a (host-endian) 32-bit value.

This will behave differently on big endian and little endian hosts.
If the h/w behaviour is to to load a 32-bit data type you probably
want address_space_ldl_le() (or _be() if it's doing a big-endian load).

> +        s->regs[R_DMA_FLASH_ADDR] +=3D 4;
> +        s->regs[R_DMA_LEN] -=3D 4;
> +    }
> +}
> +
> +static void aspeed_smc_dma_rw(AspeedSMCState *s)
> +{
> +    MemTxResult result;
> +    uint32_t data;
> +
> +    while (s->regs[R_DMA_LEN]) {
> +        if (s->regs[R_DMA_CTRL] & DMA_CTRL_WRITE) {
> +            result =3D address_space_read(&s->dram_as, s->regs[R_DMA_DRA=
M_ADDR],
> +                                        MEMTXATTRS_UNSPECIFIED,
> +                                        (uint8_t *)&data, 4);
> +            if (result !=3D MEMTX_OK) {
> +                qemu_log_mask(LOG_GUEST_ERROR, "%s: DRAM read failed @%0=
8x\n",
> +                              __func__, s->regs[R_DMA_DRAM_ADDR]);
> +                return;
> +            }
> +
> +            result =3D address_space_write(&s->flash_as,
> +                                         s->regs[R_DMA_FLASH_ADDR],
> +                                         MEMTXATTRS_UNSPECIFIED,
> +                                         (uint8_t *)&data, 4);
> +            if (result !=3D MEMTX_OK) {
> +                qemu_log_mask(LOG_GUEST_ERROR, "%s: Flash write failed @=
%08x\n",
> +                              __func__, s->regs[R_DMA_FLASH_ADDR]);
> +                return;
> +            }
> +        } else {
> +            result =3D address_space_read(&s->flash_as, s->regs[R_DMA_FL=
ASH_ADDR],
> +                                        MEMTXATTRS_UNSPECIFIED,
> +                                        (uint8_t *)&data, 4);
> +            if (result !=3D MEMTX_OK) {
> +                qemu_log_mask(LOG_GUEST_ERROR, "%s: Flash read failed @%=
08x\n",
> +                              __func__, s->regs[R_DMA_FLASH_ADDR]);
> +                return;
> +            }
> +
> +            result =3D address_space_write(&s->dram_as, s->regs[R_DMA_DR=
AM_ADDR],
> +                                         MEMTXATTRS_UNSPECIFIED,
> +                                         (uint8_t *)&data, 4);
> +            if (result !=3D MEMTX_OK) {
> +                qemu_log_mask(LOG_GUEST_ERROR, "%s: DRAM write failed @%=
08x\n",
> +                              __func__, s->regs[R_DMA_DRAM_ADDR]);
> +                return;
> +            }
> +        }

Since the code here doesn't do anything with the data the
address_space_read/write here aren't wrong, but you might
prefer to use the ldl and stl functions to avoid the casts
to uint8_t* and need to specify the length.

thanks
-- PMM

Received: by 10.223.159.74 with SMTP id f10csp4106417wrg;
        Tue, 12 Dec 2017 09:53:01 -0800 (PST)
X-Google-Smtp-Source: ACJfBotT9tdR0IglpERnXclmWJH9O5LtPQpKbhcx/7dkl5saXMcSTIkLlCekU+fctqGhtQUQg1wm
X-Received: by 10.37.20.193 with SMTP id 184mr3409035ybu.400.1513101181439;
        Tue, 12 Dec 2017 09:53:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513101181; cv=none;
        d=google.com; s=arc-20160816;
        b=olYaMmHRXrMuPCU1/dslecIfjSXMzJ6WY1d7Qw+6sSh0iijg7L+eb917Whg7Ewsdcw
         kC1Zxl7NGXn5ebdkeXdw58m4Taw3FU7W0rTQtxbwPUcqkkNBCMWEPxW0YJa3ysentY4q
         wnRHU+dSLoOIuHhqEgOZ5pjX72TKMWfgjHdwMT3Ry/JTZKVZ7dfXVu8MndtBUmHz3bI0
         obAKjisVihwUWbf0ggOrHtAkELyz1YzAZjvAC+pTgTxAcR1ZEFMtG1cXxSfsFzszrgWK
         sZm18mlwg6vajJWlX1G/54vnhH6S90+Kvj0TNqCzBtyGaOcoL/yNjZUDYuvwsI7GgM6C
         xvwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=brCPFHGX7SEJds1adUVlEs0VufnqdCHq00miYp2aaMk=;
        b=jHKdtr3gZLfTC0h3fUikoXFOYycLGvT0oVLdOQ9Z/29oEUO5c4m05RlFys856eDqJ+
         u7LhTBOqoamyxgCoJzL/HV7h4unvcJT6rkiYrqfYYWeU7sVyBU0kUW1uCDjVbRm1NhqG
         YyR6J+JwxIozTwyLH0dGZ6sxBRtomTGNdyj23q6C2yiSvVYG3xQ5HnQXxfaz4+tOBWWN
         4nrRK8/37k9W0bT816utaIMGRFU7/xdjpNBP1j31u5KHf9drDhGhS/OvAsmlhWWL8uGM
         wXefsIUjrV67Y7zKKqd1j9YXgHWX83Df+w6/jUpalBYeiCWuJG0Uczkzv3edGWmNxEQ3
         2evQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g3Tir/QF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 9si213747ybj.84.2017.12.12.09.53.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 09:53:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g3Tir/QF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59797 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOojk-0005EA-Qh
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 12:53:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOojZ-0005CW-Uz
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 12:52:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOojY-0000W8-SY
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 12:52:50 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:46204)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eOojY-0000Vm-LF
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 12:52:48 -0500
Received: by mail-oi0-x243.google.com with SMTP id t81so14564494oih.13
	for <qemu-arm@nongnu.org>; Tue, 12 Dec 2017 09:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=brCPFHGX7SEJds1adUVlEs0VufnqdCHq00miYp2aaMk=;
	b=g3Tir/QF6lK4fOns4iR0tYMgNnS+KZubq5TC8h1VhqRIlVX9O289gTrg50I4ddoL3C
	KDr1WCD0jfT0LTGFgHTvhh1M47HEplJSWR1rEnpqkUhU7w8gvGDbymC1JEg7PAdIGuGJ
	36Zp3frSQTanpSW83Inun+odx4JKTJ85U8ZwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=brCPFHGX7SEJds1adUVlEs0VufnqdCHq00miYp2aaMk=;
	b=OACPLLJRcvCEWLk6UGdWfKKYifnJ5upMzLJShx36zwusOsqpTqNzqAKfBMzwhWx3kJ
	fAZLDZaIEAU0twgxJzJomdMynSsuruB4B4RESKLxt/h0YrLslCFZLoQ3o2otvl1OETYO
	xwM1TYFlJemkoJOSfy1aPYv04HNsEoIiuJaEw1asIAsqVwDAhC0afq3SgqK3XCEEC70z
	Mt6PmzEb1onXAiDYZHPqDEPnq7n/FhKUkRNcf/Esh11eUc3vWpwau9vAu6OovmPPg9q2
	WpqRaR08xLd2tMn/CQtATKHy1CyK6GrEzB5nzuRR1TEw2X2AHJmUx7jW4lifqfdJcqj/
	0vNw==
X-Gm-Message-State: AKGB3mJuCZ7eLcIbwHMOhHLO7Qs5ixMUFiN+0JcPdw7TUCLDlcaZvw+g
	ev6vl1PPssycF30g+UJgSXNWR7tWNf/ZS1kCIXXxBg==
X-Received: by 10.202.108.66 with SMTP id h63mr3439914oic.305.1513101167653;
	Tue, 12 Dec 2017 09:52:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 12 Dec 2017 09:52:27 -0800 (PST)
In-Reply-To: <20171211213007.7353-13-andrew.smirnov@gmail.com>
References: <20171211213007.7353-1-andrew.smirnov@gmail.com>
	<20171211213007.7353-13-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Dec 2017 17:52:27 +0000
Message-ID: <CAFEAcA_6R61208pZ5rchSG0Oy4c_2eSGD+dO-LQs3Dncjnpf-Q@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH 12/13] sdhci: Add i.MX specific subtype of
 SDHCI
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z7YQxydbZVAl

On 11 December 2017 at 21:30, Andrey Smirnov <andrew.smirnov@gmail.com> wro=
te:
> IP block found on several generations of i.MX family does not use
> vanilla SDHCI implementation and it comes with a number of quirks.
>
> Introduce i.MX SDHCI subtype of SDHCI block to add code necessary to
> support unmodified Linux guest driver.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---

> +    case ESDHC_DLL_CTRL:
> +    case ESDHC_TUNE_CTRL_STATUS:
> +    case 0x6c:

Isn't there a name we can give 0x6c ?

> +    case ESDHC_TUNING_CTRL:
> +    case ESDHC_VENDOR_SPEC:
> +    case ESDHC_MIX_CTRL:
> +    case ESDHC_WTMK_LVL:
> +        ret =3D 0;
> +        break;
> +    }
> +
> +    return ret;
> +}
> +
> +static void
> +usdhc_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
> +{
> +    SDHCIState *s =3D SYSBUS_SDHCI(opaque);
> +    uint8_t hostctl;
> +    uint32_t value =3D (uint32_t)val;
> +
> +    switch (offset) {
> +    case ESDHC_DLL_CTRL:
> +    case ESDHC_TUNE_CTRL_STATUS:
> +    case 0x6c:
> +    case ESDHC_TUNING_CTRL:
> +    case ESDHC_WTMK_LVL:
> +    case ESDHC_VENDOR_SPEC:
> +        break;
> +
> +    case SDHC_HOSTCTL:
> +        /*
> +         * Here's What ESDHCI has at offset 0x28 (SDHC_HOSTCTL)
> +         *
> +         *       7         6     5      4      3      2        1      0
> +         * |-----------+--------+--------+-----------+----------+-------=
--|
> +         * | Card      | Card   | Endian | DATA3     | Data     | Led   =
  |
> +         * | Detect    | Detect | Mode   | as Card   | Transfer | Contro=
l |
> +         * | Signal    | Test   |        | Detection | Width    |       =
  |
> +         * | Selection | Level  |        | Pin       |          |       =
  |
> +         * |-----------+--------+--------+-----------+----------+-------=
--|
> +         *
> +         * and 0x29
> +         *
> +         *  15      10 9    8
> +         * |----------+------|
> +         * | Reserved | DMA  |
> +         * |          | Sel. |
> +         * |          |      |
> +         * |----------+------|
> +         *
> +         * and here's what SDCHI spec expects those offsets to be:
> +         *
> +         * 0x28 (Host Control Register)
> +         *
> +         *     7        6         5       4  3      2         1        0
> +         * |--------+--------+----------+------+--------+----------+----=
-----|
> +         * | Card   | Card   | Extended | DMA  | High   | Data     | LED=
     |
> +         * | Detect | Detect | Data     | Sel. | Speed  | Transfer | Con=
trol |
> +         * | Signal | Test   | Transfer |      | Enable | Width    |    =
     |
> +         * | Sel.   | Level  | Width    |      |        |          |    =
     |
> +         * |--------+--------+----------+------+--------+----------+----=
-----|
> +         *
> +         * and 0x29 (Power Control Register)
> +         *
> +         * |----------------------------------|
> +         * | Power Control Register           |
> +         * |                                  |
> +         * | Description omitted,             |
> +         * | since it has no analog in ESDHCI |
> +         * |                                  |
> +         * |----------------------------------|
> +         *
> +         * Since offsets 0x2A and 0x2B should be compatible between
> +         * both IP specs we only need to reconcile least 16-bit of the
> +         * word we've been given.
> +         */

Thanks for this explanation, it's very helpful in figuring out what's
going on.

> +    case SDHC_BLKSIZE:
> +        /*
> +         * ESDHCI does not implement "Host SDMA Buffer Boundary", and
> +         * Linux driver will try to zero this field out which will
> +         * break the rest of SDHCI emulation.
> +         *
> +         * Linux defaults to maximum possible setting (512K boundary)
> +         * and it seems to be the only option that i.MX IP implements,
> +         * so we artificially set it to that value.
> +         */
> +        val |=3D 0x7 << 12;
> +        /* FALLTHROUGH */

We generally write this lowercase: /* fallthrough */

> +    default:
> +        sdhci_write(opaque, offset, val, size);
> +        break;
> +    }
> +}

> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
> index 0f0c3f1e64..dc1856a33d 100644
> --- a/include/hw/sd/sdhci.h
> +++ b/include/hw/sd/sdhci.h
> @@ -39,6 +39,7 @@ typedef struct SDHCIState {
>      };
>      SDBus sdbus;
>      MemoryRegion iomem;
> +    const MemoryRegionOps *io_ops;
>
>      QEMUTimer *insert_timer;       /* timer for 'changing' sd card. */
>      QEMUTimer *transfer_timer;
> @@ -83,8 +84,13 @@ typedef struct SDHCIState {
>      /* Force Event Auto CMD12 Error Interrupt Reg - write only */
>      /* Force Event Error Interrupt Register- write only */
>      /* RO Host Controller Version Register always reads as 0x2401 */
> +
> +    unsigned long quirks;

I asked for this not to be unsigned long in the last round of review.

>  } SDHCIState;
>
> +/* Controller does not provide transfer-complete interrupt when not busy=
 */
> +#define SDHCI_QUIRK_NO_BUSY_IRQ    BIT(14)

I asked for a comment saying we're following the Linux kernel's
quirk bit numbering in the last round of review.

> +
>  #define TYPE_PCI_SDHCI "sdhci-pci"
>  #define PCI_SDHCI(obj) OBJECT_CHECK(SDHCIState, (obj), TYPE_PCI_SDHCI)
>
> @@ -92,4 +98,6 @@ typedef struct SDHCIState {
>  #define SYSBUS_SDHCI(obj)                               \
>       OBJECT_CHECK(SDHCIState, (obj), TYPE_SYSBUS_SDHCI)
>
> +#define TYPE_IMX_USDHC "imx-usdhc"
> +
>  #endif /* SDHCI_H */
> --
> 2.14.3

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

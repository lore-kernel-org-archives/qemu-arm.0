Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp5578890wrd;
        Tue, 18 Sep 2018 11:58:12 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYcOFOm/l5PhlAdrp0/U2/6jLgb9A9Jlx2nkr9nHPITtpuc2LOYoT1Rtq0ybr/Qsy7sDeFw
X-Received: by 2002:ac8:22f2:: with SMTP id g47-v6mr22740228qta.105.1537297092264;
        Tue, 18 Sep 2018 11:58:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537297092; cv=none;
        d=google.com; s=arc-20160816;
        b=uhtfUlJynUHGqzumizXVEk1p2b6P5gjvdXTWwjOR4Y5UBXV5n2i9o3JWupMjUlJjZn
         67/yaq1XEmhayzaUPKU4877/Z6op90JbjGHNElgvWeGSkqiF5hhXKoWWzH/Zd5hq93Px
         1Yy3U8ErfMBUQXN48GCnyD6QcrxQGMQaCCBfgOcTIsHmUKcJwBtI1HRf4C1/iyuzE/n5
         /MPClFO7XEBKmOqbGBKwuulW/G4BFDL4ZXqtj8Z+KcJLkDpRv2v2ncUSmRrvjdXOlc1V
         4WEGWMIUF7hGRIBk3lQfVrPaQnj9VRShvYmAuqTADHQ9lgZIxFlfrfTTtQd3KWLp3tt4
         4zCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=8iKKYZlriMkspSk/R9TTlPM8KuLbL6OPhhomQkildIo=;
        b=oLgYB6n5nbiNJr2JAada/jYV0f1QZ4iRSU7dNFzamjdhBnZ09c2GBMGJi7/M//RlAp
         AUd3Zx0C2HULKLL2K6zYm2LkG9mW1tnqvgldeAVCGzpVOaTjw2X8bBChNIBWjhHtYcfh
         pQl6RAyrPH3Yk2fGHXV6+RNyo9vXixR+U6Xoh5C3xCqg/ia6bDXboPeiSzTFiw5VGneO
         ceZ6gJTJR0rtn0YiIUgLZVz/TfwN9L5CvmzVWOk0hDZmf/OMgTHpL8/2W9k12IyeMiCB
         hk44uRdrSms3wo6+m9gMnLiKdyMYMOzdo9D3iPrlcG5xBdfsL9z3Rir1+lDg+4BQpecI
         dBAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ffBo7zQ5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t71-v6si3782106qka.210.2018.09.18.11.58.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Sep 2018 11:58:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ffBo7zQ5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42152 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g2LCN-0003fF-Qe
	for alex.bennee@linaro.org; Tue, 18 Sep 2018 14:58:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g2L9O-0000jD-Ek
	for qemu-devel@nongnu.org; Tue, 18 Sep 2018 14:55:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g2L9K-0005R9-9N
	for qemu-devel@nongnu.org; Tue, 18 Sep 2018 14:55:06 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:36398)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g2L9K-0005P4-1v
	for qemu-devel@nongnu.org; Tue, 18 Sep 2018 14:55:02 -0400
Received: by mail-ot1-x344.google.com with SMTP id w17-v6so3113276otk.3
	for <qemu-devel@nongnu.org>; Tue, 18 Sep 2018 11:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8iKKYZlriMkspSk/R9TTlPM8KuLbL6OPhhomQkildIo=;
	b=ffBo7zQ5uDIaRXsLo5c6ZNsOs9wXIIVjI6BWvCFZjGZbxMQZ1ySb47H0spc2GttUTj
	FFFifHHy74a2opgbhPCSCUq2F8hz1UXQiz9C2qUPnhDQlRHkgVELUaQFyzRT0yRpj2Py
	MIVrV68yEOhb1tqeYnodFPSgMwLyoVDJYhunA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8iKKYZlriMkspSk/R9TTlPM8KuLbL6OPhhomQkildIo=;
	b=b6aozcndNsCJqmtibI2lmNEsc0U9izfQOLVxoWDoRvGTkhiczLcy2Dn2rY9GZYfJyv
	w06N2PsfdDmYTjKHXn03eqbbR7Z4U6DQJzlVq6Wcz+ooN7yT+iaqLBbomcueyFSAq9dM
	9nc9eqDIivwG2KWmnLH/le4BxmkncaS2i00LnLG4UhdI8bOZpkcqIuW7HYGlCiABABbz
	mTketQtYR3HOTohUqWsXI6Fy1gAnSfbn90UfidA41kUkeleOSp1aCVqTjZ6rYXdPli62
	K85gDUrW9JbgizW3k5K9Li2JfwsLELqjZPUzlVqRQIo9g06hPUxYZLAb4GYZ9jVynnYu
	t5jA==
X-Gm-Message-State: APzg51AQ0JGtGUHBOZOVMHdOchwTAH8Uk0pwqQ9cpSC+PTQeVKgssmBQ
	Y+PkN1J4tkl8s4RnQqpIuLTOGilGhfTrS6X6HtE2Hg4E
X-Received: by 2002:a9d:640c:: with SMTP id
	h12-v6mr15910288otl.75.1537296900115; 
	Tue, 18 Sep 2018 11:55:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 18 Sep 2018 11:54:39
	-0700 (PDT)
In-Reply-To: <20180831103816.13479-10-clg@kaod.org>
References: <20180831103816.13479-1-clg@kaod.org>
	<20180831103816.13479-10-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Sep 2018 19:54:39 +0100
Message-ID: <CAFEAcA_6c6qpKWkonu=3c-ZJuyYx4pnH+_88dngOfeNBwuLfJw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH 09/11] aspeed/smc: add DMA calibration
 settings
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nxwQSlfpnLf3

On 31 August 2018 at 11:38, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> When doing calibration, the SPI clock rate in the CE0 Control Register
> and the read delay cycles in the Read Timing Compensation Register are
> replaced by bit[11:4] of the DMA Control Register.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/ssi/aspeed_smc.c | 54 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 534faec4c111..983066f5ad1d 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -695,6 +695,56 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr=
 addr, unsigned int size)
>      }
>  }
>
> +static uint8_t aspeed_smc_hclk_divisor(uint8_t hclk_mask)
> +{
> +    /* HCLK/1 .. HCLK/16 */
> +    const uint8_t hclk_divisors[] =3D {
> +        15, 7, 14, 6, 13, 5, 12, 4, 11, 3, 10, 2, 9, 1, 8, 0
> +    };
> +    int i;
> +
> +    for (i =3D 0; i < ARRAY_SIZE(hclk_divisors); i++) {
> +        if (hclk_mask =3D=3D hclk_divisors[i]) {
> +            return i + 1;
> +        }
> +    }
> +
> +    qemu_log_mask(LOG_GUEST_ERROR, "invalid HCLK mask %x", hclk_mask);
> +    return 0;
> +}
> +
> +/*
> + * When doing calibration, the SPI clock rate in the CE0 Control
> + * Register and the read delay cycles in the Read Timing
> + * Compensation Register are replaced by bit[11:4] of the DMA
> + * Control Register.
> + */
> +static void aspeed_smc_dma_calibration(AspeedSMCState *s)
> +{
> +    uint8_t delay =3D
> +        (s->regs[R_DMA_CTRL] >> DMA_CTRL_DELAY_SHIFT) & DMA_CTRL_DELAY_M=
ASK;
> +    uint8_t hclk_mask =3D
> +        (s->regs[R_DMA_CTRL] >> DMA_CTRL_FREQ_SHIFT) & DMA_CTRL_FREQ_MAS=
K;
> +    uint8_t hclk_div =3D aspeed_smc_hclk_divisor(hclk_mask);
> +    uint32_t hclk_shift =3D (hclk_div - 1) << 2;
> +    uint8_t cs;
> +
> +    /* Only HCLK/1 - HCLK/5 have tunable delays */
> +    if (hclk_div && hclk_div < 6) {
> +        s->regs[s->r_timings] &=3D ~(0xf << hclk_shift);
> +        s->regs[s->r_timings] |=3D delay << hclk_shift;
> +    }
> +
> +    /*
> +     * TODO: choose CS depending on the DMA address. This is not used
> +     * on the field.
> +     */

Not entirely sure what you have in mind by "on the field" here?
Not used by Linux?

thanks
-- PMM

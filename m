Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp312428wrd;
        Wed, 19 Sep 2018 00:02:39 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYU64OpoZOJhKYRz83xwyi+y2hue8xJSUxU3LY2mSvQy7cg5MmUhHii0a09/UPhdRKmzRq9
X-Received: by 2002:ac8:1019:: with SMTP id z25-v6mr24248963qti.25.1537340559618;
        Wed, 19 Sep 2018 00:02:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537340559; cv=none;
        d=google.com; s=arc-20160816;
        b=MPOA+73B/H57XdH15147HE3oZ4p8VltlI9HOoWDs/emGa9hhuF8xN7L91uyUsZvl8i
         z3yf/8WmnXLiLf5I20ia2A7W11by0qZX46No9SDTy/mHIXrQZklypCO1/rRlByGchmbt
         MDJ9VfU1I/qGO73aWbLLxmg0jONLQVQ+hynWVYEuTmXoicCQpbHT6KjXfl59Jdl8JsJk
         fkApTKq32o8f9N145yv1x83BjE/LKkxEN/oqVtojs1x45TQVaIqd2TXaawAHxbfOKgBH
         ITfD7MhL2W5s/UjSVg3TcO57U95RqF7yt8zMsKYTGBoEiTBA88/hXvFWyKs/hqatvHZO
         jJkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=raWsO5FNi1DZn/1CzXNl0GNxZUGVh7lbn4T7P4iA5Q8=;
        b=j/ZHJdRWoYTIz8ByknI4pQ28NSAqbq7XDd+sWYwn3i6emLeqa9ba0CbXaKMFFA79Ts
         pQrCdzpXoyM2YWH0H7s5dXRxR/cQnRDmmUpjj17bTayEhg0m2AOPyqube6ODjppYoSoV
         TYRHB+o93TlI81GUsWyrHLfbbNoXKJm7UtErSrBCzJVMMeMYZdn0sWtZwer7Jl5wgrYt
         a+MSI4/T82/3qOuhkQ2ArYS4f58zpbY5lTV/rjfWTc9KzsxbizBdnyMun51wHuHvzBAy
         1eog+n0QRBGPt0NEnvhSwmOmJX/o6HJXvAYxx+wKQLDbBGN9u+0C98u5x3E7CSoby1kT
         5ejw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o185-v6si5957876qkb.321.2018.09.19.00.02.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Sep 2018 00:02:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43960 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g2WVT-0001Xv-7T
	for alex.bennee@linaro.org; Wed, 19 Sep 2018 03:02:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g2WVD-0001Te-Ro
	for qemu-devel@nongnu.org; Wed, 19 Sep 2018 03:02:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g2WVA-00046v-IT
	for qemu-devel@nongnu.org; Wed, 19 Sep 2018 03:02:23 -0400
Received: from 20.mo3.mail-out.ovh.net ([178.33.47.94]:33516)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g2WV4-0003cC-1S
	for qemu-devel@nongnu.org; Wed, 19 Sep 2018 03:02:14 -0400
Received: from player746.ha.ovh.net (unknown [10.109.159.35])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id CFF941D0C7D
	for <qemu-devel@nongnu.org>; Wed, 19 Sep 2018 09:02:01 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
	by player746.ha.ovh.net (Postfix) with ESMTPSA id 0AF78500097;
	Wed, 19 Sep 2018 09:01:50 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180831103816.13479-1-clg@kaod.org>
	<20180831103816.13479-10-clg@kaod.org>
	<CAFEAcA_6c6qpKWkonu=3c-ZJuyYx4pnH+_88dngOfeNBwuLfJw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <24e6271c-4f2b-f39a-bbcc-fd2ed50479e6@kaod.org>
Date: Wed, 19 Sep 2018 09:01:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_6c6qpKWkonu=3c-ZJuyYx4pnH+_88dngOfeNBwuLfJw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 17611607817820998482
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrkeejgdduudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.47.94
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
X-TUID: nfv1b8BA09kF

On 09/18/2018 08:54 PM, Peter Maydell wrote:
> On 31 August 2018 at 11:38, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> When doing calibration, the SPI clock rate in the CE0 Control Register
>> and the read delay cycles in the Read Timing Compensation Register are
>> replaced by bit[11:4] of the DMA Control Register.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>  hw/ssi/aspeed_smc.c | 54 ++++++++++++++++++++++++++++++++++++++++++++=
+
>>  1 file changed, 54 insertions(+)
>>
>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>> index 534faec4c111..983066f5ad1d 100644
>> --- a/hw/ssi/aspeed_smc.c
>> +++ b/hw/ssi/aspeed_smc.c
>> @@ -695,6 +695,56 @@ static uint64_t aspeed_smc_read(void *opaque, hwa=
ddr addr, unsigned int size)
>>      }
>>  }
>>
>> +static uint8_t aspeed_smc_hclk_divisor(uint8_t hclk_mask)
>> +{
>> +    /* HCLK/1 .. HCLK/16 */
>> +    const uint8_t hclk_divisors[] =3D {
>> +        15, 7, 14, 6, 13, 5, 12, 4, 11, 3, 10, 2, 9, 1, 8, 0
>> +    };
>> +    int i;
>> +
>> +    for (i =3D 0; i < ARRAY_SIZE(hclk_divisors); i++) {
>> +        if (hclk_mask =3D=3D hclk_divisors[i]) {
>> +            return i + 1;
>> +        }
>> +    }
>> +
>> +    qemu_log_mask(LOG_GUEST_ERROR, "invalid HCLK mask %x", hclk_mask)=
;
>> +    return 0;
>> +}
>> +
>> +/*
>> + * When doing calibration, the SPI clock rate in the CE0 Control
>> + * Register and the read delay cycles in the Read Timing
>> + * Compensation Register are replaced by bit[11:4] of the DMA
>> + * Control Register.
>> + */
>> +static void aspeed_smc_dma_calibration(AspeedSMCState *s)
>> +{
>> +    uint8_t delay =3D
>> +        (s->regs[R_DMA_CTRL] >> DMA_CTRL_DELAY_SHIFT) & DMA_CTRL_DELA=
Y_MASK;
>> +    uint8_t hclk_mask =3D
>> +        (s->regs[R_DMA_CTRL] >> DMA_CTRL_FREQ_SHIFT) & DMA_CTRL_FREQ_=
MASK;
>> +    uint8_t hclk_div =3D aspeed_smc_hclk_divisor(hclk_mask);
>> +    uint32_t hclk_shift =3D (hclk_div - 1) << 2;
>> +    uint8_t cs;
>> +
>> +    /* Only HCLK/1 - HCLK/5 have tunable delays */
>> +    if (hclk_div && hclk_div < 6) {
>> +        s->regs[s->r_timings] &=3D ~(0xf << hclk_shift);
>> +        s->regs[s->r_timings] |=3D delay << hclk_shift;
>> +    }
>> +
>> +    /*
>> +     * TODO: choose CS depending on the DMA address. This is not used
>> +     * on the field.
>> +     */
>=20
> Not entirely sure what you have in mind by "on the field" here?
> Not used by Linux?

Today, the FMC/SPI calibration using the DMA registers is done by the=20
U-Boot bootloader from the SDK. I don't know of any other implementation=20
a part from the patchset I just sent adding a new Aspeed FMC/SPI driver=20
in U-Boot, which is not merged yet.

Linux uses a similar algorithm but without the DMA registers because=20
they are not available on the non-FMC/SPI controllers.

That was for the "on the field" survey.=20

As for the comment statement it self,=20

There is not much reason choosing a DMA Flash address pointing to=20
another CS, because the Read Timing Compensation Register values apply=20
to all CS on the SPI bus. So the model limitation is not a big problem.=20
Nevertheless we could compute the CS from the DMA address and the segment=
=20
registers if needed.=20

Thanks,

C.=20
C.=20

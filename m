Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp710529njb;
        Wed, 25 Sep 2024 21:07:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWvARDwf5UrxT+D6+k7yxLpL2fxp+7p+IbjsSZF8SU2l4PtUlaMV4uIgnWJwoRskL47xTnxLndu9TFlmA==@linaro.org
X-Google-Smtp-Source: AGHT+IF5UhwkeuzCY400GDty0gSP9UPtJCGJCbB9qjwKZdYULjMnRYau/KOhFZ1KLv3iNqGlRcmy
X-Received: by 2002:ac8:7dcf:0:b0:457:c74a:6386 with SMTP id d75a77b69052e-45b5def477bmr86611291cf.34.1727323625443;
        Wed, 25 Sep 2024 21:07:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727323625; cv=none;
        d=google.com; s=arc-20240605;
        b=fj5EqTEfZ1b5z/IMfWC28ep8et0P9Vy8M/NHB0QGTOY4jkde56nqlXzpb1p+8auO/y
         PWxqd68YuVCIvhDvCKgD3g9hrKreJuqb/DXUiNsI55rIK7gocAA5W/oaxZ6owA0y15C2
         vksWanu1CY+S5GMYdT9eiseUncCcKTAwYtvXnmraDoqT8GdJRZQe6RvzHnz19x1tzpFL
         dfKjVwYdzWwAiW5tcl6m59ADErVcfneR+Te/v2V/FDG1qFbnr1fqe78HE19dQgR65aGi
         dc4qpZy8/MrvuOZn8Tn2tl5W3Rvev3+vkJO9Eap4qMzCSKXdqUAQC4jE4t7xet63Rp4f
         WlcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=AwjHvTMNDuVr5eQ2V3HiI+0UovJyD2/N/4ItkGP5phw=;
        fh=ZOisryR2Mb28fNxWQse9qjy5qBOClWtToxOZdGTojXg=;
        b=bORcXenBThWqq36jX5X6L9luNooI47KOIc6dHEoomWsYCbEAAYEKQRssLO7+u34INR
         NEiiYmGABj55T6zaMRRM7Ycp8H8SKzTea0sh1xubI0afkqZNgUlMQj9r93pSErnCA4P3
         OUpMIBgwwthbh9vySKeyKDnWj4pUZUUSObqWeVciNjNNB542v+QcQkS59A+4Bm6GRr1R
         rc04eGzKKkYOu3rbd+w5ysDI5BJQd0i2H3JAMKxOwfQiFT5hULYcNwBN/xanzfNux6hj
         27RGxjCZcVI+8CKRIObjyLIRfhO1J+HHivoWy9LwytmU1VBHXjawVmeKjNuFjRbgbBnl
         THzw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=FfpfbmE6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45b52591445si51995441cf.166.2024.09.25.21.07.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2024 21:07:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=FfpfbmE6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1stfmA-000097-CR; Thu, 26 Sep 2024 00:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1stfm9-000082-0V; Thu, 26 Sep 2024 00:06:45 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1stfm5-0005yQ-VG; Thu, 26 Sep 2024 00:06:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1727323590;
 bh=AwjHvTMNDuVr5eQ2V3HiI+0UovJyD2/N/4ItkGP5phw=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=FfpfbmE6VFQXdc1RI0EEKBYj1jrJjNUZTJP3n4aH3BCIGoCDbOUD4j+auIPS1MSZM
 exgSsQSHvif3vMmsGgfNUd/Eq+Z2upBMRYeHXLCurqee3S53xwPSwYm6I42GERvO1y
 BEOgKRfr8/Yg9qBZ859Vumc428bzQ93XuvAZIyG0GBzrN6CAjAUezI2XLYggCcPXl/
 X++gxsncQA/7iAcTSQu5RTWSlGteaXudXIMMawFpGLotoqdH4rMm4C7O3+0lWJeggs
 43Wlu1p5sbJUr9RhEl2m9bthZlgmdR1hJeM1Y7u0xNDxZWsrZ21vcp6nUV8V6OGxQC
 YRL2P1E6tii4g==
Received: from [192.168.68.112]
 (ppp118-210-177-92.adl-adc-lon-bras34.tpg.internode.on.net [118.210.177.92])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 43EA66508E;
 Thu, 26 Sep 2024 12:06:28 +0800 (AWST)
Message-ID: <2fc6fc4954ff4a769c5ebd4562ce37280fd87c07.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 4/6] hw/gpio/aspeed: Fix clear incorrect interrupt
 status for GPIO index mode
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?ISO-8859-1?Q?C=E9dric?= Le
 Goater <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>, Steven Lee
 <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
Date: Thu, 26 Sep 2024 13:36:25 +0930
In-Reply-To: <20240925033454.4117445-5-jamin_lin@aspeedtech.com>
References: <20240925033454.4117445-1-jamin_lin@aspeedtech.com>
 <20240925033454.4117445-5-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.29.241.158;
 envelope-from=andrew@codeconstruct.com.au; helo=codeconstruct.com.au
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 4GIzwOQxv4O/

Hi Jamin,

On Wed, 2024-09-25 at 11:34 +0800, Jamin Lin wrote:
> The interrupt status field is W1C, where a set bit on read indicates an
> interrupt is pending. If the bit extracted from data is set it should
> clear the corresponding bit in group_value. However, if the extracted
> bit is clear then the value of the corresponding bit in group_value
> should be unchanged.
>=20
> SHARED_FIELD_EX32() extracts the interrupt status bit from the write
> (data). group_value is set to the set's interrupt status, which means
> that for any pin with an interrupt pending, the corresponding bit is
> set. The deposit32() call updates the bit at pin_idx in the group,
> using the value extracted from the write (data).
>=20
> The result is that if multiple interrupt status bits
> were pending and the write was acknowledging specific one bit,
> then the all interrupt status bits will be cleared.
> However, it is index mode and should only clear the corresponding bit.
>=20
> For example, say we have an interrupt pending for GPIOA0, where the
> following statements are true:
>=20
>    set->int_status =3D=3D 0b01
>    s->pending =3D=3D 1
>=20
> Before it is acknowledged, an interrupt becomes pending for GPIOA1:
>=20
>    set->int_status =3D=3D 0b11
>    s->pending =3D=3D 2
>=20
> A write is issued to acknowledge the interrupt for GPIOA0. This causes
> the following sequence:
>=20
>    reg_value =3D=3D 0b11
>    pending =3D=3D 2
>    s->pending =3D 0

Note that I had a typo in my reply that prompted this patch, this was
meant to be:

    s->pending =3D=3D 0

>    set->int_status =3D=3D 0b00
>=20
> It should only clear bit 0 in index mode and the correct result
> should be as following.
>=20
>    set->int_status =3D=3D 0b11
>    s->pending =3D=3D 2
>=20
>    pending =3D=3D 1
>    s->pending =3D 1

Same typo here now :)

    s->pending =3D=3D 1

>    set->int_status =3D=3D 0b10
>=20
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  hw/gpio/aspeed_gpio.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>=20
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index 6e6ab48b56..58ae63e3c1 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -642,7 +642,7 @@ static void aspeed_gpio_write_index_mode(void *opaque=
, hwaddr offset,
>      uint32_t pin_idx =3D reg_idx_number % ASPEED_GPIOS_PER_SET;
>      uint32_t group_idx =3D pin_idx / GPIOS_PER_GROUP;
>      uint32_t reg_value =3D 0;
> -    uint32_t cleared;
> +    uint32_t pending =3D 0;
> =20
>      set =3D &s->sets[set_idx];
>      props =3D &agc->props[set_idx];
> @@ -705,15 +705,16 @@ static void aspeed_gpio_write_index_mode(void *opaq=
ue, hwaddr offset,
>          set->int_sens_2 =3D update_value_control_source(set, set->int_se=
ns_2,
>                                                        reg_value);
>          /* set interrupt status */
> -        reg_value =3D set->int_status;
> -        reg_value =3D deposit32(reg_value, pin_idx, 1,
> -                              FIELD_EX32(data, GPIO_INDEX_REG, INT_STATU=
S));
> -        cleared =3D ctpop32(reg_value & set->int_status);
> -        if (s->pending && cleared) {
> -            assert(s->pending >=3D cleared);
> -            s->pending -=3D cleared;
> +        if (FIELD_EX32(data, GPIO_INDEX_REG, INT_STATUS)) {
> +            pending =3D extract32(set->int_status, pin_idx, 1);
> +            if (pending) {
> +                if (s->pending) {
> +                    assert(s->pending >=3D pending);
> +                    s->pending -=3D pending;
> +                }
> +                set->int_status =3D deposit32(set->int_status, pin_idx, =
1, 0);
> +            }

So I think we can get away without the nested conditionals?

   if (FIELD_EX32(data, GPIO_INDEX_REG, INT_STATUS)) {
       /* pending is either 1 or 0 for a 1-bit field */
       pending =3D extract32(set->int_status, pin_idx, 1);
      =20
       /*
        * The assert is effectively a compressed form of
        *
        *     assert((s->pending =3D=3D 0 && pending =3D=3D 0) ||
        *            (s->pending >=3D 1));
        *
        * This seems reasonable.
        *
        * Another way to write it is:
        *
        *     assert(!pending || s->pending));
        */
       assert(s->pending >=3D pending);
  =20
       /* No change to s->pending if pending is 0 */
       s->pending -=3D pending;
  =20
       /*
        * The write acknowledged the interrupt regardless of whether it
        * was pending or not. The post-condition is that it mustn't be
        * pending. Unconditionally clear the status bit.
        */
       s->int_status =3D deposit32(set->int_status, pin_idx, 1, 0);
   }
  =20
Thoughts?

Up to you whether you keep the comments if the idea makes sense and you
choose to adopt it.

Andrew

Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp978677ejb;
        Thu, 19 Oct 2023 21:49:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZRp9+8BfCcN6zCKyi3IuM36hIyCdfvYtDw3v4SzVprXj45im4YwTT+nSSSgK91yF4W4S2
X-Received: by 2002:a05:6214:4114:b0:65b:259f:d6a9 with SMTP id kc20-20020a056214411400b0065b259fd6a9mr798442qvb.7.1697777344716;
        Thu, 19 Oct 2023 21:49:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697777344; cv=none;
        d=google.com; s=arc-20160816;
        b=l6OWNbjzSUwsXV2AVy3N30tKAAf47HpakRCWTS0GZcMn5A46XWKQxgpx3a8CayxMev
         LpRvOHqLpfnMGslXyDm/3u9fIjOzSXppq4iwyzGDJGzqCBEA2I8NWAfkVTVrqdEhGLvY
         Sq/ZNcUjxpLxRvHCzShROUOKUqfzhpLV34LCU9kLUjFhz9Dc9+4B6/OkG7TYXyAs73DQ
         khHwz/0kAxU53A//X2qnnwMjdgWZxo6ORpgI13g/4vOgyRrHC4192MXVxtbcOmVA0DVW
         +Q8aS6+PcJS20Ylq72WZqGNsUxAulldt35Sck6I2iLYiFoUN8FvHqUIGwwcA179ZCihr
         kmMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=qb8zvdy9yfl9EGc28qcJE3Nagv7ks920k2NqeCyS7Ys=;
        fh=rsDhmtETeCWf5TjvwkGMR5h8pIiv0Ik8PnLTrOTkjKM=;
        b=dwlILjDb1zS9afGeOH9HyrYMLJZAiL2wJXIJyEoOK9AP82KtzMAJOjeqr3G3tItVHC
         FPYT8I31cOPT1xxVsrkqdeMIwgko66vMt79A1gp/haxtfQtyty7kvWRrqNhx3KIVbUGL
         Cfq9hNuCGauE/OmD3usUVMc8zvsYWkwcHav3ImmErlBpeSTBCThWpq/5jP5rbb18SLsc
         w1jswhWk2y5a+PsmvR2GiBmWbsMjxpd0Ieb05goRjNXHICaENS2LwbLbLT/vMOFgUi02
         wampkduHwKwjO3f050TquVhM1vVFUvyygfuEgNdiG2ROJlIqMiaFC5Enb5OpctfM+mZo
         FmZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=MBXzLv+I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19-20020a05622a179300b0041cbaed294esi721267qtk.609.2023.10.19.21.49.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 21:49:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=MBXzLv+I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qthQt-0002Xi-6y; Fri, 20 Oct 2023 00:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1qthQs-0002XT-51; Fri, 20 Oct 2023 00:48:22 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1qthQo-00008a-Li; Fri, 20 Oct 2023 00:48:21 -0400
Received: from [192.168.68.112]
 (ppp118-210-136-142.adl-adc-lon-bras33.tpg.internode.on.net
 [118.210.136.142])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4A3B82014B;
 Fri, 20 Oct 2023 12:48:09 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1697777291;
 bh=qb8zvdy9yfl9EGc28qcJE3Nagv7ks920k2NqeCyS7Ys=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=MBXzLv+Izvuklk4pkFPn+AD1NYVJUkz4sbPlSPubE+PicWY7dT7jVtbvpI+6rmt+t
 jYemDsOnxUjzZ0plNbE/SbKk6K2wi0ezM0VKVbMEksmRoUbYrZ23hXQGSawvVeuFC/
 97+hUmjLh+kLsb+DMWSKoZnlbmyUj3tsV0JTPP7ox/T/CHcePvqQCdXs0Xz8oTRubb
 g8PP2cyhgqeW//hlMxEEy4HPe1EoAEUNVW4ts5Tk9vImOPVyjLAH0VlrQvl+lL/BI7
 38EJOXbXloCPc5yaJ+T2njbVF9sJoOpwgh+bhQudBbHCHdU0coLi286xeDoZ03oAdW
 aBK0bz+LIFZHg==
Message-ID: <5145c79ae63a5798663cc1ecae205d77865ae30a.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/2] misc/pca9552: Let external devices set pca9552 inputs
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Glenn Miles <milesg@linux.vnet.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Date: Fri, 20 Oct 2023 15:18:08 +1030
In-Reply-To: <20231019204011.3174115-3-milesg@linux.vnet.ibm.com>
References: <20231019204011.3174115-1-milesg@linux.vnet.ibm.com>
 <20231019204011.3174115-3-milesg@linux.vnet.ibm.com>
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
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
X-TUID: ct3JdOwF43H7

On Thu, 2023-10-19 at 15:40 -0500, Glenn Miles wrote:
> Allow external devices to drive pca9552 input pins by adding
> input GPIO's to the model.  This allows a device to connect
> its output GPIO's to the pca9552 input GPIO's.
>=20
> In order for an external device to set the state of a pca9552
> pin, the pin must first be configured for high impedance (LED
> is off).  If the pca9552 pin is configured to drive the pin low
> (LED is on), then external input will be ignored.
>=20
> Here is a table describing the logical state of a pca9552 pin
> given the state being driven by the pca9552 and an external device:
>=20
>                    PCA9552
>                    Configured
>                    State
>=20
>                   | Hi-Z | Low |
>             ------+------+-----+
>   External   Hi-Z |  Hi  | Low |
>   Device    ------+------+-----+
>   State      Low  |  Low | Low |
>             ------+------+-----+
>=20
> Signed-off-by: Glenn Miles <milesg@linux.vnet.ibm.com>
> ---
>=20
> Changes from previous version:
>  - Added #define's for external state values
>  - Added logic state table to commit message
>  - Added cover letter
>=20
>  hw/misc/pca9552.c         | 41 ++++++++++++++++++++++++++++++++++-----
>  include/hw/misc/pca9552.h |  3 ++-
>  2 files changed, 38 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
> index 445f56a9e8..ed814d1f98 100644
> --- a/hw/misc/pca9552.c
> +++ b/hw/misc/pca9552.c
> @@ -44,6 +44,8 @@ DECLARE_CLASS_CHECKERS(PCA955xClass, PCA955X,
>  #define PCA9552_LED_OFF  0x1
>  #define PCA9552_LED_PWM0 0x2
>  #define PCA9552_LED_PWM1 0x3
> +#define PCA9552_PIN_LOW  0x0
> +#define PCA9552_PIN_HIZ  0x1
> =20
>  static const char *led_state[] =3D {"on", "off", "pwm0", "pwm1"};
> =20
> @@ -116,16 +118,22 @@ static void pca955x_update_pin_input(PCA955xState *=
s)
>          switch (config) {
>          case PCA9552_LED_ON:
>              /* Pin is set to 0V to turn on LED */
> -            qemu_set_irq(s->gpio[i], 0);
> +            qemu_set_irq(s->gpio_out[i], 0);

pca955x_update_pin_input() is called by the external GPIO handling path
as well as the I2C command handling path. If the I2C path sets the line
low followed by the device attached to the GPIO setting the line low
then I think each change will issue an event on the outbound GPIO. Is
that desired behaviour? Does it matter?

>              s->regs[input_reg] &=3D ~(1 << input_shift);
>              break;
>          case PCA9552_LED_OFF:
>              /*
>               * Pin is set to Hi-Z to turn off LED and
> -             * pullup sets it to a logical 1.
> +             * pullup sets it to a logical 1 unless
> +             * external device drives it low.
>               */
> -            qemu_set_irq(s->gpio[i], 1);
> -            s->regs[input_reg] |=3D 1 << input_shift;
> +            if (s->ext_state[i] =3D=3D PCA9552_PIN_LOW) {
> +                qemu_set_irq(s->gpio_out[i], 0);

Similarly here - it might be the case that both devices have pulled the
line low and now the I2C path is releasing it. Given the external
device had already pulled the line low as well should we expect an
event to occur issued here? Should it matter?

Andrew

> +                s->regs[input_reg] &=3D ~(1 << input_shift);
> +            } else {
> +                qemu_set_irq(s->gpio_out[i], 1);
> +                s->regs[input_reg] |=3D 1 << input_shift;
> +            }
>              break;
>          case PCA9552_LED_PWM0:
>          case PCA9552_LED_PWM1:
> @@ -340,6 +348,7 @@ static const VMStateDescription pca9552_vmstate =3D {
>          VMSTATE_UINT8(len, PCA955xState),
>          VMSTATE_UINT8(pointer, PCA955xState),
>          VMSTATE_UINT8_ARRAY(regs, PCA955xState, PCA955X_NR_REGS),
> +        VMSTATE_UINT8_ARRAY(ext_state, PCA955xState, PCA955X_PIN_COUNT_M=
AX),
>          VMSTATE_I2C_SLAVE(i2c, PCA955xState),
>          VMSTATE_END_OF_LIST()
>      }
> @@ -358,6 +367,7 @@ static void pca9552_reset(DeviceState *dev)
>      s->regs[PCA9552_LS2] =3D 0x55;
>      s->regs[PCA9552_LS3] =3D 0x55;
> =20
> +    memset(s->ext_state, PCA9552_PIN_HIZ, PCA955X_PIN_COUNT_MAX);
>      pca955x_update_pin_input(s);
> =20
>      s->pointer =3D 0xFF;
> @@ -380,6 +390,26 @@ static void pca955x_initfn(Object *obj)
>      }
>  }
> =20
> +static void pca955x_set_ext_state(PCA955xState *s, int pin, int level)
> +{
> +    if (s->ext_state[pin] !=3D level) {
> +        uint16_t pins_status =3D pca955x_pins_get_status(s);
> +        s->ext_state[pin] =3D level;
> +        pca955x_update_pin_input(s);
> +        pca955x_display_pins_status(s, pins_status);
> +    }
> +}
> +
> +static void pca955x_gpio_in_handler(void *opaque, int pin, int level)
> +{
> +
> +    PCA955xState *s =3D PCA955X(opaque);
> +    PCA955xClass *k =3D PCA955X_GET_CLASS(s);
> +
> +    assert((pin >=3D 0) && (pin < k->pin_count));
> +    pca955x_set_ext_state(s, pin, level);
> +}
> +
>  static void pca955x_realize(DeviceState *dev, Error **errp)
>  {
>      PCA955xClass *k =3D PCA955X_GET_CLASS(dev);
> @@ -389,7 +419,8 @@ static void pca955x_realize(DeviceState *dev, Error *=
*errp)
>          s->description =3D g_strdup("pca-unspecified");
>      }
> =20
> -    qdev_init_gpio_out(dev, s->gpio, k->pin_count);
> +    qdev_init_gpio_out(dev, s->gpio_out, k->pin_count);
> +    qdev_init_gpio_in(dev, pca955x_gpio_in_handler, k->pin_count);
>  }
> =20
>  static Property pca955x_properties[] =3D {
> diff --git a/include/hw/misc/pca9552.h b/include/hw/misc/pca9552.h
> index b6f4e264fe..c36525f0c3 100644
> --- a/include/hw/misc/pca9552.h
> +++ b/include/hw/misc/pca9552.h
> @@ -30,7 +30,8 @@ struct PCA955xState {
>      uint8_t pointer;
> =20
>      uint8_t regs[PCA955X_NR_REGS];
> -    qemu_irq gpio[PCA955X_PIN_COUNT_MAX];
> +    qemu_irq gpio_out[PCA955X_PIN_COUNT_MAX];
> +    uint8_t ext_state[PCA955X_PIN_COUNT_MAX];
>      char *description; /* For debugging purpose only */
>  };
> =20


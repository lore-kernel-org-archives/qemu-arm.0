Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp938453ejb;
        Thu, 19 Oct 2023 19:52:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQxv5bu69PykX8LCWw6KYRN+FJFzkNNJyp1LSd+JvvxHusua0A3NyC/6NhltWQcTk0HX8a
X-Received: by 2002:a05:6214:5199:b0:657:d1d5:7c9 with SMTP id kl25-20020a056214519900b00657d1d507c9mr697615qvb.12.1697770354258;
        Thu, 19 Oct 2023 19:52:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697770354; cv=none;
        d=google.com; s=arc-20160816;
        b=fcffj9UWTTc7Rg4XMOp84+2BGLHuKuIPFvyHQaAF/tPwOvwKbCiedIdRY1u5CmijA1
         xlrHKm9hTncw6nvNR1WhXkIKyCFgmxcX8xVU6o4+dNbVxAqDZNqJDZgGpGmgm0ue2NWL
         6arLwGvOxJsO1Bd2UF2aO9RtlmXnOqBMnM7dnffmboDsPzJSZhvO9HKwrrq6xODByvvX
         LZfNh038RW9sZDl7BcstkQTWGpyjLxNypu12t2MouwDaMsasxRvhmyoXbXeXoTC/CmnF
         OOyiIWw1sg80MszW7h2YAJYKl52/6w3hpUtAMlCvpFIDkeC5K4f05FVPUt++WaeDpUJP
         vX9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=Z2pgugpF/CIcSQgJJthKo3fKGouwMrYw7wApHyRvrZs=;
        fh=i1FaxtMG8zVDI+hy3nqAeSOKwU/LtkKgGevhfTvVEGU=;
        b=qaWAspej9MRlmoPQGrtnmvSgV4Fb5yulXslbBvpQbGTKv2UdDkI9ggKFIGDgU6YGzG
         +Kl3x4bylxgojxg04BM3WzQuH1iWrlt53NeQJIxXQSuXoWj+46sOpNG/8WXKx6TGZg4S
         0tAswelH3+ajTcksowU3fRowzVuyFE/8/4PORzT2Zbh9O3NPHreAtOR5YX892le5V0zo
         qfzkCSmmjjBOKqWPt/tkZ96cTxmv37JZjNrL6hyLN3w3mYzm/DnKT8prgHdcD7Hf1hmJ
         PDU1qFfFBLkBAHFOLJ8J08/xLu1eGN+0sS+YiuF7qIsjn6dSqab3JInXdI1PgE2ZMlY6
         PRPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=DOF5EGhi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w16-20020a0562140b3000b0066d130cbb9esi734007qvj.60.2023.10.19.19.52.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 19:52:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=DOF5EGhi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtfcS-00015y-AF; Thu, 19 Oct 2023 22:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1qtfcQ-00015U-EZ; Thu, 19 Oct 2023 22:52:10 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1qtfcK-0004x1-PH; Thu, 19 Oct 2023 22:52:10 -0400
Received: from [192.168.68.112]
 (ppp118-210-136-142.adl-adc-lon-bras33.tpg.internode.on.net
 [118.210.136.142])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 173DA20052;
 Fri, 20 Oct 2023 10:51:50 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1697770313;
 bh=Z2pgugpF/CIcSQgJJthKo3fKGouwMrYw7wApHyRvrZs=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=DOF5EGhiZVN3KfcIhKf/SKnVtWCroJW3LcPpIbOkJIe0kzA8tWX1f538vvGlKXPmK
 XOF7zsrKHaPd2CyO20I895aXjg4V25edQjMpidbAmyE2SbOSJlWYqCXSpgIc/9LTIn
 lQG65OmKmD0+n4Z7OOSawCzLo7PT4LGUK93qRKkki/2mJ+r6MBqX/jwNCpC7ke6FcQ
 KxvFJ4r//FXQYobVVhytiiO2vaNXNJvTKoHb4sw1M0qHgHAoS5YV3zYdmqkO6mt6WM
 pndbb5hfr0k27Mn1TZq6E7C4+xeCFPNblEPHPUowwPWixwS+SJrOsBEu1KvJrn9K7i
 h7fflYlZldhWQ==
Message-ID: <e0f36ef6336df26d5c123c5861d6a779c94e3eb9.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/2] misc/pca9552: Fix inverted input status
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Glenn Miles <milesg@linux.vnet.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, f4bug@amsat.org
Date: Fri, 20 Oct 2023 13:21:48 +1030
In-Reply-To: <20231019204011.3174115-2-milesg@linux.vnet.ibm.com>
References: <20231019204011.3174115-1-milesg@linux.vnet.ibm.com>
 <20231019204011.3174115-2-milesg@linux.vnet.ibm.com>
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
X-TUID: D2fajJDuV5fb

On Thu, 2023-10-19 at 15:40 -0500, Glenn Miles wrote:
> > The pca9552 INPUT0 and INPUT1 registers are supposed to
> > hold the logical values of the LED pins.  A logical 0
> > should be seen in the INPUT0/1 registers for a pin when
> > its corresponding LSn bits are set to 0, which is also
> > the state needed for turning on an LED in a typical
> > usage scenario.  Existing code was doing the opposite
> > and setting INPUT0/1 bit to a 1 when the LSn bit was
> > set to 0, so this commit fixes that.
> >=20
> > Signed-off-by: Glenn Miles <milesg@linux.vnet.ibm.com>
> > ---
> >=20
> > Changes from prior version:
> >     - Added comment regarding pca953X
> >     - Added cover letter
> >=20
> >  hw/misc/pca9552.c          | 18 +++++++++++++-----
> >  tests/qtest/pca9552-test.c |  6 +++---
> >  2 files changed, 16 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
> > index fff19e369a..445f56a9e8 100644
> > --- a/hw/misc/pca9552.c
> > +++ b/hw/misc/pca9552.c
> > @@ -36,7 +36,10 @@ typedef struct PCA955xClass PCA955xClass;
> > =20
> >  DECLARE_CLASS_CHECKERS(PCA955xClass, PCA955X,
> >                         TYPE_PCA955X)
> > -
> > +/*
> > + * Note:  The LED_ON and LED_OFF configuration values for the PCA955X
> > + *        chips are the reverse of the PCA953X family of chips.
> > + */
> >  #define PCA9552_LED_ON   0x0
> >  #define PCA9552_LED_OFF  0x1
> >  #define PCA9552_LED_PWM0 0x2
> > @@ -112,13 +115,18 @@ static void pca955x_update_pin_input(PCA955xState=
 *s)
> > =20
> >          switch (config) {
> >          case PCA9552_LED_ON:
> > -            qemu_set_irq(s->gpio[i], 1);
> > -            s->regs[input_reg] |=3D 1 << input_shift;
> > -            break;
> > -        case PCA9552_LED_OFF:
> > +            /* Pin is set to 0V to turn on LED */
> >              qemu_set_irq(s->gpio[i], 0);
> >              s->regs[input_reg] &=3D ~(1 << input_shift);
> >              break;
> > +        case PCA9552_LED_OFF:
> > +            /*
> > +             * Pin is set to Hi-Z to turn off LED and
> > +             * pullup sets it to a logical 1.
> > +             */
> > +            qemu_set_irq(s->gpio[i], 1);
> > +            s->regs[input_reg] |=3D 1 << input_shift;
> > +            break;

So the witherspoon-bmc machine was a user of the PCA9552 outputs as
LEDs. I guess its LEDs were in the wrong state the whole time? That
looks like the only user though, and shouldn't be negatively affected.

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

> >          case PCA9552_LED_PWM0:
> >          case PCA9552_LED_PWM1:
> >              /* TODO */
> > diff --git a/tests/qtest/pca9552-test.c b/tests/qtest/pca9552-test.c
> > index d80ed93cd3..ccca2b3d91 100644
> > --- a/tests/qtest/pca9552-test.c
> > +++ b/tests/qtest/pca9552-test.c
> > @@ -60,7 +60,7 @@ static void send_and_receive(void *obj, void *data, Q=
GuestAllocator *alloc)
> >      g_assert_cmphex(value, =3D=3D, 0x55);
> > =20
> >      value =3D i2c_get8(i2cdev, PCA9552_INPUT0);
> > -    g_assert_cmphex(value, =3D=3D, 0x0);
> > +    g_assert_cmphex(value, =3D=3D, 0xFF);
> > =20
> >      pca9552_init(i2cdev);
> > =20
> > @@ -68,13 +68,13 @@ static void send_and_receive(void *obj, void *data,=
 QGuestAllocator *alloc)
> >      g_assert_cmphex(value, =3D=3D, 0x54);
> > =20
> >      value =3D i2c_get8(i2cdev, PCA9552_INPUT0);
> > -    g_assert_cmphex(value, =3D=3D, 0x01);
> > +    g_assert_cmphex(value, =3D=3D, 0xFE);
> > =20
> >      value =3D i2c_get8(i2cdev, PCA9552_LS3);
> >      g_assert_cmphex(value, =3D=3D, 0x54);
> > =20
> >      value =3D i2c_get8(i2cdev, PCA9552_INPUT1);
> > -    g_assert_cmphex(value, =3D=3D, 0x10);
> > +    g_assert_cmphex(value, =3D=3D, 0xEF);
> >  }
> > =20
> >  static void pca9552_register_nodes(void)



Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2031415wru;
        Thu, 16 Aug 2018 09:14:59 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwnr5pv0LSnwHWoS7+zK2WqMghKhfDPMj+fJVG0HHpvVmqhtS1mQ1GZ/h0l1nv0FP349MBf
X-Received: by 2002:aed:3e47:: with SMTP id m7-v6mr31703293qtf.210.1534436099835;
        Thu, 16 Aug 2018 09:14:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534436099; cv=none;
        d=google.com; s=arc-20160816;
        b=c2eZDttvg8GPm1e/kO17zKiPYspUl/AZqN/eppESsi5XeEroOSk05oogxyx7VTpNTg
         Wro+jc3rnjRlTReqme5Z6ofDUErFADBqGBlcXlG7FlgV7VRBUY99/74Z4Sv/LeRayGdf
         Mq0sC+BRy9MJXAYIuA4PnJ+2Ab/wwzW7jeO55zKUQ0Io3E6KdsN8TbMBctkVTnshA5bp
         btZXatt/5oQhhlJFV8b2qKjxbHuflU6OJY2GXJmYWaTbnagshbg5VZWygvnEQwurkjRS
         7grzVU88VoA21XGT5zpLQCz97Q1e74Pd48/oPPMEcIrxLTI/DCigggWbxcaZXU9tk2OM
         4ppw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=f/wirua2emh6ld/PIcgc/JN+FWXHuWV0j0D91O0AuVw=;
        b=G3Hh1YNJHyyK7Almfw4SevLMVzaJWM1w3144VBP1eajAhcNb3o/L5DuWZkdK2nNJ0O
         4u/ioRyJgknqSd9zOT9+2WRi5om9o9fiPojlVdFYFJlnVobTcC/EfMZaDvgvedHcoEtj
         foPZEeQxaSOnEpDd1rFs+4q9qQjFGpRgOvvEPayvj78bvA9a3N3l1XJnFeboQNOdaa5g
         TJN2Y0OpRhPWdRHJ3EoINJ18Rzh4GFg+78Uiw/esWOpipcKNapdkthIp1MRlwVvFqX3y
         t3HA9Hy1LtrnPcO6AtBARSnycpkf/fh/ZIqCSyg/BS9O1AmkoJHseFAupM/ih+58OpDt
         v0rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CrdBGUHF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e10-v6si4029298qka.341.2018.08.16.09.14.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 09:14:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CrdBGUHF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56653 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqKvL-0002BE-7V
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 12:14:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqK7A-0000HD-D3
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 11:23:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqK77-0004Rt-WA
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 11:23:07 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:34237)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqK77-0004Qj-Bf
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 11:23:05 -0400
Received: by mail-oi0-x244.google.com with SMTP id 13-v6so8696534ois.1
	for <qemu-devel@nongnu.org>; Thu, 16 Aug 2018 08:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=f/wirua2emh6ld/PIcgc/JN+FWXHuWV0j0D91O0AuVw=;
	b=CrdBGUHFB0LuG5p05X8YxM+oreY9+Kf64S0bfpIRcSS92TVhXoSGsnXiXv3p3SHgW4
	VngZKViEw5TLy0dBkosHFsXOtq4X/7OY4snHSHW1ss5YgQ0+m0nfHtNYdwTiqDXnhaTO
	UdraoKjckp/JW0/NHgZst58Hp70PlLsK+/ClQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=f/wirua2emh6ld/PIcgc/JN+FWXHuWV0j0D91O0AuVw=;
	b=mmcKpGZMwk/KpaFfRgp2ONcln3h1BnFUDFZCsBVICUxIlVPXgneWPIYwrQZTFfgxuI
	5sGBN5rwH/zxnSeQXx/xUOPUReB9iPg+ftiJGCIqGQiKG9AzdHIpnfafDp9lN8rmS4g1
	Oqb2bus2NaiBENe1yXrNOZEj84EoQJyNxHLUk1uKhKk6utSMQH9vcOSEhWSxcUIhspQi
	wqt1DfHCBVvAQIU8fTCf8TXQw9zs/z/I2+MU58bng/ePOUg6GcDyFfPWYVIOS2LY/S0Z
	5AgODL8RIFBPAiVMcw5XCl8qD325es7YAxHTfdcKgquy3hbLc/z8al6X/whcNrEPrbHm
	47RA==
X-Gm-Message-State: AOUpUlGkR3jFZMfr2kDbbH/h8wcRCt3uVTJTTz8OUOWvMq5C2wscJfDM
	sj8gM9X4DFmSRp/waiebV90/ghHB67t3oYuWFAFo1g==
X-Received: by 2002:aca:c351:: with SMTP id
	t78-v6mr29788097oif.338.1534432984078; 
	Thu, 16 Aug 2018 08:23:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 08:22:43
	-0700 (PDT)
In-Reply-To: <20180811090836.4024-8-contrib@steffen-goertz.de>
References: <20180811090836.4024-1-contrib@steffen-goertz.de>
	<20180811090836.4024-8-contrib@steffen-goertz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 16:22:43 +0100
Message-ID: <CAFEAcA-ntqANcVzUTJa0BC7C9e2+CaJVvCD+eyH03W_5D+UEVQ@mail.gmail.com>
To: =?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-devel] [PATCH 7/7] arm: Instantiate Microbit board-level
 devices
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
Cc: Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ejKmALrPbyYd

On 11 August 2018 at 10:08, Steffen G=C3=B6rtz <contrib@steffen-goertz.de> =
wrote:
> Instantiate the LED matrix and set board-level
> pull-up default values to buttons A and B.
> This is necessary to calm down the microsoft pxt
> javascript runtime available for the micro:bit.
>
> Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>

> +static void microbit_reset(void)
> +{
> +    MachineState *machine =3D MACHINE(qdev_get_machine());
> +    MicrobitMachineState *s =3D MICROBIT_MACHINE(machine);
> +
> +    qemu_devices_reset();
> +
> +    /* Board level pull-up */
> +    if (!qtest_enabled()) {
> +        qemu_set_irq(qdev_get_gpio_in(DEVICE(&s->nrf51), BUTTON_A_PIN), =
1);
> +        qemu_set_irq(qdev_get_gpio_in(DEVICE(&s->nrf51), BUTTON_B_PIN), =
1);
> +    }

Reset functions should not call qemu_set_irq().

The problem is that there's no ordering on device reset functions,
so there's no guarantee that the reset function on this end is
called after the reset function for the device it's trying to set
the input GPIO line for. If the two resets happen in the other order
then the device will forget that the input line was high.

There is no good way to handle a line that is supposed to be
pulled high on reset, I'm afraid. You just have to try to avoid
modelling things in a way that requires it.

(Yes, our modelling of reset is basically broken. It's a
hard design problem that nobody's found the time to tackle
properly. You'll see various more-or-less dubious workarounds
if you dig in the right parts of the code base...)

> +}
> +
>
>  static void microbit_machine_init(MachineClass *mc)
>  {
>      mc->desc =3D "BBC micro:bit";
>      mc->init =3D microbit_init;
>      mc->max_cpus =3D 1;
> +    mc->reset =3D microbit_reset;
>  }
>
>  static void microbit_machine_init_class_init(ObjectClass *oc, void *data=
)
> diff --git a/include/hw/arm/microbit.h b/include/hw/arm/microbit.h
> index 89f0c6bc07..094326b4ae 100644
> --- a/include/hw/arm/microbit.h
> +++ b/include/hw/arm/microbit.h
> @@ -24,6 +24,7 @@ typedef struct MicrobitMachineState {
>      MachineState parent_obj;
>
>      NRF51State nrf51;
> +    LEDMatrixState matrix;
>  } MicrobitMachineState;

thanks
-- PMM

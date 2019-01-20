Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5079211wrt;
        Sun, 20 Jan 2019 06:11:22 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6H1avfAQs9Dfq6B+qfLjM7KjcUYBrGYoZxjZQQCuTpq/uO4B6yb7aWZKUG23CcYsxR1tgA
X-Received: by 2002:a5d:6710:: with SMTP id o16mr24845310wru.152.1547993482541;
        Sun, 20 Jan 2019 06:11:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547993482; cv=none;
        d=google.com; s=arc-20160816;
        b=N5YO+1eA4r8n3c2eW7Uokpdi+w3Q9GRhK2LorDttriqzuDWDw7PLPHtAAwLROeVP56
         76DLUcrQ0syY+er5MJ3jUXhiGP2lCtygPMEBMiXR7JqZ2+jnqtpExJGNyhl1ZeXLWbIK
         Cd73CzxX7B8tFF0kf2Ml+nqRIi8fVbgHXPduLwiDycsqbz+hV5dNPEFHftFYpzCOMw9i
         tNF0bNeYDZAO+V2HbYDzlJjl+zabOqyP/5rmGfKFlKZL+gqBUQ5sh0tf9rstDePVl9uM
         JzS3yfZ+ftxgh7QuV58NRmeRkOx3ina7/v7lAaAza3CaUV8c56f02AXFuor45v7pVySx
         Ve/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=pUGe22p5KCcmeQR78Cz7hW6u3jyLFuvWgU+6E8qjynU=;
        b=SWyy1XKYurMUK9asx9Rrq7UQzrVuCm6rHzc0YYVrpcuTQ08+TsLPYa7KC+0mGS+joD
         Tispc56u4QgWEhpHfVYY03OeQs9VgI3OqX+drlU/R/iZNVD56lD2pIBYXZCZQY/8+HzC
         Cs9oFKFLotjZcm5Ryfp0tg1BSoBi8mMQZW75kCTA7mrjtx/U6j21FrWgZUc2vYb7yDg3
         q9RtArbwuY1NBTbCsy1f7J+Q1TK7PgD4gf4Z1dy7/MsDqNfOV5l3k3M792NGojysE27C
         cSRbamH+mjxQs2AgHeqcoqqkMpWM6qfc5qfTdZ70fugCKQ2T+l5lC6PIMJU0mPObtJKA
         vUGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=d1CibjE6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n1si63885513wrm.139.2019.01.20.06.11.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 20 Jan 2019 06:11:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=d1CibjE6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:40338 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glDon-00052Z-Jg
	for alex.bennee@linaro.org; Sun, 20 Jan 2019 09:11:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1glDoe-00051V-6n
	for qemu-arm@nongnu.org; Sun, 20 Jan 2019 09:11:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1glDod-000558-Bk
	for qemu-arm@nongnu.org; Sun, 20 Jan 2019 09:11:12 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:33269)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1glDob-00052s-61; Sun, 20 Jan 2019 09:11:09 -0500
Received: by mail-wm1-x343.google.com with SMTP id r24so4295839wmh.0;
	Sun, 20 Jan 2019 06:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=pUGe22p5KCcmeQR78Cz7hW6u3jyLFuvWgU+6E8qjynU=;
	b=d1CibjE6xySVDkkObnnK0XsaBfi5IJmUtY150NtGvr+tySHjeQD7hjnx7SX0RMM3kJ
	ApKC3at4sqSKByvut8aTrSUUgXlDji+L+VyIfCHYYOnx3DZ3X77SBgbpc8z8fwN7JCtm
	P+ttKu749C7waEpAhCtU2jP45PEWLhuwYT4bU9AcvyckPwlZ9Gsq8fYYo5Pu+OPUBBWr
	W53co7aJdgHC1+eY+ugU/82S8FlEWc5aDRbMBiGu/k6RbKIVsRs+DC0aJOC+yukswqF+
	leA2rMwy2KbhIJ5ZveKlG+9gF8v67dluVPERWa7TKwwNnphc6ZMDgzBh5c081Ukozi47
	HdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=pUGe22p5KCcmeQR78Cz7hW6u3jyLFuvWgU+6E8qjynU=;
	b=bVwZZ75x27vG0veCmLOHzzzf8Lap/JYGw5OcUdjNf11IAiGz97KMaxr9BDuIxGbQv2
	GtbC58+ig94fCM8ZyQcnOJ7NpmlroUqMey6FJXu+cRdL6YgWaWJDdLEl3gZYwwKsMPBv
	3qrJQ3bbooGZoEC0GUx1oVa+/ZkfwZiIhZbg+HOSL2R+KvwkpWWv0LcRLuRR7AHnDq3r
	FO/E7Va5seluZ/y7gedBembLQXE+PuN+gKupk9kIcQjAkKyFBAxQ0VJ6CY8pdZ8+9Py4
	JLvH6VTMeAf1KYAZOAHZcOxftDp8sWIwGd7XChiliyab/V+tgVHdJ6XqYqeDF5DuNdSH
	wBfw==
X-Gm-Message-State: AJcUukcgZDCT3HI/3biNo36sqI7FXxZMiz9+SXr6VChoPUOSYVCKvED4
	qvp80Bgawqz+TL3RPrLf7tpmIEqGlVV4xM2mfz0=
X-Received: by 2002:a1c:ca15:: with SMTP id a21mr20423299wmg.132.1547993467101;
	Sun, 20 Jan 2019 06:11:07 -0800 (PST)
MIME-Version: 1.0
References: <20190110094020.18354-1-stefanha@redhat.com>
	<20190110094020.18354-2-stefanha@redhat.com>
	<CAFEAcA9aypaAyroky0xpFzTUWp4PksqW17O8gkub2rLkS8o=ZQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9aypaAyroky0xpFzTUWp4PksqW17O8gkub2rLkS8o=ZQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sun, 20 Jan 2019 14:10:55 +0000
Message-ID: <CAJSP0QXytC=y-rjuRahU0Whgm2x1mvRcvTZS7=yKHCVrMUSNNg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/2] arm: Stub out NRF51 TWI
 magnetometer/accelerometer detection
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
Cc: Laurent Vivier <lvivier@redhat.com>, Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ppGEhUrBquMO

On Fri, Jan 18, 2019 at 1:59 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Thu, 10 Jan 2019 at 09:40, Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
> >
> > From: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
> >
> > Recent microbit firmwares panic if the TWI magnetometer/accelerometer
> > devices are not detected during startup.  We don't implement TWI (I2C)
> > so let's stub out these devices just to let the firmware boot.
> >
>
> > --- a/hw/arm/microbit.c
> > +++ b/hw/arm/microbit.c
> > @@ -16,11 +16,13 @@
> >  #include "exec/address-spaces.h"
> >
> >  #include "hw/arm/nrf51_soc.h"
> > +#include "hw/i2c/microbit_i2c.h"
> >
> >  typedef struct {
> >      MachineState parent;
> >
> >      NRF51State nrf51;
> > +    MicrobitI2CState i2c;
> >  } MicrobitMachineState;
> >
> >  #define TYPE_MICROBIT_MACHINE MACHINE_TYPE_NAME("microbit")
> > @@ -32,7 +34,9 @@ static void microbit_init(MachineState *machine)
> >  {
> >      MicrobitMachineState *s =3D MICROBIT_MACHINE(machine);
> >      MemoryRegion *system_memory =3D get_system_memory();
> > +    MemoryRegion *mr;
> >      Object *soc =3D OBJECT(&s->nrf51);
> > +    Object *i2c =3D OBJECT(&s->i2c);
> >
> >      sysbus_init_child_obj(OBJECT(machine), "nrf51", soc, sizeof(s->nrf=
51),
> >                            TYPE_NRF51_SOC);
> > @@ -41,6 +45,17 @@ static void microbit_init(MachineState *machine)
> >                               &error_fatal);
> >      object_property_set_bool(soc, true, "realized", &error_fatal);
> >
> > +    /* Overlap the TWI stub device into the SoC.  This is a microbit-s=
pecific
> > +     * hack until we implement the nRF51 TWI controller properly and t=
he
> > +     * magnetometer/accelerometer devices.
> > +     */
> > +    sysbus_init_child_obj(OBJECT(machine), "microbit.twi", i2c,
> > +                          sizeof(s->i2c), TYPE_MICROBIT_I2C);
> > +    object_property_set_bool(i2c, true, "realized", &error_fatal);
> > +    mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(i2c), 0);
> > +    memory_region_add_subregion_overlap(&s->nrf51.container, NRF51_TWI=
_BASE,
> > +                                        mr, -1);
>
> This is an SoC device, right? Why are we creating it here
> in the board code rather than in the SoC object's code ?

Yes, this is a microbit-specific hack.  We don't implement a full
TWI/I2C bus for the nRF51 SoC.  This implementation is just aimed at
stubbing out the microbit-specific accelerometer/magnetometer devices.

Therefore I decided it was cleanest to place it in the microbit
machine type instead of dirtying the nRF51 SoC with a microbit hack.

If the I2C passthrough GSoC 2019 project happens we'll get proper
nRF51 TWI/I2C controller emulation and can eliminate this stub.  But
for now this allows the microbit to boot and doesn't mess up any other
potential machine types that will use the nRF51 SoC.

Stefan

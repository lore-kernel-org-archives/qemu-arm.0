Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3065871wrt;
        Fri, 18 Jan 2019 05:59:04 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5rWPPNcCorzPyX9Yy6b8r0HqK1Es9mgQ3k8vnLmXYh53VZvwX8aj9EdvAlyFcG74qJt73E
X-Received: by 2002:a1c:b70a:: with SMTP id h10mr15183790wmf.125.1547819944416;
        Fri, 18 Jan 2019 05:59:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547819944; cv=none;
        d=google.com; s=arc-20160816;
        b=pyTkV+CcXi2A2QBLVauso7JiWwyNS308SuVhdQpKeG8zS2zc17vgf1I2PA6RMSZm0r
         isH3DOcYQVb+zFX944n4pICd/GaPUihVslYpPhgskkJZU/IByWhlXHgEcNE81uBBDXKE
         wKsVnanmJD66u2ADCNmoSRGTkHcjhxLCJT8Pf2tcDAAJ+/ebNnIrE1lFtpKav/g9Sfoi
         M87JTkqmCn/Qw+zVRnKCprpbstiFPt5uhWL9k9YEICRQbTdY6RGkOpTlPelmFGVgMecd
         L13b6GmhGYWajkylgBZPV5IhhF9yYlsujhLeaW21c7MD5hpm180FV7gCn5yYs+ceWDza
         i6+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=y2ChHszIftlqIgvMXSJvncfw4s0xR/4ORvNacqX4WRc=;
        b=FoJPvQkN2EWGmYqUu0sSlT2e6qk48RN4BMXwq+yHPxWq+R9ALDy1cUFDDcgXG33LAc
         L982DRXhaIzvtFARrGH0AqR2o/rLthbrODoDi6qABUez9YsJcx/tCFeH8eqfdKto5Jrs
         RwyyldvXCatPm3exizU7fXzeTZCBD62sUESBcZw3+nLqAV8rqv/Zg2V759yU4qv6IqnT
         hNw6dy1Qxs+F4Ahxhgavp1rcZBXdBt4p5tnUkkulmGGrK9aMnvYEjo2ZPSqdUe0GkKdF
         H6bFWqhoDhGGVyYe/NM/MQHdmVaOkL/k4aoCau1u926QcZ43p7XobM25hpfui3bUX8Ak
         SY8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HTD5u7Gx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x5si27625927wmb.49.2019.01.18.05.59.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 18 Jan 2019 05:59:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HTD5u7Gx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:39854 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gkUfn-0007tL-Ej
	for alex.bennee@linaro.org; Fri, 18 Jan 2019 08:59:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gkUek-0007NZ-NC
	for qemu-devel@nongnu.org; Fri, 18 Jan 2019 08:57:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gkUej-0000IQ-R9
	for qemu-devel@nongnu.org; Fri, 18 Jan 2019 08:57:58 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:37587)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gkUej-0000Gn-Ex
	for qemu-devel@nongnu.org; Fri, 18 Jan 2019 08:57:57 -0500
Received: by mail-oi1-x243.google.com with SMTP id y23so9015801oia.4
	for <qemu-devel@nongnu.org>; Fri, 18 Jan 2019 05:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=y2ChHszIftlqIgvMXSJvncfw4s0xR/4ORvNacqX4WRc=;
	b=HTD5u7Gx3Xx9OdRdDe6/tulKYg6S+CLelvJmVpBSIarp5Rahjn69EX5Eh/lFXybUIN
	HHGY374zVVXCBzYqNiILo+zpM3+uXI4JXqSPpPGyPgY/zHUq1kCQJ3yGKlsBn6JJ06ZI
	UQDmPAoVoqWcAqcndWiDY5PuADyuNzgBjhj94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=y2ChHszIftlqIgvMXSJvncfw4s0xR/4ORvNacqX4WRc=;
	b=MRm54T3okWj/jdGOHfjMCXmW5zMZI+YlADNc5/bgVCGuoyvxACEemaZgvevKuIGsYk
	Q8EH46JpHZDCEO8Bsyf43B01b7o9JanrEEydkJGx7nQZWLTFlkLwZBuU7i6g9VCuQEQk
	WUy42+v6Q7y7/gqu4cMtguK3jpSUEYRY7Tpf4amMfLf83WgS9Nx38YJPGZssAEcZ5RP+
	4TiJ+lI5Qxp+oGoDCXmwVyWOiC4vOVFkbVerbdO8U8+zg1xqB5Bzv2hflBM4hKUQCKXv
	o6qUkEZBRmYyy8AoRSqecRXPSZGyKv+bkrNy5SZ8LvjihwEzBHRqT9kysBepcRxgW1gf
	ClPQ==
X-Gm-Message-State: AJcUukfCap93Y2vXlIeW2iia3f2XgV/CZ+vAdAe1POaKVZtX6HBcP8Ek
	ItP/1Y27zjqgTIz9++lLcdscFoqQkB7BXZfAqqHvjw==
X-Received: by 2002:aca:b58b:: with SMTP id e133mr152473oif.25.1547819876671; 
	Fri, 18 Jan 2019 05:57:56 -0800 (PST)
MIME-Version: 1.0
References: <20190110094020.18354-1-stefanha@redhat.com>
	<20190110094020.18354-2-stefanha@redhat.com>
In-Reply-To: <20190110094020.18354-2-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Jan 2019 13:57:44 +0000
Message-ID: <CAFEAcA9aypaAyroky0xpFzTUWp4PksqW17O8gkub2rLkS8o=ZQ@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [PATCH v2 1/2] arm: Stub out NRF51 TWI
 magnetometer/accelerometer detection
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
Cc: Laurent Vivier <lvivier@redhat.com>, Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5BjmAihCFWd2

On Thu, 10 Jan 2019 at 09:40, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> From: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
>
> Recent microbit firmwares panic if the TWI magnetometer/accelerometer
> devices are not detected during startup.  We don't implement TWI (I2C)
> so let's stub out these devices just to let the firmware boot.
>

> --- a/hw/arm/microbit.c
> +++ b/hw/arm/microbit.c
> @@ -16,11 +16,13 @@
>  #include "exec/address-spaces.h"
>
>  #include "hw/arm/nrf51_soc.h"
> +#include "hw/i2c/microbit_i2c.h"
>
>  typedef struct {
>      MachineState parent;
>
>      NRF51State nrf51;
> +    MicrobitI2CState i2c;
>  } MicrobitMachineState;
>
>  #define TYPE_MICROBIT_MACHINE MACHINE_TYPE_NAME("microbit")
> @@ -32,7 +34,9 @@ static void microbit_init(MachineState *machine)
>  {
>      MicrobitMachineState *s =3D MICROBIT_MACHINE(machine);
>      MemoryRegion *system_memory =3D get_system_memory();
> +    MemoryRegion *mr;
>      Object *soc =3D OBJECT(&s->nrf51);
> +    Object *i2c =3D OBJECT(&s->i2c);
>
>      sysbus_init_child_obj(OBJECT(machine), "nrf51", soc, sizeof(s->nrf51=
),
>                            TYPE_NRF51_SOC);
> @@ -41,6 +45,17 @@ static void microbit_init(MachineState *machine)
>                               &error_fatal);
>      object_property_set_bool(soc, true, "realized", &error_fatal);
>
> +    /* Overlap the TWI stub device into the SoC.  This is a microbit-spe=
cific
> +     * hack until we implement the nRF51 TWI controller properly and the
> +     * magnetometer/accelerometer devices.
> +     */
> +    sysbus_init_child_obj(OBJECT(machine), "microbit.twi", i2c,
> +                          sizeof(s->i2c), TYPE_MICROBIT_I2C);
> +    object_property_set_bool(i2c, true, "realized", &error_fatal);
> +    mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(i2c), 0);
> +    memory_region_add_subregion_overlap(&s->nrf51.container, NRF51_TWI_B=
ASE,
> +                                        mr, -1);

This is an SoC device, right? Why are we creating it here
in the board code rather than in the SoC object's code ?

thanks
-- PMM

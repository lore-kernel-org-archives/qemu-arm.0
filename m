Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1916380wru;
        Thu, 16 Aug 2018 07:25:32 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzfy0kNPoD1geYvvzAP0PIbYnGqjEMf3V612DMfeY0iXNNJEjHx0Yudp66te8/88jf8tQ33
X-Received: by 2002:a37:8b06:: with SMTP id n6-v6mr28676758qkd.166.1534429532525;
        Thu, 16 Aug 2018 07:25:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534429532; cv=none;
        d=google.com; s=arc-20160816;
        b=A7Trof2MIXuDaMl3jOmvClU2/Vy4wLvGbmUoWDf56Lg668bGNB7CDVZjf15idsUrky
         ZFLwSVxts2m0UCgsYEXxd448JJpxXrTg2SrR86kDl1AntWJbDz7fS/NPgSUrwPg+HY7+
         mdgCtGQPU2ScUejE381OLMmvkAWLLSdubtOQ+01HzN9clHY7c6f3HVpEuQ+AnC0xUPES
         bz4st0LbLlTMJEqzbxYO8FUrp4s3Qubu05MIT0mIUJBUYXPHA8UkybJieWIrcqY8fgL7
         ZA9V5S7L4nHCB4ZZIBy4RnywJWadId3595vKhAJSxpRy8CehpDbpZnShbZsFgGFosgX/
         JPNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=GdncMo/BmGO4S4VdAGQZ6kFxigbJ2gZnuxf/xMOVgLk=;
        b=TkvdHHWM6VXZOi6S3H/pWeOip773mV6iIR52+0YPsvhTf+SSZQc+yYnehkpDfcZjNF
         Uo6xhGNBgf/YGmI0fxaChwJxPetqoQ+YBhto5R4tc/Drw6r9unYfb+E4SGuFXGx5EvYE
         9hCK0dUuMEqPgaAGwxuD00+7EkVBYeFXLyA04+anHPqRnX5e2Ry6R0QCUMf/bv1ZZT0E
         yyzFfTNX+Cjt2xa++PV4jFm7v210A4NWkBeW38Ra2H6y27riNYwRs1PqMSZJBXVL0GTk
         PW1+9T98LstR9Es2hC9qxu5wwvEOt+i+rb+8N7umLF38nvmULXjkvDPvd/0mgd+8sNno
         LdbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dQnQaozR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l190-v6si3140218qkf.218.2018.08.16.07.25.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 07:25:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dQnQaozR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56025 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqJDQ-0002h7-0y
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 10:25:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42048)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqJ0g-0005X7-41
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 10:12:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqJ0f-0003CN-3J
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 10:12:22 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:45301)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqJ0e-0003Ap-QQ
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 10:12:20 -0400
Received: by mail-oi0-x241.google.com with SMTP id q11-v6so8213506oic.12
	for <qemu-arm@nongnu.org>; Thu, 16 Aug 2018 07:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GdncMo/BmGO4S4VdAGQZ6kFxigbJ2gZnuxf/xMOVgLk=;
	b=dQnQaozRoVmOiKjBwhNM8KkMQ08qkSvpUSPkn1jyU87AJ//BPY9O7HElZ3lw9hO/WS
	bfmgxltDr3REBR6b+RW2C12tOZPQNtD7cYG4Aryd0NJQ6HNE8OKhyYd0/6bezF9xFOKA
	wpN4lRfXorZr2JQ90VsEFOAE3cPxtidFV+8gQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GdncMo/BmGO4S4VdAGQZ6kFxigbJ2gZnuxf/xMOVgLk=;
	b=GgcHHehoEsMB+QA2hSb5iq0Xc6sKfVlWCMvihoQiHis4+wV5UJu2tcuqCAwORhz91N
	gbjDAWYc7crlvZiyprrATccIYaD0i/7/i4YmJCB6eK1J4641Q7VnfgFF/eiggAiKTwhl
	FX8733RyQ9GncnuH4QDVK+dZX0JuSVhKG9YOmBR77VKCj7rmkOj4XfKSZ39u2J4/pFUR
	FD90se805drQA0FSvVeqhHr8g9KEjXSSei/sx4OPXv8clGK2oK/s2GF6MjRse1RmIWQJ
	VQmYpsvA/XM+dDVrrFiL3RmP5R689oRqaIxNEnfV43gGPJpAt+dicQfN2h7lEED2AvHl
	tBVA==
X-Gm-Message-State: AOUpUlG1IdpZMUiVItLQkpbmND9ckGLA02Sr0LBqeSVpsli2SSCC1IVL
	PtE9wCHscmUNvauSeuEWITtC34geHlWN+cs6cKdbQg==
X-Received: by 2002:aca:b9c2:: with SMTP id
	j185-v6mr29884395oif.212.1534428740096; 
	Thu, 16 Aug 2018 07:12:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 07:11:59
	-0700 (PDT)
In-Reply-To: <20180803052137.10602-4-joel@jms.id.au>
References: <20180803052137.10602-1-joel@jms.id.au>
	<20180803052137.10602-4-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 15:11:59 +0100
Message-ID: <CAFEAcA9o8JE-ZE3SLBTFrrNCgtJ85L6T7opPZnd0pJaZVkRdVA@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v4 3/3] arm: Add BBC micro:bit machine
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Jim Mussared <jim.mussared@gmail.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YuUr9L4mE/7D

On 3 August 2018 at 06:21, Joel Stanley <joel@jms.id.au> wrote:
> This adds the base for a machine model of the BBC micro:bit:
>
>   https://en.wikipedia.org/wiki/Micro_Bit
>
> This is a system with a nRF51 SoC containing the main processor, with
> various peripherals on board.
>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v2:
>  - Instead of setting kernel filename property, load the image directly
>  - Add link to hardware overview website
> v3:
>  - Rebase microbit on m0 changes
>  - Remove hard-coded flash size and retrieve from the soc
>  - Add Stefan's reviewed-by
> ---
>  hw/arm/Makefile.objs |  2 +-
>  hw/arm/microbit.c    | 54 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 55 insertions(+), 1 deletion(-)
>  create mode 100644 hw/arm/microbit.c
>
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index e31875ec69bc..2798a257921d 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -36,4 +36,4 @@ obj-$(CONFIG_MSF2) += msf2-soc.o msf2-som.o
>  obj-$(CONFIG_IOTKIT) += iotkit.o
>  obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o mcimx7d-sabre.o
>  obj-$(CONFIG_ARM_SMMUV3) += smmu-common.o smmuv3.o
> -obj-$(CONFIG_NRF51_SOC) += nrf51_soc.o
> +obj-$(CONFIG_NRF51_SOC) += nrf51_soc.o microbit.o
> diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
> new file mode 100644
> index 000000000000..ecf64e883f4f
> --- /dev/null
> +++ b/hw/arm/microbit.c
> @@ -0,0 +1,54 @@
> +/*
> + * BBC micro:bit machine
> + * http://tech.microbit.org/hardware/
> + *
> + * Copyright 2018 Joel Stanley <joel@jms.id.au>
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/boards.h"
> +#include "hw/arm/arm.h"
> +#include "exec/address-spaces.h"
> +
> +#include "hw/arm/nrf51_soc.h"
> +
> +typedef struct {
> +    MachineState parent;
> +
> +    NRF51State nrf51;
> +} MICROBITMachineState;

Can we call this "MicrobitMachineState", please? I don't
think the board name is all-caps, and our convention
for struct type names is CamelCase.

> +
> +#define TYPE_MICROBIT_MACHINE "microbit"

Should be MACHINE_TYPE_NAME("microbit")

> +
> +#define MICROBIT_MACHINE(obj) \
> +    OBJECT_CHECK(MICROBITMachineState, obj, TYPE_MICROBIT_MACHINE)
> +
> +static void microbit_init(MachineState *machine)
> +{
> +    MICROBITMachineState *s = g_new(MICROBITMachineState, 1);

This is odd. The MICROBITMachineState is the state struct
for your subclass of MachineState, and that object has
already been allocated (you get a pointer to it as the
argument to the init function here). So all you need to do
is cast it to the right type:
      MICROBITMachineState *s = MICROBIT_MACHINE(machine);

You don't need to allocate a second copy. (You do need to
get the type registration right so that you declare that the
type is of size sizeof(MICROBITMachineState) rather than
just sizeof(MachineState), though -- see below.)

> +    MemoryRegion *system_memory = get_system_memory();
> +    Object *soc;
> +
> +    object_initialize(&s->nrf51, sizeof(s->nrf51), TYPE_NRF51_SOC);
> +    soc = OBJECT(&s->nrf51);
> +    object_property_add_child(OBJECT(machine), "nrf51", soc, &error_fatal);

You should use the new function init_sysbus_child() here
rather than doing separate initialize and add_child steps
(we realised late in the 3.0 cycle that we had refcount
leaks as a result of doing this as a 2-step process, hence
the new function).

> +    object_property_set_link(soc, OBJECT(system_memory),
> +                             "memory", &error_abort);
> +
> +    object_property_set_bool(soc, true, "realized", &error_abort);

Better to use error_fatal rather than error_abort in these two calls,
I think.

> +
> +    arm_m_profile_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> +            NRF51_SOC(soc)->flash_size);
> +}
> +
> +static void microbit_machine_init(MachineClass *mc)
> +{
> +    mc->desc = "BBC micro:bit";
> +    mc->init = microbit_init;
> +    mc->max_cpus = 1;
> +}
> +DEFINE_MACHINE("microbit", microbit_machine_init);

Your subclass of TYPE_MACHINE has extra state, so it can't
use DEFINE_MACHINE (which creates a subclass whose instance_size
is the same as the parent TYPE_MACHINE). You need to do this
longhand:

static void machine_class_init(ObjectClass *oc, void *data)
{
    MachineClass *mc = MACHINE_CLASS(oc);

    mc->desc = "BBC micro:bit";
    mc->init = microbit_init;
    mc->max_cpus = 1;
}

static const TypeInfo microbit_info = {
    .name = TYPE_MICROBIT_MACHINE,
    .parent = TYPE_MACHINE,
    .instance_size = sizeof(MICROBITMachineState),
    .class_init = microbit_class_init,
};

static void microbit_machine_init(void)
{
    type_register_static(&microbit_info);
}

type_init(microbit_machine_init);


(code untested but should be correct; compare against other boards.)

thanks
-- PMM

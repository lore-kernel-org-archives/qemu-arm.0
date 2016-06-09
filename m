Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id c142sm3429584wme.18.2016.06.09.09.06.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jun 2016 09:06:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 7D47F3E0200;
	Thu,  9 Jun 2016 17:06:43 +0100 (BST)
User-agent: mu4e 0.9.17; emacs 25.0.94.5
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, wei@redhat.com, peter.maydell@linaro.org
Subject: Re: [Qemu-devel] [PATCH 5/5] hw/arm/virt: create the 2.7 machine type
In-reply-to: <1465410291-2971-6-git-send-email-drjones@redhat.com>
Date: Thu, 09 Jun 2016 17:06:43 +0100
Message-ID: <8737omgxd8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: kjuGyA+NPnlH


Andrew Jones <drjones@redhat.com> writes:

> Signed-off-by: Andrew Jones <drjones@redhat.com>


I'm confused. These steps have introduced a bunch of boiler plate to set
the default virt machine type so we can introduce 2.7 which is an alias
of the existing 2.6? Wouldn't this be better of waiting until there is a
concrete difference or have I missed something subtle here?

> ---
>  hw/arm/virt.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 017c244a46f41..323ffd4689641 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -42,6 +42,7 @@
>  #include "sysemu/sysemu.h"
>  #include "sysemu/kvm.h"
>  #include "hw/boards.h"
> +#include "hw/compat.h"
>  #include "hw/loader.h"
>  #include "exec/address-spaces.h"
>  #include "qemu/bitops.h"
> @@ -1423,7 +1424,7 @@ static void machvirt_machine_init(void)
>  }
>  type_init(machvirt_machine_init);
>
> -static void virt_2_6_instance_init(Object *obj)
> +static void virt_2_7_instance_init(Object *obj)
>  {
>      VirtMachineState *vms = VIRT_MACHINE(obj);
>
> @@ -1456,7 +1457,22 @@ static void virt_2_6_instance_init(Object *obj)
>                                      "Valid values are 2, 3 and host", NULL);
>  }
>
> +static void virt_machine_2_7_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(2, 7)
> +
> +#define VIRT_COMPAT_2_6 \
> +    HW_COMPAT_2_6
> +
> +static void virt_2_6_instance_init(Object *obj)
> +{
> +    virt_2_7_instance_init(obj);
> +}
> +
>  static void virt_machine_2_6_options(MachineClass *mc)
>  {
> +    virt_machine_2_7_options(mc);
> +    SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_6);
>  }
> -DEFINE_VIRT_MACHINE_AS_LATEST(2, 6)
> +DEFINE_VIRT_MACHINE(2, 6)


--
Alex Bennée

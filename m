Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id u4sm23341474wjz.4.2015.11.25.06.35.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2015 06:35:10 -0800 (PST)
Received: from zen.linaro.local (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 9D89B3E022A;
	Wed, 25 Nov 2015 14:35:09 +0000 (GMT)
References: <1447946528-1533-1-git-send-email-eric.auger@linaro.org> <1447946528-1533-2-git-send-email-eric.auger@linaro.org>
User-agent: mu4e 0.9.15; emacs 24.5.50.4
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eric Auger <eric.auger@linaro.org>
Cc: eric.auger@st.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.williamson@redhat.com, peter.maydell@linaro.org, thomas.lendacky@amd.com, b.reynal@virtualopensystems.com, patches@linaro.org, suravee.suthikulpanit@amd.com, pbonzini@redhat.com, christoffer.dall@linaro.org
Subject: Re: [Qemu-devel] [RESEND RFC 1/6] hw/vfio/platform: amd-xgbe device
In-reply-to: <1447946528-1533-2-git-send-email-eric.auger@linaro.org>
Date: Wed, 25 Nov 2015 14:35:09 +0000
Message-ID: <87610qywo2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: iz0miUWVVaZb


Eric Auger <eric.auger@linaro.org> writes:

> This patch introduces the amd-xgbe VFIO platform device. It
> allows the guest to do passthrough on a device exposing an
> "amd,xgbe-seattle-v1a" compat string.
>
> Signed-off-by: Eric Auger <eric.auger@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  hw/vfio/Makefile.objs           |  1 +
>  hw/vfio/amd-xgbe.c              | 55 +++++++++++++++++++++++++++++++++++++++++
>  include/hw/vfio/vfio-amd-xgbe.h | 51 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 107 insertions(+)
>  create mode 100644 hw/vfio/amd-xgbe.c
>  create mode 100644 include/hw/vfio/vfio-amd-xgbe.h
>
> diff --git a/hw/vfio/Makefile.objs b/hw/vfio/Makefile.objs
> index d324863..ceddbb8 100644
> --- a/hw/vfio/Makefile.objs
> +++ b/hw/vfio/Makefile.objs
> @@ -3,4 +3,5 @@ obj-$(CONFIG_SOFTMMU) += common.o
>  obj-$(CONFIG_PCI) += pci.o pci-quirks.o
>  obj-$(CONFIG_SOFTMMU) += platform.o
>  obj-$(CONFIG_SOFTMMU) += calxeda-xgmac.o
> +obj-$(CONFIG_SOFTMMU) += amd-xgbe.o
>  endif
> diff --git a/hw/vfio/amd-xgbe.c b/hw/vfio/amd-xgbe.c
> new file mode 100644
> index 0000000..53451eb
> --- /dev/null
> +++ b/hw/vfio/amd-xgbe.c
> @@ -0,0 +1,55 @@
> +/*
> + * AMD XGBE VFIO device
> + *
> + * Copyright Linaro Limited, 2015
> + *
> + * Authors:
> + *  Eric Auger <eric.auger@linaro.org>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "hw/vfio/vfio-amd-xgbe.h"
> +
> +static void amd_xgbe_realize(DeviceState *dev, Error **errp)
> +{
> +    VFIOPlatformDevice *vdev = VFIO_PLATFORM_DEVICE(dev);
> +    VFIOAmdXgbeDeviceClass *k = VFIO_AMD_XGBE_DEVICE_GET_CLASS(dev);
> +
> +    vdev->compat = g_strdup("amd,xgbe-seattle-v1a");
> +
> +    k->parent_realize(dev, errp);
> +}
> +
> +static const VMStateDescription vfio_platform_amd_xgbe_vmstate = {
> +    .name = TYPE_VFIO_AMD_XGBE,
> +    .unmigratable = 1,
> +};
> +
> +static void vfio_amd_xgbe_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    VFIOAmdXgbeDeviceClass *vcxc =
> +        VFIO_AMD_XGBE_DEVICE_CLASS(klass);
> +    vcxc->parent_realize = dc->realize;
> +    dc->realize = amd_xgbe_realize;
> +    dc->desc = "VFIO AMD XGBE";
> +    dc->vmsd = &vfio_platform_amd_xgbe_vmstate;
> +}
> +
> +static const TypeInfo vfio_amd_xgbe_dev_info = {
> +    .name = TYPE_VFIO_AMD_XGBE,
> +    .parent = TYPE_VFIO_PLATFORM,
> +    .instance_size = sizeof(VFIOAmdXgbeDevice),
> +    .class_init = vfio_amd_xgbe_class_init,
> +    .class_size = sizeof(VFIOAmdXgbeDeviceClass),
> +};
> +
> +static void register_amd_xgbe_dev_type(void)
> +{
> +    type_register_static(&vfio_amd_xgbe_dev_info);
> +}
> +
> +type_init(register_amd_xgbe_dev_type)
> diff --git a/include/hw/vfio/vfio-amd-xgbe.h b/include/hw/vfio/vfio-amd-xgbe.h
> new file mode 100644
> index 0000000..9fff65e
> --- /dev/null
> +++ b/include/hw/vfio/vfio-amd-xgbe.h
> @@ -0,0 +1,51 @@
> +/*
> + * VFIO AMD XGBE device
> + *
> + * Copyright Linaro Limited, 2015
> + *
> + * Authors:
> + *  Eric Auger <eric.auger@linaro.org>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + */
> +
> +#ifndef HW_VFIO_VFIO_AMD_XGBE_H
> +#define HW_VFIO_VFIO_AMD_XGBE_H
> +
> +#include "hw/vfio/vfio-platform.h"
> +
> +#define TYPE_VFIO_AMD_XGBE "vfio-amd-xgbe"
> +
> +/**
> + * This device exposes:
> + * - 5 MMIO regions: MAC, PCS, SerDes Rx/Tx regs,
> +     SerDes Integration Registers 1/2 & 2/2
> + * - 2 level sensitive IRQs and optional DMA channel IRQs
> + */
> +struct VFIOAmdXgbeDevice {
> +    VFIOPlatformDevice vdev;
> +};
> +
> +typedef struct VFIOAmdXgbeDevice VFIOAmdXgbeDevice;
> +
> +struct VFIOAmdXgbeDeviceClass {
> +    /*< private >*/
> +    VFIOPlatformDeviceClass parent_class;
> +    /*< public >*/
> +    DeviceRealize parent_realize;
> +};
> +
> +typedef struct VFIOAmdXgbeDeviceClass VFIOAmdXgbeDeviceClass;
> +
> +#define VFIO_AMD_XGBE_DEVICE(obj) \
> +     OBJECT_CHECK(VFIOAmdXgbeDevice, (obj), TYPE_VFIO_AMD_XGBE)
> +#define VFIO_AMD_XGBE_DEVICE_CLASS(klass) \
> +     OBJECT_CLASS_CHECK(VFIOAmdXgbeDeviceClass, (klass), \
> +                        TYPE_VFIO_AMD_XGBE)
> +#define VFIO_AMD_XGBE_DEVICE_GET_CLASS(obj) \
> +     OBJECT_GET_CLASS(VFIOAmdXgbeDeviceClass, (obj), \
> +                      TYPE_VFIO_AMD_XGBE)
> +
> +#endif


--
Alex Bennée

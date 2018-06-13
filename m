Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1123843wrq;
        Wed, 13 Jun 2018 12:51:12 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIVUuL+CrYDVQiV5+zcbpw6DwVMEzrAqg8FJR2qaWZs0zaMWmNFzMaU3Jj97bLyEq73ERp5
X-Received: by 2002:ac8:783:: with SMTP id l3-v6mr5930218qth.381.1528919472548;
        Wed, 13 Jun 2018 12:51:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528919472; cv=none;
        d=google.com; s=arc-20160816;
        b=y6Q/AqrfFt29PNUXhBZu0VREe77Ac5JrtS16/aKxqI2Q71E5BsaBJay+nHQu63S5cU
         RzKcJqO9PoHH7h6Z021RI69OFPz1o2X/8uUCU1nkz/sz40wkaYYGly3crVkfr74UspdQ
         mYFRJ3jVesXh5yW/t5Bta2fH6J/XL7RRk/w6mgIGI22qNNzeXDIpFPiEKfPe+ZuQKHsq
         NQ0Pm9ew02IiLiatvoMNmC/7QTevCTeRNF4rm0HWMZ7foGi4Gapu8RW8o0b0Tw8tC64V
         1jw9jt65PYbAEpnatAvh8hYWcT+zABOu1MPKjyb5+7D9CJywwO8PQ2aPeSfZhUWqCwY4
         X8fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=6Xf5/YvElCVOZB/N3/axepbVF7l5cIxcBk76oQ59HY4=;
        b=cqouC4Yl2159hEmd0GdGsRRDGOi/PowHjl8f6aOAsktBYHf29OoK/wpwzkliO7re1u
         EMAKY850qLg+Lu0ifi3IzVDrY5G8sk1Kn8Ri/r6Cn9LjtE8Nhmb3Xf5M4ReAzcZinawL
         WRkz9NybB3h+CrAZ5b5segxi9S4MDsXMaIFbYn9fzkEo9fDJ7xtxoNhLaKuEjVvdVyJ1
         fP5XN3bt1bBM79XwaAvdeWfZJTGrVrr80hZG238j5hqK0mLfO8Jrz5GTDJwljvdCeg1C
         3Ql5iaPwpDI2uYWRe6EDd3RYkw7CWM79HqudxifETqRs4UPkYv0Lds3EZZAHQcF+OGCl
         VApg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p2-v6si923965qvj.20.2018.06.13.12.51.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jun 2018 12:51:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36628 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTBnU-0006Uh-1k
	for alex.bennee@linaro.org; Wed, 13 Jun 2018 15:51:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1fTBnM-0006UY-RH
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 15:51:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1fTBnJ-00042n-MB
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 15:51:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34538)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
	id 1fTBnJ-00040v-Dj; Wed, 13 Jun 2018 15:51:01 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B83ACC057F9F;
	Wed, 13 Jun 2018 19:50:59 +0000 (UTC)
Received: from w520.home (ovpn-116-135.phx2.redhat.com [10.3.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6E5C4500DF;
	Wed, 13 Jun 2018 19:50:47 +0000 (UTC)
Date: Wed, 13 Jun 2018 13:50:47 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20180613135047.5c1ce227@w520.home>
In-Reply-To: <20180613084149.14523-4-kraxel@redhat.com>
References: <20180613084149.14523-1-kraxel@redhat.com>
	<20180613084149.14523-4-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 13 Jun 2018 19:50:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v4 3/3] hw/vfio/display: add ramfb support
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Erik Skultety <eskultet@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Laine Stump <laine@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?B?TMOhc3psw7Mgw4lyc2Vr?= <lersek@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mZr9EDWqGBmf

On Wed, 13 Jun 2018 10:41:49 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> So we have a boot display when using a vgpu as primary display.
> 
> Use vfio-pci-ramfb instead of vfio-pci to enable it.

Using a different device here seems like it almost guarantees a very
complicated path to support under libvirt.  What necessitates this
versus a simple ramfb=on option to vfio-pci?

I'm also not sure I understand the usage model, SeaBIOS and OVMF know
how to write to this display, but it seems that the guest does not.  I
suppose in the UEFI case runtime services can be used to continue
writing this display, but BIOS doesn't have such an option, unless
we're somehow emulating VGA here.  So for UEFI, I can imagine this
covers us from power on through firmware boot and up to guest drivers
initializing the GPU (assuming the vGPU supports a kernel mode driver,
does NVIDIA?), but for BIOS it seems we likely still have a break from
the bootloader to GPU driver initialization. For instance, what driver
is used to draw the boot animation (or blue screen) on SeaBIOS Windows
VM?  I'm assuming that this display and the vGPU display are one in the
same, so there's some cut from one to the other.  Thanks,

Alex

> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/hw/vfio/vfio-common.h |  2 ++
>  hw/vfio/display.c             | 10 ++++++++++
>  hw/vfio/pci.c                 | 15 +++++++++++++++
>  3 files changed, 27 insertions(+)
> 
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index a9036929b2..a58d7e7e77 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -26,6 +26,7 @@
>  #include "qemu/queue.h"
>  #include "qemu/notify.h"
>  #include "ui/console.h"
> +#include "hw/display/ramfb.h"
>  #ifdef CONFIG_LINUX
>  #include <linux/vfio.h>
>  #endif
> @@ -143,6 +144,7 @@ typedef struct VFIODMABuf {
>  
>  typedef struct VFIODisplay {
>      QemuConsole *con;
> +    RAMFBState *ramfb;
>      struct {
>          VFIORegion buffer;
>          DisplaySurface *surface;
> diff --git a/hw/vfio/display.c b/hw/vfio/display.c
> index 59c0e5d1d7..409d5a2e3a 100644
> --- a/hw/vfio/display.c
> +++ b/hw/vfio/display.c
> @@ -124,6 +124,9 @@ static void vfio_display_dmabuf_update(void *opaque)
>  
>      primary = vfio_display_get_dmabuf(vdev, DRM_PLANE_TYPE_PRIMARY);
>      if (primary == NULL) {
> +        if (dpy->ramfb) {
> +            ramfb_display_update(dpy->con, dpy->ramfb);
> +        }
>          return;
>      }
>  
> @@ -181,6 +184,8 @@ static int vfio_display_dmabuf_init(VFIOPCIDevice *vdev, Error **errp)
>      vdev->dpy->con = graphic_console_init(DEVICE(vdev), 0,
>                                            &vfio_display_dmabuf_ops,
>                                            vdev);
> +    if (strcmp(object_get_typename(OBJECT(vdev)), "vfio-pci-ramfb") == 0)
> +        vdev->dpy->ramfb = ramfb_setup(errp);
>      return 0;
>  }
>  
> @@ -228,6 +233,9 @@ static void vfio_display_region_update(void *opaque)
>          return;
>      }
>      if (!plane.drm_format || !plane.size) {
> +        if (dpy->ramfb) {
> +            ramfb_display_update(dpy->con, dpy->ramfb);
> +        }
>          return;
>      }
>      format = qemu_drm_format_to_pixman(plane.drm_format);
> @@ -300,6 +308,8 @@ static int vfio_display_region_init(VFIOPCIDevice *vdev, Error **errp)
>      vdev->dpy->con = graphic_console_init(DEVICE(vdev), 0,
>                                            &vfio_display_region_ops,
>                                            vdev);
> +    if (strcmp(object_get_typename(OBJECT(vdev)), "vfio-pci-ramfb") == 0)
> +        vdev->dpy->ramfb = ramfb_setup(errp);
>      return 0;
>  }
>  
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 18c493b49e..6a2b42a595 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3234,9 +3234,24 @@ static const TypeInfo vfio_pci_dev_info = {
>      },
>  };
>  
> +static void vfio_pci_ramfb_dev_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->hotpluggable = false;
> +}
> +
> +static const TypeInfo vfio_pci_ramfb_dev_info = {
> +    .name = "vfio-pci-ramfb",
> +    .parent = "vfio-pci",
> +    .instance_size = sizeof(VFIOPCIDevice),
> +    .class_init = vfio_pci_ramfb_dev_class_init,
> +};
> +
>  static void register_vfio_pci_dev_type(void)
>  {
>      type_register_static(&vfio_pci_dev_info);
> +    type_register_static(&vfio_pci_ramfb_dev_info);
>  }
>  
>  type_init(register_vfio_pci_dev_type)


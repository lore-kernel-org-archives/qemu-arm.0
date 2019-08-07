Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6648092wrv;
        Wed, 7 Aug 2019 07:53:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwQcBO33fFQRP1XNvceNOX8StNpNTs19OZKqkx8RpaBv2+Im2pY+CuoZ3Vu9IeziKLvrQqh
X-Received: by 2002:a50:94f5:: with SMTP id t50mr10168218eda.150.1565189624215;
        Wed, 07 Aug 2019 07:53:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565189624; cv=none;
        d=google.com; s=arc-20160816;
        b=v/xIE7i1DLDzALABXByDr1REq56kUU+zwt+e3r3j1yge+zITvP/rc5bn7/l1LM7DXB
         A4nU3BmoaBVhtlU8J1hhHHU0zT0zYvzZZuEAFSbgZKAzkdKMrZIdjannu4Y8ML15XRX3
         3J/FvzLTOGXlBoTD8O4NvMlH3ajw+c3T6aQHtIN/pFw59R1QvjZ6lbc1yiRlo1O8l/TA
         rIQg71hJlGmOciMS+XuMeDTfIJe1ou8Lw6QoQvCXqUlwpoDt/Y+lHukFuXlOhCBwH6LI
         Gq+QwOtILRSqfPrxMXeAPclYGBFA0MxEv3qjVAoycngCPNTWZp+wOghCEOF4SJYfZkdl
         rqrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o4YAZdlZGHTYqTNb1MVuymX+rEuuIehN8yuCA4wcFOk=;
        b=u/4/YP13b0mQGPzcX2vK5zGjiJQmvxGVVccnqjyOl9WnOCka7O8JmQm7pucivIXQZ8
         Xe7wB94s10OD/nK93a+C8hqbjKCGhAjFjVwRGVuz3zbgakXWl09c+b3TX3PiA5T0q1XA
         +VzbPRpgVNMN3PL631piWKz9odkRn7udj5Raoe9e8DKxz1F16xa2yVbD92uO+5ywipMp
         9ykyWprSeZzfut3Pzke1D5B+5aSC+To0SD1dl/zeF5OCn9MHyeYGtM3UW/nCOibV2rnr
         Tvbnhraq9E2ppSvykDe7eaFvDdq2LwUuIMDjLyZXJdm8hMp1u/gSnVhqo4CY6vGIN7Cq
         rmDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ui33b5Gn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12si34657607edb.109.2019.08.07.07.53.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 07:53:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ui33b5Gn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvNJv-0004fu-BN
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 10:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45711)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hvNJn-0004b8-Ds
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 10:53:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hvNJm-0001rd-68
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 10:53:35 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:40231)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hvNJl-0001qo-Vw
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 10:53:34 -0400
Received: by mail-ot1-x343.google.com with SMTP id l15so48145782oth.7
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 07:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o4YAZdlZGHTYqTNb1MVuymX+rEuuIehN8yuCA4wcFOk=;
 b=Ui33b5GnMVWOX3+cLzhijVULDAi8R2EYRcn0u898iE9V13IVpas4MCY5ikMdRjkyFP
 fVVCtumv+b3k5GtVD03mund+LAuCH6cuPSPT+qlPSh4qo+BJOuP2nG0uUGVJGbqb8113
 hGBhthJSjOd3kZjaZDZqIksUP0GHll0ejZAtdnjGgJF+i6ThUIHPHcfRlKWwPvEx/WDZ
 8gyEKj9z7tHh6ccgRvdEaGrcXQu7KycO+949CmwwqwY99GfzQNFF8VBL62nbQATG783X
 8yLmzxV9EquvnGphu7ShSkIXFdDiRPlGkc0OVOBLj6eTTasaXdkQpO6pHcnQFGjy0Uce
 vnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o4YAZdlZGHTYqTNb1MVuymX+rEuuIehN8yuCA4wcFOk=;
 b=Atn/G3NqDfo7XTuMzhgxeepFKDz4MO+C/1VfDRjAUDRYRbDLo7foFvsiv4Vk7jRu3G
 0QB6Fkllt1v6nYA6V8lH0KZ4mTeOrn5XAL3/k0CMa1S1GzBteSoab6RFYZOVKguGKKWN
 OLFo7krwxri8w9jGUyEpK3kc2P55sxIpz8/Sbana+2JzBz2QVlWuYjbOn2Xj7K+kIXoS
 mEQ0q83RahHrcewOVhUz0mupKsNKnr3v1sXEJ8Ft1+N1tAkBUxLmGMIhLSjDWSGlYNZE
 TPPIaNk5xq/aTRTaoPvjAfyo7YtN+YSzxjuKWZktNks9bqtRSSSScXXz8Nb+uMRH7gex
 RUeA==
X-Gm-Message-State: APjAAAXeFSQzJlqMhvtBm/A8rLG8OcrLAALYe8uH+FnzYRPP+WQ+IHuf
 TYllg9Fl0AgwFrbdxMq/8tOnRE9Vo416YG4qrdOcQg==
X-Received: by 2002:a05:6808:8c2:: with SMTP id k2mr250210oij.98.1565189612881; 
 Wed, 07 Aug 2019 07:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-7-damien.hedde@greensocs.com>
In-Reply-To: <20190729145654.14644-7-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Aug 2019 15:53:22 +0100
Message-ID: <CAFEAcA8xPTm3g7bg8wEY=ZwpeJOnEXGbhmCt+VvrRDf8tCRRpw@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v3 06/33] add the vmstate description for
 device reset state
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Collin Walling <walling@linux.ibm.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>, Hannes Reinecke <hare@suse.com>,
 Qemu-block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zc86d5xn4Up1

On Mon, 29 Jul 2019 at 15:58, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> It contains the resetting counter and cold flag status.
>
> At this point, migration of bus reset related state (counter and cold/warm
> flag) is handled by parent device. This done using the post_load

"is done"

> function in the vmsd subsection.
>
> This is last point allow to add an initial support of migration with part of
> qdev/qbus tree in reset state under the following condition:
> + time-lasting reset are asserted on Device only
>
> Note that if this condition is not respected, migration will succeed and
> no failure will occurs. The only impact is that the resetting counter
> of a bus may lower afer a migration.

We should just migrate the bus state correctly -- see below.

> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  hw/core/Makefile.objs  |  1 +
>  hw/core/qdev-vmstate.c | 45 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 hw/core/qdev-vmstate.c
>
> diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
> index d9234aa98a..49e9be0228 100644
> --- a/hw/core/Makefile.objs
> +++ b/hw/core/Makefile.objs
> @@ -4,6 +4,7 @@ common-obj-y += bus.o reset.o
>  common-obj-y += resettable.o
>  common-obj-$(CONFIG_SOFTMMU) += qdev-fw.o
>  common-obj-$(CONFIG_SOFTMMU) += fw-path-provider.o
> +common-obj-$(CONFIG_SOFTMMU) += qdev-vmstate.o
>  # irq.o needed for qdev GPIO handling:
>  common-obj-y += irq.o
>  common-obj-y += hotplug.o
> diff --git a/hw/core/qdev-vmstate.c b/hw/core/qdev-vmstate.c
> new file mode 100644
> index 0000000000..07b010811f
> --- /dev/null
> +++ b/hw/core/qdev-vmstate.c
> @@ -0,0 +1,45 @@
> +/*
> + * Device vmstate
> + *
> + * Copyright (c) 2019 GreenSocs
> + *
> + * Authors:
> + *   Damien Hedde
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/qdev.h"
> +#include "migration/vmstate.h"
> +
> +static bool device_vmstate_reset_needed(void *opaque)
> +{
> +    DeviceState *dev = (DeviceState *) opaque;
> +    return dev->resetting != 0;
> +}
> +
> +static int device_vmstate_reset_post_load(void *opaque, int version_id)
> +{
> +    DeviceState *dev = (DeviceState *) opaque;
> +    BusState *bus;
> +    QLIST_FOREACH(bus, &dev->child_bus, sibling) {
> +        bus->resetting = dev->resetting;
> +        bus->reset_is_cold = dev->reset_is_cold;
> +    }

Bus reset state might not be the same as the parent device's
reset state, so we need to migrate them both separately.

The way to do this is that in a pre-save hook we iterate
through the child buses and capture their state into
an array. Then we can migrate the array. In the post-load
hook we can set the bus state fields from the array contents.
VMSTATE_WITH_TMP is useful for this kind of situation.

One thing I'm slightly wary of here is that this will mean
that the ordering of child buses within the child_bus
array becomes significant to avoid migration compat breaks.
I think this is OK, though.

> +    return 0;
> +}
> +
> +const struct VMStateDescription device_vmstate_reset = {
> +    .name = "device_reset",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .needed = device_vmstate_reset_needed,
> +    .post_load = device_vmstate_reset_post_load,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(resetting, DeviceState),
> +        VMSTATE_BOOL(reset_is_cold, DeviceState),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};

This isn't used -- I think you should squash patch 7 in
with this one.

thanks
-- PMM

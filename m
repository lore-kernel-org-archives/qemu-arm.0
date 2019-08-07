Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6664783wrv;
        Wed, 7 Aug 2019 08:08:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyh8DuSowzZ48stM6kYWdTMARCkWesrBfwqOfzZhAFxHaMXkDFEvl9k9eyeyBFvPmZ0Pq2c
X-Received: by 2002:a0c:b163:: with SMTP id r32mr8716867qvc.169.1565190489056;
        Wed, 07 Aug 2019 08:08:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565190489; cv=none;
        d=google.com; s=arc-20160816;
        b=g9LtVK5t3tDmA8ncqTsKIwwPjVdSpxHEeHDA0GXcfMrBSs+RuxvfLv2d9jW2oKmyDz
         By4CAiMlJVnQDrqfuvlWdHm7v0CSRPQIt5poVhdPUPz7FOrBjuvn0x2peWhpPooOJaFK
         pGPbzTjDIL9Tz/T74Tn9dq5f2ANqQvZ2+XgswVU+25Fn1NJPfWbgx9nfBjw+Z9cf53b0
         UqOflNiqEOoDLU+EyQf3wotyUnJ2PHHrjWK2ufC6OmzbTEViYO9ukU0KZs+yUJsqvESc
         mg8NsO473L7Nrxd8YZkqEBpiNt3vlm5J28jcLSXDq4p4ILyfI5u/3HqRe9JyoCMcDQ02
         Qy3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h5na1YqadXDFBRFP9m9NOGDLGc+2pkzDG9ETypEMJvg=;
        b=vkEHxZerdqQ3Ek01DRcwW5ist3a1vrO7RisF4XxUQJabhZnyoXbOJzzl5l39QNLq6Q
         GiGgrppBJ5A+eQWhgi4zxLQ4/ND3ouqIQB4/hGF4vZ4T0Ae1yBQKzUHNNiiMGQjis7OO
         qZt3ILjR03TjxoHYt6B+631p09P3P0715qB/dmd0ghz5XI6DrfF05KLELJ/eKvYNVNbl
         ysr0Ub6ywicKvPbsH3jC8f91PdpXKoYAwHD/iURYwUmdzGMGG81YrgoExVVzFYW3jtoD
         zfkBayXXvC5wvvnn1tI6l40NtUVzU950H7/uvgc8D+YWVo97NRPxlvuWOatGMdL2ytv2
         TgrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XCLEwwbw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l13si1570197qvc.152.2019.08.07.08.08.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 08:08:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XCLEwwbw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvNXs-0001ND-Kg
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 11:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49325)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hvNXm-0001L2-3R
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:08:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hvNXk-0001tO-KI
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:08:02 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35294)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hvNXk-0001sd-Bh
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:08:00 -0400
Received: by mail-ot1-x343.google.com with SMTP id j19so28931502otq.2
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 08:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h5na1YqadXDFBRFP9m9NOGDLGc+2pkzDG9ETypEMJvg=;
 b=XCLEwwbwiDnKwLmkG8o3eRnOoERzguUFVtB6pWVBd7s17pv1c/mdcnyvz7tsykyT9o
 HfQ+sKL6xweJrYtaxI9TXh+HTnvFC9QQdESyH0+kIA6hdlMeTkULLGt2Vd27ULzPZfke
 CIQ9FHmP0y+KVyKX1iszhKIAOVCus7dYGLaRYZqLTuJjuauzupm+fjN61OP/yMpE9WQ7
 5rrNfH62+iP4XzEKFYLjdjMjY/4N8ox8p0/hCg+welZiTLkgCySRw1M3LYjM3XyAvBbL
 QDPq8p6boeQE17JYvwRUDDwNWRuGjxfaz/4RQ+vRzXHLg4S+IkIMoHWGH7hQinWww/iY
 J9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h5na1YqadXDFBRFP9m9NOGDLGc+2pkzDG9ETypEMJvg=;
 b=LuriGTSPzrMRnw6liMhfGsvJBKc29VYg4Fhoj+61aidvF5KrMpP3yd9LEUDTRntp84
 5MLJlHFksGNrCPLbpyMF2Z6d18kMIcdQauETw0OySbbq+gAsb/UTiF896evDP4/0ca3U
 D9UIkbm8mQwJmyNkiM58MaSlf0uJonUPkQVUeVbzE61tT1NscTQtdPN5x5sTNsYTZo+w
 L76T2qXmnA5YgGGvsyTgknKEGspPX1fU/oLzG98hOt1s1KuhpLiKDfKq8LLB1wyZ5frm
 cD4EMOt9AMykDEbv4TcHkETnW9/6314iLLESJ4jU0DGBhf0lR1KJcO2Q/Wm3Nb+/ZTda
 LewA==
X-Gm-Message-State: APjAAAUrwk5l0EeJNXs3bSm51MiKeE/HnzTmiCXwZ/ZvU7ybAmzbxyse
 Q7giqrUPQQoopXcLypmd0IfqQbwMTxT1DBu0A8KiAQ==
X-Received: by 2002:a5d:948f:: with SMTP id v15mr9171463ioj.93.1565190479332; 
 Wed, 07 Aug 2019 08:07:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-8-damien.hedde@greensocs.com>
In-Reply-To: <20190729145654.14644-8-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Aug 2019 16:07:47 +0100
Message-ID: <CAFEAcA-W0SaaGbUnGZ0b61ngxKY8R9xjwGXeN+=MaUi4bMDgNg@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v3 07/33] automatically add vmstate for reset
 support in devices
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
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iJbsQGRGtheA

On Mon, 29 Jul 2019 at 15:59, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> This add the reset related sections for every QOM
> device.

A bit more detail in the commit message would help, I think --
this is adding extra machinery which has to copy and modify
the VMStateDescription passed in by the device in order to
add the subsection that handles reset.

I've added Dave Gilbert to the already long cc list since this
is migration related.

> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  hw/core/qdev-vmstate.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  hw/core/qdev.c         | 12 +++++++++++-
>  include/hw/qdev-core.h |  3 +++
>  stubs/Makefile.objs    |  1 +
>  stubs/device.c         |  7 +++++++
>  5 files changed, 63 insertions(+), 1 deletion(-)
>  create mode 100644 stubs/device.c
>
> diff --git a/hw/core/qdev-vmstate.c b/hw/core/qdev-vmstate.c
> index 07b010811f..24f8465c61 100644
> --- a/hw/core/qdev-vmstate.c
> +++ b/hw/core/qdev-vmstate.c
> @@ -43,3 +43,44 @@ const struct VMStateDescription device_vmstate_reset = {
>          VMSTATE_END_OF_LIST()
>      },
>  };
> +
> +static VMStateDescription *vmsd_duplicate_and_append(
> +        const VMStateDescription *old_vmsd,
> +        const VMStateDescription *new_subsection)
> +{
> +    VMStateDescription *vmsd;
> +    int n = 0;
> +
> +    assert(old_vmsd && new_subsection);
> +
> +    vmsd = (VMStateDescription *) g_memdup(old_vmsd, sizeof(*vmsd));
> +
> +    if (old_vmsd->subsections) {
> +        while (old_vmsd->subsections[n]) {
> +            n += 1;
> +        }
> +    }
> +    vmsd->subsections = g_new(const VMStateDescription *, n + 2);
> +
> +    if (old_vmsd->subsections) {
> +        memcpy(vmsd->subsections, old_vmsd->subsections,
> +               sizeof(VMStateDescription *) * n);
> +    }
> +    vmsd->subsections[n] = new_subsection;
> +    vmsd->subsections[n + 1] = NULL;
> +
> +    return vmsd;
> +}
> +
> +void device_class_build_extended_vmsd(DeviceClass *dc)
> +{
> +    assert(dc->vmsd);
> +    assert(!dc->vmsd_ext);
> +
> +    /* forge a subsection with proper name */
> +    VMStateDescription *reset;
> +    reset = g_memdup(&device_vmstate_reset, sizeof(*reset));
> +    reset->name = g_strdup_printf("%s/device_reset", dc->vmsd->name);
> +
> +    dc->vmsd_ext = vmsd_duplicate_and_append(dc->vmsd, reset);
> +}

This will allocate memory, but there is no corresponding
code which frees it. This means you'll have a memory leak
across device realize->unrealize for hotplug devices.

> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index e9e5f2d5f9..88387d3743 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -45,7 +45,17 @@ bool qdev_hot_removed = false;
>  const VMStateDescription *qdev_get_vmsd(DeviceState *dev)
>  {
>      DeviceClass *dc = DEVICE_GET_CLASS(dev);
> -    return dc->vmsd;
> +
> +    if (!dc->vmsd) {
> +        return NULL;
> +    }
> +
> +    if (!dc->vmsd_ext) {
> +        /* build it first time we need it */
> +        device_class_build_extended_vmsd(dc);
> +    }
> +
> +    return dc->vmsd_ext;
>  }

Unfortunately not everything that wants the VMSD calls
this function. migration/savevm.c:dump_vmstate_json_to_file()
does a direct access to dc->vmsd, so we need to fix that first.

Devices which don't use dc->vmsd won't get this and so
their reset state won't be migrated. That's OK for anything
that's still not yet a QOM device, I guess -- it's not possible
for them to be in a 'held in reset' state anyway, so the
extra subsection would never be needed.

The one I'm less sure about is the 'virtio' devices, which
have to do something odd with migration state for backwards
compat reasons. At the moment they can't be in a situation
where they're being held in reset when we do a migration,
but since they're PCI devices they might in future be possible
to put into new boards/pci controllers that would let them
be in that situation.

>  static void bus_remove_child(BusState *bus, DeviceState *child)
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 1670ae41bb..926d4bbcb1 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -120,6 +120,7 @@ typedef struct DeviceClass {
>
>      /* device state */
>      const struct VMStateDescription *vmsd;
> +    const struct VMStateDescription *vmsd_ext;
>
>      /* Private to qdev / bus.  */
>      const char *bus_type;
> @@ -520,6 +521,8 @@ void device_class_set_parent_unrealize(DeviceClass *dc,
>
>  const struct VMStateDescription *qdev_get_vmsd(DeviceState *dev);
>
> +void device_class_build_extended_vmsd(DeviceClass *dc);
> +
>  const char *qdev_fw_name(DeviceState *dev);
>
>  Object *qdev_get_machine(void);
> diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
> index 9c7393b08c..432b56f290 100644
> --- a/stubs/Makefile.objs
> +++ b/stubs/Makefile.objs
> @@ -40,4 +40,5 @@ stub-obj-y += pci-host-piix.o
>  stub-obj-y += ram-block.o
>  stub-obj-y += ramfb.o
>  stub-obj-y += fw_cfg.o
> +stub-obj-y += device.o
>  stub-obj-$(CONFIG_SOFTMMU) += semihost.o
> diff --git a/stubs/device.c b/stubs/device.c
> new file mode 100644
> index 0000000000..e9b4f57e5f
> --- /dev/null
> +++ b/stubs/device.c
> @@ -0,0 +1,7 @@
> +#include "qemu/osdep.h"
> +#include "hw/qdev-core.h"
> +
> +void device_class_build_extended_vmsd(DeviceClass *dc)
> +{
> +    return;
> +}
> --
> 2.22.0


thanks
-- PMM

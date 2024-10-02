Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp822041njl;
        Wed, 2 Oct 2024 06:40:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVS7s2ocAnpV3xygvAd9FdnbZQvieJ/WATSWpLbZ0pgxZD1DBGLueFocS50KZgcxFRt1+kRtrJTI6AQIw==@linaro.org
X-Google-Smtp-Source: AGHT+IFLJlPoa6sEQ3SK3xKgTxY+B+z/yWTk16EfLdpKUnNpFJQPFPUtHsM+dTdS/Jjj5RTqS5Gd
X-Received: by 2002:a05:620a:284d:b0:7ac:a963:80e6 with SMTP id af79cd13be357-7ae626c6a3amr524402785a.26.1727876423356;
        Wed, 02 Oct 2024 06:40:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727876423; cv=none;
        d=google.com; s=arc-20240605;
        b=gX4DyGW3DS3vL/lbbO7sj1hDSu65l7Mw/ZmJJMvjVXvHz/EW+d6P/bsI+voeE7Vuph
         kFItTh2zdz4mESXE8V38j0Wh7wqgBsKzyFgn6KoQYmGCnetBguuaGVKGCkneLszhxnNs
         dg2fHsLpdsUMhETqb2gpFQW2nno/HPtVmhKuoINBnTi9Fj2rlNfPzhfUWzYMjIGcb5Lg
         0IBistYD6kvrzMMxGSahIOoT7Lk0FpHW1VWbVgRevCQPypARWVxGuDla0Z1gAJyjwwlL
         mtoOanIRAa9XCuqrr96pyy0ubp0UsvVJUmpl7GPEHp4p6vp6SRexEULHIlo3noSXjCFc
         ZEjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=wnuOyP+3ophcGUwS6NkeSZvnaALLkKhq/zwZGQWfBFk=;
        fh=NyvwvChIo4Jq84r8Uj52p/XD3agJogpgxkpaPPgRjaQ=;
        b=CgzNvNnA3pQ+8DCZ26a2yrIvdURf4MD5sw7N+a2pDuH7gVY/vYbxRFtCyOmisofm8q
         gi45jZ4QMuX8mT3mSdFQLHmIoQdy7gB7rcfeiXeWQnk9hq4S3W+OkOShyACUzoMd9Hwb
         Pjot2FGrnpbui6Euk9Ake+OODQ2R6hPPmWV9LEQ+KzmVF6PHI3igJMbQHRFUvEYy8r/Y
         2LPDp57vDxIv7HakYZIq/+6WA4sVKm/d0ciUucm7YYJg73HYBO1Th3s1glHWdaX7Rkpm
         QM0njbS6T+hTNdAbEeGDUzCC26OYBJOXrGIjzCa952sDRiWcgZo0pX2iWzNrL8F2j69l
         mqLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=W5Io1mBg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae378a04fesi1324362785a.738.2024.10.02.06.40.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Oct 2024 06:40:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=W5Io1mBg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1svzaG-0008SC-5Q; Wed, 02 Oct 2024 09:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1svza9-0008Q0-Lg
 for qemu-arm@nongnu.org; Wed, 02 Oct 2024 09:39:58 -0400
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1svza4-0001A8-Vq
 for qemu-arm@nongnu.org; Wed, 02 Oct 2024 09:39:57 -0400
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-5078bbc3a0bso1365294e0c.1
 for <qemu-arm@nongnu.org>; Wed, 02 Oct 2024 06:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1727876391; x=1728481191;
 darn=nongnu.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wnuOyP+3ophcGUwS6NkeSZvnaALLkKhq/zwZGQWfBFk=;
 b=W5Io1mBg/Yo0EVdAmCyfwS/rDC4GMU0OWC3FXLiEGs2UzuRTVFZwNTzsO/PJQ1DnTf
 xi0oejyF+UmNoEnbCZnlT9RSqqQlRryXdH+vSpmZ8hKpheFSN7e2YHDA/bcEy4L7TKd2
 leLaRl3fEyshsAsxCQKUuhUypENZjxYYx+VN9oleA+q8qwKpvzcuARuxXXZOFbXkrDki
 TbNh1zqOmLRbnoGVQQ/nRl7naE6jAIrpz9V/aKrEcDWYGkfk4aJUomQZ6UsOc8reduvF
 85sA9C1XqO7gJbaiDRb0BIBOTA7IpYfyWAIMkZ9tDSW/tAVS8A34QKCeyB9Pw0Q8PVjc
 xtzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727876391; x=1728481191;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wnuOyP+3ophcGUwS6NkeSZvnaALLkKhq/zwZGQWfBFk=;
 b=RB3hjmn7Y9l9xGdlGlzfs2blglTdxITMOIpqszfTBUQWhFvoBGS7W3YVawJV0qP/lI
 rYfLurs1X91o1ZPPsr8Dl54xkgeDRx6r7BBVyP0e+hYqhgnotFpN6sAKsm1vdjvDGcLu
 D00btmxykBUTuHKeQP+fIrB9Eu0fIB20UkfVsf0Hbn4CMVMVBgj0GCjp91m8j5XkGuIM
 QASwl9tnBf3Ug/zhe4bded931bN3IVRfucnS4BozMUykBXeMz5buSOtr92SFvs3SL3jH
 9kpq7zXoOTuNBPa0+GYxKUrLzEOVqAbV1fX+4jzVEv4xCA/dBcT+NL72TkGOx4w/g+eu
 U24w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBOlIG71OsRb6/0qA+UOKi98bJ8bol9kCbaPuevFKDXRu/Xb7NaWVaa5BFsv0wYaPwGbk43EtPrQ==@nongnu.org
X-Gm-Message-State: AOJu0YxT8YowYFoIAZlfvULY24Q1iUPliNt9bqhlJ7mBB9TL19iHXent
 OohDFYI8YRwfksTvWTEP7neGC8QHgizeh5yDgidG0MiEk5fxy+2kZuIKgtjK+F2z7ZisAk5fYf1
 dieJA1Qj+UlVC1RcmrmapyXHb18Z/KGyNIRCa
X-Received: by 2002:a05:6122:3c89:b0:50a:bd30:c139 with SMTP id
 71dfb90a1353d-50c58254d36mr2517946e0c.11.1727876391148; Wed, 02 Oct 2024
 06:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240928085727.56883-1-phil@philjordan.eu>
 <20240928085727.56883-3-phil@philjordan.eu>
 <7d345ac4-249d-4865-9dcc-f137ae861214@daynix.com>
In-Reply-To: <7d345ac4-249d-4865-9dcc-f137ae861214@daynix.com>
From: Phil Dennis-Jordan <phil@philjordan.eu>
Date: Wed, 2 Oct 2024 15:39:40 +0200
Message-ID: <CAAibmn2+Q01MKmqGrp0aeXhS64Ff1bPHyLXgGz-bRthG0Nm5-A@mail.gmail.com>
Subject: Re: [PATCH v3 02/14] hw/display/apple-gfx: Adds PCI implementation
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, agraf@csgraf.de, peter.maydell@linaro.org, 
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com, 
 marcin.juszkiewicz@linaro.org, stefanha@redhat.com, mst@redhat.com, 
 slp@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net, 
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com, 
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com, philmd@linaro.org, 
 shorne@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bmeng.cn@gmail.com, liwei1518@gmail.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, 
 berrange@redhat.com, qemu-arm@nongnu.org, qemu-block@nongnu.org, 
 qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000082b8b406237e9298"
Received-SPF: neutral client-ip=2607:f8b0:4864:20::a33;
 envelope-from=phil@philjordan.eu; helo=mail-vk1-xa33.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: oerOZDBu5Gfi

--00000000000082b8b406237e9298
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Oct 2024 at 09:14, Akihiko Odaki <akihiko.odaki@daynix.com> wrote=
:

> On 2024/09/28 17:57, Phil Dennis-Jordan wrote:
> > This change wires up the PCI variant of the paravirtualised
> > graphics device, mainly useful for x86-64 macOS guests, implemented
> > by macOS's ParavirtualizedGraphics.framework. It builds on code
> > shared with the vmapple/mmio variant of the PVG device.
> >
> > Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> > ---
> >   hw/display/Kconfig         |   5 ++
> >   hw/display/apple-gfx-pci.m | 138 ++++++++++++++++++++++++++++++++++++=
+
> >   hw/display/meson.build     |   1 +
> >   3 files changed, 144 insertions(+)
> >   create mode 100644 hw/display/apple-gfx-pci.m
> >
> > diff --git a/hw/display/Kconfig b/hw/display/Kconfig
> > index 179a479d220..c2ec268f8e9 100644
> > --- a/hw/display/Kconfig
> > +++ b/hw/display/Kconfig
> > @@ -152,3 +152,8 @@ config MAC_PVG_VMAPPLE
> >       bool
> >       depends on MAC_PVG
> >       depends on ARM
> > +
> > +config MAC_PVG_PCI
> > +    bool
> > +    depends on MAC_PVG && PCI
> > +    default y if PCI_DEVICES
> > diff --git a/hw/display/apple-gfx-pci.m b/hw/display/apple-gfx-pci.m
> > new file mode 100644
> > index 00000000000..9370258ee46
> > --- /dev/null
> > +++ b/hw/display/apple-gfx-pci.m
> > @@ -0,0 +1,138 @@
> > +/*
> > + * QEMU Apple ParavirtualizedGraphics.framework device, PCI variant
> > + *
> > + * Copyright =C2=A9 2023-2024 Phil Dennis-Jordan
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> > + * See the COPYING file in the top-level directory.
>
> Please use SPDX-License-Identifier instead.
>
> > + *
> > + * ParavirtualizedGraphics.framework is a set of libraries that macOS
> provides
> > + * which implements 3d graphics passthrough to the host as well as a
> > + * proprietary guest communication channel to drive it. This device
> model
> > + * implements support to drive that library from within QEMU as a PCI
> device
> > + * aimed primarily at x86-64 macOS VMs.
> > + */
> > +
> > +#include "apple-gfx.h"
> > +#include "hw/pci/pci_device.h"
> > +#include "hw/pci/msi.h"
> > +#include "qapi/error.h"
> > +#include "trace.h"
> > +#import <ParavirtualizedGraphics/ParavirtualizedGraphics.h>
>
> Please add #include "qemu/osdep.h" at top and reorder according to
> "Include directives" section in: docs/devel/style.rst
>
> > +
> > +typedef struct AppleGFXPCIState {
> > +    PCIDevice parent_obj;
> > +
> > +    AppleGFXState common;
> > +} AppleGFXPCIState;
> > +
> > +OBJECT_DECLARE_SIMPLE_TYPE(AppleGFXPCIState, APPLE_GFX_PCI)
> > +
> > +static const char* apple_gfx_pci_option_rom_path =3D NULL;
> > +
> > +static void apple_gfx_init_option_rom_path(void)
> > +{
> > +    NSURL *option_rom_url =3D PGCopyOptionROMURL();
> > +    const char *option_rom_path =3D
> option_rom_url.fileSystemRepresentation;
> > +    if (option_rom_url.fileURL && option_rom_path !=3D NULL) {
>
> option_rom_path !=3D NULL is unnecessary; NSURL.h has
> NS_HEADER_AUDIT_BEGIN(nullability, sendability), which means any
> non-annotated member is non-nullable.
>
> > +        apple_gfx_pci_option_rom_path =3D g_strdup(option_rom_path);
> > +    }
> > +    [option_rom_url release];
> > +}
> > +
> > +static void apple_gfx_pci_init(Object *obj)
> > +{
> > +    AppleGFXPCIState *s =3D APPLE_GFX_PCI(obj);
> > +
> > +    if (!apple_gfx_pci_option_rom_path) {
> > +        /* Done on device not class init to avoid -daemonize ObjC fork
> crash */
>
> It is unclear what "-daemonize ObjC fork crash" means. Please add more
> details.
>

When libvirt starts up a VM, it runs Qemu once in a dry-run state with the
-daemonize command line argument without actually running the VM. It then
queries various information about available features. It then shuts down
Qemu and re-runs it without -daemonize and actually lets the VM run.

The -daemonize command line argument causes fork() to be called. Apple's
Objective-C runtime does not support fork()ing and will immediately crash
the process when it detects it happening. QOM class init happens before the
fork(), so you can't call any Objective-C code from the class init
functions without causing a crash with -daemonize.

I can expand the comment somewhat for clarity.


> > +        PCIDeviceClass *pci =3D PCI_DEVICE_CLASS(object_get_class(obj)=
);
> > +        apple_gfx_init_option_rom_path();
> > +        pci->romfile =3D apple_gfx_pci_option_rom_path;
> > +    }
> > +
> > +    apple_gfx_common_init(obj, &s->common, TYPE_APPLE_GFX_PCI);
> > +}
> > +
> > +static void apple_gfx_pci_interrupt(PCIDevice *dev, AppleGFXPCIState *=
s,
>
> s is unused.
>

Hmm, I suppose I should probably have a fallback legacy PCI IRQ trigger
here when MSI is not available.


> > +                                    uint32_t vector)
> > +{
> > +    bool msi_ok;
> > +    trace_apple_gfx_raise_irq(vector);
> > +
> > +    msi_ok =3D msi_enabled(dev);
> > +    if (msi_ok) {
> > +        msi_notify(dev, vector);
> > +    }
> > +}
> > +
> > +static void apple_gfx_pci_realize(PCIDevice *dev, Error **errp)
> > +{
> > +    AppleGFXPCIState *s =3D APPLE_GFX_PCI(dev);
> > +    Error *err =3D NULL;
> > +    int ret;
> > +
> > +    pci_register_bar(dev, PG_PCI_BAR_MMIO,
> > +                     PCI_BASE_ADDRESS_SPACE_MEMORY,
> &s->common.iomem_gfx);
> > +
> > +    ret =3D msi_init(dev, 0x0 /* config offset; 0 =3D find space */,
> > +                   PG_PCI_MAX_MSI_VECTORS, true /* msi64bit */,
> > +                   false /*msi_per_vector_mask*/, &err);
> > +    if (ret !=3D 0) {
> > +        error_propagate(errp, err);
>
> You can just pass errp to msi_init().
>
> > +        return;
> > +    }
> > +
> > +    @autoreleasepool {
> > +        PGDeviceDescriptor *desc =3D [PGDeviceDescriptor new];
> > +        desc.raiseInterrupt =3D ^(uint32_t vector) {
> > +            apple_gfx_pci_interrupt(dev, s, vector);
> > +        };
> > +
> > +        apple_gfx_common_realize(&s->common, desc);
> > +        [desc release];
> > +        desc =3D nil;
> > +    }
> > +}
> > +
> > +static void apple_gfx_pci_reset(Object *obj, ResetType type)
> > +{
> > +    AppleGFXPCIState *s =3D APPLE_GFX_PCI(obj);
> > +    [s->common.pgdev reset];
> > +}
> > +
> > +static void apple_gfx_pci_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > +    PCIDeviceClass *pci =3D PCI_DEVICE_CLASS(klass);
> > +    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
> > +
> > +    assert(rc->phases.hold =3D=3D NULL);
> > +    rc->phases.hold =3D apple_gfx_pci_reset;
> > +    dc->desc =3D "macOS Paravirtualized Graphics PCI Display Controlle=
r";
> > +    dc->hotpluggable =3D false;
> > +    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
> > +
> > +    pci->vendor_id =3D PG_PCI_VENDOR_ID;
> > +    pci->device_id =3D PG_PCI_DEVICE_ID;
> > +    pci->class_id =3D PCI_CLASS_DISPLAY_OTHER;
> > +    pci->realize =3D apple_gfx_pci_realize;
> > +
> > +    // TODO: Property for setting mode list
> > +}
> > +
> > +static TypeInfo apple_gfx_pci_types[] =3D {
> > +    {
> > +        .name          =3D TYPE_APPLE_GFX_PCI,
> > +        .parent        =3D TYPE_PCI_DEVICE,
> > +        .instance_size =3D sizeof(AppleGFXPCIState),
> > +        .class_init    =3D apple_gfx_pci_class_init,
> > +        .instance_init =3D apple_gfx_pci_init,
> > +        .interfaces =3D (InterfaceInfo[]) {
> > +            { INTERFACE_PCIE_DEVICE },
> > +            { },
> > +        },
> > +    }
> > +};
> > +DEFINE_TYPES(apple_gfx_pci_types)
> > +
> > diff --git a/hw/display/meson.build b/hw/display/meson.build
> > index 70d855749c0..ceb7bb07612 100644
> > --- a/hw/display/meson.build
> > +++ b/hw/display/meson.build
> > @@ -67,6 +67,7 @@ system_ss.add(when: 'CONFIG_ATI_VGA', if_true:
> [files('ati.c', 'ati_2d.c', 'ati_
> >
> >   system_ss.add(when: 'CONFIG_MAC_PVG',         if_true:
> [files('apple-gfx.m'), pvg, metal])
> >   system_ss.add(when: 'CONFIG_MAC_PVG_VMAPPLE', if_true:
> [files('apple-gfx-vmapple.m'), pvg, metal])
> > +system_ss.add(when: 'CONFIG_MAC_PVG_PCI',     if_true:
> [files('apple-gfx-pci.m'), pvg, metal])
> >
> >   if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
> >     virtio_gpu_ss =3D ss.source_set()
>
>

--00000000000082b8b406237e9298
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 2 Oct 2024 at 09:14, Akihiko =
Odaki &lt;<a href=3D"mailto:akihiko.odaki@daynix.com">akihiko.odaki@daynix.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On 2024/09/28 17:57, Phil Dennis-Jordan wrote:<br>
&gt; This change wires up the PCI variant of the paravirtualised<br>
&gt; graphics device, mainly useful for x86-64 macOS guests, implemented<br=
>
&gt; by macOS&#39;s ParavirtualizedGraphics.framework. It builds on code<br=
>
&gt; shared with the vmapple/mmio variant of the PVG device.<br>
&gt; <br>
&gt; Signed-off-by: Phil Dennis-Jordan &lt;<a href=3D"mailto:phil@philjorda=
n.eu" target=3D"_blank">phil@philjordan.eu</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/display/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A05 ++<br>
&gt;=C2=A0 =C2=A0hw/display/apple-gfx-pci.m | 138 +++++++++++++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A0hw/display/meson.build=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 =
+<br>
&gt;=C2=A0 =C2=A03 files changed, 144 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 hw/display/apple-gfx-pci.m<br>
&gt; <br>
&gt; diff --git a/hw/display/Kconfig b/hw/display/Kconfig<br>
&gt; index 179a479d220..c2ec268f8e9 100644<br>
&gt; --- a/hw/display/Kconfig<br>
&gt; +++ b/hw/display/Kconfig<br>
&gt; @@ -152,3 +152,8 @@ config MAC_PVG_VMAPPLE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on MAC_PVG<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on ARM<br>
&gt; +<br>
&gt; +config MAC_PVG_PCI<br>
&gt; +=C2=A0 =C2=A0 bool<br>
&gt; +=C2=A0 =C2=A0 depends on MAC_PVG &amp;&amp; PCI<br>
&gt; +=C2=A0 =C2=A0 default y if PCI_DEVICES<br>
&gt; diff --git a/hw/display/apple-gfx-pci.m b/hw/display/apple-gfx-pci.m<b=
r>
&gt; new file mode 100644<br>
&gt; index 00000000000..9370258ee46<br>
&gt; --- /dev/null<br>
&gt; +++ b/hw/display/apple-gfx-pci.m<br>
&gt; @@ -0,0 +1,138 @@<br>
&gt; +/*<br>
&gt; + * QEMU Apple ParavirtualizedGraphics.framework device, PCI variant<b=
r>
&gt; + *<br>
&gt; + * Copyright =C2=A9 2023-2024 Phil Dennis-Jordan<br>
&gt; + *<br>
&gt; + * This work is licensed under the terms of the GNU GPL, version 2 or=
 later.<br>
&gt; + * See the COPYING file in the top-level directory.<br>
<br>
Please use SPDX-License-Identifier instead.<br>
<br>
&gt; + *<br>
&gt; + * ParavirtualizedGraphics.framework is a set of libraries that macOS=
 provides<br>
&gt; + * which implements 3d graphics passthrough to the host as well as a<=
br>
&gt; + * proprietary guest communication channel to drive it. This device m=
odel<br>
&gt; + * implements support to drive that library from within QEMU as a PCI=
 device<br>
&gt; + * aimed primarily at x86-64 macOS VMs.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;apple-gfx.h&quot;<br>
&gt; +#include &quot;hw/pci/pci_device.h&quot;<br>
&gt; +#include &quot;hw/pci/msi.h&quot;<br>
&gt; +#include &quot;qapi/error.h&quot;<br>
&gt; +#include &quot;trace.h&quot;<br>
&gt; +#import &lt;ParavirtualizedGraphics/ParavirtualizedGraphics.h&gt;<br>
<br>
Please add #include &quot;qemu/osdep.h&quot; at top and reorder according t=
o <br>
&quot;Include directives&quot; section in: docs/devel/style.rst<br>
<br>
&gt; +<br>
&gt; +typedef struct AppleGFXPCIState {<br>
&gt; +=C2=A0 =C2=A0 PCIDevice parent_obj;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 AppleGFXState common;<br>
&gt; +} AppleGFXPCIState;<br>
&gt; +<br>
&gt; +OBJECT_DECLARE_SIMPLE_TYPE(AppleGFXPCIState, APPLE_GFX_PCI)<br>
&gt; +<br>
&gt; +static const char* apple_gfx_pci_option_rom_path =3D NULL;<br>
&gt; +<br>
&gt; +static void apple_gfx_init_option_rom_path(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 NSURL *option_rom_url =3D PGCopyOptionROMURL();<br>
&gt; +=C2=A0 =C2=A0 const char *option_rom_path =3D option_rom_url.fileSyst=
emRepresentation;<br>
&gt; +=C2=A0 =C2=A0 if (option_rom_url.fileURL &amp;&amp; option_rom_path !=
=3D NULL) {<br>
<br>
option_rom_path !=3D NULL is unnecessary; NSURL.h has <br>
NS_HEADER_AUDIT_BEGIN(nullability, sendability), which means any <br>
non-annotated member is non-nullable.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 apple_gfx_pci_option_rom_path =3D g_strdu=
p(option_rom_path);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 [option_rom_url release];<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void apple_gfx_pci_init(Object *obj)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 AppleGFXPCIState *s =3D APPLE_GFX_PCI(obj);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!apple_gfx_pci_option_rom_path) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Done on device not class init to avoid=
 -daemonize ObjC fork crash */<br>
<br>
It is unclear what &quot;-daemonize ObjC fork crash&quot; means. Please add=
 more <br>
details.<br></blockquote><div><br></div><div>When libvirt starts up a VM, i=
t runs Qemu once in a dry-run state with the  -daemonize command line argum=
ent without actually running the VM. It then queries various information ab=
out available features. It then shuts down Qemu and re-runs it without -dae=
monize and actually lets the VM run.</div><div><br></div><div>The -daemoniz=
e command line argument causes fork() to be called. Apple&#39;s Objective-C=
 runtime does not support fork()ing and will immediately crash the process =
when it detects it happening. QOM class init happens before the fork(), so =
you can&#39;t call any Objective-C code from the class init functions witho=
ut causing a crash with -daemonize.</div><div><br></div><div>I can expand t=
he comment somewhat for clarity.<br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 PCIDeviceClass *pci =3D PCI_DEVICE_CLASS(=
object_get_class(obj));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 apple_gfx_init_option_rom_path();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pci-&gt;romfile =3D apple_gfx_pci_option_=
rom_path;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 apple_gfx_common_init(obj, &amp;s-&gt;common, TYPE_APPL=
E_GFX_PCI);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void apple_gfx_pci_interrupt(PCIDevice *dev, AppleGFXPCIState =
*s,<br>
<br>
s is unused.<br></blockquote><div><br></div><div>Hmm, I suppose I should pr=
obably have a fallback legacy PCI IRQ trigger here when MSI is not availabl=
e.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t vector)<b=
r>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 bool msi_ok;<br>
&gt; +=C2=A0 =C2=A0 trace_apple_gfx_raise_irq(vector);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 msi_ok =3D msi_enabled(dev);<br>
&gt; +=C2=A0 =C2=A0 if (msi_ok) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 msi_notify(dev, vector);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void apple_gfx_pci_realize(PCIDevice *dev, Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 AppleGFXPCIState *s =3D APPLE_GFX_PCI(dev);<br>
&gt; +=C2=A0 =C2=A0 Error *err =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pci_register_bar(dev, PG_PCI_BAR_MMIO,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0PCI_BASE_ADDRESS_SPACE_MEMORY, &amp;s-&gt;common.iomem_gfx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ret =3D msi_init(dev, 0x0 /* config offset; 0 =3D find =
space */,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
PG_PCI_MAX_MSI_VECTORS, true /* msi64bit */,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
false /*msi_per_vector_mask*/, &amp;err);<br>
&gt; +=C2=A0 =C2=A0 if (ret !=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);<br>
<br>
You can just pass errp to msi_init().<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 @autoreleasepool {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 PGDeviceDescriptor *desc =3D [PGDeviceDes=
criptor new];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 desc.raiseInterrupt =3D ^(uint32_t vector=
) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 apple_gfx_pci_interrupt(dev=
, s, vector);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 apple_gfx_common_realize(&amp;s-&gt;commo=
n, desc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [desc release];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 desc =3D nil;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void apple_gfx_pci_reset(Object *obj, ResetType type)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 AppleGFXPCIState *s =3D APPLE_GFX_PCI(obj);<br>
&gt; +=C2=A0 =C2=A0 [s-&gt;common.pgdev reset];<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void apple_gfx_pci_class_init(ObjectClass *klass, void *data)<=
br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
&gt; +=C2=A0 =C2=A0 PCIDeviceClass *pci =3D PCI_DEVICE_CLASS(klass);<br>
&gt; +=C2=A0 =C2=A0 ResettableClass *rc =3D RESETTABLE_CLASS(klass);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 assert(rc-&gt;phases.hold =3D=3D NULL);<br>
&gt; +=C2=A0 =C2=A0 rc-&gt;phases.hold =3D apple_gfx_pci_reset;<br>
&gt; +=C2=A0 =C2=A0 dc-&gt;desc =3D &quot;macOS Paravirtualized Graphics PC=
I Display Controller&quot;;<br>
&gt; +=C2=A0 =C2=A0 dc-&gt;hotpluggable =3D false;<br>
&gt; +=C2=A0 =C2=A0 set_bit(DEVICE_CATEGORY_DISPLAY, dc-&gt;categories);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pci-&gt;vendor_id =3D PG_PCI_VENDOR_ID;<br>
&gt; +=C2=A0 =C2=A0 pci-&gt;device_id =3D PG_PCI_DEVICE_ID;<br>
&gt; +=C2=A0 =C2=A0 pci-&gt;class_id =3D PCI_CLASS_DISPLAY_OTHER;<br>
&gt; +=C2=A0 =C2=A0 pci-&gt;realize =3D apple_gfx_pci_realize;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 // TODO: Property for setting mode list<br>
&gt; +}<br>
&gt; +<br>
&gt; +static TypeInfo apple_gfx_pci_types[] =3D {<br>
&gt; +=C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D TYPE_APPLE_GFX_PCI,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TY=
PE_PCI_DEVICE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .instance_size =3D sizeof(AppleGFXPCIStat=
e),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D apple_gfx_pc=
i_class_init,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .instance_init =3D apple_gfx_pci_init,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .interfaces =3D (InterfaceInfo[]) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { INTERFACE_PCIE_DEVICE },<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +};<br>
&gt; +DEFINE_TYPES(apple_gfx_pci_types)<br>
&gt; +<br>
&gt; diff --git a/hw/display/meson.build b/hw/display/meson.build<br>
&gt; index 70d855749c0..ceb7bb07612 100644<br>
&gt; --- a/hw/display/meson.build<br>
&gt; +++ b/hw/display/meson.build<br>
&gt; @@ -67,6 +67,7 @@ system_ss.add(when: &#39;CONFIG_ATI_VGA&#39;, if_tru=
e: [files(&#39;ati.c&#39;, &#39;ati_2d.c&#39;, &#39;ati_<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0system_ss.add(when: &#39;CONFIG_MAC_PVG&#39;,=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0if_true: [files(&#39;apple-gfx.m&#39;), pvg, metal])<b=
r>
&gt;=C2=A0 =C2=A0system_ss.add(when: &#39;CONFIG_MAC_PVG_VMAPPLE&#39;, if_t=
rue: [files(&#39;apple-gfx-vmapple.m&#39;), pvg, metal])<br>
&gt; +system_ss.add(when: &#39;CONFIG_MAC_PVG_PCI&#39;,=C2=A0 =C2=A0 =C2=A0=
if_true: [files(&#39;apple-gfx-pci.m&#39;), pvg, metal])<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0if config_all_devices.has_key(&#39;CONFIG_VIRTIO_GPU&#39;)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0virtio_gpu_ss =3D ss.source_set()<br>
<br>
</blockquote></div></div>

--00000000000082b8b406237e9298--

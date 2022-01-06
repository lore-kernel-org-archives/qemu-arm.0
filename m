Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp1148691lfb;
        Thu, 6 Jan 2022 09:21:30 -0800 (PST)
X-Received: by 2002:a05:6000:38b:: with SMTP id u11mr51973750wrf.408.1641489690585;
        Thu, 06 Jan 2022 09:21:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641489690; cv=none;
        d=google.com; s=arc-20160816;
        b=U6QbfdponKRlj0uVNtreIUdD1JritIt6hOyYvD53XeerlWVQXoRoWFiyc5mrtSWBGP
         GFmrDVdyBXGphdbI/NuLtdVGzordRRZnJKA4LOvOLVoaLYmIt4jR+qYCEwv0Z7FvmXco
         pEbeMBdtV7Rw0daBMqBHeXFuz0BT+o30KDnoL6wVvkqkTVDCX/jhm7VBXCsZfY/owlp4
         gmod8GgP3v+EUjnuLue6hGAydcE2PfCbp+6VBe20f/AQSF7S/ovcmLJWSlLoHefXWa8n
         y7EpzobuS7ksGsZgO9cRhsLl+NHdtR5/LlvbOt0GxhiGq4+8MnbHhSMRANXhvAUIWP9K
         PtXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o9TN8PffARdFKUreCcj6V8Ev1eYnWuOCBWna3DEzGZc=;
        b=HwnL2uOQkbp5MjS0lSYS6MpK00VXVTzBidVQ/3zwcuSH77x2mOA8A93CwFhgoudPUx
         XPYdBkiZz9rlL5c3nAUxNxxWF4qg/ZyW22YN0mHbk8LKjrWAt0q/x1ZdSfIUf9iOCHzX
         RpaJLDDvPc+L4c3Ja1o6cWzmocMJOF/jgLZVZE2NCohjjBr6EqGmiqS4BWZV5/Lvpj9+
         mmLHOl9derhWaQgMETC/JvPLiWsXghi0qwpkekAdWlsxYetoH+hQbfXKQ04Yzpuu5Cgb
         W/bMP5dC9K3fjwg0kzTVDPdwhJTOGVG0cbDXclOftzCyifhA4zo8T39qi5EmPhZ3uMjG
         SwsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=exeaDta3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v10sor1486183wrn.71.2022.01.06.09.21.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 06 Jan 2022 09:21:30 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=exeaDta3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=o9TN8PffARdFKUreCcj6V8Ev1eYnWuOCBWna3DEzGZc=;
        b=exeaDta3GCjiVb7YOAg7oUZiQaZn+il7cS1RTIm4fJXnoKxihM9HRL70Af1pyrI5bO
         fWY4e9sd4IzB61VhnFBf7BxPEhVi32+im5UCxmz0PSyIYp2FoKDmpIH7LhWjGflN8Vlj
         iLunB03JgAq/wWBLdK4OfMgUJ6s2t3vGuhNs2JUxtfJC+LdtT30DCMV920YZ3WfQJ8sm
         Uahpo/T6z+vv2eG+I6RWm6scsuMq4Joj5vKuKlFuLC6hkaBWF6nCyq2lORG/uuGJG+1h
         mu77/fMqiT03HchxRPTRQr/VC65qqQz0eZSE1OcnmTxaEmdEtRur/WQTMN/ys0EoNOw+
         +Svg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=o9TN8PffARdFKUreCcj6V8Ev1eYnWuOCBWna3DEzGZc=;
        b=datNm3QH3WbENrGH03Wel/ciMPYqxvOzUnXgCK/fdAJ763eF9lA031uklXYxZsBzUg
         8T8OA+mCv+sV5adFcuzwUGeSMw425CPUfxfd0QgJopo/FjTHkqMG/sYUQBSgZhpD8jkK
         +AU/nyf7f0VQdzJg7wf9Y1s0kXVVBCcFNqxqAoWRMPUgcf0lHUoWGZagiP0zYaLPh+yl
         RKASQnQ4Ycv5HmfQsHpAPPE6a0oa8SkhkgO5mYxpR/xv216ZRm6G48HjlmmND8eZUf1+
         su4IrbnrZ6CNbYTPGNOKKDx4OLumsuVrJ8eCac2XLToJxiJBqIvBBlrKCFHVBDamkeA3
         MOjA==
X-Gm-Message-State: AOAM5325G20vanEhGzcjZlC9Yno4X58TqhaOgLmFNWBpuYrDOz2qL/VQ
	57WZ6aaSmfwIYq0YmSpAuplAq0yv+gKT6s23Ylr2mp/1q4iQzA==
X-Google-Smtp-Source: ABdhPJygGwcXtlw0w2snWzwx/m1GZEqRTBmS4x2nvyS/rdIx7Nx5zrch+MVqI5+QKqmiXY+r00qZVxSFU8r3lMtvjZA=
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr30136904wrv.521.1641489690180;
 Thu, 06 Jan 2022 09:21:30 -0800 (PST)
MIME-Version: 1.0
References: <20220105135009.1584676-1-alex.bennee@linaro.org> <20220105135009.1584676-22-alex.bennee@linaro.org>
In-Reply-To: <20220105135009.1584676-22-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jan 2022 17:21:19 +0000
Message-ID: <CAFEAcA8p69Ws5F+LP9bNYCcw2xpfdHJNh2a-_Cg+KmRr9rthjg@mail.gmail.com>
Subject: Re: [PATCH v1 21/34] hw/arm: add control knob to disable kaslr_seed
 via DTB
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com, 
	f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com, 
	stefanha@redhat.com, crosa@redhat.com, 
	Heinrich Schuchardt <xypron.glpk@gmx.de>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Jerome Forissier <jerome@forissier.org>, "open list:Virt" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 5iYwH9j06IjD

On Wed, 5 Jan 2022 at 14:00, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Generally a guest needs an external source of randomness to properly
> enable things like address space randomisation. However in a trusted
> boot environment where the firmware will cryptographically verify
> components having random data in the DTB will cause verification to
> fail. Add a control knob so we can prevent this being added to the
> system DTB.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Tested-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Acked-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> Acked-by: Jerome Forissier <jerome@forissier.org>
> Message-Id: <20211215120926.1696302-1-alex.bennee@linaro.org>
> ---
>  docs/system/arm/virt.rst |  7 +++++++
>  include/hw/arm/virt.h    |  1 +
>  hw/arm/virt.c            | 32 ++++++++++++++++++++++++++++++--
>  3 files changed, 38 insertions(+), 2 deletions(-)
>
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index 850787495b..c86a4808df 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -121,6 +121,13 @@ ras
>    Set ``on``/``off`` to enable/disable reporting host memory errors to a=
 guest
>    using ACPI and guest external abort exceptions. The default is off.
>
> +kaslr-dtb-seed
> +  Set ``on``/``off`` to pass a random seed via the guest dtb to use for =
features
> +  like address space randomisation. The default is ``on``. You will want
> +  to disable it if your trusted boot chain will verify the DTB it is
> +  passed. It would be the responsibility of the firmware to come up
> +  with a seed and pass it on if it wants to.

We should say what the name of the DTB node is here: it is "kaslr-seed"
(in the "/chosen" and /secure-chosen nodes, if we want to get that
specific).

Side note: it's odd that in naming this proporty we've inserted "dtb" into
the middle of the node name we're controlling the creation of. Maybe
use "dtb-kaslr-seed" ?

> +
>  Linux guest kernel configuration
>  """"""""""""""""""""""""""""""""
>
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index dc6b66ffc8..acd0665fe7 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -148,6 +148,7 @@ struct VirtMachineState {
>      bool virt;
>      bool ras;
>      bool mte;
> +    bool kaslr_dtb_seed;
>      OnOffAuto acpi;
>      VirtGICType gic_version;
>      VirtIOMMUType iommu;
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 6bce595aba..1781e47c76 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -247,11 +247,15 @@ static void create_fdt(VirtMachineState *vms)
>
>      /* /chosen must exist for load_dtb to fill in necessary properties l=
ater */
>      qemu_fdt_add_subnode(fdt, "/chosen");
> -    create_kaslr_seed(ms, "/chosen");
> +    if (vms->kaslr_dtb_seed) {
> +        create_kaslr_seed(ms, "/chosen");
> +    }
>
>      if (vms->secure) {
>          qemu_fdt_add_subnode(fdt, "/secure-chosen");
> -        create_kaslr_seed(ms, "/secure-chosen");
> +        if (vms->kaslr_dtb_seed) {
> +            create_kaslr_seed(ms, "/secure-chosen");
> +        }
>      }
>
>      /* Clock node, for the benefit of the UART. The kernel device tree
> @@ -2235,6 +2239,20 @@ static void virt_set_its(Object *obj, bool value, =
Error **errp)
>      vms->its =3D value;
>  }
>
> +static bool virt_get_kaslr_dtb_seed(Object *obj, Error **errp)
> +{
> +    VirtMachineState *vms =3D VIRT_MACHINE(obj);
> +
> +    return vms->kaslr_dtb_seed;
> +}
> +
> +static void virt_set_kaslr_dtb_seed(Object *obj, bool value, Error **err=
p)
> +{
> +    VirtMachineState *vms =3D VIRT_MACHINE(obj);
> +
> +    vms->kaslr_dtb_seed =3D value;
> +}
> +
>  static char *virt_get_oem_id(Object *obj, Error **errp)
>  {
>      VirtMachineState *vms =3D VIRT_MACHINE(obj);
> @@ -2764,6 +2782,13 @@ static void virt_machine_class_init(ObjectClass *o=
c, void *data)
>                                            "Set on/off to enable/disable =
"
>                                            "ITS instantiation");
>
> +    object_class_property_add_bool(oc, "kaslr-dtb-seed",
> +                                   virt_get_kaslr_dtb_seed,
> +                                   virt_set_kaslr_dtb_seed);
> +    object_class_property_set_description(oc, "kaslr-dtb-seed",
> +                                          "Set off to disable passing of=
 kaslr "

"kaslr-seed", not just "kaslr".

> +                                          "dtb node to guest");
> +
>      object_class_property_add_str(oc, "x-oem-id",
>                                    virt_get_oem_id,
>                                    virt_set_oem_id);
> @@ -2828,6 +2853,9 @@ static void virt_instance_init(Object *obj)

-- PMM

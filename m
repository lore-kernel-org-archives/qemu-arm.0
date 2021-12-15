Received: by 2002:a19:8c50:0:0:0:0:0 with SMTP id i16csp150387lfj;
        Wed, 15 Dec 2021 05:15:59 -0800 (PST)
X-Received: by 2002:a25:77d7:: with SMTP id s206mr5805405ybc.512.1639574159782;
        Wed, 15 Dec 2021 05:15:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639574159; cv=none;
        d=google.com; s=arc-20160816;
        b=A4KVeX5XjAkQou40dId2ZhO1H5sMrjktDnz1qZ6/XAJvZr4Zo94rwBY9txgOkLD1jo
         CvZ8ryMWraA+jhVJUJgiU5q2ioOBGSrpxPeflfz4veaSbb2Guee15OFxCJ6lziBqjMxd
         ANVoCzDXUQHc2nwNiqJTNC9ojlNALwcECL9sW0TYTqJISSnIOwV1bqpVOld0IKHWVnNr
         aiN4h3qqzzHT8jk0rxf9bhv1tztigiWkpHnYUT2bH+gWX/RJnKJdVHYaD34vLNRrg8w7
         ZnWdq843zfEZSJ/yGkVBT76Hw/6o8PoS0JSkHnwPWYlEhLrukAUmA8pKh5+ZCyToWUrL
         yT4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gM6mFIK2UrpQvcXb+mChAgCxKybKifKP5Azjm0zqeB8=;
        b=q4N54RwCYD121YyBvnNjn1HRRCrRTpqkud5aBVY20ePUQslIWKXT+tyTwW0RzpbTQi
         RKFAfAbYDgJXMFkc/OviKbZYSFQk5gtoGX1tCxWxC0i7kPW5wkDD4yLpZCiPPmNIc0G/
         P0o7Ks1krSzK2lNJmn0pnlwpAbP9IIR9JsZwswP0cjdsViu0TEN+qf/OzD51/RbayrmC
         Pi4ykCFsPslxAgvvKgD9kI5LwBPEAGQq8uoNHmh/3Z2p705sp8WDKPyKYjaaxH1f9rCd
         DmMyeMHGFDkPPtuCfq9MbuThnlb5qW6w5jhaTcYEQhqaUoowsfSK9/jX9ojxnnxOIk7V
         dBKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pq5hksYV;
       spf=pass (google.com: domain of ilias.apalodimas@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=ilias.apalodimas@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <ilias.apalodimas@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4sor1025991ybk.117.2021.12.15.05.15.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Dec 2021 05:15:59 -0800 (PST)
Received-SPF: pass (google.com: domain of ilias.apalodimas@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pq5hksYV;
       spf=pass (google.com: domain of ilias.apalodimas@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=ilias.apalodimas@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gM6mFIK2UrpQvcXb+mChAgCxKybKifKP5Azjm0zqeB8=;
        b=Pq5hksYVPGwo7Vw5mZTtqHXgjJQm803IxmjEt7WERURL5/keaPAIrKPDDuTYlXScK8
         zmWNSRl13eRdDivHBsUrPWJqw5Y9mPKIrssyGOselCWHMNIzPiaDBS/ZMaaqDymTggDC
         93X+QKQGumF2jWpfMySdAoJrcET/fp6MVIDbOG6NySsvSSLcvniMswp8kOhcAQNaLks3
         sm4njv3A04dlkigPcJJzTOMDI0A7SZDD4pr7SifN5e1H5e098L3ElZlt11rtqA0cEuhu
         eee/uIXGCcnx85WAZBarQkcQR0v7ah7sfswhEYWXVzPa1DYB7Ug5mSj8YDRIlx3cWA0B
         R7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gM6mFIK2UrpQvcXb+mChAgCxKybKifKP5Azjm0zqeB8=;
        b=cDnuAYTqTzT21of/+gI0aRJrFUKv0hQYQZfV1OImbW/D0CMdZUR9qgGhfCMoAjgsHT
         Njr9viW9/ijNjQLL5emQ26Jx4ax3/1uk2+rUwBj3i8KR+FkRtRrlArCvSvDlq6d72kiE
         qiu44wFd/d8BdCMd7ZXEjqd7hkOzoZ9lVWfZHXbQuHXFnr5b+Na5I47tHLlOpszNplfG
         lfJaNFMY2u06bzB8X5ef/DQKGWdCA7TsAMOlcpEYqj3GX2Ycvvazha6mCb0mV/PD9WiV
         3Yr8CDLziOS8MhXHjXF9JhaxgHF8qaPHLBJnpHDPBt5ecCU3NTbARS1V3Gfha1jhylIO
         3QxQ==
X-Gm-Message-State: AOAM532rgbE83Nyt9CTq4iskbkzp9HAA4nhr5Fo+UkGzC+cZwRApwSEr
	WQZ5zVZ5hYOe/VAfc2w6m3Rl5DeTfdExTukojAqBWpBy/jyUD5IX
X-Google-Smtp-Source: ABdhPJywNhvA3FVevV5ejsIO69dXayAfsk7pk3SadZxSgGfnWJ/JWLP/ORavyrGcZVHvRDNhjMcmZqmnHBq4HczOCzE=
X-Received: by 2002:a25:e792:: with SMTP id e140mr6189596ybh.426.1639574158977;
 Wed, 15 Dec 2021 05:15:58 -0800 (PST)
MIME-Version: 1.0
References: <20211215120926.1696302-1-alex.bennee@linaro.org>
In-Reply-To: <20211215120926.1696302-1-alex.bennee@linaro.org>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Wed, 15 Dec 2021 15:15:22 +0200
Message-ID: <CAC_iWjL6x+qPmWSeeV1QWg=8X5XmXVaCJb99==_1uoyQsOps_w@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: add control knob to disable kaslr_seed via DTB
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Jerome Forissier <jerome@forissier.org>, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: JFaShBGxOpVl

Hi Alex,

On Wed, 15 Dec 2021 at 14:09, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Generally a guest needs an external source of randomness to properly
> enable things like address space randomisation. However in a trusted
> boot environment where the firmware will cryptographically verify
> components having random data in the DTB will cause verification to
> fail. Add a control knob so we can prevent this being added to the
> system DTB.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> Cc: Jerome Forissier <jerome@forissier.org>
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
> index 30da05dfe0..4496612e89 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -248,11 +248,15 @@ static void create_fdt(VirtMachineState *vms)
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
> @@ -2236,6 +2240,20 @@ static void virt_set_its(Object *obj, bool value, =
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
> @@ -2765,6 +2783,13 @@ static void virt_machine_class_init(ObjectClass *o=
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
> +                                          "dtb node to guest");
> +
>      object_class_property_add_str(oc, "x-oem-id",
>                                    virt_get_oem_id,
>                                    virt_set_oem_id);
> @@ -2829,6 +2854,9 @@ static void virt_instance_init(Object *obj)
>      /* MTE is disabled by default.  */
>      vms->mte =3D false;
>
> +    /* Supply a kaslr-seed by default */
> +    vms->kaslr_dtb_seed =3D true;
> +
>      vms->irqmap =3D a15irqmap;
>
>      virt_flash_create(vms);
> --
> 2.30.2
>

This is particularly useful if the bootloader uses a TPM to measures
the DTB and end up with a measured boot flow.

Acked-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>

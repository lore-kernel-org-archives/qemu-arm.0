Received: by 2002:a17:505:790d:b0:1cc9:4ad0:aa2 with SMTP id xu13csp3501527njc;
        Thu, 12 Jun 2025 06:00:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU/bgRDOm33RYtA9WMWN70WMo+xPvOL8w5tNHBUtDPdNPzAFGiP4Ki30Xkfzl32GWNixmyTuPOPMO62hQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHuqvrv35EHBma0hBRvu/gXgVX8hAk7AGuxbwLPL3peBtfvMwaI4nbdYw8A/mN5uqv6CsLC
X-Received: by 2002:a05:622a:1b07:b0:4a5:afa8:b3f with SMTP id d75a77b69052e-4a72421c3e1mr48783791cf.3.1749733207793;
        Thu, 12 Jun 2025 06:00:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749733207; cv=none;
        d=google.com; s=arc-20240605;
        b=C/N1pKNDM8Nu/DbxMptWVDeKvk67dMRkHt9kpjh5RwglgDm8N7dbdzsef3M6p7Z2zu
         aLj/VcHB2WmPC/NS04T4srYrm+/KiOJwWajStyjxvtolMoteAdWPW0BKpyuY5uXqEZIt
         wZ54bjjMkGwwOznftmQwySzsYvOhU2XPINUImukuH+O8d6uWCBy+83Kj4HFTLxc2paYL
         t09Ul5S3CMMe9xdAb+DdUErFfpDU4mZyUR2NccYj4kXYjDXHvXGVMVapH5AxAgBIecPS
         TtVNyOLjF1iQuhKY4Rps4kiLAYvpOdPEKKsv6WgAjc9wVNBLfOVedRCs4hcjjyHfpz1X
         PtSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=fH92qC0y0u58U/A4BiqDiJV9g6M2hdGaoNzYNf1z4QI=;
        fh=B4IR/ZIABinDbt1OylbU8jOBF8xk0qA4WCoCOUSNly8=;
        b=bUQpIT+ypSuYYRozp7jN7S9rbzLXTnVIbIHFgiDsgpggYXcK4kX3EOgOAjJ4xa6ygP
         iK070tjxXAymHbkdjKJG7bYcoDv8yKmbePUSYuYgxvdRHcTH/n+xrWS6lH+IXNDlXD1M
         mkaKcR6vBSpO+QVIuJF9XUhUBD4NF65XnOh7p8m4Cin3YLAMlYUh44X6Uj5wWxkS+7Dg
         +bsNAwcfICUxMi0MTl0ZewZ1OZXyeCLi/GOEkuIHQsYEP4eNhwcYL447FuHjttyy/WLI
         uEeEumgF+K+XouYkvh7tvQIAwwwTnq+re+5NeR4jac/YY7aFJY/j8T38gNvGCVJnJRe2
         KKig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gr756Uio;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a2e718bsi7876721cf.163.2025.06.12.06.00.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:00:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gr756Uio;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749733207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fH92qC0y0u58U/A4BiqDiJV9g6M2hdGaoNzYNf1z4QI=;
	b=Gr756UioX/VDABvpSfxWzutHsC5nQ0Y/6axA4DO8vdx8+EAuGOs+Grt4lCSL3yHdwtCwIx
	ls572gzWp+SXXTlaoMlN1ZRvnVLwt/rrIziDQsvgCcXctYQFkqzjv2CSn4yMy9OGTV4Z4b
	oRQYRyelzNGeSvM/Hj5fC6tXJSlnnjM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-LbJeDOHuP_aL4eyjRwS-PA-1; Thu, 12 Jun 2025 09:00:06 -0400
X-MC-Unique: LbJeDOHuP_aL4eyjRwS-PA-1
X-Mimecast-MFC-AGG-ID: LbJeDOHuP_aL4eyjRwS-PA_1749733205
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f6ff23ccso583107f8f.2
        for <alex.bennee@linaro.org>; Thu, 12 Jun 2025 06:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749733205; x=1750338005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHsAQntFVcsIBCOhWYVLQYkuOn7X5zgs+z7Sw3eNENs=;
        b=iHhF+72hUrTynrjct3NAa4WJ74FcgQEZVUS2xxUuWaUAV42qZFzDHSieyBo1sA6vuM
         t9MQisfhw7+RPK2Hh9CK9rqbMmb9fSsO5UGILyc1xNaVEdXmJnOUkEznyPqVaQM+u1Xw
         EoC3jtthjGlGBUaC+9mO5opC8A7OUF8R4HFGlhGctZNulSlWwmCEQsXOd3SE2EhiLGEY
         bnhDMimwX5QmaEB9Q+zeI4yMIbKX2P1Sgp+FvMYjvFAb4qY0s1/hHodAxYO0aeX3vCXM
         P4c+d13c/3S1LvWA4ZkJIw3yCVVaXaHOlWijI5ev9ecy+34XCpYsbKB/Ct9vlxfuYyio
         5+Hw==
X-Forwarded-Encrypted: i=1; AJvYcCW9fDqRN6vFpMplesBTsRFT+ZpShIGN+wJUkINd2IBsVCIx/6V+npb2AdGA7EkcR6L40RLxVmZUIZtMLQ==@linaro.org
X-Gm-Message-State: AOJu0YyntY8MrIuYiPePcsGJyfn/YXPsJrINbjUwUW+thVReStKLZZ22
	RhYaLMHGyKTPDHlYaOPF0/uKCrXEgptNbHsRz4K1kOfWUf+KaiQSUNItAlrIzAiZ87kxUyYdCtD
	fnTWhUhw2QtWTeLQR70UY82K7fD9rnY0+6ju4xC73/MnCpwsIpo8WKHSQaQ==
X-Gm-Gg: ASbGncvpOj8JaVUnGcd0E8QibYZJ2BrmHxBo1ep4zKoe8ZUbq99Qwafzab5aHiLVtRI
	GJ0/KS7/vf3K3huMCtyuQlMTqyAIdu8awTk9xnbtemIn9ISMMLiuBqo6tPytwHDK8J3XjZmBrYA
	TYIgKR313daCainrJrj2b41L8w+bZcmvQrEXhSDGiZtcDupwe0vgxL5q5BIbBYUjBWalPP04wb8
	2tV7eZHwNy884D2Y9mLNpYRPkmAsZnd6xT2I/kRsmbF/w91EQ5eMHekoGiylTzzSOf1gLDapuOi
	2JT0nKjwQpfYC/+2iiUyVugKaM3e88l/jDMwNwzdSaI=
X-Received: by 2002:a05:6000:1a86:b0:3a5:2923:8006 with SMTP id ffacd0b85a97d-3a5587fe1f6mr5968716f8f.25.1749733204747;
        Thu, 12 Jun 2025 06:00:04 -0700 (PDT)
X-Received: by 2002:a05:6000:1a86:b0:3a5:2923:8006 with SMTP id ffacd0b85a97d-3a5587fe1f6mr5968663f8f.25.1749733203954;
        Thu, 12 Jun 2025 06:00:03 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a56198f827sm1901683f8f.29.2025.06.12.06.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:00:03 -0700 (PDT)
Date: Thu, 12 Jun 2025 15:00:02 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 02/25] hw/arm/virt: Introduce machine state acpi
 pcihp flags and props
Message-ID: <20250612150002.6bd9b330@imammedo.users.ipa.redhat.com>
In-Reply-To: <b0be20a1-6b7f-4a0a-a228-b2f0eaca88e1@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-3-eric.auger@redhat.com>
	<20250527135813.2d6cde91@imammedo.users.ipa.redhat.com>
	<6374e8f1-8eee-49cb-9c7f-75aaed1a0f08@redhat.com>
	<20250611104915.5a5a2bea@imammedo.users.ipa.redhat.com>
	<b0be20a1-6b7f-4a0a-a228-b2f0eaca88e1@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BjiZOGNE0cYrNqu0OFymx-CX5XfIjcqOPGE4TxRJuRY_1749733205
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: pRhbRzo9fSHl

On Wed, 11 Jun 2025 10:56:36 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> On 6/11/25 10:49 AM, Igor Mammedov wrote:
> > On Wed, 11 Jun 2025 08:47:36 +0200
> > Eric Auger <eric.auger@redhat.com> wrote:
> > =20
> >> Hi Igor,
> >>
> >> On 5/27/25 1:58 PM, Igor Mammedov wrote: =20
> >>> On Tue, 27 May 2025 09:40:04 +0200
> >>> Eric Auger <eric.auger@redhat.com> wrote:
> >>>   =20
> >>>> acpi_pcihp VirtMachineClass state flag will allow
> >>>> to opt in for acpi pci hotplug. This is guarded by a
> >>>> class no_acpi_pcihp flag to manage compats (<=3D 10.0
> >>>> machine types will not support ACPI PCI hotplug).   =20
> >>> there is no reason to put an effort in force disabling it
> >>> on old machines, as long as code works when explicitly
> >>> enabled property on CLI.
> >>>
> >>> See comment below on how to deal with it=20
> >>>   =20
> >>>> Machine state acpi_pcihp flag must be set before the creation
> >>>> of the GED device which will use it.
> >>>>
> >>>> Currently the ACPI PCI HP is turned off by default. This will
> >>>> change later on for 10.1 machine type.   =20
> >>> one thing to note, is that turning it on by default might
> >>> cause change of NIC naming in guest as this brings in
> >>> new "_Sxx" slot naming. /so configs tied to nic  go down the drain/
> >>>
> >>> Naming, we have, also happens to be broken wrt spec
> >>> (it should be unique system wide, there was a gitlab issue for that,
> >>> there is no easy fix that though)
> >>>
> >>> So I'd leave it disabled by default and let users to turn
> >>> it on explicitly when needed.=20
> >>>   =20
> >>>> We also introduce properties to allow disabling it.
> >>>>
> >>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>>> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
> >>>> ---
> >>>>  include/hw/arm/virt.h |  2 ++
> >>>>  hw/arm/virt.c         | 27 +++++++++++++++++++++++++++
> >>>>  2 files changed, 29 insertions(+)
> >>>>
> >>>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> >>>> index 9a1b0f53d2..10ea581f06 100644
> >>>> --- a/include/hw/arm/virt.h
> >>>> +++ b/include/hw/arm/virt.h
> >>>> @@ -129,6 +129,7 @@ struct VirtMachineClass {
> >>>>      bool no_tcg_lpa2;
> >>>>      bool no_ns_el2_virt_timer_irq;
> >>>>      bool no_nested_smmu;
> >>>> +    bool no_acpi_pcihp;
> >>>>  };
> >>>> =20
> >>>>  struct VirtMachineState {
> >>>> @@ -150,6 +151,7 @@ struct VirtMachineState {
> >>>>      bool mte;
> >>>>      bool dtb_randomness;
> >>>>      bool second_ns_uart_present;
> >>>> +    bool acpi_pcihp;
> >>>>      OnOffAuto acpi;
> >>>>      VirtGICType gic_version;
> >>>>      VirtIOMMUType iommu;
> >>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >>>> index 9a6cd085a3..a0deeaf2b3 100644
> >>>> --- a/hw/arm/virt.c
> >>>> +++ b/hw/arm/virt.c
> >>>> @@ -2397,8 +2397,10 @@ static void machvirt_init(MachineState *machi=
ne)
> >>>>      create_pcie(vms);
> >>>> =20
> >>>>      if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabl=
ed(vms)) {
> >>>> +        vms->acpi_pcihp &=3D !vmc->no_acpi_pcihp;   =20
> >>> I don't particularly like no_foo naming as it makes code harder to re=
ad
> >>> and combined with 'duplicated' field in machine state it make even th=
ings worse.
> >>> (if I recall right Philippe was cleaning mess similar flags usage
> >>> have introduced with ITS)
> >>>
> >>> instead of adding machine property (both class and state),
> >>> I'd suggest adding the only property to GPE device (akin to what we h=
ave in x86 world)
> >>> And then one can meddle with defaults using hw_compat_xxx   =20
> >> What I fail to understand is whether you want me to attach this proper=
ty
> >> to the GPEX host bridge device or to the GED device. Comment on patch =
=20
> > I'd say GED.
> > =20
> >> 6/25 seems to indicate you expect it to be attached to the GPEX. I ask
> >> here because also the GED device will need to be configured depending =
on
> >> the hp setting. Maybe we can retrieve the info from the gpex at that
> >> time. on x86 it is attached to piix4 or ich9 I/O controller hub which =
do
> >> not have direct equivalent on ARM. =20
> > for ARM, equivalent would be GED device which hosts our paravirt acpi r=
egisters. =20
>=20
> OK thank you for the clarification. I will add a property to the GED devi=
ce.
>=20
> As the GED device is directly instantiated by the virt machine code (not
> exposed to the end user CLI) I guess we still want a virt machine option
> that would allow to set the property explicitly from CLI?

Instead of machine option,
I'd go pc/q35 way (aka -global ged.acpi-pci-hotplug-with-bridges=3Don/off).
it's not as pretty as machine specific option but that would work just as w=
ell
and as bonus could be used for microvm in the same form.

>=20
> Thanks
>=20
> Eric =C2=A0
> > =20
> >> Thanks
> >>
> >> Eric =20
> >>>   =20
> >>>>          vms->acpi_dev =3D create_acpi_ged(vms);
> >>>>      } else {
> >>>> +        vms->acpi_pcihp =3D false;
> >>>>          create_gpio_devices(vms, VIRT_GPIO, sysmem);
> >>>>      }
> >>>> =20
> >>>> @@ -2593,6 +2595,20 @@ static void virt_set_its(Object *obj, bool va=
lue, Error **errp)
> >>>>      vms->its =3D value;
> >>>>  }
> >>>> =20
> >>>> +static bool virt_get_acpi_pcihp(Object *obj, Error **errp)
> >>>> +{
> >>>> +    VirtMachineState *vms =3D VIRT_MACHINE(obj);
> >>>> +
> >>>> +    return vms->acpi_pcihp;
> >>>> +}
> >>>> +
> >>>> +static void virt_set_acpi_pcihp(Object *obj, bool value, Error **er=
rp)
> >>>> +{
> >>>> +    VirtMachineState *vms =3D VIRT_MACHINE(obj);
> >>>> +
> >>>> +    vms->acpi_pcihp =3D value;
> >>>> +}
> >>>> +
> >>>>  static bool virt_get_dtb_randomness(Object *obj, Error **errp)
> >>>>  {
> >>>>      VirtMachineState *vms =3D VIRT_MACHINE(obj);
> >>>> @@ -3310,6 +3326,10 @@ static void virt_machine_class_init(ObjectCla=
ss *oc, const void *data)
> >>>>                                            "in ACPI table header."
> >>>>                                            "The string may be up to =
8 bytes in size");
> >>>> =20
> >>>> +    object_class_property_add_bool(oc, "acpi-pcihp",
> >>>> +                                   virt_get_acpi_pcihp, virt_set_ac=
pi_pcihp);
> >>>> +    object_class_property_set_description(oc, "acpi-pcihp",
> >>>> +                                          "Force ACPI PCI hotplug")=
;
> >>>>  }
> >>>> =20
> >>>>  static void virt_instance_init(Object *obj)
> >>>> @@ -3344,6 +3364,9 @@ static void virt_instance_init(Object *obj)
> >>>>          vms->tcg_its =3D true;
> >>>>      }
> >>>> =20
> >>>> +    /* default disallows ACPI PCI hotplug */
> >>>> +    vms->acpi_pcihp =3D false;
> >>>> +
> >>>>      /* Default disallows iommu instantiation */
> >>>>      vms->iommu =3D VIRT_IOMMU_NONE;
> >>>> =20
> >>>> @@ -3394,8 +3417,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(10, 1)
> >>>> =20
> >>>>  static void virt_machine_10_0_options(MachineClass *mc)
> >>>>  {
> >>>> +    VirtMachineClass *vmc =3D VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> >>>> +
> >>>>      virt_machine_10_1_options(mc);
> >>>>      compat_props_add(mc->compat_props, hw_compat_10_0, hw_compat_10=
_0_len);
> >>>> +    /* 10.0 and earlier do not support ACPI PCI hotplug */
> >>>> +    vmc->no_acpi_pcihp =3D true;
> >>>>  }
> >>>>  DEFINE_VIRT_MACHINE(10, 0)
> >>>>     =20
>=20

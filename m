Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp23577nji;
        Thu, 11 Jul 2024 01:34:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXR7XA9qGn6fOgFCwSSR1kT20wi1oylGQnlc/lpY4FqYXjG4PYPaNcwSExpdYgYwSKmcos/bESNTxu71T+2Z1NhSAuiJOMQ
X-Google-Smtp-Source: AGHT+IEcSRgMIL0h3Yomnwl8pDzLdNvIgmA7u8RmALRwvfxdpIdhNHgYcPxrO4jz+a75Gk+s8xKj
X-Received: by 2002:a05:6102:548e:b0:48f:de68:aaf2 with SMTP id ada2fe7eead31-490320fa47fmr9618362137.2.1720686850915;
        Thu, 11 Jul 2024 01:34:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720686850; cv=none;
        d=google.com; s=arc-20160816;
        b=npfzuB12+8+Kgelylv5cIcZsAE7sLf+Wi0/BszypvPgzKcz9tU+9Fh/6Xk5qT5V/6G
         B8Lu4CeeDNy5SGNOVTYVW9/pDOW4jfzvpjFgMpz1pbmrTZ5KPH9Nv33g4ioqjezZP1EM
         7dnSSxWlKwYqCBsjT8bStu7SwXYD3U9DcSMpqxZMQRnKHimjRzlgNMQtxgBkICPUSuDS
         vLhqgyJ6sj777vLJ4w0C2hmPfyHt6GH5h5XCi/4Jmv8DMEk34nrHt/iS0dA78kGnJ3n7
         rRYtwVGTlyNpddegZIXBmEafOUyjSSW3sJbl7D4cIc8I+46j3gkFU6w4fVH/TK5XcaFS
         jNUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=tfF5OAfR4Vv58tr32S4sEWqUl6l5NtS7Fdu5jdD2AfU=;
        fh=pu6LwCjdA8ZQ1LvhIyw/BFDOiLBJyy8Jqox68ynWqSg=;
        b=gE7hkD32keuTzqaNNhI9C7FD4Kn4S4kmpVL5guZYoQm/hl9zgY90Wq7Pcs6BFBrWxV
         ue8colDwF0LoMdNfKBgHx4RdfgeqiNd0JnBe+EaYKHc0D6KlvynTfkbkzYWdnkDvi5OA
         0o/Mgz0Y4AVP2r+JKizZD1rjojYqIgYXiRy+uDnqMRu8gkvWleRN+6f0PBoXIN1d8Y88
         wUIo7sgBK9f95IgyA0IzHiCxJzsCpo06NnV1ZXBJuFRaCWMImAZdmJCbqpUvQI5oYEas
         zNGChPUEe9aGJI7Pb7szBK6wLoya+aW+kqTDkj5++DpyOKof9ppLR99B52xz/I8K/QO/
         gp3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ftmEivox;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9c16d7csi64668071cf.738.2024.07.11.01.34.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 01:34:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ftmEivox;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720686850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tfF5OAfR4Vv58tr32S4sEWqUl6l5NtS7Fdu5jdD2AfU=;
	b=ftmEivox/ArahYibVDvanvjegbH2xxfoBi0yeZ9nYrcezZuUOvtGJpoRXlDLd8Jw6LJqO9
	C9XnycclvHUn6mQitxzLjr7gzeXxqXsCZysofhtkNbMtdpNBz9nljbo9arOWN9XKA/NSFo
	Jk/d4+LrnpDg6JaY6cVAUyTtVh0RRHM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-tH3zJv7ePdyZ4wDg0f010A-1; Thu, 11 Jul 2024 04:34:07 -0400
X-MC-Unique: tH3zJv7ePdyZ4wDg0f010A-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-42668699453so5152945e9.3
        for <alex.bennee@linaro.org>; Thu, 11 Jul 2024 01:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720686847; x=1721291647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgRGGHIvVigTmy/ErLoS/r17TRefdo47N3uPDdzUXM4=;
        b=X43hMYv6ZGeCKBem2zT1eJU4tH5KfmPVpshtPLSVerUE/a5kV59s/SRKUosL3yIHk4
         t5fg8kqfJZuRgvFJ8922W1xVf7f+0hor3ZrSvgqatd9xUkzRtZRL3Ar2S9VhsQbnZyaZ
         uJSW3Lufncvq7CZ7bWhnIXxCCgUZwRpWrUkMyXHl0wQT+ZTyvUx4TzSaW5p1FF44PR94
         Zep1ElzKKqS6HoFDCDScU9XNpOVUNxr0XAsMCw2BFk5DqmZPGT4p3d0CnDSNHUzCE1Gc
         4Z1gL9r1mY1MS/TLZ+Jr4KUIhXtUuLkLOsU54PjNQSw5ydZQig57xn9LcTyMkkm2RIkz
         PUig==
X-Forwarded-Encrypted: i=1; AJvYcCVtU1x2PQdrOq4AaWdiwpiQ2P6DVXy+8Astpq287idoPaYKYOz/GdaSpie6WmWyVMo51/vIRdM/OGaH3iKbyIf0xuSiDg+q
X-Gm-Message-State: AOJu0YxDi36jcKRB/vTar6kY2KyQgbHYsiqwyqKtJmLzwlVylAZwz9yG
	ta3mXVHPEuZhEW0Ic6ffMnCNeX07dYdeMcTg3NEdL4HWHnHvavhlbI69TkYJGdc+w33nqC57b+h
	cLo4OXR+Ab1mumEClxsGJjdZw+PIrrckr4cSaZZS4lmO83diCdQ9Y2A==
X-Received: by 2002:a05:600c:4baa:b0:426:5e1c:1ac2 with SMTP id 5b1f17b1804b1-426706c656bmr73092805e9.8.1720686846702;
        Thu, 11 Jul 2024 01:34:06 -0700 (PDT)
X-Received: by 2002:a05:600c:4baa:b0:426:5e1c:1ac2 with SMTP id 5b1f17b1804b1-426706c656bmr73092455e9.8.1720686846217;
        Thu, 11 Jul 2024 01:34:06 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279484a9d9sm54403965e9.5.2024.07.11.01.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 01:34:05 -0700 (PDT)
Date: Thu, 11 Jul 2024 10:34:03 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@opnsrc.net>
Cc: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, maz@kernel.org, jean-philippe@linaro.org,
 jonathan.cameron@huawei.com, lpieralisi@kernel.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 andrew.jones@linux.dev, david@redhat.com, philmd@linaro.org,
 eric.auger@redhat.com, oliver.upton@linux.dev, pbonzini@redhat.com,
 mst@redhat.com, will@kernel.org, gshan@redhat.com, rafael@kernel.org,
 alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, zhukeqian1@huawei.com, wangxiongfeng2@huawei.com,
 wangyanan55@huawei.com, jiakernel2@gmail.com, maobibo@loongson.cn,
 lixianglai@loongson.cn, npiggin@gmail.com, harshpb@linux.ibm.com,
 linuxarm@huawei.com, Shaoqin Huang <shahuang@redhat.com>, Zhao Liu
 <zhao1.liu@intel.com>
Subject: Re: [PATCH V13 4/8] hw/acpi: Update GED _EVT method AML with CPU
 scan
Message-ID: <20240711103403.2eadac1e@imammedo.users.ipa.redhat.com>
In-Reply-To: <27cc0420-df0b-481e-a58f-e17fa4d02367@opnsrc.net>
References: <20240607115649.214622-1-salil.mehta@huawei.com>
	<20240607115649.214622-5-salil.mehta@huawei.com>
	<20240706162845.3baf5568@imammedo.users.ipa.redhat.com>
	<27cc0420-df0b-481e-a58f-e17fa4d02367@opnsrc.net>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 2uy6cUePYwbq

On Thu, 11 Jul 2024 03:29:40 +0000
Salil Mehta <salil.mehta@opnsrc.net> wrote:

> Hi Igor,
>=20
>=20
> On 06/07/2024 14:28, Igor Mammedov wrote:
> > On Fri, 7 Jun 2024 12:56:45 +0100
> > Salil Mehta <salil.mehta@huawei.com> wrote:
> > =20
> >> OSPM evaluates _EVT method to map the event. The CPU hotplug event eve=
ntually
> >> results in start of the CPU scan. Scan figures out the CPU and the kin=
d of
> >> event(plug/unplug) and notifies it back to the guest. Update the GED A=
ML _EVT
> >> method with the call to \\_SB.CPUS.CSCN
> >>
> >> Also, macro CPU_SCAN_METHOD might be referred in other places like dur=
ing GED
> >> intialization so it makes sense to have its definition placed in some =
common
> >> header file like cpu_hotplug.h. But doing this can cause compilation b=
reak
> >> because of the conflicting macro definitions present in cpu.c and cpu_=
hotplug.c =20
> > one of the reasons is that you reusing legacy hw/acpi/cpu_hotplug.h,
> > see below for suggestion.
> > =20
> >> and because both these files get compiled due to historic reasons of x=
86 world
> >> i.e. decision to use legacy(GPE.2)/modern(GED) CPU hotplug interface h=
appens
> >> during runtime [1]. To mitigate above, for now, declare a new common m=
acro
> >> ACPI_CPU_SCAN_METHOD for CPU scan method instead.
> >> (This needs a separate discussion later on for clean-up)
> >>
> >> Reference:
> >> [1] https://lore.kernel.org/qemu-devel/1463496205-251412-24-git-send-e=
mail-imammedo@redhat.com/
> >>
> >> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> >> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> >> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> >> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> >> Reviewed-by: Gavin Shan <gshan@redhat.com>
> >> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> >> Tested-by: Xianglai Li <lixianglai@loongson.cn>
> >> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> >> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> >> Tested-by: Zhao Liu <zhao1.liu@intel.com>
> >> ---
> >>   hw/acpi/cpu.c                  | 2 +-
> >>   hw/acpi/generic_event_device.c | 4 ++++
> >>   include/hw/acpi/cpu_hotplug.h  | 2 ++
> >>   3 files changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> >> index 473b37ba88..af2b6655d2 100644
> >> --- a/hw/acpi/cpu.c
> >> +++ b/hw/acpi/cpu.c
> >> @@ -327,7 +327,7 @@ const VMStateDescription vmstate_cpu_hotplug =3D {
> >>   #define CPUHP_RES_DEVICE  "PRES"
> >>   #define CPU_LOCK          "CPLK"
> >>   #define CPU_STS_METHOD    "CSTA"
> >> -#define CPU_SCAN_METHOD   "CSCN"
> >> +#define CPU_SCAN_METHOD   ACPI_CPU_SCAN_METHOD
> >>   #define CPU_NOTIFY_METHOD "CTFY"
> >>   #define CPU_EJECT_METHOD  "CEJ0"
> >>   #define CPU_OST_METHOD    "COST"
> >> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_de=
vice.c
> >> index 54d3b4bf9d..63226b0040 100644
> >> --- a/hw/acpi/generic_event_device.c
> >> +++ b/hw/acpi/generic_event_device.c
> >> @@ -109,6 +109,10 @@ void build_ged_aml(Aml *table, const char *name, =
HotplugHandler *hotplug_dev,
> >>                   aml_append(if_ctx, aml_call0(MEMORY_DEVICES_CONTAINE=
R "."
> >>                                                MEMORY_SLOT_SCAN_METHOD=
));
> >>                   break;
> >> +            case ACPI_GED_CPU_HOTPLUG_EVT:
> >> +                aml_append(if_ctx, aml_call0(ACPI_CPU_CONTAINER "."
> >> +                                             ACPI_CPU_SCAN_METHOD)); =
=20
> > I don't particularly like exposing cpu hotplug internals for outside co=
de
> > and then making that code do plumbing hoping that nothing will explode
> > in the future.
> >
> > build_cpus_aml() takes event_handler_method to create a method that
> > can be called by platform. What I suggest is to call that method here
> > instead of trying to expose CPU hotplug internals and manually building
> > call path here.
> > aka:
> >    build_cpus_aml(event_handler_method =3D PATH_TO_GED_DEVICE.CSCN)
> > and then call here
> >    aml_append(if_ctx, aml_call0(CSCN));
> > which will call  CSCN in GED scope, that was be populated by
> > build_cpus_aml() to do cpu scan properly without need to expose
> > cpu hotplug internal names and then trying to fixup conflicts caused by=
 that.
> >
> > PS:
> > we should do the same for memory hotplug, we see in context above =20
>=20
> In the x86 world and ARM, two different types of event handling=20
> mechanisms are
> used: one based on GPE and the other on GED. The latter has its own=20
> placeholder
> within the generic_event_device.c file, which also multiplexes other GED=
=20
> events.
> Multiplexing AMLs for two different types of handlers into=20
> build_cpus_aml() seems
> to be a fundamental mistake here. For CPU handling, this should also not=
=20
> be done
> because x86 deals with legacy hotplug and modern hotplug differently but=
=20
> still
> uses the same GPE-based event handling for both. Moreover, which type of=
=20
> handler
> should be used depends upon the context from which build_cpus_aml() is=20
> called
> and it would be ugly to demultiplex these inside the build_cpus_aml() cod=
e.
>
> Therefore, my suggestion is:
> 1. Keep the CPU=E2=80=99s _EVT handling code in the generic_event_device.=
c as it is.
> 2. Pull out the event handler method and CPU scan call-related=20
> initialization entirely
>  =C2=A0=C2=A0=C2=A0 out of the CPU=E2=80=99s AML code (i.e., both in buil=
d_cpus_aml() and=20
> build_legacy_cpu_hotplug_aml()).
> 3. Remove the input parameter of event_handler in build_cpus_aml().
> 4. Create a separate function like build_gpe_aml() and use this function=
=20
> in the
>  =C2=A0 =C2=A0=C2=A0 following places:
>=20
> File: hw/i386/acpi-build.c

I'm not convinced by above arguments yet (perhaps I don't see a problem
you are observing), so I'd like to keep cpu hotplug isolated/not exposed
as much as possible unless it's proven that it will not work as is.
(see for more below)=20
=20
> build_dsdt()
> {
>  =C2=A0=C2=A0 [...]
>  =C2=A0=C2=A0=C2=A0 scope =3D=C2=A0 aml_scope("_GPE");
>  =C2=A0=C2=A0 [...]
>  =C2=A0=C2=A0=C2=A0 aml_append(dsdt, scope);
>=20
>  =C2=A0=C2=A0=C2=A0 if (pcmc->legacy_cpu_hotplug) {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build_legacy_cpu_hotplug_aml(=
dsdt, machine, pm->cpu_hp_io_base);
>  =C2=A0=C2=A0=C2=A0 } else {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPUHotplugFeatures opts =3D {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .acpi=
_1_compatible =3D true, .has_legacy_cphp =3D true,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .smi_=
path =3D pm->smi_on_cpuhp ? "\\_SB.PCI0.SMI0.SMIC" : NULL,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fw_u=
nplugs_cpu =3D pm->smi_on_cpu_unplug,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build_cpus_aml(dsdt, machine,=
 opts, pc_madt_cpu_entry,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm->cpu_hp_io_=
base, "\\_SB.PCI0", "\\_GPE._E02");
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm->cpu_hp_io_base, =
"\\_SB.PCI0");
> + =C2=A0=C2=A0=C2=A0=C2=A0 build_gpe_aml(...,, ,"\\_GPE._E02")
>=20
>  =C2=A0=C2=A0=C2=A0 }
>  =C2=A0=C2=A0 [...]
> }
>=20
> File: hw/acpi/cpu.c
>=20
> @@ -343,9 +343,10 @@ const VMStateDescription vmstate_cpu_hotplug =3D {
>  =C2=A0#define CPU_FW_EJECT_EVENT "CEJF"
>=20
>  =C2=A0void build_cpus_aml(Aml *table, MachineState *machine,=20
> CPUHotplugFeatures opts,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build_madt_cpu_fn build_madt_cpu=
, hwaddr io_base,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build_madt_cpu_fn build_madt_cpu=
, hwaddr base_addr,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *res_root,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *event_handler_method=
)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AmlRegionSpace rs)
>  =C2=A0{
>  =C2=A0=C2=A0=C2=A0=C2=A0 Aml *ifctx;
>  =C2=A0=C2=A0=C2=A0=C2=A0 Aml *field;
>=20
>=20
> That said, if you still wish you proceed with your suggestions I can go
> ahead and do it but please understand that I'll have to put a check
> to avoid adding call to CPU Scan for am/virt platform since we would
> want to add that call as part of the GED/AML code. This is unnecessary
> and would look ugly.
I just don't get why you have to call CPU Scan explicitly from arm/virt
side. (maybe my suggestion was lost in translation/was not clear enough)
Let's pretend that hw/i386/acpi-build.c is an arm/virt code and demo
what I was suggesting.


diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.=
c
index 2d6e91b124..33addb6275 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -117,6 +117,9 @@ void build_ged_aml(Aml *table, const char *name, Hotplu=
gHandler *hotplug_dev,
                            aml_notify(aml_name("\\_SB.NVDR"),
                                       aml_int(0x80)));
                 break;
+            case ACPI_GED_CPU_HOTPLUG_EVT:
+                aml_append(if_ctx, aml_call0("\\_SB.GED.CPEV"));
+                break
             default:
                 /*
                  * Please make sure all the events in ged_supported_events=
[]
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index f4e366f64f..8b4f422652 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1536,7 +1536,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             .fw_unplugs_cpu =3D pm->smi_on_cpu_unplug,
         };
         build_cpus_aml(dsdt, machine, opts, pc_madt_cpu_entry,
-                       pm->cpu_hp_io_base, "\\_SB.PCI0", "\\_GPE._E02");
+                       pm->cpu_hp_io_base, "\\_SB.PCI0", "\\_SB.GED.CPEV")=
;
     }
=20
this way build_cpus_aml() will create and populate with scan
\\_SB.GED.CPEV method.

which is then called by=20
GED._EVT()
    ...
    if cpuhotplug
          \\_SB.GED.CPEV()
    ...

there is no multiplexing of cpuhp event in build_cpus_aml,
the only event multiplexer is GED._EVT() as it should be.
And you don't have to expose cpu hotplug internals to any
other place[s].

PS:
For legacy cphp handling acpi/cpu.c has only _INI method
that is created when opts.has_legacy_cphp is true.
we should be able to get rid of it when 2.6 machine type is removed.
But ARM [or anything else] don't have to be aware of it
if you use static initializer like it's done in hw/i386/acpi-build.c
and just ignore non relevant fields.



> Thanks
> Salil.
>=20
>=20
> >
> > =20
> >> +                break;
> >>               case ACPI_GED_PWR_DOWN_EVT:
> >>                   aml_append(if_ctx,
> >>                              aml_notify(aml_name(ACPI_POWER_BUTTON_DEV=
ICE),
> >> diff --git a/include/hw/acpi/cpu_hotplug.h b/include/hw/acpi/cpu_hotpl=
ug.h
> >> index 48b291e45e..ef631750b4 100644
> >> --- a/include/hw/acpi/cpu_hotplug.h
> >> +++ b/include/hw/acpi/cpu_hotplug.h
> >> @@ -20,6 +20,8 @@
> >>   #include "hw/acpi/cpu.h"
> >>  =20
> >>   #define ACPI_CPU_HOTPLUG_REG_LEN 12
> >> +#define ACPI_CPU_SCAN_METHOD "CSCN"
> >> +#define ACPI_CPU_CONTAINER "\\_SB.CPUS"
> >>  =20
> >>   typedef struct AcpiCpuHotplug {
> >>       Object *device; =20
>=20

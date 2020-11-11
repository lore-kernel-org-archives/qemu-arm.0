Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2044065lfb;
        Fri, 13 Nov 2020 23:38:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzoy+gKdRiiIIYo4xRckE0/hLFfTDdLKZCix+WEVtnZHDFKLKd/ntYYRZjukeHDD25lyCDF
X-Received: by 2002:a25:d215:: with SMTP id j21mr7779311ybg.279.1605339508822;
        Fri, 13 Nov 2020 23:38:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605339508; cv=none;
        d=google.com; s=arc-20160816;
        b=Z6oa4AjRtSRx9lQQzs/UWIt25ueYQWR3O09ORKBUVLii4xlkyGrkpr+QTmFWXTikUm
         jXufGOq7QiSxxeF2mbtRSsNMlpvYz0xLrrvq04jqLw8V49fGWvJKlFDHXawRH7BVXdfn
         dbXCWh1TqZF4IP0rTYbjLkoEGBooF8IUB+cEQrsAOWTf8g044pYxg3TFI6V2gV6fxiKV
         ctZcqrGdpe2vvVNC3hxgr7+lz26UVnMKwsbcpmhhx85VA5V6zkIvdB1VSJITZZ45BSCQ
         t56sg7bfAWznr2Aaary5P7bIarPf/iHLMAVx6JFlnY8T8wOIA/Ou0hrLc7laYfGNzp2f
         T2SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=2b4HgxxHSxNPioZafC0IxGG2LvZdrMaxAgZMC15c8Lc=;
        b=ZAPImBtYgllnVOQX1iCVEQC41B4c/AKhi5pKwriNAuwJ6UNbPZN7+UWvrGtDnhjCTg
         iYwPybzMydJ3fBzz87HoHynIyk6gCg+xIl+xoee4u1OXUfL46q9I9u6yr8sNy3CC+zX8
         ykLiTCoIXjruJ2M4oo2qyS8rw5Rir0GWTUMVbpnaHY4TVYAlRc3jX2QHakt1jAC1j5Jr
         tgatSIMBAuAJsplek60yGzlQokSJbB0zUURcN2hj672qUpUVxt9/ylAJkix4QfxjKNsy
         AWYcQpBzMDM9lfRUIcpVk9k3/xcqylw1hFDwPXqkEYToKxoyC2KSrgm16I0/CGHpplhL
         SNfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=JFJVvILA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n14si10053243ybp.224.2020.11.13.23.38.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Nov 2020 23:38:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=JFJVvILA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kdq8i-0004ps-68
	for alex.bennee@linaro.org; Sat, 14 Nov 2020 02:38:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kdq8X-0004ow-TH; Sat, 14 Nov 2020 02:38:17 -0500
Received: from ozlabs.org ([203.11.71.1]:50521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kdq8U-0005B5-Hc; Sat, 14 Nov 2020 02:38:17 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CY6cz1fG9z9sRK; Sat, 14 Nov 2020 18:37:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1605339475;
 bh=HOcAm1kcHQWQ4kPbM1yLhI31TBMH1JE1+MlfTkljhBE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JFJVvILAiKpJ0YQkwyXZ8fGs/3FGgjBi8gFl10BCT37gKgSCIq28Ngme16nVFEMa9
 vwMSgT9/+/T+zujnWJ2f+6RV9GN8thqZjvwxpzdOvn1pMhmapbIOI/c/8dXVu17Wt7
 BywTWZ1xJ124F8QVE9ApnMUucRaUuuJ9TfeJ2W2k=
Date: Wed, 11 Nov 2020 17:21:53 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH] hw: add compat machines for 6.0
Message-ID: <20201111062153.GB396466@yekko.fritz.box>
References: <20201109173928.1001764-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IiVenqGWf+H9Y6IX"
Content-Disposition: inline
In-Reply-To: <20201109173928.1001764-1-cohuck@redhat.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/14 02:37:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FAiqawclQcaO


--IiVenqGWf+H9Y6IX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2020 at 06:39:28PM +0100, Cornelia Huck wrote:
> Add 6.0 machine types for arm/i440fx/q35/s390x/spapr.

ppc part
Acked-by: David Gibson <david@gibson.dropbear.id.au>

>=20
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  hw/arm/virt.c              |  9 ++++++++-
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  9 files changed, 71 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 27dbeb549ef1..d21dad4491c4 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2587,10 +2587,17 @@ static void machvirt_machine_init(void)
>  }
>  type_init(machvirt_machine_init);
> =20
> +static void virt_machine_6_0_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(6, 0)
> +
>  static void virt_machine_5_2_options(MachineClass *mc)
>  {
> +    virt_machine_6_0_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
>  }
> -DEFINE_VIRT_MACHINE_AS_LATEST(5, 2)
> +DEFINE_VIRT_MACHINE(5, 2)
> =20
>  static void virt_machine_5_1_options(MachineClass *mc)
>  {
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 98b87f76cbbe..c5a6c517bb9d 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -28,6 +28,9 @@
>  #include "hw/mem/nvdimm.h"
>  #include "migration/vmstate.h"
> =20
> +GlobalProperty hw_compat_5_2[] =3D {};
> +const size_t hw_compat_5_2_len =3D G_N_ELEMENTS(hw_compat_5_2);
> +
>  GlobalProperty hw_compat_5_1[] =3D {
>      { "vhost-scsi", "num_queues", "1"},
>      { "vhost-user-blk", "num-queues", "1"},
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 5e6c0023e0c7..d386c5662698 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -97,6 +97,9 @@
>  #include "trace.h"
>  #include CONFIG_DEVICES
> =20
> +GlobalProperty pc_compat_5_2[] =3D {};
> +const size_t pc_compat_5_2_len =3D G_N_ELEMENTS(pc_compat_5_2);
> +
>  GlobalProperty pc_compat_5_1[] =3D {
>      { "ICH9-LPC", "x-smi-cpu-hotplug", "off" },
>  };
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 13d1628f13bf..6188c3e97eaf 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -426,7 +426,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
>      machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
>  }
> =20
> -static void pc_i440fx_5_2_machine_options(MachineClass *m)
> +static void pc_i440fx_6_0_machine_options(MachineClass *m)
>  {
>      PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
>      pc_i440fx_machine_options(m);
> @@ -435,6 +435,18 @@ static void pc_i440fx_5_2_machine_options(MachineCla=
ss *m)
>      pcmc->default_cpu_version =3D 1;
>  }
> =20
> +DEFINE_I440FX_MACHINE(v6_0, "pc-i440fx-6.0", NULL,
> +                      pc_i440fx_6_0_machine_options);
> +
> +static void pc_i440fx_5_2_machine_options(MachineClass *m)
> +{
> +    pc_i440fx_6_0_machine_options(m);
> +    m->alias =3D NULL;
> +    m->is_default =3D false;
> +    compat_props_add(m->compat_props, hw_compat_5_2, hw_compat_5_2_len);
> +    compat_props_add(m->compat_props, pc_compat_5_2, pc_compat_5_2_len);
> +}
> +
>  DEFINE_I440FX_MACHINE(v5_2, "pc-i440fx-5.2", NULL,
>                        pc_i440fx_5_2_machine_options);
> =20
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index a3f4959c4357..0a212443aa84 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -344,7 +344,7 @@ static void pc_q35_machine_options(MachineClass *m)
>      m->max_cpus =3D 288;
>  }
> =20
> -static void pc_q35_5_2_machine_options(MachineClass *m)
> +static void pc_q35_6_0_machine_options(MachineClass *m)
>  {
>      PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
>      pc_q35_machine_options(m);
> @@ -352,6 +352,17 @@ static void pc_q35_5_2_machine_options(MachineClass =
*m)
>      pcmc->default_cpu_version =3D 1;
>  }
> =20
> +DEFINE_Q35_MACHINE(v6_0, "pc-q35-6.0", NULL,
> +                   pc_q35_6_0_machine_options);
> +
> +static void pc_q35_5_2_machine_options(MachineClass *m)
> +{
> +    pc_q35_6_0_machine_options(m);
> +    m->alias =3D NULL;
> +    compat_props_add(m->compat_props, hw_compat_5_2, hw_compat_5_2_len);
> +    compat_props_add(m->compat_props, pc_compat_5_2, pc_compat_5_2_len);
> +}
> +
>  DEFINE_Q35_MACHINE(v5_2, "pc-q35-5.2", NULL,
>                     pc_q35_5_2_machine_options);
> =20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 227075103e9a..45e0afbeba49 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4515,15 +4515,26 @@ static void spapr_machine_latest_class_options(Ma=
chineClass *mc)
>      }                                                                \
>      type_init(spapr_machine_register_##suffix)
> =20
> +/*
> + * pseries-6.0
> + */
> +static void spapr_machine_6_0_class_options(MachineClass *mc)
> +{
> +    /* Defaults for the latest behaviour inherited from the base class */
> +}
> +
> +DEFINE_SPAPR_MACHINE(6_0, "6.0", true);
> +
>  /*
>   * pseries-5.2
>   */
>  static void spapr_machine_5_2_class_options(MachineClass *mc)
>  {
> -    /* Defaults for the latest behaviour inherited from the base class */
> +    spapr_machine_6_0_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
>  }
> =20
> -DEFINE_SPAPR_MACHINE(5_2, "5.2", true);
> +DEFINE_SPAPR_MACHINE(5_2, "5.2", false);
> =20
>  /*
>   * pseries-5.1
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 22222c4fd5ad..b1229abc3134 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -785,14 +785,26 @@ bool css_migration_enabled(void)
>      }                                                                   =
      \
>      type_init(ccw_machine_register_##suffix)
> =20
> +static void ccw_machine_6_0_instance_options(MachineState *machine)
> +{
> +}
> +
> +static void ccw_machine_6_0_class_options(MachineClass *mc)
> +{
> +}
> +DEFINE_CCW_MACHINE(6_0, "6.0", true);
> +
>  static void ccw_machine_5_2_instance_options(MachineState *machine)
>  {
> +    ccw_machine_6_0_instance_options(machine);
>  }
> =20
>  static void ccw_machine_5_2_class_options(MachineClass *mc)
>  {
> +    ccw_machine_6_0_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
>  }
> -DEFINE_CCW_MACHINE(5_2, "5.2", true);
> +DEFINE_CCW_MACHINE(5_2, "5.2", false);
> =20
>  static void ccw_machine_5_1_instance_options(MachineState *machine)
>  {
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index a49e3a6b4481..f94f4ad5d83c 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -310,6 +310,9 @@ struct MachineState {
>      } \
>      type_init(machine_initfn##_register_types)
> =20
> +extern GlobalProperty hw_compat_5_2[];
> +extern const size_t hw_compat_5_2_len;
> +
>  extern GlobalProperty hw_compat_5_1[];
>  extern const size_t hw_compat_5_1_len;
> =20
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 911e4600970c..49dfa667de09 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -191,6 +191,9 @@ void pc_system_firmware_init(PCMachineState *pcms, Me=
moryRegion *rom_memory);
>  void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
>                         const CPUArchIdList *apic_ids, GArray *entry);
> =20
> +extern GlobalProperty pc_compat_5_2[];
> +extern const size_t pc_compat_5_2_len;
> +
>  extern GlobalProperty pc_compat_5_1[];
>  extern const size_t pc_compat_5_1_len;
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--IiVenqGWf+H9Y6IX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+rgwEACgkQbDjKyiDZ
s5IQBRAAlu+z4r7TGp4jB2vexmXeiqQDO2d7Nazuk2b/VohOmu6YT+hhx9q/9I5F
lqUyTU9Hr7b19WgO+BjH8o9vPa0ga8sLmjtUZwV4A37YQ+pxLQl+w05G7uUEsJqF
ls4umPoQfdSFZf7kSYYsKVOR1PcdOZL0izrCeEOGLZyTWBidp435qkTrLCeN8Vhl
jKzTAvdFvu61CriM40nrDnbBvUfsgI4WkCKwgXsrODizbbOQrVwDgKPD5O9dWpTR
K9E+Pq5tnt+DZ9l1SqEU0kie1PtrdD3CHdQ/qiGCtiCJHCYJ6Q20GugURPtEI6by
qg5oqgs9ryrTXJGHRyu+hNqRd1ZQ3q/AGGorImTfg+fRL+91kAoRWrGcp7h+2OPy
ZG7XDCdDw/EuYPVV062d9AbwBHmd5UJOiK71Tah00u+gIniZogr/yUrvxen7f5QH
Yy4Ot01/kcv9tDdmUNVLBGGF47uR5cUj6S/ScPpiMdw/LGrU+NoIKWc4j+Gu2kmj
WQKKZB/VYdtd4DXGaio5FDP9dgPnwt3QpF9vXTHzUs+poeyMciQATPYDkL84VrKm
FOuuyaKTUXhNBwYmRp46Jw4EKsurHHKOZj1LNUY3Fq1dsl6gLIGBAxIu70Uf6wb0
6urS+V81y01hlLzaFgcaGcnPwSWWqfDpxeVv9ZcXG4UcpXnXIos=
=t5Xw
-----END PGP SIGNATURE-----

--IiVenqGWf+H9Y6IX--

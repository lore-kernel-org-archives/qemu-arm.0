Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp688669lfc;
        Wed, 11 Mar 2020 05:12:11 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vt2Eu86iT2ceBa9Gx1SYZLHJHS31TMw1sKw2SqqcFVk4sqmQdx4Orq08MLxafULfyMc9iec
X-Received: by 2002:a05:620a:49:: with SMTP id t9mr2507795qkt.248.1583928730899;
        Wed, 11 Mar 2020 05:12:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583928730; cv=none;
        d=google.com; s=arc-20160816;
        b=ER0YwoGlXeIHf5v51KkkUM+/K6aIKRVzQtcGp/ssrp0mmf61Do1DvsZp7x9QiGcckd
         IIwbu4QIuCjdmLQnyHCNlhRATChA9lBy/dWQ0Pqc4MASiefWeDgb7LKRAOeS1Qqe6EyE
         34Act3xUNWQxrIYZx0M4DOs1SSGrh2lu3y0udY0MhCPcyh5lmzpw3QaZG1WzuFvG7O7N
         lYCKgv4nO+a1uyGRKgZNG1FkBFGxc1XS0wrxVkPL8+d8HdC4Xkn3eiICyJTBSpEEaJXH
         l93CNH09haJ+qJjUqcRQncjUmS36cStzfaVRGflSxoga/B6k6U5FAyfjSyk/JIXPvnBB
         Vr6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=Y5S3fiIEyFrYIbLU+yY3gEePrZ4fKEtDA+Wcj1ks4AA=;
        b=ED0LcHafbpiLVB+VDeA0njckDOeko7DzJ+PflbrvKrE9+OxogRL+/Tt2oXJF38G1MK
         l9pXyHz3SIK5YplkJELCFcsRHu6GS0R5cHSe0CVd8i46rVVUbajbLMIXvKTuw6znLyw8
         PLI5KPGM9yc5391g3kZrWTMKoNdvzSY/IjoNjb5DbC7SL6sktqIimtKOw+ODn5w/KzpQ
         lZARPc3GI3+R9gcXF9PRtFrlenFfo2JnlcHMOebR4IO6O0CPggA1S6J1giSRpax5Qe5p
         40T3XTe96JGwGdBVij0x0LLvKb4FYJkW3lg/TwmwYjtw0zd8MibdH4v0vciyy4zDMtzV
         uNfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NKTmRp0L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n88si794528qva.73.2020.03.11.05.12.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 05:12:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NKTmRp0L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jC0Da-0006BI-9K
	for alex.bennee@linaro.org; Wed, 11 Mar 2020 08:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39837)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1jC0DS-0006B6-4o
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 08:12:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1jC0DQ-0002HF-86
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 08:12:01 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:52983
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1jC0DP-0002H9-UN
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 08:12:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583928719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y5S3fiIEyFrYIbLU+yY3gEePrZ4fKEtDA+Wcj1ks4AA=;
 b=NKTmRp0LgcmNYjYCKYHQaTjn8RfBQDlwLFtQYpo46jxz8iIp7Yo8dw8nlA9Uld8zFfURFj
 NzoEoR5mWFDvys7k6Gors8TK3zS4KPMTF5Q7F19NR4nNErMvtKarc32ruwtLhvI/4MGd59
 WwqefKDsZo9Y5JPe8X/RcXpbwBct2DI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-Qh9OZsfZNaqsrdv1FZP3qg-1; Wed, 11 Mar 2020 08:11:57 -0400
X-MC-Unique: Qh9OZsfZNaqsrdv1FZP3qg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D40E5477;
 Wed, 11 Mar 2020 12:11:55 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-206-80.brq.redhat.com
 [10.40.206.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 41F09388;
 Wed, 11 Mar 2020 12:11:50 +0000 (UTC)
Date: Wed, 11 Mar 2020 13:11:46 +0100
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v4 3/6] hw/arm/virt: Introduce finalize_gic_version()
Message-ID: <20200311121146.qeky4n7jdibncavi@kamzik.brq.redhat.com>
References: <20200311111626.5705-1-eric.auger@redhat.com>
 <20200311111626.5705-4-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200311111626.5705-4-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org, maz@kernel.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, philmd@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3jDlXhmqB46f

On Wed, Mar 11, 2020 at 12:16:23PM +0100, Eric Auger wrote:
> Let's move the code which freezes which gic-version to
> be applied in a dedicated function. We also now set by
> default the VIRT_GIC_VERSION_NO_SET. This eventually
> turns into the legacy v2 choice in the finalize() function.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
>=20
> ---
>=20
> v2 -> v3:
> - add NOTSEL value at the end of the new enum type
> ---
>  include/hw/arm/virt.h |  1 +
>  hw/arm/virt.c         | 54 ++++++++++++++++++++++++++-----------------
>  2 files changed, 34 insertions(+), 21 deletions(-)
>=20
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index c0827cacdf..893796d3b0 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -100,6 +100,7 @@ typedef enum VirtGICType {
>      VIRT_GIC_VERSION_HOST,
>      VIRT_GIC_VERSION_2,
>      VIRT_GIC_VERSION_3,
> +    VIRT_GIC_VERSION_NOSEL,
>  } VirtGICType;
> =20
>  typedef struct MemMapEntry {
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 4ed1f0cb2e..22da0a7ad7 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1535,6 +1535,37 @@ static void virt_set_memmap(VirtMachineState *vms)
>      }
>  }
> =20
> +/*
> + * finalize_gic_version - Determines the final gic_version
> + * according to the gic-version property
> + *
> + * Default GIC type is v2
> + */
> +static void finalize_gic_version(VirtMachineState *vms)
> +{
> +    if (vms->gic_version =3D=3D VIRT_GIC_VERSION_HOST ||
> +        vms->gic_version =3D=3D VIRT_GIC_VERSION_MAX) {
> +        if (!kvm_enabled()) {
> +            if (vms->gic_version =3D=3D VIRT_GIC_VERSION_HOST) {
> +                error_report("gic-version=3Dhost requires KVM");
> +                exit(1);
> +            } else {
> +                /* "max": currently means 3 for TCG */
> +                vms->gic_version =3D VIRT_GIC_VERSION_3;
> +            }
> +        } else {
> +            vms->gic_version =3D kvm_arm_vgic_probe();
> +            if (!vms->gic_version) {
> +                error_report(
> +                    "Unable to determine GIC version supported by host")=
;
> +                exit(1);
> +            }
> +        }
> +    } else if (vms->gic_version =3D=3D VIRT_GIC_VERSION_NOSEL) {
> +        vms->gic_version =3D VIRT_GIC_VERSION_2;
> +    }
> +}
> +
>  static void machvirt_init(MachineState *machine)
>  {
>      VirtMachineState *vms =3D VIRT_MACHINE(machine);
> @@ -1561,25 +1592,7 @@ static void machvirt_init(MachineState *machine)
>      /* We can probe only here because during property set
>       * KVM is not available yet
>       */
> -    if (vms->gic_version =3D=3D VIRT_GIC_VERSION_HOST ||
> -        vms->gic_version =3D=3D VIRT_GIC_VERSION_MAX) {
> -        if (!kvm_enabled()) {
> -            if (vms->gic_version =3D=3D VIRT_GIC_VERSION_HOST) {
> -                error_report("gic-version=3Dhost requires KVM");
> -                exit(1);
> -            } else {
> -                /* "max": currently means 3 for TCG */
> -                vms->gic_version =3D VIRT_GIC_VERSION_3;
> -            }
> -        } else {
> -            vms->gic_version =3D kvm_arm_vgic_probe();
> -            if (!vms->gic_version) {
> -                error_report(
> -                    "Unable to determine GIC version supported by host")=
;
> -                exit(1);
> -            }
> -        }
> -    }
> +     finalize_gic_version(vms);
       ^ extra space
> =20
>      if (!cpu_type_valid(machine->cpu_type)) {
>          error_report("mach-virt: CPU type %s not supported", machine->cp=
u_type);
> @@ -2140,8 +2153,7 @@ static void virt_instance_init(Object *obj)
>                                      "Set on/off to enable/disable using =
"
>                                      "physical address space above 32 bit=
s",
>                                      NULL);
> -    /* Default GIC type is v2 */
> -    vms->gic_version =3D VIRT_GIC_VERSION_2;
> +    vms->gic_version =3D VIRT_GIC_VERSION_NOSEL;
>      object_property_add_str(obj, "gic-version", virt_get_gic_version,
>                          virt_set_gic_version, NULL);
>      object_property_set_description(obj, "gic-version",
> --=20
> 2.20.1
>=20


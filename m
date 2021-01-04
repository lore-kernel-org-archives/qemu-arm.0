Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp15942043lfq;
        Mon, 4 Jan 2021 14:45:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPMbNMHJpxbUtPrN/uIEr4B0LSNLz18B2mN3NM4/WfGm6MmDJ+wVCH/Vi/CfRnshoe3zJU
X-Received: by 2002:a25:d7d7:: with SMTP id o206mr107212861ybg.228.1609800318599;
        Mon, 04 Jan 2021 14:45:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609800318; cv=none;
        d=google.com; s=arc-20160816;
        b=j3TNFSoziWJ/fbOkedd1Gs/Zu6c8r8wpj9EZHPkTIIpNbYIOmEMyRS6Hkmb3mF1hrB
         pGoRjAluZwTKbVzrVNdQTw7t02C7r4pkZL/ffw79QFMwFyi3+BB16bqsPY2++Uy+Ry9z
         MSqRQ+n33e3IO8WLQPcmxfoIvAlGnvNF2teweeVKShO6b3riyGW/CokhsTRqHbTmSY3J
         dUk22eU0Mt88F25waED9OcSnbbPvOblxjkwGdSJ5dLMQYoPG9Gd4+IwK1lhdlXSEa7Wg
         KjkrKuzoRDzjs9WhyrqkOKMmppaxxSR7zqKbeHNnjF+l1Cs5sRxNbEdpfYWO5KjrG+j8
         E8xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=DPSU4RfLlMfVmTuHkZt3krQO84SIfrjmyUkgiA27jE8=;
        b=CExGDmtXvL8Dwhn6jNTTpYKo7kckmPvmU4JPipqjo+adoCbxhRU09RykK/SZAZULaq
         HODo3ss+FYbpR4NSgiGYsaVkGIdjoadQArtYyF3/TmEyrhnu6JM7oxtAPz0xaUDm5h5L
         3aQtePpTe/C+FWu+b1mVIqhGNeDWQP1DZJ1+wTxrqJr+0yzwBqFUkte2msILEK2hL1jS
         HVGqODauce94RaIHctJ7K0xAtvsUMKoFxSXXRV0k7WZ9rqNzVLUailrOVdJqMxYXRTRg
         h0GPFJmZ54eZRCdYYX64n45J4BQXoyxJkD4owfxQ10LlsyehP0CwOdtmB1hfSUnfoq+y
         sGxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="X/uJ8Eki";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 62si60813780ybf.81.2021.01.04.14.45.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jan 2021 14:45:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="X/uJ8Eki";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kwYbF-0007by-Vd
	for alex.bennee@linaro.org; Mon, 04 Jan 2021 17:45:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kwYaw-0007Lp-QR
 for qemu-arm@nongnu.org; Mon, 04 Jan 2021 17:44:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kwYas-0002ua-Th
 for qemu-arm@nongnu.org; Mon, 04 Jan 2021 17:44:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609800293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DPSU4RfLlMfVmTuHkZt3krQO84SIfrjmyUkgiA27jE8=;
 b=X/uJ8EkiP3tJgWJk+7Fz0JwEqudg8wjyP4uXsn3ufTfuopuj4X2irznhF8yTN7voKoF6H9
 vLt+KuxCerHsqn9ufBrMgx2YzxFYkTpolkkYMtzuEJOiY/K7uiomfYvAF7ufxQtBkf02W5
 X3bTBeqJ7152m9XFtw8DDaNs7RR9ymw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-50gZDxyPOpC1L-ahRxkO0Q-1; Mon, 04 Jan 2021 17:44:50 -0500
X-MC-Unique: 50gZDxyPOpC1L-ahRxkO0Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A208D801A9D;
 Mon,  4 Jan 2021 22:44:48 +0000 (UTC)
Received: from localhost (unknown [10.40.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9438610027A5;
 Mon,  4 Jan 2021 22:44:42 +0000 (UTC)
Date: Mon, 4 Jan 2021 23:44:40 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 3/3] hw/i386: expose a "smbios-ep" PC machine property
Message-ID: <20210104234440.2da6c503@redhat.com>
In-Reply-To: <20201214205029.2991222-4-ehabkost@redhat.com>
References: <20201214205029.2991222-1-ehabkost@redhat.com>
 <20201214205029.2991222-4-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, "Daniel
 P. Berrange" <berrange@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fmJRRPU61qBN

On Mon, 14 Dec 2020 15:50:29 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> From: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>=20
> The i440fx and Q35 machine types are both hardcoded to use the legacy
> SMBIOS 2.1 entry point. This is a sensible conservative choice because
> SeaBIOS only supports SMBIOS 2.1
>=20
> EDK2, however, can also support SMBIOS 3.0 and QEMU already uses this on
> the ARM virt machine type.
>=20
> This adds a property to allow the choice of SMBIOS entry point versions
> For example to opt in to version 3.0
>=20
>    $QEMU -machine q35,smbios-ep=3D3_0
>=20
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> This is patch was previously submitted at:
> https://lore.kernel.org/qemu-devel/20200908165438.1008942-6-berrange@redh=
at.com
>=20
> Changes from v1:
> * Include qapi-visit-smbios.h instead of qapi-visit-machine.h
> * Commit message fix: s/smbios_ep/smbios-ep/
> ---
>  include/hw/i386/pc.h |  3 +++
>  hw/i386/pc.c         | 26 ++++++++++++++++++++++++++
>  hw/i386/pc_piix.c    |  2 +-
>  hw/i386/pc_q35.c     |  2 +-
>  4 files changed, 31 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 2aa8797c6e..2075093b32 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -11,6 +11,7 @@
>  #include "hw/acpi/acpi_dev_interface.h"
>  #include "hw/hotplug.h"
>  #include "qom/object.h"
> +#include "hw/firmware/smbios.h"
> =20
>  #define HPET_INTCAP "hpet-intcap"
> =20
> @@ -38,6 +39,7 @@ typedef struct PCMachineState {
>      /* Configuration options: */
>      uint64_t max_ram_below_4g;
>      OnOffAuto vmport;
> +    SmbiosEntryPointType smbios_ep;
> =20
>      bool acpi_build_enabled;
>      bool smbus_enabled;
> @@ -62,6 +64,7 @@ typedef struct PCMachineState {
>  #define PC_MACHINE_SATA             "sata"
>  #define PC_MACHINE_PIT              "pit"
>  #define PC_MACHINE_MAX_FW_SIZE      "max-fw-size"
> +#define PC_MACHINE_SMBIOS_EP        "smbios-ep"
> =20
>  /**
>   * PCMachineClass:
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 640fb5b0b7..3cc559e0d9 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -81,6 +81,7 @@
>  #include "hw/mem/nvdimm.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-visit-common.h"
> +#include "qapi/qapi-visit-smbios.h"
>  #include "qapi/visitor.h"
>  #include "hw/core/cpu.h"
>  #include "hw/usb.h"
> @@ -1532,6 +1533,23 @@ static void pc_machine_set_hpet(Object *obj, bool =
value, Error **errp)
>      pcms->hpet_enabled =3D value;
>  }
> =20
> +static void pc_machine_get_smbios_ep(Object *obj, Visitor *v, const char=
 *name,
> +                                     void *opaque, Error **errp)
> +{
> +    PCMachineState *pcms =3D PC_MACHINE(obj);
> +    SmbiosEntryPointType smbios_ep =3D pcms->smbios_ep;
> +
> +    visit_type_SmbiosEntryPointType(v, name, &smbios_ep, errp);
> +}
> +
> +static void pc_machine_set_smbios_ep(Object *obj, Visitor *v, const char=
 *name,
> +                                     void *opaque, Error **errp)
> +{
> +    PCMachineState *pcms =3D PC_MACHINE(obj);
> +
> +    visit_type_SmbiosEntryPointType(v, name, &pcms->smbios_ep, errp);
> +}
> +
>  static void pc_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
>                                              const char *name, void *opaq=
ue,
>                                              Error **errp)
> @@ -1621,6 +1639,8 @@ static void pc_machine_initfn(Object *obj)
>      pcms->vmport =3D ON_OFF_AUTO_OFF;
>  #endif /* CONFIG_VMPORT */
>      pcms->max_ram_below_4g =3D 0; /* use default */
> +    pcms->smbios_ep =3D SMBIOS_ENTRY_POINT_TYPE_2_1;
> +
>      /* acpi build is enabled by default if machine supports it */
>      pcms->acpi_build_enabled =3D PC_MACHINE_GET_CLASS(pcms)->has_acpi_bu=
ild;
>      pcms->smbus_enabled =3D true;
> @@ -1759,6 +1779,12 @@ static void pc_machine_class_init(ObjectClass *oc,=
 void *data)
>          NULL, NULL);
>      object_class_property_set_description(oc, PC_MACHINE_MAX_FW_SIZE,
>          "Maximum combined firmware size");
> +
> +    object_class_property_add(oc, PC_MACHINE_SMBIOS_EP, "str",
> +        pc_machine_get_smbios_ep, pc_machine_set_smbios_ep,
> +        NULL, NULL);
> +    object_class_property_set_description(oc, PC_MACHINE_SMBIOS_EP,
> +        "SMBIOS Entry Point version [v2_1, v3_0]");
>  }
> =20
>  static const TypeInfo pc_machine_info =3D {
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 08b82df4d1..30ae7f27af 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -179,7 +179,7 @@ static void pc_init1(MachineState *machine,
>          smbios_set_defaults("QEMU", "Standard PC (i440FX + PIIX, 1996)",
>                              mc->name, pcmc->smbios_legacy_mode,
>                              pcmc->smbios_uuid_encoded,
> -                            SMBIOS_ENTRY_POINT_TYPE_2_1);
> +                            pcms->smbios_ep);
>      }
> =20
>      /* allocate ram and load rom/bios */
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index f71b1e2dcf..9974426806 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -198,7 +198,7 @@ static void pc_q35_init(MachineState *machine)
>          smbios_set_defaults("QEMU", "Standard PC (Q35 + ICH9, 2009)",
>                              mc->name, pcmc->smbios_legacy_mode,
>                              pcmc->smbios_uuid_encoded,
> -                            SMBIOS_ENTRY_POINT_TYPE_2_1);
> +                            pcms->smbios_ep);
>      }
> =20
>      /* allocate ram and load rom/bios */


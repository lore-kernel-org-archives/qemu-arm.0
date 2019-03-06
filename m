Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5735513wrx;
        Wed, 6 Mar 2019 02:32:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqwwZzhDr84Crw9lwhcnhCU6LZoOISFhoGhCvhiZSBPy+1oOs174v2bUfHqqrDWkC07ph0vn
X-Received: by 2002:a25:738b:: with SMTP id o133mr5978878ybc.150.1551868362003;
        Wed, 06 Mar 2019 02:32:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551868361; cv=none;
        d=google.com; s=arc-20160816;
        b=nEHbroQzxA73ZC9LBHQBDLrvJXxM7k6HXQa9BGL1TN4QCG2dtaemZTriNuiH3NVOBw
         BcMKDS99RCwDkbqBAjKV8lbtZ57w8dvK0gHA3waXU1NHKosc69EIB8Oa8JrRRGr8X/qf
         AY8uS8E8Aeb+qWbM35jcmEHyW2zXylbVWzCgvzRWsi3M5n5QqRW4NjcSDMY+JSlOfXUi
         zZWn+ofW+PDrdTeKTgWKtpeCQAlZOrbjJ2C2q36n6o7mV7iNx94leN9gEfyoRcrCbXAD
         geg5494mbCbh32ILqd0TEQyXdZy9Om9o6aobcgrwh/o0zppKnJiWvOJ3TSQmDNPxa9/k
         3cNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=UDuJuK6xcwGmPGwMwJh856Dofivip1E0OyhqrlsihUM=;
        b=hNNCns/HvrEKROyD+3SaD5dz66xbs13QEaWDaMk+0XLi6XnPXWaX1vYnaf5SiMkdI3
         lgrrZZ7XwzlbTwyhnhhIRn4Vv8x6ecvUX2JZhzx7Wrwm48xXWfsXRpshdek7y2YA0yES
         HdNlNMAgu2lg1rucI5dTgx59sGhX+hmHPfE4v/5uUu2amSz1KtZM5drvsJVAHdliTz0r
         Z9rcd3Wn2n9vR5O8EVwxbUaGWoI4hhZ5KOs736c0bPQ2IS40/cm08qxodaiBepT7ohUH
         FOUUfVWE7/HHIcSkUelChEmUGcjtbgETCatMKaCYElSrJyvo2IHRfQcqHK7JZPKm5vWU
         2plg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 129si569597ybz.286.2019.03.06.02.32.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Mar 2019 02:32:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:58583 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1Tqq-0003e2-OL
	for alex.bennee@linaro.org; Wed, 06 Mar 2019 05:32:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h1Tqi-0003dw-HO
	for qemu-arm@nongnu.org; Wed, 06 Mar 2019 05:32:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h1Tqe-0005SU-Lo
	for qemu-arm@nongnu.org; Wed, 06 Mar 2019 05:32:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40178)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h1Tqd-0005Kl-WD; Wed, 06 Mar 2019 05:32:28 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D41B2D7EF;
	Wed,  6 Mar 2019 10:24:06 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5FBA46109B;
	Wed,  6 Mar 2019 10:23:58 +0000 (UTC)
Date: Wed, 6 Mar 2019 11:23:57 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20190306112357.168326d2@redhat.com>
In-Reply-To: <25a67533-b557-25dd-c528-0034fe06c3e2@redhat.com>
References: <20190301140623.5390-1-eric.auger@redhat.com>
	<e0565169-23e6-5934-47b1-478130ee987e@linux.ibm.com>
	<25a67533-b557-25dd-c528-0034fe06c3e2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 06 Mar 2019 10:24:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] machine: Move acpi_nvdimm_state
 into struct MachineState
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com,
	Shivaprasad G Bhat <sbhat@linux.ibm.com>, david@redhat.com,
	richard.henderson@linaro.org, qemu-devel@nongnu.org,
	shameerali.kolothum.thodi@huawei.com, qemu-arm@nongnu.org,
	pbonzini@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DQ10kEWtZM9P

On Tue, 5 Mar 2019 10:39:49 +0100
Auger Eric <eric.auger@redhat.com> wrote:

> Hi Shivaprasad,
>=20
> On 3/5/19 10:35 AM, Shivaprasad G Bhat wrote:
> >=20
> >=20
> > On 03/01/2019 07:36 PM, Eric Auger wrote: =20
> >> As NVDIMM support is looming for ARM and SPAPR, let's
> >> move the acpi_nvdimm_state to the generic machine struct =20
> > Name - "acpi_nvdimm_state" sounds very x86 specific.
> >=20
> > Could you please rename ? =20
> Sure, do you have any suggestion?
would "nvdimms_state" do?

>=20
> Thanks
>=20
> Eric
> >=20
> > Thanks,
> > Shivaprasad =20
> >> instead of duplicating the same code in several machines.
> >>
> >> nvdimm and nvdimm-persistence become generic machine options.
> >> We also add a description for those options.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> >> ---
> >> =C2=A0 hw/core/machine.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 5=
7 ++++++++++++++++++++++++++++++++++++++++
> >> =C2=A0 hw/i386/acpi-build.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 ++---
> >> =C2=A0 hw/i386/pc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 56 +++------------------------------------
> >> =C2=A0 hw/i386/pc_piix.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 4 +--
> >> =C2=A0 hw/i386/pc_q35.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 4 +--
> >> =C2=A0 include/hw/boards.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> >> =C2=A0 include/hw/i386/pc.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ---
> >> =C2=A0 include/hw/mem/pc-dimm.h |=C2=A0 1 -
> >> =C2=A0 8 files changed, 70 insertions(+), 64 deletions(-)
> >>
> >> diff --git a/hw/core/machine.c b/hw/core/machine.c
> >> index 766ca5899d..19a5ee7cd8 100644
> >> --- a/hw/core/machine.c
> >> +++ b/hw/core/machine.c
> >> @@ -481,6 +481,47 @@ static void machine_set_memory_encryption(Object
> >> *obj, const char *value,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ms->memory_encryption =3D g_strdup(valu=
e);
> >> =C2=A0 }
> >> =C2=A0 +static bool machine_get_nvdimm(Object *obj, Error **errp)
> >> +{
> >> +=C2=A0=C2=A0=C2=A0 MachineState *ms =3D MACHINE(obj);
> >> +
> >> +=C2=A0=C2=A0=C2=A0 return ms->acpi_nvdimm_state.is_enabled;
> >> +}
> >> +
> >> +static void machine_set_nvdimm(Object *obj, bool value, Error **errp)
> >> +{
> >> +=C2=A0=C2=A0=C2=A0 MachineState *ms =3D MACHINE(obj);
> >> +
> >> +=C2=A0=C2=A0=C2=A0 ms->acpi_nvdimm_state.is_enabled =3D value;
> >> +}
> >> +
> >> +static char *machine_get_nvdimm_persistence(Object *obj, Error **errp)
> >> +{
> >> +=C2=A0=C2=A0=C2=A0 MachineState *ms =3D MACHINE(obj);
> >> +
> >> +=C2=A0=C2=A0=C2=A0 return g_strdup(ms->acpi_nvdimm_state.persistence_=
string);
> >> +}
> >> +
> >> +static void machine_set_nvdimm_persistence(Object *obj, const char
> >> *value,
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Error **errp)
> >> +{
> >> +=C2=A0=C2=A0=C2=A0 MachineState *ms =3D MACHINE(obj);
> >> +=C2=A0=C2=A0=C2=A0 AcpiNVDIMMState *nvdimm_state =3D &ms->acpi_nvdimm=
_state;
> >> +
> >> +=C2=A0=C2=A0=C2=A0 if (strcmp(value, "cpu") =3D=3D 0)
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvdimm_state->persistence =
=3D 3;
> >> +=C2=A0=C2=A0=C2=A0 else if (strcmp(value, "mem-ctrl") =3D=3D 0)
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvdimm_state->persistence =
=3D 2;
> >> +=C2=A0=C2=A0=C2=A0 else {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "-machine=
 nvdimm-persistence=3D%s: unsupported
> >> option",
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value);
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> >> +=C2=A0=C2=A0=C2=A0 }
> >> +
> >> +=C2=A0=C2=A0=C2=A0 g_free(nvdimm_state->persistence_string);
> >> +=C2=A0=C2=A0=C2=A0 nvdimm_state->persistence_string =3D g_strdup(valu=
e);
> >> +}
> >> +
> >> =C2=A0 void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, c=
onst
> >> char *type)
> >> =C2=A0 {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 strList *item =3D g_new0(strList, 1);
> >> @@ -765,6 +806,20 @@ static void machine_class_init(ObjectClass *oc,
> >> void *data)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &error_abort);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 object_class_property_set_description(o=
c, "memory-encryption",
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Set memory enc=
ryption object to use", &error_abort);
> >> +
> >> +=C2=A0=C2=A0=C2=A0 object_class_property_add_bool(oc, "nvdimm",
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 machine_get_nvdimm, machin=
e_set_nvdimm, &error_abort);
> >> +=C2=A0=C2=A0=C2=A0 object_class_property_set_description(oc, "nvdimm",
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "Set on/off to
> >> enable/disable NVDIMM "
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "instantiation", NULL);
> >> +
> >> +=C2=A0=C2=A0=C2=A0 object_class_property_add_str(oc, "nvdimm-persiste=
nce",
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 machine_get_nvdimm_p=
ersistence,
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 machine_set_nvdimm_p=
ersistence,
> >> &error_abort);
> >> +=C2=A0=C2=A0=C2=A0 object_class_property_set_description(oc, "nvdimm-=
persistence",
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Set NVDIMM persistence"
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Valid values are cpu and
> >> mem-ctrl",
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL);
> >> =C2=A0 }
> >> =C2=A0 =C2=A0 static void machine_class_base_init(ObjectClass *oc, voi=
d *data)
> >> @@ -790,6 +845,8 @@ static void machine_initfn(Object *obj)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ms->dump_guest_core =3D true;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ms->mem_merge =3D true;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ms->enable_graphics =3D true;
> >> +=C2=A0=C2=A0=C2=A0 /* nvdimm is disabled on default. */
> >> +=C2=A0=C2=A0=C2=A0 ms->acpi_nvdimm_state.is_enabled =3D false;
> >> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Register notifier when init i=
s done for sysbus sanity
> >> checks */
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ms->sysbus_notifier.notify =3D machine_=
init_notify;
> >> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> >> index 9ecc96dcc7..622ccb9408 100644
> >> --- a/hw/i386/acpi-build.c
> >> +++ b/hw/i386/acpi-build.c
> >> @@ -1867,7 +1867,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linke=
r,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 aml_append(scope, method);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> =C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pcms->acpi_nvdi=
mm_state.is_enabled) {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (machine->acpi_nvdimm_s=
tate.is_enabled) {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 method =3D aml_method("_E04", 0, AML_NOTSERIALIZED);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 aml_append(method, aml_notify(aml_name("\\_SB.NVDR"),
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aml_int(0x80)));
> >> @@ -2704,9 +2704,9 @@ void acpi_build(AcpiBuildTables *tables,
> >> MachineState *machine)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 build_dmar_q35(tables_blob, tables->linker);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> -=C2=A0=C2=A0=C2=A0 if (pcms->acpi_nvdimm_state.is_enabled) {
> >> +=C2=A0=C2=A0=C2=A0 if (machine->acpi_nvdimm_state.is_enabled) {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvdimm_build_ac=
pi(table_offsets, tables_blob, tables->linker,
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 &pcms->acpi_nvdimm_state, machine->ram_slots);
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 &machine->acpi_nvdimm_state,
> >> machine->ram_slots);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Add tables supplied by user (=
if any) */
> >> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> >> index 3889eccdc3..356213e0b8 100644
> >> --- a/hw/i386/pc.c
> >> +++ b/hw/i386/pc.c
> >> @@ -2096,6 +2096,7 @@ static void pc_memory_pre_plug(HotplugHandler
> >> *hotplug_dev, DeviceState *dev,
> >> =C2=A0 {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const PCMachineState *pcms =3D PC_MACHI=
NE(hotplug_dev);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const PCMachineClass *pcmc =3D PC_MACHI=
NE_GET_CLASS(pcms);
> >> +=C2=A0=C2=A0=C2=A0 const MachineState *ms =3D MACHINE(hotplug_dev);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const bool is_nvdimm =3D object_dynamic=
_cast(OBJECT(dev),
> >> TYPE_NVDIMM);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const uint64_t legacy_align =3D TARGET_=
PAGE_SIZE;
> >> =C2=A0 @@ -2110,7 +2111,7 @@ static void pc_memory_pre_plug(HotplugHan=
dler
> >> *hotplug_dev, DeviceState *dev,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (is_nvdimm && !pcms->acpi_nvdimm_state.i=
s_enabled) {
> >> +=C2=A0=C2=A0=C2=A0 if (is_nvdimm && !ms->acpi_nvdimm_state.is_enabled=
) {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp=
, "nvdimm is not enabled: missing 'nvdimm' in
> >> '-M'");
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> @@ -2124,6 +2125,7 @@ static void pc_memory_plug(HotplugHandler
> >> *hotplug_dev,
> >> =C2=A0 {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Error *local_err =3D NULL;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PCMachineState *pcms =3D PC_MACHINE(hot=
plug_dev);
> >> +=C2=A0=C2=A0=C2=A0 MachineState *ms =3D MACHINE(hotplug_dev);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool is_nvdimm =3D object_dynamic_cast(=
OBJECT(dev), TYPE_NVDIMM);
> >> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pc_dimm_plug(PC_DIMM(dev), MACHI=
NE(pcms), &local_err);
> >> @@ -2132,7 +2134,7 @@ static void pc_memory_plug(HotplugHandler
> >> *hotplug_dev,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (is_nvdimm) {
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvdimm_plug(&pcms->acpi_nv=
dimm_state);
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvdimm_plug(&ms->acpi_nvdi=
mm_state);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hotplug_handler_plug(HOTPLUG_HAN=
DLER(pcms->acpi_dev), dev,
> >> &error_abort);
> >> @@ -2574,47 +2576,6 @@ static void pc_machine_set_smm(Object *obj,
> >> Visitor *v, const char *name,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 visit_type_OnOffAuto(v, name, &pcms->sm=
m, errp);
> >> =C2=A0 }
> >> =C2=A0 -static bool pc_machine_get_nvdimm(Object *obj, Error **errp)
> >> -{
> >> -=C2=A0=C2=A0=C2=A0 PCMachineState *pcms =3D PC_MACHINE(obj);
> >> -
> >> -=C2=A0=C2=A0=C2=A0 return pcms->acpi_nvdimm_state.is_enabled;
> >> -}
> >> -
> >> -static void pc_machine_set_nvdimm(Object *obj, bool value, Error **er=
rp)
> >> -{
> >> -=C2=A0=C2=A0=C2=A0 PCMachineState *pcms =3D PC_MACHINE(obj);
> >> -
> >> -=C2=A0=C2=A0=C2=A0 pcms->acpi_nvdimm_state.is_enabled =3D value;
> >> -}
> >> -
> >> -static char *pc_machine_get_nvdimm_persistence(Object *obj, Error
> >> **errp)
> >> -{
> >> -=C2=A0=C2=A0=C2=A0 PCMachineState *pcms =3D PC_MACHINE(obj);
> >> -
> >> -=C2=A0=C2=A0=C2=A0 return g_strdup(pcms->acpi_nvdimm_state.persistenc=
e_string);
> >> -}
> >> -
> >> -static void pc_machine_set_nvdimm_persistence(Object *obj, const char
> >> *value,
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Error **errp)
> >> -{
> >> -=C2=A0=C2=A0=C2=A0 PCMachineState *pcms =3D PC_MACHINE(obj);
> >> -=C2=A0=C2=A0=C2=A0 AcpiNVDIMMState *nvdimm_state =3D &pcms->acpi_nvdi=
mm_state;
> >> -
> >> -=C2=A0=C2=A0=C2=A0 if (strcmp(value, "cpu") =3D=3D 0)
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvdimm_state->persistence =
=3D 3;
> >> -=C2=A0=C2=A0=C2=A0 else if (strcmp(value, "mem-ctrl") =3D=3D 0)
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvdimm_state->persistence =
=3D 2;
> >> -=C2=A0=C2=A0=C2=A0 else {
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "-machine=
 nvdimm-persistence=3D%s: unsupported
> >> option",
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value);
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> >> -=C2=A0=C2=A0=C2=A0 }
> >> -
> >> -=C2=A0=C2=A0=C2=A0 g_free(nvdimm_state->persistence_string);
> >> -=C2=A0=C2=A0=C2=A0 nvdimm_state->persistence_string =3D g_strdup(valu=
e);
> >> -}
> >> -
> >> =C2=A0 static bool pc_machine_get_smbus(Object *obj, Error **errp)
> >> =C2=A0 {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PCMachineState *pcms =3D PC_MACHINE(obj=
);
> >> @@ -2664,8 +2625,6 @@ static void pc_machine_initfn(Object *obj)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pcms->max_ram_below_4g =3D 0; /* use de=
fault */
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pcms->smm =3D ON_OFF_AUTO_AUTO;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pcms->vmport =3D ON_OFF_AUTO_AUTO;
> >> -=C2=A0=C2=A0=C2=A0 /* nvdimm is disabled on default. */
> >> -=C2=A0=C2=A0=C2=A0 pcms->acpi_nvdimm_state.is_enabled =3D false;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* acpi build is enabled by default if =
machine supports it */
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pcms->acpi_build_enabled =3D
> >> PC_MACHINE_GET_CLASS(pcms)->has_acpi_build;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pcms->smbus_enabled =3D true;
> >> @@ -2826,13 +2785,6 @@ static void pc_machine_class_init(ObjectClass
> >> *oc, void *data)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 object_class_property_set_description(o=
c, PC_MACHINE_VMPORT,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Enable vmport =
(pc & q35)", &error_abort);
> >> =C2=A0 -=C2=A0=C2=A0=C2=A0 object_class_property_add_bool(oc, PC_MACHI=
NE_NVDIMM,
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pc_machine_get_nvdimm, pc_=
machine_set_nvdimm, &error_abort);
> >> -
> >> -=C2=A0=C2=A0=C2=A0 object_class_property_add_str(oc, PC_MACHINE_NVDIM=
M_PERSIST,
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pc_machine_get_nvdimm_pers=
istence,
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pc_machine_set_nvdimm_pers=
istence, &error_abort);
> >> -
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 object_class_property_add_bool(oc, PC_M=
ACHINE_SMBUS,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pc_machine_get_=
smbus, pc_machine_set_smbus, &error_abort);
> >> =C2=A0 diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> >> index fd0f2c268f..8b94b70f14 100644
> >> --- a/hw/i386/pc_piix.c
> >> +++ b/hw/i386/pc_piix.c
> >> @@ -297,8 +297,8 @@ static void pc_init1(MachineState *machine,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PC_MACHINE_ACP=
I_DEVICE_PROP,
> >> &error_abort);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (pcms->acpi_nvdimm_state.is_enabled) {
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvdimm_init_acpi_state(&pc=
ms->acpi_nvdimm_state, system_io,
> >> +=C2=A0=C2=A0=C2=A0 if (machine->acpi_nvdimm_state.is_enabled) {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvdimm_init_acpi_state(&ma=
chine->acpi_nvdimm_state, system_io,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pcms->fw_cfg, OBJECT(pcms)=
);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> =C2=A0 }
> >> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> >> index 4a175ea50e..26727c964d 100644
> >> --- a/hw/i386/pc_q35.c
> >> +++ b/hw/i386/pc_q35.c
> >> @@ -329,8 +329,8 @@ static void pc_q35_init(MachineState *machine)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pc_vga_init(isa_bus, host_bus);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pc_nic_init(pcmc, isa_bus, host_bus);
> >> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (pcms->acpi_nvdimm_state.is_enabled) {
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvdimm_init_acpi_state(&pc=
ms->acpi_nvdimm_state, system_io,
> >> +=C2=A0=C2=A0=C2=A0 if (machine->acpi_nvdimm_state.is_enabled) {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvdimm_init_acpi_state(&ma=
chine->acpi_nvdimm_state, system_io,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pcms->fw_cfg, OBJECT(pcms)=
);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> =C2=A0 }
> >> diff --git a/include/hw/boards.h b/include/hw/boards.h
> >> index 05f9f45c3d..b55c9cc087 100644
> >> --- a/include/hw/boards.h
> >> +++ b/include/hw/boards.h
> >> @@ -8,6 +8,7 @@
> >> =C2=A0 #include "hw/qdev.h"
> >> =C2=A0 #include "qom/object.h"
> >> =C2=A0 #include "qom/cpu.h"
> >> +#include "hw/mem/nvdimm.h"
> >> =C2=A0 =C2=A0 /**
> >> =C2=A0=C2=A0 * memory_region_allocate_system_memory - Allocate a board=
's main
> >> memory
> >> @@ -268,6 +269,7 @@ struct MachineState {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *cpu_type;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AccelState *accelerator;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPUArchIdList *possible_cpus;
> >> +=C2=A0=C2=A0=C2=A0 AcpiNVDIMMState acpi_nvdimm_state;
> >> =C2=A0 };
> >> =C2=A0 =C2=A0 #define DEFINE_MACHINE(namestr, machine_initfn) \
> >> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> >> index 3ff127ebd0..f7c59743e0 100644
> >> --- a/include/hw/i386/pc.h
> >> +++ b/include/hw/i386/pc.h
> >> @@ -45,8 +45,6 @@ struct PCMachineState {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OnOffAuto vmport;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OnOffAuto smm;
> >> =C2=A0 -=C2=A0=C2=A0=C2=A0 AcpiNVDIMMState acpi_nvdimm_state;
> >> -
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool acpi_build_enabled;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool smbus_enabled;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool sata_enabled;
> >> @@ -74,8 +72,6 @@ struct PCMachineState {
> >> =C2=A0 #define PC_MACHINE_MAX_RAM_BELOW_4G "max-ram-below-4g"
> >> =C2=A0 #define PC_MACHINE_VMPORT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 "vmport"
> >> =C2=A0 #define PC_MACHINE_SMM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "smm"
> >> -#define PC_MACHINE_NVDIMM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "nvdimm"
> >> -#define PC_MACHINE_NVDIMM_PERSIST=C2=A0=C2=A0 "nvdimm-persistence"
> >> =C2=A0 #define PC_MACHINE_SMBUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "smbus"
> >> =C2=A0 #define PC_MACHINE_SATA=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "sata"
> >> =C2=A0 #define PC_MACHINE_PIT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "pit"
> >> diff --git a/include/hw/mem/pc-dimm.h b/include/hw/mem/pc-dimm.h
> >> index 01436b9f50..3e5489d3a1 100644
> >> --- a/include/hw/mem/pc-dimm.h
> >> +++ b/include/hw/mem/pc-dimm.h
> >> @@ -19,7 +19,6 @@
> >> =C2=A0 #include "exec/memory.h"
> >> =C2=A0 #include "sysemu/hostmem.h"
> >> =C2=A0 #include "hw/qdev.h"
> >> -#include "hw/boards.h"
> >> =C2=A0 =C2=A0 #define TYPE_PC_DIMM "pc-dimm"
> >> =C2=A0 #define PC_DIMM(obj) \ =20
> >=20
> >  =20


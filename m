Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3866160wrt;
        Mon, 10 Dec 2018 09:31:35 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VYW7c0TLGyQOZh6/J8mD0C/Xd2XGaGlwq3eHBqzgblMCHZrzo9Sfts1ev2HBHcP/vl/+eJ
X-Received: by 2002:a37:bd47:: with SMTP id n68mr11558011qkf.203.1544463095107;
        Mon, 10 Dec 2018 09:31:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544463095; cv=none;
        d=google.com; s=arc-20160816;
        b=viwl4qdesU7VmyUN23vRU9k4NJo2Nhr7AFnDLpGAvuu+EvbX1Nw7aJ3l5+4Nn5UcfE
         v43J0ws4GDZ4BTqrmzA5XJ5Xih0CvuWSA42OTuFzTOeWvK6FHcApf0nsHx3HRDP1EZ1T
         7kpQXGJiFxai4+qOpzm01f9DZlFoT0tqaoBT3+gcz9vKNoTTl5j3AqnoVG4aMTnDT766
         eS0sXrnNzhXDw4VBLFF1I48zF9WNC6Hs0PyO6fSvCv6yOkzzVPpIr0vEo43NMhKY4BAA
         LE+e0k6Nuy+8PIvCCCSbIFKAM3dEacx0jLsWKymAdoQhi/sWHA1Z6eafr6cD7dpCrXwZ
         DEyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=ObQxKJN2EWrrSwmotlLhofE8myy9dHWGl9CH1e8N268=;
        b=iyJx6JWzz7n98Z61A0v2p+oKdv9Gyo1QXoqPFQ5McH9F2qjRp1tswwGPAlzgWanfqH
         PU14Ofu6+g3gGWcYhZFS0hjMmxbiNvpNUdD4hbTIfZt1UrgElUAXwTr2QitccVAC+E9U
         fZ1yI56HRZjFs7jEugLS4yEJH1W8ddVjt4Em1UkG5wlIq9t2YWXF5k5e36smbMNgDbFH
         u9gMOGU+0hBxvrJNOHTzZS5Sjo0sxPF0tqkK994V9Be3s+T9TJqv2jUCgqLmc0WGXWnN
         3+vi5igrUVLkcL5bUqS+d7JeHpg9fT/GW359/ptqKLyEvK5mFRTKvreW6X2Idq/uYspf
         GKSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y11si739171qtm.124.2018.12.10.09.31.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Dec 2018 09:31:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33955 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWPP4-000614-JW
	for alex.bennee@linaro.org; Mon, 10 Dec 2018 12:31:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gWPOw-00060M-MX
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 12:31:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gWPOt-0003QS-IJ
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 12:31:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36988)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gWPOt-0003QF-9f; Mon, 10 Dec 2018 12:31:23 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 46B61312E9E7;
	Mon, 10 Dec 2018 17:31:22 +0000 (UTC)
Received: from localhost (ovpn-116-63.gru2.redhat.com [10.97.116.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EBEF52706B;
	Mon, 10 Dec 2018 17:31:19 +0000 (UTC)
Date: Mon, 10 Dec 2018 15:31:18 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20181210173118.GF4669@habkost.net>
References: <20181204142023.15982-1-marcandre.lureau@redhat.com>
	<20181204142023.15982-9-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20181204142023.15982-9-marcandre.lureau@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Mon, 10 Dec 2018 17:31:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.2 v5 08/19] hw: apply
 machine compat properties without touching globals
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	"open list:sPAPR" <qemu-ppc@nongnu.org>,
	Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	"open list:S390" <qemu-s390x@nongnu.org>,
	"open list:Virt" <qemu-arm@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, imammedo@redhat.com,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: USzG9aPvN+Q4

On Tue, Dec 04, 2018 at 06:20:12PM +0400, Marc-Andr=E9 Lureau wrote:
> Similarly to accel properties, move compat properties out of globals
> registration, and apply the machine compat properties during
> device_post_init().
>=20
> As suggested during review, populating the arrays can be done directly
> without resorting to using macros.
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/hw/boards.h        |   3 +-
>  hw/arm/virt.c              |  48 ++-
>  hw/core/machine.c          |  19 +-
>  hw/core/qdev.c             |   2 +
>  hw/i386/pc_piix.c          | 588 +++++++++++++++++++++----------------
>  hw/i386/pc_q35.c           |  70 ++++-
>  hw/ppc/spapr.c             | 209 +++++++------
>  hw/s390x/s390-virtio-ccw.c | 220 +++++++-------
>  vl.c                       |   1 -
>  9 files changed, 673 insertions(+), 487 deletions(-)
>=20
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index f82f28468b..28c2b0af41 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -69,7 +69,6 @@ int machine_kvm_shadow_mem(MachineState *machine);
>  int machine_phandle_start(MachineState *machine);
>  bool machine_dump_guest_core(MachineState *machine);
>  bool machine_mem_merge(MachineState *machine);
> -void machine_register_compat_props(MachineState *machine);
>  HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *mac=
hine);
>  void machine_set_cpu_numa_node(MachineState *machine,
>                                 const CpuInstanceProperties *props,
> @@ -191,7 +190,7 @@ struct MachineClass {
>      const char *default_machine_opts;
>      const char *default_boot_order;
>      const char *default_display;
> -    GArray *compat_props;
> +    GPtrArray *compat_props;
>      const char *hw_version;
>      ram_addr_t default_ram_size;
>      const char *default_cpu_type;
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f69e7eb399..530c8ca89d 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1872,8 +1872,9 @@ static void virt_machine_3_1_options(MachineClass=
 *mc)
>  }
>  DEFINE_VIRT_MACHINE_AS_LATEST(3, 1)
> =20
> -#define VIRT_COMPAT_3_0 \
> +static GlobalProperty virt_compat_3_0[] =3D {
>      HW_COMPAT_3_0
> +};
[...]

All the changes to compat macros are independent from the change
you describe in the patch subject, and makes review more
difficult.  What about doing that in a separate patch?

We can replace all the virt.c, pc_piix.c, pc_q35.c, and spapr.c
hunks in this patch with the following:

diff --git a/include/hw/boards.h b/include/hw/boards.h
index f82f28468b..622bbaf939 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -290,18 +289,10 @@ struct MachineState {
=20
 #define SET_MACHINE_COMPAT(m, COMPAT) \
     do {                              \
-        int i;                        \
         static GlobalProperty props[] =3D {       \
             COMPAT                              \
-            { /* end of list */ }               \
         };                                      \
-        if (!m->compat_props) { \
-            m->compat_props =3D g_array_new(false, false, sizeof(void *)=
); \
-        } \
-        for (i =3D 0; props[i].driver !=3D NULL; i++) {    \
-            GlobalProperty *prop =3D &props[i];          \
-            g_array_append_val(m->compat_props, prop); \
-        }                                              \
+        compat_props_add(m->compat_props, props, G_N_ELEMENTS(props)); \
     } while (0)
=20
 #endif


--=20
Eduardo

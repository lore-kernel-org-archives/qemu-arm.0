Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2069390wrt;
        Fri, 23 Nov 2018 06:02:54 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Xil9pxyIcvPAQYi+MDXadeIzcINt3d9wDgqDx84svyqLg1kMqniFE8FNRtpsLOTWIk2YBX
X-Received: by 2002:a25:ba04:: with SMTP id t4-v6mr16514912ybg.251.1542981774157;
        Fri, 23 Nov 2018 06:02:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542981774; cv=none;
        d=google.com; s=arc-20160816;
        b=g/4iCKnlaOkYrJZxWacu18ygt/x8VCjkwKJ063uoqrGwIHhCyQP/V0peX11+Pyg+Di
         ZqQ4+rKU5BYLn+Yye7BtqVKJiWMctHCkdZfFQHF03+N5WlmxpxF5aVzwdTJDNp+JU+OJ
         0naXxeQr6KYKoCUiWYnK8g2BgKNwJ8F+/CY2MST0BWaLTJoTkGjQT/6NGy+HHZIcpaFm
         APALoa/4PjaNExR9S8nzwVHwsD1G8ixkHUcJffUOMsAhBg5x+u/5pqpdaYNGbqgHa2Q3
         j5yQlI12jd77wMvfcVWDhFHgmvBho0HxD+Y//Ny97VKGtugbdkMVJHvD613xtEZCG3Hn
         BuAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=nO16Auvtges4nYnMg/G12fth1FUqHl9b7RdZiqJEoBo=;
        b=dCc2faWhsc9ofmiPO3BtIUu2/jS4wAOahBcf7mgH/Tn+HbCy8FG/KYLTgOGPG5Gund
         5BVOh6pbExc276G8wRDLLVItV+4J/EuAucp/Ibr8T+czmcTLjWcfHKLNcJVXxnFJED8i
         Jn6iS2O5vf3OhOwqz3kkwGIqOHPngY92qESre/L0orUZzwRuUrhm2DXFmOYCg1pZonRI
         qw8Q497HwqFMep9pvt4qayUqaKhNxXaNgcfHqzgtx5RmlGglQ3BEn1iVm5itBQDKQmUi
         lI/QMJn4Tho74wCZlKNiy7jcV63dOIOStkg0hwv29rTc2PtbxMZXbxBPeOw7CiH6NWnN
         j9Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 204-v6si31035407ywi.343.2018.11.23.06.02.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 06:02:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52513 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQC2n-0001Ta-1z
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 09:02:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gQC2c-0001Rq-Jy
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 09:02:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gQC2Z-0003CM-Dn
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 09:02:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54230)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gQC2Z-00039r-5x; Fri, 23 Nov 2018 09:02:39 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A83F97AE93;
	Fri, 23 Nov 2018 14:02:37 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4E4782A306;
	Fri, 23 Nov 2018 14:02:28 +0000 (UTC)
Date: Fri, 23 Nov 2018 15:02:27 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20181123150227.38d17ca0@redhat.com>
In-Reply-To: <20181107123652.23417-7-marcandre.lureau@redhat.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
	<20181107123652.23417-7-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 23 Nov 2018 14:02:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-3.2 v3 06/14] qdev: do not mix compat
 props with global props
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	=?UTF-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, dgilbert@redhat.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
	Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LH0qo7gyJ9hf

On Wed,  7 Nov 2018 16:36:44 +0400
Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:

> Machine & Accel props are not provided by user. Let's not mix them
> with the global properties.
>=20
> Call a new helper function object_apply_global_props() during
> device_post_init().
>=20
> Add a stub for current_machine, so qemu-user and tests can find a
> fallback symbol when linking with QDev.
>=20
> The following patches is going to reuse object_apply_global_props()
> for qdev globals.
There are several things ongoing here,
 1. switching from GlobalProperty to GArray for accel
       maybe generalize and reuse SET_MACHINE_COMPAT() there?
        SET_MACHINE_COMPAT() -> SET_COMPAT(GArray*, COMPAT)

 2. decoupling compat vs globals
=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/hw/boards.h            |  1 -
>  include/qom/object.h           |  2 ++
>  include/sysemu/accel.h         |  4 +---
>  accel/accel.c                  | 12 ------------
>  hw/core/machine.c              | 18 ------------------
>  hw/core/qdev.c                 |  8 ++++++++
>  hw/xen/xen-common.c            |  9 ++++++++-
>  qom/object.c                   | 25 +++++++++++++++++++++++++
>  stubs/machine.c                |  4 ++++=20
>  tests/test-qdev-global-props.c |  1 -
>  vl.c                           |  2 --
>  stubs/Makefile.objs            |  1 +
>  12 files changed, 49 insertions(+), 38 deletions(-)
>  create mode 100644 stubs/machine.c
>=20
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index f82f28468b..c02190fc52 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -69,7 +69,6 @@ int machine_kvm_shadow_mem(MachineState *machine);
>  int machine_phandle_start(MachineState *machine);
>  bool machine_dump_guest_core(MachineState *machine);
>  bool machine_mem_merge(MachineState *machine);
> -void machine_register_compat_props(MachineState *machine);
>  HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machi=
ne);
>  void machine_set_cpu_numa_node(MachineState *machine,
>                                 const CpuInstanceProperties *props,
> diff --git a/include/qom/object.h b/include/qom/object.h
> index f0b0bf39cc..e58eeb280f 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -679,6 +679,8 @@ Object *object_new_with_propv(const char *typename,
>                                Error **errp,
>                                va_list vargs);
> =20
> +void object_apply_global_props(Object *obj, GArray *props, Error **errp);
> +
>  /**
>   * object_set_props:
>   * @obj: the object instance to set properties on
> diff --git a/include/sysemu/accel.h b/include/sysemu/accel.h
> index 637358f430..f4f71134b5 100644
> --- a/include/sysemu/accel.h
> +++ b/include/sysemu/accel.h
> @@ -49,7 +49,7 @@ typedef struct AccelClass {
>       * global properties may be overridden by machine-type
>       * compat_props or user-provided global properties.
>       */
> -    GlobalProperty *global_props;
> +    GArray *compat_props;
>  } AccelClass;
> =20
>  #define TYPE_ACCEL "accel"
> @@ -67,8 +67,6 @@ typedef struct AccelClass {
>  extern unsigned long tcg_tb_size;
> =20
>  void configure_accelerator(MachineState *ms);
> -/* Register accelerator specific global properties */
> -void accel_register_compat_props(AccelState *accel);
>  /* Called just before os_setup_post (ie just before drop OS privs) */
>  void accel_setup_post(MachineState *ms);
> =20
> diff --git a/accel/accel.c b/accel/accel.c
> index 3da26eb90f..6db5d8f4df 100644
> --- a/accel/accel.c
> +++ b/accel/accel.c
> @@ -119,18 +119,6 @@ void configure_accelerator(MachineState *ms)
>      }
>  }
> =20
> -void accel_register_compat_props(AccelState *accel)
> -{
> -    AccelClass *class =3D ACCEL_GET_CLASS(accel);
> -    GlobalProperty *prop =3D class->global_props;
> -
> -    for (; prop && prop->driver; prop++) {
> -        /* Any compat_props must never cause error */
> -        prop->errp =3D &error_abort;
> -        qdev_prop_register_global(prop);
> -    }
> -}
> -
>  void accel_setup_post(MachineState *ms)
>  {
>      AccelState *accel =3D ms->accelerator;
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index da50ad6de7..4444d45945 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -844,24 +844,6 @@ static void machine_class_finalize(ObjectClass *klas=
s, void *data)
>      g_free(mc->name);
>  }
> =20
> -void machine_register_compat_props(MachineState *machine)
> -{
> -    MachineClass *mc =3D MACHINE_GET_CLASS(machine);
> -    int i;
> -    GlobalProperty *p;
> -
> -    if (!mc->compat_props) {
> -        return;
> -    }
> -
> -    for (i =3D 0; i < mc->compat_props->len; i++) {
> -        p =3D g_array_index(mc->compat_props, GlobalProperty *, i);
> -        /* Machine compat_props must never cause errors: */
> -        p->errp =3D &error_abort;
> -        qdev_prop_register_global(p);
> -    }
> -}
> -
>  static const TypeInfo machine_info =3D {
>      .name =3D TYPE_MACHINE,
>      .parent =3D TYPE_OBJECT,
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 6b3cc55b27..30890f2c8d 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -972,6 +972,14 @@ static void device_initfn(Object *obj)
> =20
>  static void device_post_init(Object *obj)
>  {
> +    if (current_machine) {
> +        MachineClass *mc =3D MACHINE_GET_CLASS(current_machine);
> +        AccelClass *ac =3D ACCEL_GET_CLASS(current_machine->accelerator);
> +

> +        object_apply_global_props(obj, mc->compat_props, &error_abort);
> +        object_apply_global_props(obj, ac->compat_props, &error_abort);
1. this is order inversion as opposed to register_global_properties(),
   but looking at xen_compat_props[] and existing machine compats
   it should work fine as they all are using switching off the same propert=
ies
   so there is no conflict if order is changed but it will change semantics=
 of
   AccelClass::global_props that's says that machine compats will override =
accel ones.

2. I'd prefer following style:
       if (mc->compat_props) {
            object_apply_global_props(...);
       }
   so I don't have to jump inside of object_apply_global_props() to figure =
out
   that it is not if props are NULL

3. I quite dislike using current_machine here. Not sure what to do though
   maybe in parallel to global_props create a compat_props registry would b=
e better:
   hw/core/qdev-properties.c:
       static GList *global_props;
     + static GList *compat_props;
   you won't poison device model with access to higher level object and
   there would be no need for a stub.

> +    }
> +
>      qdev_prop_set_globals(DEVICE(obj));
>  }
> =20
> diff --git a/hw/xen/xen-common.c b/hw/xen/xen-common.c
> index 6ec14c73ca..d1ef7a53cc 100644
> --- a/hw/xen/xen-common.c
> +++ b/hw/xen/xen-common.c
> @@ -181,11 +181,18 @@ static GlobalProperty xen_compat_props[] =3D {
>  static void xen_accel_class_init(ObjectClass *oc, void *data)
>  {
>      AccelClass *ac =3D ACCEL_CLASS(oc);
> +    int i;
> +
>      ac->name =3D "Xen";
>      ac->init_machine =3D xen_init;
>      ac->setup_post =3D xen_setup_post;
>      ac->allowed =3D &xen_allowed;
> -    ac->global_props =3D xen_compat_props;
> +
> +    ac->compat_props =3D g_array_new(false, false, sizeof(void *));
> +    for (i =3D 0; xen_compat_props[i].driver !=3D NULL; i++) {
> +        GlobalProperty *prop =3D &xen_compat_props[i];
> +        g_array_append_val(ac->compat_props, prop);
> +    }
>  }
> =20
>  #define TYPE_XEN_ACCEL ACCEL_CLASS_NAME("xen")
> diff --git a/qom/object.c b/qom/object.c
> index eb770dbf7f..9acdf9e16d 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -372,6 +372,31 @@ static void object_post_init_with_type(Object *obj, =
TypeImpl *ti)
>      }
>  }
> =20
> +void object_apply_global_props(Object *obj, GArray *props, Error **errp)
> +{
> +    Error *err =3D NULL;
> +    int i;
> +
> +    if (!props) {
> +        return;
> +    }
> +
> +    for (i =3D 0; i < props->len; i++) {
> +        GlobalProperty *p =3D g_array_index(props, GlobalProperty *, i);
> +
> +        if (object_dynamic_cast(obj, p->driver) =3D=3D NULL) {
> +            continue;
> +        }
> +        p->used =3D true;
> +        object_property_parse(obj, p->value, p->property, &err);
> +        if (err !=3D NULL) {
> +            error_prepend(&err, "can't apply global %s.%s=3D%s: ",
> +                          p->driver, p->property, p->value);
> +            error_propagate(errp, err);
> +        }
> +    }
> +}
> +
>  static void object_initialize_with_type(void *data, size_t size, TypeImp=
l *type)
>  {
>      Object *obj =3D data;
> diff --git a/stubs/machine.c b/stubs/machine.c
> new file mode 100644
> index 0000000000..51d40fd677
> --- /dev/null
> +++ b/stubs/machine.c
> @@ -0,0 +1,4 @@
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +
> +MachineClass *current_machine;
> diff --git a/tests/test-qdev-global-props.c b/tests/test-qdev-global-prop=
s.c
> index b1eb505442..3a8d3170a0 100644
> --- a/tests/test-qdev-global-props.c
> +++ b/tests/test-qdev-global-props.c
> @@ -28,7 +28,6 @@
>  #include "qom/object.h"
>  #include "qapi/visitor.h"
> =20
> -
unrelated change

>  #define TYPE_STATIC_PROPS "static_prop_type"
>  #define STATIC_TYPE(obj) \
>      OBJECT_CHECK(MyType, (obj), TYPE_STATIC_PROPS)
> diff --git a/vl.c b/vl.c
> index 55bab005b6..2aea884c9d 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -2963,8 +2963,6 @@ static void user_register_global_props(void)
>   */
>  static void register_global_properties(MachineState *ms)
>  {
> -    accel_register_compat_props(ms->accelerator);
> -    machine_register_compat_props(ms);
>      user_register_global_props();
>  }
> =20
> diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
> index 5dd0aeeec6..6ce33ae46f 100644
> --- a/stubs/Makefile.objs
> +++ b/stubs/Makefile.objs
> @@ -18,6 +18,7 @@ stub-obj-y +=3D iothread-lock.o
>  stub-obj-y +=3D is-daemonized.o
>  stub-obj-$(CONFIG_LINUX_AIO) +=3D linux-aio.o
>  stub-obj-y +=3D machine-init-done.o
> +stub-obj-y +=3D machine.o
>  stub-obj-y +=3D migr-blocker.o
>  stub-obj-y +=3D change-state-handler.o
>  stub-obj-y +=3D monitor.o


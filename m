Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp620930wrt;
        Tue, 11 Dec 2018 06:05:30 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VSXLihrSS6oHSpNVoGwlig7V+k6zjFqF38LCtg1bZYDuB40iQDJl58svfp/fn3hrObQP+J
X-Received: by 2002:a0c:8822:: with SMTP id 31mr15572092qvl.5.1544537130507;
        Tue, 11 Dec 2018 06:05:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544537130; cv=none;
        d=google.com; s=arc-20160816;
        b=qvNIt3kfH8x1CbmAFP4Eq5UbrxpAcd/HlMzJiQqqSOaNDbCrQvVQFo8/Tv2zaNM2vL
         LQwLwXb6H3AV1buQwlig6Djl5QCwquuHuud99OnL4OckYa5gvHZ/zhhwSZU31RMvJU0q
         JW4466Gg5B5Vnutsk7AoOJNlgF2IoNzTgc4o9DVVm0E7oz8ZzrS3aOv8dCJwzNYJGZAy
         bKMMv7ykZDKjFwjSLag+FMIZPd+xCqQOULjC5BZ7YqDFT4S2n7QVxcemCtCqJ8Ix0BGa
         4duum6BS1r1iAqEFhg9sUN1t1fB+zo59MIPKse/fEDvLiYk3D3NWD9qmkkXrKMnUbURH
         vbNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=J4ocvMtkEuEVajUWLorftrJIMkkBNGG9IZYLcC3fYwA=;
        b=bwjxAqL/FSfz00HtiFwXtsSc9fBRXhrmlCQP4EXnJVlWVkkZzZpBjlgjFdfMNckaE/
         h66doCYE2vRd/96c5CO6yAsQ25vOzaWEDX+VblDwq8KEqo6ZU/7z3JCn+KX/nWjJhYkH
         XQOaSpIaJv7LeSBQ69RrZuOnvREiNVaiw6uIi+5Nxq6+gLQjWblrJSbnmHQIppQHbhYl
         NTSHxh/D6qyGAXhPwVVQI/mytqOEoBQgJ8SlPmvxDlwv5Z8AjO7LWGkJAv+S0iNiXmfH
         uYVhYUXJRQyX5jry6xsQ0fqnXAJJTmdXpkPMKLCpKR+zP62SDruSz3sPOtmWOES0b3YN
         tBVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e12si4947844qvj.70.2018.12.11.06.05.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Dec 2018 06:05:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38312 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWifB-0007Vd-N8
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 09:05:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gWicz-00062i-3x
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 09:03:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gWicv-0004oP-S2
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 09:03:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56458)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gWicv-0004np-IR; Tue, 11 Dec 2018 09:03:09 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A8936308428D;
	Tue, 11 Dec 2018 14:03:08 +0000 (UTC)
Received: from localhost (ovpn-116-63.gru2.redhat.com [10.97.116.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F68E1057077;
	Tue, 11 Dec 2018 14:02:48 +0000 (UTC)
Date: Tue, 11 Dec 2018 12:02:47 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Message-ID: <20181211140247.GA20015@habkost.net>
References: <20181204142023.15982-1-marcandre.lureau@redhat.com>
	<20181204142023.15982-9-marcandre.lureau@redhat.com>
	<20181210173118.GF4669@habkost.net>
	<CAJ+F1CKcNhLsu=b5ZJbA_6Kyb3_EUt3nzsZ0q+OWpvZS6JyytA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CAJ+F1CKcNhLsu=b5ZJbA_6Kyb3_EUt3nzsZ0q+OWpvZS6JyytA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 11 Dec 2018 14:03:08 +0000 (UTC)
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, QEMU <qemu-devel@nongnu.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Qemu-s390x list <qemu-s390x@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:sPAPR pseries" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LH1lBQ6L1kfN

On Tue, Dec 11, 2018 at 04:07:19PM +0400, Marc-Andr=E9 Lureau wrote:
> Hi
>=20
> On Mon, Dec 10, 2018 at 9:31 PM Eduardo Habkost <ehabkost@redhat.com> w=
rote:
> >
> > On Tue, Dec 04, 2018 at 06:20:12PM +0400, Marc-Andr=E9 Lureau wrote:
> > > Similarly to accel properties, move compat properties out of global=
s
> > > registration, and apply the machine compat properties during
> > > device_post_init().
> > >
> > > As suggested during review, populating the arrays can be done direc=
tly
> > > without resorting to using macros.
> > >
> > > Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> > > ---
> > >  include/hw/boards.h        |   3 +-
> > >  hw/arm/virt.c              |  48 ++-
> > >  hw/core/machine.c          |  19 +-
> > >  hw/core/qdev.c             |   2 +
> > >  hw/i386/pc_piix.c          | 588 +++++++++++++++++++++------------=
----
> > >  hw/i386/pc_q35.c           |  70 ++++-
> > >  hw/ppc/spapr.c             | 209 +++++++------
> > >  hw/s390x/s390-virtio-ccw.c | 220 +++++++-------
> > >  vl.c                       |   1 -
> > >  9 files changed, 673 insertions(+), 487 deletions(-)
> > >
> > > diff --git a/include/hw/boards.h b/include/hw/boards.h
> > > index f82f28468b..28c2b0af41 100644
> > > --- a/include/hw/boards.h
> > > +++ b/include/hw/boards.h
> > > @@ -69,7 +69,6 @@ int machine_kvm_shadow_mem(MachineState *machine)=
;
> > >  int machine_phandle_start(MachineState *machine);
> > >  bool machine_dump_guest_core(MachineState *machine);
> > >  bool machine_mem_merge(MachineState *machine);
> > > -void machine_register_compat_props(MachineState *machine);
> > >  HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState =
*machine);
> > >  void machine_set_cpu_numa_node(MachineState *machine,
> > >                                 const CpuInstanceProperties *props,
> > > @@ -191,7 +190,7 @@ struct MachineClass {
> > >      const char *default_machine_opts;
> > >      const char *default_boot_order;
> > >      const char *default_display;
> > > -    GArray *compat_props;
> > > +    GPtrArray *compat_props;
> > >      const char *hw_version;
> > >      ram_addr_t default_ram_size;
> > >      const char *default_cpu_type;
> > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > index f69e7eb399..530c8ca89d 100644
> > > --- a/hw/arm/virt.c
> > > +++ b/hw/arm/virt.c
> > > @@ -1872,8 +1872,9 @@ static void virt_machine_3_1_options(MachineC=
lass *mc)
> > >  }
> > >  DEFINE_VIRT_MACHINE_AS_LATEST(3, 1)
> > >
> > > -#define VIRT_COMPAT_3_0 \
> > > +static GlobalProperty virt_compat_3_0[] =3D {
> > >      HW_COMPAT_3_0
> > > +};
> > [...]
> >
> > All the changes to compat macros are independent from the change
> > you describe in the patch subject, and makes review more
> > difficult.  What about doing that in a separate patch?
> >
> > We can replace all the virt.c, pc_piix.c, pc_q35.c, and spapr.c
> > hunks in this patch with the following:
> >
> > diff --git a/include/hw/boards.h b/include/hw/boards.h
> > index f82f28468b..622bbaf939 100644
> > --- a/include/hw/boards.h
> > +++ b/include/hw/boards.h
> > @@ -290,18 +289,10 @@ struct MachineState {
> >
> >  #define SET_MACHINE_COMPAT(m, COMPAT) \
> >      do {                              \
> > -        int i;                        \
> >          static GlobalProperty props[] =3D {       \
> >              COMPAT                              \
> > -            { /* end of list */ }               \
> >          };                                      \
> > -        if (!m->compat_props) { \
> > -            m->compat_props =3D g_array_new(false, false, sizeof(voi=
d *)); \
> > -        } \
> > -        for (i =3D 0; props[i].driver !=3D NULL; i++) {    \
> > -            GlobalProperty *prop =3D &props[i];          \
> > -            g_array_append_val(m->compat_props, prop); \
> > -        }                                              \
> > +        compat_props_add(m->compat_props, props, G_N_ELEMENTS(props)=
); \
> >      } while (0)
> >
> >  #endif
> >
>=20
> Didn't you ask in a previous iteration to remove the macros?
> "I like us to be able to
> register compat properties without macro magic.  The existence of
> SET_MACHINE_COMPAT is a bug and not a feature.

I did ask you to not introduce a new macro in accel.c, and
removing the existing macros is really welcome.  I just don't
think we should do everything in a single patch.

--=20
Eduardo

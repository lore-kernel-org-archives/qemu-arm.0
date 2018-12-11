Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp503893wrt;
        Tue, 11 Dec 2018 04:07:57 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XnTMVUYGsvVdE/7yzJQQ7XZNo0f3Ce9aK68jIgXs9nsSJxjpsi60DbKq9A6OVLbR85RB6G
X-Received: by 2002:aed:31a3:: with SMTP id 32mr15956683qth.234.1544530077869;
        Tue, 11 Dec 2018 04:07:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544530077; cv=none;
        d=google.com; s=arc-20160816;
        b=kgoc2Hy+P1QkjJdQy0xaa90erNw2TqgS6pXxPsdLBnLjGMlWl3JUArvn65kTq3IxXL
         tIfhJ07FrP/Eja3x7Pk93SNP2LIUAuqptlj+c1SSj7wtif2E8A9FovfQUsi0AV7w5g3B
         PzOu8dydgLCOjDFBTLG25AzFdiFRUTS/LvZIbr1CaukztaMk4BLWtKhYljYX85rpbO1B
         tEjZCKdp0bMjZ9Uaj9DbzTSLAGUBEO0NQkE1v2Miwn3PYphrVZEySJ010lCjgJjSJQnr
         vDahpoCSELXkoBZHAaQFBPRvczMO+B+ZdwuJY/BKMTIgLsUw8ymUeC5NjuS/wtm7ky8o
         Dq5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=UtLjTnfeqiC4QrleR+jh7G5b5Mwj6iUNW8fYMQ6UOvE=;
        b=N128x5SHubsfKYvLKV9dZBW4vxCA20Jgq4TbaEgqgCwI2rUaDLbC1ok06/1Vu2BHL1
         eNtKHpUJZZ3jjp4eZU0cJGNpfjwzqafW7ZaygqVaEIaLPTE4e3FwTcb55m9Z5yvgu0n8
         sjZhnOI6Iil9+MY5eL4THs/9bnPYWmKxyVcCwVLquMM0h3BKwYJo3GdZ+BGgrY6YZP8v
         33/elNV7IW2CWwLig8YKKom2AGsK67cZMU7rjPS7e52OZgs/hNp4key/7ojgxKBmczIK
         WbDz/IjadZrJ/VchcHytpogiuknHq2vfrneIfiRcDpsbY7EROukUyVSeJ2h5nXjxRNkr
         h5fQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mb1p3X11;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g1si4318845qtr.315.2018.12.11.04.07.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Dec 2018 04:07:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mb1p3X11;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37679 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWgpR-0005dX-DN
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 07:07:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1gWgp7-0005ad-AT
	for qemu-devel@nongnu.org; Tue, 11 Dec 2018 07:07:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1gWgp6-0006mT-Bq
	for qemu-devel@nongnu.org; Tue, 11 Dec 2018 07:07:37 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:38620)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1gWgp4-0006jN-74; Tue, 11 Dec 2018 07:07:34 -0500
Received: by mail-wm1-x344.google.com with SMTP id m22so1996337wml.3;
	Tue, 11 Dec 2018 04:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=UtLjTnfeqiC4QrleR+jh7G5b5Mwj6iUNW8fYMQ6UOvE=;
	b=mb1p3X11lFfU/ShAordGg0VsDHxoTfmmtdNZqNUKYGLll+QdBGoU4oNhEm6ygLD173
	MPi2whu23Q1Bxr5Oaz4Zx0NaG/j8qTNjkVjhf2Frp5bwH8Au3xuc4zSQ/dTFfJai/tvZ
	ez0GFVkbtSIJBImxbSWqPxGSmx1IPNN40aM4tBVyTa77IwxatJ48vjUYY/b+OLzgRjuU
	r6qiGMP9kH7J1pYiwEozUhCFct7608UPYn89CiUqw3GLwXYLuRqmuWc3WWbx0pRYa1Ws
	d/jMJ/NOEBAnTX+4+HweerSCh/25kY74NeQt/VgbSqpwEJOyG7pGg1LBN74bc1UOYsKe
	erQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=UtLjTnfeqiC4QrleR+jh7G5b5Mwj6iUNW8fYMQ6UOvE=;
	b=j4K1OklRYiNCB07rbsQTmjSqKD4TDMJBocGb6nPy9ItO7Sp822QZn+rhwvlD9CUQmD
	CEbXfIY88ABZyeHmYZIxRad0MATfqdh/IGxiVaEEu+jJs/3SFlu/CITIVVjQPp03NldJ
	wcaQ9rT7cKEdBVY2+klUV2KL88dssG5QTDMdK+VyYpZIOKjc+t/m1d1ppPuuga3grGOV
	iM5mfRYtM5y6VkqU5j0r0WMez/htL19QkArlf32lBqueH09S9ogyHbAdFboKXWX1pT0F
	DdPwAUdKsOQgpoItuz9cnRIxKKN3kWjhiuepd8AV+b5Gy5rSB/LOVmb9mnjiXarqX9qI
	36oA==
X-Gm-Message-State: AA+aEWZUMo3dEgUjvLiYWgMc0ZeVQ9fZvWnmTb7IPkjyaJc1AfVZEAk/
	mvBB4XTFroUsfkv9eokXAkTp8sjNw2AvYx51H0U=
X-Received: by 2002:a1c:2902:: with SMTP id p2mr2020713wmp.19.1544530051630;
	Tue, 11 Dec 2018 04:07:31 -0800 (PST)
MIME-Version: 1.0
References: <20181204142023.15982-1-marcandre.lureau@redhat.com>
	<20181204142023.15982-9-marcandre.lureau@redhat.com>
	<20181210173118.GF4669@habkost.net>
In-Reply-To: <20181210173118.GF4669@habkost.net>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 11 Dec 2018 16:07:19 +0400
Message-ID: <CAJ+F1CKcNhLsu=b5ZJbA_6Kyb3_EUt3nzsZ0q+OWpvZS6JyytA@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: Re: [Qemu-devel] [PATCH for-3.2 v5 08/19] hw: apply machine compat
 properties without touching globals
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XBIWG2nM/Q3S

Hi

On Mon, Dec 10, 2018 at 9:31 PM Eduardo Habkost <ehabkost@redhat.com> wrote=
:
>
> On Tue, Dec 04, 2018 at 06:20:12PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > Similarly to accel properties, move compat properties out of globals
> > registration, and apply the machine compat properties during
> > device_post_init().
> >
> > As suggested during review, populating the arrays can be done directly
> > without resorting to using macros.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  include/hw/boards.h        |   3 +-
> >  hw/arm/virt.c              |  48 ++-
> >  hw/core/machine.c          |  19 +-
> >  hw/core/qdev.c             |   2 +
> >  hw/i386/pc_piix.c          | 588 +++++++++++++++++++++----------------
> >  hw/i386/pc_q35.c           |  70 ++++-
> >  hw/ppc/spapr.c             | 209 +++++++------
> >  hw/s390x/s390-virtio-ccw.c | 220 +++++++-------
> >  vl.c                       |   1 -
> >  9 files changed, 673 insertions(+), 487 deletions(-)
> >
> > diff --git a/include/hw/boards.h b/include/hw/boards.h
> > index f82f28468b..28c2b0af41 100644
> > --- a/include/hw/boards.h
> > +++ b/include/hw/boards.h
> > @@ -69,7 +69,6 @@ int machine_kvm_shadow_mem(MachineState *machine);
> >  int machine_phandle_start(MachineState *machine);
> >  bool machine_dump_guest_core(MachineState *machine);
> >  bool machine_mem_merge(MachineState *machine);
> > -void machine_register_compat_props(MachineState *machine);
> >  HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *mac=
hine);
> >  void machine_set_cpu_numa_node(MachineState *machine,
> >                                 const CpuInstanceProperties *props,
> > @@ -191,7 +190,7 @@ struct MachineClass {
> >      const char *default_machine_opts;
> >      const char *default_boot_order;
> >      const char *default_display;
> > -    GArray *compat_props;
> > +    GPtrArray *compat_props;
> >      const char *hw_version;
> >      ram_addr_t default_ram_size;
> >      const char *default_cpu_type;
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index f69e7eb399..530c8ca89d 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -1872,8 +1872,9 @@ static void virt_machine_3_1_options(MachineClass=
 *mc)
> >  }
> >  DEFINE_VIRT_MACHINE_AS_LATEST(3, 1)
> >
> > -#define VIRT_COMPAT_3_0 \
> > +static GlobalProperty virt_compat_3_0[] =3D {
> >      HW_COMPAT_3_0
> > +};
> [...]
>
> All the changes to compat macros are independent from the change
> you describe in the patch subject, and makes review more
> difficult.  What about doing that in a separate patch?
>
> We can replace all the virt.c, pc_piix.c, pc_q35.c, and spapr.c
> hunks in this patch with the following:
>
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index f82f28468b..622bbaf939 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -290,18 +289,10 @@ struct MachineState {
>
>  #define SET_MACHINE_COMPAT(m, COMPAT) \
>      do {                              \
> -        int i;                        \
>          static GlobalProperty props[] =3D {       \
>              COMPAT                              \
> -            { /* end of list */ }               \
>          };                                      \
> -        if (!m->compat_props) { \
> -            m->compat_props =3D g_array_new(false, false, sizeof(void *)=
); \
> -        } \
> -        for (i =3D 0; props[i].driver !=3D NULL; i++) {    \
> -            GlobalProperty *prop =3D &props[i];          \
> -            g_array_append_val(m->compat_props, prop); \
> -        }                                              \
> +        compat_props_add(m->compat_props, props, G_N_ELEMENTS(props)); \
>      } while (0)
>
>  #endif
>

Didn't you ask in a previous iteration to remove the macros?
"I like us to be able to
register compat properties without macro magic.  The existence of
SET_MACHINE_COMPAT is a bug and not a feature.


--=20
Marc-Andr=C3=A9 Lureau

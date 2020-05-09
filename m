Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1311445lfb;
        Sat, 9 May 2020 14:03:41 -0700 (PDT)
X-Google-Smtp-Source: APiQypIwvKj4q9Mw97AumPCVHZFDRloFX05IUFDoZSo6SLZDVNOIKXd2nkAUP8/7GJWl2cQk1Tyr
X-Received: by 2002:a25:4149:: with SMTP id o70mr13924420yba.235.1589058220988;
        Sat, 09 May 2020 14:03:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589058220; cv=none;
        d=google.com; s=arc-20160816;
        b=DDU/E8SPfa85wJKtALqiYBqlIVJmgnBlUVRIuAP7Ap5Akd82mYeOmJkvACXYoP0kHn
         /ALH4xX1hbkg2Wy+X75HZk8k7Qahf/HRZCwOPDnBoovrd48SPmtdcR5jTJwbNRCyNEbJ
         mucx54XkTu02PeV0t6U4SWH8ZT6ev9xdMLbPCCn2C0oojGE0Ira9NobNdBJQQOpGpQ8c
         Nz9kpaU4T3sW0Y0uKfNMtR+O8E0rKFeleEvnbNgRkqyzAy/BpTR1HON3ThJ6QtMlh4dW
         rH5RSF32Xg5gfBhMwaLWj2wO15rbspeK4q5C15SqkMbpPo98edqNZdcAyvbnVLoFDF7m
         1IiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eWQ7oRRRzgy+2UB7pbmKBWhbVt318EdO1qW0dY5SxA4=;
        b=yB6W4E+t0B+PcG3Htpwk9J3FYmqEoljOP0pA6ZjmJ3rTqGLF6bmIBNRJZfQdBpHUBD
         TOj6sdR+KiGteLN+a1BZRHgoNK2cZMhPzUtEOGmECkPyaPR8oF+CGgkfX1lYEpg8MCgm
         B+SSZuBvKTWyRB/USXU2JTOPR5jKCSvFCazVAy1UuCKCbmgZe7YVqhUAdtER1cPF0NMx
         2v2VP2ZDrQBj4RuMCEAwg44rWNuTZIFDCyQ7nKT43PSRIxLsIwMFhaiVnzu0z9787Axt
         jswXPatClJNFEb6OmznQgIsqG9uA2chzvIvEeFhHRvpdNL2DvpVHrAR2/we2K5gW+IKK
         xpBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OgDLR+mb;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id t31si5176578ybt.18.2020.05.09.14.03.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 09 May 2020 14:03:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OgDLR+mb;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589058220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eWQ7oRRRzgy+2UB7pbmKBWhbVt318EdO1qW0dY5SxA4=;
	b=OgDLR+mbgM4RCBubyyLP1A5kSuC9drl4K32B3JdBK56wcFFC2eDZTeXqJ0XGsiGuZslCle
	j3JFs67ZI+bpClHiMXdYnWOgnN+MxHti47aQfA9lAls3ucodi3ag2rvkY2+l7UTuy21UeG
	f6MFC8sd2saVgFlwVcGl16JsLD+6FHQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-JL5E45_JOq-BBSSA508kYg-1; Sat, 09 May 2020 17:03:38 -0400
X-MC-Unique: JL5E45_JOq-BBSSA508kYg-1
Received: by mail-ed1-f71.google.com with SMTP id cq11so1426301edb.7
        for <alex.bennee@linaro.org>; Sat, 09 May 2020 14:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eWQ7oRRRzgy+2UB7pbmKBWhbVt318EdO1qW0dY5SxA4=;
        b=cIowih8addH7ogYMmb8/EEFZbxHAHZkAKvzWXLVhPiV5cjYu+PlErwE6cMwgWf0v/Y
         NSKEUZ0EpXfSI247F5VAk5HOrh2d7x/3tcqfgruE4c0LwE9IgEC/65hIWxnh7SgfqAe5
         VX8ha7fwJxZMofCXfZRUXsNvbLc4lt8CTHW2W3tH5MQxVoAorr6zvXvXhJTMiGF/nljq
         0E+fLeEC3AhPx9QyZZTiU057Jshp0zBOwTJgiiQxaxyqhoT2sJnsWDdXxtqt8V5Mbg/v
         n8esYhvN/IrgvqeWil3eD7zFvbhg2uQWDPOiG0+IUZVbAJuV8bShC9Ek13vO4B+Qytsr
         3dVA==
X-Gm-Message-State: AGi0PuY3f55f9wAD1P/VAJJzAeI93jviBAqRIJJqcfMl0UzYu/cxU8Mb
	eqEl3ROeG2RoAH8jw6DRlBDEIYVcs1DM38weFcicAAhE63YGzU7Rq88DJXbLa23Wp+Nd0QJ11T8
	A0X1qQrJm2Ra29IFQRlOF424qrze0BgcJ
X-Received: by 2002:a05:6402:297:: with SMTP id l23mr7826911edv.57.1589058217152;
        Sat, 09 May 2020 14:03:37 -0700 (PDT)
X-Received: by 2002:a05:6402:297:: with SMTP id l23mr7826897edv.57.1589058216890;
 Sat, 09 May 2020 14:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200509130910.26335-1-f4bug@amsat.org> <20200509130910.26335-10-f4bug@amsat.org>
 <ba3d3ba1-09bf-17a0-2116-549fa92e1ed6@amsat.org> <CAAdtpL5KT0H3+yVRgzCwVaLYUUSCBW8vK4X3cHX_N91NPkUFBg@mail.gmail.com>
In-Reply-To: <CAAdtpL5KT0H3+yVRgzCwVaLYUUSCBW8vK4X3cHX_N91NPkUFBg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 9 May 2020 23:03:24 +0200
Message-ID: <CABgObfZ78q9Eaik63DM-Oy60MKpoqbmtq6QZE8tazrjwqTrhgg@mail.gmail.com>
Subject: Re: [PATCH 09/11] target/cpu: Restrict handlers using hwaddr type to system-mode
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	Eduardo Habkost <ehabkost@redhat.com>, Chris Wulff <crwulff@gmail.com>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>, David Hildenbrand <david@redhat.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Marek Vasut <marex@denx.de>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, 
	"qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>, 
	David Gibson <david@gibson.dropbear.id.au>, Artyom Tarasenko <atar4qemu@gmail.com>, 
	"open list:vfio-ccw" <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Stafford Horne <shorne@gmail.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <rth@twiddle.net>, "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Cornelia Huck <cohuck@redhat.com>, 
	Roman Bolshakov <r.bolshakov@yadro.com>, Laurent Vivier <laurent@vivier.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000008bad0f05a53d7211"
X-TUID: U2kTPNbjmdtJ

--0000000000008bad0f05a53d7211
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il sab 9 mag 2020, 22:01 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> ha
scritto:

> > I forgot once Peter Maydell told me we can't do that for some reason I
> > don't remember.
> >
> > At least this changes the sizeof(CPUClass), so we get:
> >
> > qom/object.c:315:type_initialize: assertion failed: (parent->class_size
> > <=3D ti->class_size)
> >
> > So we can't poison the hwaddr type? (final patch of this series).
>
> Well, this works...:
>
> -- >8 --
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -167,6 +167,7 @@ typedef struct CPUClass {
>      int reset_dump_flags;
>      bool (*has_work)(CPUState *cpu);
>      void (*do_interrupt)(CPUState *cpu);
> +#ifndef CONFIG_USER_ONLY
>      void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
>                                  MMUAccessType access_type,
>                                  int mmu_idx, uintptr_t retaddr);
> @@ -174,6 +175,12 @@ typedef struct CPUClass {
>                                    unsigned size, MMUAccessType
> access_type,
>                                    int mmu_idx, MemTxAttrs attrs,
>                                    MemTxResult response, uintptr_t
> retaddr);
> +    hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
> +    hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
> +                                        MemTxAttrs *attrs);
> +#else
> +    void (*reserved[4])(CPUState *cpu, ...);
> +#endif /* CONFIG_USER_ONLY */
>      bool (*virtio_is_big_endian)(CPUState *cpu);
>      int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
>                             uint8_t *buf, int len, bool is_write);
> @@ -189,9 +196,6 @@ typedef struct CPUClass {
>      bool (*tlb_fill)(CPUState *cpu, vaddr address, int size,
>                       MMUAccessType access_type, int mmu_idx,
>                       bool probe, uintptr_t retaddr);
> -    hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
> -    hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
> -                                        MemTxAttrs *attrs);
>      int (*asidx_from_attrs)(CPUState *cpu, MemTxAttrs attrs);
>      int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
>      int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
> ---
>
> Ugly?
>

More. :-) And hwaddr is only a small part, there are several other methods
that only make sense for system emulation. Let me review the rest of the
series, it may not be good enough to stop here while we figure out a way.

Paolo


> >
> > >       void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
> > >                                   MMUAccessType access_type,
> > >                                   int mmu_idx, uintptr_t retaddr);
> > > @@ -174,6 +175,10 @@ typedef struct CPUClass {
> > >                                     unsigned size, MMUAccessType
> access_type,
> > >                                     int mmu_idx, MemTxAttrs attrs,
> > >                                     MemTxResult response, uintptr_t
> retaddr);
> > > +    hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
> > > +    hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
> > > +                                        MemTxAttrs *attrs);
> > > +#endif /* CONFIG_USER_ONLY */
> > >       bool (*virtio_is_big_endian)(CPUState *cpu);
> > >       int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
> > >                              uint8_t *buf, int len, bool is_write);
> > > @@ -189,9 +194,6 @@ typedef struct CPUClass {
> > >       bool (*tlb_fill)(CPUState *cpu, vaddr address, int size,
> > >                        MMUAccessType access_type, int mmu_idx,
> > >                        bool probe, uintptr_t retaddr);
> > > -    hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
> > > -    hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
> > > -                                        MemTxAttrs *attrs);
> > >       int (*asidx_from_attrs)(CPUState *cpu, MemTxAttrs attrs);
> > >       int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int
> reg);
> > >       int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg)=
;
> > [...]
>
>

--0000000000008bad0f05a53d7211
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il sab 9 mag 2020, 22:01 Philippe Mathieu-Daud=C3=A9 &=
lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank" rel=3D"noreferrer">=
f4bug@amsat.org</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>&gt; I forgot once Peter Maydell told me we can&#39;t do that for some rea=
son I<br>
&gt; don&#39;t remember.<br>
&gt;<br>
&gt; At least this changes the sizeof(CPUClass), so we get:<br>
&gt;<br>
&gt; qom/object.c:315:type_initialize: assertion failed: (parent-&gt;class_=
size<br>
&gt; &lt;=3D ti-&gt;class_size)<br>
&gt;<br>
&gt; So we can&#39;t poison the hwaddr type? (final patch of this series).<=
br>
<br>
Well, this works...:<br>
<br>
-- &gt;8 --<br>
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h<br>
--- a/include/hw/core/cpu.h<br>
+++ b/include/hw/core/cpu.h<br>
@@ -167,6 +167,7 @@ typedef struct CPUClass {<br>
=C2=A0 =C2=A0 =C2=A0int reset_dump_flags;<br>
=C2=A0 =C2=A0 =C2=A0bool (*has_work)(CPUState *cpu);<br>
=C2=A0 =C2=A0 =C2=A0void (*do_interrupt)(CPUState *cpu);<br>
+#ifndef CONFIG_USER_ONLY<br>
=C2=A0 =C2=A0 =C2=A0void (*do_unaligned_access)(CPUState *cpu, vaddr addr,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MMUAccessType access_type,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int mmu_idx, uintptr_t retaddr=
);<br>
@@ -174,6 +175,12 @@ typedef struct CPUClass {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned size, MMUAcces=
sType access_type,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int mmu_idx, MemTxAttrs=
 attrs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemTxResult response, u=
intptr_t retaddr);<br>
+=C2=A0 =C2=A0 hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);<br=
>
+=C2=A0 =C2=A0 hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr add=
r,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MemTxAtt=
rs *attrs);<br>
+#else<br>
+=C2=A0 =C2=A0 void (*reserved[4])(CPUState *cpu, ...);<br>
+#endif /* CONFIG_USER_ONLY */<br>
=C2=A0 =C2=A0 =C2=A0bool (*virtio_is_big_endian)(CPUState *cpu);<br>
=C2=A0 =C2=A0 =C2=A0int (*memory_rw_debug)(CPUState *cpu, vaddr addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t *buf, int len, bool is_write);<br>
@@ -189,9 +196,6 @@ typedef struct CPUClass {<br>
=C2=A0 =C2=A0 =C2=A0bool (*tlb_fill)(CPUState *cpu, vaddr address, int size=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 MMUAccessType access_type, int mmu_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bool probe, uintptr_t retaddr);<br>
-=C2=A0 =C2=A0 hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);<br=
>
-=C2=A0 =C2=A0 hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr add=
r,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MemTxAtt=
rs *attrs);<br>
=C2=A0 =C2=A0 =C2=A0int (*asidx_from_attrs)(CPUState *cpu, MemTxAttrs attrs=
);<br>
=C2=A0 =C2=A0 =C2=A0int (*gdb_read_register)(CPUState *cpu, GByteArray *buf=
, int reg);<br>
=C2=A0 =C2=A0 =C2=A0int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, =
int reg);<br>
---<br>
<br>
Ugly?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">More. :-) And hwaddr is only a small part, there are several other met=
hods that only make sense for system emulation. Let me review the rest of t=
he series, it may not be good enough to stop here while we figure out a way=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
<br>
&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*do_unaligned_access)(CPUState *c=
pu, vaddr addr,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MMUAccessType ac=
cess_type,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int mmu_idx, uin=
tptr_t retaddr);<br>
&gt; &gt; @@ -174,6 +175,10 @@ typedef struct CPUClass {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned =
size, MMUAccessType access_type,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int mmu_i=
dx, MemTxAttrs attrs,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemTxResu=
lt response, uintptr_t retaddr);<br>
&gt; &gt; +=C2=A0 =C2=A0 hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr=
 addr);<br>
&gt; &gt; +=C2=A0 =C2=A0 hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu,=
 vaddr addr,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 MemTxAttrs *attrs);<br>
&gt; &gt; +#endif /* CONFIG_USER_ONLY */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool (*virtio_is_big_endian)(CPUState *=
cpu);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*memory_rw_debug)(CPUState *cpu, v=
addr addr,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t *buf, int len, bool is_write=
);<br>
&gt; &gt; @@ -189,9 +194,6 @@ typedef struct CPUClass {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool (*tlb_fill)(CPUState *cpu, vaddr a=
ddress, int size,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 MMUAccessType access_type, int mmu_idx,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 bool probe, uintptr_t retaddr);<br>
&gt; &gt; -=C2=A0 =C2=A0 hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr=
 addr);<br>
&gt; &gt; -=C2=A0 =C2=A0 hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu,=
 vaddr addr,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 MemTxAttrs *attrs);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*asidx_from_attrs)(CPUState *cpu, =
MemTxAttrs attrs);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*gdb_read_register)(CPUState *cpu,=
 GByteArray *buf, int reg);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int (*gdb_write_register)(CPUState *cpu=
, uint8_t *buf, int reg);<br>
&gt; [...]<br>
<br>
</blockquote></div></div></div>

--0000000000008bad0f05a53d7211--

Received: by 10.25.159.19 with SMTP id i19csp1023395lfe;
        Fri, 5 Feb 2016 04:45:51 -0800 (PST)
X-Received: by 10.140.19.231 with SMTP id 94mr16262594qgh.32.1454676351603;
        Fri, 05 Feb 2016 04:45:51 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c51si15709799qgc.0.2016.02.05.04.45.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Feb 2016 04:45:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:47889 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aRfln-0000Rh-3v
	for alex.bennee@linaro.org; Fri, 05 Feb 2016 07:45:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36891)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aRflF-00006Y-7s
	for qemu-devel@nongnu.org; Fri, 05 Feb 2016 07:45:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aRflE-0001yr-0O
	for qemu-devel@nongnu.org; Fri, 05 Feb 2016 07:45:17 -0500
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:34890)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1aRflD-0001yZ-Mv
	for qemu-devel@nongnu.org; Fri, 05 Feb 2016 07:45:15 -0500
Received: by mail-wm0-x22d.google.com with SMTP id r129so25129583wmr.0
	for <qemu-devel@nongnu.org>; Fri, 05 Feb 2016 04:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=BLVv4tw8+pgSRRl19gomVxJ5OvBsW8nodHJ9DRWqgbk=;
	b=X53Z/Zgh+dTqg96f1hNlpIXd96JcvVwtZf7gA6mrhKQihJSiNABP37GY0IjqMYP2Sg
	nIGDjLBc7ZOlkrUc3xwXB2pJTA9loMpxGiVAQ/RHkHZPZAgbiR04tjfdzTsYlSgVOOrW
	RMpWY72TKKMNK8NMcxt/KShpTUqdI5jqxpSqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=BLVv4tw8+pgSRRl19gomVxJ5OvBsW8nodHJ9DRWqgbk=;
	b=QvLsaqYJt1ysut17zWr/cqyobjh34PNRnKd0h1NxF4CUQ76GDYzRgRU24NBEf7kaiO
	fMKN86uJK8c6NX6iYwe+3gnUjhtVzXaXVGj9FsaiOBl+NDvECULG1inNDyQYpRjekAy0
	nBpsrBi2Z7ooftvAdQroVUzRZBSvXviVrMAirMWTN042GF+E2fLmDWjKTScYui5y18FQ
	HYLlJ20cm4/5FPg0b8r0G6Z6k++f1t+18a+u5xTC3BxqENgUgpCBeOx3CSWKTH4zT7Cw
	KWMH7D+ymTBBBNwZZY2hCXJe7plhRwShbLPWdv/hkyaoA7zHQG5+Ola67yshfGAD4fjQ
	xhdg==
X-Gm-Message-State: AG10YOSO4WGOH8QF2pgAdeTSVN/5/SetVp/XAhThMwokIHLuvrlvaNN5lG6u/1WddJ63ZVsmS9Gc2uXaq7j34eFk
MIME-Version: 1.0
X-Received: by 10.28.9.67 with SMTP id 64mr37069800wmj.10.1454676314637; Fri,
	05 Feb 2016 04:45:14 -0800 (PST)
Received: by 10.194.38.134 with HTTP; Fri, 5 Feb 2016 04:45:14 -0800 (PST)
In-Reply-To: <1454511578-24863-1-git-send-email-drjones@redhat.com>
References: <1454511578-24863-1-git-send-email-drjones@redhat.com>
Date: Fri, 5 Feb 2016 20:45:14 +0800
Message-ID: <CAM2+HU6fgdyvcDnbvVV0RO_rkp_4rC8vfoiASO9r3c59-Op5Sw@mail.gmail.com>
From: Shannon Zhao <shannon.zhao@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Content-Type: multipart/alternative; boundary=001a11441f64ff65eb052b05380a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22d
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH] hw/arm/virt: fix max-cpus check
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pBKoqjHuOztz

--001a11441f64ff65eb052b05380a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2016=E5=B9=B42=E6=9C=883=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89=EF=BC=8CAndrew=
 Jones <drjones@redhat.com> =E5=86=99=E9=81=93=EF=BC=9A

> mach-virt doesn't yet support hotplug, but command lines specifying
> -smp <num>,maxcpus=3D<bigger-num> don't fail. Of course specifying
> bigger-num as something bigger than the machine supports, e.g. > 8
> on a gicv2 machine, should fail though. This fix also makes mach-
> virt's max-cpus check truly consistent with the one in vl.c:main,
> as the one there was already correctly checking max-cpus instead
> of smp-cpus.
>
> Reported-by: Shannon Zhao <shannon.zhao@linaro.org <javascript:;>>
> Signed-off-by: Andrew Jones <drjones@redhat.com <javascript:;>>

Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>

> ---
>  hw/arm/virt.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 15658f49c4e06..44bbbea92b1cf 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1013,7 +1013,7 @@ static void machvirt_init(MachineState *machine)
>      MemoryRegion *sysmem =3D get_system_memory();
>      MemoryRegion *secure_sysmem =3D NULL;
>      int gic_version =3D vms->gic_version;
> -    int n, max_cpus;
> +    int n, virt_max_cpus;
>      MemoryRegion *ram =3D g_new(MemoryRegion, 1);
>      const char *cpu_model =3D machine->cpu_model;
>      VirtBoardInfo *vbi;
> @@ -1051,15 +1051,15 @@ static void machvirt_init(MachineState *machine)
>       * many redistributors we can fit into the memory map.
>       */
>      if (gic_version =3D=3D 3) {
> -        max_cpus =3D vbi->memmap[VIRT_GIC_REDIST].size / 0x20000;
> +        virt_max_cpus =3D vbi->memmap[VIRT_GIC_REDIST].size / 0x20000;
>      } else {
> -        max_cpus =3D GIC_NCPU;
> +        virt_max_cpus =3D GIC_NCPU;
>      }
>
> -    if (smp_cpus > max_cpus) {
> +    if (max_cpus > virt_max_cpus) {
>          error_report("Number of SMP CPUs requested (%d) exceeds max CPUs=
 "
>                       "supported by machine 'mach-virt' (%d)",
> -                     smp_cpus, max_cpus);
> +                     max_cpus, virt_max_cpus);
>          exit(1);
>      }
>
> --
> 2.4.3
>
>

--001a11441f64ff65eb052b05380a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>2016=E5=B9=B42=E6=9C=883=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89=EF=BC=
=8CAndrew Jones &lt;<a href=3D"mailto:drjones@redhat.com">drjones@redhat.co=
m</a>&gt; =E5=86=99=E9=81=93=EF=BC=9A<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">mac=
h-virt doesn&#39;t yet support hotplug, but command lines specifying<br>
-smp &lt;num&gt;,maxcpus=3D&lt;bigger-num&gt; don&#39;t fail. Of course spe=
cifying<br>
bigger-num as something bigger than the machine supports, e.g. &gt; 8<br>
on a gicv2 machine, should fail though. This fix also makes mach-<br>
virt&#39;s max-cpus check truly consistent with the one in vl.c:main,<br>
as the one there was already correctly checking max-cpus instead<br>
of smp-cpus.<br>
<br>
Reported-by: Shannon Zhao &lt;<a href=3D"javascript:;" onclick=3D"_e(event,=
 &#39;cvml&#39;, &#39;shannon.zhao@linaro.org&#39;)">shannon.zhao@linaro.or=
g</a>&gt;<br>
Signed-off-by: Andrew Jones &lt;<a href=3D"javascript:;" onclick=3D"_e(even=
t, &#39;cvml&#39;, &#39;drjones@redhat.com&#39;)">drjones@redhat.com</a>&gt=
;</blockquote><div>Reviewed-by: Shannon Zhao &lt;<a href=3D"mailto:shannon.=
zhao@linaro.org">shannon.zhao@linaro.org</a>&gt;<span></span></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
---<br>
=C2=A0hw/arm/virt.c | 10 +++++-----<br>
=C2=A01 file changed, 5 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/hw/arm/virt.c b/hw/arm/virt.c<br>
index 15658f49c4e06..44bbbea92b1cf 100644<br>
--- a/hw/arm/virt.c<br>
+++ b/hw/arm/virt.c<br>
@@ -1013,7 +1013,7 @@ static void machvirt_init(MachineState *machine)<br>
=C2=A0 =C2=A0 =C2=A0MemoryRegion *sysmem =3D get_system_memory();<br>
=C2=A0 =C2=A0 =C2=A0MemoryRegion *secure_sysmem =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0int gic_version =3D vms-&gt;gic_version;<br>
-=C2=A0 =C2=A0 int n, max_cpus;<br>
+=C2=A0 =C2=A0 int n, virt_max_cpus;<br>
=C2=A0 =C2=A0 =C2=A0MemoryRegion *ram =3D g_new(MemoryRegion, 1);<br>
=C2=A0 =C2=A0 =C2=A0const char *cpu_model =3D machine-&gt;cpu_model;<br>
=C2=A0 =C2=A0 =C2=A0VirtBoardInfo *vbi;<br>
@@ -1051,15 +1051,15 @@ static void machvirt_init(MachineState *machine)<br=
>
=C2=A0 =C2=A0 =C2=A0 * many redistributors we can fit into the memory map.<=
br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0if (gic_version =3D=3D 3) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 max_cpus =3D vbi-&gt;memmap[VIRT_GIC_REDIST].s=
ize / 0x20000;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 virt_max_cpus =3D vbi-&gt;memmap[VIRT_GIC_REDI=
ST].size / 0x20000;<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 max_cpus =3D GIC_NCPU;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 virt_max_cpus =3D GIC_NCPU;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (smp_cpus &gt; max_cpus) {<br>
+=C2=A0 =C2=A0 if (max_cpus &gt; virt_max_cpus) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_report(&quot;Number of SMP CPUs req=
uested (%d) exceeds max CPUs &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;supported by machine &#39;mach-virt&#39; (%d)&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0smp_cpus, max_cpus);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0max_cpus, virt_max_cpus);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
--<br>
2.4.3<br>
<br>
</blockquote>

--001a11441f64ff65eb052b05380a--

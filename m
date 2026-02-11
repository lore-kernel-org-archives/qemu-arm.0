Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426F2E9E30F
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Feb 2026 14:30:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqBED-0005dy-Q1; Wed, 11 Feb 2026 09:30:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mbawa@redhat.com>) id 1vqBEA-0005Z6-7w
 for qemu-arm@nongnu.org; Wed, 11 Feb 2026 09:30:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mbawa@redhat.com>) id 1vqBE8-0002Dy-6R
 for qemu-arm@nongnu.org; Wed, 11 Feb 2026 09:30:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770820199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GN15X+TAid9B0KOc2ERlH5+isxNWIydaprAFj1PbZYI=;
 b=RRudnS1N38ubfv3ovdgN/nh8fr2SkZPV4kOkAymmh8Ue/vaIz9/faw1imfWeEdhj5ZwPcC
 M/6C1984QrqaOIKc6hr/1f7hxShxEno7fnpu0XpDDUo+l642Qhfsgfkc+E2fsqXLXWu1J5
 DShSeGCSKw+6rmEeNdiKxYI+9kkjAR4=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-tJ1dKXjRPcu-Sbgg-AMaaw-1; Wed, 11 Feb 2026 09:29:56 -0500
X-MC-Unique: tJ1dKXjRPcu-Sbgg-AMaaw-1
X-Mimecast-MFC-AGG-ID: tJ1dKXjRPcu-Sbgg-AMaaw_1770820195
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-7d186f4a1fdso18708052a34.2
 for <qemu-arm@nongnu.org>; Wed, 11 Feb 2026 06:29:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770820195; x=1771424995;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GN15X+TAid9B0KOc2ERlH5+isxNWIydaprAFj1PbZYI=;
 b=HD2QuzJ7xLQUvrXBidPOOzyP7F/g4QZyyOaMmgMQBxd8Kb7iw4YxZNKw6rSIIsAe5N
 Ref9ceFRAXkgvqI1ng+QTYbmtiS/dZHCjxyj4IP19UEGbs+q+UgVR8BW/uC3fV4R92RW
 9M77wLn3NCsq8ZQLfStYBh3q8oSpmhCFpLf4nZ/1h9MvOhFxxSsIlKnhHgqdYbC1xdFp
 CoXK8bjiSYmj73lHQcmy12+K/O16/X3h1u0dEhQ1JB2WZjc3jDEKtNbKbIuPFVhZkv/+
 VtIs7HBfmByp8sURI4TrqWim2JRqm6/Opt3L1RbtX7Y4t+aLECuGP7LW0OqBvSgkcFu8
 TXLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCq7gpSidSMw/H5djcsJY+mRVhIwXP5R6Xl+l04ZMAtODPMoCd2Lmwyu1vgNc5Ag76BleWUUtw4Q==@nongnu.org
X-Gm-Message-State: AOJu0YwCLLj7C8gFrD+ewfTnvbpsa3tSKKK3w//p+93rAp9bx0QO8AGU
 4Jy7889v+3HL4Fu3wEa5ErfhMZ1mzXv7aU/8nbR7damQiBM1pCWa8kTQQ0KozcPihMqrmARdX/Y
 JG3eyoWlt67FpDQd/KCuAvtVo5yiwTR65uT13fxtUGcYKex2+YXkvTBNglzgOySCFk/1eLhocHX
 kOaSU7sn3xJzxfcgYr4PCmKx3xx3fKqsGP3Wt4CINqYA==
X-Gm-Gg: AZuq6aLGOakzHZRydVHruxwsRr8IrZqXvQYziTxMaxsXVXj0ab10oO7CioGb02qesE6
 vag0iq6E/wC1MPlQn1dB5Fo79sjoE6Mw4rL5hCDNooKSoUvQ531vXSTNiazAS+tf21kCaph9VzD
 dKGxmWR8cnhW2oYfwELso21OXpzBYfclxaf3nzneNwYAjyGimmsf30WYf6PXIrv966FrnypyKs5
 MbRJFg/PKgDcqdDrPicBAXCYE7oi3cV8dzv
X-Received: by 2002:a05:6820:2008:b0:672:a49f:1297 with SMTP id
 006d021491bc7-67437f5c609mr1351845eaf.4.1770820195160; 
 Wed, 11 Feb 2026 06:29:55 -0800 (PST)
X-Received: by 2002:a05:6820:2008:b0:672:a49f:1297 with SMTP id
 006d021491bc7-67437f5c609mr1351837eaf.4.1770820194743; Wed, 11 Feb 2026
 06:29:54 -0800 (PST)
MIME-Version: 1.0
References: <20260211122759.125094-1-mbawa@redhat.com>
 <BE3C6640-85CB-437D-A038-81762FA5AD33@unpredictable.fr>
In-Reply-To: <BE3C6640-85CB-437D-A038-81762FA5AD33@unpredictable.fr>
From: Mohammadfaiz Bawa <mbawa@redhat.com>
Date: Wed, 11 Feb 2026 19:59:37 +0530
X-Gm-Features: AZwV_Qjflcr1G72rm6uYICQYbC-LmZcJHgaw36ltsi1OueVYZEKSrkkBk7Wxx6k
Message-ID: <CAJg9KkwOov56rOFOKergi9nUvqbbF=TMzSWBfFge1Y6v2s8Q2A@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Add virtio-transports property
To: mohamed@unpredictable.fr
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org, 
 alex.bennee@linaro.org, philmd@linaro.org, cohuck@redhat.com, 
 eric.auger@redhat.com, sebott@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UaN5t8K4k3GHadubFPnoqCR4jw3aPUn6rRi2nL2x7pQ_1770820195
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000abc14f064a8d34ab"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mbawa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

--000000000000abc14f064a8d34ab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mohamed,

Thanks for the review!

> Any particular reason to (keep) capping the maximum to 16?

To be honest, I simply preserved the existing behavior,
"NUM_VIRTIO_TRANSPORTS"
was already hardcoded to 32 in virt.h before this patch.I didn't want to
change more than necessary for the scope of this fix.

I don't have strong feelings about this limit. If prefered, I can
remove the validation entirely and let uint8_t be the natural limit (255),
or we could increase it in a future patch if there's a real need for more
transports.

Happy to adjust based on feedback.

Thanks,
Faiz

On Wed, Feb 11, 2026 at 6:37=E2=80=AFPM Mohamed Mediouni <mohamed@unpredict=
able.fr>
wrote:

>
>
> > On 11. Feb 2026, at 13:27, Mohammadfaiz Bawa <mbawa@redhat.com> wrote:
> >
> > Windows ARM64 guests detect virtio-mmio devices declared in ACPI
> > tables even when no backend is attached. This causes "Unknown
> > devices" (ACPI\LNRO0005) to appear in Device Manager.
> >
> > Until Windows fixes that by supporting, adding a new machine
> > property 'virtio-transports' to control the number of
> > virtio-mmio transports instantiated. The default remains
> > NUM_VIRTIO_TRANSPORTS (32) for backward compatibility.
> > Setting it to 0 allows users to disable virtio-mmio entirely.
> >
> > Usage: -machine virt,virtio-transports=3D0
>
> Hello,
>
> With keeping in mind that this was documented in this (closed=E2=80=A6) i=
ssue
> https://github.com/virtio-win/kvm-guest-drivers-windows/issues/595
>
> Reviewed-by: Mohamed Mediouni <mohamed@unpredictable.fr>
>
> >
> > Signed-off-by: Mohammadfaiz Bawa <mbawa@redhat.com>
> > ---
> > hw/arm/virt-acpi-build.c |  2 +-
> > hw/arm/virt.c            | 43 ++++++++++++++++++++++++++++++++++++++--
> > include/hw/arm/virt.h    |  1 +
> > 3 files changed, 43 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index c145678185..27c007fd62 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -1150,7 +1150,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker=
,
> VirtMachineState *vms)
> >     fw_cfg_acpi_dsdt_add(scope, &memmap[VIRT_FW_CFG]);
> >     virtio_acpi_dsdt_add(scope, memmap[VIRT_MMIO].base,
> memmap[VIRT_MMIO].size,
> >                          (irqmap[VIRT_MMIO] + ARM_SPI_BASE),
> > -                         0, NUM_VIRTIO_TRANSPORTS);
> > +                         0, vms->virtio_transports);
> >     acpi_dsdt_add_pci(scope, memmap, irqmap[VIRT_PCIE] + ARM_SPI_BASE,
> vms);
> >     if (vms->acpi_dev) {
> >         build_ged_aml(scope, "\\_SB."GED_DEVICE,
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 390845c503..0a659ba540 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -1206,7 +1206,7 @@ static void create_virtio_devices(const
> VirtMachineState *vms)
> >      * between kernel versions). For reliable and stable identification
> >      * of disks users must use UUIDs or similar mechanisms.
> >      */
> > -    for (i =3D 0; i < NUM_VIRTIO_TRANSPORTS; i++) {
> > +    for (i =3D 0; i < vms->virtio_transports; i++) {
> >         int irq =3D vms->irqmap[VIRT_MMIO] + i;
> >         hwaddr base =3D vms->memmap[VIRT_MMIO].base + i * size;
> >
> > @@ -1221,7 +1221,7 @@ static void create_virtio_devices(const
> VirtMachineState *vms)
> >      * loop influences virtio device to virtio transport assignment,
> whereas
> >      * this loop controls how virtio transports are laid out in the dtb=
.
> >      */
> > -    for (i =3D NUM_VIRTIO_TRANSPORTS - 1; i >=3D 0; i--) {
> > +    for (i =3D vms->virtio_transports - 1; i >=3D 0; i--) {
> >         char *nodename;
> >         int irq =3D vms->irqmap[VIRT_MMIO] + i;
> >         hwaddr base =3D vms->memmap[VIRT_MMIO].base + i * size;
> > @@ -2705,6 +2705,36 @@ static void virt_set_highmem_mmio_size(Object
> *obj, Visitor *v,
> >     extended_memmap[VIRT_HIGH_PCIE_MMIO].size =3D size;
> > }
> >
> > +static void virt_get_virtio_transports(Object *obj, Visitor *v,
> > +                                       const char *name, void *opaque,
> > +                                       Error **errp)
> > +{
> > +    VirtMachineState *vms =3D VIRT_MACHINE(obj);
> > +    uint8_t transports =3D vms->virtio_transports;
> > +
> > +    visit_type_uint8(v, name, &transports, errp);
> > +}
> > +
> > +static void virt_set_virtio_transports(Object *obj, Visitor *v,
> > +                                       const char *name, void *opaque,
> > +                                       Error **errp)
> > +{
> > +    VirtMachineState *vms =3D VIRT_MACHINE(obj);
> > +    uint8_t transports;
> > +
> > +    if (!visit_type_uint8(v, name, &transports, errp)) {
> > +        return;
> > +    }
> > +
> > +    if (transports > NUM_VIRTIO_TRANSPORTS) {
> > +        error_setg(errp, "virtio-transports must not exceed %d",
> > +                   NUM_VIRTIO_TRANSPORTS);
> Any particular reason to (keep) capping the maximum to 16?
>
> From a cursory look, base_memmap seems to have room for plenty more.
>
>

--000000000000abc14f064a8d34ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Mohamed,<br><br>Thanks for the review!<br><br>&gt; Any =
particular reason to (keep) capping the maximum to 16?<br><br>To be honest,=
 I simply preserved the existing behavior, &quot;NUM_VIRTIO_TRANSPORTS&quot=
;<br>was already hardcoded to 32 in virt.h before this patch.I didn&#39;t w=
ant to<br>change more than necessary for the scope of this fix.<br><br>I do=
n&#39;t have strong feelings about this limit. If prefered, I can<br>remove=
 the validation entirely and let uint8_t be the natural limit (255),<br>or =
we could increase it in a future patch if there&#39;s a real need for more<=
br>transports.<br><br>Happy to adjust based on feedback.<br><br><div>Thanks=
,<br>Faiz</div></div><br><div class=3D"gmail_quote gmail_quote_container"><=
div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 11, 2026 at 6:37=E2=80=AFP=
M Mohamed Mediouni &lt;<a href=3D"mailto:mohamed@unpredictable.fr">mohamed@=
unpredictable.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><br>
<br>
&gt; On 11. Feb 2026, at 13:27, Mohammadfaiz Bawa &lt;<a href=3D"mailto:mba=
wa@redhat.com" target=3D"_blank">mbawa@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; Windows ARM64 guests detect virtio-mmio devices declared in ACPI<br>
&gt; tables even when no backend is attached. This causes &quot;Unknown<br>
&gt; devices&quot; (ACPI\LNRO0005) to appear in Device Manager.<br>
&gt; <br>
&gt; Until Windows fixes that by supporting, adding a new machine<br>
&gt; property &#39;virtio-transports&#39; to control the number of<br>
&gt; virtio-mmio transports instantiated. The default remains<br>
&gt; NUM_VIRTIO_TRANSPORTS (32) for backward compatibility.<br>
&gt; Setting it to 0 allows users to disable virtio-mmio entirely.<br>
&gt; <br>
&gt; Usage: -machine virt,virtio-transports=3D0<br>
<br>
Hello,<br>
<br>
With keeping in mind that this was documented in this (closed=E2=80=A6) iss=
ue<br>
<a href=3D"https://github.com/virtio-win/kvm-guest-drivers-windows/issues/5=
95" rel=3D"noreferrer" target=3D"_blank">https://github.com/virtio-win/kvm-=
guest-drivers-windows/issues/595</a><br>
<br>
Reviewed-by: Mohamed Mediouni &lt;<a href=3D"mailto:mohamed@unpredictable.f=
r" target=3D"_blank">mohamed@unpredictable.fr</a>&gt;<br>
<br>
&gt; <br>
&gt; Signed-off-by: Mohammadfaiz Bawa &lt;<a href=3D"mailto:mbawa@redhat.co=
m" target=3D"_blank">mbawa@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt; hw/arm/virt-acpi-build.c |=C2=A0 2 +-<br>
&gt; hw/arm/virt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 43 ++++++++++=
++++++++++++++++++++++++++++--<br>
&gt; include/hw/arm/virt.h=C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; 3 files changed, 43 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c<br>
&gt; index c145678185..27c007fd62 100644<br>
&gt; --- a/hw/arm/virt-acpi-build.c<br>
&gt; +++ b/hw/arm/virt-acpi-build.c<br>
&gt; @@ -1150,7 +1150,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linke=
r, VirtMachineState *vms)<br>
&gt;=C2=A0 =C2=A0 =C2=A0fw_cfg_acpi_dsdt_add(scope, &amp;memmap[VIRT_FW_CFG=
]);<br>
&gt;=C2=A0 =C2=A0 =C2=A0virtio_acpi_dsdt_add(scope, memmap[VIRT_MMIO].base,=
 memmap[VIRT_MMIO].size,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (irqmap[VIRT_MMIO] + ARM_SPI_BASE),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A00, NUM_VIRTIO_TRANSPORTS);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A00, vms-&gt;virtio_transports);<br>
&gt;=C2=A0 =C2=A0 =C2=A0acpi_dsdt_add_pci(scope, memmap, irqmap[VIRT_PCIE] =
+ ARM_SPI_BASE, vms);<br>
&gt;=C2=A0 =C2=A0 =C2=A0if (vms-&gt;acpi_dev) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0build_ged_aml(scope, &quot;\\_SB.&quo=
t;GED_DEVICE,<br>
&gt; diff --git a/hw/arm/virt.c b/hw/arm/virt.c<br>
&gt; index 390845c503..0a659ba540 100644<br>
&gt; --- a/hw/arm/virt.c<br>
&gt; +++ b/hw/arm/virt.c<br>
&gt; @@ -1206,7 +1206,7 @@ static void create_virtio_devices(const VirtMach=
ineState *vms)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 * between kernel versions). For reliable and stabl=
e identification<br>
&gt;=C2=A0 =C2=A0 =C2=A0 * of disks users must use UUIDs or similar mechani=
sms.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 for (i =3D 0; i &lt; NUM_VIRTIO_TRANSPORTS; i++) {<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; vms-&gt;virtio_transports; i++) {<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int irq =3D vms-&gt;irqmap[VIRT_MMIO]=
 + i;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr base =3D vms-&gt;memmap[VIRT_M=
MIO].base + i * size;<br>
&gt; <br>
&gt; @@ -1221,7 +1221,7 @@ static void create_virtio_devices(const VirtMach=
ineState *vms)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 * loop influences virtio device to virtio transpor=
t assignment, whereas<br>
&gt;=C2=A0 =C2=A0 =C2=A0 * this loop controls how virtio transports are lai=
d out in the dtb.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 for (i =3D NUM_VIRTIO_TRANSPORTS - 1; i &gt;=3D 0; i--)=
 {<br>
&gt; +=C2=A0 =C2=A0 for (i =3D vms-&gt;virtio_transports - 1; i &gt;=3D 0; =
i--) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *nodename;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int irq =3D vms-&gt;irqmap[VIRT_MMIO]=
 + i;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr base =3D vms-&gt;memmap[VIRT_M=
MIO].base + i * size;<br>
&gt; @@ -2705,6 +2705,36 @@ static void virt_set_highmem_mmio_size(Object *=
obj, Visitor *v,<br>
&gt;=C2=A0 =C2=A0 =C2=A0extended_memmap[VIRT_HIGH_PCIE_MMIO].size =3D size;=
<br>
&gt; }<br>
&gt; <br>
&gt; +static void virt_get_virtio_transports(Object *obj, Visitor *v,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const=
 char *name, void *opaque,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error=
 **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 VirtMachineState *vms =3D VIRT_MACHINE(obj);<br>
&gt; +=C2=A0 =C2=A0 uint8_t transports =3D vms-&gt;virtio_transports;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 visit_type_uint8(v, name, &amp;transports, errp);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void virt_set_virtio_transports(Object *obj, Visitor *v,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const=
 char *name, void *opaque,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error=
 **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 VirtMachineState *vms =3D VIRT_MACHINE(obj);<br>
&gt; +=C2=A0 =C2=A0 uint8_t transports;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!visit_type_uint8(v, name, &amp;transports, errp)) =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (transports &gt; NUM_VIRTIO_TRANSPORTS) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;virtio-transports =
must not exceed %d&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
NUM_VIRTIO_TRANSPORTS);<br>
Any particular reason to (keep) capping the maximum to 16?<br>
<br>
From a cursory look, base_memmap seems to have room for plenty more.<br>
<br>
</blockquote></div>

--000000000000abc14f064a8d34ab--



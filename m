Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3393735wru;
        Fri, 5 Jul 2019 10:29:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw9LOjr3zlwXFkLiOCyhyuCWYhUU74ujen+M9/5KbhIlVl4xF0mjlMV+rdldv7bJUYrnkmx
X-Received: by 2002:a17:906:5c4a:: with SMTP id c10mr4556852ejr.15.1562347763881;
        Fri, 05 Jul 2019 10:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562347763; cv=none;
        d=google.com; s=arc-20160816;
        b=v/M2s7WnXMxvRxHhMuSM8g8uYOV8IXa0Snxrw8inZX4rGQv5vtpE4yWNm0WRUA+kyb
         yqY0AmJoBKFF6lOa544u1L32FJg/ZRTrL/qGYdRlkbLRZNr4sB836pI7PutV/OQC5LMV
         m2JIijMvHJtA1P1y7xZmw73vfwe4MqKcGL98nrtJQ8R0c20YiwoO2OLfPCuNwm/AELYh
         MLcQnh6rNTB0GjUlrellhfTj3NWvMvb01QqzS773NGFOTNOtTK2G7/wvirVHmLY3o1xy
         HI5hHK8QqiPbwkft7TQUGE5n4LuzIPr1O29zyHNkVJ4i/wo1xc6W647iuv1XE/YGRDL2
         35FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZvZbHnHKY40AYBx1Em/XDDCmTCC1HGBzq8XM12/ILNw=;
        b=sexxpzoLntAHvWVwGDBv3Ez1KmnwZa0b1mLgvi7Hd0pBWHGlAqGKtk3RF3JYM8OKnA
         EDJGP35JROlLYcvrxNEt3vT3TBfIk8y+MOkToAg+SwWsiSncwRuOPD/C2/+2QV/csd+7
         n03FWEGqCH/Ir3y/zuxJrGsoUwOyIt/hSRTICiKB/GDEP+qQlRHtAhYxB/1RSIbq0qkH
         O2hAGW+slYkbJAGtC4Bssg0Fi7yO1L5K37iMEg4k8kJS0aZGiaMY4REMDY2tZvAeSNCb
         9cNY6vnc4ZLgBbXu/2FWcKMm6Jhr0pjDfXywTfTp52Gp0K0lEE+fGKtmkDMzr9X5/PC+
         O+jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hVde4+VM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ec17si6290596ejb.327.2019.07.05.10.29.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jul 2019 10:29:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hVde4+VM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hjS1S-0002zM-Ve
	for alex.bennee@linaro.org; Fri, 05 Jul 2019 13:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57885)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <radoslaw.biernacki@linaro.org>) id 1hjS1L-0002vw-7q
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 13:29:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <radoslaw.biernacki@linaro.org>) id 1hjS1J-0006p1-MH
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 13:29:15 -0400
Received: from mail-yw1-xc42.google.com ([2607:f8b0:4864:20::c42]:42849)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <radoslaw.biernacki@linaro.org>)
 id 1hjS1J-0006mk-Cq
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 13:29:13 -0400
Received: by mail-yw1-xc42.google.com with SMTP id z63so536663ywz.9
 for <qemu-arm@nongnu.org>; Fri, 05 Jul 2019 10:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZvZbHnHKY40AYBx1Em/XDDCmTCC1HGBzq8XM12/ILNw=;
 b=hVde4+VMc9kDjl9iiNL7YfNPBWov+qF5JxmIYnMrPnkCkcqUKUBccQOSvPAEg25VUg
 VZIndB7ukTLl/s8qILGPu8oUzXVFtQgs0DlKwq+kNF1Lsbv8fsLZg7E/273AH52b16yC
 mov+pGpOoHEaBMujcGxDnsXkpRpRXInN8REfQLGJThD4qYtiiBUqsnMnrb330JddTH14
 e+6J8HDl9NBEgvhd3iBMRIjcfJIDtxuAp5+5LDvdpd5gsXZYJUIqqrpVZwq9Q4TK9bKc
 lEXri0EoXAaLYGux7+1QiOdEx9HF/tWJFVCtShYUMvLt52Yy5blKDBbPWSTu6F2BJRZl
 93uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZvZbHnHKY40AYBx1Em/XDDCmTCC1HGBzq8XM12/ILNw=;
 b=WH4baY3/71t2V44COe4zzS+xHpmGQKUwNeP9whnMyUcYivjKKO1cz+PpZLi1tJDStU
 64VA8e44YpsksVIDGZoTlxV4iINKkHv+48BSe824k0kGhnG4b+VcYrxmPutE3doiGZgz
 KUs7GjFdaZzQjU4Zg7MDzMckoO2Co32ynrhA/XZeP6iGyOyDfAh3s8C3TXeP2YF088R7
 Nf2mEeAUxwx1WGXIE51KbRjxbeZ3yoAcLV4znpl7KHKlvla4OS5kIFUfcBxtJg93cxIp
 ZXqf/OKwNjW8VOQh6CCohrj7FTCwnGaZcbTDrB4FKNI9F5NSb2X+1YtP9rJGGhfYYFgR
 AeEQ==
X-Gm-Message-State: APjAAAV5ska+31ttC9rwGPVAXE/JSOI2LV1VtvOdKGEl82SKo+58Yx4z
 qE/TAMncW/ijIFl87fNUlmom7S3YF5r+W/3hljh2dQ==
X-Received: by 2002:a81:1f42:: with SMTP id f63mr2754476ywf.184.1562347751818; 
 Fri, 05 Jul 2019 10:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190704142004.7150-1-peter.maydell@linaro.org>
 <3bb189fa-8e47-acb0-89a2-9b5121c2269f@redhat.com>
In-Reply-To: <3bb189fa-8e47-acb0-89a2-9b5121c2269f@redhat.com>
From: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Date: Fri, 5 Jul 2019 19:29:00 +0200
Message-ID: <CAEK-wK=2B4Jj_VNrAuCM3-KG_m=LPyKgjyp=Qm=D5J-oVuJCjg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000c35b50058cf26ee3"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c42
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-4.1] hw/arm/sbsa-ref: Remove
 unnecessary check for secure_sysmem == NULL
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Leif Lindholm <leif.lindholm@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 08PQq7kyCauH

--000000000000c35b50058cf26ee3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 5 Jul 2019 at 10:51, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
>
wrote:

> On 7/4/19 4:20 PM, Peter Maydell wrote:
> > In the virt machine, we support TrustZone being either present or
> > absent, and so the code must deal with the secure_sysmem pointer
> > possibly being NULL. In the sbsa-ref machine, TrustZone is always
> > present, but some code and comments copied from virt still treat
> > it as possibly not being present.
> >
> > This causes Coverity to complain (CID 1407287) that we check
> > secure_sysmem for being NULL after an unconditional dereference.
> > Simplify the code so that instead of initializing the variable
> > to NULL, unconditionally assigning it, and then testing it for NULL,
> > we just initialize it correctly in the variable declaration and
> > then assume it to be non-NULL. We also delete a comment which
> > only applied to the non-TrustZone config.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > Not a bug as such, but we should put it in for 4.1 to
> > keep Coverity happy.
> > ---
> >  hw/arm/sbsa-ref.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> >
> > diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> > index ee53f0ff60d..6f315b79445 100644
> > --- a/hw/arm/sbsa-ref.c
> > +++ b/hw/arm/sbsa-ref.c
> > @@ -254,8 +254,6 @@ static void sbsa_flash_map(SBSAMachineState *sms,
> >       * sysmem is the system memory space. secure_sysmem is the secure
> view
> >       * of the system, and the first flash device should be made visibl=
e
> only
> >       * there. The second flash device is visible to both secure and
> nonsecure.
> > -     * If sysmem =3D=3D secure_sysmem this means there is no separate =
Secure
> > -     * address space and both flash devices are generally visible.
> >       */
> >      hwaddr flashsize =3D sbsa_ref_memmap[SBSA_FLASH].size / 2;
> >      hwaddr flashbase =3D sbsa_ref_memmap[SBSA_FLASH].base;
> > @@ -588,7 +586,7 @@ static void sbsa_ref_init(MachineState *machine)
> >      SBSAMachineState *sms =3D SBSA_MACHINE(machine);
> >      MachineClass *mc =3D MACHINE_GET_CLASS(machine);
> >      MemoryRegion *sysmem =3D get_system_memory();
> > -    MemoryRegion *secure_sysmem =3D NULL;
> > +    MemoryRegion *secure_sysmem =3D g_new(MemoryRegion, 1);
> >      MemoryRegion *ram =3D g_new(MemoryRegion, 1);
> >      bool firmware_loaded;
> >      const CPUArchIdList *possible_cpus;
> > @@ -612,13 +610,11 @@ static void sbsa_ref_init(MachineState *machine)
> >       * containing the system memory at low priority; any secure-only
> >       * devices go in at higher priority and take precedence.
> >       */
> > -    secure_sysmem =3D g_new(MemoryRegion, 1);
> >      memory_region_init(secure_sysmem, OBJECT(machine), "secure-memory"=
,
> >                         UINT64_MAX);
> >      memory_region_add_subregion_overlap(secure_sysmem, 0, sysmem, -1);
> >
> > -    firmware_loaded =3D sbsa_firmware_init(sms, sysmem,
> > -                                         secure_sysmem ?: sysmem);
> > +    firmware_loaded =3D sbsa_firmware_init(sms, sysmem, secure_sysmem)=
;
> >
> >      if (machine->kernel_filename && firmware_loaded) {
> >          error_report("sbsa-ref: No fw_cfg device on this machine, "
> >
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>

Thank you Peter.

Tested-by: Rados=C5=82aw Biernacki <radoslaw.biernacki@linaro.org>
Reviewed-by: Rados=C5=82aw Biernacki <radoslaw.biernacki@linaro.org>

--000000000000c35b50058cf26ee3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 5 Jul 2019 at 10:51, Philippe Mat=
hieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com" target=3D"_blank">=
philmd@redhat.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On 7/4/19 4:20 PM, Peter Maydel=
l wrote:<br>
&gt; In the virt machine, we support TrustZone being either present or<br>
&gt; absent, and so the code must deal with the secure_sysmem pointer<br>
&gt; possibly being NULL. In the sbsa-ref machine, TrustZone is always<br>
&gt; present, but some code and comments copied from virt still treat<br>
&gt; it as possibly not being present.<br>
&gt; <br>
&gt; This causes Coverity to complain (CID 1407287) that we check<br>
&gt; secure_sysmem for being NULL after an unconditional dereference.<br>
&gt; Simplify the code so that instead of initializing the variable<br>
&gt; to NULL, unconditionally assigning it, and then testing it for NULL,<b=
r>
&gt; we just initialize it correctly in the variable declaration and<br>
&gt; then assume it to be non-NULL. We also delete a comment which<br>
&gt; only applied to the non-TrustZone config.<br>
&gt; <br>
&gt; Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linar=
o.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt; Not a bug as such, but we should put it in for 4.1 to<br>
&gt; keep Coverity happy.<br>
&gt; ---<br>
&gt;=C2=A0 hw/arm/sbsa-ref.c | 8 ++------<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c<br>
&gt; index ee53f0ff60d..6f315b79445 100644<br>
&gt; --- a/hw/arm/sbsa-ref.c<br>
&gt; +++ b/hw/arm/sbsa-ref.c<br>
&gt; @@ -254,8 +254,6 @@ static void sbsa_flash_map(SBSAMachineState *sms,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* sysmem is the system memory space. secure_=
sysmem is the secure view<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* of the system, and the first flash device =
should be made visible only<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* there. The second flash device is visible =
to both secure and nonsecure.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0* If sysmem =3D=3D secure_sysmem this means there=
 is no separate Secure<br>
&gt; -=C2=A0 =C2=A0 =C2=A0* address space and both flash devices are genera=
lly visible.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 hwaddr flashsize =3D sbsa_ref_memmap[SBSA_FLASH].s=
ize / 2;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 hwaddr flashbase =3D sbsa_ref_memmap[SBSA_FLASH].b=
ase;<br>
&gt; @@ -588,7 +586,7 @@ static void sbsa_ref_init(MachineState *machine)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 SBSAMachineState *sms =3D SBSA_MACHINE(machine);<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 MachineClass *mc =3D MACHINE_GET_CLASS(machine);<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 MemoryRegion *sysmem =3D get_system_memory();<br>
&gt; -=C2=A0 =C2=A0 MemoryRegion *secure_sysmem =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 MemoryRegion *secure_sysmem =3D g_new(MemoryRegion, 1);=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MemoryRegion *ram =3D g_new(MemoryRegion, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool firmware_loaded;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 const CPUArchIdList *possible_cpus;<br>
&gt; @@ -612,13 +610,11 @@ static void sbsa_ref_init(MachineState *machine)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* containing the system memory at low priori=
ty; any secure-only<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* devices go in at higher priority and take =
precedence.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 secure_sysmem =3D g_new(MemoryRegion, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 memory_region_init(secure_sysmem, OBJECT(machine),=
 &quot;secure-memory&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0UINT64_MAX);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 memory_region_add_subregion_overlap(secure_sysmem,=
 0, sysmem, -1);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 firmware_loaded =3D sbsa_firmware_init(sms, sysmem,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0secure_sysmem ?: sysmem);<br>
&gt; +=C2=A0 =C2=A0 firmware_loaded =3D sbsa_firmware_init(sms, sysmem, sec=
ure_sysmem);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (machine-&gt;kernel_filename &amp;&amp; firmwar=
e_loaded) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;sbsa-ref: No fw_c=
fg device on this machine, &quot;<br>
&gt; <br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redha=
t.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br></blockquote><div><br=
></div><div>Thank you Peter.</div><div><br></div><span class=3D"m_-40928937=
74069789637gmail-il">Tested</span>-<span class=3D"m_-4092893774069789637gma=
il-il">by</span>: Rados=C5=82aw Biernacki &lt;<a href=3D"mailto:radoslaw.bi=
ernacki@linaro.org">radoslaw.biernacki@linaro.org</a>&gt;<br><div>Reviewed-=
<span class=3D"m_-4092893774069789637gmail-il">by</span>: Rados=C5=82aw Bie=
rnacki &lt;<a href=3D"mailto:radoslaw.biernacki@linaro.org">radoslaw.bierna=
cki@linaro.org</a>&gt;</div><div><br></div></div></div>

--000000000000c35b50058cf26ee3--

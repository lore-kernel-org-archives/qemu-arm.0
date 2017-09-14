Received: by 10.223.172.38 with SMTP id v35csp1010674wrc;
        Thu, 14 Sep 2017 08:30:38 -0700 (PDT)
X-Received: by 10.237.61.183 with SMTP id i52mr33660065qtf.50.1505403038074;
        Thu, 14 Sep 2017 08:30:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505403038; cv=none;
        d=google.com; s=arc-20160816;
        b=cXhjtZItJUcC45DnvKcxFi+QZtlbHib9F/8ornOZ4fRl4TGCEOJR91j0hHwSFj3GX2
         hSiX+55ceAfdIEBKcTg7x9l4lJrAd5uA5mdkbPRPoDo/mdrOdrpVKYCycMHhr8q0Weri
         o/UzeQptDU2xi8+AGTx663/YzJyYfy+zRHw/HnOsHkPl640Jb8QJmaL+CUD1ic/OZGyV
         AO16UhhRkJ3zCvnfiO1Vr5rCt5NVDYI5YW/mTW6fjRmsBm5yZfUpK/0Sn/Uh3//szeBb
         nZ1JoujLPEGUo4dy0Gaf+RdKVlqC2WUOhoxubpcS70gMOi+E6UE2tl0jLZVQGVTm1+on
         E1+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=uoL0rAVAjnod2aNRTKL5AYA5i2fQCr1Vxv/wSdsQRsc=;
        b=zlwprJwLyto0f0DLLSYCWQCimYNW5BwDK57R1zDZLmWRoQtO285gF7FyeeQG87ByKi
         wAePryg5K5sYoATmAo119GTQhsZBmjeczLloHVJ2HZpQ6Hk1/zf/937BzXlI0+NG0Kus
         ZxjB3220rkVTcY7UZfV6lBcbNeK4koLiUuIwpVcrCx86V/0i/7dMh/1qhsns6JU6biVd
         lVvfOVhnTMSIn83NQDpo1DW8fm7A5/KxShVVnC7HzwB+rSmjIb31DPtWqypwb0CURM+i
         qbdlsktazFO3LuqAhSZ/3F8bkiQ/gmZ6SetQrM7YoWuoPVUNSfyYF9DMxQ+wl4vmRbBg
         7NNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=U1E9EDqn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g125si3498725qkf.37.2017.09.14.08.30.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Sep 2017 08:30:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=U1E9EDqn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsW67-0006WK-PN
	for alex.bennee@linaro.org; Thu, 14 Sep 2017 11:30:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dsW5t-0006RO-Ce
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 11:30:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dsW5s-000784-7U
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 11:30:21 -0400
Received: from mail-ua0-x22c.google.com ([2607:f8b0:400c:c08::22c]:53204)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dsW5k-0006zV-QL; Thu, 14 Sep 2017 11:30:12 -0400
Received: by mail-ua0-x22c.google.com with SMTP id n38so392033uai.9;
	Thu, 14 Sep 2017 08:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uoL0rAVAjnod2aNRTKL5AYA5i2fQCr1Vxv/wSdsQRsc=;
	b=U1E9EDqnN8qhEv6SivZAjv6+1ZVqqMb55InsGAdneraHqEChBLAYjdtQvK8381CmKQ
	QIDyi/wzP39sBd7yPj+GdXH4ZzLfN18hqHz9ow+hY8SXu3hzajF6tpM4VIozPsTjkLEU
	QYX1VQSEkpGC2Xzu9foQcf51pUbd6GdRUzvHzFg+xx5fvHbVcDbEhBSsh7MN4tBTz61o
	WRKCNkyH/ay139pOPMruX75h1NrIhRzmFYYKsGpJtBYs57i7Jaiz4DkDC+jdVNqRV08o
	NSoWCruVkTS6RMTzI00BzhYjzjPGU6kzSutXilbxipFDxp6NnJAzReP/GLCEYuHVXzu5
	6izQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uoL0rAVAjnod2aNRTKL5AYA5i2fQCr1Vxv/wSdsQRsc=;
	b=buubVGnfS7j60NrLDl0IlUl0r1FVxu+HvQYqvzx9cg9M6xcGcBEPmpGZm9r7vUD6qS
	OFxlNpxNvDWP1GANVmhjDrpwmHOKVqig0OITyQcTe+AwTl4w2WQXMhIQPrH6zXkFoZWW
	JIsKJGdXqUn8n3hEV03EngSDBqh6sqAwmYIs1naCe83W4yeleyeLD1gmLRnHyOP3YQr9
	hhzlpXAweFIKuC+R85YViFV6kaRlWvkv86i5exbcZ/3X2PyLss6uUNbT76OPkTu4YLZg
	4EHn+EFxIEBXVzrOIqUVVduaIuoPhbraP4ojko19EUzJK4UJWShR8oDQNm2ZdfsLQEnd
	36iQ==
X-Gm-Message-State: AHPjjUj0ALOSeSyC8S9aEDboTQIjffzMMx9B1S/0RTPPnWGCkhW3HB75
	/de9XpURVJQOq+j4m3hb9aACGq0IU3ZWdjhZw3c=
X-Google-Smtp-Source: AOwi7QCEEEEUXUkqmC634Bj+DNiOQRHCl1UEgkrGIeOc6pMcmnyhUVMOgNCUtSo/SHo73RmpSSzGb8cTaI+l57qpveI=
X-Received: by 10.176.76.214 with SMTP id e22mr18632880uag.16.1505403010255;
	Thu, 14 Sep 2017 08:30:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.66.68 with HTTP; Thu, 14 Sep 2017 08:30:09 -0700 (PDT)
In-Reply-To: <CAFEAcA8KUtG=2Cr_PndUqOxp5PN6bTJR_t=s+Ch+Y2WVfHVjQg@mail.gmail.com>
References: <1504812251-23438-1-git-send-email-sundeep.lkml@gmail.com>
	<1504812251-23438-3-git-send-email-sundeep.lkml@gmail.com>
	<a9891f10-9643-96ee-7f99-7a384b9ea302@amsat.org>
	<CAFEAcA8KUtG=2Cr_PndUqOxp5PN6bTJR_t=s+Ch+Y2WVfHVjQg@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Thu, 14 Sep 2017 21:00:09 +0530
Message-ID: <CALHRZupPj2cJJAr57n+E6Q0xF1qpsewHsDzS03mQmoHfL98j6g@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="f4030437a7e4ab8f44055927f3cc"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::22c
Subject: Re: [Qemu-arm] [Qemu devel v8 PATCH 2/5] msf2: Microsemi
 Smartfusion2 System Register block
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
Cc: Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mkEhtQ4onirS

--f4030437a7e4ab8f44055927f3cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

On Thu, Sep 14, 2017 at 6:43 PM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 14 September 2017 at 05:36, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
> wrote:
> > On 09/07/2017 04:24 PM, Subbaraya Sundeep wrote:
> >> +static uint64_t msf2_sysreg_read(void *opaque, hwaddr offset,
> >> +    unsigned size)
> >> +{
> >> +    MSF2SysregState *s =3D opaque;
> >> +    uint32_t ret =3D 0;
> >> +
> >> +    offset >>=3D 2;
> >> +    if (offset < ARRAY_SIZE(s->regs)) {
> >
> >
> > This comment is controversial, I'll let Peter nod.
> >
> > The SYSREG behaves differently regarding which bus access it (CPU, AHB)=
.
> > You are implementing CPU access to the SYSREG, the registers have
> different
> > permissions when accessed by the CPU. (see the SmartFusion2 User Guide:
> > Table 21-1 "Register Types" and Table 21-2 "Register Map").
>

CPU is also one of the bus masters in AHB matrix (Fig 6.1 in page 248).

>
> > I'd think of this stub:
> >
> > switch(reg) {
> > case register_supported1:
> > case register_supported2:
> > case register_supported3:
> >            ret =3D s->regs[offset];
> >            trace_msf2_sysreg_read(offset, ret);
> >            break;
> > case RO-U:
> >            qemu_log_mask(LOG_GUEST_ERROR, "Illegal AHB access 0x%08"...
> >            break;
> > case W1P:
> >            qemu_log_mask(LOG_GUEST_ERROR, "Illegal read access ...
> >            break;
> > case RW:
> > case RW-P:
> > case RO:
> > case RO-P:
> > default:
> >            ret =3D s->regs[offset];
> >            qemu_log_mask(LOG_UNIMP, "...
> >            break;
> > }
>

This sounds good to me and will fix later by rearranging registers in enum
sorted
based on type (RO, RW, etc.,) and use those ranges in switch case.

>
> This doesn't look entirely right, since this is the read interface.
> Shouldn't we be allowing pretty much all of these register types
> except maybe W1P to do a read?
>

Peter, some of the registers are not allowed to access by CPU and are only
set during
device programming. For those registers Philippe is suggesting to log
"Illegal AHB access"
when guest is trying to read/write.

Thanks,
Sundeep


>
> On the other hand, in the write function we should probably not allow
> writes to registers documented as read only.
>
> thanks
> -- PMM
>

--f4030437a7e4ab8f44055927f3cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Philippe,<div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Thu, Sep 14, 2017 at 6:43 PM, Peter Maydell <span dir=3D"ltr=
">&lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.m=
aydell@linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
span class=3D"">On 14 September 2017 at 05:36, Philippe Mathieu-Daud=C3=A9 =
&lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; wrote:<br>
&gt; On 09/07/2017 04:24 PM, Subbaraya Sundeep wrote:<br>
</span><div><div class=3D"h5">&gt;&gt; +static uint64_t msf2_sysreg_read(vo=
id *opaque, hwaddr offset,<br>
&gt;&gt; +=C2=A0 =C2=A0 unsigned size)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 MSF2SysregState *s =3D opaque;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint32_t ret =3D 0;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 offset &gt;&gt;=3D 2;<br>
&gt;&gt; +=C2=A0 =C2=A0 if (offset &lt; ARRAY_SIZE(s-&gt;regs)) {<br>
&gt;<br>
&gt;<br>
&gt; This comment is controversial, I&#39;ll let Peter nod.<br>
&gt;<br>
&gt; The SYSREG behaves differently regarding which bus access it (CPU, AHB=
).<br>
&gt; You are implementing CPU access to the SYSREG, the registers have diff=
erent<br>
&gt; permissions when accessed by the CPU. (see the SmartFusion2 User Guide=
:<br>
&gt; Table 21-1 &quot;Register Types&quot; and Table 21-2 &quot;Register Ma=
p&quot;).<br></div></div></blockquote><div><br></div><div>CPU is also one o=
f the bus masters in AHB matrix (Fig 6.1 in page 248).</div><div><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div><div class=3D"h5">
&gt;<br>
&gt; I&#39;d think of this stub:<br>
&gt;<br>
&gt; switch(reg) {<br>
&gt; case register_supported1:<br>
&gt; case register_supported2:<br>
&gt; case register_supported3:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D s-&gt;regs[offset];<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_msf2_sysreg_read(offset=
, ret);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; case RO-U:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR=
, &quot;Illegal AHB access 0x%08&quot;...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; case W1P:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR=
, &quot;Illegal read access ...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; case RW:<br>
&gt; case RW-P:<br>
&gt; case RO:<br>
&gt; case RO-P:<br>
&gt; default:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D s-&gt;regs[offset];<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quo=
t;...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; }<br></div></div></blockquote><div><br></div><div>This sounds good to =
me and will fix later by rearranging registers in enum sorted=C2=A0</div><d=
iv>based on type (RO, RW, etc.,) and use those ranges in switch case.</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div><div class=3D"h5">
<br>
</div></div>This doesn&#39;t look entirely right, since this is the read in=
terface.<br>
Shouldn&#39;t we be allowing pretty much all of these register types<br>
except maybe W1P to do a read?<br></blockquote><div><br></div><div>Peter, s=
ome of the registers are not allowed to access by CPU and are only set duri=
ng=C2=A0</div><div>device programming. For those registers Philippe is sugg=
esting to log &quot;Illegal AHB access&quot;</div><div>when guest is trying=
 to read/write.</div><div><br></div><div>Thanks,</div><div>Sundeep</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
<br>
On the other hand, in the write function we should probably not allow<br>
writes to registers documented as read only.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br></div></div>

--f4030437a7e4ab8f44055927f3cc--

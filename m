Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp942771lfy;
        Tue, 11 Aug 2020 17:43:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxx+BC9Tf56aRKl9vT4+sLjJ6c8sjx4EMCieI8GWDnlCv6NMgnkXkZFJAZnCTObpsAsvlt
X-Received: by 2002:a25:e74e:: with SMTP id e75mr51784516ybh.186.1597193003445;
        Tue, 11 Aug 2020 17:43:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597193003; cv=none;
        d=google.com; s=arc-20160816;
        b=xoVbexRHDkkIX6tCEbMmAuNM78BMyfO9t5AdS6cFtHqEaJ+0ATs1KSmLuj0/IMpFtR
         M0LTjT7RMo2It7gIrcvz+e6lol4NFHM2F+ODdYQLFSAqiIOXG6zwMLCzTZwVykx9NNyT
         55Mp8XMxXwUmF3YfksqZgiARgrhfIkFtT7ZUoBiMEl/9HoZaNBCXhrTRPfRz/pYZj2H9
         BonxqmF56AyaLyHaILwTdRFCLmKx8bc5IGf/DtmD2msDvaSboyI0Qsf+t9pDgAJs3MEM
         ABHOQwWk2xlYZ96wHnnop66nCLpGQ0nEgqRW7EWHJzPhsD3AhWf7nPg+xmPR9pVpD/Gt
         8Ttg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NuTTPPJBQ3xJpwH5vwuv4FBS8TOags08FVpUP7oJeVM=;
        b=teUYzKKe+6pLCQAj5lMzNDtYeRmdrs+ccwC1qwuVnnd7bwBpCF2yfJi0nrvzHkVc57
         zoCsCbR1cZakQx2KhXU2MQXFTpePhz2KM6cPoP7VIKrJbO1mns0g8Ucwc56b7u1otp3V
         4MrKen/0jNqv6taZck/3u3szGU3v+wz+kFcpp5xMBo9cPSLnYqFYRPcbLcaHt/G7bgVe
         zs/+w+bdfbeq66fCIaPYMQOHD8bpDTI0HxA2+TDJBf69+1zKyBYUsejVeQnsmWcI7+6T
         0MpydMGH7o2wUrXxwqKeGg1ThZhzu9i1anEZakum98IFLeY4/waQx4x94uZk+MfJH14C
         bSbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jbDF9Jg8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a36si748790ybi.17.2020.08.11.17.43.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Aug 2020 17:43:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jbDF9Jg8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k5erS-0000AV-PE
	for alex.bennee@linaro.org; Tue, 11 Aug 2020 20:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1k5erC-00009y-Qp
 for qemu-arm@nongnu.org; Tue, 11 Aug 2020 20:43:06 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:38788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1k5erA-0007HM-F0
 for qemu-arm@nongnu.org; Tue, 11 Aug 2020 20:43:06 -0400
Received: by mail-io1-xd42.google.com with SMTP id h4so862550ioe.5
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2020 17:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NuTTPPJBQ3xJpwH5vwuv4FBS8TOags08FVpUP7oJeVM=;
 b=jbDF9Jg8LOghiVmy9EJ0/SZyHRALJHNVu7G9+8k45ps9CO3VVGUbi8Ci96I4cXRVYP
 Df11XEn2pYHz6BpIF4Tw64hofwa2tRCI7zVDGmbyTZw3IK7QaI9cc3FZLo5nyju8rBHi
 t/p1vXzry8PIzuxQtFRzre83JfMYO5aeYm/UbbHYcxqdO+bsFzjLeRRhLuQR5NX9QVhV
 OJY6TStb6BboizX3JqqNsRTOyRtT/xsDMXSPBjb0f/KfRsAsxDVMMbR/8d2PoEW+L+rU
 OeO4nbEzzVTy2LKSR5UuJozPEAWhKn1iyfeqR9T6MfBfgmZnU0cJoEq3fBeJ7Q6i8v5t
 5zrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NuTTPPJBQ3xJpwH5vwuv4FBS8TOags08FVpUP7oJeVM=;
 b=bjrcLjCRo6F5cf9XVfvN1Yx/0eTAi8E2j0na4dcmq7vb9fQ600TpljrMqkq25mMlhq
 nquFgtIEBDwjPZX5NeAOkZGpgbP9p1r10Dq2z8WT8+O4C+TZUleYbLpqIDblmjdzTAmM
 vkoQPJgLmL08zF9Q+l/ye5K+TSLUWml5L5nIOcpMT90/vDOUbpgkYGZendz4isFKqFWN
 H2TN+LHmDsKTqStFup0ky1C8wGP3oxHcfhRItFKEV86EWp38gT4err0SVmgSbN+MzAJ3
 53wBGdSIFh5ULgr08Vt7VaUZUQ1Ww2D+DDFWmH37sRFp4LuZLdBbewJooywLg6LF3Pie
 v9ow==
X-Gm-Message-State: AOAM531KrB2wG7Anob5rJEgmT/QN3i6u3deF1s4CS8qJ2oRxOw8WygNm
 Q3PjE0b66ezQ0Td9aPT78eXx/7Z3bkVHPkn4yRty
X-Received: by 2002:a6b:6508:: with SMTP id z8mr25607551iob.0.1597192983013;
 Tue, 11 Aug 2020 17:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1596768588.git.haibo.xu@linaro.org>
 <1663d06172cffa723e00893837ba04634f061fc8.1596768588.git.haibo.xu@linaro.org>
 <20200810110521.4hodliv4tl64v463@kamzik.brq.redhat.com>
 <CAJc+Z1HDokOuTA4=hzS5KHPU9w3Hm0UV=nJbjnvHEbtTpDY0Ag@mail.gmail.com>
 <20200811163832.roxay4uafcyp3sed@kamzik.brq.redhat.com>
In-Reply-To: <20200811163832.roxay4uafcyp3sed@kamzik.brq.redhat.com>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Wed, 12 Aug 2020 08:42:51 +0800
Message-ID: <CAJc+Z1Ev8TfzKBqG1-GGeaEepLQVay0LzwJv3vFKg_Ws653qRg@mail.gmail.com>
Subject: Re: [PATCH 6/7] hw/arm/virt: spe: Add SPE fdt binding for virt machine
To: Andrew Jones <drjones@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000064061505aca37879"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=haibo.xu@linaro.org; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dQ6KMX9eAIN1

--00000000000064061505aca37879
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Aug 2020 at 00:40, Andrew Jones <drjones@redhat.com> wrote:

> On Tue, Aug 11, 2020 at 10:38:02AM +0800, Haibo Xu wrote:
> > On Mon, 10 Aug 2020 at 19:05, Andrew Jones <drjones@redhat.com> wrote:
> > >
> > > On Fri, Aug 07, 2020 at 08:10:36AM +0000, Haibo Xu wrote:
> > > > Add a virtual SPE device for virt machine while using PPI
> > > > 5 for SPE overflow interrupt number.
> > >
> > > Any reason PPI 5 was selected?
> > >
> >
> > No special reason to choose PPI 5. Just re-use the setting in kvmtool.
>
> Please write in the commit message that kvmtool has already selected PPI 5
> for this purpose.
>

Ok, will fix it.


> > > > +    fdt_add_spe_nodes(vms);
> > > > +
> > >
> > > You didn't add any compat code, which means all virt machine types are
> now
> > > getting an SPE FDT node, ACPI table change, and, most importantly, PPI
> 5
> > > has gone from unallocated to allocated. We definitely need compat code.
> > >
> >
> > So the 'compat code' here means to only add the SPE node in KVM mode?
>
> No, it means only add it for the 5.2 and later machine types. You'll see
> what I mean when you study the patchset I pointed out, which is also only
> for 5.2 and later machine types.
>

Ok, thanks for the clarification!


> > > > +        if (switched_level & KVM_ARM_DEV_SPE) {
> > > > +            qemu_set_irq(cpu->spe_interrupt,
> > > > +                         !!(run->s.regs.device_irq_level &
> KVM_ARM_DEV_SPE));
> > > > +            switched_level &= ~KVM_ARM_DEV_SPE;
> > > > +        }
> > > > +
> > >
> > > Did you test with a userspace irqchip?
> >
> > No, I just tested with an in-kernel irqchip.
> > Actually, the current kernel vSPE patch doesn't support a userspace
> irqchip.
> > AFAIK, the userspace irqchip support should be ready in the next
> > kernel patch series
> > which will be sent out for review in the middle of September.
>
> It probably doesn't hurt to do the above hunk already, hoping it will just
> work when it's possible to test, but I generally prefer only adding tested
> code. Maybe this hunk should be a separate patch with a commit message
> explaining that it's untested?
>

Good idea! I will drop the hunk in this series, and send out a separate
patch to enable it
once the kernel support is ready!


> Thanks,
> drew
>
>

--00000000000064061505aca37879
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 12 Aug 2020 at 00:40, Andrew Jone=
s &lt;<a href=3D"mailto:drjones@redhat.com">drjones@redhat.com</a>&gt; wrot=
e:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Tue, Aug 11, 2020 at 10:38:02AM +0800, Haibo Xu wrote:<br>
&gt; On Mon, 10 Aug 2020 at 19:05, Andrew Jones &lt;<a href=3D"mailto:drjon=
es@redhat.com" target=3D"_blank">drjones@redhat.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Fri, Aug 07, 2020 at 08:10:36AM +0000, Haibo Xu wrote:<br>
&gt; &gt; &gt; Add a virtual SPE device for virt machine while using PPI<br=
>
&gt; &gt; &gt; 5 for SPE overflow interrupt number.<br>
&gt; &gt;<br>
&gt; &gt; Any reason PPI 5 was selected?<br>
&gt; &gt;<br>
&gt; <br>
&gt; No special reason to choose PPI 5. Just re-use the setting in kvmtool.=
<br>
<br>
Please write in the commit message that kvmtool has already selected PPI 5<=
br>
for this purpose.<br></blockquote><div><br></div><div>Ok, will fix it.</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; &gt; &gt; +=C2=A0 =C2=A0 fdt_add_spe_nodes(vms);<br>
&gt; &gt; &gt; +<br>
&gt; &gt;<br>
&gt; &gt; You didn&#39;t add any compat code, which means all virt machine =
types are now<br>
&gt; &gt; getting an SPE FDT node, ACPI table change, and, most importantly=
, PPI 5<br>
&gt; &gt; has gone from unallocated to allocated. We definitely need compat=
 code.<br>
&gt; &gt;<br>
&gt; <br>
&gt; So the &#39;compat code&#39; here means to only add the SPE node in KV=
M mode?<br>
<br>
No, it means only add it for the 5.2 and later machine types. You&#39;ll se=
e<br>
what I mean when you study the patchset I pointed out, which is also only<b=
r>
for 5.2 and later machine types.<br></blockquote><div><br></div><div>Ok, th=
anks for the clarification!</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (switched_level &amp; KVM_AR=
M_DEV_SPE) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_set_irq(cpu-=
&gt;spe_interrupt,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!!(run-&gt;s.regs.device_irq_level &amp; KVM=
_ARM_DEV_SPE));<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switched_level &a=
mp;=3D ~KVM_ARM_DEV_SPE;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; +<br>
&gt; &gt;<br>
&gt; &gt; Did you test with a userspace irqchip?<br>
&gt; <br>
&gt; No, I just tested with an in-kernel irqchip.<br>
&gt; Actually, the current kernel vSPE patch doesn&#39;t support a userspac=
e irqchip.<br>
&gt; AFAIK, the userspace irqchip support should be ready in the next<br>
&gt; kernel patch series<br>
&gt; which will be sent out for review in the middle of September.<br>
<br>
It probably doesn&#39;t hurt to do the above hunk already, hoping it will j=
ust<br>
work when it&#39;s possible to test, but I generally prefer only adding tes=
ted<br>
code. Maybe this hunk should be a separate patch with a commit message<br>
explaining that it&#39;s untested?<br></blockquote><div><br></div><div>Good=
 idea! I will drop the hunk in this series, and send out a separate patch t=
o enable it</div><div>once the kernel support is ready!</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
Thanks,<br>
drew<br>
<br>
</blockquote></div></div>

--00000000000064061505aca37879--

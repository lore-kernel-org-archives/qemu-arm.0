Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4387317lfk;
        Thu, 27 Jan 2022 13:28:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQJzwF3rytFmC8xfZtKu4E4Z4+18qN7H0RY8tdf0aK4sgQvGAZ9pPKGm0q4RdQMDdoYitE
X-Received: by 2002:a6b:fb01:: with SMTP id h1mr3318170iog.191.1643318905411;
        Thu, 27 Jan 2022 13:28:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643318905; cv=none;
        d=google.com; s=arc-20160816;
        b=Sqhh2652etNV86h0braT+ps9NihHeIrYeu/gBrbm9UA3r3KbK6uq0gCv3/85FDLTJ/
         hMbvv8aqGYyUWShlFm6QCzrwy2wEoPBxsovQm3tOG9hwyclFw9bnpqH9wJM1TtUBSNoi
         gneXFqzsSz08RAUWcV3Dwzv4BjipZonR/r7jL8Wclo6tzghq2wv6xEfrololp0gcpp4a
         NIG/9LnfzaUa+mA2z4qJZPLOlx0dDrKSiOXHvNlZJluGzD3/dE0jhRbVhW5+GgL9noAS
         81rUFMpjINt8Ve4fwM3DVMoEkx7hQEYWWuG7/npHWMgnwT8R7ruIr3FXNhUbcVPMkyBS
         fKHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=HFH5M2m9A2q6rcfIPGThsq/wvoCfYISRXeX64YN1/kk=;
        b=NRuT10pcr8jIPb3adC2yD+cDuUXjc1E0s+xk3PPBfwvr4YWtDMtwJOwg/b5Nx3JX2E
         UzKxuV5pS2PHxCOQH2p6T32ksFOgAgqTIAjtPfrj1cg2d6M0WFdDw70TnlHaLx9qJLlh
         Xzru0mM9IaZK8xXKiztmieR7rtXcIsXParaoK4njN3zj4UcKWNpXzZTp6zB7ujhRlPar
         NyZ7Kp8flPze1MhHp/jVTLs5Oww5mQ7NzcWwxuQuicl6nPmBLvs04fJgjHSUo/tCH/r7
         Cb7/QmPbDfcdk2w83+HOoCfN+ICFX9wz4WVGtvQRzF7D5qVIXLAmfG24YFF2ppZmmUvP
         gnGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="lN/JgQnI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f19si1823340iow.59.2022.01.27.13.28.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 13:28:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="lN/JgQnI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:47508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDCJa-00072U-0C
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 16:28:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nDCJ8-00070f-Cv
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 16:27:55 -0500
Received: from [2607:f8b0:4864:20::e2f] (port=36762
 helo=mail-vs1-xe2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nDCJ6-0001eh-Gv
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 16:27:54 -0500
Received: by mail-vs1-xe2f.google.com with SMTP id l14so633158vsm.3
 for <qemu-arm@nongnu.org>; Thu, 27 Jan 2022 13:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HFH5M2m9A2q6rcfIPGThsq/wvoCfYISRXeX64YN1/kk=;
 b=lN/JgQnItc0dx1eliWFNuO8pmt99lFNCpuVlwiMfIwscfVJhWR+nH93uuBuqX09KZk
 yJIKLGgHD30hHqyaaUlLZKVCo8sR244YxZQxz+hYnt4SZOOkQLYH92sp/Arja3rzmYoX
 ym1MjMJlwz1iRwb5iEE6FOK3GmLFO1f8sOi58cI8spqaEt3QC4fdu0bi/sm9Ozgow0qF
 gm6iYIWH8B2hejriJxb5RIQ+j2T/ct498bwarMGKN5GaVsZ1fQMRp4uPeRqDw5/GzM//
 JBZ2c3Uqz5OmgoDppxy6BsWVfCFiJAOCVW4PxZlaBvTefpeZkxwGaSF/coRzSz5J3vnq
 IYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HFH5M2m9A2q6rcfIPGThsq/wvoCfYISRXeX64YN1/kk=;
 b=ksy2t0PaAnmrL8ihd8oQYTuv5fPQM16kD4ejnyF1P9LaKtbN4Bs/PDgbvBzuPl2wiS
 sJuPCi480rGOTEe0FGxvQnzhnD2HQRTh3uGUCS+og6G1FOO9FxXnNDQN7PsfN68exJ8Q
 2+shjFJQ0pPJcjP3qIbiIHp27dQ6kmtb5PyHrpR5BfJBNIzzPoGCg1VcTkTXbwYX9gM0
 s2fyS74ZokZTOk6qOUsq/AGt2SAdiDVk/qOLmiBT+LqTXWcj9mw9Jxg+yCl2dMkOGdDO
 k378EyYrHkloAtWSwh6p8JrBdsOuoqoIaD7iiAbg8qCWZmvZ9IYSuumSQRsvFOKaJ/qB
 2NhA==
X-Gm-Message-State: AOAM532l53yU9ZKjCbr+bv5Tg7J9jKZrLoQ9QYV8Rgd5zbegEDYqgMdv
 0lPsUkyTXFUgP+05eTGra6IrOvVUL6hFaCa1so34CA==
X-Received: by 2002:a67:e0c2:: with SMTP id m2mr2705839vsl.49.1643318870262;
 Thu, 27 Jan 2022 13:27:50 -0800 (PST)
MIME-Version: 1.0
References: <20220110175607.591401-1-venture@google.com>
 <20220110175607.591401-2-venture@google.com>
 <CAFEAcA-s4upQppain+2L-GOux8hN5cNVhqS5Q3u+J7fr_7exPw@mail.gmail.com>
In-Reply-To: <CAFEAcA-s4upQppain+2L-GOux8hN5cNVhqS5Q3u+J7fr_7exPw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 27 Jan 2022 13:27:39 -0800
Message-ID: <CAO=notyufGXBEfg=CpUAT38V4wG22b7xGT1-u33QriLguZ3LhA@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/misc: Add Nuvoton's PCI Mailbox Module
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Havard Skinnemoen <hskinnemoen@google.com>,
 CS20 KFTing <kfting@nuvoton.com>, 
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 Hao Wu <wuhaotsh@google.com>, Joe Komlodi <komlodi@google.com>
Content-Type: multipart/alternative; boundary="00000000000084589305d696fd3e"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::e2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=venture@google.com; helo=mail-vs1-xe2f.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zVk87Juo2AmA

--00000000000084589305d696fd3e
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 27, 2022 at 10:37 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 10 Jan 2022 at 17:56, Patrick Venture <venture@google.com> wrote:
> >
> > From: Hao Wu <wuhaotsh@google.com>
> >
> > The PCI Mailbox Module is a high-bandwidth communcation module
> > between a Nuvoton BMC and CPU. It features 16KB RAM that are both
> > accessible by the BMC and core CPU. and supports interrupt for
> > both sides.
> >
> > This patch implements the BMC side of the PCI mailbox module.
> > Communication with the core CPU is emulated via a chardev and
> > will be in a follow-up patch.
> >
> > Reviewed-by: Patrick Venture <venture@google.com>
> > Reviewed-by: Joe Komlodi <komlodi@google.com>
>
> Hi; this mostly looks good, but I have a question about s->content.
>
> > +static void npcm7xx_pci_mbox_init(Object *obj)
> > +{
> > +    NPCM7xxPCIMBoxState *s = NPCM7XX_PCI_MBOX(obj);
> > +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> > +
> > +    memory_region_init_ram_device_ptr(&s->ram, obj, "pci-mbox-ram",
> > +                                      NPCM7XX_PCI_MBOX_RAM_SIZE,
> s->content);
>
> What's s->content for? Nothing in the rest of the device emulation
> touches it, which seems odd.
>

Hao informed me that we can drop the content bit here, since it's not used
until a later patch that we'll be sending up with a bit more detail when we
get a chance. I sent this series up to land some of the groundwork.

I can send out a v2 with that bit removed.


>
> memory_region_init_ram_device_ptr() is intended primarily
> for "create a MemoryRegion corresponding to something like
> a bit of a host device (eg a host PCI MMIO BAR). That doesn't
> seem like what you're doing here. In particular, using it
> means that you take on responsibility for ensuring that the
> underlying memory gets migrated, which you're not doing.
>
> If you just want a MemoryRegion that's backed by a bit of
> host memory, use memory_region_init_ram().
>

I think this is what we use it for in the future patches, when we add it
back, it'll come with the context.


>
> > +#define TYPE_NPCM7XX_PCI_MBOX "npcm7xx-pci-mbox"
> > +#define NPCM7XX_PCI_MBOX(obj) \
> > +    OBJECT_CHECK(NPCM7xxPCIMBoxState, (obj), TYPE_NPCM7XX_PCI_MBOX)
>
> We prefer the OBJECT_DECLARE_SIMPLE_TYPE() macro rather than
> hand-defining a cast macro these days.
>

Ack.


>
> thanks
> -- PMM
>

Thanks!

--00000000000084589305d696fd3e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 27, 2022 at 10:37 AM Pete=
r Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Mon, 10 Jan 2022 at 17:56, Patrick Venture &lt;<a href=3D"mailto:=
venture@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"_bla=
nk">wuhaotsh@google.com</a>&gt;<br>
&gt;<br>
&gt; The PCI Mailbox Module is a high-bandwidth communcation module<br>
&gt; between a Nuvoton BMC and CPU. It features 16KB RAM that are both<br>
&gt; accessible by the BMC and core CPU. and supports interrupt for<br>
&gt; both sides.<br>
&gt;<br>
&gt; This patch implements the BMC side of the PCI mailbox module.<br>
&gt; Communication with the core CPU is emulated via a chardev and<br>
&gt; will be in a follow-up patch.<br>
&gt;<br>
&gt; Reviewed-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.com"=
 target=3D"_blank">venture@google.com</a>&gt;<br>
&gt; Reviewed-by: Joe Komlodi &lt;<a href=3D"mailto:komlodi@google.com" tar=
get=3D"_blank">komlodi@google.com</a>&gt;<br>
<br>
Hi; this mostly looks good, but I have a question about s-&gt;content.<br>
<br>
&gt; +static void npcm7xx_pci_mbox_init(Object *obj)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 NPCM7xxPCIMBoxState *s =3D NPCM7XX_PCI_MBOX(obj);<br>
&gt; +=C2=A0 =C2=A0 SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 memory_region_init_ram_device_ptr(&amp;s-&gt;ram, obj, =
&quot;pci-mbox-ram&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_PCI=
_MBOX_RAM_SIZE, s-&gt;content);<br>
<br>
What&#39;s s-&gt;content for? Nothing in the rest of the device emulation<b=
r>
touches it, which seems odd.<br></blockquote><div><br></div><div>Hao inform=
ed me that we can drop the content bit=C2=A0here, since it&#39;s not used u=
ntil a later patch that we&#39;ll be sending up with a bit more detail when=
 we get a chance. I sent this series up to land some of the groundwork.</di=
v><div><br></div><div>I can send out a v2 with that bit removed.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
memory_region_init_ram_device_ptr() is intended primarily<br>
for &quot;create a MemoryRegion corresponding to something like<br>
a bit of a host device (eg a host PCI MMIO BAR). That doesn&#39;t<br>
seem like what you&#39;re doing here. In particular, using it<br>
means that you take on responsibility for ensuring that the<br>
underlying memory gets migrated, which you&#39;re not doing.<br>
<br>
If you just want a MemoryRegion that&#39;s backed by a bit of<br>
host memory, use memory_region_init_ram().<br></blockquote><div><br></div><=
div>I think this is what we use it for in the future patches, when we add i=
t back, it&#39;ll come with the context.</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
&gt; +#define TYPE_NPCM7XX_PCI_MBOX &quot;npcm7xx-pci-mbox&quot;<br>
&gt; +#define NPCM7XX_PCI_MBOX(obj) \<br>
&gt; +=C2=A0 =C2=A0 OBJECT_CHECK(NPCM7xxPCIMBoxState, (obj), TYPE_NPCM7XX_P=
CI_MBOX)<br>
<br>
We prefer the OBJECT_DECLARE_SIMPLE_TYPE() macro rather than<br>
hand-defining a cast macro these days.<br></blockquote><div><br></div><div>=
Ack.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
thanks<br>
-- PMM<br></blockquote><div><br></div><div>Thanks!=C2=A0</div></div></div>

--00000000000084589305d696fd3e--

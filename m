Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp2059015lfq;
        Mon, 11 Apr 2022 19:41:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIiBtqs/WNqZIyZnFQVU8RaLXbD9kLFxbQ8fh624VHYqJoMtxdMFs4IRAe0Jqijc4rNwR9
X-Received: by 2002:ac8:7fcc:0:b0:2e0:7760:2f10 with SMTP id b12-20020ac87fcc000000b002e077602f10mr1852451qtk.34.1649731309591;
        Mon, 11 Apr 2022 19:41:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649731309; cv=none;
        d=google.com; s=arc-20160816;
        b=oP1GspvvtxZhc+pGRzc/0gSV4hwbEzNR6Q4+vXF1UPa59FC8ITjGWZjejy7haqKh+q
         rMmUqaBOIzSOKPopOvvjdnNznmM5L0bkjtLzBu5p/yffNWZphdSELRzO4sahlO9d/Ryz
         AikHsTO2xshdgcJE8YBhmLA12FRoccq9r2hXHCOFi8MYslK77ZB0SzwrFj/GovONRMXD
         Ms0azXfVhNB6zGAokduj3BvXRKgI/b9De4ozJshO9ov6VTzaaZhVIBL/NoVe2ac+LqvD
         GEHmRi67OQTDL/sPYT2tuhFAuwtjVLzITeaSsDbyPWKI45/34XYu+82Fe7vRufI0Tfi7
         i8qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=JIRYptotj3nx2AnubwZpICkUj77vXyFNpJT8FKuht9o=;
        b=FPIXFafEwcrq4tsYFAt7AIp8+LHugdhpEyv008Gk9w5ZDuWIVdiJX/tjbjtUR7BWwS
         +g63Q75Nm+AcDCn9F1QhkaYkoU8Szyw1HQSoI324SbQppr126H3j1hHCLWLvdMgj38dP
         b3Uk55g0N5Hd29t13qw50oIQuKNKAugdcvPEodHK23+WG5BM9lYFbeT2uBADhAMv8X+f
         Sas6oOuD/ehxXz4EU0XIRWn7AMXZw4TCF5AQi6KSTxlVgVnmxhM3bOU8fX2P/FqPwX5H
         TFbbGq4toeHZQ6SRqrQwSSU8gUhJjLu+e7ERpIdyBb2L+y5mjo0/SOnmcszZUL5T+fpu
         k4VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=HGihH3x8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10-20020a379a0a000000b0069bfbde1d16si3295515qke.473.2022.04.11.19.41.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 19:41:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=HGihH3x8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:54558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ne6TV-0005Jy-2o
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 22:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1ne6Sw-0005J8-0f
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 22:41:14 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35]:37386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1ne6Su-0006fb-7s
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 22:41:13 -0400
Received: by mail-vs1-xe35.google.com with SMTP id n5so14984626vsc.4
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 19:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JIRYptotj3nx2AnubwZpICkUj77vXyFNpJT8FKuht9o=;
 b=HGihH3x8jiCb54k8HV927eh3633EW/uHhTn2g96gjR9ul/Y8xFQNeo+HIY9O9JITr6
 UA+LGGCC4X1qfS3ZMvEeMavYmaMc6o9iMcLYVMM8UNt5xPB4Sq5oD/7/UF3ywwAMS+C+
 bbk7RUq9bPvTNyEFNYoKchycApihKL6HEzGjQE4MSaQjQDM/VVVtljrtTspn+5tc49pn
 uIjoX/5Xk+Az/nfBMNRbujQ5c4N5LiklRa+Z62agCuQQztMyHU1MacGLJLVXB/CAY11f
 IWqWy7dXkSWUB6ziqVJ9UxJhoBh2Zm+gXaQUyZ44fcxlQUMV1Wv6hFpZpkgOHA9/7aQ7
 cd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JIRYptotj3nx2AnubwZpICkUj77vXyFNpJT8FKuht9o=;
 b=24Nxdvi1zHSo34P6Kz1WvKkZp4xUE5SJMUkGFkdRZHut1c2mTxKAMlM5yDqSZ14W45
 C6IxJas8gXFhTWzNwBdtrO9J90RRo1EpJ2b8dWk40YlBhKuaTP79wRrominhLnylrHCB
 +EBL6v+p+r98x/UdH/nmWLC87yqf/ayYGL2GLnE4e/iVaNuoY+TWvpWUHOnJvYp3kqEo
 R/TYdfe9HRhnxQ7N4ws6DEvvqOQy46xXzAmJzjVVWw9T/55gqmn4qTCxdvoslthjgR/e
 S8tigX1asj70+7YS1LYQVMxuK489IoedGLEtMLVfV/P8aYzuLkT/o3g9Ps3YMAe7aUuH
 jDsg==
X-Gm-Message-State: AOAM530/NPpt818zpoQzj+yRpKVb8AnA7qzPLFFhOK3qn17y/7xMuO7R
 Y3U9PM60x5ceqan8WYWBxrWU0lK1dbjVfdadENQDfA==
X-Received: by 2002:a67:f7d0:0:b0:328:2c41:683d with SMTP id
 a16-20020a67f7d0000000b003282c41683dmr4869103vsp.46.1649731269585; Mon, 11
 Apr 2022 19:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220110175607.591401-1-venture@google.com>
 <20220110175607.591401-2-venture@google.com>
 <CAFEAcA-s4upQppain+2L-GOux8hN5cNVhqS5Q3u+J7fr_7exPw@mail.gmail.com>
 <CAO=notyufGXBEfg=CpUAT38V4wG22b7xGT1-u33QriLguZ3LhA@mail.gmail.com>
In-Reply-To: <CAO=notyufGXBEfg=CpUAT38V4wG22b7xGT1-u33QriLguZ3LhA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 11 Apr 2022 19:40:58 -0700
Message-ID: <CAO=noty4xUoARinJ83UFaJ99i77kau7C5oH4aA5WPVUxfYXidQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/misc: Add Nuvoton's PCI Mailbox Module
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Havard Skinnemoen <hskinnemoen@google.com>,
 CS20 KFTing <kfting@nuvoton.com>, 
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 Hao Wu <wuhaotsh@google.com>, Joe Komlodi <komlodi@google.com>
Content-Type: multipart/alternative; boundary="0000000000004d67d905dc6bfe5c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=venture@google.com; helo=mail-vs1-xe35.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: jzedqaNwwtvU

--0000000000004d67d905dc6bfe5c
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 27, 2022 at 1:27 PM Patrick Venture <venture@google.com> wrote:

>
>
> On Thu, Jan 27, 2022 at 10:37 AM Peter Maydell <peter.maydell@linaro.org>
> wrote:
>
>> On Mon, 10 Jan 2022 at 17:56, Patrick Venture <venture@google.com> wrote:
>> >
>> > From: Hao Wu <wuhaotsh@google.com>
>> >
>> > The PCI Mailbox Module is a high-bandwidth communcation module
>> > between a Nuvoton BMC and CPU. It features 16KB RAM that are both
>> > accessible by the BMC and core CPU. and supports interrupt for
>> > both sides.
>> >
>> > This patch implements the BMC side of the PCI mailbox module.
>> > Communication with the core CPU is emulated via a chardev and
>> > will be in a follow-up patch.
>> >
>> > Reviewed-by: Patrick Venture <venture@google.com>
>> > Reviewed-by: Joe Komlodi <komlodi@google.com>
>>
>> Hi; this mostly looks good, but I have a question about s->content.
>>
>> > +static void npcm7xx_pci_mbox_init(Object *obj)
>> > +{
>> > +    NPCM7xxPCIMBoxState *s = NPCM7XX_PCI_MBOX(obj);
>> > +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>> > +
>> > +    memory_region_init_ram_device_ptr(&s->ram, obj, "pci-mbox-ram",
>> > +                                      NPCM7XX_PCI_MBOX_RAM_SIZE,
>> s->content);
>>
>> What's s->content for? Nothing in the rest of the device emulation
>> touches it, which seems odd.
>>
>
> Hao informed me that we can drop the content bit here, since it's not used
> until a later patch that we'll be sending up with a bit more detail when we
> get a chance. I sent this series up to land some of the groundwork.
>
> I can send out a v2 with that bit removed.
>
>
>>
>> memory_region_init_ram_device_ptr() is intended primarily
>> for "create a MemoryRegion corresponding to something like
>> a bit of a host device (eg a host PCI MMIO BAR). That doesn't
>> seem like what you're doing here. In particular, using it
>> means that you take on responsibility for ensuring that the
>> underlying memory gets migrated, which you're not doing.
>>
>> If you just want a MemoryRegion that's backed by a bit of
>> host memory, use memory_region_init_ram().
>>
>
> I think this is what we use it for in the future patches, when we add it
> back, it'll come with the context.
>
>
>>
>> > +#define TYPE_NPCM7XX_PCI_MBOX "npcm7xx-pci-mbox"
>> > +#define NPCM7XX_PCI_MBOX(obj) \
>> > +    OBJECT_CHECK(NPCM7xxPCIMBoxState, (obj), TYPE_NPCM7XX_PCI_MBOX)
>>
>> We prefer the OBJECT_DECLARE_SIMPLE_TYPE() macro rather than
>> hand-defining a cast macro these days.
>>
>
> Ack.
>
>
>>
>> thanks
>> -- PMM
>>
>
Peter, just an FYI, this fell off my radar, but I will be circling back
this week to revisit any patches I've sent that are in limbo or waiting on
me, etc.  Thanks for your patience.


>
> Thanks!
>

--0000000000004d67d905dc6bfe5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 27, 2022 at 1:27 PM Patri=
ck Venture &lt;<a href=3D"mailto:venture@google.com">venture@google.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 27, 2022 at 10:37 AM Peter Ma=
ydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">pet=
er.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Mon, 10 Jan 2022 at 17:56, Patrick Venture &lt;<a h=
ref=3D"mailto:venture@google.com" target=3D"_blank">venture@google.com</a>&=
gt; wrote:<br>
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
-- PMM<br></blockquote></div></div></blockquote><div><br></div><div>Peter, =
just an FYI, this fell off my radar, but I will be circling back this week =
to revisit any patches I&#39;ve sent that are in limbo or waiting on me, et=
c.=C2=A0 Thanks for your patience.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"></blockquote><div><br><=
/div><div>Thanks!=C2=A0</div></div></div>
</blockquote></div></div>

--0000000000004d67d905dc6bfe5c--

Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp674517lfk;
        Fri, 3 Dec 2021 14:11:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBCZdnhEizw2VvVho+/gAbRw5rD56XL79v1ny0It5ChVbnSPLvuAKGxhn2DuHF0lzXpbFB
X-Received: by 2002:a67:b643:: with SMTP id e3mr25193243vsm.33.1638569485927;
        Fri, 03 Dec 2021 14:11:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638569485; cv=none;
        d=google.com; s=arc-20160816;
        b=gwu8Onhp6qD/MM6/6ZVv6z9W3PHrk5l4/vbJMHXtXsvePW2wjYFiPHRaj48GPJkgIQ
         Kc7p9YAu0czEXV5xxijVev1C60qG90Rbdo3Bnq4zb7lJIS9g9dQHy19Ofs1nE8oF7vY8
         JDM1t72NaMuW/d0zIY9mNxP8ztFUGSzvEjq2I/pCNgb/M4pAYiSnAdY3C91f7MmRKDts
         A3ScUoDIF4JAWcrsOpL762k6ah8cshWplIQcnhGj+9C1U3yctrgej9j0+VsGiEeL2lv4
         P+8cG3stgXG8Wn/d+N5FdgTECSDVOPqQZGLaTsA2ZTngbbav/irccLH171LcVKfUM+Wo
         N7RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=H8mMdlKR8/YXr6bFk5fAWhNszA1OPztD7P0dKu8ercc=;
        b=Es2Zs0QcNR0Resr/GBrd3g/LuWkbhQNb4L6y0b10cBy0vqQxWJudU5tVXEM4j0Iyh/
         vM8vdahE+AaIqeJDhx/hIBily3sHBFstGv8MNMQ01kqtAXAwWvEDV+uGrDJ8lLyZ/r1k
         i6+FWnXAe0Y6hI5vqD0m/mNyrcduJNqeq/jU2PS9eMorXujiOil8pd7Tbst6GazpjU3i
         cnKY1qcPkhVigz/Wq9YStNbQs6ieGhr8aYWdGQi326JJnQMqxOgwPDLNM1j0/5VnzrpN
         m0xHtWGPIZid48dtXIblClP4BbOk2nZfJbY+mtrxZzPoHXw5B+mGFw0rEIvY5eLMWVjs
         Ta/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=NX0Np7+E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d14si4001909vst.218.2021.12.03.14.11.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Dec 2021 14:11:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=NX0Np7+E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:36038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mtGm5-0003JS-8i
	for alex.bennee@linaro.org; Fri, 03 Dec 2021 17:11:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1mtGlc-0003Gy-OO
 for qemu-arm@nongnu.org; Fri, 03 Dec 2021 17:10:56 -0500
Received: from [2607:f8b0:4864:20::92f] (port=41648
 helo=mail-ua1-x92f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1mtGla-0000l6-Uw
 for qemu-arm@nongnu.org; Fri, 03 Dec 2021 17:10:56 -0500
Received: by mail-ua1-x92f.google.com with SMTP id p37so8097081uae.8
 for <qemu-arm@nongnu.org>; Fri, 03 Dec 2021 14:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H8mMdlKR8/YXr6bFk5fAWhNszA1OPztD7P0dKu8ercc=;
 b=NX0Np7+Exg3H7DMcMWZdHLb2SimDPcaFyCNfZfxp223e475yw2/GDLnEBzzYd2AKf4
 6YEjP1rEfRIz6ecVw2JFXh8Q5Yx3jLIIwPKHssM+v/VwVeexH8u95XMpPV+jKYsMgkcC
 YeKuavNc9bmMDIDm3SIOLa3KEZk9Ade77Mhpq2OMH6QD7ue6hJdgys27Y6cPd6rjV/RV
 9x+JOu8oMv2FizJE+HdRvo1KHTW+LsLUiPjBwkOXiCLXMChC/Slyvl0L8gen1VyM1izM
 2cUBe0HfIzWFsZyuA+0Bo0ioTvW6EiZ6/acNALXbP7bUa0FvD8y56kGvQp8NMjhUqhPa
 0eEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H8mMdlKR8/YXr6bFk5fAWhNszA1OPztD7P0dKu8ercc=;
 b=i4EMEvgE1EfVfMg4uw4gsADMYzU541xPFeuVETnWG6U5KTw4obE7Xlgbf4CU4VWs70
 T+QyIxHzi/6EtDFG4FCwkT4j6dRQh3k+GEJ+Vv/9I7mG7aCNumf8WdSj6KwwuSYQZ25w
 n0Sl0zEwGVaBVHGFKpsDV8oejYBmIf2iZuKI1lAvMviM4he1A2Z+7hzgNsPhqP/0VQtW
 f2Kf0wWZpegskWUfC3kSZqaeO6b7Mnpt1KrV9ABzJa1MEoywg4Lprd/1eAzH5Ucfj1Ng
 vm7P54nDMxySzc/CV9je7hGUvG1qSToPRux5u8A4RvobEMb2PuL92EZB+HIv7Fxjcf7P
 HOWA==
X-Gm-Message-State: AOAM531CXH0clNWGFkt7eIahaKfFt3k+BNFBjfPVi6C80CnoImckix8M
 UlnwOqN3D7xdvNG+cPjn7i3dam5WsAKJY6GPeWA/OA==
X-Received: by 2002:a67:d28b:: with SMTP id z11mr23648659vsi.49.1638569452778; 
 Fri, 03 Dec 2021 14:10:52 -0800 (PST)
MIME-Version: 1.0
References: <20211203212714.1714362-1-venture@google.com>
 <288266a6-755c-308b-779a-6bf5d6e41207@amsat.org>
 <CAO=notwF3+b+Ld6vNJMQkD57SvGH3noicoPhA9UPLi3fjBtQhA@mail.gmail.com>
In-Reply-To: <CAO=notwF3+b+Ld6vNJMQkD57SvGH3noicoPhA9UPLi3fjBtQhA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 3 Dec 2021 14:10:41 -0800
Message-ID: <CAO=notzgEDESrLG-+nq7_CsmiyJt3sFT6GPiyfLVaRezA_pe3g@mail.gmail.com>
Subject: Re: [PATCH] hw/net: npcm7xx_emc fix missing queue_flush
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 hskinnemoen@google.com, KFTING@nuvoton.com
Content-Type: multipart/alternative; boundary="0000000000002cc31005d2452e6e"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=venture@google.com; helo=mail-ua1-x92f.google.com
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
X-TUID: tmEMQzr0WMew

--0000000000002cc31005d2452e6e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 3, 2021 at 1:54 PM Patrick Venture <venture@google.com> wrote:

>
>
> On Fri, Dec 3, 2021 at 1:42 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
> wrote:
>
>> On 12/3/21 22:27, Patrick Venture wrote:
>> > The rx_active boolean change to true should always trigger a try_read
>> > call that flushes the queue.
>> >
>> > Signed-off-by: Patrick Venture <venture@google.com>
>> > ---
>> >  hw/net/npcm7xx_emc.c | 10 ++--------
>> >  1 file changed, 2 insertions(+), 8 deletions(-)
>> >
>> > diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
>> > index 7c892f820f..97522e6388 100644
>> > --- a/hw/net/npcm7xx_emc.c
>> > +++ b/hw/net/npcm7xx_emc.c
>> > @@ -581,13 +581,6 @@ static ssize_t emc_receive(NetClientState *nc,
>> const uint8_t *buf, size_t len1)
>> >      return len;
>> >  }
>> >
>> > -static void emc_try_receive_next_packet(NPCM7xxEMCState *emc)
>> > -{
>> > -    if (emc_can_receive(qemu_get_queue(emc->nic))) {
>> > -        qemu_flush_queued_packets(qemu_get_queue(emc->nic));
>> > -    }
>> > -}
>>
>> What about modifying as emc_flush_rx() or emc_receive_and_flush()
>> helper instead?
>>
>>  static void emc_flush_rx(NPCM7xxEMCState *emc)
>>  {
>>      emc->rx_active =3D true;
>>      qemu_flush_queued_packets(qemu_get_queue(emc->nic));
>>  }
>>
>
> I'm ok with that idea, although I'm less fond that it _hides_ the
> rx_active=3Dtrue.  There is an emc_halt_rx that hides rx_active=3Dfalse, =
so one
> could argue it's not an issue. Looking at ftgmac100, it mostly just calls
> the qemu_flush_queued_packets inline where it needs it.  So given the pri=
or
> art, I'm more inclined to leave this as a two-line pair, versus collapsin=
g
> it into a method.  Mostly because I don't anticipate this call being made
> from any other places, so it's not a "growing" device.  The method
> originally was emc_try_receive_next_packet, which didn't do anything more
> than a no-op check and the queue_flush.  The new method would move the
> rx_active setting from the call that deliberately controls it (the regist=
er
> change) into a subordinate method...
>
> Beyond all that, I think it's fine either way.  Feel free to push back an=
d
> I'll make the change.
>

I figured why not :) And just made the change and sent out a v2.

>
>> >  static uint64_t npcm7xx_emc_read(void *opaque, hwaddr offset, unsigne=
d
>> size)
>> >  {
>> >      NPCM7xxEMCState *emc =3D opaque;
>> > @@ -704,6 +697,7 @@ static void npcm7xx_emc_write(void *opaque, hwaddr
>> offset,
>> >          }
>> >          if (value & REG_MCMDR_RXON) {
>> >              emc->rx_active =3D true;
>> > +            qemu_flush_queued_packets(qemu_get_queue(emc->nic));
>> >          } else {
>> >              emc_halt_rx(emc, 0);
>> >          }
>> > @@ -740,7 +734,7 @@ static void npcm7xx_emc_write(void *opaque, hwaddr
>> offset,
>> >      case REG_RSDR:
>> >          if (emc->regs[REG_MCMDR] & REG_MCMDR_RXON) {
>> >              emc->rx_active =3D true;
>> > -            emc_try_receive_next_packet(emc);
>> > +            qemu_flush_queued_packets(qemu_get_queue(emc->nic));
>> >          }
>> >          break;
>> >      case REG_MIIDA:
>> >
>>
>>

--0000000000002cc31005d2452e6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 3, 2021 at 1:54 PM Patric=
k Venture &lt;<a href=3D"mailto:venture@google.com">venture@google.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 3, 2021 at 1:42 PM Philippe Ma=
thieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f=
4bug@amsat.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On 12/3/21 22:27, Patrick Venture wrote:<br>
&gt; The rx_active boolean change to true should always trigger a try_read<=
br>
&gt; call that flushes the queue.<br>
&gt; <br>
&gt; Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.co=
m" target=3D"_blank">venture@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/net/npcm7xx_emc.c | 10 ++--------<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 8 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c<br>
&gt; index 7c892f820f..97522e6388 100644<br>
&gt; --- a/hw/net/npcm7xx_emc.c<br>
&gt; +++ b/hw/net/npcm7xx_emc.c<br>
&gt; @@ -581,13 +581,6 @@ static ssize_t emc_receive(NetClientState *nc, co=
nst uint8_t *buf, size_t len1)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return len;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static void emc_try_receive_next_packet(NPCM7xxEMCState *emc)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 if (emc_can_receive(qemu_get_queue(emc-&gt;nic))) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_flush_queued_packets(qemu_get_queue(=
emc-&gt;nic));<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -}<br>
<br>
What about modifying as emc_flush_rx() or emc_receive_and_flush()<br>
helper instead?<br>
<br>
=C2=A0static void emc_flush_rx(NPCM7xxEMCState *emc)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0emc-&gt;rx_active =3D true;<br>
=C2=A0 =C2=A0 =C2=A0qemu_flush_queued_packets(qemu_get_queue(emc-&gt;nic));=
<br>
=C2=A0}<br></blockquote><div><br></div><div>I&#39;m ok with that idea, alth=
ough I&#39;m less fond that it _hides_ the rx_active=3Dtrue.=C2=A0 There is=
 an emc_halt_rx that hides rx_active=3Dfalse, so one could argue it&#39;s n=
ot an issue. Looking at ftgmac100, it mostly just calls the qemu_flush_queu=
ed_packets inline where it needs it.=C2=A0 So given the prior art, I&#39;m =
more inclined to leave this as a two-line pair, versus collapsing it into a=
 method.=C2=A0 Mostly because I don&#39;t anticipate this call being made f=
rom any other places, so it&#39;s not a &quot;growing&quot; device.=C2=A0 T=
he method originally was emc_try_receive_next_packet, which didn&#39;t do a=
nything more than a no-op check and the queue_flush.=C2=A0 The new method w=
ould move the rx_active setting from the call that deliberately controls it=
 (the register change) into a subordinate method...</div><div><br></div><di=
v>Beyond all that, I think it&#39;s fine either way.=C2=A0 Feel free to pus=
h back and I&#39;ll make the change.</div></div></div></blockquote><div><br=
></div><div>I figured why not :) And just made the change and sent out a v2=
.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
&gt;=C2=A0 static uint64_t npcm7xx_emc_read(void *opaque, hwaddr offset, un=
signed size)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 NPCM7xxEMCState *emc =3D opaque;<br>
&gt; @@ -704,6 +697,7 @@ static void npcm7xx_emc_write(void *opaque, hwaddr=
 offset,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &amp; REG_MCMDR_RXON) {<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 emc-&gt;rx_active =3D =
true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_flush_queued_packets(q=
emu_get_queue(emc-&gt;nic));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 emc_halt_rx(emc, 0);<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -740,7 +734,7 @@ static void npcm7xx_emc_write(void *opaque, hwaddr=
 offset,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case REG_RSDR:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (emc-&gt;regs[REG_MCMDR] &amp; RE=
G_MCMDR_RXON) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 emc-&gt;rx_active =3D =
true;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 emc_try_receive_next_packet=
(emc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_flush_queued_packets(q=
emu_get_queue(emc-&gt;nic));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case REG_MIIDA:<br>
&gt; <br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--0000000000002cc31005d2452e6e--

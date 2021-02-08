Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1453792lfc;
        Mon, 8 Feb 2021 11:56:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdvAw4nsElOsIwEGQ26nge/LcNv64Tri77uGaF2tn2BJowS0p7rgUO8xuBZmLDa8gTeNoP
X-Received: by 2002:a25:e654:: with SMTP id d81mr11250777ybh.207.1612814212563;
        Mon, 08 Feb 2021 11:56:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612814212; cv=none;
        d=google.com; s=arc-20160816;
        b=yNeteilBqSWGFTgdfT4eoTufmpvaG+vkwCd+qZzUC3OUgTtlJj9I4VqOTr05OHdzXH
         VWBkhosTzK7yUYeUawvoEMrDNgEiu5PlxWs1zf2aIo6C7KfN8EMJ2fMI+cXzfi3LZPMl
         j3O3w2cSdlF3ovVhpxNdJjySBTTmtZQM0lImohmdrAlp0ws8tjAzDdgnToyn/3zIiqam
         w+pTp7IsyJoGWBPbdUdGysLWe9J2+gfgiwxOdcZkDPi9uZedksiGK+Fa8sYKuqaBAfF1
         0G5nyIIgNYS5DeICVj+ZydGcRM6BElGCC3kJMehvUqsQ1EAJgS6YlE1DiItLCrApgg02
         pryA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w7voTdSrdIvUZbkDbt8ve6u7eVgmZyr3khG4QbJpEGo=;
        b=vxeWkT86O3FEXOXl1zMLcAY3ENERmXkueetygDSidpa/Aw1W4wyGN9q1uMxBn/9mDv
         Pt7aMeRGmbEuMYWuQ+tzNhZW3Hf9UOR3+KbO4olUoCHkAS7kCGpgWbQHI2TJZk7u5HN1
         HWxzYqUpjly5QSDIPOk8AnBpZmlWxk3+rWTaBJrO1zkG4Myih8htTfwUyNlmRSnNgLX+
         vv8k7+rg75WDD3PdVD8Ts3cEDrJ3LP77rVkD9kVYncDEvh7vzxP2005QuI04WTyRIioZ
         AqoDtJt1W4Yk6UGE2WzR0HtZUyJWX9dBbxUYoeg93YXDc9ae4UGi0dfZz/GdAiDTZfts
         t/pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=b0Iooh59;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13si17869554ybt.404.2021.02.08.11.56.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Feb 2021 11:56:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=b0Iooh59;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9CeR-00020v-T6
	for alex.bennee@linaro.org; Mon, 08 Feb 2021 14:56:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l98Ie-0006Ks-TY; Mon, 08 Feb 2021 10:18:06 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:45217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l98IZ-00009h-59; Mon, 08 Feb 2021 10:18:04 -0500
Received: by mail-ed1-x52e.google.com with SMTP id t5so18519839eds.12;
 Mon, 08 Feb 2021 07:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w7voTdSrdIvUZbkDbt8ve6u7eVgmZyr3khG4QbJpEGo=;
 b=b0Iooh595bziyS8Ro2/egRtiB2gudwhJlpS2xDv6w6w3R9pzuPUVZmLRTUaGk40tn5
 fLQye+AaemQ5vKTgQg39etzvrq703HD06XeebtyMXhstqdp8NpdvhNifwkPpnyFchLUl
 Asbp+6yl9Me9YZyRjulDEcKU9ZuVh2ycv4AJh4PtQNgwyFxBByUCOJh2bMu9qk9fcFuh
 F93qoGufljkqEtV4ZO3feEqNIOHAAeUZs8scrfp+dV7pSsgTDNEogKCCV8DgCdbZL9pN
 xGsTwo3IewlYtXvgteCN84PgajjV1IQcKZuSXqbrL/UxdUJ0Apljc+98j52CUIH0Tki1
 0Q1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w7voTdSrdIvUZbkDbt8ve6u7eVgmZyr3khG4QbJpEGo=;
 b=IaQLXwef8lvNAoDYRvVN0xI9UZO8tjDnfZnEdJTzgS0LrfigDruvitKFZLv+v+SeY6
 HB4cUM316sN6MWVVzfJzY1v4OUY0kDJJdg4dsZKbwO3y6TezEHoD1YAf5N/PaEx2XcYa
 YXHhf/fqIv00d05p+G4QJ4BN59NWkHEbxdW85Sx+V9oh8V2c/YsRTrITJBsxXgfV8GXT
 lPvG8GcSYDjMtP56CSRIlV+HgGLh2MM/XlTzH6t354x9FJYchbLVO8kKblEaFiuVlS0G
 BKUZNQCC5/GFnMPedn70U6MLnk2oLrNC8vk+VkDIJUf1tONDiDu5aArR4QyVa9IFWmFk
 Ou4g==
X-Gm-Message-State: AOAM533u2nUvwmWG2KXmXKuCpAj27Ub7vnJpRNRrdy+ESiPTtkFqaOc/
 6jKuWLOCTjBf/lMlWRWXrHJSyjQekwJbDA+c8Kk=
X-Received: by 2002:aa7:cb8f:: with SMTP id r15mr17787819edt.130.1612797477438; 
 Mon, 08 Feb 2021 07:17:57 -0800 (PST)
MIME-Version: 1.0
References: <1612761924-68000-1-git-send-email-bmeng.cn@gmail.com>
 <1612761924-68000-3-git-send-email-bmeng.cn@gmail.com>
 <20210208124425.GI477672@toto>
 <CAEUhbmV=QLCuk5_bymrVNPO_vEU=R1A3urAaqhnNAgSGpiTsGw@mail.gmail.com>
 <CAJy5ezooJ21SAFhR2Pf=1aAwBkPEUivbCawZy-geCx+g36EP2Q@mail.gmail.com>
 <CAEUhbmVZr0pAW86kYjiXryN3cOaPc2LmrH9=fqLQUUdJrKX4Cw@mail.gmail.com>
In-Reply-To: <CAEUhbmVZr0pAW86kYjiXryN3cOaPc2LmrH9=fqLQUUdJrKX4Cw@mail.gmail.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Mon, 8 Feb 2021 16:17:46 +0100
Message-ID: <CAJy5ezqPC365CAjzMmAfSyKw9uL+ur48bD4=WmMQWHA+_fCE=A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/ssi: xilinx_spips: Implement basic QSPI DMA
 support
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000bcca0c05bad4ac01"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9UBfAo61Fr3G

--000000000000bcca0c05bad4ac01
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 8, 2021 at 3:45 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> Hi Edgar,
>
> On Mon, Feb 8, 2021 at 10:34 PM Edgar E. Iglesias
> <edgar.iglesias@gmail.com> wrote:
> >
> >
> >
> > On Mon, 8 Feb 2021, 15:10 Bin Meng, <bmeng.cn@gmail.com> wrote:
> >>
> >> Hi Edgar,
> >>
> >> On Mon, Feb 8, 2021 at 8:44 PM Edgar E. Iglesias
> >> <edgar.iglesias@gmail.com> wrote:
> >> >
> >> > On Mon, Feb 08, 2021 at 01:25:24PM +0800, Bin Meng wrote:
> >> > > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >> > >
> >> > > ZynqMP QSPI supports SPI transfer using DMA mode, but currently this
> >> > > is unimplemented. When QSPI is programmed to use DMA mode, QEMU will
> >> > > crash. This is observed when testing VxWorks 7.
> >> > >
> >> > > Add a basic implementation of QSPI DMA functionality.
> >> > >
> >> > > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >> >
> >> > + Francisco
> >> >
> >> > Hi,
> >> >
> >> > Like Peter commented on the previous version, the DMA unit is actully
> separate.
> >>
> >> Is it really separate? In the Xilinx ZynqMP datasheet, it's an
> >> integrated DMA unit dedicated for QSPI usage. IIUC, other modules on
> >> the ZynqMP SoC cannot use it to do any DMA transfer. To me this is no
> >> different like a DMA engine in a ethernet controller.
> >
> >
> > Yes, it's a separate module.
> >
> >>
> >> > This module is better modelled by pushing data through the Stream
> framework
> >> > into the DMA. The DMA model is not upstream but can be found here:
> >> > https://github.com/Xilinx/qemu/blob/master/hw/dma/csu_stream_dma.c
> >> >
> >>
> >> What's the benefit of modeling it using the stream framework?
> >
> >
> >
> > Because it matches real hw and this particular dma exists in various
> instances, not only in qspi. We don't want duplicate implementations of the
> same dma.
> >
>
> Would you please share more details, like what other peripherals are
> using this same DMA model?
>
>
It's used by the Crypto blocks (SHA, AES) and by the bitstream programming
blocks on the ZynqMP.
In Versal there's the same plus some additional uses of this DMA...

Best regards,
Edgar

--000000000000bcca0c05bad4ac01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 8, 2021 at 3:45 PM Bin Me=
ng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Edgar,<br=
>
<br>
On Mon, Feb 8, 2021 at 10:34 PM Edgar E. Iglesias<br>
&lt;<a href=3D"mailto:edgar.iglesias@gmail.com" target=3D"_blank">edgar.igl=
esias@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Mon, 8 Feb 2021, 15:10 Bin Meng, &lt;<a href=3D"mailto:bmeng.cn@gma=
il.com" target=3D"_blank">bmeng.cn@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi Edgar,<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Feb 8, 2021 at 8:44 PM Edgar E. Iglesias<br>
&gt;&gt; &lt;<a href=3D"mailto:edgar.iglesias@gmail.com" target=3D"_blank">=
edgar.iglesias@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Mon, Feb 08, 2021 at 01:25:24PM +0800, Bin Meng wrote:<br>
&gt;&gt; &gt; &gt; From: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@wi=
ndriver.com" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; ZynqMP QSPI supports SPI transfer using DMA mode, but cu=
rrently this<br>
&gt;&gt; &gt; &gt; is unimplemented. When QSPI is programmed to use DMA mod=
e, QEMU will<br>
&gt;&gt; &gt; &gt; crash. This is observed when testing VxWorks 7.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Add a basic implementation of QSPI DMA functionality.<br=
>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Signed-off-by: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou=
.cheng@windriver.com" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<=
br>
&gt;&gt; &gt; &gt; Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@w=
indriver.com" target=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; + Francisco<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Like Peter commented on the previous version, the DMA unit is=
 actully separate.<br>
&gt;&gt;<br>
&gt;&gt; Is it really separate? In the Xilinx ZynqMP datasheet, it&#39;s an=
<br>
&gt;&gt; integrated DMA unit dedicated for QSPI usage. IIUC, other modules =
on<br>
&gt;&gt; the ZynqMP SoC cannot use it to do any DMA transfer. To me this is=
 no<br>
&gt;&gt; different like a DMA engine in a ethernet controller.<br>
&gt;<br>
&gt;<br>
&gt; Yes, it&#39;s a separate module.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; This module is better modelled by pushing data through the St=
ream framework<br>
&gt;&gt; &gt; into the DMA. The DMA model is not upstream but can be found =
here:<br>
&gt;&gt; &gt; <a href=3D"https://github.com/Xilinx/qemu/blob/master/hw/dma/=
csu_stream_dma.c" rel=3D"noreferrer" target=3D"_blank">https://github.com/X=
ilinx/qemu/blob/master/hw/dma/csu_stream_dma.c</a><br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; What&#39;s the benefit of modeling it using the stream framework?<=
br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Because it matches real hw and this particular dma exists in various i=
nstances, not only in qspi. We don&#39;t want duplicate implementations of =
the same dma.<br>
&gt;<br>
<br>
Would you please share more details, like what other peripherals are<br>
using this same DMA model?<br>
<br></blockquote></div><div class=3D"gmail_quote"><br></div><div class=3D"g=
mail_quote">It&#39;s used by the Crypto blocks (SHA, AES) and by the bitstr=
eam programming blocks on the ZynqMP.</div><div class=3D"gmail_quote">In Ve=
rsal there&#39;s the same plus some additional uses of this DMA...</div><di=
v class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Best regards,<=
/div><div class=3D"gmail_quote">Edgar<br></div><div class=3D"gmail_quote"><=
br></div></div>

--000000000000bcca0c05bad4ac01--

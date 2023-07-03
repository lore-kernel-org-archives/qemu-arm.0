Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2074817ejy;
        Sun, 2 Jul 2023 22:41:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7REQRZPeN2QpjmTVFLP+JhK3JABEjjuZ9w6pcKTDjrwq9ONBuCQFCHC/XLDiTxL3UoLD+N
X-Received: by 2002:a05:620a:4456:b0:75b:23a1:35f9 with SMTP id w22-20020a05620a445600b0075b23a135f9mr15045853qkp.10.1688362865192;
        Sun, 02 Jul 2023 22:41:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688362865; cv=none;
        d=google.com; s=arc-20160816;
        b=lJyuvgnFoGr7vRnU87fnuQjuQz1k6fp72QsJWye8SthRbrUc17vC1sdAwZMLUBq5R3
         998YMXfcncui20yOP5p5SHQAQEJoVUckexVyNj4mujyCUPsCOe0g+qrjBA6jDqWjm4/6
         yafYIdui7tZlm597mSMouk5q6DW5l3EAk3ECrN7VrcZMya6O3dnW+TINTLyH6Pi8KLsM
         lX0HegOQASq5btsByrmxjaVYE60xnDH71urrxoHp/QfrRUJnsDBlWga6sTo+zC+o9HvB
         enhs2jZ3qnNvKQGl6uENIyVAMYAPHidp5MUEw+8ei7uU/ae8bwXvIu2CdXOwVcxrhq+U
         I96Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t98XxY/RzSdDeAir8vtH+CEe9x+aVmxEV/vx1UdEPnM=;
        fh=nlvs0DNuaumhRSTpzOJfqYeZdKSzkZJr/D9gNRTQd+M=;
        b=DHr1ZoHHYv55Kfv1+iYtHbPUm+TcksEA84vh6AC8vWx0XEgczmBQ1tNYRVOpEu1R3/
         BxlvRRPiMI/Rs2Fpvq887M2BiqOUxaVvikYWWPE6mAghFDRlzKt8QiTYQbtDxUm009Yu
         0BEIlim0JBSaVMjbX9QfMLQMsg/xzFGWR4173YVPnQlSda29frnap2GdKeH2EIqX/5Pk
         978BTxIEsVOOWvQVfGOyOSSsl0AhBD9cKtTkg8Y8OtwK72TY8uwnXr9E3yJgCjvXoDwb
         lkhsJMecY64eocZjvZBKWRa5YS21jIrlWL0RQispoxCWmp30lYD+92PvEXwMKhnlhWct
         kXLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=ENIAGb3X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v23-20020a05620a0a9700b007514d3d0aa3si7985866qkg.419.2023.07.02.22.41.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Jul 2023 22:41:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=ENIAGb3X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGCIl-0003Y0-9V; Mon, 03 Jul 2023 01:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patilabhijit180@gmail.com>)
 id 1qGCIg-0003XV-EE
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 01:40:38 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <patilabhijit180@gmail.com>)
 id 1qGCIc-0001k9-JH
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 01:40:37 -0400
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-bfee66a5db6so3546041276.0
 for <qemu-arm@nongnu.org>; Sun, 02 Jul 2023 22:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688362833; x=1690954833;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t98XxY/RzSdDeAir8vtH+CEe9x+aVmxEV/vx1UdEPnM=;
 b=ENIAGb3XPlytPlWHuh0trdNSfotfmoiG2wizZCQ8ocqhTKpzhb6L+bFcLYEPZHBCbN
 vjmVhJJQMOB7RpGzd5mRnIj46jrNPbXRRy/fk7X8Nua013U8nroV2lhkn3/IkE8Ai+Gp
 J2af55UNeCvkGDvnf6Ha4tfKxCTV3ieKDJwmCf9OK+9Q4N50f8sbC9KUzh+35LDJ3cNq
 QFf72hTOu/lJhHQoHIx2Zz0LgDyP6rUI5Zi7h7cdsUcJSEIeldZ9rykbqQJkLlHyzs7G
 PAQewRqlbZNenPJ+fnqJO+YF4/wGGMDRxIdbkQ+aLcf6B0feKsud7Eby6xnZF1/X00Sp
 9t4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688362833; x=1690954833;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t98XxY/RzSdDeAir8vtH+CEe9x+aVmxEV/vx1UdEPnM=;
 b=O5IlRUkCiMnKwAoOw6srapSNlQZf1gwbuH5VlAC4lPWkRflOqqRQj0V7/ix4POfxDS
 J5EDun1Nz4XnwKx4t7QVxj1lACoUwCIhkzElnMGCyBBKxFa5dXIbbPiFTpkjGoUVSuhK
 Z7BgnoyXx69XbBkJZ5g32gX2GTYatdu4vYDZd+CoIG6bFarkftCaJ6nzWjsoUNx8e/Ka
 cZPE/8cUQCUkD+4/plfax26AuWKID9JCX1wf1y5Jw1ZrdJfwaq1RF2y5LsB31PrNRVV8
 A7A+2HHDFXaCPg8Lgbbd9icKXQtaTkR4qFkUrVEos4SObTbvX7kmZqYE+qEg60QYHjf/
 lVkw==
X-Gm-Message-State: ABy/qLb6TvQ27nhujijpKZ5Rp1WUGxmaKdBgHtiAae5bMiEBSaqSoctp
 bJ3ZsvjOw1rqkzwOa6tyPmjapX0+q/qi+TaA6ow=
X-Received: by 2002:a25:26c4:0:b0:c40:f090:98bf with SMTP id
 m187-20020a2526c4000000b00c40f09098bfmr8405997ybm.28.1688362833006; Sun, 02
 Jul 2023 22:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ-ErDDkWPE6QFF5Qvq2OQ55aaMoRPKXT9a-+1Ma79XVkw_c6A@mail.gmail.com>
 <CAFEAcA9vjp3o08F+aLB9DPga0tQgmHhaweZADB_wrniZ38GrBQ@mail.gmail.com>
 <CAJ-ErDCb_bvCg-RYYnsawxhM47wSnAj3qFeP4hKB9AdjDDswKA@mail.gmail.com>
 <CAJ-ErDBJi_0SeeOBjjNbyEE5BiYjcgEBA4tx7uULgOB1=FfUEw@mail.gmail.com>
 <CAFEAcA-Ww0qDs63mbBbVGbGFD_iWmfV0WPMz6tLq=7jmew+UTg@mail.gmail.com>
 <CAJ-ErDAF0n9UoSSXHDz36VFzntidjKYyAzOCtXnL2CqPDS9OiQ@mail.gmail.com>
 <CAJ-ErDCzaF0MCExzMketiQzjEsKP80NYyo0JSFqVhwjJP4N0Yg@mail.gmail.com>
 <CAJ-ErDCh_h3wsxpDZenLAwuNpuGUtrP-oWCow-NyBSjizZFUhQ@mail.gmail.com>
In-Reply-To: <CAJ-ErDCh_h3wsxpDZenLAwuNpuGUtrP-oWCow-NyBSjizZFUhQ@mail.gmail.com>
From: abhijit patil <patilabhijit180@gmail.com>
Date: Mon, 3 Jul 2023 11:10:22 +0530
Message-ID: <CAJ-ErDDn_jqo0hNfcOZweZhsQZQULxirNh7RR9KAPtzDqtVWgw@mail.gmail.com>
Subject: Re: Regarding hello world program for ARM M7 (s32k312) using qemu
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000e9d53605ff8e9a1a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=patilabhijit180@gmail.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wxNgzxyK5Vy3

--000000000000e9d53605ff8e9a1a
Content-Type: text/plain; charset="UTF-8"

Hi can you please help on urgent basis

On Sun, Jul 2, 2023, 8:07 PM abhijit patil <patilabhijit180@gmail.com>
wrote:

> Need a startup.s file ...mail. c file and linker file with commands also
> to run hello world program for mps2-an500 on qemu....need these files as
> its really imp for work ...request you to share if you have please
> today....I badly needed it today please help
>
> On Sun, Jul 2, 2023, 7:43 PM abhijit patil <patilabhijit180@gmail.com>
> wrote:
>
>> Need a startup.s file ...mail. c file and linker file with commands also
>> to run hello world program for mps2-an500 on qemu....need these files as
>> its really imp for work ...request you to share if you have please
>> today...thanks in advance
>>
>> On Tue, Jun 27, 2023, 8:44 PM abhijit patil <patilabhijit180@gmail.com>
>> wrote:
>>
>>> Awesome, thanks for the info!
>>>
>>> On Tue, Jun 27, 2023, 8:02 PM Peter Maydell <peter.maydell@linaro.org>
>>> wrote:
>>>
>>>> On Tue, 27 Jun 2023 at 15:09, abhijit patil <patilabhijit180@gmail.com>
>>>> wrote:
>>>> >
>>>> > Does it have for ARM M7 any board?...I read somewhere that if you
>>>> have latest version 5 for qemu then it supports the ARM M7 machine...is it
>>>> right?...and if yes where can we download the same and the programs and
>>>> other things for ARM M7 using qemu
>>>>
>>>> Yes, QEMU supports the Cortex-M7; the machine using it is the
>>>> mps2-an500 (which is a model of an FPGA image for an Arm
>>>> development board).
>>>>
>>>> We (ie the upstream QEMU community) provide QEMU in source
>>>> code form. You can find more information about compiling it
>>>> here: https://www.qemu.org/download/
>>>> Or if you're running a Linux distro it's probably more
>>>> convenient to use the distro-packaged QEMU.
>>>>
>>>> Generally we do not try to provide support for how to build
>>>> and run guest binaries -- there are too many possible
>>>> development environments and target boards and so on for
>>>> that. We provide the emulated hardware, you have to bring
>>>> the software :-)
>>>>
>>>> thanks
>>>> -- PMM
>>>>
>>>

--000000000000e9d53605ff8e9a1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi can you please help on urgent=C2=A0basis</div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jul 2,=
 2023, 8:07 PM abhijit patil &lt;<a href=3D"mailto:patilabhijit180@gmail.co=
m">patilabhijit180@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div dir=3D"auto"><span style=3D"font-size:12.8px">Need a startup.=
s file ...mail. c file and linker file with commands also to run hello worl=
d program for mps2-an500 on qemu....need these files as its really imp for =
work ...request you to share if you have please today....I badly needed it =
today please help</span></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sun, Jul 2, 2023, 7:43 PM abhijit patil &lt;<a h=
ref=3D"mailto:patilabhijit180@gmail.com" target=3D"_blank" rel=3D"noreferre=
r">patilabhijit180@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div dir=3D"auto">Need a startup.s file ...mail. c file and linker=
 file with commands also to run hello world program for mps2-an500 on qemu.=
...need these files as its really imp for work ...request you to share if y=
ou have please today...thanks in advance=C2=A0</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 27, 2023, 8:44 PM=
 abhijit patil &lt;<a href=3D"mailto:patilabhijit180@gmail.com" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">patilabhijit180@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto">Awesome, thank=
s for the info!=C2=A0</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Jun 27, 2023, 8:02 PM Peter Maydell &lt;<a hre=
f=3D"mailto:peter.maydell@linaro.org" rel=3D"noreferrer noreferrer noreferr=
er" target=3D"_blank">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">On Tue, 27 Jun 2023 at 15:09, abhijit patil &lt;=
<a href=3D"mailto:patilabhijit180@gmail.com" rel=3D"noreferrer noreferrer n=
oreferrer noreferrer" target=3D"_blank">patilabhijit180@gmail.com</a>&gt; w=
rote:<br>
&gt;<br>
&gt; Does it have for ARM M7 any board?...I read somewhere that if you have=
 latest version 5 for qemu then it supports the ARM M7 machine...is it righ=
t?...and if yes where can we download the same and the programs and other t=
hings for ARM M7 using qemu<br>
<br>
Yes, QEMU supports the Cortex-M7; the machine using it is the<br>
mps2-an500 (which is a model of an FPGA image for an Arm<br>
development board).<br>
<br>
We (ie the upstream QEMU community) provide QEMU in source<br>
code form. You can find more information about compiling it<br>
here: <a href=3D"https://www.qemu.org/download/" rel=3D"noreferrer noreferr=
er noreferrer noreferrer noreferrer" target=3D"_blank">https://www.qemu.org=
/download/</a><br>
Or if you&#39;re running a Linux distro it&#39;s probably more<br>
convenient to use the distro-packaged QEMU.<br>
<br>
Generally we do not try to provide support for how to build<br>
and run guest binaries -- there are too many possible<br>
development environments and target boards and so on for<br>
that. We provide the emulated hardware, you have to bring<br>
the software :-)<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>
</blockquote></div>
</blockquote></div>
</blockquote></div>

--000000000000e9d53605ff8e9a1a--

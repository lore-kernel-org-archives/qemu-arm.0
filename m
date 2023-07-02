Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp1799502ejy;
        Sun, 2 Jul 2023 07:37:35 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFSs25jjHExc4OZwuF5wyipVbPR9cxiUPQpiVZfDz4Nk/OSqXB7XB/UtQTPD0gVHqG5YpJO
X-Received: by 2002:a05:6214:e8f:b0:635:f6a6:b64 with SMTP id hf15-20020a0562140e8f00b00635f6a60b64mr11097721qvb.9.1688308654927;
        Sun, 02 Jul 2023 07:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688308654; cv=none;
        d=google.com; s=arc-20160816;
        b=hLoV4wW7MxCzAhlg0rxiv7Q6O6tAWs2UBwZ967wkXeUHO0Cr71+oTNgvOoj3YcmV6Q
         CW05Z32XPpWnXIyO1A234hLeF1BRIytBVQjX/oZ4+JrE7r1487GscEFo9znpHe3XE64K
         QoyvVqIatHM4WkyaXQ+G4ffEObc3eLLhoupbfHJ8T0yOgWAFGGoJaCS2SAOO8cKs4ccY
         hTLEkwU9rtLJ/HK/p+T2kgR9qBEoOVmjpqDOP/Ij/+yhhBf2siRATFVb+JrIixPO4kHK
         FCwfqyCfKjWalXwSuCk0IkoJB9qc91z+vucS5p8OO1z6bo93CS15452+CIZEPpt3sHoa
         NU0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pJL5b+B0FXlMnWyL2DmkKSjDm6efveA01QPFQ78nnr0=;
        fh=nlvs0DNuaumhRSTpzOJfqYeZdKSzkZJr/D9gNRTQd+M=;
        b=SnOMA7zGY2HKU2dGEbY115H/dQDPXJlpEKmQ9pf5NKThqxgcbMzr5qWwqYUdv1oz1Z
         Y4fT5eNpkHi/SLZCEOF1T7fH0N7Un/K4kitM70p6iijMQ8zfJwNazaNi57cm5tbe2CBM
         eXjX+EO5pi9CbwwsZ9r6SC/7g8GfEYymsSxLnf2rMhwRMEotq/Is9zeKePWoSAiH3vAM
         2c1ftoTtiX+Dxj0086lIa+BziJavgeUXG4mkGE8TsDDl2tgylLZSFsVPDvo9TNjyJtww
         wBd4tPQ97dDN4/B6vDaWMh/rXuLwONc7wYvBxJA+AbWjjK1ClpLA/H6MzLRuUvaXQyMG
         3AwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=gI7jbOmT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10-20020a0562140daa00b00636d76c80f7si296185qvh.106.2023.07.02.07.37.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Jul 2023 07:37:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=gI7jbOmT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qFyCX-0008Kx-FP; Sun, 02 Jul 2023 10:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patilabhijit180@gmail.com>)
 id 1qFyCW-0008Kp-Ph
 for qemu-arm@nongnu.org; Sun, 02 Jul 2023 10:37:20 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <patilabhijit180@gmail.com>)
 id 1qFyCV-0004DZ-19
 for qemu-arm@nongnu.org; Sun, 02 Jul 2023 10:37:20 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-bd0a359ca35so3230655276.3
 for <qemu-arm@nongnu.org>; Sun, 02 Jul 2023 07:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688308637; x=1690900637;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pJL5b+B0FXlMnWyL2DmkKSjDm6efveA01QPFQ78nnr0=;
 b=gI7jbOmTXZgDLmpHqZIbuXa1NNmuyBKv0kAmP86CDsbETAN2nnOU+jrj410qLtmFs/
 3Q3p9jnRBobjESwfNDUAYCFQtn4tLc9L9QXgbio+N+BzeZcUZswjlniyAYDAT3yaFqCG
 kdSmh4vAGA1VkXLexxgt2kcy98Fi/PJpZW2ze34U+YU3ERefW0z27gOUJ21AbLcVar3r
 EEovOPi970zIXyaUH9dWDkEtu0egqSR3m2Dw6h6fmAc8+7qJTm6YnQCnhT7BZtjXoHqn
 UK7xgR2WdoVYcjl5wYjYQ6uIHTHogg3z1a28thFGQL7tuuPrrpSp6Ll10Cgf/F1cqapE
 teTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688308637; x=1690900637;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pJL5b+B0FXlMnWyL2DmkKSjDm6efveA01QPFQ78nnr0=;
 b=NvwwaPJCdPYXs73gv+jaqsBv+214D7dQsJeB0KZw7Np4nwVmd+w59Z6m3GdmmaR2q2
 WweeHueHPrbtW3sfSODzxv42AZjgqOv1PDNecLWI+N1GbemxqWpP7NDY5z5nrgDpb844
 2pkvVV0nIjePJl2v85cojEh5nu4/W8pEAab/raFEm6PQ7U0UmPqfelNC0YYNHil2ULuI
 +NORLc/0vXk0kf8HohpgB3WN82wqzmYpZaBD58RfUNIIFLUn13H1dv2GGlMf2yVC15iM
 JtiCZDC0Kd2zCG/E3u9WUcH39R4Cx2K1SJjLTEhJYHRm9YdIhkKsXSTQ+nU5FBf1Fs3D
 jeQA==
X-Gm-Message-State: ABy/qLZ9j1XxLol6T5MsGBHj5QI0nrGySFHCoT9/YkNuaLn5d4zunZX1
 +216oDX0YTeIbdOd7gCXxSNs8CCp/aEQC64pDoU=
X-Received: by 2002:a25:ae10:0:b0:bce:782:d617 with SMTP id
 a16-20020a25ae10000000b00bce0782d617mr7401404ybj.56.1688308637148; Sun, 02
 Jul 2023 07:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ-ErDDkWPE6QFF5Qvq2OQ55aaMoRPKXT9a-+1Ma79XVkw_c6A@mail.gmail.com>
 <CAFEAcA9vjp3o08F+aLB9DPga0tQgmHhaweZADB_wrniZ38GrBQ@mail.gmail.com>
 <CAJ-ErDCb_bvCg-RYYnsawxhM47wSnAj3qFeP4hKB9AdjDDswKA@mail.gmail.com>
 <CAJ-ErDBJi_0SeeOBjjNbyEE5BiYjcgEBA4tx7uULgOB1=FfUEw@mail.gmail.com>
 <CAFEAcA-Ww0qDs63mbBbVGbGFD_iWmfV0WPMz6tLq=7jmew+UTg@mail.gmail.com>
 <CAJ-ErDAF0n9UoSSXHDz36VFzntidjKYyAzOCtXnL2CqPDS9OiQ@mail.gmail.com>
 <CAJ-ErDCzaF0MCExzMketiQzjEsKP80NYyo0JSFqVhwjJP4N0Yg@mail.gmail.com>
In-Reply-To: <CAJ-ErDCzaF0MCExzMketiQzjEsKP80NYyo0JSFqVhwjJP4N0Yg@mail.gmail.com>
From: abhijit patil <patilabhijit180@gmail.com>
Date: Sun, 2 Jul 2023 20:07:05 +0530
Message-ID: <CAJ-ErDCh_h3wsxpDZenLAwuNpuGUtrP-oWCow-NyBSjizZFUhQ@mail.gmail.com>
Subject: Re: Regarding hello world program for ARM M7 (s32k312) using qemu
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000096a8ee05ff81fc69"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=patilabhijit180@gmail.com; helo=mail-yb1-xb2e.google.com
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
X-TUID: IHS82x8VJVnw

--00000000000096a8ee05ff81fc69
Content-Type: text/plain; charset="UTF-8"

Need a startup.s file ...mail. c file and linker file with commands also to
run hello world program for mps2-an500 on qemu....need these files as its
really imp for work ...request you to share if you have please today....I
badly needed it today please help

On Sun, Jul 2, 2023, 7:43 PM abhijit patil <patilabhijit180@gmail.com>
wrote:

> Need a startup.s file ...mail. c file and linker file with commands also
> to run hello world program for mps2-an500 on qemu....need these files as
> its really imp for work ...request you to share if you have please
> today...thanks in advance
>
> On Tue, Jun 27, 2023, 8:44 PM abhijit patil <patilabhijit180@gmail.com>
> wrote:
>
>> Awesome, thanks for the info!
>>
>> On Tue, Jun 27, 2023, 8:02 PM Peter Maydell <peter.maydell@linaro.org>
>> wrote:
>>
>>> On Tue, 27 Jun 2023 at 15:09, abhijit patil <patilabhijit180@gmail.com>
>>> wrote:
>>> >
>>> > Does it have for ARM M7 any board?...I read somewhere that if you have
>>> latest version 5 for qemu then it supports the ARM M7 machine...is it
>>> right?...and if yes where can we download the same and the programs and
>>> other things for ARM M7 using qemu
>>>
>>> Yes, QEMU supports the Cortex-M7; the machine using it is the
>>> mps2-an500 (which is a model of an FPGA image for an Arm
>>> development board).
>>>
>>> We (ie the upstream QEMU community) provide QEMU in source
>>> code form. You can find more information about compiling it
>>> here: https://www.qemu.org/download/
>>> Or if you're running a Linux distro it's probably more
>>> convenient to use the distro-packaged QEMU.
>>>
>>> Generally we do not try to provide support for how to build
>>> and run guest binaries -- there are too many possible
>>> development environments and target boards and so on for
>>> that. We provide the emulated hardware, you have to bring
>>> the software :-)
>>>
>>> thanks
>>> -- PMM
>>>
>>

--00000000000096a8ee05ff81fc69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><span style=3D"font-size:12.8px">Need a startup.s file ..=
.mail. c file and linker file with commands also to run hello world program=
 for mps2-an500 on qemu....need these files as its really imp for work ...r=
equest you to share if you have please today....I badly needed it today ple=
ase help</span></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Jul 2, 2023, 7:43 PM abhijit patil &lt;<a href=3D"m=
ailto:patilabhijit180@gmail.com">patilabhijit180@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto">Need a startup.s f=
ile ...mail. c file and linker file with commands also to run hello world p=
rogram for mps2-an500 on qemu....need these files as its really imp for wor=
k ...request you to share if you have please today...thanks in advance=C2=
=A0</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Tue, Jun 27, 2023, 8:44 PM abhijit patil &lt;<a href=3D"mailto:patila=
bhijit180@gmail.com" target=3D"_blank" rel=3D"noreferrer">patilabhijit180@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D=
"auto">Awesome, thanks for the info!=C2=A0</div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 27, 2023, 8:02 PM Pet=
er Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" rel=3D"noreferre=
r noreferrer" target=3D"_blank">peter.maydell@linaro.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">On Tue, 27 Jun 2023 at 15:09, abhijit =
patil &lt;<a href=3D"mailto:patilabhijit180@gmail.com" rel=3D"noreferrer no=
referrer noreferrer" target=3D"_blank">patilabhijit180@gmail.com</a>&gt; wr=
ote:<br>
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
er noreferrer noreferrer" target=3D"_blank">https://www.qemu.org/download/<=
/a><br>
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

--00000000000096a8ee05ff81fc69--

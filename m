Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp1789466ejy;
        Sun, 2 Jul 2023 07:14:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7hAWTv7tyfTky6oRfzrTdiPJdqdGMhaQ7+Aj4ewi5oxH76cpIBqilaHgePhLvIHOWyUmaq
X-Received: by 2002:ac8:5e4a:0:b0:400:8682:a918 with SMTP id i10-20020ac85e4a000000b004008682a918mr8454578qtx.21.1688307257880;
        Sun, 02 Jul 2023 07:14:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688307257; cv=none;
        d=google.com; s=arc-20160816;
        b=BkeHi6ZC3Sgj3aBR6OmQaZOE3IycWEmtN+C8iNqhp4hzC6hbPilmmTaopJFjCdjP/0
         zi26FiCrvo8AGFyei6qaJqZxJ2GCqD5HJ24AHpcBEcx0Of3qy62W41b7JLWkNcHgEmlH
         01lEyp/cd9yrNBBa2EHSpP7qCobOB6ZlJMe1DMNPTrwTYylNwitaHycBmHMy8UlmUw+I
         DMJHBNdIn+z1u8Wn85mXWCziJkVdH/+Yf1zW5rYlYt1VL7pibvZXEjL1BIt+RlDgeqBv
         PYF5TzNpu9Lv/8lRTO4ELwr44hOHBiqyukrAtt1F9DbOoZ72NsuZ1ww2ZwRTbJcSmaL6
         BpKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=muXh8kbYpWnBW0xXYDhVwHDn7TGMFuFnDu1oH4i/Smo=;
        fh=nlvs0DNuaumhRSTpzOJfqYeZdKSzkZJr/D9gNRTQd+M=;
        b=oGjR00k4QhUjQEcYsqg8e9lYkszMciVGkkwkFpqhu8SyoNiB1HXDsXdRSaCsbRVLHY
         Kya9KpdhM3WPZ3siMkAP1uhZS7n/Eq6RwrUqQ+R63SD7Za+UwAuPn07aVwq/vVspSvGZ
         DLO+PrzTGbsJLgAFEo0YBzcqrceGrbh8WW93HtV4Pj/MdeJSZjRpZz6fWfmVqAC6Ll3U
         jmU1XyyEthfnkALZZ3CBQF8Xv0E7LZOH6DT9Zbd8I1LpK5vGia5Rp6rBZGWPQNsR8Q4U
         rA3CXC+gDrEKczkuArKVRlu/6Vrjx3Bv8QhVk+4h19Npm31mjSR7Vk+8zOyjepc7OWtE
         lutg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=KpMJo337;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t4-20020a05622a180400b004033ccc39f4si4245988qtc.116.2023.07.02.07.14.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Jul 2023 07:14:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=KpMJo337;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qFxpy-0004Yr-Ew; Sun, 02 Jul 2023 10:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patilabhijit180@gmail.com>)
 id 1qFxpw-0004Yi-Bo
 for qemu-arm@nongnu.org; Sun, 02 Jul 2023 10:14:00 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <patilabhijit180@gmail.com>)
 id 1qFxpu-0008BF-K2
 for qemu-arm@nongnu.org; Sun, 02 Jul 2023 10:14:00 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-5702415be17so37809177b3.2
 for <qemu-arm@nongnu.org>; Sun, 02 Jul 2023 07:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688307237; x=1690899237;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=muXh8kbYpWnBW0xXYDhVwHDn7TGMFuFnDu1oH4i/Smo=;
 b=KpMJo337juf7KkA3UYqxa8qhr9CiGgDfS29gku+CMME8Vv/ISMwD5+3jXrkyeYGZT+
 QT1Cfvu8CRcWRk8GirEuLNAiwaiHMDEqMTA9MSrndSDEfkjJUcpLw7d4j2O3upmOMvhb
 VdPxB1vlnuWRffhP/YXPtLSa5YCOgeaIMd9/271siGZ8SD9HU8uL5p4RydtoaV5jjjo0
 7RVqr1wTWa0rheU1OUFKz2AG9qrqjkJzPgO6p3JLVldDvhH+sD2lzlOza/w7lZB1oKZH
 WdTxsyHw++qX0UP0+iCs5mpixb5v5LgdGr8XRdURPXEDHeWE9LeOG2kRNDhNdUByAhvr
 iRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688307237; x=1690899237;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=muXh8kbYpWnBW0xXYDhVwHDn7TGMFuFnDu1oH4i/Smo=;
 b=UVqq3wRrQOa62epu6HdIcoHNl8YycYDQJ9T7FScheE1EJn3OkX8TVKnHfSeHNc5FwD
 zXZoQwRap8XSMpz2yKcQEF61LgTz5x0rKrSeRFwKyb6+owU0XKdPnxnQG54YZTfoFE7S
 CyptGBeEBqE3tDhAPO4gNscRTP6YGYeKYouY44xhwvz4aMKIOSz+ToqwGYCRmA/bK963
 hswvVKCDgZUH6zAzEUxOV3LSARxqmdE58WFVynUh3rZCwuh49QJzCbbEXK0+pnbuPKyF
 63w2pc3Xy/h8eJLRx44EDngoxtSTRAuEjPBU0t69LIM0UGk8UkJ63yFdkx4JHlS9Emkn
 q8tw==
X-Gm-Message-State: ABy/qLb9WcPxSIOoBxGvB6fcdFIBoaD5W/OsbcRpoEhEcYrpWcvEV/vv
 AtajxiSWwEYP94JVZEZaCxoqS5Z16AW2HNJmPSc=
X-Received: by 2002:a25:23d0:0:b0:c4d:2610:87cc with SMTP id
 j199-20020a2523d0000000b00c4d261087ccmr2139054ybj.42.1688307236714; Sun, 02
 Jul 2023 07:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ-ErDDkWPE6QFF5Qvq2OQ55aaMoRPKXT9a-+1Ma79XVkw_c6A@mail.gmail.com>
 <CAFEAcA9vjp3o08F+aLB9DPga0tQgmHhaweZADB_wrniZ38GrBQ@mail.gmail.com>
 <CAJ-ErDCb_bvCg-RYYnsawxhM47wSnAj3qFeP4hKB9AdjDDswKA@mail.gmail.com>
 <CAJ-ErDBJi_0SeeOBjjNbyEE5BiYjcgEBA4tx7uULgOB1=FfUEw@mail.gmail.com>
 <CAFEAcA-Ww0qDs63mbBbVGbGFD_iWmfV0WPMz6tLq=7jmew+UTg@mail.gmail.com>
 <CAJ-ErDAF0n9UoSSXHDz36VFzntidjKYyAzOCtXnL2CqPDS9OiQ@mail.gmail.com>
In-Reply-To: <CAJ-ErDAF0n9UoSSXHDz36VFzntidjKYyAzOCtXnL2CqPDS9OiQ@mail.gmail.com>
From: abhijit patil <patilabhijit180@gmail.com>
Date: Sun, 2 Jul 2023 19:43:45 +0530
Message-ID: <CAJ-ErDCzaF0MCExzMketiQzjEsKP80NYyo0JSFqVhwjJP4N0Yg@mail.gmail.com>
Subject: Re: Regarding hello world program for ARM M7 (s32k312) using qemu
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000001dbd7405ff81a9b7"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=patilabhijit180@gmail.com; helo=mail-yw1-x1132.google.com
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
X-TUID: X/q5facle56c

--0000000000001dbd7405ff81a9b7
Content-Type: text/plain; charset="UTF-8"

Need a startup.s file ...mail. c file and linker file with commands also to
run hello world program for mps2-an500 on qemu....need these files as its
really imp for work ...request you to share if you have please
today...thanks in advance

On Tue, Jun 27, 2023, 8:44 PM abhijit patil <patilabhijit180@gmail.com>
wrote:

> Awesome, thanks for the info!
>
> On Tue, Jun 27, 2023, 8:02 PM Peter Maydell <peter.maydell@linaro.org>
> wrote:
>
>> On Tue, 27 Jun 2023 at 15:09, abhijit patil <patilabhijit180@gmail.com>
>> wrote:
>> >
>> > Does it have for ARM M7 any board?...I read somewhere that if you have
>> latest version 5 for qemu then it supports the ARM M7 machine...is it
>> right?...and if yes where can we download the same and the programs and
>> other things for ARM M7 using qemu
>>
>> Yes, QEMU supports the Cortex-M7; the machine using it is the
>> mps2-an500 (which is a model of an FPGA image for an Arm
>> development board).
>>
>> We (ie the upstream QEMU community) provide QEMU in source
>> code form. You can find more information about compiling it
>> here: https://www.qemu.org/download/
>> Or if you're running a Linux distro it's probably more
>> convenient to use the distro-packaged QEMU.
>>
>> Generally we do not try to provide support for how to build
>> and run guest binaries -- there are too many possible
>> development environments and target boards and so on for
>> that. We provide the emulated hardware, you have to bring
>> the software :-)
>>
>> thanks
>> -- PMM
>>
>

--0000000000001dbd7405ff81a9b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Need a startup.s file ...mail. c file and linker file wit=
h commands also to run hello world program for mps2-an500 on qemu....need t=
hese files as its really imp for work ...request you to share if you have p=
lease today...thanks in advance=C2=A0</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 27, 2023, 8:44 PM abhijit =
patil &lt;<a href=3D"mailto:patilabhijit180@gmail.com">patilabhijit180@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"au=
to">Awesome, thanks for the info!=C2=A0</div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 27, 2023, 8:02 PM Peter =
Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank" r=
el=3D"noreferrer">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On Tue, 27 Jun 2023 at 15:09, abhijit patil &lt;<a h=
ref=3D"mailto:patilabhijit180@gmail.com" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">patilabhijit180@gmail.com</a>&gt; wrote:<br>
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
er noreferrer" target=3D"_blank">https://www.qemu.org/download/</a><br>
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

--0000000000001dbd7405ff81a9b7--

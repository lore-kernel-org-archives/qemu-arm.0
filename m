Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp36229lfh;
        Tue, 17 May 2022 15:56:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywscmBAsV4Q5/+8jMxdFm+HRBAVKhr7f9PJIoq64OfjuX1B+B65GoXtLDy8Dg4rUo9tOiq
X-Received: by 2002:ac8:578e:0:b0:2f3:ba22:6e79 with SMTP id v14-20020ac8578e000000b002f3ba226e79mr21092713qta.322.1652828169946;
        Tue, 17 May 2022 15:56:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652828169; cv=none;
        d=google.com; s=arc-20160816;
        b=VKZa+KnPhhsl9W5tOMqxWsvhJkK0RY8odZMfBbv6Na/g/sC5IhWVVx8+bJo7vc+g/R
         w/WGd+/FtXugXZfxqoJ+nBtXVN6PIinE+TyJPVqiJLbV5jegqX7iwCuhrTKQnznoNt9J
         qAVhyR59SMekjSsssyOBm9/W1lpDs8G0XZniNlRrBWK7VTiLjxuGz1by7mYEfF6mguqH
         cDFeau8R62XvLvJ7keIIrkQjvQc/op4wkAwovQ3mDvC5WKDtGPBWiQUdbWBoSAaC+gJr
         jDQThFy0qWY8ETI8gw2Vu35HUJy/J2CwbxtnVv9NvWc4r4nq0bBEMoUEEvrMaYn62kEb
         ijug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bPXsbt13I877D7+WbK6rigIbMoOnsdmalo54JJXyNTA=;
        b=PrqvUqPiwN7ZzVy7N7KORSIF6F+KUlNDATc08MUbKdualVdp3ospqGXun8Jh8qRMNo
         xGLhULdk25IAw2wUHqb51wVJEjdP4zKGyR7Ue9ZH3CcRwKG4s+T/N9l5bkTXmjOOF/KD
         uepUhxPoGEXmEARoPxy5qwZaUBi54Sg7DwIqEtKPvjRciJ45UZVRctnVfGdQ6dqpp5dj
         i001w4IoQAvlSsrwvHTARQYvN6XXI6vFAIuSbUsoeXYt8knKpWrm0DS02MBH1w8ktPz3
         g6uRNAdzat9Ng7srHgtvLCO3G2PuiuruMuji6mFBQe/yZwEsCJObvggLYAtkRSAYgz0h
         2Qvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@asu-edu.20210112.gappssmtp.com header.s=20210112 header.b=mci+nHrQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=asu.edu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i20-20020a05620a145400b006a0cef66971si247136qkl.526.2022.05.17.15.56.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 May 2022 15:56:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@asu-edu.20210112.gappssmtp.com header.s=20210112 header.b=mci+nHrQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=asu.edu
Received: from localhost ([::1]:54924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nr66r-0004fC-EJ
	for alex.bennee@linaro.org; Tue, 17 May 2022 18:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgutbub@asu.edu>) id 1nr66B-0004cL-PT
 for qemu-arm@nongnu.org; Tue, 17 May 2022 18:55:28 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:37987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jgutbub@asu.edu>) id 1nr664-0003Vh-RD
 for qemu-arm@nongnu.org; Tue, 17 May 2022 18:55:22 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-e5e433d66dso509057fac.5
 for <qemu-arm@nongnu.org>; Tue, 17 May 2022 15:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=asu-edu.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bPXsbt13I877D7+WbK6rigIbMoOnsdmalo54JJXyNTA=;
 b=mci+nHrQcTQ+6TlguesgqUC0bMYpNRlcJyVKSgIz9oukc3HoHADt9gdpC8yW2/6TiY
 Qk5pfPFNJvt56tAks1oKRuyOphZZ/KMW71oZIszt5F+xV6JU9S9u4kxRx8WZtLi/6V/W
 Sia9d+VaGfvnpNLiO+RO2v7OeIa6qsO/ycgc1qPfpK88a1B60hvyOHZgOlUSkm7YzQRd
 VshTUz/Wl2xrAU1yj5uyojX27HXJtkcOPfagoNpTpX1BXOI9kimooAhkMqkqJBCfCd+r
 7M/QBz7jP9argbYrUrPRK/AMNOSTsakkCLkRvBr7aNi5ibYeG03fi0uojdlDhH6qZvn4
 15Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bPXsbt13I877D7+WbK6rigIbMoOnsdmalo54JJXyNTA=;
 b=kYhwZGrdkmZK5LuAXtYr289P8daX9wgcEzHXHbFSWZ78xDwLgEM9WV+1B3f5vH8eFi
 zbekQRjxNvDs+sGeyIppQU1Oth5EOhUoUtdvaNGSoFwHAPY80zFPzbJ5W35F0r95vVAt
 v2SRsF2rPT+3NSFGGT6TVdoZ1/nkyDKgLw0utywUALNQLubhB32wo3SK1mCWKareCS4G
 Z3kVhz7eWqjuRNUyWxrOcVDxZS1JBtI55LHZ/+PA0fTPiLz70c3tmjjhfkEkmGucniFM
 PPHzTAkePVZ/EcwWSDsaa98uxk4aBJKp8qgNre2s0+aY+CGvYCxmKKF72Ua06b8KbWZn
 jNdg==
X-Gm-Message-State: AOAM533esje7Zp4zXafsupIgyxl8EBQfPHcx8XXCiMPN+qn2XdQ9UGqR
 W5GfwJHPyGYN3dCe4DDO06anQSQyEnNtMwWP6DjgWQ==
X-Received: by 2002:a05:6870:330d:b0:f1:c7e5:1ab3 with SMTP id
 x13-20020a056870330d00b000f1c7e51ab3mr2505212oae.262.1652828113856; Tue, 17
 May 2022 15:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAJNiinuDjvX2c6uQr-wsRb1BNjLKVNWnokAnTiwYFtZg8-jXqA@mail.gmail.com>
 <CAFEAcA9AL3D6SsjhU2opuAAiCHaTSvvYV3JqCHEMG-7eMVpiAA@mail.gmail.com>
 <CAJNiinuyWmU9_DX5Sa8y14q4n0nn3APgsmq4cSOPH6vwXQubvg@mail.gmail.com>
 <CAFEAcA_4JwJkQAVOyGhVZ8qc9rag=bNVf73COnbUetojwpgHzQ@mail.gmail.com>
 <CAJNiinsuR26_C4mY4iCY81DqtvkwwfdH4K+U-ynzDw-wm2+xXw@mail.gmail.com>
 <CAFEAcA9YWiJE4grOOjeDL=Hw2B9+ZVPZ5rgT8WZWD28fxi130g@mail.gmail.com>
In-Reply-To: <CAFEAcA9YWiJE4grOOjeDL=Hw2B9+ZVPZ5rgT8WZWD28fxi130g@mail.gmail.com>
From: James Gutbub <jgutbub@asu.edu>
Date: Tue, 17 May 2022 15:54:58 -0700
Message-ID: <CAJNiinvQ50mOx9TQhgrLmUZBwCzodgY8oEHZiqozS-JgsUobwQ@mail.gmail.com>
Subject: Re: Hello world example with qemu-system-arm
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000099fdb305df3d0803"
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=jgutbub@asu.edu; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3CCNDT+Ai2ER

--00000000000099fdb305df3d0803
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for all your help! I was able to get something working based on your
suggestion to use arm-linux-* toolchain.

I am encountering some compile error message if I try to specify
=E2=80=98-march=3Darmv7-r=E2=80=99 or =E2=80=98-mcpu=3Dcortex-r5=E2=80=99 (=
conflicting architecture profiles
R/A), but =E2=80=98-mtune=3Dcortex-r5=E2=80=99 works.

And I am encountering some qemu-arm error message with the
=E2=80=98-mtune=3Dcortex-r5=E2=80=99 built ELF if I try to specify =E2=80=
=98-cpu cortex-r5f=E2=80=99 or =E2=80=98-cpu
cortex-r5=E2=80=99 (uncaught target signal 4 (Illegal instruction)), but =
=E2=80=98-cpu
cortex-a7=E2=80=99 works.



Pasting the working scenario for others who might come across this thread:



test_linux.c file contents:

#include <stdio.h>



int main(){

                printf("Test test\n");

                return 0;

}



arm-none-linux-gnueabihf-gcc -mtune=3Dcortex-r5 -static test_linux.c -o
test.elf

qemu-arm -cpu cortex-a7 ./test.elf



Much appreciated!


Kind Regards,

James G.

On Tue, May 17, 2022 at 12:36 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 16 May 2022 at 23:26, James Gutbub <jgutbub@asu.edu> wrote:
> >
> > Thank you for the help. I tried specifying =E2=80=98-R 0=E2=80=99 and r=
eceive the same
> error message - qemu-arm: Unable to reserve 0xffff0000 bytes of virtual
> address space at 0x1000 (Permission denied) for use as guest address spac=
e
> (check your virtual memory ulimit setting, min_mmap_addr or reserve less
> using -R option)
> >
> > I have been using the default linker script provided by arm-none-eabi-l=
d
> but I will continue by using the linker script defined below, which gives
> the same error message as before.
> >
> > test.ld file contents:
> >
> > ENTRY(_Reset)
> > SECTIONS
> > {
> > . =3D 0x0000000;
> > .startup . : { startup.o(.text)}
> > .text : { *(.text) }
> > . =3D 0x8000000;
> > .data : { *(.data) }
> > .bss : { *(.bss COMMON) }
> > . =3D ALIGN(8);
> > . =3D . + 0x1000;
> > _stack =3D .;
> > }
>
> Bear in mind that you are essentially linking a Linux binary
> here, not a real bare metal binary. So you don't necessarily get
> full control over where you want to put stuff in the address space,
> and in particular putting stuff at address 0 is not going to work.
> (If you can use an arm-linux-* toolchain then you can likely get
> away without having a linker map at all.)
>
> -- PMM
>

--00000000000099fdb305df3d0803
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"MsoNormal">Thanks for all your help! I was abl=
e to get something working based on your suggestion to use arm-linux-* tool=
chain.<u></u><u></u></p><p class=3D"MsoNormal">I am encountering some compi=
le error message if I try to specify =E2=80=98-march=3Darmv7-r=E2=80=99 or =
=E2=80=98-mcpu=3Dcortex-r5=E2=80=99 (conflicting architecture profiles R/A)=
, but =E2=80=98-mtune=3Dcortex-r5=E2=80=99 works.<u></u><u></u></p><p class=
=3D"MsoNormal">And I am encountering some qemu-arm error message with the =
=E2=80=98-mtune=3Dcortex-r5=E2=80=99 built ELF if I try to specify =E2=80=
=98-cpu cortex-r5f=E2=80=99 or =E2=80=98-cpu cortex-r5=E2=80=99 (uncaught t=
arget signal 4 (Illegal instruction)), but =E2=80=98-cpu cortex-a7=E2=80=99=
 works.<u></u><u></u></p><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p><p =
class=3D"MsoNormal">Pasting the working scenario for others who might come =
across this thread:<u></u><u></u></p><p class=3D"MsoNormal"><u></u>=C2=A0<u=
></u></p><p class=3D"MsoNormal">test_linux.c file contents:<u></u><u></u></=
p><p class=3D"MsoNormal" style=3D"margin-left:0.5in">#include &lt;stdio.h&g=
t;<u></u><u></u></p><p class=3D"MsoNormal" style=3D"margin-left:0.5in"><u><=
/u>=C2=A0<u></u></p><p class=3D"MsoNormal" style=3D"margin-left:0.5in">int =
main(){<u></u><u></u></p><p class=3D"MsoNormal" style=3D"margin-left:0.5in"=
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 printf(&quot;Test test\n&quot;);<u></u><u></u></p><p cla=
ss=3D"MsoNormal" style=3D"margin-left:0.5in">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;<u></=
u><u></u></p><p class=3D"MsoNormal" style=3D"margin-left:0.5in">}<u></u><u>=
</u></p><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p><p class=3D"MsoNorma=
l">arm-none-linux-gnueabihf-gcc -mtune=3Dcortex-r5 -static test_linux.c -o =
test.elf<u></u><u></u></p><p class=3D"MsoNormal">qemu-arm -cpu cortex-a7 ./=
test.elf<u></u><u></u></p><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p><p=
 class=3D"MsoNormal">Much appreciated!</p><p class=3D"MsoNormal"><br></p><p=
 class=3D"MsoNormal">Kind Regards,</p><p class=3D"MsoNormal">James G.</p></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Tue, May 17, 2022 at 12:36 AM Peter Maydell &lt;<a href=3D"mailto:peter.ma=
ydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On Mon, 16 May 2022 at 23:26, Jam=
es Gutbub &lt;<a href=3D"mailto:jgutbub@asu.edu" target=3D"_blank">jgutbub@=
asu.edu</a>&gt; wrote:<br>
&gt;<br>
&gt; Thank you for the help. I tried specifying =E2=80=98-R 0=E2=80=99 and =
receive the same error message - qemu-arm: Unable to reserve 0xffff0000 byt=
es of virtual address space at 0x1000 (Permission denied) for use as guest =
address space (check your virtual memory ulimit setting, min_mmap_addr or r=
eserve less using -R option)<br>
&gt;<br>
&gt; I have been using the default linker script provided by arm-none-eabi-=
ld but I will continue by using the linker script defined below, which give=
s the same error message as before.<br>
&gt;<br>
&gt; test.ld file contents:<br>
&gt;<br>
&gt; ENTRY(_Reset)<br>
&gt; SECTIONS<br>
&gt; {<br>
&gt; . =3D 0x0000000;<br>
&gt; .startup . : { startup.o(.text)}<br>
&gt; .text : { *(.text) }<br>
&gt; . =3D 0x8000000;<br>
&gt; .data : { *(.data) }<br>
&gt; .bss : { *(.bss COMMON) }<br>
&gt; . =3D ALIGN(8);<br>
&gt; . =3D . + 0x1000;<br>
&gt; _stack =3D .;<br>
&gt; }<br>
<br>
Bear in mind that you are essentially linking a Linux binary<br>
here, not a real bare metal binary. So you don&#39;t necessarily get<br>
full control over where you want to put stuff in the address space,<br>
and in particular putting stuff at address 0 is not going to work.<br>
(If you can use an arm-linux-* toolchain then you can likely get<br>
away without having a linker map at all.)<br>
<br>
-- PMM<br>
</blockquote></div>

--00000000000099fdb305df3d0803--

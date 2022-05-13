Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp589738lfj;
        Fri, 13 May 2022 15:59:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMyWmpP25QjxgjBYrTONmiP80KUp1lAwIaYti5AURvRRbvB4RiGMcwlZ2AHRF8+X8NJzDx
X-Received: by 2002:a05:622a:d:b0:2f3:d8c3:a968 with SMTP id x13-20020a05622a000d00b002f3d8c3a968mr6883121qtw.362.1652482779454;
        Fri, 13 May 2022 15:59:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652482779; cv=none;
        d=google.com; s=arc-20160816;
        b=trDej6GxLYtOFz6jyZmg3QZCyfXfhHsgtm+z7NZFJ1fSTHL/J5ifLB2yre9EDL9mK/
         ffmarW72BxGIkpToRhBVLuujehebNU0k71AiS902+aQDbtxar/Bq4LCdmDsQV7wnFeYs
         77V/Lsxk5QQJ6RIHeAkr1M3OIfakbBR1rOcdy34wV+fDEgFwg5zx6LxVR2dQz+6gqLRU
         tAYqfIbma9vHEC2hduAJHM/IJdo3UTp6pDj3nrxCZ5cYexVX9o//qwrwHLpc/iay77uo
         9jvfKokzSYKEslNQdWJJIppvrlgADijxMwD/5BlU3EBS+4yc/XeJuwt5ncCDz4dIbK4j
         cyHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Qf2awEakyiYRjTycqfVAP56dm0hfGemsgeLIc9czO+o=;
        b=KRgoTQCPapJoOd0SzIes5fPTr2Ohs2GfhzeMZYwe6vEDuGfLW6yVoLueQ6ZjLuNM3y
         kKktRYNSx7Sgs5NLxxKg0nrWHvakZiSEArPqE7cCqDNL7Sg1yukBapoaJvHRXTcAha/0
         FCVmlf3jxtO+TdkA1OxkpgXpgBDN+PuTE9+88X9A5vDzinWgZzTMjhpuB6V09L3ptNyY
         zdT7K7hkGvLM3c9w4qeiHExBfFNnwukvHCLNDQgZDiuQny5hSpIN3DS2Zqp+CqSTz9nx
         FFVZbg8QyMJV0OUvy040MepeCHSLuUcfvlxSMUCJrsUrk/CrBwyLyjmrzomIs+mvlN3n
         hvNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@asu-edu.20210112.gappssmtp.com header.s=20210112 header.b=fZ6YAMPw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=asu.edu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k12-20020ac85fcc000000b002f58aa3d367si1998193qta.739.2022.05.13.15.59.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 May 2022 15:59:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@asu-edu.20210112.gappssmtp.com header.s=20210112 header.b=fZ6YAMPw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=asu.edu
Received: from localhost ([::1]:37796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1npeG2-00042h-VA
	for alex.bennee@linaro.org; Fri, 13 May 2022 18:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgutbub@asu.edu>) id 1npeFt-000402-05
 for qemu-arm@nongnu.org; Fri, 13 May 2022 18:59:29 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:39709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jgutbub@asu.edu>) id 1npeFq-000520-Cx
 for qemu-arm@nongnu.org; Fri, 13 May 2022 18:59:28 -0400
Received: by mail-oi1-x22c.google.com with SMTP id l16so11879514oil.6
 for <qemu-arm@nongnu.org>; Fri, 13 May 2022 15:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=asu-edu.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qf2awEakyiYRjTycqfVAP56dm0hfGemsgeLIc9czO+o=;
 b=fZ6YAMPw1K0K1eccTL+uNIya+2pX8PDxyb6MM0FHa2/YLSs8h+vyPLjlVxn/aeucYH
 rvOHTQ75J3K9eFZaLjdaS27DZXtJT2GfEUi3qg5qyVVsx9ml7HCEwVK0vrY5HAq/24o2
 TYQVkmmeza2rqpc3AOCeaGxhTphApTC75wqLzH5J0lDjfjP/TfQrkhgq2mHNKI34ShKh
 DmX79KLorve9RoLlSW/yKrVIpRnMAOdxSzF/MrEi5Y7ydXor94yUgwpX2q3Ndwrmjtoh
 2rZSWjEC7KX7cot8u/fmn7llDuT/+k4p6kwbcERGAYSG+sd/lIyZQ9kzjdEfhO9aifTC
 CcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qf2awEakyiYRjTycqfVAP56dm0hfGemsgeLIc9czO+o=;
 b=XiuSdyBuvQni9pwoWgtsKO3rlPztrF+xay6w/MSbAFYiCjbATrwG9OkIAWMGaJdV3o
 5t5NIMcLtHaX52H8PCX4d8LfNFCRZub1m0i9+VriFn9hAKYuKYKvLROSQGqFK9XBoB33
 fVeWPjW3qnnIQdmOsi6Ar1wPQt1hGhbGG4fzhQ1vY1Pwmo91Zgg3SHYWW9sUd/dKuG/r
 J1Xjbho5bBWwWaQT9XWDy2v17UZWbSYdl7EfLy3Ac8Y35nxIqYY3ElD8ZoPUwjC+HMfv
 V2cwybuGHQSBWe5QftuAm/ZlEMuQBIBrWnbhLWXZvodO1POe+1IId7oaxpA95OseYmpv
 +O6w==
X-Gm-Message-State: AOAM531AhzrMfhy/UleMQWbLGg7A5jJxchWdz7WS8rD4glNM6ZUlzVa4
 iiv6HUYlH0eeL5WKI5JVlLYTAIyrTjjpRZ8CfBDklKbyok8=
X-Received: by 2002:a05:6808:aa6:b0:326:e32:cac1 with SMTP id
 r6-20020a0568080aa600b003260e32cac1mr8425572oij.262.1652482762726; Fri, 13
 May 2022 15:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAJNiinuDjvX2c6uQr-wsRb1BNjLKVNWnokAnTiwYFtZg8-jXqA@mail.gmail.com>
 <CAFEAcA9AL3D6SsjhU2opuAAiCHaTSvvYV3JqCHEMG-7eMVpiAA@mail.gmail.com>
In-Reply-To: <CAFEAcA9AL3D6SsjhU2opuAAiCHaTSvvYV3JqCHEMG-7eMVpiAA@mail.gmail.com>
From: James Gutbub <jgutbub@asu.edu>
Date: Fri, 13 May 2022 15:59:11 -0700
Message-ID: <CAJNiinuyWmU9_DX5Sa8y14q4n0nn3APgsmq4cSOPH6vwXQubvg@mail.gmail.com>
Subject: Re: Hello world example with qemu-system-arm
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000011f68205deeca058"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=jgutbub@asu.edu; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, HTTPS_HTTP_MISMATCH=0.1,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pfvftyJz8V9y

--00000000000011f68205deeca058
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you kindly for your very informative/helpful response!



I am pursuing the qemu-arm path (although I may also consider
qemu-system-arm at some point).



I am trying with the below sequence of compiling a simple ASM test,
linking, and executing using qemu-arm (I tried with v6.0.0 and v7.0.0
compiled locally in CentOS Stream 8) and cannot progress past an error.



I am trying with cortex-r5f (-march=3Darmv7-r) and also cortex-a7
(-march=3Darmv7-a)



startup.s file contents:



.global _Reset

_Reset:

LDR sp, =3D_stack

ORR r1, r1

ORR r2, r2

ORR r3, r3

ORR r4, r4

B .



arm-none-eabi-as  -march=3Darmv7-a startup.s -o startup.o

arm-none-eabi-ld  startup.o -Map=3Dtest.map -o test.elf -e _Reset



qemu-arm -cpu cortex-a7 -d in_asm,exec,cpu,int,unimp,guest_errors,nochain
-D test.log test.elf



qemu-arm: Unable to reserve 0xffff0000 bytes of virtual address space at
0x1000 (Permission denied) for use as guest address space (check your
virtual memory ulimit setting, min_mmap_addr or reserve less using -R
option)



I checked the output of =E2=80=98ulimit -a=E2=80=99 and got the below so I =
don=E2=80=99t believe I
have any restrictions to allocate the requested virtual memory:



ulimit -a

core file size          (blocks, -c) 0

data seg size           (kbytes, -d) unlimited

scheduling priority             (-e) 0

file size               (blocks, -f) unlimited

pending signals                 (-i) 255393

max locked memory       (kbytes, -l) 64

max memory size         (kbytes, -m) unlimited

open files                      (-n) 1024

pipe size            (512 bytes, -p) 8

POSIX message queues     (bytes, -q) 819200

real-time priority              (-r) 0

stack size              (kbytes, -s) 8192

cpu time               (seconds, -t) unlimited

max user processes              (-u) 255393

virtual memory          (kbytes, -v) unlimited

file locks                      (-x) unlimited



Looked kind of similar to this issue but wasn=E2=80=99t sure if maybe I hav=
e some
other issue -https://gitlab.com/qemu-project/qemu/-/issues/447
<https://urldefense.com/v3/__https://gitlab.com/qemu-project/qemu/-/issues/=
447__;!!IKRxdwAv5BmarQ!eFYN7rBs7q2IQ9Zm9v6S3VBFxFUtgxRj7HYrSVthepPvSLwp0OGN=
FJcpndD45guGHuyRdvQGPP8JhuKPlMQ$>



Any tips you could recommend would be greatly appreciated.



Kind Regards,

James G.

On Thu, May 12, 2022 at 1:35 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Wed, 11 May 2022 at 20:50, James Gutbub <jgutbub@asu.edu> wrote:
> > I am digging into qemu-system-arm to try and execute some simulation
> > environment unit tests with no underlying board/device interaction,
> > at most I need semihosting to print out some results.
>
> > The intended target for my hello world using arm-none-eabi-gcc
> > is Cortex-R5F (e.g. -mcpu=3Dcortex-r5 -mfpu=3Dvfpv3-d16 -mfloat-abi=3Dh=
ard).
>
> > I am not finding a way to successfully execute my hello world example
> > using =E2=80=98qemu-system-arm -cpu cortex-r5f -M none -nographic -semi=
hosting=E2=80=99
> > and the payload variants below:
>
> You need to specify a real machine type. QEMU is not designed
> to provide a "just the CPU" emulation environment. There are
> two modes:
>
>  (1) system emulation, with qemu-system-arm, which gives you
> a model of some actual board. Your guest code usually needs
> to be written to work on that board (at a minimum, linked to
> an address where the board has RAM)
>  (2) usermode emulation, with qemu-arm, which runs code at
> emulated EL0 (userspace) with access to Linux syscalls and
> also the semihosting ABI
>
> You're also at a disadvantage in wanting Cortex-R5F : we have
> no system emulation board models where that is the main CPU.
> (We have it for some Xilinx board models which have Cortex-A72
> cores for the main processors and also some auxiilary R5 cores.)
>
> Depending on what your code is doing, you may be able to use
> option 2. In particular your code would have to:
>  * not touch any devices or other SoC or board hardware
>  * be happy running only at EL0
>  * only use memory which is in the ELF file's code/data/bss
>    (unless you want to allocate more with Linux syscalls)
>
> It's perhaps not impossible to get something executing with
> the 'none' type, but this is definitely not a supported
> use case, so you're on your own if you want to experiment.
> As a starting hint, the 'none' board defaults to "no RAM",
> so unless you tell QEMU to allocate some then there's nowhere
> for your code to execute from.
>
> Whichever way you want to go on this, for any kind of "I'm
> not sure why my code is failing to start" question I recommend
> the use of the -d debug options to tell you where the CPU
> is trying to execute instructions from and what they are.
> -d in_asm,exec,cpu,int,unimp,guest_errors,nochain is usually
> a good set of options; but watch out that 'in_asm' shows
> when insns are translated, not when they are executed.
> -D file to dump to file rather than the terminal.
>
> thanks
> -- PMM
>

--00000000000011f68205deeca058
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><p class=3D"MsoNormal" style=3D"font-size:1rem;word-spacing:1px;border=
-color:rgb(49,49,49);color:rgb(49,49,49)">Thank you kindly for your very in=
formative/helpful response!<u style=3D"border-color:rgb(49,49,49)"></u><u s=
tyle=3D"border-color:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" style=3D=
"font-size:16px;word-spacing:1px;border-color:rgb(49,49,49);color:rgb(49,49=
,49)"><u style=3D"border-color:rgb(49,49,49)"></u>=C2=A0<u style=3D"border-=
color:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" style=3D"font-size:1rem=
;word-spacing:1px;border-color:rgb(49,49,49);color:rgb(49,49,49)">I am purs=
uing the qemu-arm path (although I may also consider qemu-system-arm at som=
e point).<u style=3D"border-color:rgb(49,49,49)"></u><u style=3D"border-col=
or:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" style=3D"font-size:16px;wo=
rd-spacing:1px;border-color:rgb(49,49,49);color:rgb(49,49,49)"><u style=3D"=
border-color:rgb(49,49,49)"></u>=C2=A0<u style=3D"border-color:rgb(49,49,49=
)"></u></p><p class=3D"MsoNormal" style=3D"font-size:1rem;word-spacing:1px;=
border-color:rgb(49,49,49);color:rgb(49,49,49)">I am trying with the below =
sequence of compiling a simple ASM test, linking, and executing using qemu-=
arm (I tried with v6.0.0 and v7.0.0 compiled locally in CentOS Stream 8) an=
d cannot progress past an error.<u style=3D"border-color:rgb(49,49,49)"></u=
><u style=3D"border-color:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" sty=
le=3D"font-size:16px;word-spacing:1px;border-color:rgb(49,49,49);color:rgb(=
49,49,49)"><u style=3D"border-color:rgb(49,49,49)"></u>=C2=A0<u style=3D"bo=
rder-color:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" style=3D"font-size=
:1rem;word-spacing:1px;border-color:rgb(49,49,49);color:rgb(49,49,49)">I am=
 trying with cortex-r5f (-march=3Darmv7-r) and also cortex-a7 (-march=3Darm=
v7-a)<u style=3D"border-color:rgb(49,49,49)"></u><u style=3D"border-color:r=
gb(49,49,49)"></u></p><p class=3D"MsoNormal" style=3D"font-size:16px;word-s=
pacing:1px;border-color:rgb(49,49,49);color:rgb(49,49,49)"><u style=3D"bord=
er-color:rgb(49,49,49)"></u>=C2=A0<u style=3D"border-color:rgb(49,49,49)"><=
/u></p><p class=3D"MsoNormal" style=3D"font-size:1rem;word-spacing:1px;bord=
er-color:rgb(49,49,49);color:rgb(49,49,49)">startup.s file contents:<u styl=
e=3D"border-color:rgb(49,49,49)"></u><u style=3D"border-color:rgb(49,49,49)=
"></u></p><p class=3D"MsoNormal" style=3D"font-size:16px;word-spacing:1px;b=
order-color:rgb(49,49,49);color:rgb(49,49,49)"><u style=3D"border-color:rgb=
(49,49,49)"></u>=C2=A0<u style=3D"border-color:rgb(49,49,49)"></u></p><p cl=
ass=3D"MsoNormal" style=3D"font-size:1rem;word-spacing:1px;margin-left:0.5i=
n;border-color:rgb(49,49,49);color:rgb(49,49,49)">.global _Reset<u style=3D=
"border-color:rgb(49,49,49)"></u><u style=3D"border-color:rgb(49,49,49)"></=
u></p><p class=3D"MsoNormal" style=3D"font-size:1rem;word-spacing:1px;margi=
n-left:0.5in;border-color:rgb(49,49,49);color:rgb(49,49,49)">_Reset:<u styl=
e=3D"border-color:rgb(49,49,49)"></u><u style=3D"border-color:rgb(49,49,49)=
"></u></p><p class=3D"MsoNormal" style=3D"font-size:1rem;word-spacing:1px;m=
argin-left:0.5in;border-color:rgb(49,49,49);color:rgb(49,49,49)">LDR sp, =
=3D_stack<u style=3D"border-color:rgb(49,49,49)"></u><u style=3D"border-col=
or:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" style=3D"font-size:1rem;wo=
rd-spacing:1px;margin-left:0.5in;border-color:rgb(49,49,49);color:rgb(49,49=
,49)">ORR r1, r1<u style=3D"border-color:rgb(49,49,49)"></u><u style=3D"bor=
der-color:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" style=3D"font-size:=
1rem;word-spacing:1px;margin-left:0.5in;border-color:rgb(49,49,49);color:rg=
b(49,49,49)">ORR r2, r2<u style=3D"border-color:rgb(49,49,49)"></u><u style=
=3D"border-color:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" style=3D"fon=
t-size:1rem;word-spacing:1px;margin-left:0.5in;border-color:rgb(49,49,49);c=
olor:rgb(49,49,49)">ORR r3, r3<u style=3D"border-color:rgb(49,49,49)"></u><=
u style=3D"border-color:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" style=
=3D"font-size:1rem;word-spacing:1px;margin-left:0.5in;border-color:rgb(49,4=
9,49);color:rgb(49,49,49)">ORR r4, r4<u style=3D"border-color:rgb(49,49,49)=
"></u><u style=3D"border-color:rgb(49,49,49)"></u></p><p class=3D"MsoNormal=
" style=3D"font-size:1rem;word-spacing:1px;margin-left:0.5in;border-color:r=
gb(49,49,49);color:rgb(49,49,49)">B .<u style=3D"border-color:rgb(49,49,49)=
"></u><u style=3D"border-color:rgb(49,49,49)"></u></p><p class=3D"MsoNormal=
" style=3D"font-size:16px;word-spacing:1px;border-color:rgb(49,49,49);color=
:rgb(49,49,49)"><u style=3D"border-color:rgb(49,49,49)"></u>=C2=A0<u style=
=3D"border-color:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" style=3D"fon=
t-size:1rem;word-spacing:1px;border-color:rgb(49,49,49);color:rgb(49,49,49)=
">arm-none-eabi-as=C2=A0 -march=3Darmv7-a startup.s -o startup.o<u style=3D=
"border-color:rgb(49,49,49)"></u><u style=3D"border-color:rgb(49,49,49)"></=
u></p><p class=3D"MsoNormal" style=3D"font-size:1rem;word-spacing:1px;borde=
r-color:rgb(49,49,49);color:rgb(49,49,49)">arm-none-eabi-ld=C2=A0 startup.o=
 -Map=3Dtest.map -o test.elf -e _Reset<u style=3D"border-color:rgb(49,49,49=
)"></u><u style=3D"border-color:rgb(49,49,49)"></u></p><p class=3D"MsoNorma=
l" style=3D"font-size:16px;word-spacing:1px;border-color:rgb(49,49,49);colo=
r:rgb(49,49,49)"><u style=3D"border-color:rgb(49,49,49)"></u>=C2=A0<u style=
=3D"border-color:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" style=3D"fon=
t-size:1rem;word-spacing:1px;border-color:rgb(49,49,49);color:rgb(49,49,49)=
">qemu-arm -cpu cortex-a7 -d in_asm,exec,cpu,int,unimp,guest_errors,nochain=
 -D test.log test.elf<u style=3D"border-color:rgb(49,49,49)"></u><u style=
=3D"border-color:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" style=3D"fon=
t-size:16px;word-spacing:1px;border-color:rgb(49,49,49);color:rgb(49,49,49)=
"><u style=3D"border-color:rgb(49,49,49)"></u>=C2=A0<u style=3D"border-colo=
r:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" style=3D"font-size:1rem;wor=
d-spacing:1px;border-color:rgb(49,49,49);color:rgb(49,49,49)">qemu-arm: Una=
ble to reserve 0xffff0000 bytes of virtual address space at 0x1000 (Permiss=
ion denied) for use as guest address space (check your virtual memory ulimi=
t setting, min_mmap_addr or reserve less using -R option)<u style=3D"border=
-color:rgb(49,49,49)"></u><u style=3D"border-color:rgb(49,49,49)"></u></p><=
p class=3D"MsoNormal" style=3D"font-size:16px;word-spacing:1px;border-color=
:rgb(49,49,49);color:rgb(49,49,49)"><u style=3D"border-color:rgb(49,49,49)"=
></u>=C2=A0<u style=3D"border-color:rgb(49,49,49)"></u></p><p class=3D"MsoN=
ormal" style=3D"font-size:1rem;word-spacing:1px;border-color:rgb(49,49,49);=
color:rgb(49,49,49)">I checked the output of =E2=80=98ulimit -a=E2=80=99 an=
d got the below so I don=E2=80=99t believe I have any restrictions to alloc=
ate the requested virtual memory:<u style=3D"border-color:rgb(49,49,49)"></=
u><u style=3D"border-color:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" st=
yle=3D"font-size:16px;word-spacing:1px;border-color:rgb(49,49,49);color:rgb=
(49,49,49)"><u style=3D"border-color:rgb(49,49,49)"></u>=C2=A0<u style=3D"b=
order-color:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" style=3D"font-siz=
e:1rem;word-spacing:1px;border-color:rgb(49,49,49);color:rgb(49,49,49)">uli=
mit -a<u style=3D"border-color:rgb(49,49,49)"></u><u style=3D"border-color:=
rgb(49,49,49)"></u></p><p class=3D"MsoNormal" style=3D"font-size:1rem;word-=
spacing:1px;border-color:rgb(49,49,49);color:rgb(49,49,49)">core file size=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (blocks, -c) 0<u sty=
le=3D"border-color:rgb(49,49,49)"></u><u style=3D"border-color:rgb(49,49,49=
)"></u></p><p class=3D"MsoNormal" style=3D"font-size:1rem;word-spacing:1px;=
border-color:rgb(49,49,49);color:rgb(49,49,49)">data seg size=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (kbytes, -d) unlimited<u s=
tyle=3D"border-color:rgb(49,49,49)"></u><u style=3D"border-color:rgb(49,49,=
49)"></u></p><p class=3D"MsoNormal" style=3D"font-size:1rem;word-spacing:1p=
x;border-color:rgb(49,49,49);color:rgb(49,49,49)">scheduling priority=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (-e) 0<u=
 style=3D"border-color:rgb(49,49,49)"></u><u style=3D"border-color:rgb(49,4=
9,49)"></u></p><p class=3D"MsoNormal" style=3D"font-size:1rem;word-spacing:=
1px;border-color:rgb(49,49,49);color:rgb(49,49,49)">file size=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (b=
locks, -f) unlimited<u style=3D"border-color:rgb(49,49,49)"></u><u style=3D=
"border-color:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" style=3D"font-s=
ize:1rem;word-spacing:1px;border-color:rgb(49,49,49);color:rgb(49,49,49)">p=
ending signals=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (-i) 255393<u style=3D"border-color:rg=
b(49,49,49)"></u><u style=3D"border-color:rgb(49,49,49)"></u></p><p class=
=3D"MsoNormal" style=3D"font-size:1rem;word-spacing:1px;border-color:rgb(49=
,49,49);color:rgb(49,49,49)">max locked memory=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 (kbytes, -l) 64<u style=3D"border-color:rgb(49,49,49)"></u><u sty=
le=3D"border-color:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" style=3D"f=
ont-size:1rem;word-spacing:1px;border-color:rgb(49,49,49);color:rgb(49,49,4=
9)">max memory size=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (kbytes=
, -m) unlimited<u style=3D"border-color:rgb(49,49,49)"></u><u style=3D"bord=
er-color:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" style=3D"font-size:1=
rem;word-spacing:1px;border-color:rgb(49,49,49);color:rgb(49,49,49)">open f=
iles=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (-n) 1024<u style=
=3D"border-color:rgb(49,49,49)"></u><u style=3D"border-color:rgb(49,49,49)"=
></u></p><p class=3D"MsoNormal" style=3D"font-size:1rem;word-spacing:1px;bo=
rder-color:rgb(49,49,49);color:rgb(49,49,49)">pipe size=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (512 bytes, -p) 8<u style=
=3D"border-color:rgb(49,49,49)"></u><u style=3D"border-color:rgb(49,49,49)"=
></u></p><p class=3D"MsoNormal" style=3D"font-size:1rem;word-spacing:1px;bo=
rder-color:rgb(49,49,49);color:rgb(49,49,49)">POSIX message queues=C2=A0=C2=
=A0=C2=A0=C2=A0 (bytes, -q) 819200<u style=3D"border-color:rgb(49,49,49)"><=
/u><u style=3D"border-color:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" s=
tyle=3D"font-size:1rem;word-spacing:1px;border-color:rgb(49,49,49);color:rg=
b(49,49,49)">real-time priority=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (-r) 0<u style=3D"border-color:rgb(49,=
49,49)"></u><u style=3D"border-color:rgb(49,49,49)"></u></p><p class=3D"Mso=
Normal" style=3D"font-size:1rem;word-spacing:1px;border-color:rgb(49,49,49)=
;color:rgb(49,49,49)">stack size=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (kbytes, -s) 8192<u style=3D"border-co=
lor:rgb(49,49,49)"></u><u style=3D"border-color:rgb(49,49,49)"></u></p><p c=
lass=3D"MsoNormal" style=3D"font-size:1rem;word-spacing:1px;border-color:rg=
b(49,49,49);color:rgb(49,49,49)">cpu time=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (seconds, -t) unlimited=
<u style=3D"border-color:rgb(49,49,49)"></u><u style=3D"border-color:rgb(49=
,49,49)"></u></p><p class=3D"MsoNormal" style=3D"font-size:1rem;word-spacin=
g:1px;border-color:rgb(49,49,49);color:rgb(49,49,49)">max user processes=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 (-u) 255393<u style=3D"border-color:rgb(49,49,49)"></u><u style=3D"border-=
color:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" style=3D"font-size:1rem=
;word-spacing:1px;border-color:rgb(49,49,49);color:rgb(49,49,49)">virtual m=
emory=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (kbytes, -v) un=
limited<u style=3D"border-color:rgb(49,49,49)"></u><u style=3D"border-color=
:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" style=3D"font-size:1rem;word=
-spacing:1px;border-color:rgb(49,49,49);color:rgb(49,49,49)">file locks=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (-x) unlimited<u style=3D"=
border-color:rgb(49,49,49)"></u><u style=3D"border-color:rgb(49,49,49)"></u=
></p><p class=3D"MsoNormal" style=3D"font-size:16px;word-spacing:1px;border=
-color:rgb(49,49,49);color:rgb(49,49,49)"><u style=3D"border-color:rgb(49,4=
9,49)"></u>=C2=A0<u style=3D"border-color:rgb(49,49,49)"></u></p><p class=
=3D"MsoNormal" style=3D"font-size:1rem;word-spacing:1px;border-color:rgb(49=
,49,49);color:rgb(49,49,49)">Looked kind of similar to this issue but wasn=
=E2=80=99t sure if maybe I have some other issue -<a href=3D"https://urldef=
ense.com/v3/__https://gitlab.com/qemu-project/qemu/-/issues/447__;!!IKRxdwA=
v5BmarQ!eFYN7rBs7q2IQ9Zm9v6S3VBFxFUtgxRj7HYrSVthepPvSLwp0OGNFJcpndD45guGHuy=
RdvQGPP8JhuKPlMQ$" target=3D"_blank" style=3D"font-size:1rem;border-color:r=
gb(66,133,244)">https://gitlab.com/qemu-project/qemu/-/issues/447</a><u sty=
le=3D"border-color:rgb(49,49,49)"></u><u style=3D"border-color:rgb(49,49,49=
)"></u></p><p class=3D"MsoNormal" style=3D"font-size:16px;word-spacing:1px;=
border-color:rgb(49,49,49);color:rgb(49,49,49)"><u style=3D"border-color:rg=
b(49,49,49)"></u>=C2=A0<u style=3D"border-color:rgb(49,49,49)"></u></p><p c=
lass=3D"MsoNormal" style=3D"font-size:1rem;word-spacing:1px;border-color:rg=
b(49,49,49);color:rgb(49,49,49)">Any tips you could recommend would be grea=
tly appreciated.<u style=3D"border-color:rgb(49,49,49)"></u><u style=3D"bor=
der-color:rgb(49,49,49)"></u></p><p class=3D"MsoNormal" style=3D"font-size:=
16px;word-spacing:1px;border-color:rgb(49,49,49);color:rgb(49,49,49)"><u st=
yle=3D"border-color:rgb(49,49,49)"></u>=C2=A0<u style=3D"border-color:rgb(4=
9,49,49)"></u></p><p class=3D"MsoNormal" style=3D"font-size:1rem;word-spaci=
ng:1px;border-color:rgb(49,49,49);color:rgb(49,49,49)">Kind Regards,<u styl=
e=3D"border-color:rgb(49,49,49)"></u><u style=3D"border-color:rgb(49,49,49)=
"></u></p><p class=3D"MsoNormal" style=3D"font-size:1rem;word-spacing:1px;b=
order-color:rgb(49,49,49);color:rgb(49,49,49)">James G.</p></div><div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May=
 12, 2022 at 1:35 AM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@lina=
ro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">=
On Wed, 11 May 2022 at 20:50, James Gutbub &lt;<a href=3D"mailto:jgutbub@as=
u.edu" target=3D"_blank">jgutbub@asu.edu</a>&gt; wrote:<br>
&gt; I am digging into qemu-system-arm to try and execute some simulation<b=
r>
&gt; environment unit tests with no underlying board/device interaction,<br=
>
&gt; at most I need semihosting to print out some results.<br>
<br>
&gt; The intended target for my hello world using arm-none-eabi-gcc<br>
&gt; is Cortex-R5F (e.g. -mcpu=3Dcortex-r5 -mfpu=3Dvfpv3-d16 -mfloat-abi=3D=
hard).<br>
<br>
&gt; I am not finding a way to successfully execute my hello world example<=
br>
&gt; using =E2=80=98qemu-system-arm -cpu cortex-r5f -M none -nographic -sem=
ihosting=E2=80=99<br>
&gt; and the payload variants below:<br>
<br>
You need to specify a real machine type. QEMU is not designed<br>
to provide a &quot;just the CPU&quot; emulation environment. There are<br>
two modes:<br>
<br>
=C2=A0(1) system emulation, with qemu-system-arm, which gives you<br>
a model of some actual board. Your guest code usually needs<br>
to be written to work on that board (at a minimum, linked to<br>
an address where the board has RAM)<br>
=C2=A0(2) usermode emulation, with qemu-arm, which runs code at<br>
emulated EL0 (userspace) with access to Linux syscalls and<br>
also the semihosting ABI<br>
<br>
You&#39;re also at a disadvantage in wanting Cortex-R5F : we have<br>
no system emulation board models where that is the main CPU.<br>
(We have it for some Xilinx board models which have Cortex-A72<br>
cores for the main processors and also some auxiilary R5 cores.)<br>
<br>
Depending on what your code is doing, you may be able to use<br>
option 2. In particular your code would have to:<br>
=C2=A0* not touch any devices or other SoC or board hardware<br>
=C2=A0* be happy running only at EL0<br>
=C2=A0* only use memory which is in the ELF file&#39;s code/data/bss<br>
=C2=A0 =C2=A0(unless you want to allocate more with Linux syscalls)<br>
<br>
It&#39;s perhaps not impossible to get something executing with<br>
the &#39;none&#39; type, but this is definitely not a supported<br>
use case, so you&#39;re on your own if you want to experiment.<br>
As a starting hint, the &#39;none&#39; board defaults to &quot;no RAM&quot;=
,<br>
so unless you tell QEMU to allocate some then there&#39;s nowhere<br>
for your code to execute from.<br>
<br>
Whichever way you want to go on this, for any kind of &quot;I&#39;m<br>
not sure why my code is failing to start&quot; question I recommend<br>
the use of the -d debug options to tell you where the CPU<br>
is trying to execute instructions from and what they are.<br>
-d in_asm,exec,cpu,int,unimp,guest_errors,nochain is usually<br>
a good set of options; but watch out that &#39;in_asm&#39; shows<br>
when insns are translated, not when they are executed.<br>
-D file to dump to file rather than the terminal.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--00000000000011f68205deeca058--

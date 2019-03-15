Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp2529838wro;
        Fri, 15 Mar 2019 15:28:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw3eAac2iIKE000mmsbxdUAu9T9md/PQyktoHW3cUiRIkajmOFLbEZ8e7MQaJacqhCzRZWd
X-Received: by 2002:a05:6000:1043:: with SMTP id c3mr3543105wrx.291.1552688882269;
        Fri, 15 Mar 2019 15:28:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552688882; cv=none;
        d=google.com; s=arc-20160816;
        b=vVdSGHBRyTpUTtblBd1JwMkuju2VMh6+GuIYDqqSegFNEFTzXYRuw8onxDsgn6yP4Z
         IG1tg5YqDgZmCmI4yBFISbjqlVx89o+VQb1VOQoBGzrUFPiYCfiD3KQEV5WMGHFwJDGI
         23LilQ/gu03Dv8SgPrFATsv/nYtAgH4umsBEke3iJcUZwjQ6GebwOF2V3JnJO5NqvFpZ
         qjSLGLewnIFW58NgAZY/V6CqbBzS5FIh2iXlL8bUL+VNGphwdr1BB7wZmB4CIy6KKpSr
         7P/ATZMpqsg34mEOTie5cw2cUYe0mkDK3vg9DgeiZyBRbBUotVzTqLmDm7U4SLx9tfBk
         FP+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X8as6M+3UgxQ04BVOMXINB4DtL5StBNtN8LtaEYPvVY=;
        b=Lfno1BvmDJY9ccNnBbDW5fy3bMGknbHRSXarJ7oanWpM1lVWcHxLvOVa7Y/Sv0cfAd
         zzEGtgEKRsZYsLI+D9avDRoa5QYvz+cgRVagUpVJwvrRFUsHepy5MBydVzyIWaFg6NUC
         PiFEFbAWYwR1e08itwpLgtV+pMe/GMXO41sTR6KlLC6eo1ex9KbRz240vH6TxNTjNpX0
         WV4Fi3OX0EFhFJcxVc3vn+3WSmNfwUOFS0lXhNpy1nmkYgXRyFNpie2vIa6sJlFUQEA7
         NKZ+A40bbnrVeKaE1wGTkRI4/GePRM5WL1DWGKHvpEuaVaqEVxk0Gv5Bb/6mnzgRgnmY
         DCqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="PN/zt+0W";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10si1939841wrl.69.2019.03.15.15.28.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Mar 2019 15:28:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="PN/zt+0W";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:33756 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4vJ3-0006U8-8V
	for alex.bennee@linaro.org; Fri, 15 Mar 2019 18:28:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cialdi@gmail.com>) id 1h4vI8-0005wk-Dh
	for qemu-arm@nongnu.org; Fri, 15 Mar 2019 18:27:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cialdi@gmail.com>) id 1h4v4M-0005md-W7
	for qemu-arm@nongnu.org; Fri, 15 Mar 2019 18:12:52 -0400
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:33104)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <cialdi@gmail.com>) id 1h4v4M-0005mI-Ix
	for qemu-arm@nongnu.org; Fri, 15 Mar 2019 18:12:50 -0400
Received: by mail-qt1-x843.google.com with SMTP id k14so6165685qtb.0
	for <qemu-arm@nongnu.org>; Fri, 15 Mar 2019 15:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=X8as6M+3UgxQ04BVOMXINB4DtL5StBNtN8LtaEYPvVY=;
	b=PN/zt+0WEH+IW0JlRxxO3GWC2JYEOZPXgzfsvN5/G5KFTboxIs9HqUT3GhFGLpsk7Q
	8Pxmb3ZXn04KE9pAzqAeCcS0uwf1Nw30MA/JvSYjG1Zt0WDwHG14RxfZFEKHrkCk0QAW
	IUij1+pOOnE9T38D0AEDZ4DePeME5xgiG3Tm2IeXUPs7OKs9Zy20q85VBWRrQ1hITkqi
	AKWilLfId/MfwSutDSEtw0IbZMfjgLDjmtmvh1t0DepArJ94d2TUtvONYDfIcBl/iEfC
	85l9g3C7BKxxQj65a33SW7GabNE7XfYUEWOj1se1xekKhG6dqLpq7LEOcG3A99aosFa5
	MIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=X8as6M+3UgxQ04BVOMXINB4DtL5StBNtN8LtaEYPvVY=;
	b=jE5mfwjNiw6UqEz3PqyALyjO+QkzZmLHuscF8/gkGKjq7UbEICf7UUOt3VpyQkKfF8
	rud0lv8ynuvpkXGyJGJknOEwF0qm8tNzrsYNDRrG7Psqn6oYyttmXaWBHaQUXa+i+APL
	i7J9FsPVdEAVDSZV0OOYXLzZ55huEq/gITzggVv4KsteSPfCxUIj3P+Jd/QeS3IQnbcS
	G+rg63dLu7kR8x6vKuUKakRcQLLbWpMIbaorWMF8cL/YOLMpu+2t6GNHLZcKaaHnvZt9
	TojJdPr1b7tUyA3zb/2x8kqpO+y2m8r8re98pwL0Ed+8vZHIUiDLiL0hdEZ8wAT6Nhvz
	vQCQ==
X-Gm-Message-State: APjAAAVMhdk7qLEP2VfwBuFU/fV1bTzRFTQ1m0NzpLKvoxhWMgUM2FyQ
	PRn7YxGhlPxnlKN5ZAqU14qO5037F2ImHwYPm2A=
X-Received: by 2002:ac8:266d:: with SMTP id v42mr4691964qtv.116.1552687969163; 
	Fri, 15 Mar 2019 15:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <CABgYhWf=unSbmTksO+gkUuX+UL3g8HvEuDAeDdxBQVbzci05DQ@mail.gmail.com>
	<CAFEAcA8xqO=iV9oJWWdPHhhDFRmAoegMpwUZQUszXLwG7zS=Hw@mail.gmail.com>
In-Reply-To: <CAFEAcA8xqO=iV9oJWWdPHhhDFRmAoegMpwUZQUszXLwG7zS=Hw@mail.gmail.com>
From: Massimiliano Cialdi <cialdi@gmail.com>
Date: Fri, 15 Mar 2019 23:12:37 +0100
Message-ID: <CABgYhWdu-H6zfWjwwtJbFK6TJa89tqERtX=djYpFobWjir_C6A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d95f7505842956b5"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::843
Subject: Re: [Qemu-arm] QEMU user mode for cortex M
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hu5Le6IvWKtd

--000000000000d95f7505842956b5
Content-Type: text/plain; charset="UTF-8"

I have tried to follow some websites, such as, for example,
https://gnu-mcu-eclipse.github.io/qemu/options/,
http://sushihangover.github.io/arm-cortex-m-semihosting-with-qemu/ or
https://balau82.wordpress.com/2010/11/04/qemu-arm-semihosting/ without
success

I have my exetutable compiled with
/opt/gcc-arm-none-eabi-8-2018-q4-major/bin/arm-none-eabi-gcc -std=gnu11
-mcpu=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv5-d16 -fno-common
-specs=rdimon.specs -Wl,--cref,-Map=main.map main.c -o main.elf

then I try to execute qemu:
~/Downloads/qemu/qemu-3.1.0/arm-softmmu/qemu-system-arm -d
unimp,guest_errors -machine virt -monitor null -serial null  -semihosting
-nographic -semihosting-config enable=on,target=native -kernel main.elf
pflash_write: Unimplemented flash cmd sequence (offset 0000000003fffffc,
wcycle 0x0 cmd 0x0 value 0x80f7)
pflash_write: Unimplemented flash cmd sequence (offset 0000000003ffffcc,
wcycle 0x0 cmd 0x0 value 0xa984)
pflash_write: Unimplemented flash cmd sequence (offset 0000000003ffffd4,
wcycle 0x0 cmd 0x0 value 0x3)
pflash_write: Unimplemented flash cmd sequence (offset 0000000003ffffbc,
wcycle 0x0 cmd 0x0 value 0x1b368)
pflash_write: Unimplemented flash cmd sequence (offset 0000000003ffffc0,
wcycle 0x0 cmd 0x0 value 0x1b304)
pflash_write: Unimplemented flash cmd sequence (offset 0000000003ffffc4,
wcycle 0x0 cmd 0x0 value 0xa6cb)
pflash_write: Unimplemented flash cmd sequence (offset 000000000001b304,
wcycle 0x0 cmd 0x0 value 0x1)
pflash_write: Unimplemented flash cmd sequence (offset 0000000003ffff94,
wcycle 0x0 cmd 0x0 value 0x1b304)
pflash_write: Unimplemented flash cmd sequence (offset 0000000003ffffa4,
wcycle 0x0 cmd 0x0 value 0xa984)
pflash_write: Unimplemented flash cmd sequence (offset 0000000003ffffac,
wcycle 0x0 cmd 0x0 value 0xa617)
pflash_write: Unimplemented flash cmd sequence (offset 0000000003ffff6c,
wcycle 0x0 cmd 0x0 value 0x1b304)
pflash_write: Unimplemented flash cmd sequence (offset 0000000003ffff74,
wcycle 0x0 cmd 0x0 value 0x1)
pflash_write: Unimplemented flash cmd sequence (offset 0000000003ffff78,
wcycle 0x0 cmd 0x0 value 0x7ffffb4)
pflash_write: Unimplemented flash cmd sequence (offset 0000000003ffff84,
wcycle 0x0 cmd 0x0 value 0xa545)
pflash_write: Unimplemented flash cmd sequence (offset 000000000001aac0,
wcycle 0x0 cmd 0x0 value 0x18)
write access to unsupported AArch32 64 bit system register cp:12 opc1: 15
crm:8 (non-secure)


and nothing happend. Where am I wrong? I'm wrong at the compilation stage,
at the execution stage or both? Is there something wrong with the command
line parameters? Which one? How do I force a cortex-m4? How can I force the
Cpu without having to choose any machine?

best regards
Max

On Fri, Mar 15, 2019 at 11:05 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 14 Mar 2019 at 22:30, Massimiliano Cialdi <cialdi@gmail.com>
> wrote:
> >
> > hello,
> > I would like to try some algorithms on cortex M (especially cortex M4).
> I don't need to emulate the whole machine, I just need the user mode.
> > To test the feasibility, I wrote the trivial "hello world".
> >
> > I can compile it with arm-none-eabi-gcc, but the newlib associated with
> it does not implement any syscall.
> > So I tried, on ubuntu, with the cross compiler arm-linux-gnueabihf-gcc
> and its libc6, but the latter is only distributed for cortex A.
> >
> > What do you suggest? Should I recompile the libc6 for cortex M (or do I
> find it pre-compiled)? Should I implement (and how?) syscalls on newlib?
> >
> > In summary, I would need a step-by-step guide to running Cortex M code
> on QEMU arm user mode.
>
> User-mode in Cortex-M is a weird thing to do, because what QEMU
> gives you is the A-profile Linux syscalls. It's a hybrid that
> we only continue to provide because it happens to be used and
> useful to the gcc folks doing compiler testing. I would
> recommend against using it, personally.
>
> System emulation mode will get you something that actually
> works the way the real hardware does. You can then do
> output either via the UART or via semihosting (you need to
> enable the latter on the commandline).
>
> thanks
> -- PMM
>


-- 
Et nunc, auxilium solis, vincam!
Oppugnatio solaris!
VIS!

Massimiliano Cialdi
cialdi@gmail.com

--000000000000d95f7505842956b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r">I have tried to follow some websites, such as, for example, <a href=3D"h=
ttps://gnu-mcu-eclipse.github.io/qemu/options/">https://gnu-mcu-eclipse.git=
hub.io/qemu/options/</a>, <a href=3D"http://sushihangover.github.io/arm-cor=
tex-m-semihosting-with-qemu/">http://sushihangover.github.io/arm-cortex-m-s=
emihosting-with-qemu/</a> or <a href=3D"https://balau82.wordpress.com/2010/=
11/04/qemu-arm-semihosting/">https://balau82.wordpress.com/2010/11/04/qemu-=
arm-semihosting/</a> without success</div><div dir=3D"ltr"><br></div><div>I=
 have my exetutable compiled with</div><div><span style=3D"font-family:mono=
space,monospace">/opt/gcc-arm-none-eabi-8-2018-q4-major/bin/arm-none-eabi-g=
cc -std=3Dgnu11 -mcpu=3Dcortex-m7 -mthumb -mfloat-abi=3Dhard -mfpu=3Dfpv5-d=
16 -fno-common -specs=3Drdimon.specs -Wl,--cref,-Map=3Dmain.map main.c -o m=
ain.elf</span></div><div><br></div><div>then I try to execute qemu:</div><d=
iv><span style=3D"font-family:monospace,monospace">~/Downloads/qemu/qemu-3.=
1.0/arm-softmmu/qemu-system-arm -d unimp,guest_errors -machine virt -monito=
r null -serial null=C2=A0 -semihosting -nographic -semihosting-config enabl=
e=3Don,target=3Dnative -kernel main.elf<br>pflash_write: Unimplemented flas=
h cmd sequence (offset 0000000003fffffc, wcycle 0x0 cmd 0x0 value 0x80f7)<b=
r>pflash_write: Unimplemented flash cmd sequence (offset 0000000003ffffcc, =
wcycle 0x0 cmd 0x0 value 0xa984)<br>pflash_write: Unimplemented flash cmd s=
equence (offset 0000000003ffffd4, wcycle 0x0 cmd 0x0 value 0x3)<br>pflash_w=
rite: Unimplemented flash cmd sequence (offset 0000000003ffffbc, wcycle 0x0=
 cmd 0x0 value 0x1b368)<br>pflash_write: Unimplemented flash cmd sequence (=
offset 0000000003ffffc0, wcycle 0x0 cmd 0x0 value 0x1b304)<br>pflash_write:=
 Unimplemented flash cmd sequence (offset 0000000003ffffc4, wcycle 0x0 cmd =
0x0 value 0xa6cb)<br>pflash_write: Unimplemented flash cmd sequence (offset=
 000000000001b304, wcycle 0x0 cmd 0x0 value 0x1)<br>pflash_write: Unimpleme=
nted flash cmd sequence (offset 0000000003ffff94, wcycle 0x0 cmd 0x0 value =
0x1b304)<br>pflash_write: Unimplemented flash cmd sequence (offset 00000000=
03ffffa4, wcycle 0x0 cmd 0x0 value 0xa984)<br>pflash_write: Unimplemented f=
lash cmd sequence (offset 0000000003ffffac, wcycle 0x0 cmd 0x0 value 0xa617=
)<br>pflash_write: Unimplemented flash cmd sequence (offset 0000000003ffff6=
c, wcycle 0x0 cmd 0x0 value 0x1b304)<br>pflash_write: Unimplemented flash c=
md sequence (offset 0000000003ffff74, wcycle 0x0 cmd 0x0 value 0x1)<br>pfla=
sh_write: Unimplemented flash cmd sequence (offset 0000000003ffff78, wcycle=
 0x0 cmd 0x0 value 0x7ffffb4)<br>pflash_write: Unimplemented flash cmd sequ=
ence (offset 0000000003ffff84, wcycle 0x0 cmd 0x0 value 0xa545)<br>pflash_w=
rite: Unimplemented flash cmd sequence (offset 000000000001aac0, wcycle 0x0=
 cmd 0x0 value 0x18)<br>write access to unsupported AArch32 64 bit system r=
egister cp:12 opc1: 15 crm:8 (non-secure)<br></span><br></div><div><br></di=
v><div>and nothing happend. Where am I wrong? I&#39;m wrong at the compilat=
ion stage, at the execution stage or both? Is there something wrong with th=
e command line parameters? Which one? How do I force a cortex-m4? How can I=
 force the Cpu without having to choose any machine?</div><div><br></div><d=
iv>best regards</div><div>Max<br></div></div></div></div></div></div></div>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Fri, Mar 15, 2019 at 11:05 AM Peter Maydell &lt;<a href=3D"mailto:=
peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 14 Mar 2019 at 22=
:30, Massimiliano Cialdi &lt;<a href=3D"mailto:cialdi@gmail.com" target=3D"=
_blank">cialdi@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; hello,<br>
&gt; I would like to try some algorithms on cortex M (especially cortex M4)=
. I don&#39;t need to emulate the whole machine, I just need the user mode.=
<br>
&gt; To test the feasibility, I wrote the trivial &quot;hello world&quot;.<=
br>
&gt;<br>
&gt; I can compile it with arm-none-eabi-gcc, but the newlib associated wit=
h it does not implement any syscall.<br>
&gt; So I tried, on ubuntu, with the cross compiler arm-linux-gnueabihf-gcc=
 and its libc6, but the latter is only distributed for cortex A.<br>
&gt;<br>
&gt; What do you suggest? Should I recompile the libc6 for cortex M (or do =
I find it pre-compiled)? Should I implement (and how?) syscalls on newlib?<=
br>
&gt;<br>
&gt; In summary, I would need a step-by-step guide to running Cortex M code=
 on QEMU arm user mode.<br>
<br>
User-mode in Cortex-M is a weird thing to do, because what QEMU<br>
gives you is the A-profile Linux syscalls. It&#39;s a hybrid that<br>
we only continue to provide because it happens to be used and<br>
useful to the gcc folks doing compiler testing. I would<br>
recommend against using it, personally.<br>
<br>
System emulation mode will get you something that actually<br>
works the way the real hardware does. You can then do<br>
output either via the UART or via semihosting (you need to<br>
enable the latter on the commandline).<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Et nunc, auxilium solis, vincam!<br>Oppugnatio solaris!<br>=
VIS!<br><br>Massimiliano Cialdi<br><a href=3D"mailto:cialdi@gmail.com" targ=
et=3D"_blank">cialdi@gmail.com</a></div>

--000000000000d95f7505842956b5--

Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1908266lfc;
        Fri, 13 Mar 2020 02:56:49 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsE50jeNAtOjfNPxa7CxLwrJMCUfVbUckXy1rBxB1Ua/HeiO35CV04DQPNzKfsw5ugGDylN
X-Received: by 2002:a37:4b4b:: with SMTP id y72mr11739947qka.175.1584093409179;
        Fri, 13 Mar 2020 02:56:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584093409; cv=none;
        d=google.com; s=arc-20160816;
        b=ngURS7ojWJT06rpVSfsxzZSK9YRrYyV/gzpWkY/RDljs9z5Ejqk2TqIiKbp/mVQi/R
         biLxqAsqE3uBDGMfcDUPDM66PTjW+iEXHQV5WyNH+3Tf9h8RYVbjq1dNfAG7z2zVS3dq
         AqlVyNRSNP47pXu5/ZW9RNb4F9l4KAnLFf2QzeuMn6MlqvuxOU3c4xjw+GnY+zOflI3q
         CRCstrADYxGc6eqL2D7UxAL5ahYkqlPwd3CAonSAfi7TymLn1nqZD5+kYZKFs79cn7Lp
         IOmeQYu7xZmeHjV7J2gcItpLZCF/jdr2VN90LcL/qE+wKcBlGZIe9BAKrncdvJ4gLMHS
         Gozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iqFNBuS9BX4VHZcz5m6JWKYY/FQkC4Xg7FlhPGEfLw0=;
        b=TwnnSPo+k+xDiYG6b5VRfBjypg3t7eaziIKlwLSB1Rk+cxirUYnvE1Ly5GiO0Kgl1i
         XiXmjEekYuCKyFRowXwud3N3yVv43/9w82SFeFvFOUOqW3QGW1/S3QoiDa3ORV8fIYCP
         GwpWo+8bRnEqX+scyuDfC97jMSxnXtSXWjsFpyVCV1cGSxwTJLbOsDdU0lmZ3uu6Edby
         P86f7e77Eli/KbYyVitiPmlWAiEztr8tMR1cA++TEoQ9/NfHr/mEB4CXU0grL+WvNkH2
         CF654evPZw4vdsRQxxZ2Muqe2zVv+B1Avx5SCYZnjaN1X92r65xdesbHoYhWeHO1tSTU
         MGzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=A5cUXiA1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6si4279250qtv.23.2020.03.13.02.56.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 02:56:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=A5cUXiA1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCh3g-00027j-JE
	for alex.bennee@linaro.org; Fri, 13 Mar 2020 05:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50654)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tanaygupta0x00@gmail.com>) id 1jCh3X-00022d-JJ
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 05:56:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tanaygupta0x00@gmail.com>) id 1jCh3W-0004wz-3P
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 05:56:39 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:40030)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <tanaygupta0x00@gmail.com>)
 id 1jCh3V-0004vG-QV
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 05:56:38 -0400
Received: by mail-wm1-x334.google.com with SMTP id z12so365559wmf.5
 for <qemu-arm@nongnu.org>; Fri, 13 Mar 2020 02:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iqFNBuS9BX4VHZcz5m6JWKYY/FQkC4Xg7FlhPGEfLw0=;
 b=A5cUXiA1jfQf61B2fdJpTyoBG5XW0jprDonNcJ8vlE+X1ZaCIHOdYE9eXyHzMB7JAy
 pJ96InRPaNTNpgfVxEriBDhXHiJTjKxOjhd4uKp5IdIFU+AHoN+zZ9p9zhQ/OKXaqp2y
 FtSu2OoIqN4pRW2aMYSODjAFJ6RP6UttzQQ4eAJC6y3KQXwiz8wl5slQvTvMDQVjO2oN
 p+OrMtJa+SjFHUiY1MVvK6NwLhqPDYfcoRLTfR6VPTHOY7khLuGgGu2R+H42FXxvoDBr
 zsfjeE3BPcjZREByn7Rnlrroy6V8Av0KN+qJ4HEhKPocZC4LFCg1E7M77bEzke62kYFo
 3M+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iqFNBuS9BX4VHZcz5m6JWKYY/FQkC4Xg7FlhPGEfLw0=;
 b=nmGE21YaajwWW9OiUUJm+Nh+GNINnI8CFfHBYBvecRcEdnk65yJxK//ll0KmtF6mPn
 ewcp2i7mm6xjlSIiQ5K7aHy+xfIVEUkrUk6CLiawTfOn4wILkbRaJ/9awtH4xVgIptCy
 toO7XIrdzdPyXPtgm8JbeEBzoKuC0Z7KOZi6xWaht0zhnVbdrDcKdhKJNVM6MueA6mEH
 HLa2Gz4CS1upkyYFeJAleG2oD/Z+IekOsv0EK+QSaunUyPxxwjFFCpR8xMEVc2GZjLUR
 Jl/GWCx5oKwSZWthDwaV62syQCQAZjTquzs1ROknKg/4mR8w9qZamcscQEdGG/EbeiYu
 3Fhg==
X-Gm-Message-State: ANhLgQ1l+RDE0v0CGC8jwthppOLi/Sm2yBi2zzetbtjHv/mkjyGegKvU
 4sVqjpQX8FMJeD6i5/Q4jNGSMTicfySVOtcS4U4=
X-Received: by 2002:a1c:2b81:: with SMTP id r123mr10274821wmr.33.1584093396253; 
 Fri, 13 Mar 2020 02:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <CALUW38uZL2PLM=GvBY=6uC=Fp0OE5ABJAKwUgebTEmPX5gK6eA@mail.gmail.com>
 <CAFEAcA8cvbevCQRY2NxqsBAuR+dhjNyfg2Z14CgYCAtQEqT4=w@mail.gmail.com>
In-Reply-To: <CAFEAcA8cvbevCQRY2NxqsBAuR+dhjNyfg2Z14CgYCAtQEqT4=w@mail.gmail.com>
From: Tanay Gupta <tanaygupta0x00@gmail.com>
Date: Fri, 13 Mar 2020 15:26:24 +0530
Message-ID: <CALUW38tX6uQLrgRbgB2jrALouAhyxVgvOkyUskKyUkJqos3Arw@mail.gmail.com>
Subject: Re: Custom ARM Board: Setting BE32 endianness
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000002cc26305a0b97c84"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::334
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lKQjkMFvfzVM

--0000000000002cc26305a0b97c84
Content-Type: text/plain; charset="UTF-8"

Thanks for the help, Peter!

I have referred to the versatilepb board for setting the property.

This is what I'm doing now, in my machine_init:

Object* cpuobj = obj_new(machine->cpu_type);
object_property_set_bool(cpuobj, true, "cfgend", &error_fatal);
object_property_set_bool(cpuobj, true, "realized", &error_fatal);

ARMCPU* armcpu = ARM_CPU(cpuobj);
CPUState* cpu = CPU(armcpu);
cpu_set_pc(cpu, 0x40000000);

<board code>

boot_info.entry = 0x40000000;
arm_load_kernel(armcpu, machine, &boot_info);

In the code above, I am not able to change the pc of the cpu. cpu_set_pc
does set the pc, but its value gets changed back to 0 on the call to
arm_load_kernel.

Could you tell me how I can set the pc in this case?

I don't use the -kernel option, because I'm loading the binaries to memory
in the <board code> section.

Also, I get a segfault if I don't set the "realized" property. Is setting
it like I have the proper way to do it?

Thanks,
Tanay


On Fri, Mar 6, 2020, 8:23 PM Peter Maydell <peter.maydell@linaro.org> wrote:

> On Fri, 6 Mar 2020 at 14:28, Tanay Gupta <tanaygupta0x00@gmail.com> wrote:
> > I'm trying to write my own board, and I'm not quite sure how to set the
> endianness to BE32.
> >
> > I am loading binaries to memory using load_image_targphys_as.
> >
> > I have tried:
> > - passing -cpu arm1136,cfgend=yes
> > - using the setend be instruction
> > - using mrc/mcr to change CP15
>
> BE32 is basically something that's pretty much unused
> by any of the boards that QEMU supports upstream. The
> code is in theory present and should work, but it could
> well have bitrotted. You'll probably have to dive into the
> QEMU sourcecode itself to see what's going on.
>
> The theoretical "right way" is for your board model to set
> the 'cfgend' QOM property when it creates the CPU.
> (None of our in-tree boards do that but you can see a similar
> thing where some boards set has_el2 or has_el3 properties
> on the CPU.) In theory the command line -cpu arm1136,cfgend=yes
> should be equivalent but this relies on the board code you
> have written honouring the user-specified CPU option rather
> than ignoring it. If in doubt, put a breakpoint on
> arm_cpu_realizefn() and check that cpu->cfgend is true and
> that the code in the middle of the function then sets the
> SCTLR_B flag.
>
> > In all the above cases, I check whether the endianness has changed in
> these ways:
> >
> > - xp /10i 0x40000000 in qemu monitor; which prints the LE interpretation
> of the code no matter what I do
>
> I would not necessarily trust this as an indication of what
> QEMU itself is doing; the monitor debug/print path is
> separate from the actual JIT/execution, so you can have
> endianness bugs in one and not the other.
>
> Bear in mind that BE32 is word-invariant big-endian,
> not byte-invariant big-endian, when you try to interpret
> what's going on :-)
>
> It's possible that the bug is just in how we load the
> image into memory. As a test you could try byte-swapping
> every word in the image file and then running it.
>
> QEMU's variety of '-d' options will help in figuring
> out what the JIT is doing, though the output somewhat
> assumes you know a bit about QEMU internals.
>
> thanks
> -- PMM
>

--0000000000002cc26305a0b97c84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks for the help, Peter!<div dir=3D"auto"><br></div><d=
iv dir=3D"auto">I have referred to the versatilepb board for setting the pr=
operty.</div><div dir=3D"auto"><br></div><div dir=3D"auto">This is what I&#=
39;m doing now, in my machine_init:</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Object* cpuobj =3D obj_new(machine-&gt;cpu_type);</div><div dir=
=3D"auto">object_property_set_bool(cpuobj, true, &quot;cfgend&quot;, &amp;e=
rror_fatal);</div><div dir=3D"auto"><span style=3D"font-family:sans-serif">=
object_property_set_bool(cpuobj, true, &quot;realized&quot;, &amp;error_fat=
al);</span><br></div><div dir=3D"auto"><span style=3D"font-family:sans-seri=
f"><br></span></div><div dir=3D"auto"><font face=3D"sans-serif">ARMCPU* arm=
cpu =3D ARM_CPU(cpuobj);</font></div><div dir=3D"auto"><font face=3D"sans-s=
erif">CPUState* cpu =3D CPU(armcpu);</font></div><div dir=3D"auto"><font fa=
ce=3D"sans-serif">cpu_set_pc(cpu, 0x40000000);</font></div><div dir=3D"auto=
"><font face=3D"sans-serif"><br></font></div><div dir=3D"auto"><font face=
=3D"sans-serif">&lt;board code&gt;</font></div><div dir=3D"auto"><font face=
=3D"sans-serif"><br></font></div><div dir=3D"auto"><font face=3D"sans-serif=
">boot_info.entry =3D 0x40000000;</font></div><div dir=3D"auto"><font face=
=3D"sans-serif">arm_load_kernel(armcpu, machine, &amp;boot_info);</font></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">In the code above, I am no=
t able to change the pc of the cpu. cpu_set_pc does set the pc, but its val=
ue gets changed back to 0 on the call to arm_load_kernel.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Could you tell me how I can set the pc in=
 this case?</div><div dir=3D"auto"><br></div><div dir=3D"auto">I don&#39;t =
use the -kernel option, because I&#39;m loading the binaries to memory in t=
he &lt;board code&gt; section.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Also, I get a segfault if I don&#39;t set the &quot;realized&quot; p=
roperty. Is setting it like I have the proper way to do it?</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Tanay<=
/div><br><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Mar 6, 2020, 8:23 PM Peter Maydell &lt;<a href=3D"m=
ailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">On Fri, 6 Mar 2020 at 14:28, Tanay Gup=
ta &lt;<a href=3D"mailto:tanaygupta0x00@gmail.com" target=3D"_blank" rel=3D=
"noreferrer">tanaygupta0x00@gmail.com</a>&gt; wrote:<br>
&gt; I&#39;m trying to write my own board, and I&#39;m not quite sure how t=
o set the endianness to BE32.<br>
&gt;<br>
&gt; I am loading binaries to memory using load_image_targphys_as.<br>
&gt;<br>
&gt; I have tried:<br>
&gt; - passing -cpu arm1136,cfgend=3Dyes<br>
&gt; - using the setend be instruction<br>
&gt; - using mrc/mcr to change CP15<br>
<br>
BE32 is basically something that&#39;s pretty much unused<br>
by any of the boards that QEMU supports upstream. The<br>
code is in theory present and should work, but it could<br>
well have bitrotted. You&#39;ll probably have to dive into the<br>
QEMU sourcecode itself to see what&#39;s going on.<br>
<br>
The theoretical &quot;right way&quot; is for your board model to set<br>
the &#39;cfgend&#39; QOM property when it creates the CPU.<br>
(None of our in-tree boards do that but you can see a similar<br>
thing where some boards set has_el2 or has_el3 properties<br>
on the CPU.) In theory the command line -cpu arm1136,cfgend=3Dyes<br>
should be equivalent but this relies on the board code you<br>
have written honouring the user-specified CPU option rather<br>
than ignoring it. If in doubt, put a breakpoint on<br>
arm_cpu_realizefn() and check that cpu-&gt;cfgend is true and<br>
that the code in the middle of the function then sets the<br>
SCTLR_B flag.<br>
<br>
&gt; In all the above cases, I check whether the endianness has changed in =
these ways:<br>
&gt;<br>
&gt; - xp /10i 0x40000000 in qemu monitor; which prints the LE interpretati=
on of the code no matter what I do<br>
<br>
I would not necessarily trust this as an indication of what<br>
QEMU itself is doing; the monitor debug/print path is<br>
separate from the actual JIT/execution, so you can have<br>
endianness bugs in one and not the other.<br>
<br>
Bear in mind that BE32 is word-invariant big-endian,<br>
not byte-invariant big-endian, when you try to interpret<br>
what&#39;s going on :-)<br>
<br>
It&#39;s possible that the bug is just in how we load the<br>
image into memory. As a test you could try byte-swapping<br>
every word in the image file and then running it.<br>
<br>
QEMU&#39;s variety of &#39;-d&#39; options will help in figuring<br>
out what the JIT is doing, though the output somewhat<br>
assumes you know a bit about QEMU internals.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--0000000000002cc26305a0b97c84--

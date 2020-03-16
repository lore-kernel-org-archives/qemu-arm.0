Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2876424lfc;
        Mon, 16 Mar 2020 04:26:43 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtpXxQLuxOH+KUzvfAYi1QgWRoyHQFVaI/xFzGx9eQFDyrQ7qggOMTEmJpcRvtNlCQaT56z
X-Received: by 2002:a37:b8c2:: with SMTP id i185mr24931296qkf.156.1584358003630;
        Mon, 16 Mar 2020 04:26:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584358003; cv=none;
        d=google.com; s=arc-20160816;
        b=fh9klYKyPC347RGbN7s9bCFFmqO2O5B+9QL4naH6HuQWKvmIqzFryMjuN6U/K5ixym
         DNvIdfDMN4yE50MzdfflB1pMq8HiryTpPxm4Ozed4XV+cToi+KxT1PjKUCUEs2wkl9l5
         5JxMW5kPafTlOnBuSA94xDHNbYGZ19/Gd5CCqHq8KQjQu6+owAeZbU+SWtLM2fMAqIgC
         a58Y4/NJJstGWim+D7qiVuoPZQXcEmA5LMxmVVuREcBFhVa/PBBmObeU7JuKvSwKwkaJ
         xCL5JC09shL+UcztJFYTjZmSGzmDKWHXnHQU+ra3gloZBZK0zJF2JyxqvgzVU2wyN3nu
         DcgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qmRBT4ht7vAIRZgIDIo8i5OnTQRAd5pBtCAhhtA9MXA=;
        b=i15pw52+om+KZNgxonHuMATy3icKgJ2fympOJrjU/s7hTxC0rwCBQI0PkBof3j/FOm
         OH1B0R9M3NPyKbIX1qwraZT32Pd3JoCli6+sVONn6VmyHHGeytTvbUFDlZ9H/uU1GQNZ
         yF9nad8+v/l8KLjzGDpTOIs5AipltzeuVSHBh+nornFqiq9owLqbyfJg/N5qEG+MvFgR
         mlu1GuFZAfYPtjtEqGMHYCRK7QN0TJqVa/90Awllc7YtdbcaunYL1gx7CX9pQIO0/FVg
         GU7/3ej8R+KHHg+FhFurR4xM3AxxB6Cis/+U/upHooEAQhorN9EBpa1sEHO6MGqMOYMv
         4IMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=jIt4Iy7b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r24si3753234qkk.240.2020.03.16.04.26.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Mar 2020 04:26:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=jIt4Iy7b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jDntK-0000I5-IT
	for alex.bennee@linaro.org; Mon, 16 Mar 2020 07:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59984)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tanaygupta0x00@gmail.com>) id 1jDn4r-0006hS-F7
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 06:34:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tanaygupta0x00@gmail.com>) id 1jDn4p-0000rW-By
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 06:34:33 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37869)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <tanaygupta0x00@gmail.com>)
 id 1jDn4o-0000eI-VQ
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 06:34:31 -0400
Received: by mail-wr1-x42f.google.com with SMTP id 6so20482884wre.4
 for <qemu-arm@nongnu.org>; Mon, 16 Mar 2020 03:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qmRBT4ht7vAIRZgIDIo8i5OnTQRAd5pBtCAhhtA9MXA=;
 b=jIt4Iy7bQDBB8ClJ9BK6smKIwd+5xjA3qAPWgyb03QtIg1GjqISmq5hZqtCv9rZBGP
 PK7GR4NMy03MwHtWicY1PvoDC80ydiVRDyCBwbT+X5D7BJFJ0/h+7YacerLdwRx5VxIw
 5nFf7N9c6Wivikd7TOEBVHY0DRFierTvCjNM9cNkEiU2UPGjkCbQoSFYMVUEdcCtcFrn
 IRrzXf478y/8PukJyuFGw1WKIPlwi38r5rCCxvJRPPaZrqH6fuXoq8ort1S9XqFlNzZQ
 0JINqJs5DWPNIpd+lgMphYdlwAHEuMjRXok4sO76ML8ghnXEwxtk8C98sPpc3S2VbMaE
 qWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qmRBT4ht7vAIRZgIDIo8i5OnTQRAd5pBtCAhhtA9MXA=;
 b=td+SJ3QwkMIqv387baEkMt23v/ILI+euTJFzFt2eNcVfmtYLeRhksesuS1TFUQR4os
 q4duCgoAn4YHAQbxIwJ3ycQpQF4mfvKQPnfqw3lmA0Uk/ULx9EpJXpAXe9h8KTQJ9zGY
 zbiHCzODKrRWK/xVV4tbghNKyZWLvPgWkfyjonzKvHFzSogvHt17Tx1O81db719rLxN1
 Q/CGmXrUQg5UTmiVfoJ7hgupV/CA0VSbi2uICd7DyP2ESH9iHMj6pRJbtjNIf0TLUXKh
 jGHfxe69yP/3IqrGXu2flW2vAgiTe/YaHCBiJNKOWnUDncFJ9DDL1FrCcmH87k3Do9U6
 jtqA==
X-Gm-Message-State: ANhLgQ2VPd6W1+1F4wT94WUl3QTt6ZWvUnmePLY68eeLum3Fq8/Gv2cC
 8h3A2aybGXZiM0zgSoIe0RDz8j0qasbeD9WchwQ=
X-Received: by 2002:adf:ed47:: with SMTP id u7mr16849972wro.190.1584354868872; 
 Mon, 16 Mar 2020 03:34:28 -0700 (PDT)
MIME-Version: 1.0
References: <CALUW38uZL2PLM=GvBY=6uC=Fp0OE5ABJAKwUgebTEmPX5gK6eA@mail.gmail.com>
 <CAFEAcA8cvbevCQRY2NxqsBAuR+dhjNyfg2Z14CgYCAtQEqT4=w@mail.gmail.com>
 <CALUW38tX6uQLrgRbgB2jrALouAhyxVgvOkyUskKyUkJqos3Arw@mail.gmail.com>
 <CAFEAcA9dErKNP-fw9fytp0pOp=HrgKvjb4RjuPXVk09g1VCHAQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9dErKNP-fw9fytp0pOp=HrgKvjb4RjuPXVk09g1VCHAQ@mail.gmail.com>
From: Tanay Gupta <tanaygupta0x00@gmail.com>
Date: Mon, 16 Mar 2020 16:04:17 +0530
Message-ID: <CALUW38sMOQzvH3XrkiwqvqjsZrUJUyvCXRg7hr9b5pzDzOPkjg@mail.gmail.com>
Subject: Re: Custom ARM Board: Setting BE32 endianness
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000002847eb05a0f65dc7"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42f
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
X-TUID: n8xN52OWxEu7

--0000000000002847eb05a0f65dc7
Content-Type: text/plain; charset="UTF-8"

Hey Peter!

I used the loader device to set the pc, and it works.

I also set the breakpoint in gdb on arm_cpu_realizefn, and the function is
setting the SCTLR_B flag like it should.

After that, I used "-d in_asm" to log target disassembly, as you suggested.
The output in that log still shows the little endian interpretation of the
code. Is there anything else that I need to change? What can I do to debug
this?

Also, I've tried to change the endianness from the inside, by running a
"correction" program, and then jumping to the actual start point. "setend
be" and setting the CP15 register, both don't work. Are these methods not
supported?

Thanks very much for your help.

- Tanay

On Fri, Mar 13, 2020, 3:41 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Fri, 13 Mar 2020 at 09:56, Tanay Gupta <tanaygupta0x00@gmail.com>
> wrote:
> >
> > Thanks for the help, Peter!
> >
> > I have referred to the versatilepb board for setting the property.
> >
> > This is what I'm doing now, in my machine_init:
> >
> > Object* cpuobj = obj_new(machine->cpu_type);
> > object_property_set_bool(cpuobj, true, "cfgend", &error_fatal);
> > object_property_set_bool(cpuobj, true, "realized", &error_fatal);
> >
> > ARMCPU* armcpu = ARM_CPU(cpuobj);
> > CPUState* cpu = CPU(armcpu);
> > cpu_set_pc(cpu, 0x40000000);
> >
> > <board code>
> >
> > boot_info.entry = 0x40000000;
>
> The 'entry' field in boot_info is used internally by
> arm_load_kernel(): you are not supposed to set it
> yourself.
>
> > arm_load_kernel(armcpu, machine, &boot_info);
> >
> > In the code above, I am not able to change the pc of the cpu. cpu_set_pc
> does set the pc, but its value gets changed back to 0 on the call to
> arm_load_kernel.
> >
> > Could you tell me how I can set the pc in this case?
>
> Don't try to set the PC from board code. Follow the
> way other boards work, and you will usually find
> things go easier.
>
> > I don't use the -kernel option, because I'm loading the binaries to
> memory in the <board code> section.
>
> Roughly, QEMU for Arm has three expected ways to start:
>  * loading a Linux kernel, which is booted via the kernel
>    specification for how you start a kernel (this happens
>    if you use -kernel and pass it something that is not
>    an ELF file)
>  * loading an ELF file, in which case execution starts
>    at the ELF entrypoint (if you use -kernel with an ELF,
>    or if you use the "generic loader")
>  * running a "bios/boot rom", which is expected to be
>    loaded into memory/flash by the board code in the
>    right place so that when the CPU starts execution
>    from its normal default reset address it will run the
>    boot code
>
> If the files you're loading to memory work like
> the 'boot rom' then you can load them in the board
> code, but you should not then be needing to set the
> PC at all, because they should be in the right place
> for the reset PC (which is either 0, or 0xffff0000
> if the CPU is one which sets SCTLR.V on reset.)
>
> Otherwise, you can use the 'generic loader' device
> (see docs/generic-loader.txt) to load files, set the PC,
> etc. (If your binary is an ELF file the PC gets set from
> its entry point.)
>
> > Also, I get a segfault if I don't set the "realized" property. Is
> setting it like I have the proper way to do it?
>
> Yes. QEMU devices have a multi-stage initialization:
>  * init the device
>  * set properties on it
>  * "realize" it
>
> The realize step is the final "all device properties
> have been set, complete initialization" part. Trying
> to use a device that has not been realized is a bug
> and will cause random bad behaviour like crashes.
>
> thanks
> -- PMM
>

--0000000000002847eb05a0f65dc7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hey Peter!<div dir=3D"auto"><br></div><div dir=3D"auto">I=
 used the loader device to set the pc, and it works.</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">I also set the breakpoint in gdb on arm_cpu_re=
alizefn, and the function is setting the SCTLR_B flag like it should.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">After=C2=A0that, I used &quot=
;-d in_asm&quot; to log target disassembly, as you suggested. The output in=
 that log still shows the little endian interpretation of the code. Is ther=
e anything else that I need to change? What can I do to debug this?</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Also, I&#39;ve tried to change =
the endianness from the inside, by running a &quot;correction&quot; program=
, and then jumping to the actual start point. &quot;setend be&quot; and set=
ting the CP15 register, both don&#39;t work. Are these methods not supporte=
d?</div><br>Thanks very=C2=A0much for your help.<div dir=3D"auto"><br></div=
><div dir=3D"auto">- Tanay<br><br><div class=3D"gmail_quote" dir=3D"auto"><=
div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 13, 2020, 3:41 PM Peter Ma=
ydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, 13 Mar 2=
020 at 09:56, Tanay Gupta &lt;<a href=3D"mailto:tanaygupta0x00@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">tanaygupta0x00@gmail.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt; Thanks for the help, Peter!<br>
&gt;<br>
&gt; I have referred to the versatilepb board for setting the property.<br>
&gt;<br>
&gt; This is what I&#39;m doing now, in my machine_init:<br>
&gt;<br>
&gt; Object* cpuobj =3D obj_new(machine-&gt;cpu_type);<br>
&gt; object_property_set_bool(cpuobj, true, &quot;cfgend&quot;, &amp;error_=
fatal);<br>
&gt; object_property_set_bool(cpuobj, true, &quot;realized&quot;, &amp;erro=
r_fatal);<br>
&gt;<br>
&gt; ARMCPU* armcpu =3D ARM_CPU(cpuobj);<br>
&gt; CPUState* cpu =3D CPU(armcpu);<br>
&gt; cpu_set_pc(cpu, 0x40000000);<br>
&gt;<br>
&gt; &lt;board code&gt;<br>
&gt;<br>
&gt; boot_info.entry =3D 0x40000000;<br>
<br>
The &#39;entry&#39; field in boot_info is used internally by<br>
arm_load_kernel(): you are not supposed to set it<br>
yourself.<br>
<br>
&gt; arm_load_kernel(armcpu, machine, &amp;boot_info);<br>
&gt;<br>
&gt; In the code above, I am not able to change the pc of the cpu. cpu_set_=
pc does set the pc, but its value gets changed back to 0 on the call to arm=
_load_kernel.<br>
&gt;<br>
&gt; Could you tell me how I can set the pc in this case?<br>
<br>
Don&#39;t try to set the PC from board code. Follow the<br>
way other boards work, and you will usually find<br>
things go easier.<br>
<br>
&gt; I don&#39;t use the -kernel option, because I&#39;m loading the binari=
es to memory in the &lt;board code&gt; section.<br>
<br>
Roughly, QEMU for Arm has three expected ways to start:<br>
=C2=A0* loading a Linux kernel, which is booted via the kernel<br>
=C2=A0 =C2=A0specification for how you start a kernel (this happens<br>
=C2=A0 =C2=A0if you use -kernel and pass it something that is not<br>
=C2=A0 =C2=A0an ELF file)<br>
=C2=A0* loading an ELF file, in which case execution starts<br>
=C2=A0 =C2=A0at the ELF entrypoint (if you use -kernel with an ELF,<br>
=C2=A0 =C2=A0or if you use the &quot;generic loader&quot;)<br>
=C2=A0* running a &quot;bios/boot rom&quot;, which is expected to be<br>
=C2=A0 =C2=A0loaded into memory/flash by the board code in the<br>
=C2=A0 =C2=A0right place so that when the CPU starts execution<br>
=C2=A0 =C2=A0from its normal default reset address it will run the<br>
=C2=A0 =C2=A0boot code<br>
<br>
If the files you&#39;re loading to memory work like<br>
the &#39;boot rom&#39; then you can load them in the board<br>
code, but you should not then be needing to set the<br>
PC at all, because they should be in the right place<br>
for the reset PC (which is either 0, or 0xffff0000<br>
if the CPU is one which sets SCTLR.V on reset.)<br>
<br>
Otherwise, you can use the &#39;generic loader&#39; device<br>
(see docs/generic-loader.txt) to load files, set the PC,<br>
etc. (If your binary is an ELF file the PC gets set from<br>
its entry point.)<br>
<br>
&gt; Also, I get a segfault if I don&#39;t set the &quot;realized&quot; pro=
perty. Is setting it like I have the proper way to do it?<br>
<br>
Yes. QEMU devices have a multi-stage initialization:<br>
=C2=A0* init the device<br>
=C2=A0* set properties on it<br>
=C2=A0* &quot;realize&quot; it<br>
<br>
The realize step is the final &quot;all device properties<br>
have been set, complete initialization&quot; part. Trying<br>
to use a device that has not been realized is a bug<br>
and will cause random bad behaviour like crashes.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div></div>

--0000000000002847eb05a0f65dc7--

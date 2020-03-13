Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1924256lfc;
        Fri, 13 Mar 2020 03:12:08 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsGQsgeIKT2Ilw3f72y4uHi2pdQn9wtamB1GuOiSxJ0ZI7ccFW1V7PxXC0E8Xy15vI5t/I+
X-Received: by 2002:ac8:47d9:: with SMTP id d25mr11581923qtr.134.1584094328722;
        Fri, 13 Mar 2020 03:12:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584094328; cv=none;
        d=google.com; s=arc-20160816;
        b=u4rRadB2xRM2w8GUiRPjqIdCQ26Fi3VsOhErIDalO33mWHKTmRQkqJs2ivoBQkThwp
         3kOKeodMbvz3GPDaHDEdkQMPtJXMy/aV2xRkpWJi7jRbnaI//orW/bj+Iax6Dvf8xvz2
         x0lEk6bd8X2hNAkm93dzo4FOWNRuX+cFekq5LPCurU/+NV8Gkk3oLSzvfApbu19WhdaM
         aQaUcou8mmiybWFmU69ClTOP+0b3VLRE9KnpL1SoWag+hH+g0+2QdmqHTrsvd7HiyjA/
         QhPAfkZ0gFHPnApujC+j2NDMkMW2c87NO7vh8bRLFfXRE1OjxyNeGmbNVh/4oGTj852Z
         d6rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/+WIAbLPiSfNKPrmZZl+CntpGyw5jBHXk+8QnsmdbE8=;
        b=d/4C8oJrK+97zVWKdFFeQdKhx6+GU5tmukiag5B2CJHt9jacVLxkQW9xKPB7oH3x6L
         vupEeVnvMgHeo3HUw/hR6K+AyLQm/NEokmE/+mfvDYeChi/3RiV0tZZsLKgMpR7f8cAI
         VThcjklAbINSB6sO/mj4EBEz0xBMOVb2/LFVRW+6sHEdyfRU6Bnw1X18yvKUwUQMc8zL
         PdjtowhbdJt6PWGv3FTSf667OGQlVn66QBUcIZOFk3+1ecE1rK3HSqBBZuUwOUsk8086
         47xDq7/htwL7u7YV9GxAhmdtQ+LgTvM8G4o3oTyCayF8i1FkIHtw+r0QZadTUhHOM7BL
         pzyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lwdEBtYe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7si4759547qkc.248.2020.03.13.03.12.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 03:12:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lwdEBtYe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jChIV-0001qR-Vr
	for alex.bennee@linaro.org; Fri, 13 Mar 2020 06:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44023)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jChIO-0001q8-LR
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 06:12:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jChIN-0002e2-8s
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 06:12:00 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:36535)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jChIN-0002cK-2m
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 06:11:59 -0400
Received: by mail-ot1-x342.google.com with SMTP id j14so9520244otq.3
 for <qemu-arm@nongnu.org>; Fri, 13 Mar 2020 03:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/+WIAbLPiSfNKPrmZZl+CntpGyw5jBHXk+8QnsmdbE8=;
 b=lwdEBtYe0ofHO1t6NB4YNvrhPZq3pOjOyzB1C6IqsBwspv+d3gImR3rhGk5dQn7iwt
 dlPi47JJ/50nErAzFd8H8DKJyWS9NF0ey+Xro4agTRruVeXttPZ2kZ1imVWdCgm2dVrI
 dqEVfo+W59v9UW3Zw0KJJ68u/6F9jwpUdaUmQax/HHjnlwEa11zEpsw9zIRxoylJcSJi
 U8OdWtMGMXAXmqkP4jioJ7LkQJDjvxVJ6Wb43Vg5eR9zMCKvX+JiGl2Nx+dcdbKHNAIJ
 YMDLseGZ7D01FLDlQ3oBp9XQYo5LfyZZ6EI5f1tdW6gn9bjLWHJSHtb785bJtJ3sT9oA
 NlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/+WIAbLPiSfNKPrmZZl+CntpGyw5jBHXk+8QnsmdbE8=;
 b=J34vGELXKgOFFFzXQYELrOUjkRpAmGaNQQ4mZ7AZcFVqubUlT9g7z7/b+/t12t6E97
 m9aa9YLD99n1qJOmhghPMqstIIQrht/lAJ2NiM8baLWKIXnAlOHxyIfSju4e56g7vvzD
 uA8xVr4P6SVHURw4X/QWOYut02NE+kNBnbSWKD8dC/RT16FGCUykryUQB9GZ90s6bvwA
 Sz95NLY9zaSIOp8gzySTi7nYiZMu6xCCf8g/JnMTVYHBUUi9OTsb10RlsY/ZWdXUmPN8
 /DJguAfrRcAomtXGjJ7Aka7bdUWeMvpz5jxQW6uZvpflE4eAr8/avXblnNdJTgDagzvJ
 +STg==
X-Gm-Message-State: ANhLgQ076YRRqEJZ+A+QGUmGkkTdCyZGl8x5mDv3B0/3s30Vtbqm3bJw
 tjOQVBfFhxtHxrlzoZp5t2fFWiQYqFpE5Xm8YNrdBQ==
X-Received: by 2002:a9d:1d43:: with SMTP id m61mr1287287otm.91.1584094317917; 
 Fri, 13 Mar 2020 03:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <CALUW38uZL2PLM=GvBY=6uC=Fp0OE5ABJAKwUgebTEmPX5gK6eA@mail.gmail.com>
 <CAFEAcA8cvbevCQRY2NxqsBAuR+dhjNyfg2Z14CgYCAtQEqT4=w@mail.gmail.com>
 <CALUW38tX6uQLrgRbgB2jrALouAhyxVgvOkyUskKyUkJqos3Arw@mail.gmail.com>
In-Reply-To: <CALUW38tX6uQLrgRbgB2jrALouAhyxVgvOkyUskKyUkJqos3Arw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Mar 2020 10:11:46 +0000
Message-ID: <CAFEAcA9dErKNP-fw9fytp0pOp=HrgKvjb4RjuPXVk09g1VCHAQ@mail.gmail.com>
Subject: Re: Custom ARM Board: Setting BE32 endianness
To: Tanay Gupta <tanaygupta0x00@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
X-TUID: 76kA348y0lPL

On Fri, 13 Mar 2020 at 09:56, Tanay Gupta <tanaygupta0x00@gmail.com> wrote:
>
> Thanks for the help, Peter!
>
> I have referred to the versatilepb board for setting the property.
>
> This is what I'm doing now, in my machine_init:
>
> Object* cpuobj = obj_new(machine->cpu_type);
> object_property_set_bool(cpuobj, true, "cfgend", &error_fatal);
> object_property_set_bool(cpuobj, true, "realized", &error_fatal);
>
> ARMCPU* armcpu = ARM_CPU(cpuobj);
> CPUState* cpu = CPU(armcpu);
> cpu_set_pc(cpu, 0x40000000);
>
> <board code>
>
> boot_info.entry = 0x40000000;

The 'entry' field in boot_info is used internally by
arm_load_kernel(): you are not supposed to set it
yourself.

> arm_load_kernel(armcpu, machine, &boot_info);
>
> In the code above, I am not able to change the pc of the cpu. cpu_set_pc does set the pc, but its value gets changed back to 0 on the call to arm_load_kernel.
>
> Could you tell me how I can set the pc in this case?

Don't try to set the PC from board code. Follow the
way other boards work, and you will usually find
things go easier.

> I don't use the -kernel option, because I'm loading the binaries to memory in the <board code> section.

Roughly, QEMU for Arm has three expected ways to start:
 * loading a Linux kernel, which is booted via the kernel
   specification for how you start a kernel (this happens
   if you use -kernel and pass it something that is not
   an ELF file)
 * loading an ELF file, in which case execution starts
   at the ELF entrypoint (if you use -kernel with an ELF,
   or if you use the "generic loader")
 * running a "bios/boot rom", which is expected to be
   loaded into memory/flash by the board code in the
   right place so that when the CPU starts execution
   from its normal default reset address it will run the
   boot code

If the files you're loading to memory work like
the 'boot rom' then you can load them in the board
code, but you should not then be needing to set the
PC at all, because they should be in the right place
for the reset PC (which is either 0, or 0xffff0000
if the CPU is one which sets SCTLR.V on reset.)

Otherwise, you can use the 'generic loader' device
(see docs/generic-loader.txt) to load files, set the PC,
etc. (If your binary is an ELF file the PC gets set from
its entry point.)

> Also, I get a segfault if I don't set the "realized" property. Is setting it like I have the proper way to do it?

Yes. QEMU devices have a multi-stage initialization:
 * init the device
 * set properties on it
 * "realize" it

The realize step is the final "all device properties
have been set, complete initialization" part. Trying
to use a device that has not been realized is a bug
and will cause random bad behaviour like crashes.

thanks
-- PMM

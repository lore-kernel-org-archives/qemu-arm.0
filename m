Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4454419ejb;
        Tue, 13 Dec 2022 10:11:27 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6+bhfZ5tZk1dP5CXww22pbh5l1kigrDkmgHotcycjnPpn8mAmpD8rD2jubV74NN2uEmrHe
X-Received: by 2002:a17:906:4d8f:b0:7c0:e535:13fc with SMTP id s15-20020a1709064d8f00b007c0e53513fcmr22917514eju.37.1670955087197;
        Tue, 13 Dec 2022 10:11:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670955087; cv=none;
        d=google.com; s=arc-20160816;
        b=CN1XuXULCS4KxhYlw4hK4SjEpsEKjxxhnpMyEs48W62Dn8IXM1/MkW5Iaa4W9rBOIM
         bxX2sZV8War2RELQuQpyQ5o8ah1AKXiw2LsbZUdw9N9nCv5WP5Xd+1GfmDwnggqoS4q3
         vyzrJJGJneM2FDx7O0icVvIuhFVOYKJpry4768kCAuvAxSvSyKUwFzw412DMDhP7y69g
         dRXB+OKOJObr0+TIFvkAyiOdEVnquaOtIWZW8lnuFEFLH4DOfE5IfxSVXMdY+pqagDnu
         qz5m/LlfJtapjpen/N5o3g2UaU9E9ygb1rDbAi5LJC4h88IzN5ovkpSnEoxTUvOLJCqu
         OpJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date;
        bh=2mYWztJDjTiRDVc2lEoGiQL8aee3j42iDCWIGY6Q90s=;
        b=A4wwVI1MS0D2CtKNcf7V5H6rGw/INNamueqKaNoXuOd7loHJFw79yB4YQeCzYtdYEQ
         jZMI1Tf+oflPMq73v7Ll1wK2rHRetwxsX8MjfHu33EKib5zYw19UrDc+Yk5Hh8U8egen
         1kGim4DNBkUvatOEkPqWOOXjQtqSpIuEkmcy06G++BJxQwDKQ8o+PX+x6F5Z03Pf2AYc
         M7M83824k2R5uEY5l301EvpJodOlcvgkPU8uwSuM4653uNyPUVxigFMRgMHuFIJYA0hF
         KQ492Rcvzn2Cfrf8Mn92FbqWj0Hh/GgxZgRlhVBgDgrtgZbc9JvWNpeh8nly1MWfkST6
         dTUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of balaton@eik.bme.hu designates 152.66.115.2 as permitted sender) smtp.mailfrom=balaton@eik.bme.hu;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <balaton@eik.bme.hu>
Received: from zero.eik.bme.hu (zero.eik.bme.hu. [152.66.115.2])
        by mx.google.com with ESMTPS id wc16-20020a170907125000b007aea5ae3956si6238287ejb.820.2022.12.13.10.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 10:11:27 -0800 (PST)
Received-SPF: pass (google.com: domain of balaton@eik.bme.hu designates 152.66.115.2 as permitted sender) client-ip=152.66.115.2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of balaton@eik.bme.hu designates 152.66.115.2 as permitted sender) smtp.mailfrom=balaton@eik.bme.hu;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 787C0748131;
	Tue, 13 Dec 2022 19:09:51 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 26DAC74812F; Tue, 13 Dec 2022 19:09:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id 24B2674810A;
	Tue, 13 Dec 2022 19:09:51 +0100 (CET)
Date: Tue, 13 Dec 2022 19:09:51 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
cc: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
    qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
    =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, 
    Alistair Francis <alistair@alistair23.me>, 
    David Gibson <david@gibson.dropbear.id.au>, 
    Jason Wang <jasowang@redhat.com>, Greg Kurz <groug@kaod.org>, 
    qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
    qemu-ppc@nongnu.org
Subject: Re: [RFC PATCH-for-8.0 1/3] hw/ppc: Replace tswap32() by
 const_le32()
In-Reply-To: <CAFEAcA8WF6GXaPt6+=KbaLSP5w+r1dps6fcc21+Um3VFAPDp5A@mail.gmail.com>
Message-ID: <e3ce4608-c516-568b-df37-8446fbe6735b@eik.bme.hu>
References: <20221213125218.39868-1-philmd@linaro.org> <20221213125218.39868-2-philmd@linaro.org> <8d47b826-2011-3203-c682-aa32a76b8dc2@linaro.org> <d73fe725-565e-7fcb-e7d3-846189459545@linaro.org> <a1f4b5a6-0a8a-5a04-8ab6-f3f08b9d36aa@linaro.org>
 <CAFEAcA_F3Z+UPW-wHs8xedYX3TiV8CRQAom0DhefKLFH_Ejgog@mail.gmail.com> <b46e4c40-257f-8a89-85b8-8c2806f395be@linaro.org> <10186d7a-2df0-2fcf-8eef-8e34bcc2d8cc@kaod.org> <CAFEAcA8WF6GXaPt6+=KbaLSP5w+r1dps6fcc21+Um3VFAPDp5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-1281552382-1670954991=:38442"
X-Spam-Checker-Version: Sophos PMX: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2022.12.13.180018, AntiVirus-Engine: 5.95.0, AntiVirus-Data: 2022.12.13.5950000
X-Spam-Flag: NO
X-Spam-Probability: 9%
X-Spam-Level: 
X-Spam-Status: No, score=9% required=50%
X-TUID: cHubhOtl726m

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1281552382-1670954991=:38442
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 13 Dec 2022, Peter Maydell wrote:
> On Tue, 13 Dec 2022 at 16:53, Cédric Le Goater <clg@kaod.org> wrote:
>> On 12/13/22 17:27, Richard Henderson wrote:
>>> On 12/13/22 10:21, Peter Maydell wrote:
>>>> It does seem odd, though. We have a value in host endianness
>>>> (the EPAPR_MAGIC constant, which is host-endian by virtue of
>>>> being a C constant). But we're storing it to env->gpr[], which
>>>> is to say the CPUPPCState general purpose register array. Isn't
>>>> that array *also* kept in host endianness order?
>>>
>>> Yes indeed.
>>>
>>>> If so, then the right thing here is "don't swap at all",
>>>
>>> So it would seem...
>>>
>>>> i.e. just "env->gpr[6] = EPAPR_MAGIC;". But that would imply
>>>> that the current code is setting the wrong value for the GPR
>>>> on little-endian hosts, which seems a bit unlikely...
>>>
>>> ... unless this board has only been tested on matching hosts.

I can't remember the details but I think I've had no tswap in sam460ex 
first but that did not work and had to add it but I've probably looked at 
other examples and did not really understand why this was needed. I tested 
on x86_64 so not matching host. The board firmware has some reference to 
this magic value in:

qemu/roms/u-boot-sam460ex/arch/powerpc/lib/bootm.c::boot_jump_linux()

I don't know what it does with it but I think kernel expects it in big 
endian and what we put there should match what U-Boor does (if this is 
actually used on sam460ex which I'm not sure about). The Linux kernel I've 
tested with back then was probably from Ubuntu_16.04 or Debian Jessie 
which supported this board. Not sure this helps but that's all I can 
gather now but I may remember wrong.

Regards,
BALATON Zoltan

>> But these are register default values. Endianness doesn't apply
>> there. Doesn't it ?
>
> Any time you have a value that's more than 1 byte wide,
> endianness applies in some sense :-) We choose for our
> emulated CPUs typically to keep register values in struct
> fields and variables in the C code in host endianness. This
> is the "obvious" choice given that you want to be able to
> do things like do a simple host add to emulate a guest CPU
> add, but in theory you could store the values the other
> way around if you wanted (then "store register into RAM"
> would be trivial, and "add 1 to register" would require
> extra effort; currently it's the other way round.)
>
> Anyway, I think that in the virtex_ml507 and sam460ex code
> the use of tswap32() should be removed. In hw/ppc/e500.c
> we get this right:
>    env->gpr[6] = EPAPR_MAGIC;
>
> We have a Linux kernel boot test in the avocado tests for
> virtex_ml507 -- we really do set up this magic value wrongly
> afaict, but it seems like the kernel doesn't check it (the
> test passes regardless of whether we swap the value or not).
>
> I think what has happened here is that this bit of code is
> setting up CPU registers for an EPAPR style boot, but the
> test kernel at least doesn't expect that. It boots via the
> code in arch/powerpc/kernel/head_44x.S. That file claims
> in a comment that it expects
> *   r3 - Board info structure pointer (DRAM, frequency, MAC address, etc.)
> *   r4 - Starting address of the init RAM disk
> *   r5 - Ending address of the init RAM disk
> *   r6 - Start of kernel command line string (e.g. "mem=128")
> *   r7 - End of kernel command line string
>
> but actually it only cares that r3 == device-tree-blob.
>
> Documentation/powerpc/booting.rst says the expectation
> (for a non-OpenFirmware boot) is:
>                r3 : physical pointer to the device-tree block
>                (defined in chapter II) in RAM
>
>                r4 : physical pointer to the kernel itself. This is
>                used by the assembly code to properly disable the MMU
>                in case you are entering the kernel with MMU enabled
>                and a non-1:1 mapping.
>
>                r5 : NULL (as to differentiate with method a)
>
> which isn't the same as what the kernel code actually cares about
> or what the kernel's comment says it cares about...
>
> So my guess about what's happening here is that the intention
> was that these boards should be able to boot both kernels built
> to be entered directly in the way booting.rst says, and also
> kernels and other guest programs built to assume boot by
> EPAPR firmware, but this bug means that we're only currently
> supporting the first of these two categories. The reason nobody's
> noticed before is presumably that in practice nobody's trying to
> boot the "built to boot from EPAPR firmware" type binary on
> these two boards.
>
> TLDR: we should drop the "tswap32()" entirely from both files.
>
> thanks
> -- PMM
>
>
--3866299591-1281552382-1670954991=:38442--

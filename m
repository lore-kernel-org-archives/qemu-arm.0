Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp2290863lfj;
        Mon, 16 May 2022 15:26:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypV58QQ2ySg1IUjM5FP39aVTgvj6nIMEacMZA5I7/1Zcnh3HPcb5j6TejSPX2BTjv6Y/LY
X-Received: by 2002:a05:6214:23c8:b0:45f:b582:346e with SMTP id hr8-20020a05621423c800b0045fb582346emr17279226qvb.109.1652739988120;
        Mon, 16 May 2022 15:26:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652739988; cv=none;
        d=google.com; s=arc-20160816;
        b=NWpISX+u5DI0ybXPvJvntxVZFveQuR0YOGx5ReCd3b1g1M3+clIJFWnlzaKL2FNq/Q
         7P7AMGlAbWzjw9dlxm8xJA+dFvOgXu7lLlFQxYifcVvMpPiW/BG/bA5Oo1H+fl2PcTWg
         DVDf1XryLxXVUbH4T347Yiv35F/b667QyGZ9L/tMRpAyT2S+dPzk3/EPlQq5QSUaZF9n
         qc1gZmKqjwCh69hYmkScP2jvNDKsXIT1xEHQsqxhLUoQ3i/MOanWFV/ceXg9GleOCC0s
         jodqJaJv3fslQOLtW4pd5cCUJxCy8nm9rouPvqFl7M8zDoeWp0zLGgzC2Lu2sKW9OccW
         L91g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=JbHkPKm9kt+6S9yttCeGy727PGAe86BStuywOUBpYzk=;
        b=flLPvnp2w5ME1IfparEXHK9cC1iC1hbHSQ8m0OOzV1lfBbsj0oF6s4TLu96A0JvfJe
         bG95YZs/VcRqZMU2XE+qE/wY27zj24wbMDrYDPRtpaLSN3AbESsZjy6nQBFZuS3YNpCD
         o95/6wEoqc02WpR2/LDBSNmb1VnWgJKn/0uc+wof6NPzXsrgPn8SUmT9UfSruUDZtrbA
         1qG4B4/gOu8gvGIZxSbQl8XvuzfY06g0Sp6T2pOUZ6ex80za3nqgKapK58Qb02ZiESfi
         8O1n5FcTRlacM8Jvt1ybf130+k7yN7VywGrcLu13RT+Mmqlbc7dtYa+QXDZTgDFc21Ja
         +GWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@asu-edu.20210112.gappssmtp.com header.s=20210112 header.b=bBvUK1oB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=asu.edu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4-20020a05620a0e8400b006a00259793fsi5828594qkm.460.2022.05.16.15.26.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 May 2022 15:26:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@asu-edu.20210112.gappssmtp.com header.s=20210112 header.b=bBvUK1oB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=asu.edu
Received: from localhost ([::1]:48622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nqjAZ-0006sQ-Ki
	for alex.bennee@linaro.org; Mon, 16 May 2022 18:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgutbub@asu.edu>) id 1nqjAM-0006s5-79
 for qemu-arm@nongnu.org; Mon, 16 May 2022 18:26:14 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:39549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jgutbub@asu.edu>) id 1nqjAJ-00062M-JO
 for qemu-arm@nongnu.org; Mon, 16 May 2022 18:26:13 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 z15-20020a9d65cf000000b00605f064482cso11041423oth.6
 for <qemu-arm@nongnu.org>; Mon, 16 May 2022 15:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=asu-edu.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JbHkPKm9kt+6S9yttCeGy727PGAe86BStuywOUBpYzk=;
 b=bBvUK1oBZAgu/No52wVlJ66uJ+Y+oYXG/GJJtUBpqSPYyc0JECyTil2IntUmxIP58l
 WwK/vWKSsc0rwej7Jrlp9XqPmvQ2OTIDcfaQMNj43AQVw02XC6pgTX4cJmAFWFaT3Tsv
 dKU7PE5R0DUclgnOro8WX1pul0whLEOwbzDam9SyIJAH3+t0SpqXHoG1BojL+FWRDKim
 QIaymzIfzN4QT7VsT/DRzi86QBywhdHskPBcqAtoYBA4i/H2bSdtuqDVRE5hx4AsJmnC
 /yMCVZzQZpzHfGZ5YuTe+jovAUXlkO81ZKJASqs+HyVEfcDd6E5P6U0oskL5ryf3+hyj
 mtTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JbHkPKm9kt+6S9yttCeGy727PGAe86BStuywOUBpYzk=;
 b=3hlei49WNmU2oJUKFn1xCrD8zgKd8EaW6jjTNvtv8PM7bhmVIGIsvs28qK/Mi+HSin
 M0zyumyz4r6Y8eZQBHkD3L0MvdUaDxjXC9UmESTrZT8tJ8sc2ihMIOlYpN4Xhfap4ZEG
 uZg1lv2E98TvVo3OCbHPC1Ujf4IGnAboRI7emh+2mEs/jBwbSKwqOClQ1ZCj6VGh5ao3
 u3oPRRJDkrdt2pQ3KTyJChFp2BqOmvJ/D345xZnqLaabbYUtpawXhUCOuXXfDITz+T5f
 AwDTCnuLVRyv5jH0P3T9fcdMweF5E4QRhjlvPQkVTywcNZW31noCC3cnHpC9jtW6rDZ1
 h7VA==
X-Gm-Message-State: AOAM5305duzRMZgdEzxG8vMmEL31OXQlCZJKfxYYHkbv+rNqPnOVjBeM
 fBtDaP+B2Pr6dCizQkp2Iek6kr5Y14Pmq75MOI6lFHzopWny7g==
X-Received: by 2002:a9d:6552:0:b0:605:e866:1b58 with SMTP id
 q18-20020a9d6552000000b00605e8661b58mr6756872otl.224.1652739968341; Mon, 16
 May 2022 15:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAJNiinuDjvX2c6uQr-wsRb1BNjLKVNWnokAnTiwYFtZg8-jXqA@mail.gmail.com>
 <CAFEAcA9AL3D6SsjhU2opuAAiCHaTSvvYV3JqCHEMG-7eMVpiAA@mail.gmail.com>
 <CAJNiinuyWmU9_DX5Sa8y14q4n0nn3APgsmq4cSOPH6vwXQubvg@mail.gmail.com>
 <CAFEAcA_4JwJkQAVOyGhVZ8qc9rag=bNVf73COnbUetojwpgHzQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_4JwJkQAVOyGhVZ8qc9rag=bNVf73COnbUetojwpgHzQ@mail.gmail.com>
From: James Gutbub <jgutbub@asu.edu>
Date: Mon, 16 May 2022 15:25:54 -0700
Message-ID: <CAJNiinsuR26_C4mY4iCY81DqtvkwwfdH4K+U-ynzDw-wm2+xXw@mail.gmail.com>
Subject: Re: Hello world example with qemu-system-arm
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b82da405df2882f3"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=jgutbub@asu.edu; helo=mail-ot1-x32e.google.com
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
X-TUID: /SDIyJvzeX80

--000000000000b82da405df2882f3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the help. I tried specifying =E2=80=98-R 0=E2=80=99 and recei=
ve the same
error message - qemu-arm: Unable to reserve 0xffff0000 bytes of virtual
address space at 0x1000 (Permission denied) for use as guest address space
(check your virtual memory ulimit setting, min_mmap_addr or reserve less
using -R option)

I have been using the default linker script provided by arm-none-eabi-ld
but I will continue by using the linker script defined below, which gives
the same error message as before.

test.ld file contents:

ENTRY(_Reset)
SECTIONS
{
. =3D 0x0000000;
.startup . : { startup.o(.text)}
.text : { *(.text) }
. =3D 0x8000000;
.data : { *(.data) }
.bss : { *(.bss COMMON) }
. =3D ALIGN(8);
. =3D . + 0x1000;
_stack =3D .;
}

And so my linking command now adds this using =E2=80=98-T test.ld=E2=80=99:

arm-none-eabi-ld startup.o -T test.ld -Map=3Dtest.map -o test.elf -e _Reset

I also tried =E2=80=98sudo sysctl -w vm.mmap_min_addr=3D=E2=80=9D65536=E2=
=80=9D =E2=80=99 mentioned in
https://gitlab.com/qemu-project/qemu/-/issues/447 and then run qemu-arm, I
get a different error now (and it=E2=80=99s the same with =E2=80=98-R 0=E2=
=80=99):

qemu-arm: test.elf: Error mapping file: Cannot allocate memory

Would appreciate any additional advice you can share. If there is a better
supported host environment to use than CentOS Stream 8 I could try it
instead.

And here is the contents of test.map when using test.ld:

Memory Configuration

Name             Origin             Length             Attributes
*default*        0x0000000000000000 0xffffffffffffffff

Linker script and memory map
LOAD startup.o
                0x0000000000000000                . =3D 0x0
.startup        0x0000000000000000       0x1c
startup.o(.text)
.text          0x0000000000000000       0x1c startup.o
                0x0000000000000000                _Reset
.text
*(.text)
.glue_7         0x000000000000001c        0x0
.glue_7        0x000000000000001c        0x0 linker stubs
.glue_7t        0x000000000000001c        0x0
.glue_7t       0x000000000000001c        0x0 linker stubs
.vfp11_veneer   0x000000000000001c        0x0
.vfp11_veneer  0x000000000000001c        0x0 linker stubs
.v4_bx          0x000000000000001c        0x0
.v4_bx         0x000000000000001c        0x0 linker stubs
.iplt           0x000000000000001c        0x0
.iplt          0x000000000000001c        0x0 startup.o
.rel.dyn        0x000000000000001c        0x0
.rel.iplt      0x000000000000001c        0x0 startup.o
                0x0000000008000000                . =3D 0x8000000
.data           0x0000000008000000        0x0
*(.data)
.data          0x0000000008000000        0x0 startup.o
.igot.plt       0x0000000008000000        0x0
.igot.plt      0x0000000008000000        0x0 startup.o
.bss            0x0000000008000000        0x0
*(.bss COMMON)
.bss           0x0000000008000000        0x0 startup.o
                0x0000000008000000                . =3D ALIGN (0x8)
                0x0000000008001000                . =3D (. + 0x1000)
                0x0000000008001000                _stack =3D .
OUTPUT(test.elf elf32-littlearm)
LOAD linker stubs

.ARM.attributes
                0x0000000000000000       0x1d
.ARM.attributes
                0x0000000000000000       0x1d startup.o

Kind Regards,
James G.

On Sat, May 14, 2022 at 3:57 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Fri, 13 May 2022 at 23:59, James Gutbub <jgutbub@asu.edu> wrote:
> >
> > arm-none-eabi-as  -march=3Darmv7-a startup.s -o startup.o
> >
> > arm-none-eabi-ld  startup.o -Map=3Dtest.map -o test.elf -e _Reset
> >
> >
> >
> > qemu-arm -cpu cortex-a7 -d
> in_asm,exec,cpu,int,unimp,guest_errors,nochain -D test.log test.elf
> >
> >
> >
> > qemu-arm: Unable to reserve 0xffff0000 bytes of virtual address space a=
t
> 0x1000 (Permission denied) for use as guest address space (check your
> virtual memory ulimit setting, min_mmap_addr or reserve less using -R
> option)
>
> You don't say what's in your test.map, but it is probably
> trying to put bits of the ELF file in places that make
> qemu-arm's attempt to reserve address space unhappy.
>
> '-R 0' will probably be enough to work around this.
>
> -- PMM
>

--000000000000b82da405df2882f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for the help. I tried specifying =E2=80=98-R 0=
=E2=80=99 and receive the same error message - qemu-arm: Unable to reserve =
0xffff0000 bytes of virtual address space at 0x1000 (Permission denied) for=
 use as guest address space (check your virtual memory ulimit setting, min_=
mmap_addr or reserve less using -R option)<br><br>I have been using the def=
ault linker script provided by arm-none-eabi-ld but I will continue by usin=
g the linker script defined below, which gives the same error message as be=
fore.<br><br>test.ld file contents:<br><br>ENTRY(_Reset)<br>SECTIONS<br>{<b=
r>. =3D 0x0000000;<br>.startup . : { startup.o(.text)}<br>.text : { *(.text=
) }<br>. =3D 0x8000000;<br>.data : { *(.data) }<br>.bss : { *(.bss COMMON) =
}<br>. =3D ALIGN(8);<br>. =3D . + 0x1000;<br>_stack =3D .;<br>}<br><br>And =
so my linking command now adds this using =E2=80=98-T test.ld=E2=80=99:<br>=
<br>arm-none-eabi-ld startup.o -T test.ld -Map=3Dtest.map -o test.elf -e _R=
eset<br><br>I also tried =E2=80=98sudo sysctl -w vm.mmap_min_addr=3D=E2=80=
=9D65536=E2=80=9D =E2=80=99 mentioned in <a href=3D"https://gitlab.com/qemu=
-project/qemu/-/issues/447">https://gitlab.com/qemu-project/qemu/-/issues/4=
47</a> and then run qemu-arm, I get a different error now (and it=E2=80=99s=
 the same with =E2=80=98-R 0=E2=80=99):<br><br>qemu-arm: test.elf: Error ma=
pping file: Cannot allocate memory<br><br>Would appreciate any additional a=
dvice you can share. If there is a better supported host environment to use=
 than CentOS Stream 8 I could try it instead.<br><br>And here is the conten=
ts of test.map when using test.ld:<br><br>Memory Configuration<br><br>Name =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Origin =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 Length =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Attribut=
es<br>*default* =C2=A0 =C2=A0 =C2=A0 =C2=A00x0000000000000000 0xfffffffffff=
fffff<br><br>Linker script and memory map<br>LOAD startup.o<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0000000000000000 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0. =3D 0x0<br>.startup =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x0000000000000000 =C2=A0 =C2=A0 =C2=A0 0x1c<br>startup=
.o(.text)<br>.text =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0000000000000000 =C2=
=A0 =C2=A0 =C2=A0 0x1c startup.o<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x0000000000000000 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0_Reset<br>.text<br>*(.text)<br>.glue_7 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0x000000000000001c =C2=A0 =C2=A0 =C2=A0 =C2=A00x0<br>.glue_7 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x000000000000001c =C2=A0 =C2=A0 =C2=A0 =C2=A00x0 l=
inker stubs<br>.glue_7t =C2=A0 =C2=A0 =C2=A0 =C2=A00x000000000000001c =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x0<br>.glue_7t =C2=A0 =C2=A0 =C2=A0 0x000000000000=
001c =C2=A0 =C2=A0 =C2=A0 =C2=A00x0 linker stubs<br>.vfp11_veneer =C2=A0 0x=
000000000000001c =C2=A0 =C2=A0 =C2=A0 =C2=A00x0<br>.vfp11_veneer =C2=A00x00=
0000000000001c =C2=A0 =C2=A0 =C2=A0 =C2=A00x0 linker stubs<br>.v4_bx =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00x000000000000001c =C2=A0 =C2=A0 =C2=A0 =C2=A00=
x0<br>.v4_bx =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x000000000000001c =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x0 linker stubs<br>.iplt =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=
x000000000000001c =C2=A0 =C2=A0 =C2=A0 =C2=A00x0<br>.iplt =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x000000000000001c =C2=A0 =C2=A0 =C2=A0 =C2=A00x0 startup.=
o<br>.rel.dyn =C2=A0 =C2=A0 =C2=A0 =C2=A00x000000000000001c =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x0<br>.rel.iplt =C2=A0 =C2=A0 =C2=A00x000000000000001c =C2=A0=
 =C2=A0 =C2=A0 =C2=A00x0 startup.o<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0x0000000008000000 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0. =3D 0x8000000<br>.data =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x0000000008000000 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0<br>*(.data)<br>.da=
ta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0000000008000000 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x0 startup.o<br>.igot.plt =C2=A0 =C2=A0 =C2=A0 0x000000000800000=
0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0<br>.igot.plt =C2=A0 =C2=A0 =C2=A00x0000000=
008000000 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0 startup.o<br>.bss =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00x0000000008000000 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
0<br>*(.bss COMMON)<br>.bss =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0000000008=
000000 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0 startup.o<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0000000008000000 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0. =3D ALIGN (0x8)<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0000000008001000 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0. =3D (. + 0x1000)<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0000000008001000 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_stack =3D .<br>OUTPUT(test.elf elf32=
-littlearm)<br>LOAD linker stubs<br><br>.ARM.attributes<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0000000000000000 =C2=A0 =C2=A0 =
=C2=A0 0x1d<br>.ARM.attributes<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 0x0000000000000000 =C2=A0 =C2=A0 =C2=A0 0x1d startup.o<br><d=
iv><br></div><div>Kind Regards,</div><div>James G.</div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, May 14, 202=
2 at 3:57 AM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">=
peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Fri, 13 May 2022 at 23:59, James Gutbub &lt;<a h=
ref=3D"mailto:jgutbub@asu.edu" target=3D"_blank">jgutbub@asu.edu</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; arm-none-eabi-as=C2=A0 -march=3Darmv7-a startup.s -o startup.o<br>
&gt;<br>
&gt; arm-none-eabi-ld=C2=A0 startup.o -Map=3Dtest.map -o test.elf -e _Reset=
<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; qemu-arm -cpu cortex-a7 -d in_asm,exec,cpu,int,unimp,guest_errors,noch=
ain -D test.log test.elf<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; qemu-arm: Unable to reserve 0xffff0000 bytes of virtual address space =
at 0x1000 (Permission denied) for use as guest address space (check your vi=
rtual memory ulimit setting, min_mmap_addr or reserve less using -R option)=
<br>
<br>
You don&#39;t say what&#39;s in your test.map, but it is probably<br>
trying to put bits of the ELF file in places that make<br>
qemu-arm&#39;s attempt to reserve address space unhappy.<br>
<br>
&#39;-R 0&#39; will probably be enough to work around this.<br>
<br>
-- PMM<br>
</blockquote></div>

--000000000000b82da405df2882f3--

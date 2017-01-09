Received: by 10.25.205.13 with SMTP id d13csp11544582lfg;
        Mon, 9 Jan 2017 07:22:08 -0800 (PST)
X-Received: by 10.237.55.97 with SMTP id i88mr86398525qtb.143.1483975328511;
        Mon, 09 Jan 2017 07:22:08 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n23si4503838qtc.296.2017.01.09.07.22.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jan 2017 07:22:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40557 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cQblt-0006fb-ML
	for alex.bennee@linaro.org; Mon, 09 Jan 2017 10:22:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57776)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jiahuanzhang90@gmail.com>) id 1cQbkd-0005Lq-9w
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 10:20:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jiahuanzhang90@gmail.com>) id 1cQbkb-0002Me-E9
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 10:20:47 -0500
Received: from mail-qt0-x230.google.com ([2607:f8b0:400d:c0d::230]:35220)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jiahuanzhang90@gmail.com>)
	id 1cQbkb-0002Li-00
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 10:20:45 -0500
Received: by mail-qt0-x230.google.com with SMTP id x49so72343052qtc.2
	for <qemu-arm@nongnu.org>; Mon, 09 Jan 2017 07:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=RNaRIQBuGCov8skvdvviE7H86CmmCe+VE995pPG+hWQ=;
	b=mEloCKy8TXIk6YgVT4fVbFi5qk7aMzDDV5Ef+VYeQGAsAFIiSvsDjAh2nI+KwyPo2S
	nP3pEGVkW/UWPAh2D1ha7y3K8JIigOhPOLCmx5tDM1ZrmAA3DcHKjDzbvrwxcDEEcWHv
	bLNox65q1Vw8/Q6N5xOfn0u2nygArftzsNQbX3ZDZji8EW0gU612cm43ytH6TbJaD1Jz
	FZxaCuVnJ6DOxqtKgbTgLGAURokVt1UgfxmCV4ITOb/OuyJw6idaVJmaI1+3fkAN2m1Z
	8jlGerBJ4ImtBUi77qmBbq1gdsj1POxg0B/qFkXdb38aFK9H93Fji/Qeg482A5fskEFe
	J7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=RNaRIQBuGCov8skvdvviE7H86CmmCe+VE995pPG+hWQ=;
	b=fLn1ah1EVP65jQmBQFivPU74RWMWHk8T0Jxn+WT33y+aHdhbq71QkMIL3g5aVcWIcr
	dw3Vl11djeAAeN9ZQh044pUxv1W3WSjGfeoMaOsf4PRDvMEAPm8Cp/cXrI4JPCYfKiLq
	7uwerg0NPE/noRLVSaaCkb+HloFzTOkv0w+aQ4aPoH5ciemFsz0D9mXK0bU8z0i+ixhB
	BNPH5gJuwWENlTrFuqdYPBFnk175Vl3Sp7djY2+5R++vOEg8rIHSCZyuyEa7nGMLOnY7
	mbKMfHuaZnGsJjiwpxDs6Hd8ljNQMXzNrLgHy8rsROFEwQv5thZHyvaG3iGfIsN5idxS
	LjxA==
X-Gm-Message-State: AIkVDXJZqbNzB3QhR5RlOS4EOBI3I+vGvOeu2gw972j1IKsPw7e+vpeSpuliJqDt3bxTmgkn3yHXpEbGMv4bWg==
X-Received: by 10.237.59.28 with SMTP id p28mr1718857qte.222.1483975242602;
	Mon, 09 Jan 2017 07:20:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.101.135 with HTTP; Mon, 9 Jan 2017 07:20:42 -0800 (PST)
From: Jiahuan Zhang <jiahuanzhang90@gmail.com>
Date: Mon, 9 Jan 2017 16:20:42 +0100
Message-ID: <CAJy91CYfw8-wjyEacZRjpPv6bXV8eHpSW-THr0Of-LSX=92F=Q@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary=94eb2c19096430ea960545aae986
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c0d::230
Subject: [Qemu-arm] kernel has No master clock, no CPU clock,
 when running in emulated HW
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 21FrMr49kX76

--94eb2c19096430ea960545aae986
Content-Type: text/plain; charset=UTF-8

Hi All,

Happy new year!

Is here the right place to present the problem I meet with while emulating?
If not, please tell me because I am still expecting some feedback from the
seniors here.

I am running the emulated at91sam board with a Linux kernel, but the
booting message says "Clocks: CPU 0 MHz, master 0 MHz, main 10.000 MHz".

When running the same kernel on the real at91sam9261 board, the booting
message says "Clocks: CPU 200 MHz, master 100 MHz, main 10.000 MHz".

And I have the "Division by zero in kernel" error for the uart clock. It
should be also caused by the clock problem.

The "MCK" master clock is generated by Power Menagement Controller and used
by the other peripherals through a global parameter. However, whatever
value I set to "MCK", there is no impact on the clock of the kernel.

The whole booting message is in the following.

How does the emulated HW give clock value to the kernel running on top of
it?
Or how does QEMU give clock to the kernel running on top of its emulated HW?

Best regards,
Jiahuan

================================================================================================

$ ~/test/qemu/build/arm-softmmu/qemu-system-arm -initrd initramfs_new -M
at91sam9261 -kernel zImage_at91sam9261-nographic -serial stdio -serial
stdio -serial stdio -serial stdio -append "console=ttyS0"

QEMU 2.7.50 monitor - type 'help' for more information

(qemu) Uncompressing Linux... done, booting the kernel.

Linux version 3.0.85 (jiahuan@jiahuan-VirtualBox) (gcc version 4.9.3
20141031 (prerelease) (Linaro GCC 2014.11) ) #3 Tue Nov 22 15:50:56 CET 2016

CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00093177

CPU: VIVT data cache, VIVT instruction cache

Machine: Atmel AT91SAM9261-EK

Memory policy: ECC disabled, Data cache writeback

Clocks: CPU 0 MHz, master 0 MHz, main 18.432 MHz

Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32512

Kernel command line: console=ttyS0

PID hash table entries: 512 (order: -1, 2048 bytes)

Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)

Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)

Memory: 128MB = 128MB total

Memory: 125668k/125668k available, 5404k reserved, 0K highmem

Virtual kernel memory layout:

    vector  : 0xffff0000 - 0xffff1000   (   4 kB)

    fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)

    DMA     : 0xffc00000 - 0xffe00000   (   2 MB)

    vmalloc : 0xc8800000 - 0xfee00000   ( 870 MB)

    lowmem  : 0xc0000000 - 0xc8000000   ( 128 MB)

    modules : 0xbf000000 - 0xc0000000   (  16 MB)

      .init : 0xc0008000 - 0xc0028000   ( 128 kB)

      .text : 0xc0028000 - 0xc03e88c8   (3843 kB)

      .data : 0xc03ea000 - 0xc040e9c0   ( 147 kB)

       .bss : 0xc040e9e4 - 0xc04221ac   (  78 kB)

NR_IRQS:192

AT91: 96 gpio irqs in 3 banks

Console: colour dummy device 80x30

------------[ cut here ]------------

WARNING: at drivers/tty/serial/serial_core.c:401
uart_get_baud_rate+0xe8/0x158()

Modules linked in:

[<c0031bb4>] (unwind_backtrace+0x0/0xec) from [<c003cbe4>]
(warn_slowpath_common+0x4c/0x64)

[<c003cbe4>] (warn_slowpath_common+0x4c/0x64) from [<c003cc98>]
(warn_slowpath_null+0x1c/0x24)

[<c003cc98>] (warn_slowpath_null+0x1c/0x24) from [<c018a830>]
(uart_get_baud_rate+0xe8/0x158)

[<c018a830>] (uart_get_baud_rate+0xe8/0x158) from [<c018d548>]
(atmel_set_termios+0x2c/0x200)

[<c018d548>] (atmel_set_termios+0x2c/0x200) from [<c018a9ec>]
(uart_set_options+0xd4/0x118)

[<c018a9ec>] (uart_set_options+0xd4/0x118) from [<c0016b10>]
(atmel_console_setup+0x130/0x140)

[<c0016b10>] (atmel_console_setup+0x130/0x140) from [<c003db04>]
(register_console+0x21c/0x344)

[<c003db04>] (register_console+0x21c/0x344) from [<c00169c8>]
(atmel_console_init+0x44/0x5c)

[<c00169c8>] (atmel_console_init+0x44/0x5c) from [<c0015cbc>]
(console_init+0x20/0x30)

[<c0015cbc>] (console_init+0x20/0x30) from [<c0008824>]
(start_kernel+0x1b8/0x270)

[<c0008824>] (start_kernel+0x1b8/0x270) from [<00008040>] (0x8040)

---[ end trace 1b75b31a2719ed1c ]---

Division by zero in kernel.

[<c0031bb4>] (unwind_backtrace+0x0/0xec) from [<c014b294>] (Ldiv0+0x8/0x10)

[<c014b294>] (Ldiv0+0x8/0x10) from [<c018a134>] (uart_get_divisor+0x20/0x44)

[<c018a134>] (uart_get_divisor+0x20/0x44) from [<c018d558>]
(atmel_set_termios+0x3c/0x200)

[<c018d558>] (atmel_set_termios+0x3c/0x200) from [<c018a9ec>]
(uart_set_options+0xd4/0x118)

[<c018a9ec>] (uart_set_options+0xd4/0x118) from [<c0016b10>]
(atmel_console_setup+0x130/0x140)

[<c0016b10>] (atmel_console_setup+0x130/0x140) from [<c003db04>]
(register_console+0x21c/0x344)

[<c003db04>] (register_console+0x21c/0x344) from [<c00169c8>]
(atmel_console_init+0x44/0x5c)

[<c00169c8>] (atmel_console_init+0x44/0x5c) from [<c0015cbc>]
(console_init+0x20/0x30)

[<c0015cbc>] (console_init+0x20/0x30) from [<c0008824>]
(start_kernel+0x1b8/0x270)

[<c0008824>] (start_kernel+0x1b8/0x270) from [<00008040>] (0x8040)

Division by zero in kernel.

[<c0031bb4>] (unwind_backtrace+0x0/0xec) from [<c014b294>] (Ldiv0+0x8/0x10)

[<c014b294>] (Ldiv0+0x8/0x10) from [<c018a108>] (uart_update_timeout+0x5c/
0x68)

[<c018a108>] (uart_update_timeout+0x5c/0x68) from [<c018d664>]
(atmel_set_termios+0x148/0x200)

[<c018d664>] (atmel_set_termios+0x148/0x200) from [<c018a9ec>]
(uart_set_options+0xd4/0x118)

[<c018a9ec>] (uart_set_options+0xd4/0x118) from [<c0016b10>]
(atmel_console_setup+0x130/0x140)

[<c0016b10>] (atmel_console_setup+0x130/0x140) from [<c003db04>]
(register_console+0x21c/0x344)

[<c003db04>] (register_console+0x21c/0x344) from [<c00169c8>]
(atmel_console_init+0x44/0x5c)

[<c00169c8>] (atmel_console_init+0x44/0x5c) from [<c0015cbc>]
(console_init+0x20/0x30)

[<c0015cbc>] (console_init+0x20/0x30) from [<c0008824>]
(start_kernel+0x1b8/0x270)

[<c0008824>] (start_kernel+0x1b8/0x270) from [<00008040>] (0x8040)

console [ttyS0] enabled

Calibrating delay loop...

--94eb2c19096430ea960545aae986
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>Hi All,</div><div><br></div><div>Happy=
 new year! </div><div><br></div><div>Is here the right place to present the=
 problem I meet with while emulating? If not, please tell me because I am s=
till expecting some feedback from the seniors here.</div><div><br></div><di=
v>I am running the emulated at91sam board with a Linux kernel, but the boot=
ing message says &quot;Clocks: CPU 0 MHz, master 0 MHz, main 10.000 MHz<spa=
n><span>&quot;. </span></span></div><div><span><span><br></span></span></di=
v><div><span><span>When running the same kernel on the real at91sam9261 boa=
rd, the booting message says &quot;Clocks: CPU 200 MHz, master 100 MHz, mai=
n 10.000 MHz&quot;.</span></span></div><div><br></div><div>And I have the &=
quot;Division by=C2=A0zero in kernel&quot; error for the uart clock.=C2=A0I=
t should be=C2=A0also caused by the clock problem.</div><div><br></div><div=
>The &quot;MCK&quot; master clock=C2=A0is generated=C2=A0by Power Menagemen=
t Controller=C2=A0and used by the other peripherals through a global parame=
ter. However, whatever value I set to &quot;MCK&quot;, there is no impact o=
n the clock of the kernel. </div><div><br></div><div>The whole booting mess=
age is in the following.</div><div><br></div><div>How does the emulated HW =
give clock value to the kernel running on top of it? </div><div>Or how does=
 QEMU give clock to the kernel running on top of its emulated HW?</div><div=
><br></div><div>Best regards,</div><div>Jiahuan</div><div><br></div><div><s=
pan>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span=
></div><div><span><p style=3D"margin:0cm 0cm 0pt"><span style=3D"font-famil=
y:&quot;segoe ui&quot;,&quot;sans-serif&quot;;font-size:10pt"><font color=
=3D"#000000">$ ~/test/qemu/build/arm-softmmu/<wbr>qemu-system-arm -initrd i=
nitramfs_new -M at91sam9261 <span><span>-kernel zImage_at91sam9261-nographi=
c -serial stdio -serial stdio -serial stdio -serial stdio -append &quot;con=
sole=3DttyS0&quot;</span></span></font></span></p><font color=3D"#000000" f=
ace=3D"Times New Roman" size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span st=
yle=3D"font-family:&quot;segoe ui&quot;,&quot;sans-serif&quot;;font-size:10=
pt"><font color=3D"#000000">QEMU 2.7.50 monitor - type &#39;help&#39; for m=
ore information</font></span></p><font color=3D"#000000" face=3D"Times New =
Roman" size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span style=3D"font-famil=
y:&quot;segoe ui&quot;,&quot;sans-serif&quot;;font-size:10pt"><font color=
=3D"#000000">(qemu) Uncompressing Linux... done, booting the kernel.</font>=
</span></p><font color=3D"#000000" face=3D"Times New Roman" size=3D"3"><p s=
tyle=3D"margin:0cm 0cm 0pt"><span style=3D"font-family:&quot;segoe ui&quot;=
,&quot;sans-serif&quot;;font-size:10pt"><font color=3D"#000000">Linux versi=
on 3.0.85 (jiahuan@jiahuan-VirtualBox) (gcc version 4.9.3 20141031 (prerele=
ase) (Linaro GCC 2014.11) ) #3 Tue Nov 22 15:50:56 CET 2016</font></span></=
p><font color=3D"#000000" face=3D"Times New Roman" size=3D"3"><p style=3D"m=
argin:0cm 0cm 0pt"><span style=3D"font-family:&quot;segoe ui&quot;,&quot;sa=
ns-serif&quot;;font-size:10pt"><font color=3D"#000000">CPU: ARM926EJ-S [410=
69265] revision 5 (ARMv5TEJ), cr=3D00093177</font></span></p><font color=3D=
"#000000" face=3D"Times New Roman" size=3D"3"><p style=3D"margin:0cm 0cm 0p=
t"><span style=3D"font-family:&quot;segoe ui&quot;,&quot;sans-serif&quot;;f=
ont-size:10pt"><font color=3D"#000000">CPU: VIVT data cache, VIVT instructi=
on cache</font></span></p><font color=3D"#000000" face=3D"Times New Roman" =
size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span style=3D"font-family:&quot=
;segoe ui&quot;,&quot;sans-serif&quot;;font-size:10pt"><font color=3D"#0000=
00">Machine: Atmel AT91SAM9261-EK</font></span></p><font color=3D"#000000" =
face=3D"Times New Roman" size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span s=
tyle=3D"font-family:&quot;segoe ui&quot;,&quot;sans-serif&quot;;font-size:1=
0pt"><font color=3D"#000000">Memory policy: ECC disabled, Data cache writeb=
ack</font></span></p><font color=3D"#000000" face=3D"Times New Roman" size=
=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span style=3D"font-family:&quot;seg=
oe ui&quot;,&quot;sans-serif&quot;;font-size:10pt"><font color=3D"#000000">=
Clocks: CPU 0 MHz, master 0 MHz, main 18.432 MHz</font></span></p><font col=
or=3D"#000000" face=3D"Times New Roman" size=3D"3"><p style=3D"margin:0cm 0=
cm 0pt"><span style=3D"font-family:&quot;segoe ui&quot;,&quot;sans-serif&qu=
ot;;font-size:10pt"><font color=3D"#000000">Built 1 zonelists in Zone order=
, mobility grouping on.=C2=A0 Total pages: 32512</font></span></p><font col=
or=3D"#000000" face=3D"Times New Roman" size=3D"3"><p style=3D"margin:0cm 0=
cm 0pt"><span style=3D"font-family:&quot;segoe ui&quot;,&quot;sans-serif&qu=
ot;;font-size:10pt"><font color=3D"#000000">Kernel command line: console=3D=
ttyS0</font></span></p><font color=3D"#000000" face=3D"Times New Roman" siz=
e=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span style=3D"font-family:&quot;se=
goe ui&quot;,&quot;sans-serif&quot;;font-size:10pt"><font color=3D"#000000"=
>PID hash table entries: 512 (order: -1, 2048 bytes)</font></span></p><font=
 color=3D"#000000" face=3D"Times New Roman" size=3D"3"><p style=3D"margin:0=
cm 0cm 0pt"><span style=3D"font-family:&quot;segoe ui&quot;,&quot;sans-seri=
f&quot;;font-size:10pt"><font color=3D"#000000">Dentry cache hash table ent=
ries: 16384 (order: 4, 65536 bytes)</font></span></p><font color=3D"#000000=
" face=3D"Times New Roman" size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span=
 style=3D"font-family:&quot;segoe ui&quot;,&quot;sans-serif&quot;;font-size=
:10pt"><font color=3D"#000000">Inode-cache hash table entries: 8192 (order:=
 3, 32768 bytes)</font></span></p><font color=3D"#000000" face=3D"Times New=
 Roman" size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span style=3D"font-fami=
ly:&quot;segoe ui&quot;,&quot;sans-serif&quot;;font-size:10pt"><font color=
=3D"#000000">Memory: 128MB =3D 128MB total</font></span></p><font color=3D"=
#000000" face=3D"Times New Roman" size=3D"3"><p style=3D"margin:0cm 0cm 0pt=
"><span style=3D"font-family:&quot;segoe ui&quot;,&quot;sans-serif&quot;;fo=
nt-size:10pt"><font color=3D"#000000">Memory: 125668k/125668k available, 54=
04k reserved, 0K highmem</font></span></p><font color=3D"#000000" face=3D"T=
imes New Roman" size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span style=3D"f=
ont-family:&quot;segoe ui&quot;,&quot;sans-serif&quot;;font-size:10pt"><fon=
t color=3D"#000000">Virtual kernel memory layout:</font></span></p><font co=
lor=3D"#000000" face=3D"Times New Roman" size=3D"3"><p style=3D"margin:0cm =
0cm 0pt"><span style=3D"font-family:&quot;segoe ui&quot;,&quot;sans-serif&q=
uot;;font-size:10pt"><font color=3D"#000000">=C2=A0=C2=A0=C2=A0 vector=C2=
=A0 : 0xffff0000 - 0xffff1000=C2=A0=C2=A0 (=C2=A0=C2=A0 4 kB)</font></span>=
</p><font color=3D"#000000" face=3D"Times New Roman" size=3D"3"><p style=3D=
"margin:0cm 0cm 0pt"><span style=3D"font-family:&quot;segoe ui&quot;,&quot;=
sans-serif&quot;;font-size:10pt"><font color=3D"#000000">=C2=A0=C2=A0=C2=A0=
 fixmap=C2=A0 : 0xfff00000 - 0xfffe0000=C2=A0=C2=A0 ( 896 kB)</font></span>=
</p><font color=3D"#000000" face=3D"Times New Roman" size=3D"3"><p style=3D=
"margin:0cm 0cm 0pt"><span style=3D"font-family:&quot;segoe ui&quot;,&quot;=
sans-serif&quot;;font-size:10pt"><font color=3D"#000000">=C2=A0=C2=A0=C2=A0=
 DMA=C2=A0=C2=A0=C2=A0=C2=A0 : 0xffc00000 - 0xffe00000=C2=A0=C2=A0 (=C2=A0=
=C2=A0 2 MB)</font></span></p><font color=3D"#000000" face=3D"Times New Rom=
an" size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span style=3D"font-family:&=
quot;segoe ui&quot;,&quot;sans-serif&quot;;font-size:10pt"><font color=3D"#=
000000">=C2=A0=C2=A0=C2=A0 vmalloc : 0xc8800000 - 0xfee00000=C2=A0=C2=A0 ( =
870 MB)</font></span></p><font color=3D"#000000" face=3D"Times New Roman" s=
ize=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span style=3D"font-family:&quot;=
segoe ui&quot;,&quot;sans-serif&quot;;font-size:10pt"><font color=3D"#00000=
0">=C2=A0=C2=A0=C2=A0 lowmem=C2=A0 : 0xc0000000 - 0xc8000000=C2=A0=C2=A0 ( =
128 MB)</font></span></p><font color=3D"#000000" face=3D"Times New Roman" s=
ize=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span style=3D"font-family:&quot;=
segoe ui&quot;,&quot;sans-serif&quot;;font-size:10pt"><font color=3D"#00000=
0">=C2=A0=C2=A0=C2=A0 modules : 0xbf000000 - 0xc0000000=C2=A0=C2=A0 (=C2=A0=
 16 MB)</font></span></p><font color=3D"#000000" face=3D"Times New Roman" s=
ize=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span style=3D"font-family:&quot;=
segoe ui&quot;,&quot;sans-serif&quot;;font-size:10pt"><font color=3D"#00000=
0">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .init : 0xc0008000 - 0xc0028000=C2=A0=C2=
=A0 ( 128 kB)</font></span></p><font color=3D"#000000" face=3D"Times New Ro=
man" size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span style=3D"font-family:=
&quot;segoe ui&quot;,&quot;sans-serif&quot;;font-size:10pt"><font color=3D"=
#000000">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .text : 0xc0028000 - 0xc03e88c8=C2=
=A0=C2=A0 (3843 kB)</font></span></p><font color=3D"#000000" face=3D"Times =
New Roman" size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span style=3D"font-f=
amily:&quot;segoe ui&quot;,&quot;sans-serif&quot;;font-size:10pt"><font col=
or=3D"#000000">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .data : 0xc03ea000 - 0xc040e9=
c0=C2=A0=C2=A0 ( 147 kB)</font></span></p><font color=3D"#000000" face=3D"T=
imes New Roman" size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span style=3D"f=
ont-family:&quot;segoe ui&quot;,&quot;sans-serif&quot;;font-size:10pt"><fon=
t color=3D"#000000">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0.bss : 0xc040e9e4 =
- 0xc04221ac=C2=A0=C2=A0 (=C2=A0 78 kB)</font></span></p><font color=3D"#00=
0000" face=3D"Times New Roman" size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><=
span style=3D"font-family:&quot;segoe ui&quot;,&quot;sans-serif&quot;;font-=
size:10pt"><font color=3D"#000000">NR_IRQS:192</font></span></p><font color=
=3D"#000000" face=3D"Times New Roman" size=3D"3"><p style=3D"margin:0cm 0cm=
 0pt"><span style=3D"font-family:&quot;segoe ui&quot;,&quot;sans-serif&quot=
;;font-size:10pt"><font color=3D"#000000">AT91: 96 gpio irqs in 3 banks</fo=
nt></span></p><font color=3D"#000000" face=3D"Times New Roman" size=3D"3"><=
p style=3D"margin:0cm 0cm 0pt"><span style=3D"font-family:&quot;segoe ui&qu=
ot;,&quot;sans-serif&quot;;font-size:10pt"><font color=3D"#000000">Console:=
 colour dummy device 80x30</font></span></p><font color=3D"#000000" face=3D=
"Times New Roman" size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span style=3D=
"font-family:&quot;segoe ui&quot;,&quot;sans-serif&quot;;font-size:10pt"><f=
ont color=3D"#000000">------------[ cut here ]------------</font></span></p=
><font color=3D"#000000" face=3D"Times New Roman" size=3D"3"><p style=3D"ma=
rgin:0cm 0cm 0pt"><span style=3D"font-family:&quot;segoe ui&quot;,&quot;san=
s-serif&quot;;font-size:10pt"><font color=3D"#000000">WARNING: at drivers/t=
ty/serial/serial_<wbr>core.c:401 uart_get_baud_rate+0xe8/0x158(<wbr>)</font=
></span></p><font color=3D"#000000" face=3D"Times New Roman" size=3D"3"><p =
style=3D"margin:0cm 0cm 0pt"><span style=3D"font-family:&quot;segoe ui&quot=
;,&quot;sans-serif&quot;;font-size:10pt"><font color=3D"#000000">Modules li=
nked in:</font></span></p><font color=3D"#000000" face=3D"Times New Roman" =
size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span style=3D"font-family:&quot=
;segoe ui&quot;,&quot;sans-serif&quot;;font-size:10pt"><font color=3D"#0000=
00">[&lt;c0031bb4&gt;] (unwind_backtrace+0x0/0xec) from [&lt;c003cbe4&gt;] =
(warn_slowpath_common+0x4c/<wbr>0x64)</font></span></p><font color=3D"#0000=
00" face=3D"Times New Roman" size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><sp=
an style=3D"font-family:&quot;segoe ui&quot;,&quot;sans-serif&quot;;font-si=
ze:10pt"><font color=3D"#000000">[&lt;c003cbe4&gt;] (warn_slowpath_common+0=
x4c/<wbr>0x64) from [&lt;c003cc98&gt;] (warn_slowpath_null+0x1c/0x24)</font=
></span></p><font color=3D"#000000" face=3D"Times New Roman" size=3D"3"><p =
style=3D"margin:0cm 0cm 0pt"><span style=3D"font-family:&quot;segoe ui&quot=
;,&quot;sans-serif&quot;;font-size:10pt"><font color=3D"#000000">[&lt;c003c=
c98&gt;] (warn_slowpath_null+0x1c/0x24) from [&lt;c018a830&gt;] (uart_get_b=
aud_rate+0xe8/<wbr>0x158)</font></span></p><font color=3D"#000000" face=3D"=
Times New Roman" size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span style=3D"=
font-family:&quot;segoe ui&quot;,&quot;sans-serif&quot;;font-size:10pt"><fo=
nt color=3D"#000000">[&lt;c018a830&gt;] (uart_get_baud_rate+0xe8/<wbr>0x158=
) from [&lt;c018d548&gt;] (atmel_set_termios+0x2c/0x200)</font></span></p><=
font color=3D"#000000" face=3D"Times New Roman" size=3D"3"><p style=3D"marg=
in:0cm 0cm 0pt"><span style=3D"font-family:&quot;segoe ui&quot;,&quot;sans-=
serif&quot;;font-size:10pt"><font color=3D"#000000">[&lt;c018d548&gt;] (atm=
el_set_termios+0x2c/0x200) from [&lt;c018a9ec&gt;] (uart_set_options+0xd4/0=
x118)</font></span></p><font color=3D"#000000" face=3D"Times New Roman" siz=
e=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span style=3D"font-family:&quot;se=
goe ui&quot;,&quot;sans-serif&quot;;font-size:10pt"><font color=3D"#000000"=
>[&lt;c018a9ec&gt;] (uart_set_options+0xd4/0x118) from [&lt;c0016b10&gt;] (=
atmel_console_setup+0x130/<wbr>0x140)</font></span></p><font color=3D"#0000=
00" face=3D"Times New Roman" size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><sp=
an style=3D"font-family:&quot;segoe ui&quot;,&quot;sans-serif&quot;;font-si=
ze:10pt"><font color=3D"#000000">[&lt;c0016b10&gt;] (atmel_console_setup+0x=
130/<wbr>0x140) from [&lt;c003db04&gt;] (register_console+0x21c/0x344)</fon=
t></span></p><font color=3D"#000000" face=3D"Times New Roman" size=3D"3"><p=
 style=3D"margin:0cm 0cm 0pt"><span style=3D"font-family:&quot;segoe ui&quo=
t;,&quot;sans-serif&quot;;font-size:10pt"><font color=3D"#000000">[&lt;c003=
db04&gt;] (register_console+0x21c/0x344) from [&lt;c00169c8&gt;] (atmel_con=
sole_init+0x44/0x5c)</font></span></p><font color=3D"#000000" face=3D"Times=
 New Roman" size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span style=3D"font-=
family:&quot;segoe ui&quot;,&quot;sans-serif&quot;;font-size:10pt"><font co=
lor=3D"#000000">[&lt;c00169c8&gt;] (atmel_console_init+0x44/0x5c) from [&lt=
;c0015cbc&gt;] (console_init+0x20/0x30)</font></span></p><font color=3D"#00=
0000" face=3D"Times New Roman" size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><=
span style=3D"font-family:&quot;segoe ui&quot;,&quot;sans-serif&quot;;font-=
size:10pt"><font color=3D"#000000">[&lt;c0015cbc&gt;] (console_init+0x20/0x=
30) from [&lt;c0008824&gt;] (start_kernel+0x1b8/0x270)</font></span></p><fo=
nt color=3D"#000000" face=3D"Times New Roman" size=3D"3"><p style=3D"margin=
:0cm 0cm 0pt"><span style=3D"font-family:&quot;segoe ui&quot;,&quot;sans-se=
rif&quot;;font-size:10pt"><font color=3D"#000000">[&lt;c0008824&gt;] (start=
_kernel+0x1b8/0x270) from [&lt;00008040&gt;] (0x8040)</font></span></p><fon=
t color=3D"#000000" face=3D"Times New Roman" size=3D"3"><p style=3D"margin:=
0cm 0cm 0pt"><span style=3D"font-family:&quot;segoe ui&quot;,&quot;sans-ser=
if&quot;;font-size:10pt"><font color=3D"#000000">---[ end trace 1b75b31a271=
9ed1c ]---</font></span></p><font color=3D"#000000" face=3D"Times New Roman=
" size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span style=3D"font-family:&qu=
ot;segoe ui&quot;,&quot;sans-serif&quot;;font-size:10pt"><font color=3D"#00=
0000">Division by zero in kernel.</font></span></p><font color=3D"#000000" =
face=3D"Times New Roman" size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span s=
tyle=3D"font-family:&quot;segoe ui&quot;,&quot;sans-serif&quot;;font-size:1=
0pt"><font color=3D"#000000">[&lt;c0031bb4&gt;] (unwind_backtrace+0x0/0xec)=
 from [&lt;c014b294&gt;] (Ldiv0+0x8/0x10)</font></span></p><font color=3D"#=
000000" face=3D"Times New Roman" size=3D"3"><p style=3D"margin:0cm 0cm 0pt"=
><span style=3D"font-family:&quot;segoe ui&quot;,&quot;sans-serif&quot;;fon=
t-size:10pt"><font color=3D"#000000">[&lt;c014b294&gt;] (Ldiv0+0x8/0x10) fr=
om [&lt;c018a134&gt;] (uart_get_divisor+0x20/0x44)</font></span></p><font c=
olor=3D"#000000" face=3D"Times New Roman" size=3D"3"><p style=3D"margin:0cm=
 0cm 0pt"><span style=3D"font-family:&quot;segoe ui&quot;,&quot;sans-serif&=
quot;;font-size:10pt"><font color=3D"#000000">[&lt;c018a134&gt;] (uart_get_=
divisor+0x20/0x44) from [&lt;c018d558&gt;] (atmel_set_termios+0x3c/0x200)</=
font></span></p><font color=3D"#000000" face=3D"Times New Roman" size=3D"3"=
><p style=3D"margin:0cm 0cm 0pt"><span style=3D"font-family:&quot;segoe ui&=
quot;,&quot;sans-serif&quot;;font-size:10pt"><font color=3D"#000000">[&lt;c=
018d558&gt;] (atmel_set_termios+0x3c/0x200) from [&lt;c018a9ec&gt;] (uart_s=
et_options+0xd4/0x118)</font></span></p><font color=3D"#000000" face=3D"Tim=
es New Roman" size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span style=3D"fon=
t-family:&quot;segoe ui&quot;,&quot;sans-serif&quot;;font-size:10pt"><font =
color=3D"#000000">[&lt;c018a9ec&gt;] (uart_set_options+0xd4/0x118) from [&l=
t;c0016b10&gt;] (atmel_console_setup+0x130/<wbr>0x140)</font></span></p><fo=
nt color=3D"#000000" face=3D"Times New Roman" size=3D"3"><p style=3D"margin=
:0cm 0cm 0pt"><span style=3D"font-family:&quot;segoe ui&quot;,&quot;sans-se=
rif&quot;;font-size:10pt"><font color=3D"#000000">[&lt;c0016b10&gt;] (atmel=
_console_setup+0x130/<wbr>0x140) from [&lt;c003db04&gt;] (register_console+=
0x21c/0x344)</font></span></p><font color=3D"#000000" face=3D"Times New Rom=
an" size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span style=3D"font-family:&=
quot;segoe ui&quot;,&quot;sans-serif&quot;;font-size:10pt"><font color=3D"#=
000000">[&lt;c003db04&gt;] (register_console+0x21c/0x344) from [&lt;c00169c=
8&gt;] (atmel_console_init+0x44/0x5c)</font></span></p><font color=3D"#0000=
00" face=3D"Times New Roman" size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><sp=
an style=3D"font-family:&quot;segoe ui&quot;,&quot;sans-serif&quot;;font-si=
ze:10pt"><font color=3D"#000000">[&lt;c00169c8&gt;] (atmel_console_init+0x4=
4/0x5c) from [&lt;c0015cbc&gt;] (console_init+0x20/0x30)</font></span></p><=
font color=3D"#000000" face=3D"Times New Roman" size=3D"3"><p style=3D"marg=
in:0cm 0cm 0pt"><span style=3D"font-family:&quot;segoe ui&quot;,&quot;sans-=
serif&quot;;font-size:10pt"><font color=3D"#000000">[&lt;c0015cbc&gt;] (con=
sole_init+0x20/0x30) from [&lt;c0008824&gt;] (start_kernel+0x1b8/0x270)</fo=
nt></span></p><font color=3D"#000000" face=3D"Times New Roman" size=3D"3"><=
p style=3D"margin:0cm 0cm 0pt"><span style=3D"font-family:&quot;segoe ui&qu=
ot;,&quot;sans-serif&quot;;font-size:10pt"><font color=3D"#000000">[&lt;c00=
08824&gt;] (start_kernel+0x1b8/0x270) from [&lt;00008040&gt;] (0x8040)</fon=
t></span></p><font color=3D"#000000" face=3D"Times New Roman" size=3D"3"><p=
 style=3D"margin:0cm 0cm 0pt"><span style=3D"font-family:&quot;segoe ui&quo=
t;,&quot;sans-serif&quot;;font-size:10pt"><font color=3D"#000000">Division =
by zero in kernel.</font></span></p><font color=3D"#000000" face=3D"Times N=
ew Roman" size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span style=3D"font-fa=
mily:&quot;segoe ui&quot;,&quot;sans-serif&quot;;font-size:10pt"><font colo=
r=3D"#000000">[&lt;c0031bb4&gt;] (unwind_backtrace+0x0/0xec) from [&lt;c014=
b294&gt;] (Ldiv0+0x8/0x10)</font></span></p><font color=3D"#000000" face=3D=
"Times New Roman" size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span style=3D=
"font-family:&quot;segoe ui&quot;,&quot;sans-serif&quot;;font-size:10pt"><f=
ont color=3D"#000000">[&lt;c014b294&gt;] (Ldiv0+0x8/0x10) from [&lt;c018a10=
8&gt;] (uart_update_timeout+0x5c/<wbr>0x68)</font></span></p><font color=3D=
"#000000" face=3D"Times New Roman" size=3D"3"><p style=3D"margin:0cm 0cm 0p=
t"><span style=3D"font-family:&quot;segoe ui&quot;,&quot;sans-serif&quot;;f=
ont-size:10pt"><font color=3D"#000000">[&lt;c018a108&gt;] (uart_update_time=
out+0x5c/<wbr>0x68) from [&lt;c018d664&gt;] (atmel_set_termios+0x148/<wbr>0=
x200)</font></span></p><font color=3D"#000000" face=3D"Times New Roman" siz=
e=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span style=3D"font-family:&quot;se=
goe ui&quot;,&quot;sans-serif&quot;;font-size:10pt"><font color=3D"#000000"=
>[&lt;c018d664&gt;] (atmel_set_termios+0x148/<wbr>0x200) from [&lt;c018a9ec=
&gt;] (uart_set_options+0xd4/0x118)</font></span></p><font color=3D"#000000=
" face=3D"Times New Roman" size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span=
 style=3D"font-family:&quot;segoe ui&quot;,&quot;sans-serif&quot;;font-size=
:10pt"><font color=3D"#000000">[&lt;c018a9ec&gt;] (uart_set_options+0xd4/0x=
118) from [&lt;c0016b10&gt;] (atmel_console_setup+0x130/<wbr>0x140)</font><=
/span></p><font color=3D"#000000" face=3D"Times New Roman" size=3D"3"><p st=
yle=3D"margin:0cm 0cm 0pt"><span style=3D"font-family:&quot;segoe ui&quot;,=
&quot;sans-serif&quot;;font-size:10pt"><font color=3D"#000000">[&lt;c0016b1=
0&gt;] (atmel_console_setup+0x130/<wbr>0x140) from [&lt;c003db04&gt;] (regi=
ster_console+0x21c/0x344)</font></span></p><font color=3D"#000000" face=3D"=
Times New Roman" size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span style=3D"=
font-family:&quot;segoe ui&quot;,&quot;sans-serif&quot;;font-size:10pt"><fo=
nt color=3D"#000000">[&lt;c003db04&gt;] (register_console+0x21c/0x344) from=
 [&lt;c00169c8&gt;] (atmel_console_init+0x44/0x5c)</font></span></p><font c=
olor=3D"#000000" face=3D"Times New Roman" size=3D"3"><p style=3D"margin:0cm=
 0cm 0pt"><span style=3D"font-family:&quot;segoe ui&quot;,&quot;sans-serif&=
quot;;font-size:10pt"><font color=3D"#000000">[&lt;c00169c8&gt;] (atmel_con=
sole_init+0x44/0x5c) from [&lt;c0015cbc&gt;] (console_init+0x20/0x30)</font=
></span></p><font color=3D"#000000" face=3D"Times New Roman" size=3D"3"><p =
style=3D"margin:0cm 0cm 0pt"><span style=3D"font-family:&quot;segoe ui&quot=
;,&quot;sans-serif&quot;;font-size:10pt"><font color=3D"#000000">[&lt;c0015=
cbc&gt;] (console_init+0x20/0x30) from [&lt;c0008824&gt;] (start_kernel+0x1=
b8/0x270)</font></span></p><font color=3D"#000000" face=3D"Times New Roman"=
 size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span style=3D"font-family:&quo=
t;segoe ui&quot;,&quot;sans-serif&quot;;font-size:10pt"><font color=3D"#000=
000">[&lt;c0008824&gt;] (start_kernel+0x1b8/0x270) from [&lt;00008040&gt;] =
(0x8040)</font></span></p><font color=3D"#000000" face=3D"Times New Roman" =
size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span style=3D"font-family:&quot=
;segoe ui&quot;,&quot;sans-serif&quot;;font-size:10pt"><font color=3D"#0000=
00">console [ttyS0] enabled</font></span></p><font color=3D"#000000" face=
=3D"Times New Roman" size=3D"3"><p style=3D"margin:0cm 0cm 0pt"><span lang=
=3D"NL" style=3D"font-family:&quot;segoe ui&quot;,&quot;sans-serif&quot;;fo=
nt-size:10pt"><font color=3D"#000000">Calibrating delay loop...<span><span>=
<span></span></span></span></font></span></p></font></font></font></font></=
font></font></font></font></font></font></font></font></font></font></font>=
</font></font></font></font></font></font></font></font></font></font></fon=
t></font></font></font></font></font></font></font></font></font></font></f=
ont></font></font></font></font></font></font></font></font></font></font><=
/font></font></font></font></font></font></font></font></font></font></font=
></font></font></font></font></font></font></font></font></font></font></sp=
an></div></div>

--94eb2c19096430ea960545aae986--

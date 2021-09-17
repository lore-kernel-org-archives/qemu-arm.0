Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q10sm6756432wmq.12.2021.09.17.09.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 09:52:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 20C651FF96;
	Fri, 17 Sep 2021 17:52:03 +0100 (BST)
References: <20210913102917.0bf933d8@ktm>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Lukasz Majewski <l.majewski@majess.pl>
Cc: qemu-devel@nongnu.org, qemu-discuss@nongnu.org, qemu-arm@nongnu.org
Subject: Re: Problem with init debugging under QEMU ARM
Date: Fri, 17 Sep 2021 17:49:46 +0100
In-reply-to: <20210913102917.0bf933d8@ktm>
Message-ID: <87tuijrvpo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: L3ifBfhBgc4D


Lukasz Majewski <l.majewski@majess.pl> writes:

> [[PGP Signed Part:Undecided]]
> Dear QEMU community,
>
> I'm now trying to fix bug in glibc which became apparent on qemu 6.0.0.
>
> The error is caused by glibc commit:
> bca0f5cbc9257c13322b99e55235c4f21ba0bd82
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dblobdiff;f=3Dsysdeps/arm/dl=
-machine.h;h=3Deb13cb8b57496a0ec175c54a495f7e78db978fb7;hp=3Dff5e09e207f798=
6b1506b8895ae6c2aff032a380;hb=3Dbca0f5cbc9257c13322b99e55235c4f21ba0bd82;hp=
b=3D34b4624b04fc8f038b2c329ca7560197320615b4
>
> (reverting it causes the board to boot again)
>
> Other components:
> binutils_2.37
> gcc_11.2
> Yocto poky: SHA1: 1e2e9a84d6dd81d7f6dd69c0d119d0149d10ade1
>
> Qemu start line (the problem is visible on 5.2.0 and 6.0.0):
> qemu-system-arm -device
> virtio-net-device,netdev=3Dnet0,mac=3D52:54:00:12:34:02 -netdev
> tap,id=3Dnet0,ifnam e=3Dtap0,script=3Dno,downscript=3Dno -object
> rng-random,filename=3D/dev/urandom,id=3Drng0 -device
> virtio-rng-pci,rng=3Drng0 -drive
> id=3Ddisk0,file=3Dy2038-image-devel-qemuarm.ext4,if=3Dnone,format
> =3Draw -device virtio-blk-device,drive=3Ddisk0 -device qemu-xhci -device
> usb-tablet -device usb-kbd  -machine virt,highmem=3Doff -cpu cortex-a15
> -smp 4 -m 256 -serial mon:stdio -serial null -nographic -device
> VGA,edid=3Don -kernel
> zImage--5.10.62+git0+bce2813b16_machine-r0-qemuarm-20210910095636.bin
> -append 'root=3D/dev/vda rw  mem=3D256M
> ip=3D192.168.7.2::192.168.7.1:255.255.255.0 console=3DttyAMA0 console=3Dh=
vc0
> vmalloc=3D256
>
>
> It has been tested with Cortex-A9 (Vexpress A9 2 core board) and
> Cortex-A15. I've also tested the v5.1, v5.10 and v5.14 kernels. The
> error is persistent.
>
> I do add -s and -S when starting qemu-system-arm. I can use gdb to
> debug the kernel without issues. Unfortunately, I'm not able to debug
> /sbin/init after switching contex to user space.

Is GDB being confused by the switch to userspace? Have you stepped over
an eret into userspace?

> Moreover, gdbserver cannot be used as the error (and kernel OOPs) is
> caused when early code from ld-linux.so.3 (the _dl_start function) is
> executed.
>
>
> Any hints on how to debug it?

Are any of the linux gdb python scripts able to give you the paddr of a
given binary/task so you can stick a breakpoint there?

>
> Inspecting assembler is one (awkward) option (some results presented
> below). I can also inspect the VMA of the code just before starting the
> /sbin/init process.
>
> Unfortunately, when I try to break on user space code it is not very
> helpful (as -S -s are supposed to be used with kernel).
>
>
> Some info with the eligible code (_dl_start function):
> ------------------------------------------------------
>
> I think that the problem may be with having the negative value
> calculated.
>
> The relevant snipet:
>
>     116c:       bf00            nop
>     116e:       bf00            nop
>     1170:       bf00            nop
>     1172:       f8df 3508       ldr.w   r3, [pc, #1288] ; 167c
>     <_dl_start+0x520>
>
>     1176:       f8df 1508       ldr.w   r1, [pc, #1288] ; 1680
>     <_dl_start+0x524>
>
>     117a:       447b            add     r3, pc
>     117c:       4479            add     r1, pc
>     117e:       f8c3 1598       str.w   r1, [r3, #1432] ; 0x598
>     1182:       bf00            nop
>     1184:       bf00            nop
>     1186:       bf00            nop
>     1188:       bf00            nop
>     118a:       bf00            nop
>     118c:       bf00            nop
>     118e:       f8df 24f4       ldr.w   r2, [pc, #1268] ; 1684
>     <_dl_start+0x528> 1192:       f8d3 5598       ldr.w   r5, [r3,
>     #1432] ; 0x598 1196:       447a            add     r2, pc
>     1198:       442a            add     r2, r5
>     119a:       1a52            subs    r2, r2, r1
>     119c:       f8c3 25a0       str.w   r2, [r3, #1440] ; 0x5a0
>     11a0:       6813            ldr     r3, [r2, #0]
>
>
>     167c:       0002be92        .word   0x0002be92
>     1680:       ffffee80        .word   0xffffee80
>
> The r1 gets the 0xffffee80 (negative offset) value. It is then added to
> pc and used to calculate r2.
>
> For working code (aforementioned patch reverted) - there are NO such
> large values (like aforementioned 0xffffee80). The arithmetic is done
> on=20
>
>    1690:       00000020        .word   0x00000020
>    1694:       0002be7e        .word   0x0002be7e
>
> which seems to work.
>
> Maybe I'm missing some flag when I do start qemu-system-arm?
>
> Thanks in advance for help and hints.


--=20
Alex Benn=C3=A9e

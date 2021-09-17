Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1876600lfp;
        Fri, 17 Sep 2021 01:39:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJ1Xdy4wbxaqUwRt+DtqajlsH+1ZcwXJNCNhaurYLuGJ3NXq/7c3QQ3wA+rfRQkTozHa6n
X-Received: by 2002:a05:6638:264f:: with SMTP id n15mr7853326jat.37.1631867948697;
        Fri, 17 Sep 2021 01:39:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631867948; cv=none;
        d=google.com; s=arc-20160816;
        b=mLfWkDADey6KTes/ZJhSrT+5joBbxwPUVocEsqBZJPshS0U3FO6IH0mboVUUhYkg9y
         24cXOPU5HopYD6KAe0ITdtFv2Hu+4bKrSkK6XDHK5D5Ovh9JE829v8Be6k0gGRi+9rI7
         aG4gcBocSV4nSfFc0J9fUIeln0hmY5HONOZhA8jRO7ffZRDwi/DCKtXPy4aSZXOSTE25
         MiJr6vqu020fevxEuIVXjrnH52yIHdMr+nSDkBKMYJzJpi/A3pZyihQPSgqJpRGLjsWr
         7LdlXy9AB9+MbedsSHzr2OtQqSoSkGch/eIG9UYSWjl49DykWLHniK1zQLkH8LbtU6qa
         QHLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:subject:to:from:date;
        bh=j25jI50jbWxNCDOATjn92Jk9b02RUxLnkLFYNkx5jes=;
        b=ZCPneOWqeLsFoaPsacxW6sksJdK7rAPP2AvUH4NQPsDIrSjgp8LRjT/3TdU+QN5zdA
         pH1u9T5X8+GI0UagFg38l2CxpcACFlcYBf8uMWEkVQbdKflNGGJovOAN11FYkjaGiXaI
         8SlRYW7II8eRLWquDjhX0WGvVUJ5vNYDFqHUz2cv+ijOaGXqEWQqBmIBxQ6nMC02I294
         J9IVwM1fjnB5i54cFN/V8rhweB+trKgAuqTIi8F4ic5B3AFUruA+QqgAFYtQEAZobw99
         Z+JiwP02kTu/CkTjmKorZJsRXZGqhuqtMf73+3sfGssJ6LOr3G56YTMMvXvRL0FTA284
         q+fw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r18si5735563ilc.134.2021.09.17.01.39.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Sep 2021 01:39:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mR9Ol-0005qK-Qr
	for alex.bennee@linaro.org; Fri, 17 Sep 2021 04:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <l.majewski@majess.pl>)
 id 1mR9LM-00010r-4Z; Fri, 17 Sep 2021 04:35:36 -0400
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:38871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <l.majewski@majess.pl>)
 id 1mR9LG-0007nN-Vb; Fri, 17 Sep 2021 04:35:35 -0400
Received: from mxplan6.mail.ovh.net (unknown [10.109.143.158])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0716321525;
 Fri, 17 Sep 2021 08:35:18 +0000 (UTC)
Received: from majess.pl (37.59.142.101) by DAG9EX1.mxp6.local (172.16.2.81)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 17 Sep
 2021 10:35:18 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004ed360fdb-2112-4a58-bcfd-53e1406da8ca,
 B43F73BAC91FA68FA220C0BEDB9BA32204EAC078) smtp.auth=l.majewski@majess.pl
X-OVh-ClientIp: 85.222.111.42
Date: Fri, 17 Sep 2021 10:35:17 +0200
From: Lukasz Majewski <l.majewski@majess.pl>
To: <qemu-arm@nongnu.org>
Subject: Re: Problem with init debugging under QEMU ARM
Message-ID: <20210917103517.07bf4bfc@ktm>
In-Reply-To: <20210913102917.0bf933d8@ktm>
References: <20210913102917.0bf933d8@ktm>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/ylyEK59Z/pFjPesxOkVX3ZB";
 protocol="application/pgp-signature"
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX2.mxp6.local (172.16.2.42) To DAG9EX1.mxp6.local
 (172.16.2.81)
X-Ovh-Tracer-GUID: f7cbf6c6-f5cb-4a7d-9812-f663cfe97383
X-Ovh-Tracer-Id: 6000483554291729117
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudehiedgtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkjghfofggtghisehgtderreertdejnecuhfhrohhmpefnuhhkrghsiicuofgrjhgvfihskhhiuceolhdrmhgrjhgvfihskhhisehmrghjvghsshdrphhlqeenucggtffrrghtthgvrhhnpeeuvdeuleefueelffettddvjeekkeejgeevffetvdeuhfdvieetuddtuedujeeuhfenucffohhmrghinhepshhouhhrtggvfigrrhgvrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghniedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehlrdhmrghjvgifshhkihesmhgrjhgvshhsrdhplhdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=188.165.42.229; envelope-from=l.majewski@majess.pl;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel@nongnu.org, qemu-discuss@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pU666smf41Yk

--Sig_/ylyEK59Z/pFjPesxOkVX3ZB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 13 Sep 2021 10:29:17 +0200
Lukasz Majewski <l.majewski@majess.pl> wrote:

> Dear QEMU community,
>=20
> I'm now trying to fix bug in glibc which became apparent on qemu
> 6.0.0.
>=20
> The error is caused by glibc commit:
> bca0f5cbc9257c13322b99e55235c4f21ba0bd82
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dblobdiff;f=3Dsysdeps/arm/dl=
-machine.h;h=3Deb13cb8b57496a0ec175c54a495f7e78db978fb7;hp=3Dff5e09e207f798=
6b1506b8895ae6c2aff032a380;hb=3Dbca0f5cbc9257c13322b99e55235c4f21ba0bd82;hp=
b=3D34b4624b04fc8f038b2c329ca7560197320615b4
>=20
> (reverting it causes the board to boot again)
>=20
> Other components:
> binutils_2.37
> gcc_11.2
> Yocto poky: SHA1: 1e2e9a84d6dd81d7f6dd69c0d119d0149d10ade1
>=20
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
>=20
>=20
> It has been tested with Cortex-A9 (Vexpress A9 2 core board) and
> Cortex-A15. I've also tested the v5.1, v5.10 and v5.14 kernels. The
> error is persistent.
>=20
> I do add -s and -S when starting qemu-system-arm. I can use gdb to
> debug the kernel without issues. Unfortunately, I'm not able to debug
> /sbin/init after switching contex to user space.
>=20
> Moreover, gdbserver cannot be used as the error (and kernel OOPs) is
> caused when early code from ld-linux.so.3 (the _dl_start function) is
> executed.
>=20
>=20
> Any hints on how to debug it?
>=20
> Inspecting assembler is one (awkward) option (some results presented
> below). I can also inspect the VMA of the code just before starting
> the /sbin/init process.
>=20
> Unfortunately, when I try to break on user space code it is not very
> helpful (as -S -s are supposed to be used with kernel).
>=20
>=20
> Some info with the eligible code (_dl_start function):
> ------------------------------------------------------
>=20
> I think that the problem may be with having the negative value
> calculated.
>=20
> The relevant snipet:
>=20
>     116c:       bf00            nop
>     116e:       bf00            nop
>     1170:       bf00            nop
>     1172:       f8df 3508       ldr.w   r3, [pc, #1288] ; 167c
>     <_dl_start+0x520>
>=20
>     1176:       f8df 1508       ldr.w   r1, [pc, #1288] ; 1680
>     <_dl_start+0x524>
>=20
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
>=20
>=20
>     167c:       0002be92        .word   0x0002be92
>     1680:       ffffee80        .word   0xffffee80
>=20
> The r1 gets the 0xffffee80 (negative offset) value. It is then added
> to pc and used to calculate r2.
>=20
> For working code (aforementioned patch reverted) - there are NO such
> large values (like aforementioned 0xffffee80). The arithmetic is done
> on=20
>=20
>    1690:       00000020        .word   0x00000020
>    1694:       0002be7e        .word   0x0002be7e
>=20
> which seems to work.
>=20
> Maybe I'm missing some flag when I do start qemu-system-arm?
>=20
> Thanks in advance for help and hints.
>=20

Any help or feedback on this issue?

--=20
Best regards,

=C5=81ukasz Majewski

--Sig_/ylyEK59Z/pFjPesxOkVX3ZB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQS3sH/m++pp8gSfJvB/3+EbZjCCMQUCYURTRQAKCRB/3+EbZjCC
MUlIAJ42eB9cK86cB3h2vh9e+XgIwF+1CACfWsNPMTV6h4ZOgDxNcgsdkAetac4=
=IB5S
-----END PGP SIGNATURE-----

--Sig_/ylyEK59Z/pFjPesxOkVX3ZB--

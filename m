Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3711607lfb;
        Mon, 13 Sep 2021 07:12:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxH+wCwkVpXQFpzqzsLLDpDHKGGB5+ZhD6QFa/pEDhXw5/eRpQ1B2fpKuAPdMGClMXIKIpS
X-Received: by 2002:a05:600c:35cd:: with SMTP id r13mr11427305wmq.24.1631542359183;
        Mon, 13 Sep 2021 07:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631542359; cv=none;
        d=google.com; s=arc-20160816;
        b=UMq6FfN0JQ92WM90NIwuOvYm41eXMAic2dpTxY/A7Fe5ujhEuohuGRM33wDlQ1eNyL
         Tn4Khi1I5RwRmaRPEhGVvKH2SoaWG61N/DM6xvRxlfvgX9JcocdoUspHg1F6ymworI3T
         LU1LsED/mj6r9Eu9l7xRY4z8wDY+/XC2J3+YUQ/0NsNPwFuHseBSlydvomdg/rVAkA2t
         Dt07knU/YFweu5zpqdUZ1YIGlKfbPZM6rAYXUqxZ3KKO7Rgqg9GiZdd22dngH+9Tc2BA
         t8Crtj5smH+AAhjqMs1CDSuwnzRCZenXrQotYbwQsRHkfsedFRmOPEIhM36IIAHf88c+
         nmpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:subject
         :to:from:date;
        bh=keGVPbTisTZ6eZIpbddxEU9bfnfZKHWvSICYuygxwUk=;
        b=E5Ee7mvMKwVl0Sg9xUyevZKb6UHyk7TNc770um5aj/6ebBoMbbG7YSflBEYEAcGmVJ
         vMm7eSqqxJPwCPe9I3FJtuujF5+TQkY8WDIgL9tki8RgZOOLKZ16PIFGT9VdegCBQFsE
         imqojG02qSa9/4yWHZRg20Wm/S/lwD7As9QGBMlR4ituTf0V1qQORybEy8adyCuL8HCm
         y7oPsWuNlHFJrU1fsxYqMnJiAsZbKPjDqfx/VDaFm1q/nH+JZMnVmaPLL78TxFcZkZUL
         K7+hdEGALp+Ue0Nka85b1bBmKcaQC5F7UthVDnN4/FdJtDHKkNzepJo2ztwppnzve1i8
         ZFpw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6si8241471wrl.490.2021.09.13.07.12.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 07:12:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPmhK-0002mi-2a
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 10:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <l.majewski@majess.pl>)
 id 1mPhLW-0006U4-Nw; Mon, 13 Sep 2021 04:29:46 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:34193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <l.majewski@majess.pl>)
 id 1mPhLU-000582-E0; Mon, 13 Sep 2021 04:29:46 -0400
Received: from mxplan6.mail.ovh.net (unknown [10.109.138.194])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 80267BDA7DC7;
 Mon, 13 Sep 2021 10:29:31 +0200 (CEST)
Received: from majess.pl (37.59.142.102) by DAG9EX1.mxp6.local (172.16.2.81)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 13 Sep
 2021 10:29:30 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00483ddef17-2a78-4f99-9796-5498d3444bd5,
 70F5B69DB83BC5B6752B92651E346C8869157B2B) smtp.auth=l.majewski@majess.pl
X-OVh-ClientIp: 85.222.111.42
Date: Mon, 13 Sep 2021 10:29:17 +0200
From: Lukasz Majewski <l.majewski@majess.pl>
To: <qemu-arm@nongnu.org>
Subject: Problem with init debugging under QEMU ARM
Message-ID: <20210913102917.0bf933d8@ktm>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/nC_O1q382hnDRRJACgtJLM1";
 protocol="application/pgp-signature"
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG4EX2.mxp6.local (172.16.2.32) To DAG9EX1.mxp6.local
 (172.16.2.81)
X-Ovh-Tracer-GUID: d8c829f6-a30c-4735-981d-a77b5dd1bb7f
X-Ovh-Tracer-Id: 858780155621262045
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudegjedgtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkofggtghisehgtderreertdejnecuhfhrohhmpefnuhhkrghsiicuofgrjhgvfihskhhiuceolhdrmhgrjhgvfihskhhisehmrghjvghsshdrphhlqeenucggtffrrghtthgvrhhnpeejvdevkeehleegheeijeekieeuvdeikedvgffggeejvdefhfffheeigeekteffleenucffohhmrghinhepshhouhhrtggvfigrrhgvrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghniedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehlrdhmrghjvgifshhkihesmhgrjhgvshhsrdhplhdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=l.majewski@majess.pl;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 13 Sep 2021 10:08:44 -0400
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
X-TUID: 69nDIuFMfs/k

--Sig_/nC_O1q382hnDRRJACgtJLM1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Dear QEMU community,

I'm now trying to fix bug in glibc which became apparent on qemu 6.0.0.

The error is caused by glibc commit:
bca0f5cbc9257c13322b99e55235c4f21ba0bd82
https://sourceware.org/git/?p=3Dglibc.git;a=3Dblobdiff;f=3Dsysdeps/arm/dl-m=
achine.h;h=3Deb13cb8b57496a0ec175c54a495f7e78db978fb7;hp=3Dff5e09e207f7986b=
1506b8895ae6c2aff032a380;hb=3Dbca0f5cbc9257c13322b99e55235c4f21ba0bd82;hpb=
=3D34b4624b04fc8f038b2c329ca7560197320615b4

(reverting it causes the board to boot again)

Other components:
binutils_2.37
gcc_11.2
Yocto poky: SHA1: 1e2e9a84d6dd81d7f6dd69c0d119d0149d10ade1

Qemu start line (the problem is visible on 5.2.0 and 6.0.0):
qemu-system-arm -device
virtio-net-device,netdev=3Dnet0,mac=3D52:54:00:12:34:02 -netdev
tap,id=3Dnet0,ifnam e=3Dtap0,script=3Dno,downscript=3Dno -object
rng-random,filename=3D/dev/urandom,id=3Drng0 -device
virtio-rng-pci,rng=3Drng0 -drive
id=3Ddisk0,file=3Dy2038-image-devel-qemuarm.ext4,if=3Dnone,format
=3Draw -device virtio-blk-device,drive=3Ddisk0 -device qemu-xhci -device
usb-tablet -device usb-kbd  -machine virt,highmem=3Doff -cpu cortex-a15
-smp 4 -m 256 -serial mon:stdio -serial null -nographic -device
VGA,edid=3Don -kernel
zImage--5.10.62+git0+bce2813b16_machine-r0-qemuarm-20210910095636.bin
-append 'root=3D/dev/vda rw  mem=3D256M
ip=3D192.168.7.2::192.168.7.1:255.255.255.0 console=3DttyAMA0 console=3Dhvc0
vmalloc=3D256


It has been tested with Cortex-A9 (Vexpress A9 2 core board) and
Cortex-A15. I've also tested the v5.1, v5.10 and v5.14 kernels. The
error is persistent.

I do add -s and -S when starting qemu-system-arm. I can use gdb to
debug the kernel without issues. Unfortunately, I'm not able to debug
/sbin/init after switching contex to user space.

Moreover, gdbserver cannot be used as the error (and kernel OOPs) is
caused when early code from ld-linux.so.3 (the _dl_start function) is
executed.


Any hints on how to debug it?

Inspecting assembler is one (awkward) option (some results presented
below). I can also inspect the VMA of the code just before starting the
/sbin/init process.

Unfortunately, when I try to break on user space code it is not very
helpful (as -S -s are supposed to be used with kernel).


Some info with the eligible code (_dl_start function):
------------------------------------------------------

I think that the problem may be with having the negative value
calculated.

The relevant snipet:

    116c:       bf00            nop
    116e:       bf00            nop
    1170:       bf00            nop
    1172:       f8df 3508       ldr.w   r3, [pc, #1288] ; 167c
    <_dl_start+0x520>

    1176:       f8df 1508       ldr.w   r1, [pc, #1288] ; 1680
    <_dl_start+0x524>

    117a:       447b            add     r3, pc
    117c:       4479            add     r1, pc
    117e:       f8c3 1598       str.w   r1, [r3, #1432] ; 0x598
    1182:       bf00            nop
    1184:       bf00            nop
    1186:       bf00            nop
    1188:       bf00            nop
    118a:       bf00            nop
    118c:       bf00            nop
    118e:       f8df 24f4       ldr.w   r2, [pc, #1268] ; 1684
    <_dl_start+0x528> 1192:       f8d3 5598       ldr.w   r5, [r3,
    #1432] ; 0x598 1196:       447a            add     r2, pc
    1198:       442a            add     r2, r5
    119a:       1a52            subs    r2, r2, r1
    119c:       f8c3 25a0       str.w   r2, [r3, #1440] ; 0x5a0
    11a0:       6813            ldr     r3, [r2, #0]


    167c:       0002be92        .word   0x0002be92
    1680:       ffffee80        .word   0xffffee80

The r1 gets the 0xffffee80 (negative offset) value. It is then added to
pc and used to calculate r2.

For working code (aforementioned patch reverted) - there are NO such
large values (like aforementioned 0xffffee80). The arithmetic is done
on=20

   1690:       00000020        .word   0x00000020
   1694:       0002be7e        .word   0x0002be7e

which seems to work.

Maybe I'm missing some flag when I do start qemu-system-arm?

Thanks in advance for help and hints.

--=20
Best regards,

=C5=81ukasz Majewski

--Sig_/nC_O1q382hnDRRJACgtJLM1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQS3sH/m++pp8gSfJvB/3+EbZjCCMQUCYT8L3QAKCRB/3+EbZjCC
MTLsAJ9hKlztid/Zj6aeInIZPmaDvga5ggCguELuMQDdGnTd3I2hywFC4cI46ro=
=csxY
-----END PGP SIGNATURE-----

--Sig_/nC_O1q382hnDRRJACgtJLM1--

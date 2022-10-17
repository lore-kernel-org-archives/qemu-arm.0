Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id i29-20020a1c541d000000b003c41144b3cfsm16206111wmb.20.2022.10.17.10.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 10:27:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id EBB8E1FFB7;
	Mon, 17 Oct 2022 18:27:04 +0100 (BST)
References: <CAChpoR45q6huduz7J7jrOrJz3gqHYT+jr1j=QKnfmPbj=wd_pg@mail.gmail.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?B?4K6k4K6+4K6a4K+GIOCvqQ==?= <paxi.three@gmail.com>
Cc: qemu-arm@nongnu.org
Subject: Re: Running server from within qemu
Date: Mon, 17 Oct 2022 18:24:34 +0100
In-reply-to: <CAChpoR45q6huduz7J7jrOrJz3gqHYT+jr1j=QKnfmPbj=wd_pg@mail.gmail.com>
Message-ID: <878rlee4yf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: th6avSmnXJGi


=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AF=86 =E0=AF=A9 <paxi.three@gmail.com> write=
s:

> Hi,
>
> I am new to using QEMU.  Is it possible to host a simple http/tcp server =
on a Linux which is running on qemu, without any
> accompanying vm (KVM), and hit that http server from the host OS (say Win=
dows)? What options should I choose in army
> (command line args) to run any TCP based server from within qemu?
>
> As of now I use the following to start my OpenWRT Linux on QEMU:
> $ qemu-sysyem-arm -M vert-2.9 -kernel openwrt-22.03.1-armvirt-32-zImage -=
no-reboot -nographic -drive
> file=3Dopenwrt-32-rootfs-ext4.img,if=3Dvirtio,format=3Draw -append "root=
=3D/dev/vda" -m 1G -nic user -nic user
>

You have two nics in the command line. Anyway using a proper split
-netdev/-device specification:

  -netdev user,id=3Dunet,hostfwd=3Dtcp::2222-:22 -device virtio-net-pci,net=
dev=3Dunet

which in this case forwards tcp port 2222 on the host to port 22 on the
guest. Just don't expect brilliant performance.=20


> Thankyou


--=20
Alex Benn=C3=A9e

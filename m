Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id p4sm414672wrf.27.2018.04.09.05.45.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Apr 2018 05:45:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 1A2FC3E02A3;
	Mon,  9 Apr 2018 13:45:23 +0100 (BST)
References: <CAHP4M8VnuS5KijfVw9eDz41KPwaT4rJ+4VEU==EbBgdwgFKJhA@mail.gmail.com>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ajay Garg <ajaygargnsit@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, rumpkernel-users@freelists.org
Subject: Re: [Qemu-devel] Crash when running hello-world unikernel for ARM
In-reply-to: <CAHP4M8VnuS5KijfVw9eDz41KPwaT4rJ+4VEU==EbBgdwgFKJhA@mail.gmail.com>
Date: Mon, 09 Apr 2018 13:45:22 +0100
Message-ID: <87efjov999.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: hEGLGOoIyhYZ


Ajay Garg <ajaygargnsit@gmail.com> writes:

> Hi All.
>
> We did the following :
>
> a)
> Cross-compile rumprun for ARM on a linux x86_64 :
>
> ajay@latitude-3480:~/rumprun-arm-hw/rumprun$
> CC=3Darm-linux-gnueabihf-gcc ./build-rr.sh hw
<snip>
>
> c)
> Tried running on x86_64, via qemu, but got the crash :
>
> ######################################################################
> ajay@latitude-3480:~/rumprun-arm-hw/rumprun$ qemu-system-x86_64
> -nographic -kernel helloer.bin
> warning: TCG doesn't support requested feature: CPUID.01H:ECX.vmx [bit 5]
> qemu: fatal: Trying to execute code outside RAM or ROM at 0x00000000000a0=
1f1
>
<snip>
>
>
> Where should we be looking to start to fix?

qemu-system-x86_64 is expecting an x86 binary blob. I assume you need
qemu-system-arm. More importantly you need to specify a -M machine type
that matches whatever rumprun is expecting.

--
Alex Benn=C3=A9e

Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id ba18sm4577110wrb.40.2022.01.07.04.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 04:02:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 494721FFB7;
	Fri,  7 Jan 2022 12:02:18 +0000 (GMT)
References: <9405dfb2-01ea-d11c-5e8a-f0db5db73204@gmx.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: qemu-arm@nongnu.org, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: How to get the supported page sizes of aarch64? (and possible
 other architectures)
Date: Fri, 07 Jan 2022 11:46:58 +0000
In-reply-to: <9405dfb2-01ea-d11c-5e8a-f0db5db73204@gmx.com>
Message-ID: <87tuefhhyt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: USUsCFNUedAh


Qu Wenruo <quwenruo.btrfs@gmx.com> writes:

> Hi,
>
> Recently I'm trying to boot a kernel with 16K page size, but edk2
> firmware failed to load the kernel on my CM4, with unsupported message:
>
>  Failed to execute Archlinux ARM (\Image-custom): Unsupported
>
> While 4K and 64K page sized kernels are fine to boot.
>
> A quick search shows that Cortex A processors support 4K and 64K page
> size, and 16K page size is not a mandatory requirement.
>
> On the other hand, other aarch64 processors, like Apple M1 only supports
> 4K and 16K page size, no 64K page size support.
>
>
> Although ARM documents show ID_AA64MMFR0_EL1 would report such info, is
> there any user space tool or kernel messages to show an
> end-user-friendly output about what page sizes are support?

Not that I'm aware of but a chunk of the ID registers are exposed to
user space to read (although some bits are masked). I think the kernel
hides the translation granules support and I think only exposes the page
size the kernel has booted into.

I guess you could hack the kernel to dump the real ID register value in
dmesg or something like that?

>
> Thanks,
> Qu


--=20
Alex Benn=C3=A9e

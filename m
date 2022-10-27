Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id j8-20020a5d6188000000b0022e035a4e93sm577041wru.87.2022.10.27.01.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 01:40:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 14A9E1FFB7;
	Thu, 27 Oct 2022 09:40:17 +0100 (BST)
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-11-vikram.garhwal@amd.com>
 <3e504b1b-197d-b77b-16e1-86530eb3d64c@xen.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: Vikram Garhwal <vikram.garhwal@amd.com>, stefano.stabellini@amd.com,
 Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul
 Durrant <paul@xen.org>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v1 10/12] hw/arm: introduce xenpv machine
Date: Thu, 27 Oct 2022 09:37:43 +0100
In-reply-to: <3e504b1b-197d-b77b-16e1-86530eb3d64c@xen.org>
Message-ID: <87k04l3bim.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: hu9tBvDAiCcE


Julien Grall <julien@xen.org> writes:

> Hi,
>
> There seem to be some missing patches on xen-devel (including the
> cover letter). Is that expected?
>
> On 15/10/2022 06:07, Vikram Garhwal wrote:
>> Add a new machine xenpv which creates a IOREQ server to register/connect=
 with
>> Xen Hypervisor.
>
> I don't like the name 'xenpv' because it doesn't convey the fact that
> some of the HW may be emulated rather than para-virtualized. In fact
> one may only want to use for emulating devices.
>
> Potential name would be 'xen-arm' or re-using 'virt' but with
> 'accel=3Dxen' to select a Xen layout.

I don't think you can re-use the machine name and select by accelerator
because the virt machine does quite a lot of other stuff this model
doesn't support. However I've been calling this concept "xen-virt" or
maybe the explicit "xen-virtio" because that is what it is targeting.

--=20
Alex Benn=C3=A9e

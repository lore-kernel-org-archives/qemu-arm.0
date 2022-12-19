Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id p13-20020a05600c1d8d00b003d01b84e9b2sm12572845wms.27.2022.12.19.05.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 05:30:35 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4B5B21FFB7;
	Mon, 19 Dec 2022 13:30:35 +0000 (GMT)
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
 <20221202030003.11441-11-vikram.garhwal@amd.com>
 <871qphc0p3.fsf@linaro.org> <ade61d47-f8c0-09cc-1a44-faaaff87d76a@amd.com>
 <alpine.DEB.2.22.394.2212021429220.4039@ubuntu-linux-20-04-desktop>
 <d87025d8-b653-d80e-22c0-05f052447706@xen.org>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Vikram Garhwal
 <vikram.garhwal@amd.com>, qemu-dev@xilinx.com, stefano.stabellini@amd.com,
 xen-devel@lists.xenproject.org, Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>
Subject: Re: [QEMU][PATCH v2 10/11] hw/arm: introduce xenpv machine
Date: Mon, 19 Dec 2022 13:28:46 +0000
In-reply-to: <d87025d8-b653-d80e-22c0-05f052447706@xen.org>
Message-ID: <87bknzldvo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: dg1+JX3g4n4h


Julien Grall <julien@xen.org> writes:

> Hi,
>
> On 02/12/2022 22:36, Stefano Stabellini wrote:
>>> Do you know what Xen version your build env has?
>> I think Alex is just building against upstream Xen. GUEST_TPM_BASE
>> is
>> not defined there yet. I think we would need to introduce in
>> xen_common.h something like:
>> #ifndef GUEST_TPM_BASE
>> #define GUEST_TPM_BASE 0x0c000000
>> #endif
>
> I think this would be a big mistake to add the two lines above in QEMU.
>
> Libxl is responsible for creating the domain and generating the
> firwmare tables. Any mismatch of values will be a real pain to debug.
>
> Even if...
>
>> We already have similar code in xen_common.h for other things.
>> Also, it
>> would be best to get GUEST_TPM_BASE defined upstream in Xen first.
>
> ... we introduce upstream first, the guest layout is not part of the
> stable ABI and therefore could change from release to release.
>
>>=20
>>> Another way to fix this(as Julien suggested) is by setting this GUEST_T=
PM_BASE
>>> value via a property or something and user can set it via command line.
>>>
>>> @sstabellini@kernel.org, do you think of any other fix?
>> Setting the TPM address from the command line is nice and preferable
>> to
>> hardcoding the value in xen_common.h. It comes with the challenge that
>> it is not very scalable (imagine we have a dozen emulated devices) but
>> for now it is fine and a good way to start if you can arrange it.
>
> It is not clear which one you think is not scalable. If this is the
> command line option approach, then I think this is unrealistic to ask
> every user to rebuild there QEMU just because the guest layout has
> changed.
>
> Today the rebuild may only be necessary when switching to a new
> release. But in the future we may imagine a per-domain layout (e.g.
> for legacy purpose). So you will now need to request the user to have
> one QEMU built per domain.

I agree if this is something that can change it needs to be configured
from the command line or somehow otherwise gleaned from the source of
truth. Isn't this information available via XenStore? Isn't that what
Viresh has to do for all the VirtIO devices he's adding to libxl?

A default value for the option could be done I guess.

>
> How is that scalable?
>
> Cheers,


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

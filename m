Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id p4-20020a5d68c4000000b003232f167df5sm18617137wrw.108.2023.10.12.07.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 07:58:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7FE501FFBB;
	Thu, 12 Oct 2023 15:58:35 +0100 (BST)
References: <20231011165234.1323725-1-quic_svaddagi@quicinc.com>
 <20231011165234.1323725-13-quic_svaddagi@quicinc.com>
 <31ae6951-2f32-ab86-4ddc-aa70364a89ce@linaro.org>
 <20231012123338.GF1130358@quicinc.com>
User-agent: mu4e 1.11.22; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
Cc: Philippe Mathieu-Daud? <philmd@linaro.org>, peter.maydell@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, quic_tsoni@quicinc.com,
 quic_pheragu@quicinc.com, quic_eberman@quicinc.com,
 quic_yvasi@quicinc.com, quic_cvanscha@quicinc.com,
 quic_mnalajal@quicinc.com, Brian Cain <bcain@quicinc.com>, Mark Burton
 <mburton@qti.qualcomm.com>
Subject: Re: [RFC/PATCH v0 12/12] gunyah: Documentation
Date: Thu, 12 Oct 2023 15:55:59 +0100
In-reply-to: <20231012123338.GF1130358@quicinc.com>
Message-ID: <87ttqvnazo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: rsb90NqCLFLQ


Srivatsa Vaddagiri <quic_svaddagi@quicinc.com> writes:

> * Philippe Mathieu-Daud? <philmd@linaro.org> [2023-10-12 06:52:04]:
>
>> > +Limitations
>> > +-----------
>> > +
>> > +Below features are not yet supported.
>> > +
>> > +* virtio-pci (support for which in Qemu seems to rely heavily on KVM,=
 which
>> > +  needs to be made multi-hypervisor friendly).
>>=20
>> Is QUIC interested in working on that? My work introducing
>> AccelCPUState to make CPUState accel-agnostic was done in that
>> direction, but I didn't notice much interest in the community
>> so I unprioritized it.
>
> Hi Phil,
> 	We do want to see Gunyah support merged in Qemu at the earliest (as soon
> as the kernel driver is merged upstream that is), so any dependent change=
 in
> Qemu for Gunyah would be of much interest to us! I am not sure though if =
Quic
> can sign up for the entire "make cpustate accel agnostic" work. Can you p=
oint
> to your ongoing work that I could take a look at? Would that address virt=
io-pci
> becoming accelerator agnostic?

Why wouldn't virtio-pci be accelerator agnostic?

It works with KVM and TCG for example. There are I suppose complications
if you want to share emulated devices with a real PCI bus rather than
emulating it all within QEMU.

>
> Thanks!
> vatsa


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

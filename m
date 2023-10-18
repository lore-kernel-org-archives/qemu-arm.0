Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id c12-20020adfe70c000000b0031c6e1ea4c7sm2389298wrm.90.2023.10.18.09.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 09:09:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id ACF4B1FFBB;
	Wed, 18 Oct 2023 17:09:25 +0100 (BST)
References: <20231011165234.1323725-1-quic_svaddagi@quicinc.com>
 <20231011165234.1323725-13-quic_svaddagi@quicinc.com>
 <31ae6951-2f32-ab86-4ddc-aa70364a89ce@linaro.org>
 <20231012123338.GF1130358@quicinc.com> <87ttqvnazo.fsf@linaro.org>
 <20231017092152.GA689217@quicinc.com>
User-agent: mu4e 1.11.22; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
Cc: Philippe Mathieu-Daud? <philmd@linaro.org>, peter.maydell@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, quic_tsoni@quicinc.com,
 quic_pheragu@quicinc.com, quic_eberman@quicinc.com,
 quic_yvasi@quicinc.com, quic_cvanscha@quicinc.com,
 quic_mnalajal@quicinc.com, Brian Cain <bcain@quicinc.com>, Mark Burton
 <mburton@qti.qualcomm.com>, Michael S. Tsirkin <mst@redhat.com>
Subject: Re: [RFC/PATCH v0 12/12] gunyah: Documentation
Date: Wed, 18 Oct 2023 16:54:08 +0100
In-reply-to: <20231017092152.GA689217@quicinc.com>
Message-ID: <87jzrjap56.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: DEJw5jzMoZAs


Srivatsa Vaddagiri <quic_svaddagi@quicinc.com> writes:

(add VirtIO maintainer MST to CC)

> * Alex Benn?e <alex.bennee@linaro.org> [2023-10-12 15:55:59]:
>
>> > Hi Phil,
>> > 	We do want to see Gunyah support merged in Qemu at the earliest (as s=
oon
>> > as the kernel driver is merged upstream that is), so any dependent cha=
nge in
>> > Qemu for Gunyah would be of much interest to us! I am not sure though =
if Quic
>> > can sign up for the entire "make cpustate accel agnostic" work. Can yo=
u point
>> > to your ongoing work that I could take a look at? Would that address v=
irtio-pci
>> > becoming accelerator agnostic?
>>=20
>> Why wouldn't virtio-pci be accelerator agnostic?
>
> I checked usage of few KVM APIs in virtio-pci.c. I think most of them are=
 to do
> with use of MSI and IRQFD. If lets say we are not supporting MSI, then I =
*think*
> current virtio-pci should work just fine. It would use virtio_pci_notify =
->
> pci_set_irq -> .. -> qemu_set_irq, which should land in
> gunyah_arm_gicv3_set_irq [Patch 7/12] AFAICT. Let me try getting virtio-p=
ci
> working and then I can update this thread again!

Hmm yeah looking at the file the relationship between KVM and virtio-pci
is a bit tangled up. Fundamentally the reason I say virtio-pci should be
accelerator agnostic is that we use virtio-pci under TCG emulation with
no KVM at all. IOW if all of the PCI emulation is done within QEMU there
should be no limit to which accelerators support it.

(warning! potentially incomplete understanding ahead)

However as you have seen there is an optimisation where KVM can take
over some of the PCI bus emulation and instead of synchronous
trap-and-exit to QEMU simply queues MSIs on irqfd which QEMU can then
consume the events and behave appropriately. I'm not sure what happens
with real PCI buses and pass-through sitting alongside virtual PCI
devices.

I suspect other hypervisors might want to support a similar thing and
even might end up re-using the irqfd mechanism for signalling events
from the hypervisor to the VMM. So Philippe's suggestion to fix this
would be to properly abstract whats needed to set this up and then clean
up the hardwired case with a generalised class representing the
in-[kernel|hypervisor] interface. Gunyah could then provide an
implementation of that interface if it ever supports injecting MSIs
directly.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

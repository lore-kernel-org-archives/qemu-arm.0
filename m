Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1190b68sm9598520f8f.86.2025.06.23.09.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 09:01:22 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 7E1DF5F815;
	Mon, 23 Jun 2025 17:01:20 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
  qemu-arm@nongnu.org,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Roman
 Bolshakov <rbolshakov@ddn.com>,  Paolo Bonzini <pbonzini@redhat.com>,
  Alexander Graf <agraf@csgraf.de>,  Bernhard Beschow <shentey@gmail.com>,
  John Snow <jsnow@redhat.com>,  Thomas Huth <thuth@redhat.com>,
  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
  kvm@vger.kernel.org,
  Eric Auger <eric.auger@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  Cameron Esfahani <dirty@apple.com>,  Cleber
 Rosa <crosa@redhat.com>,  Radoslaw Biernacki <rad@semihalf.com>,  Phil
 Dennis-Jordan <phil@philjordan.eu>,  Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 26/26] tests/functional: Expand Aarch64 SMMU tests to
 run on HVF accelerator
In-Reply-To: <a8a4d2f7-2341-4cdb-8ca9-8deda337434c@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 23 Jun 2025 17:18:26
 +0200")
References: <20250623121845.7214-1-philmd@linaro.org>
	<20250623121845.7214-27-philmd@linaro.org>
	<87sejq1otw.fsf@draig.linaro.org>
	<a8a4d2f7-2341-4cdb-8ca9-8deda337434c@linaro.org>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Mon, 23 Jun 2025 17:01:20 +0100
Message-ID: <87ms9y1m7j.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: cyaFJMvkCBMA

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 23/6/25 17:04, Alex Benn=C3=A9e wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>>=20
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>>> ---
>>>   tests/functional/test_aarch64_smmu.py | 12 +++++++++---
>>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/tests/functional/test_aarch64_smmu.py b/tests/functional/t=
est_aarch64_smmu.py
>>> index c65d0f28178..e0f4a922176 100755
>>> --- a/tests/functional/test_aarch64_smmu.py
>>> +++ b/tests/functional/test_aarch64_smmu.py
>>> @@ -17,7 +17,7 @@
>>>     from qemu_test import LinuxKernelTest, Asset,
>>> exec_command_and_wait_for_pattern
>>>   from qemu_test import BUILD_DIR
>>> -from qemu.utils import kvm_available
>>> +from qemu.utils import kvm_available, hvf_available
>>>       class SMMU(LinuxKernelTest):
>>> @@ -45,11 +45,17 @@ def set_up_boot(self, path):
>>>           self.vm.add_args('-device', 'virtio-net,netdev=3Dn1' + self.I=
OMMU_ADDON)
>>>         def common_vm_setup(self, kernel, initrd, disk):
>>> -        self.require_accelerator("kvm")
>>> +        if hvf_available(self.qemu_bin):
>>> +            accel =3D "hvf"
>>> +        elif kvm_available(self.qemu_bin):
>>> +            accel =3D "kvm"
>>> +        else:
>>> +            self.skipTest("Neither HVF nor KVM accelerator is availabl=
e")
>>> +        self.require_accelerator(accel)
>> I think this is fine so:
>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> Thanks.
>
>> However I wonder if something like:
>>          hwaccel =3D self.require_hw_accelerator()
>> Could fetch the appropriate platform accelerator for use in -accel
>> bellow?
>
> Then we'd need to make it per-host arch, and I'm pretty sure hw
> accelerators don't support the same features. So I'd expect a
> rather painful experience. WDYT?

Aren't the features a function of the machine type rather than the host?
Shouldn't an -M virt machine look the same on TCG, KVM and HVF
regardless of the underlying accelerator?

I guess there are cases like split-irqchip which affect the
implementation but hopefully not the guest view of things.

Do you have an example?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

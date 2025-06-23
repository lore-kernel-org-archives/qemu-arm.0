Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1193792sm9790132f8f.97.2025.06.23.08.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:04:45 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 0B6EA5F815;
	Mon, 23 Jun 2025 16:04:44 +0100 (BST)
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
In-Reply-To: <20250623121845.7214-27-philmd@linaro.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 23 Jun 2025 14:18:45
 +0200")
References: <20250623121845.7214-1-philmd@linaro.org>
	<20250623121845.7214-27-philmd@linaro.org>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Mon, 23 Jun 2025 16:04:43 +0100
Message-ID: <87sejq1otw.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: RSGgN61C/oGM

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  tests/functional/test_aarch64_smmu.py | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/tests/functional/test_aarch64_smmu.py b/tests/functional/tes=
t_aarch64_smmu.py
> index c65d0f28178..e0f4a922176 100755
> --- a/tests/functional/test_aarch64_smmu.py
> +++ b/tests/functional/test_aarch64_smmu.py
> @@ -17,7 +17,7 @@
>=20=20
>  from qemu_test import LinuxKernelTest, Asset, exec_command_and_wait_for_=
pattern
>  from qemu_test import BUILD_DIR
> -from qemu.utils import kvm_available
> +from qemu.utils import kvm_available, hvf_available
>=20=20
>=20=20
>  class SMMU(LinuxKernelTest):
> @@ -45,11 +45,17 @@ def set_up_boot(self, path):
>          self.vm.add_args('-device', 'virtio-net,netdev=3Dn1' + self.IOMM=
U_ADDON)
>=20=20
>      def common_vm_setup(self, kernel, initrd, disk):
> -        self.require_accelerator("kvm")
> +        if hvf_available(self.qemu_bin):
> +            accel =3D "hvf"
> +        elif kvm_available(self.qemu_bin):
> +            accel =3D "kvm"
> +        else:
> +            self.skipTest("Neither HVF nor KVM accelerator is available")
> +        self.require_accelerator(accel)

I think this is fine so:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

However I wonder if something like:

        hwaccel =3D self.require_hw_accelerator()=20

Could fetch the appropriate platform accelerator for use in -accel bellow?

>          self.require_netdev('user')
>          self.set_machine("virt")
>          self.vm.add_args('-m', '1G')
> -        self.vm.add_args("-accel", "kvm")
> +        self.vm.add_args("-accel", accel)
>          self.vm.add_args("-cpu", "host")
>          self.vm.add_args("-machine", "iommu=3Dsmmuv3")
>          self.vm.add_args("-d", "guest_errors")

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

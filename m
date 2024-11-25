Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432f643e65bsm181717675e9.0.2024.11.25.10.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 10:00:31 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id BA1725F869;
	Mon, 25 Nov 2024 18:00:29 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org,  mathieu.poirier@linaro.org,
  gustavo.romero@linaro.org,  jean-philippe@linaro.org,
  qemu-arm@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] tests/functional/aarch64_virt: add test for FEAT_RME
In-Reply-To: <20241125065950.1179068-1-pierrick.bouvier@linaro.org> (Pierrick
	Bouvier's message of "Sun, 24 Nov 2024 22:59:50 -0800")
References: <20241125065950.1179068-1-pierrick.bouvier@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 25 Nov 2024 18:00:29 +0000
Message-ID: <8734jfchxe.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: EY0ql3bMfB8T

Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:

> This boot an OP-TEE environment, and launch a nested guest VM inside it
> using the Realms feature.
>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  tests/functional/test_aarch64_virt.py | 62 +++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>
> diff --git a/tests/functional/test_aarch64_virt.py b/tests/functional/tes=
t_aarch64_virt.py
> index 30bab5a677c..3e8f9372132 100755
> --- a/tests/functional/test_aarch64_virt.py
> +++ b/tests/functional/test_aarch64_virt.py
> @@ -18,6 +18,7 @@
>  from qemu_test import QemuSystemTest, Asset
>  from qemu_test import exec_command, wait_for_console_pattern
>  from qemu_test import get_qemu_img, run_cmd
> +from qemu_test.utils import archive_extract
>=20=20
>=20=20
>  class Aarch64VirtMachine(QemuSystemTest):
> @@ -129,6 +130,67 @@ def test_aarch64_virt_gicv2(self):
>          return
>          self.common_aarch64_virt("virt,gic-version=3D2")
>=20=20
> +    # Stack is built with OP-TEE build environment from those instructio=
ns:
> +    # https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29051027459/
> +    # https://github.com/pbo-linaro/qemu-rme-stack
> +    ASSET_RME_STACK =3D Asset(
> +        ('https://fileserver.linaro.org/s/JX7oNgfDeGXSxcY/'
> +         'download/rme-stack-op-tee-4.2.0.tar.gz'),
> +         '1f240f55e8a7a66489c2b7db5d40391e5dcfdd54c82600bd0d4b2145b9a0fb=
fb')
> +
> +    # This tests the FEAT_RME cpu implementation, by booting a VM suppor=
ting it,
> +    # and launching a nested VM using it.
> +    def test_aarch64_virt_rme(self):
> +        stack_path_tar_gz =3D self.ASSET_RME_STACK.fetch()
> +        archive_extract(stack_path_tar_gz, self.workdir)
> +
> +        self.set_machine('virt')
> +        self.vm.set_console()
> +        self.require_accelerator('tcg')
> +
> +        rme_stack =3D os.path.join(self.workdir, 'rme-stack')
> +        kernel =3D os.path.join(rme_stack, 'out', 'bin', 'Image')
> +        bios =3D os.path.join(rme_stack, 'out', 'bin', 'flash.bin')
> +        drive =3D os.path.join(rme_stack, 'out-br', 'images', 'rootfs.ex=
t4')
> +
> +        self.vm.add_args('-accel', 'tcg')
> +        self.vm.add_args('-cpu', 'max,x-rme=3Don')
> +        self.vm.add_args('-m', '2048')
> +        self.vm.add_args('-M', 'virt,acpi=3Doff,'
> +                         'virtualization=3Don,'
> +                         'secure=3Don,'
> +                         'gic-version=3D3')
> +        self.vm.add_args('-bios', bios)
> +        self.vm.add_args('-kernel', kernel)
> +        self.vm.add_args('-drive', f'format=3Draw,if=3Dnone,file=3D{driv=
e},id=3Dhd0')
> +        self.vm.add_args('-device', 'virtio-blk-pci,drive=3Dhd0')
> +        self.vm.add_args('-device', 'virtio-9p-device,fsdev=3Dshr0,mount=
_tag=3Dshr0')
> +        self.vm.add_args('-fsdev', f'local,security_model=3Dnone,path=3D=
{rme_stack},id=3Dshr0')
> +        self.vm.add_args('-device', 'virtio-net-pci,netdev=3Dnet0')
> +        self.vm.add_args('-netdev', 'user,id=3Dnet0')
> +        self.vm.add_args('-append', 'root=3D/dev/vda')
> +
> +        self.vm.launch()
> +        self.wait_for_console_pattern('Welcome to Buildroot')
> +        time.sleep(0.1)
> +        exec_command(self, 'root')
> +        time.sleep(0.1)
> +
> +        # We now boot the (nested) guest VM
> +        exec_command(self,
> +                     'qemu-system-aarch64 -M virt,gic-version=3D3 '
> +                     '-cpu host -enable-kvm -m 512M '
> +                     '-M confidential-guest-support=3Drme0 '
> +                     '-object rme-guest,id=3Drme0,measurement-algo=3Dsha=
512 '
> +                     '-device virtio-net-pci,netdev=3Dnet0,romfile=3D '
> +                     '-netdev user,id=3Dnet0 '
> +                     '-kernel /mnt/out/bin/Image '
> +                     '-initrd /mnt/out-br/images/rootfs.cpio '
> +                     '-serial stdio')
> +        # Detect Realm activation during boot.
> +        self.wait_for_console_pattern('SMC_RMI_REALM_ACTIVATE')
> +        # Wait for boot to complete.
> +        self.wait_for_console_pattern('Welcome to Buildroot')

This is the same as above? Or the console of the guest?

Could we also check the output of the other serial posts?

>=20=20
>  if __name__ =3D=3D '__main__':
>      QemuSystemTest.main()

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

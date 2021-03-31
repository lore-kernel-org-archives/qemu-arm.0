Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id r1sm7184348wrj.63.2021.03.31.08.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 08:47:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 51A541FF7E;
	Wed, 31 Mar 2021 16:47:51 +0100 (BST)
References: <20200929224857.1225107-1-philmd@redhat.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Willian Rampazzo <willianr@redhat.com>, qemu-arm@nongnu.org, Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] tests/acceptance: Add a 'virt_kvm' test using the GICv3
Date: Wed, 31 Mar 2021 16:45:25 +0100
In-reply-to: <20200929224857.1225107-1-philmd@redhat.com>
Message-ID: <87eefvnx3s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: K+BEgaABEPx4


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> The current 'virt_kvm' test is restricted to GICv2, but can also
> work with a GICv3. Duplicate it but add a GICv3 test which can be
> tested on some hardware.
>
> Noticed while running:
>
>  $ avocado --show=3Dapp run -t machine:virt tests/acceptance/
>  ...
>  (2/6) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm: ERR=
OR: Unexpected empty reply from server (1.82 s)
>
> The job.log content is:
>
>   L0351 DEBUG| Output: 'qemu-system-aarch64: host does not support in-ker=
nel GICv2 emulation\n'
>
> With this patch:
>
>  $ avocado --show=3Dapp run -t device:gicv3 tests/acceptance/
>  (1/1)
>  tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv3:
>  PASS (55.10 s)

On the new aarch64 machine which is GICv3 I get the following:

 (006/142) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gi=
cv2: ERROR: Unexpected empty reply from server (0.47 s)

which it shouldn't have run. However:

  ./tests/venv/bin/avocado --show=3Dapp run -t device:gic3 tests/acceptance/
  Test Suite could not be create. No test references provided nor any other=
 arguments resolved into tests

Is this something that has regressed or am I doing it wrong?

>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  tests/acceptance/boot_linux.py | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux=
.py
> index 0055dc7cee..c743e231f4 100644
> --- a/tests/acceptance/boot_linux.py
> +++ b/tests/acceptance/boot_linux.py
> @@ -182,10 +182,11 @@ def test_virt_tcg(self):
>          self.add_common_args()
>          self.launch_and_wait()
>=20=20
> -    def test_virt_kvm(self):
> +    def test_virt_kvm_gicv2(self):
>          """
>          :avocado: tags=3Daccel:kvm
>          :avocado: tags=3Dcpu:host
> +        :avocado: tags=3Ddevice:gicv2
>          """
>          if not kvm_available(self.arch, self.qemu_bin):
>              self.cancel(KVM_NOT_AVAILABLE)
> @@ -195,6 +196,20 @@ def test_virt_kvm(self):
>          self.add_common_args()
>          self.launch_and_wait()
>=20=20
> +    def test_virt_kvm_gicv3(self):
> +        """
> +        :avocado: tags=3Daccel:kvm
> +        :avocado: tags=3Dcpu:host
> +        :avocado: tags=3Ddevice:gicv3
> +        """
> +        if not kvm_available(self.arch, self.qemu_bin):
> +            self.cancel(KVM_NOT_AVAILABLE)
> +        self.vm.add_args("-accel", "kvm")
> +        self.vm.add_args("-cpu", "host")
> +        self.vm.add_args("-machine", "virt,gic-version=3D3")
> +        self.add_common_args()
> +        self.launch_and_wait()
> +
>=20=20
>  class BootLinuxPPC64(BootLinux):
>      """


--=20
Alex Benn=C3=A9e

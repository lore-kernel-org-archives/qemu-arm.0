Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b658b5dsm3518993f8f.3.2025.03.28.13.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 13:05:21 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 36F9A5F839;
	Fri, 28 Mar 2025 20:05:20 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org,  richard.henderson@linaro.org,
  berrange@redhat.com,  peter.maydell@linaro.org,  qemu-arm@nongnu.org,
  thuth@redhat.com
Subject: Re: [PATCH] tests/functional/test_aarch64_rme_virt: fix sporadic
 failure
In-Reply-To: <20250328183816.2687925-1-pierrick.bouvier@linaro.org> (Pierrick
	Bouvier's message of "Fri, 28 Mar 2025 11:38:16 -0700")
References: <20250328183816.2687925-1-pierrick.bouvier@linaro.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 28 Mar 2025 20:05:20 +0000
Message-ID: <877c482a67.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: mGnHRj4h46mP

Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:

> This test was randomly failing on our CI, and on dev machines,
> especially with QEMU debug builds.
>
> From the information collected, it's related to an implementation choice
> in edk2 QEMU virt support. The workaround is to disable KASLR, to avoid
> accessing protected memory.
> Note: this is *not* needed for the similar test_aarch64_rme_sbsaref.
>
> More information is available on the associated GitLab issue.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2823
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  tests/functional/test_aarch64_rme_virt.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tests/functional/test_aarch64_rme_virt.py b/tests/functional=
/test_aarch64_rme_virt.py
> index f4ad4d33d58..a1abf584f0e 100755
> --- a/tests/functional/test_aarch64_rme_virt.py
> +++ b/tests/functional/test_aarch64_rme_virt.py
> @@ -87,7 +87,9 @@ def test_aarch64_rme_virt(self):
>          self.vm.add_args('-fsdev', f'local,security_model=3Dnone,path=3D=
{rme_stack},id=3Dshr0')
>          self.vm.add_args('-device', 'virtio-net-pci,netdev=3Dnet0')
>          self.vm.add_args('-netdev', 'user,id=3Dnet0')
> -        self.vm.add_args('-append', 'root=3D/dev/vda')
> +        # We need to add nokaslr to avoid triggering this sporadic bug:
> +        # https://gitlab.com/qemu-project/qemu/-/issues/2823
> +        self.vm.add_args('-append', 'root=3D/dev/vda nokaslr')
>=20=20
>          self.vm.launch()
>          # Wait for host VM boot to complete.
--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

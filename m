Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id j18-20020adfea52000000b002206203ed3dsm6345153wrn.29.2022.08.29.02.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 02:32:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 82E291FFB7;
	Mon, 29 Aug 2022 10:32:34 +0100 (BST)
References: <20220829080940.110831-1-thuth@redhat.com>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Wainer dos Santos
 Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>, Alistair Francis
 <alistair@alistair23.me>, "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH for-7.2] tests/avocado/boot_linux_console: Fix the
 test_aarch64_xlnx_versal_virt test
Date: Mon, 29 Aug 2022 10:32:24 +0100
In-reply-to: <20220829080940.110831-1-thuth@redhat.com>
Message-ID: <878rn7xuml.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: mscdN9sj/YTs


Thomas Huth <thuth@redhat.com> writes:

> The assets that this test tries to download have been removed from the
> server. Update to a newer version to get it working again.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/avocado/boot_linux_console.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_lin=
ux_console.py
> index 6b1533c17c..f26e036ab5 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -335,13 +335,13 @@ def test_aarch64_xlnx_versal_virt(self):
>          """
>          images_url =3D ('http://ports.ubuntu.com/ubuntu-ports/dists/'
>                        'bionic-updates/main/installer-arm64/'
> -                      '20101020ubuntu543.15/images/')
> +                      '20101020ubuntu543.19/images/')
>          kernel_url =3D images_url + 'netboot/ubuntu-installer/arm64/linu=
x'
> -        kernel_hash =3D '5bfc54cf7ed8157d93f6e5b0241e727b6dc22c50'
> +        kernel_hash =3D 'e167757620640eb26de0972f578741924abb3a82'
>          kernel_path =3D self.fetch_asset(kernel_url, asset_hash=3Dkernel=
_hash)
>=20=20
>          initrd_url =3D images_url + 'netboot/ubuntu-installer/arm64/init=
rd.gz'
> -        initrd_hash =3D 'd385d3e88d53e2004c5d43cbe668b458a094f772'
> +        initrd_hash =3D 'cab5cb3fcefca8408aa5aae57f24574bfce8bdb9'
>          initrd_path =3D self.fetch_asset(initrd_url, asset_hash=3Dinitrd=
_hash)
>=20=20
>          self.vm.set_console()

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

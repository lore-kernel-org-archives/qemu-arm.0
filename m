Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id t13sm46878630wra.70.2019.10.08.08.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 08:33:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6CC8F1FF87;
	Tue,  8 Oct 2019 16:33:33 +0100 (BST)
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-16-f4bug@amsat.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?Q?Zolt=C3=A1n?=
 Baldaszti <bztemail@gmail.com>, Laurent Bonnans
 <laurent.bonnans@here.com>, Esteban Bosse <estebanbosse@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Philippe =?utf-8?Q?Mathieu-Dau?=
 =?utf-8?Q?d=C3=A9?=
 <f4bug@amsat.org>, Andrew Baumann <Andrew.Baumann@microsoft.com>, BALATON
 Zoltan <balaton@eik.bme.hu>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, Clement Deschamps
 <clement.deschamps@antfield.fr>, Cleber Rosa <crosa@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Cheng Xiang <ext-cheng.xiang@here.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Pekka Enberg
 <penberg@iki.fi>,
 Guenter Roeck <linux@roeck-us.net>, Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 15/19] tests/boot_linux_console: Extract the gunzip()
 helper
In-reply-to: <20190926173428.10713-16-f4bug@amsat.org>
Date: Tue, 08 Oct 2019 16:33:33 +0100
Message-ID: <87o8yri75e.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: dqRRa/wY1pQF


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> We are going to use the same pattern. Instead of keeping
> copy/pasting this code, extract as a local function.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  tests/acceptance/boot_linux_console.py | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/bo=
ot_linux_console.py
> index 8a9a314ab4..079590f0c8 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -19,6 +19,11 @@ from avocado.utils import process
>  from avocado.utils import archive
>
>
> +def gunzip(in_pathname_gz, out_pathname):
> +    with gzip.open(in_pathname_gz, 'rb') as f_in:
> +        with open(out_pathname, 'wb') as f_out:
> +            shutil.copyfileobj(f_in, f_out)
> +
>  class BootLinuxConsole(Test):
>      """
>      Boots a Linux kernel and checks that the console is operational and =
the
> @@ -166,10 +171,7 @@ class BootLinuxConsole(Test):
>          initrd_hash =3D 'bf806e17009360a866bf537f6de66590de349a99'
>          initrd_path_gz =3D self.fetch_asset(initrd_url, asset_hash=3Dini=
trd_hash)
>          initrd_path =3D self.workdir + "rootfs.cpio"
> -
> -        with gzip.open(initrd_path_gz, 'rb') as f_in:
> -            with open(initrd_path, 'wb') as f_out:
> -                shutil.copyfileobj(f_in, f_out)
> +        gunzip(initrd_path_gz, initrd_path)
>
>          self.vm.set_machine('malta')
>          self.vm.set_console()


--
Alex Benn=C3=A9e

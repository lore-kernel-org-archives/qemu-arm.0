Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id y17sm2899637wrw.90.2021.04.30.09.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 09:41:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A5E9B1FF7E;
	Fri, 30 Apr 2021 17:41:08 +0100 (BST)
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-13-philmd@redhat.com>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>, Eduardo
 Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org, Paolo Bonzini
 <pbonzini@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, =?utf-8?Q?Daniel_P_=2E_Berrang?=
 =?utf-8?Q?=C3=A9?=
 <berrange@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Andrew Jones
 <drjones@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, "Emilio G . Cota"
 <cota@braap.org>
Subject: Re: [PATCH v4 12/12] tests/meson: Only build softfloat objects if
 TCG is selected
Date: Fri, 30 Apr 2021 17:37:47 +0100
In-reply-to: <20210415163304.4120052-13-philmd@redhat.com>
Message-ID: <87sg37vi6z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: cbTgVlZwJojr


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> The previous attempt (commit f77147cd4de) doesn't work as
> expected, as we still have CONFIG_TCG=3D1 when using:
>
>   configure --disable-system --disable-user
>
> Now than we have removed the use of CONFIG_TCG from target-dependent
> files in tests/qtest/, we can remove the unconditional definition of
> CONFIG_TCG in config_host.
>
> This avoid to build a bunch of unrequired objects when building with
> --disable-tcg (in particular the softfloat tests):

Hmm something else gets broken because I bisected a check-tcg failure to
this commit:

  timeout --foreground 15  /home/alex.bennee/lsrc/qemu.git/builds/bisect/qe=
mu-system-aarch64 -monitor none -display none -chardev file,path=3Dmemory-r=
ecord.out,id=3Doutput -icount shift=3D5,rr=3Drecord,rrfile=3Drecord.bin  -M=
 virt -cpu max -display none -semihosting-config enable=3Don,target=3Dnativ=
e,chardev=3Doutput -kernel memory
  qemu-system-aarch64: Please enable icount to use record/replay
  /home/alex.bennee/lsrc/qemu.git/tests/tcg/aarch64/Makefile.softmmu-target=
:49: recipe for target 'run-memory-record' failed
  make[2]: *** [run-memory-record] Error 1
  make[2]: Leaving directory '/home/alex.bennee/lsrc/qemu.git/builds/bisect=
/tests/tcg/aarch64-softmmu'
  /home/alex.bennee/lsrc/qemu.git/tests/tcg/Makefile.qemu:102: recipe for t=
arget 'run-guest-tests' failed
  make[1]: *** [run-guest-tests] Error 2
  make[1]: Leaving directory '/home/alex.bennee/lsrc/qemu.git/builds/bisect'
  /home/alex.bennee/lsrc/qemu.git/tests/Makefile.include:63: recipe for tar=
get 'run-tcg-tests-aarch64-softmmu' failed
  make: *** [run-tcg-tests-aarch64-softmmu] Error 2

So it looks like it breaks icount somehow.

>
> Before:
>
>   $ make
>   [1/812] Generating trace-qom.h with a custom command
>   ...
>
> After:
>
>   $ make
>   [1/349] Generating trace-qom.h with a custom command
>   ...
>
> A difference of 463 objects...
>
> Reported-by: Claudio Fontana <cfontana@suse.de>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> v3: Include Paolo's feedback:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg793872.html
> therefore o not include Alex's R-b tag.
>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Emilio G. Cota <cota@braap.org>
> ---
>  meson.build | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meson.build b/meson.build
> index c6f4b0cf5e8..623cbe50685 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -262,7 +262,6 @@
>                          language: ['c', 'cpp', 'objc'])
>=20=20
>    accelerators +=3D 'CONFIG_TCG'
> -  config_host +=3D { 'CONFIG_TCG': 'y' }
>  endif
>=20=20
>  if 'CONFIG_KVM' not in accelerators and get_option('kvm').enabled()


--=20
Alex Benn=C3=A9e

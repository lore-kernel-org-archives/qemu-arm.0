Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id c128-20020a1c3586000000b003d9fb04f658sm5380799wma.4.2023.01.19.09.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 09:52:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 247C41FFB7;
	Thu, 19 Jan 2023 17:52:57 +0000 (GMT)
References: <20230110173922.265055-1-alex.bennee@linaro.org>
 <20230110173922.265055-17-alex.bennee@linaro.org>
 <fe4ae917-5132-e670-0604-c28b8c4e1599@trusted-objects.com>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: vincent Dupaquis <v.dupaquis@trusted-objects.com>
Cc: qemu-arm@nongnu.org, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Diificulties with qemu-system-arm semihosting
Date: Thu, 19 Jan 2023 17:39:51 +0000
In-reply-to: <fe4ae917-5132-e670-0604-c28b8c4e1599@trusted-objects.com>
Message-ID: <87sfg6xvgm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: p5Jl92fY07Ib


vincent Dupaquis <v.dupaquis@trusted-objects.com> writes:

(cc: chardev backend maintainers)

> [[PGP Signed Part:Undecided]]
> Hello,
>
> I've tried to use the semihosting on qemu-system-arm (version 7.0), and w=
as not able to redirect the
> input/output to a pipe, for instance.
>
> It seems I've declared the chardev correctly as I do not get any error me=
ssage, but impossible for me to
> redirect the input/output streams. I had to redirect stdout using tee and=
 found another way to access stdin
> (through the /dev/pts/x device I can obtain through the ps command).
>
> I digged into the sources to understand what I was doing wrong, and could=
 not :(
>
> Has anyone ever tried to redirect both stdout/stdin while using semihosti=
ng ?
>
> Should I expect a new behaviour with the latest version ?
>
> I was using the following options :
>
> -semihosting -chardev pipe,id=3Dpipout,path=3Dpipout -semihosting-config
> enable=3Don,chardev=3Dpipout

I've never tried with a pipe but I have got it working with sockets and
files. Is the pipe ever going to be bi-directional?

Anyway for reference:

  ./qemu-system-aarch64 -display none -serial mon:stdio \
    -M virt -cpu max,pauth-impdef=3Don \
    -semihosting-config enable=3Don,chardev=3Dshcd \
    -kernel ./tests/tcg/aarch64-softmmu/memory \
    -chardev file,path=3Dtest.out,id=3Dshcd

works as expected, re-directing output to the file. Unfortunately we
don't have many arm-softmmu tests. The only one we build
(test-armv6m-undef) only uses the exit semihosting call.

>
> the pipe being created using mkfifo pipout beforehand.
>
> Regards,
>
> Vincent.
>
> Le 10/01/2023 =C3=A0 18:39, Alex Benn=C3=A9e a =C3=A9crit :
>
>  The main reason to do this is to document our O_BINARY implementation
> decision somewhere. However I've also moved some of the implementation
> details out of qemu-options and added links between the two. As a
> bonus I've highlighted the scary warnings about host access with the
> appropriate RST tags.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  docs/about/features.rst    | 10 ++---
>  docs/specs/index.rst       |  1 +
>  docs/specs/semihosting.rst | 79 ++++++++++++++++++++++++++++++++++++++
>  qemu-options.hx            | 27 +++++--------
>  4 files changed, 95 insertions(+), 22 deletions(-)
>  create mode 100644 docs/specs/semihosting.rst
>
> diff --git a/docs/about/features.rst b/docs/about/features.rst
> index 0808c35a4a..aed0f9b9a2 100644
> --- a/docs/about/features.rst
> +++ b/docs/about/features.rst
> @@ -187,11 +187,11 @@ See `User Mode Emulation` for more details on runni=
ng in this mode.
>  Semihosting
>  ~~~~~~~~~~~~
>=20=20
> -A number of guest architecture support semihosting which provides a
> -way for guest programs to access the host system though a POSIX-like
> -system call layer. This has applications for early software bring-up
> -making it easy for a guest to dump data or read configuration files
> -before a full operating system is implemented.
> +A number of guest architecture support :ref:`Semihosting` which
> +provides a way for guest programs to access the host system though a
> +POSIX-like system call layer. This has applications for early software
> +bring-up making it easy for a guest to dump data or read configuration
> +files before a full operating system is implemented.
>=20=20
>  Some of those guest architectures also support semihosting in
>  user-mode making the testing of "bare-metal" micro-controller code
> diff --git a/docs/specs/index.rst b/docs/specs/index.rst
> index a58d9311cb..b46a16b2c8 100644
> --- a/docs/specs/index.rst
> +++ b/docs/specs/index.rst
> @@ -21,3 +21,4 @@ guest hardware that is specific to QEMU.
>     acpi_erst
>     sev-guest-firmware
>     fw_cfg
> +   semihosting
> diff --git a/docs/specs/semihosting.rst b/docs/specs/semihosting.rst
> new file mode 100644
> index 0000000000..343eb4bbb3
> --- /dev/null
> +++ b/docs/specs/semihosting.rst
> @@ -0,0 +1,79 @@
> +.. _Semihosting:
> +
> +Semihosting
> +-----------
> +
> +Semihosting is a feature provided by a number of guests that allow the
> +program running on the target to interact with the host system. On
> +real hardware this is usually provided by a debugger hooked directly
> +to the system.
> +
> +Generally semihosting makes it easier to bring up low level code before a
> +more fully functional operating system has been enabled. On QEMU it
> +also allows for embedded micro-controller code which typically doesn't
> +have a full libc to be run as "bare-metal" code under QEMU's user-mode
> +emulation. It is also useful for writing test cases and indeed a
> +number of compiler suites as well as QEMU itself use semihosting calls
> +to exit test code while reporting the success state.
> +
> +Semihosting is only available using TCG emulation. This is because the
> +instructions to trigger a semihosting call are typically reserved
> +causing most hypervisors to trap and fault on them.
> +
> +.. warning::
> +   Semihosting inherently bypasses any isolation there may be between
> +   the guest and the host. As a result a program using semihosting can
> +   happily trash your host system. You should only ever run trusted
> +   code with semihosting enabled.
> +
> +Redirection
> +~~~~~~~~~~~
> +
> +Semihosting calls can be re-directed to a (potentially remote) gdb
> +during debugging via the :ref:`gdbstub<GDB usage>`. Output to the
> +semihosting console is configured as a ``chardev`` so can be
> +redirected to a file, pipe or socket like any other ``chardev``
> +device.
> +
> +See :ref:`Semihosting Options<Semihosting Options>` for details.
> +
> +Supported Targets
> +~~~~~~~~~~~~~~~~~
> +
> +Most targets offer a similar semihosting implementations with some
> +minor changes to define the appropriate instruction to encode the
> +semihosting call and which registers hold the parameters. They tend to
> +presents a simple POSIX-like API which allows your program to read and
> +write files, access the console and some other basic interactions.
> +
> +.. note::
> +   QEMU makes an implementation decision to implement all file access
> +   in ``O_BINARY`` mode regardless of the host operating system. This
> +   is because gdb semihosting support doesn't make the distinction
> +   between the modes and magically processing line endings can be confus=
ing.
> +
> +.. list-table:: Guest Architectures supporting Semihosting
> +  :widths: 10 10 80
> +  :header-rows: 1
> +
> +  * - Architecture
> +    - Modes
> +    - Specification
> +  * - Arm
> +    - System and User-mode
> +    - https://github.com/ARM-software/abi-aa/blob/main/semihosting/semih=
osting.rst
> +  * - m68k
> +    - System
> +    - https://sourceware.org/git/?p=3Dnewlib-cygwin.git;a=3Dblob;f=3Dlib=
gloss/m68k/m68k-semi.txt;hb=3DHEAD
> +  * - mips
> +    - System
> +    - Unified Hosting Interface (MD01069)
> +  * - Nios II
> +    - System
> +    - https://sourceware.org/git/gitweb.cgi?p=3Dnewlib-cygwin.git;a=3Dbl=
ob;f=3Dlibgloss/nios2/nios2-semi.txt;hb=3DHEAD
> +  * - RISC-V
> +    - System and User-mode
> +    - https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-se=
mihosting-spec.adoc
> +  * - Xtensa
> +    - System
> +    - Tensilica ISS SIMCALL
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 3aa3a2f5a3..de3a368f58 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4633,10 +4633,13 @@ DEF("semihosting", 0, QEMU_OPTION_semihosting,
>      QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
>  SRST
>  ``-semihosting``
> -    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V on=
ly).
> +    Enable :ref:`Semihosting` mode (ARM, M68K, Xtensa, MIPS, Nios II, RI=
SC-V only).
>=20=20
> -    Note that this allows guest direct access to the host filesystem, so
> -    should only be used with a trusted guest OS.
> +    .. warning::
> +      Note that this allows guest direct access to the host filesystem, =
so
> +      should only be used with a trusted guest OS.
> +
> +    .. _Semihosting Options:
>=20=20
>      See the -semihosting-config option documentation for further
>      information about the facilities this enables.
> @@ -4648,22 +4651,12 @@ QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA=
 |
>  QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
>  SRST
>  ``-semihosting-config [enable=3Don|off][,target=3Dnative|gdb|auto][,char=
dev=3Did][,userspace=3Don|off][,arg=3Dstr[,...]]``
> -    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II, =
RISC-V
> +    Enable and configure :ref:`Semihosting` (ARM, M68K, Xtensa, MIPS, Ni=
os II, RISC-V
>      only).
>=20=20
> -    Note that this allows guest direct access to the host filesystem, so
> -    should only be used with a trusted guest OS.
> -
> -    On Arm this implements the standard semihosting API, version 2.0.
> -
> -    On M68K this implements the "ColdFire GDB" interface used by
> -    libgloss.
> -
> -    Xtensa semihosting provides basic file IO calls, such as
> -    open/read/write/seek/select. Tensilica baremetal libc for ISS and
> -    linux platform "sim" use this interface.
> -
> -    On RISC-V this implements the standard semihosting API, version 0.2.
> +    .. warning::
> +      Note that this allows guest direct access to the host filesystem, =
so
> +      should only be used with a trusted guest OS.
>=20=20
>      ``target=3Dnative|gdb|auto``
>          Defines where the semihosting calls will be addressed, to QEMU


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

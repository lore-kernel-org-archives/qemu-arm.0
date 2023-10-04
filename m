Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id i5-20020adffdc5000000b0031fb91f23e9sm4281936wrs.43.2023.10.04.08.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 08:23:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 193871FFBB;
	Wed,  4 Oct 2023 16:23:54 +0100 (BST)
References: <20231004090629.37473-1-philmd@linaro.org>
 <20231004090629.37473-8-philmd@linaro.org>
User-agent: mu4e 1.11.21; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 07/13] gdbstub: Rename 'softmmu' -> 'system'
Date: Wed, 04 Oct 2023 16:23:48 +0100
In-reply-to: <20231004090629.37473-8-philmd@linaro.org>
Message-ID: <874jj6h0mt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: GsmRWuzg1v2/


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> We have gdbstub/user.c for user emulation code,
> use gdbstub/system.c for system emulation part.
>
> Rename s/softmmu/system/ in meson and few comments.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  gdbstub/internals.h             |  4 ++--
>  gdbstub/{softmmu.c =3D> system.c} |  2 +-
>  gdbstub/meson.build             | 10 +++++-----
>  gdbstub/trace-events            |  2 +-
>  4 files changed, 9 insertions(+), 9 deletions(-)
>  rename gdbstub/{softmmu.c =3D> system.c} (99%)
>
> diff --git a/gdbstub/internals.h b/gdbstub/internals.h
> index fee243081f..f7fd1bede5 100644
> --- a/gdbstub/internals.h
> +++ b/gdbstub/internals.h
> @@ -103,7 +103,7 @@ static inline int tohex(int v)
>  }
>=20=20
>  /*
> - * Connection helpers for both softmmu and user backends
> + * Connection helpers for both system and user backends
>   */
>=20=20
>  void gdb_put_strbuf(void);
> @@ -229,7 +229,7 @@ void gdb_breakpoint_remove_all(CPUState *cs);
>   * @is_write: is it a write operation
>   *
>   * This function is specialised depending on the mode we are running
> - * in. For softmmu guests we can switch the interpretation of the
> + * in. For system guests we can switch the interpretation of the
>   * address to a physical address.
>   */
>  int gdb_target_memory_rw_debug(CPUState *cs, hwaddr addr,
> diff --git a/gdbstub/softmmu.c b/gdbstub/system.c
> similarity index 99%
> rename from gdbstub/softmmu.c
> rename to gdbstub/system.c
> index 9f0b8b5497..189975b1d6 100644
> --- a/gdbstub/softmmu.c
> +++ b/gdbstub/system.c
> @@ -104,7 +104,7 @@ static void gdb_chr_event(void *opaque, QEMUChrEvent =
event)
>  }
>=20=20
>  /*
> - * In softmmu mode we stop the VM and wait to send the syscall packet
> + * In system-mode we stop the VM and wait to send the syscall packet
>   * until notification that the CPU has stopped. This must be done
>   * because if the packet is sent now the reply from the syscall
>   * request could be received while the CPU is still in the running
> diff --git a/gdbstub/meson.build b/gdbstub/meson.build
> index a5a1f4e433..e5bccba34e 100644
> --- a/gdbstub/meson.build
> +++ b/gdbstub/meson.build
> @@ -1,6 +1,6 @@
>  #
>  # The main gdbstub still relies on per-build definitions of various
> -# types. The bits pushed to softmmu/user.c try to use guest agnostic
> +# types. The bits pushed to system/user.c try to use guest agnostic
>  # types such as hwaddr.
>  #
>=20=20
> @@ -12,7 +12,7 @@ gdb_system_ss =3D ss.source_set()
>=20=20
>  # We build two versions of gdbstub, one for each mode
>  gdb_user_ss.add(files('gdbstub.c', 'user.c'))
> -gdb_system_ss.add(files('gdbstub.c', 'softmmu.c'))
> +gdb_system_ss.add(files('gdbstub.c', 'system.c'))
>=20=20
>  gdb_user_ss =3D gdb_user_ss.apply(config_targetos, strict: false)
>  gdb_system_ss =3D gdb_system_ss.apply(config_targetos, strict: false)
> @@ -23,15 +23,15 @@ libgdb_user =3D static_library('gdb_user',
>                               c_args: '-DCONFIG_USER_ONLY',
>                               build_by_default: false)
>=20=20
> -libgdb_softmmu =3D static_library('gdb_softmmu',
> +libgdb_system =3D static_library('gdb_system',
>                                  gdb_system_ss.sources() + genh,
>                                  name_suffix: 'fa',
>                                  build_by_default: false)
>=20=20
>  gdb_user =3D declare_dependency(link_whole: libgdb_user)
>  user_ss.add(gdb_user)
> -gdb_softmmu =3D declare_dependency(link_whole: libgdb_softmmu)
> -system_ss.add(gdb_softmmu)
> +gdb_system =3D declare_dependency(link_whole: libgdb_system)
> +system_ss.add(gdb_system)
>=20=20
>  common_ss.add(files('syscalls.c'))
>=20=20
> diff --git a/gdbstub/trace-events b/gdbstub/trace-events
> index 7bc79a73c4..4fd126a38c 100644
> --- a/gdbstub/trace-events
> +++ b/gdbstub/trace-events
> @@ -28,5 +28,5 @@ gdbstub_err_checksum_invalid(uint8_t ch) "got invalid c=
ommand checksum digit: 0x
>  gdbstub_err_checksum_incorrect(uint8_t expected, uint8_t got) "got comma=
nd packet with incorrect checksum, expected=3D0x%02x, received=3D0x%02x"
>  gdbstub_err_unexpected_runpkt(uint8_t ch) "unexpected packet (0x%02x) wh=
ile target running"
>=20=20
> -# softmmu.c
> +# system.c
>  gdbstub_hit_watchpoint(const char *type, int cpu_gdb_index, uint64_t vad=
dr) "Watchpoint hit, type=3D\"%s\" cpu=3D%d, vaddr=3D0x%" PRIx64 ""


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

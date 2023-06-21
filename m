Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id n11-20020a5d4c4b000000b003113ccbf388sm4139773wrt.13.2023.06.21.03.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 03:21:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D8EB71FFBB;
	Wed, 21 Jun 2023 11:21:06 +0100 (BST)
References: <20230606132743.1386003-1-iii@linux.ibm.com>
 <20230606132743.1386003-7-iii@linux.ibm.com>
User-agent: mu4e 1.11.6; emacs 29.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Laurent Vivier <laurent@vivier.eu>, Peter Maydell
 <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org, Dominik 'Disconnect3d'
 Czarnota <dominik.b.czarnota@gmail.com>
Subject: Re: [PATCH v3 6/8] gdbstub: Add support for info proc mappings
Date: Wed, 21 Jun 2023 11:19:45 +0100
In-reply-to: <20230606132743.1386003-7-iii@linux.ibm.com>
Message-ID: <87pm5pglpp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: HVnCae31KiJv


Ilya Leoshkevich <iii@linux.ibm.com> writes:

> Currently the GDB's generate-core-file command doesn't work well with
> qemu-user: the resulting dumps are huge [1] and at the same time
> incomplete (argv and envp are missing). The reason is that GDB has no
> access to proc mappings and therefore has to fall back to using
> heuristics for discovering them. This is, in turn, because qemu-user
> does not implement the Host I/O feature of the GDB Remote Serial
> Protocol.
>
> Implement vFile:{open,close,pread,readlink} and also
> qXfer:exec-file:read+. With that, generate-core-file begins to work on
> aarch64 and s390x.
>
> [1] https://sourceware.org/pipermail/gdb-patches/2023-May/199432.html
>
> Co-developed-by: Dominik 'Disconnect3d' Czarnota <dominik.b.czarnota@gmai=
l.com>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  gdbstub/gdbstub.c     |  45 +++++++++++++-
>  gdbstub/internals.h   |   5 ++
>  gdbstub/user-target.c | 139 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 187 insertions(+), 2 deletions(-)
>
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index c7e3ee71f2f..d2efefd3528 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -1337,6 +1337,36 @@ static const GdbCmdParseEntry gdb_v_commands_table=
[] =3D {
>          .cmd =3D "Kill;",
>          .cmd_startswith =3D 1
>      },
> +#ifdef CONFIG_USER_ONLY
> +    /*
> +     * Host I/O Packets. See [1] for details.
> +     * [1] https://sourceware.org/gdb/onlinedocs/gdb/Host-I_002fO-Packet=
s.html
> +     */
> +    {
> +        .handler =3D gdb_handle_v_file_open,
> +        .cmd =3D "File:open:",
> +        .cmd_startswith =3D 1,
> +        .schema =3D "s,L,L0"
> +    },
> +    {
> +        .handler =3D gdb_handle_v_file_close,
> +        .cmd =3D "File:close:",
> +        .cmd_startswith =3D 1,
> +        .schema =3D "l0"
> +    },
> +    {
> +        .handler =3D gdb_handle_v_file_pread,
> +        .cmd =3D "File:pread:",
> +        .cmd_startswith =3D 1,
> +        .schema =3D "l,L,L0"
> +    },
> +    {
> +        .handler =3D gdb_handle_v_file_readlink,
> +        .cmd =3D "File:readlink:",
> +        .cmd_startswith =3D 1,
> +        .schema =3D "s0"
> +    },
> +#endif
>  };
>=20=20
>  static void handle_v_commands(GArray *params, void *user_ctx)
> @@ -1482,11 +1512,14 @@ static void handle_query_supported(GArray *params=
, void *user_ctx)
>              ";ReverseStep+;ReverseContinue+");
>      }
>=20=20
> -#if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX)
> +#if defined(CONFIG_USER_ONLY)
> +#if defined(CONFIG_LINUX)
>      if (gdbserver_state.c_cpu->opaque) {
>          g_string_append(gdbserver_state.str_buf, ";qXfer:auxv:read+");
>      }
>  #endif
> +    g_string_append(gdbserver_state.str_buf, ";qXfer:exec-file:read+");
> +#endif
>=20=20
>      if (params->len &&
>          strstr(get_param(params, 0)->data, "multiprocess+")) {
> @@ -1625,13 +1658,21 @@ static const GdbCmdParseEntry gdb_gen_query_table=
[] =3D {
>          .cmd_startswith =3D 1,
>          .schema =3D "s:l,l0"
>      },
> -#if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX)
> +#if defined(CONFIG_USER_ONLY)
> +#if defined(CONFIG_LINUX)
>      {
>          .handler =3D gdb_handle_query_xfer_auxv,
>          .cmd =3D "Xfer:auxv:read::",
>          .cmd_startswith =3D 1,
>          .schema =3D "l,l0"
>      },
> +#endif
> +    {
> +        .handler =3D gdb_handle_query_xfer_exec_file,
> +        .cmd =3D "Xfer:exec-file:read:",
> +        .cmd_startswith =3D 1,
> +        .schema =3D "l:l,l0"
> +    },
>  #endif
>      {
>          .handler =3D gdb_handle_query_attached,
> diff --git a/gdbstub/internals.h b/gdbstub/internals.h
> index 25e4d5eeaa6..f2b46cce412 100644
> --- a/gdbstub/internals.h
> +++ b/gdbstub/internals.h
> @@ -189,6 +189,11 @@ typedef union GdbCmdVariant {
>  void gdb_handle_query_rcmd(GArray *params, void *user_ctx); /* softmmu */
>  void gdb_handle_query_offsets(GArray *params, void *user_ctx); /* user */
>  void gdb_handle_query_xfer_auxv(GArray *params, void *user_ctx); /*user =
*/
> +void gdb_handle_v_file_open(GArray *params, void *user_ctx); /* user */
> +void gdb_handle_v_file_close(GArray *params, void *user_ctx); /* user */
> +void gdb_handle_v_file_pread(GArray *params, void *user_ctx); /* user */
> +void gdb_handle_v_file_readlink(GArray *params, void *user_ctx); /* user=
 */
> +void gdb_handle_query_xfer_exec_file(GArray *params, void *user_ctx); /*=
 user */
>=20=20
>  void gdb_handle_query_attached(GArray *params, void *user_ctx); /* both =
*/
>=20=20
> diff --git a/gdbstub/user-target.c b/gdbstub/user-target.c
> index fa0e59ec9a5..aa64a8b9440 100644
> --- a/gdbstub/user-target.c
> +++ b/gdbstub/user-target.c
> @@ -11,6 +11,10 @@
>  #include "exec/gdbstub.h"
>  #include "qemu.h"
>  #include "internals.h"
> +#ifdef CONFIG_LINUX
> +#include "linux-user/loader.h"
> +#include "linux-user/qemu.h"
> +#endif
>=20=20
>  /*
>   * Map target signal numbers to GDB protocol signal numbers and vice
> @@ -281,3 +285,138 @@ void gdb_handle_query_xfer_auxv(GArray *params, voi=
d *user_ctx)
>                        gdbserver_state.str_buf->len, true);
>  }
>  #endif
> +
> +static const char *get_filename_param(GArray *params, int i)
> +{
> +    const char *hex_filename =3D get_param(params, i)->data;
> +    gdb_hextomem(gdbserver_state.mem_buf, hex_filename,
> +                 strlen(hex_filename) / 2);
> +    g_byte_array_append(gdbserver_state.mem_buf, (const guint8 *)"", 1);
> +    return (const char *)gdbserver_state.mem_buf->data;
> +}
> +
> +static void hostio_reply_with_data(const void *buf, size_t n)
> +{
> +    g_string_printf(gdbserver_state.str_buf, "F%lx;", n);
> +    gdb_memtox(gdbserver_state.str_buf, buf, n);
> +    gdb_put_packet_binary(gdbserver_state.str_buf->str,
> +                          gdbserver_state.str_buf->len, true);
> +}

This fails on 64/32 builds:

  ../gdbstub/user-target.c: In function =E2=80=98hostio_reply_with_data=E2=
=80=99:
  ../gdbstub/user-target.c:300:50: error: format =E2=80=98%lx=E2=80=99 expe=
cts argument of type =E2=80=98long unsigned int=E2=80=99, but argument 3 ha=
s type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Werr=
or=3Dformat=3D]
    300 |     g_string_printf(gdbserver_state.str_buf, "F%lx;", n);
        |                                                ~~^    ~
        |                                                  |    |
        |                                                  |    size_t {aka=
 unsigned int}
        |                                                  long unsigned int
        |                                                %x
  cc1: all warnings being treated as errors

I think "%zx" is the portable format string you want.


> +void gdb_handle_v_file_open(GArray *params, void *user_ctx)
> +{
> +    const char *filename =3D get_filename_param(params, 0);
> +    uint64_t flags =3D get_param(params, 1)->val_ull;
> +    uint64_t mode =3D get_param(params, 2)->val_ull;
> +
> +#ifdef CONFIG_LINUX
> +    int fd =3D do_guest_openat(gdbserver_state.g_cpu->env_ptr, 0, filena=
me,
> +                             flags, mode, false);
> +#else
> +    int fd =3D open(filename, flags, mode);
> +#endif
> +    if (fd < 0) {
> +        g_string_printf(gdbserver_state.str_buf, "F-1,%d", errno);
> +    } else {
> +        g_string_printf(gdbserver_state.str_buf, "F%d", fd);
> +    }
> +    gdb_put_strbuf();
> +}
> +
> +void gdb_handle_v_file_close(GArray *params, void *user_ctx)
> +{
> +    int fd =3D get_param(params, 0)->val_ul;
> +
> +    if (close(fd) =3D=3D -1) {
> +        g_string_printf(gdbserver_state.str_buf, "F-1,%d", errno);
> +        gdb_put_strbuf();
> +        return;
> +    }
> +
> +    gdb_put_packet("F00");
> +}
> +
> +#define BUFSIZ 8192
> +
> +void gdb_handle_v_file_pread(GArray *params, void *user_ctx)
> +{
> +    int fd =3D get_param(params, 0)->val_ul;
> +    size_t count =3D get_param(params, 1)->val_ull;
> +    off_t offset =3D get_param(params, 2)->val_ull;
> +
> +    size_t bufsiz =3D MIN(count, BUFSIZ);
> +    g_autofree char *buf =3D g_try_malloc(bufsiz);
> +    if (buf =3D=3D NULL) {
> +        gdb_put_packet("E12");
> +        return;
> +    }
> +
> +    ssize_t n =3D pread(fd, buf, bufsiz, offset);
> +    if (n < 0) {
> +        g_string_printf(gdbserver_state.str_buf, "F-1,%d", errno);
> +        gdb_put_strbuf();
> +        return;
> +    }
> +    hostio_reply_with_data(buf, n);
> +}
> +
> +void gdb_handle_v_file_readlink(GArray *params, void *user_ctx)
> +{
> +    const char *filename =3D get_filename_param(params, 0);
> +
> +    g_autofree char *buf =3D g_try_malloc(BUFSIZ);
> +    if (buf =3D=3D NULL) {
> +        gdb_put_packet("E12");
> +        return;
> +    }
> +
> +#ifdef CONFIG_LINUX
> +    ssize_t n =3D do_guest_readlink(filename, buf, BUFSIZ);
> +#else
> +    ssize_t n =3D readlink(filename, buf, BUFSIZ);
> +#endif
> +    if (n < 0) {
> +        g_string_printf(gdbserver_state.str_buf, "F-1,%d", errno);
> +        gdb_put_strbuf();
> +        return;
> +    }
> +    hostio_reply_with_data(buf, n);
> +}
> +
> +void gdb_handle_query_xfer_exec_file(GArray *params, void *user_ctx)
> +{
> +    uint32_t pid =3D get_param(params, 0)->val_ul;
> +    uint32_t offset =3D get_param(params, 1)->val_ul;
> +    uint32_t length =3D get_param(params, 2)->val_ul;
> +
> +    GDBProcess *process =3D gdb_get_process(pid);
> +    if (!process) {
> +        gdb_put_packet("E00");
> +        return;
> +    }
> +
> +    CPUState *cpu =3D gdb_get_first_cpu_in_process(process);
> +    if (!cpu) {
> +        gdb_put_packet("E00");
> +        return;
> +    }
> +
> +    TaskState *ts =3D cpu->opaque;
> +    if (!ts || !ts->bprm || !ts->bprm->filename) {
> +        gdb_put_packet("E00");
> +        return;
> +    }
> +
> +    size_t total_length =3D strlen(ts->bprm->filename);
> +    if (offset > total_length) {
> +        gdb_put_packet("E00");
> +        return;
> +    }
> +    if (offset + length > total_length) {
> +        length =3D total_length - offset;
> +    }
> +
> +    g_string_printf(gdbserver_state.str_buf, "l%.*s", length,
> +                    ts->bprm->filename + offset);
> +    gdb_put_strbuf();
> +}


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

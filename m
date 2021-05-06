Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id t7sm5572382wrw.60.2021.05.06.12.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 12:22:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 811051FF7E;
	Thu,  6 May 2021 20:22:33 +0100 (BST)
References: <20210506133758.1749233-1-philmd@redhat.com>
 <20210506133758.1749233-8-philmd@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PATCH v2 7/9] gdbstub: Replace alloca() + memset(0) by g_new0()
Date: Thu, 06 May 2021 20:22:01 +0100
In-reply-to: <20210506133758.1749233-8-philmd@redhat.com>
Message-ID: <87v97vmzuu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Kg0gAC2I8rtL


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> The ALLOCA(3) man-page mentions its "use is discouraged".
>
> Replace the alloca() and memset(0) calls by g_new0().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Please see:

  Subject: [ALT PATCH] gdbstub: Replace GdbCmdContext with plain g_array()
  Date: Thu,  6 May 2021 17:07:41 +0100
  Message-Id: <20210506160741.9841-1-alex.bennee@linaro.org>

which also includes elements of 6/9 which can be kept split off.

> ---
>  gdbstub.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/gdbstub.c b/gdbstub.c
> index 7cee2fb0f1f..666053bf590 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1487,14 +1487,13 @@ static int process_string_cmd(void *user_ctx, con=
st char *data,
>          if (cmd->schema) {
>              int schema_len =3D strlen(cmd->schema);
>              int max_num_params =3D schema_len / 2;
> +            g_autofree GdbCmdVariant *params =3D NULL;
>=20=20
>              if (schema_len % 2) {
>                  return -2;
>              }
>=20=20
> -            gdb_ctx.params =3D (GdbCmdVariant *)alloca(sizeof(*gdb_ctx.p=
arams)
> -                                                     * max_num_params);
> -            memset(gdb_ctx.params, 0, sizeof(*gdb_ctx.params) * max_num_=
params);
> +            gdb_ctx.params =3D params =3D g_new0(GdbCmdVariant, max_num_=
params);
>=20=20
>              if (cmd_parse_params(&data[strlen(cmd->cmd)], cmd->schema,
>                                   gdb_ctx.params, &gdb_ctx.num_params)) {


--=20
Alex Benn=C3=A9e

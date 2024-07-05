Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp1115098njb;
        Fri, 5 Jul 2024 03:03:26 -0700 (PDT)
X-Received: by 2002:ac2:5206:0:b0:52c:c9e4:3291 with SMTP id 2adb3069b0e04-52ea06c71f9mr3576525e87.60.1720173805739;
        Fri, 05 Jul 2024 03:03:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720173805; cv=none;
        d=google.com; s=arc-20160816;
        b=bWhltmdTzxxpIHoNNYy7jKVs9SMQD7GVX+iabInD63Njyz8hFNUxHQL3Y4MaWYDKce
         tUAyhaVLgksFoWQk1n5tkNdZlESdt4yL9iIZBllRLSuojrlkjgNcR5KlziJaAN/feohn
         iMiI0GxbPQdxMzHu/qQul6Yl0A5tBiuSZOduVXyqKdFcDZQXxERWfvlau/lGGr90WSia
         Yczv9Y1wFf8v4Q4NDv39QjihE9+wlfXagAEqzbNlFzSdI1D+zripr8JWDzaB7n6xuKZW
         KkIowccRz6XjyGNH+7lIV2tlQrjdi4I4oAScOSkvQ5cJ3AxPX5BB5AbjdmrnDfI7UUIU
         YBlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JnurMLMGJRz6i3WzinAI/njgvtPzNU9KwzuuJv4+r9I=;
        fh=0zGuvTPwB0nSVi9p8cu2BBeBHdjbp1/cCExp+Crewlo=;
        b=htKlSdC3x0A6LHgX4+qLqALurtxUQ14Qk5vUR+gmS2WYhdQu9i/dnJ2W9eRDWeYy9Y
         0tNQJ+gNwjEa31Y0jN2kayhNADa5PLb/KEWYMCdLqOcu7jUjtazpZ1O1AQ4NBC/jtdjv
         6oqMQT1Lc8gh6R4k8fqNCF30EO1YuBnUbYsHjpIwsd1dfAtAltOEtgKaIcT1wbxdQSf/
         +ru/D5dWfCLylNU6mh/zPR3fAw+WsmnfT5rjJ7ZujUPKTKU0AJ1Wy/31rPXRzUEX/ghc
         ZCcjPs8w5V3MsV82jHiTsGbCidgl7JeYhVxI84uWSRn74wuyZStw/vAl62APfdqKaGyg
         oLcw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SgTQaMFS;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-52ea3db4b46sor466924e87.25.2024.07.05.03.03.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 05 Jul 2024 03:03:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SgTQaMFS;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173805; x=1720778605; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnurMLMGJRz6i3WzinAI/njgvtPzNU9KwzuuJv4+r9I=;
        b=SgTQaMFSxQ8FxhBBEnEhGWcxb6aJyQNprV6TBEg5Mvma4HaDG4k+c6gCcLwFjOmtx9
         ucbJEssHvVPmEJG7IKQCzks3bD9AvZGXzoDjoP9+O1kPq/OU2QUM3Fud/XrzeeSfVo+V
         ivhSYb5G9AWfOxD5B6qiaoxue5/d3BCkdV0LlY2BjFFsdJOvxQyXVaIYqYdzAEQ1AN0h
         krneP86tw5aiJrQ+R7tjFfare9+KBLJWmNZjFKajwmsUTpuAclpJvuMaWAnPqSR9ErpK
         DhqT5I0gIyMnVsFE2TlrwWekVYVpbywSMKHdBRKSopLMc6KqHnUnfDAOCncGVtejfWTn
         FW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173805; x=1720778605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JnurMLMGJRz6i3WzinAI/njgvtPzNU9KwzuuJv4+r9I=;
        b=SV1XqjqCDD1noLKLlWmF+MAvIIs7wPrYLpNL7yP8A9EN0bg2HEw0e8ITY+JMXJreEG
         oA3fB0h5cm31wn5avFJZqWhZmtxR5ByvbVUVeEyHsUrcnlHmXjIc0JcWY9M3lMtBY3L4
         VOHPm3OyXms7v6QfsVIo0it7u9WbR0zuA8Fuhn4VPsmG+/EfWrCa15wO+wgYaufW1TUR
         LAcpf6JtpFPTUqvsG4w+pDq7JTQ18ia+ORWqIVX0JkMWca8mNOAYAPtDAEpP8qyC+pZg
         WtcQDDftFzDO8QHhi7A2xvKLe+9jPUb2QztrAQJGju9wHfnr+PPjkVEV2c3jAH5jFGhM
         VfAQ==
X-Gm-Message-State: AOJu0Yw4HWkxiIX0tZsgfD5ygrGh10fFctrRmAvI1m5HAbMbGN80iR8n
	p5qnnNoHTkNABp6NtLkYi7SONO+I4/hCrYq9Ttse3zytujsH0uI3u+gGmFmnQKiGJKgcVtp6S8c
	vUOM8COmRrxMBhMTXAMdrfoXkWnuT/flcUB5iZrLKEt8ybw1075VgglV7
X-Google-Smtp-Source: AGHT+IHB/VXFxGvmTHye30oHvQtOZ96YzkIPAbwkHDp4nuYkdVZxxXVHgzo3eMdXAVfXECzCDNo1X7Y6IDLcBQzhG3Y=
X-Received: by 2002:a05:6512:313a:b0:52e:96c7:f9e4 with SMTP id
 2adb3069b0e04-52ea06c94a0mr3535118e87.68.1720173804761; Fri, 05 Jul 2024
 03:03:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240705084047.857176-1-alex.bennee@linaro.org> <20240705084047.857176-39-alex.bennee@linaro.org>
In-Reply-To: <20240705084047.857176-39-alex.bennee@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 5 Jul 2024 13:03:08 +0300
Message-ID: <CAAjaMXahywLz+3NvKmY3HD+ryxo1yt3FcaKXbvWN=cKh8RiG1g@mail.gmail.com>
Subject: Re: [PATCH v2 38/40] gdbstub: Use true to set cmd_startswith
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>, 
	Beraldo Leal <bleal@redhat.com>, David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, Alexandre Iooss <erdnaxe@crans.org>, 
	Thomas Huth <thuth@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
	Aleksandar Rikalo <arikalo@gmail.com>, Mads Ynddal <mads@ynddal.dk>, Yanan Wang <wangyanan55@huawei.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paul Burton <paulburton@kernel.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <laurent@vivier.eu>, 
	Gustavo Romero <gustavo.romero@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: pK4/tyPhncWw

On Fri, 5 Jul 2024 at 11:49, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> From: Gustavo Romero <gustavo.romero@linaro.org>
>
> cmd_startswith is a boolean so use 'true' to set it instead of 1.
>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20240628050850.536447-10-gustavo.romero@linaro.org>
> ---
>  gdbstub/gdbstub.c | 80 +++++++++++++++++++++++------------------------
>  1 file changed, 40 insertions(+), 40 deletions(-)
>
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index 5c1612ed2a..b9ad0a063e 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -1433,26 +1433,26 @@ static const GdbCmdParseEntry gdb_v_commands_tabl=
e[] =3D {
>      {
>          .handler =3D handle_v_cont_query,
>          .cmd =3D "Cont?",
> -        .cmd_startswith =3D 1
> +        .cmd_startswith =3D true
>      },
>      {
>          .handler =3D handle_v_cont,
>          .cmd =3D "Cont",
> -        .cmd_startswith =3D 1,
> +        .cmd_startswith =3D true,
>          .allow_stop_reply =3D true,
>          .schema =3D "s0"
>      },
>      {
>          .handler =3D handle_v_attach,
>          .cmd =3D "Attach;",
> -        .cmd_startswith =3D 1,
> +        .cmd_startswith =3D true,
>          .allow_stop_reply =3D true,
>          .schema =3D "l0"
>      },
>      {
>          .handler =3D handle_v_kill,
>          .cmd =3D "Kill;",
> -        .cmd_startswith =3D 1
> +        .cmd_startswith =3D true
>      },
>  #ifdef CONFIG_USER_ONLY
>      /*
> @@ -1462,25 +1462,25 @@ static const GdbCmdParseEntry gdb_v_commands_tabl=
e[] =3D {
>      {
>          .handler =3D gdb_handle_v_file_open,
>          .cmd =3D "File:open:",
> -        .cmd_startswith =3D 1,
> +        .cmd_startswith =3D true,
>          .schema =3D "s,L,L0"
>      },
>      {
>          .handler =3D gdb_handle_v_file_close,
>          .cmd =3D "File:close:",
> -        .cmd_startswith =3D 1,
> +        .cmd_startswith =3D true,
>          .schema =3D "l0"
>      },
>      {
>          .handler =3D gdb_handle_v_file_pread,
>          .cmd =3D "File:pread:",
> -        .cmd_startswith =3D 1,
> +        .cmd_startswith =3D true,
>          .schema =3D "l,L,L0"
>      },
>      {
>          .handler =3D gdb_handle_v_file_readlink,
>          .cmd =3D "File:readlink:",
> -        .cmd_startswith =3D 1,
> +        .cmd_startswith =3D true,
>          .schema =3D "s0"
>      },
>  #endif
> @@ -1748,7 +1748,7 @@ static const GdbCmdParseEntry gdb_gen_query_set_com=
mon_table[] =3D {
>      {
>          .handler =3D handle_set_qemu_sstep,
>          .cmd =3D "qemu.sstep=3D",
> -        .cmd_startswith =3D 1,
> +        .cmd_startswith =3D true,
>          .schema =3D "l0"
>      },
>  };
> @@ -1804,7 +1804,7 @@ static const GdbCmdParseEntry gdb_gen_query_table[]=
 =3D {
>      {
>          .handler =3D handle_query_thread_extra,
>          .cmd =3D "ThreadExtraInfo,",
> -        .cmd_startswith =3D 1,
> +        .cmd_startswith =3D true,
>          .schema =3D "t0"
>      },
>  #ifdef CONFIG_USER_ONLY
> @@ -1816,14 +1816,14 @@ static const GdbCmdParseEntry gdb_gen_query_table=
[] =3D {
>      {
>          .handler =3D gdb_handle_query_rcmd,
>          .cmd =3D "Rcmd,",
> -        .cmd_startswith =3D 1,
> +        .cmd_startswith =3D true,
>          .schema =3D "s0"
>      },
>  #endif
>      {
>          .handler =3D handle_query_supported,
>          .cmd =3D "Supported:",
> -        .cmd_startswith =3D 1,
> +        .cmd_startswith =3D true,
>          .schema =3D "s0"
>      },
>      {
> @@ -1834,7 +1834,7 @@ static const GdbCmdParseEntry gdb_gen_query_table[]=
 =3D {
>      {
>          .handler =3D handle_query_xfer_features,
>          .cmd =3D "Xfer:features:read:",
> -        .cmd_startswith =3D 1,
> +        .cmd_startswith =3D true,
>          .schema =3D "s:l,l0"
>      },
>  #if defined(CONFIG_USER_ONLY)
> @@ -1842,27 +1842,27 @@ static const GdbCmdParseEntry gdb_gen_query_table=
[] =3D {
>      {
>          .handler =3D gdb_handle_query_xfer_auxv,
>          .cmd =3D "Xfer:auxv:read::",
> -        .cmd_startswith =3D 1,
> +        .cmd_startswith =3D true,
>          .schema =3D "l,l0"
>      },
>      {
>          .handler =3D gdb_handle_query_xfer_siginfo,
>          .cmd =3D "Xfer:siginfo:read::",
> -        .cmd_startswith =3D 1,
> +        .cmd_startswith =3D true,
>          .schema =3D "l,l0"
>       },
>  #endif
>      {
>          .handler =3D gdb_handle_query_xfer_exec_file,
>          .cmd =3D "Xfer:exec-file:read:",
> -        .cmd_startswith =3D 1,
> +        .cmd_startswith =3D true,
>          .schema =3D "l:l,l0"
>      },
>  #endif
>      {
>          .handler =3D gdb_handle_query_attached,
>          .cmd =3D "Attached:",
> -        .cmd_startswith =3D 1
> +        .cmd_startswith =3D true
>      },
>      {
>          .handler =3D gdb_handle_query_attached,
> @@ -1901,14 +1901,14 @@ static const GdbCmdParseEntry gdb_gen_set_table[]=
 =3D {
>      {
>          .handler =3D handle_set_qemu_sstep,
>          .cmd =3D "qemu.sstep:",
> -        .cmd_startswith =3D 1,
> +        .cmd_startswith =3D true,
>          .schema =3D "l0"
>      },
>  #ifndef CONFIG_USER_ONLY
>      {
>          .handler =3D gdb_handle_set_qemu_phy_mem_mode,
>          .cmd =3D "qemu.PhyMemMode:",
> -        .cmd_startswith =3D 1,
> +        .cmd_startswith =3D true,
>          .schema =3D "l0"
>      },
>  #endif
> @@ -1916,7 +1916,7 @@ static const GdbCmdParseEntry gdb_gen_set_table[] =
=3D {
>      {
>          .handler =3D gdb_handle_set_catch_syscalls,
>          .cmd =3D "CatchSyscalls:",
> -        .cmd_startswith =3D 1,
> +        .cmd_startswith =3D true,
>          .schema =3D "s0",
>      },
>  #endif
> @@ -2012,7 +2012,7 @@ static int gdb_handle_packet(const char *line_buf)
>              static const GdbCmdParseEntry target_halted_cmd_desc =3D {
>                  .handler =3D handle_target_halt,
>                  .cmd =3D "?",
> -                .cmd_startswith =3D 1,
> +                .cmd_startswith =3D true,
>                  .allow_stop_reply =3D true,
>              };
>              cmd_parser =3D &target_halted_cmd_desc;
> @@ -2023,7 +2023,7 @@ static int gdb_handle_packet(const char *line_buf)
>              static const GdbCmdParseEntry continue_cmd_desc =3D {
>                  .handler =3D handle_continue,
>                  .cmd =3D "c",
> -                .cmd_startswith =3D 1,
> +                .cmd_startswith =3D true,
>                  .allow_stop_reply =3D true,
>                  .schema =3D "L0"
>              };
> @@ -2035,7 +2035,7 @@ static int gdb_handle_packet(const char *line_buf)
>              static const GdbCmdParseEntry cont_with_sig_cmd_desc =3D {
>                  .handler =3D handle_cont_with_sig,
>                  .cmd =3D "C",
> -                .cmd_startswith =3D 1,
> +                .cmd_startswith =3D true,
>                  .allow_stop_reply =3D true,
>                  .schema =3D "l0"
>              };
> @@ -2047,7 +2047,7 @@ static int gdb_handle_packet(const char *line_buf)
>              static const GdbCmdParseEntry v_cmd_desc =3D {
>                  .handler =3D handle_v_commands,
>                  .cmd =3D "v",
> -                .cmd_startswith =3D 1,
> +                .cmd_startswith =3D true,
>                  .schema =3D "s0"
>              };
>              cmd_parser =3D &v_cmd_desc;
> @@ -2064,7 +2064,7 @@ static int gdb_handle_packet(const char *line_buf)
>              static const GdbCmdParseEntry detach_cmd_desc =3D {
>                  .handler =3D handle_detach,
>                  .cmd =3D "D",
> -                .cmd_startswith =3D 1,
> +                .cmd_startswith =3D true,
>                  .schema =3D "?.l0"
>              };
>              cmd_parser =3D &detach_cmd_desc;
> @@ -2075,7 +2075,7 @@ static int gdb_handle_packet(const char *line_buf)
>              static const GdbCmdParseEntry step_cmd_desc =3D {
>                  .handler =3D handle_step,
>                  .cmd =3D "s",
> -                .cmd_startswith =3D 1,
> +                .cmd_startswith =3D true,
>                  .allow_stop_reply =3D true,
>                  .schema =3D "L0"
>              };
> @@ -2087,7 +2087,7 @@ static int gdb_handle_packet(const char *line_buf)
>              static const GdbCmdParseEntry backward_cmd_desc =3D {
>                  .handler =3D handle_backward,
>                  .cmd =3D "b",
> -                .cmd_startswith =3D 1,
> +                .cmd_startswith =3D true,
>                  .allow_stop_reply =3D true,
>                  .schema =3D "o0"
>              };
> @@ -2099,7 +2099,7 @@ static int gdb_handle_packet(const char *line_buf)
>              static const GdbCmdParseEntry file_io_cmd_desc =3D {
>                  .handler =3D gdb_handle_file_io,
>                  .cmd =3D "F",
> -                .cmd_startswith =3D 1,
> +                .cmd_startswith =3D true,
>                  .schema =3D "L,L,o0"
>              };
>              cmd_parser =3D &file_io_cmd_desc;
> @@ -2110,7 +2110,7 @@ static int gdb_handle_packet(const char *line_buf)
>              static const GdbCmdParseEntry read_all_regs_cmd_desc =3D {
>                  .handler =3D handle_read_all_regs,
>                  .cmd =3D "g",
> -                .cmd_startswith =3D 1
> +                .cmd_startswith =3D true
>              };
>              cmd_parser =3D &read_all_regs_cmd_desc;
>          }
> @@ -2120,7 +2120,7 @@ static int gdb_handle_packet(const char *line_buf)
>              static const GdbCmdParseEntry write_all_regs_cmd_desc =3D {
>                  .handler =3D handle_write_all_regs,
>                  .cmd =3D "G",
> -                .cmd_startswith =3D 1,
> +                .cmd_startswith =3D true,
>                  .schema =3D "s0"
>              };
>              cmd_parser =3D &write_all_regs_cmd_desc;
> @@ -2131,7 +2131,7 @@ static int gdb_handle_packet(const char *line_buf)
>              static const GdbCmdParseEntry read_mem_cmd_desc =3D {
>                  .handler =3D handle_read_mem,
>                  .cmd =3D "m",
> -                .cmd_startswith =3D 1,
> +                .cmd_startswith =3D true,
>                  .schema =3D "L,L0"
>              };
>              cmd_parser =3D &read_mem_cmd_desc;
> @@ -2142,7 +2142,7 @@ static int gdb_handle_packet(const char *line_buf)
>              static const GdbCmdParseEntry write_mem_cmd_desc =3D {
>                  .handler =3D handle_write_mem,
>                  .cmd =3D "M",
> -                .cmd_startswith =3D 1,
> +                .cmd_startswith =3D true,
>                  .schema =3D "L,L:s0"
>              };
>              cmd_parser =3D &write_mem_cmd_desc;
> @@ -2153,7 +2153,7 @@ static int gdb_handle_packet(const char *line_buf)
>              static const GdbCmdParseEntry get_reg_cmd_desc =3D {
>                  .handler =3D handle_get_reg,
>                  .cmd =3D "p",
> -                .cmd_startswith =3D 1,
> +                .cmd_startswith =3D true,
>                  .schema =3D "L0"
>              };
>              cmd_parser =3D &get_reg_cmd_desc;
> @@ -2164,7 +2164,7 @@ static int gdb_handle_packet(const char *line_buf)
>              static const GdbCmdParseEntry set_reg_cmd_desc =3D {
>                  .handler =3D handle_set_reg,
>                  .cmd =3D "P",
> -                .cmd_startswith =3D 1,
> +                .cmd_startswith =3D true,
>                  .schema =3D "L?s0"
>              };
>              cmd_parser =3D &set_reg_cmd_desc;
> @@ -2175,7 +2175,7 @@ static int gdb_handle_packet(const char *line_buf)
>              static const GdbCmdParseEntry insert_bp_cmd_desc =3D {
>                  .handler =3D handle_insert_bp,
>                  .cmd =3D "Z",
> -                .cmd_startswith =3D 1,
> +                .cmd_startswith =3D true,
>                  .schema =3D "l?L?L0"
>              };
>              cmd_parser =3D &insert_bp_cmd_desc;
> @@ -2186,7 +2186,7 @@ static int gdb_handle_packet(const char *line_buf)
>              static const GdbCmdParseEntry remove_bp_cmd_desc =3D {
>                  .handler =3D handle_remove_bp,
>                  .cmd =3D "z",
> -                .cmd_startswith =3D 1,
> +                .cmd_startswith =3D true,
>                  .schema =3D "l?L?L0"
>              };
>              cmd_parser =3D &remove_bp_cmd_desc;
> @@ -2197,7 +2197,7 @@ static int gdb_handle_packet(const char *line_buf)
>              static const GdbCmdParseEntry set_thread_cmd_desc =3D {
>                  .handler =3D handle_set_thread,
>                  .cmd =3D "H",
> -                .cmd_startswith =3D 1,
> +                .cmd_startswith =3D true,
>                  .schema =3D "o.t0"
>              };
>              cmd_parser =3D &set_thread_cmd_desc;
> @@ -2208,7 +2208,7 @@ static int gdb_handle_packet(const char *line_buf)
>              static const GdbCmdParseEntry thread_alive_cmd_desc =3D {
>                  .handler =3D handle_thread_alive,
>                  .cmd =3D "T",
> -                .cmd_startswith =3D 1,
> +                .cmd_startswith =3D true,
>                  .schema =3D "t0"
>              };
>              cmd_parser =3D &thread_alive_cmd_desc;
> @@ -2219,7 +2219,7 @@ static int gdb_handle_packet(const char *line_buf)
>              static const GdbCmdParseEntry gen_query_cmd_desc =3D {
>                  .handler =3D handle_gen_query,
>                  .cmd =3D "q",
> -                .cmd_startswith =3D 1,
> +                .cmd_startswith =3D true,
>                  .schema =3D "s0"
>              };
>              cmd_parser =3D &gen_query_cmd_desc;
> @@ -2230,7 +2230,7 @@ static int gdb_handle_packet(const char *line_buf)
>              static const GdbCmdParseEntry gen_set_cmd_desc =3D {
>                  .handler =3D handle_gen_set,
>                  .cmd =3D "Q",
> -                .cmd_startswith =3D 1,
> +                .cmd_startswith =3D true,
>                  .schema =3D "s0"
>              };
>              cmd_parser =3D &gen_set_cmd_desc;
> --
> 2.39.2
>


Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

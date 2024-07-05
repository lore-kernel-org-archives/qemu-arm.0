Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp1118226njb;
        Fri, 5 Jul 2024 03:08:47 -0700 (PDT)
X-Received: by 2002:a17:906:dc8:b0:a72:44fe:4c4c with SMTP id a640c23a62f3a-a77ba70bedcmr271139566b.47.1720174127213;
        Fri, 05 Jul 2024 03:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720174127; cv=none;
        d=google.com; s=arc-20160816;
        b=ISHod3nm4K6FnR8CY/SjAqDKo7KGhx6rkqAEDVtR7WwAUSnyGjZT6W1uOWXPZGTUOH
         X/thZy4UJ8eyJyWNnrp4qml/D4KbnTQsuHM43oo/DdVxNqkAs5xmy8nJczYOI5Cn/wEH
         UFtnn3p1CPTWZj3XsNSCwrO+evdo+kIi8dGr2F18+PVft5TNJmglUQCzI+RYM2GTAO5F
         7sFiEffvtzGV6QI7T5nQPn93vudcA4k7yeQNcSBTcTP/fFBUdLLSEzYmgtHtqpwwtxib
         OgJ2Euih7eY5lxUwlY9TA/mmqOpTdQrt1hNjEBGfOL/djtsfMK9G5jt9dVG38mFDMbqJ
         rdDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+LAIVN7rrbTPh0fHFqivhxykULiUQ1NLO2ql5KaY924=;
        fh=0zGuvTPwB0nSVi9p8cu2BBeBHdjbp1/cCExp+Crewlo=;
        b=veeBOkt9ow+ga7kEM+sTWZgAAPfZUzI9YLbJvAfp+MESO79add3sLmQ0MwnuWR6zyL
         bKV0snFfUSwtwQr5ZiSI49zrFXTvEgv3ZaZEPcMPvoEBPQBEBhPsOVSl1jhjC8QJMR6L
         giP+mA1MdMjE/6BK0iiGbprRcMpQdAw/ULhy1sIqYKzf5YiWfMCxbvJ4nWy5SriXsFu7
         QvgVohZRvj/qsTlqO1ZjQtYwb+eFNm06KolZ96kvyb3B7JQu4pd1RRjJ2w0uf7B3v8l+
         aQ3VHavist9DkS1E3c+nPi7lbcGltv+TbQ4wgZ6fypKG3ciELvNQxhQGCWoMtctQnPnf
         AYmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r9XBDUa+;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a77da358b1esor14946366b.11.2024.07.05.03.08.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 05 Jul 2024 03:08:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r9XBDUa+;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720174126; x=1720778926; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+LAIVN7rrbTPh0fHFqivhxykULiUQ1NLO2ql5KaY924=;
        b=r9XBDUa+cEpgeGjORhkg0P1t2Xn7grlSzi+OKGg5KbxBkBn18ORwP6b7UrGc1+8oV7
         FMML26i0yZFgAGT0WyzeeFs5tEduIKeJE4NSj1fXXqiVMwR0A5ciieVJvYUbB5mgduYJ
         27gwCvKv/0MYDWY3kvH+PQo6yw7TvCardB3X47PTZJHCrOYpL4GQzS92txBaKvJHPDgd
         LT/u8s977gnzTtaJJ9hl3fpybcmoT2IsHWZaw/An5LAVP0pNFFA7VY4RR+oOAaaaoD7H
         EA2jmugyU3oQSkxEOR2TefQuCSbSajywCdmH5Egkn8ArME7GGPza5HxLhVh1chSXy30A
         3Uxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720174126; x=1720778926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+LAIVN7rrbTPh0fHFqivhxykULiUQ1NLO2ql5KaY924=;
        b=CekiC6wC1nMEjtMhQsoaJqlqHN1HvhFvXFoKyZ5zvSQ7R65MuZuZUt8C3HY7TCFSNr
         oI9aKkZ44jyiQDd87jJCpwDQjd67gMZG98LSBo7ZePtHC70zfPpXxRs8oksscvbeRZTl
         r0fJI/bSejV0P/LcqbWiCCb1JMBpagw4w4zM5c0qT3SX6fGsspgf2t9ew4jz0qSC47CR
         G/WQoHTxZx/LV5AsZ224oMWoB3Up/nbBp9xDWzqR2NAYN2hJn0moA6XRn1/lK2yEK7tA
         2zmpPPrbXzOFXVgEqgfn3NgfNQzvyWDZ+PGCicY+hguIve7N1/PzYtnrB6wUA4oE8rk6
         DcIg==
X-Gm-Message-State: AOJu0Ywfvu1gA9VQjyhKlOP/V3J65OFGzAEUgTvJ0RyTsbJ+pnAdi/eL
	gj0CoOAQh1+Y4aedT8+qeBh5mDrv77e1UQnvYdkzBMVxQVrL0od4wvkEDL8ChqY6gkdT6zwHuWM
	jp6ZaWxJUaJ6/0az3mpBo3a2RqmQGCF/9Ri9dAgUIGgpwGJQVZnoYXQM6
X-Google-Smtp-Source: AGHT+IHNDVxDH803a6lPOst1HWZNIbH1XCGrT+/jAvJ9rh7Qq3Wln9V3f2mgdmD5J3aOkpN1F4vnuFulqDdsAFq3c4A=
X-Received: by 2002:a17:907:6e87:b0:a6f:12:8c45 with SMTP id
 a640c23a62f3a-a77ba7295f2mr364790766b.72.1720174126333; Fri, 05 Jul 2024
 03:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240705084047.857176-1-alex.bennee@linaro.org> <20240705084047.857176-38-alex.bennee@linaro.org>
In-Reply-To: <20240705084047.857176-38-alex.bennee@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 5 Jul 2024 13:08:30 +0300
Message-ID: <CAAjaMXYPrgH5zdvcHjDHDijvwSsNxDdNn76EwFNuRA-SAh1m2Q@mail.gmail.com>
Subject: Re: [PATCH v2 37/40] gdbstub: Pass CPU context to command handler
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
X-TUID: WvkNBMsor/xo

On Fri, 5 Jul 2024 at 11:47, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> From: Gustavo Romero <gustavo.romero@linaro.org>
>
> Allow passing the current CPU context to command handlers via user_ctx
> when the handler requires it.
>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20240628050850.536447-9-gustavo.romero@linaro.org>
> ---
>  include/gdbstub/commands.h | 3 +++
>  gdbstub/gdbstub.c          | 7 ++++++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/include/gdbstub/commands.h b/include/gdbstub/commands.h
> index e51f276b40..f3058f9dda 100644
> --- a/include/gdbstub/commands.h
> +++ b/include/gdbstub/commands.h
> @@ -54,6 +54,8 @@ typedef union GdbCmdVariant {
>   * "stop reply" packet. The list of commands that accept such response i=
s
>   * defined at the GDB Remote Serial Protocol documentation. See:
>   * https://sourceware.org/gdb/onlinedocs/gdb/Stop-Reply-Packets.html#Sto=
p-Reply-Packets.
> + *
> + * @need_cpu_context: Pass current CPU context to command handler via us=
er_ctx.
>   */
>  typedef struct GdbCmdParseEntry {
>      GdbCmdHandler handler;
> @@ -61,6 +63,7 @@ typedef struct GdbCmdParseEntry {
>      bool cmd_startswith;
>      const char *schema;
>      bool allow_stop_reply;
> +    bool need_cpu_context;
>  } GdbCmdParseEntry;
>
>  /**
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index b1ca253f97..5c1612ed2a 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -938,6 +938,7 @@ static bool process_string_cmd(const char *data,
>
>      for (i =3D 0; i < num_cmds; i++) {
>          const GdbCmdParseEntry *cmd =3D &cmds[i];
> +        void *user_ctx =3D NULL;
>          g_assert(cmd->handler && cmd->cmd);
>
>          if ((cmd->cmd_startswith && !startswith(data, cmd->cmd)) ||
> @@ -952,8 +953,12 @@ static bool process_string_cmd(const char *data,
>              }
>          }
>
> +        if (cmd->need_cpu_context) {
> +            user_ctx =3D (void *)gdbserver_state.g_cpu;
> +        }
> +
>          gdbserver_state.allow_stop_reply =3D cmd->allow_stop_reply;
> -        cmd->handler(params, NULL);
> +        cmd->handler(params, user_ctx);
>          return true;
>      }
>
> --
> 2.39.2
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

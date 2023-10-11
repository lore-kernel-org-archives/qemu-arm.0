Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp515677ejr;
        Tue, 10 Oct 2023 17:59:25 -0700 (PDT)
X-Received: by 2002:a67:f4d3:0:b0:452:66a7:1ac with SMTP id s19-20020a67f4d3000000b0045266a701acmr18289069vsn.6.1696985965048;
        Tue, 10 Oct 2023 17:59:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696985965; cv=none;
        d=google.com; s=arc-20160816;
        b=hn07MyPIAjk+KegOb68bcp/0acMf4p7paYIXSBxr/jjUcHGROOEC6jjjKsHvjDt1Du
         MONnolWFAUf8CtC0zjLZGnDL3SMOgSCrBWjKeckrIOvoeB93si10XsNg9WyBiV14Lv8J
         0fyJKZn1+vPdLqkymw3DFoPi1t6qvIh/vD6YIpUWjfzx5CcjemnAgKHMbAdfJsm/fcZf
         5qdaG8bSEBCRY3KQUkDNM4ReSrWlyJgMPhcRIw5MkUGkW7QIM66TsVDZnvdSoh8EE2WL
         961oKkoikZcu8H+M/cP2fbvlr382zE5TR9ScTN1Fu+DVirwZ0qyRKpyBovpg2hjXeZXJ
         Rfdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AiHimnSOdfouU1hxVB7+hfSpbhB4p+Hd2Gk3DBN4GHg=;
        fh=cqk238ux3/GdOijP7fp8WGbp8VqG0EAAdwsLvgVM+lA=;
        b=XI2UpFr0d8orRR/haeN28ZMXGL51QkBBdSy3M+Tnkx+I3Otl0JDfzdDSBZ9TDo8fX0
         IAifguqVLwX0t2Az2CfC9lna4S6I7XqPCHO1OPTRB+6GfBlWKcZUvN0d+2MxvFKOf1Zr
         HFzSvfKFlbPBgLPqLxDqKb1LSmhhaT5ANfRuCBr+9Wvg5RriyK1yACUVhhyncztKPmN5
         iDvV1C7szmspDbgWsplXvRG8jIgl1bAryA3uREFfPGFAmPsvajb9PNf96gqoyNiTg1ur
         Eit5vsFS/joxrYYwf8f05T0ya4CJG/0N1iz8dtMJiqWq9DKgqRMjOqe01CTjKTzKuvbH
         3FGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=VY978GBO;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id dc30-20020a056102559e00b00457800e3a7esor1813698vsb.11.2023.10.10.17.59.24
        (Google Transport Security);
        Tue, 10 Oct 2023 17:59:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=VY978GBO;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696985964; x=1697590764; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AiHimnSOdfouU1hxVB7+hfSpbhB4p+Hd2Gk3DBN4GHg=;
        b=VY978GBOzWmG+7Jl4d5jFp6XW3ihg0mxPALU1Lbjdz++QtRQB1wn63eEU+13qnHcD/
         oGhTiWmGZn8jMOBWHVpf+JB/NIg7IgK61P79hwAdeT5/amfddVX4qSqZKBwwckmwmdTR
         j8LL1sLDqh9CHNK2KjfP2aN0wVNW5zTFlgQct4On3nzHpYM6SGo7OMwKFiqhvqbMnIod
         Y5PxdUehJgLheBvzSp9AE2qlD+PCw8LMqhLrBDsjf13CywN3GXn1MLj1sDz50IjEoCHK
         H/zjxo4Wui5k+P/6h3uYnojocnBs6OEEDKXXNKBYt1uLB2zKcOfIB4YMgezAQ/n+oIFf
         +y4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696985964; x=1697590764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AiHimnSOdfouU1hxVB7+hfSpbhB4p+Hd2Gk3DBN4GHg=;
        b=k3bi9U3K3Uf+4n8ogLxeNHq06ZwmcDVlYBClsKc6NTLiXRJnNkrZsY7ZQ1tzqS6lVu
         0DbwsfL2e+cE33atsJVo9Lt5s7WMWkzJAli7/cReTQuE8LQoxCFXX4wTyZGp03aAVA6v
         ddRmPVNodi+Z5A4m7v1Wi0GlZM9xFfqhLlONv62eKTuUEr+QcZlsjR9Ki/T5iW2CLRdm
         /1BnJYC9jgcN9HKYlXo2f5L52HcN8lmu/zqAtTGQDlYPCSURdlR642aNCqeZZ1h2QP2T
         bQNzmfGdyjCiS1wXR6zOxP8pLuwG27AmKtYGIjBeRsd+Fw6lB7lsHh840yRg4mq4+7yu
         Uv3A==
X-Gm-Message-State: AOJu0Yx9pzF/ImxssmkdINWrxK5ZXO3FIkxGIKope7VCxytnMZTv5vkH
	BZj65E2+/FXQ3L6qNmviXTSukeXToW0mwzSUJ0SC36sPpTSg6Q==
X-Google-Smtp-Source: AGHT+IHOIr450w9NLLZ+zgffqfq4SibYaIn0zDubLAlZ3IDzLmTLav264biEDLW2tF8znth7O6gKXC+I6pyqX6B8rTo=
X-Received: by 2002:a67:f7c1:0:b0:44e:d6c3:51d4 with SMTP id
 a1-20020a67f7c1000000b0044ed6c351d4mr17411610vsp.18.1696985964176; Tue, 10
 Oct 2023 17:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20231009164104.369749-1-alex.bennee@linaro.org> <20231009164104.369749-19-alex.bennee@linaro.org>
In-Reply-To: <20231009164104.369749-19-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 10:58:57 +1000
Message-ID: <CAKmqyKNJ4qm_BG-jh_RghJ3jMSJ6DK=s6L6xVdjr5YW8UMSV9w@mail.gmail.com>
Subject: Re: [PATCH 18/25] gdbstub: Remove gdb_has_xml variable
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
	Xiaojuan Yang <yangxiaojuan@loongson.cn>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Brad Smith <brad@comstyle.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, David Hildenbrand <david@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Bin Meng <bin.meng@windriver.com>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org, 
	John Snow <jsnow@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Peter Maydell <peter.maydell@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, 
	Weiwei Li <liweiwei@iscas.ac.cn>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Beraldo Leal <bleal@redhat.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Song Gao <gaosong@loongson.cn>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-s390x@nongnu.org, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Akihiko Odaki <akihiko.odaki@daynix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: YJKdvFqUF04p

On Tue, Oct 10, 2023 at 2:48=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>
> GDB has XML support since 6.7 which was released in 2007.
> It's time to remove support for old GDB versions without XML support.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Message-Id: <20230912224107.29669-12-akihiko.odaki@daynix.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  gdbstub/internals.h    |  2 --
>  include/exec/gdbstub.h |  8 --------
>  gdbstub/gdbstub.c      | 15 ---------------
>  3 files changed, 25 deletions(-)
>
> diff --git a/gdbstub/internals.h b/gdbstub/internals.h
> index fee243081f..7128c4aa85 100644
> --- a/gdbstub/internals.h
> +++ b/gdbstub/internals.h
> @@ -32,8 +32,6 @@ enum {
>  typedef struct GDBProcess {
>      uint32_t pid;
>      bool attached;
> -
> -    /* If gdb sends qXfer:features:read:target.xml this will be populate=
d */
>      char *target_xml;
>  } GDBProcess;
>
> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index 705be2c5d7..1a01c35f8e 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h
> @@ -45,14 +45,6 @@ int gdbserver_start(const char *port_or_device);
>
>  void gdb_set_stop_cpu(CPUState *cpu);
>
> -/**
> - * gdb_has_xml() - report of gdb supports modern target descriptions
> - *
> - * This will report true if the gdb negotiated qXfer:features:read
> - * target descriptions.
> - */
> -bool gdb_has_xml(void);
> -
>  /* in gdbstub-xml.c, generated by scripts/feature_to_c.py */
>  extern const GDBFeature gdb_static_features[];
>
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index 3dc847f835..62608a5389 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -349,11 +349,6 @@ static CPUState *gdb_get_cpu(uint32_t pid, uint32_t =
tid)
>      }
>  }
>
> -bool gdb_has_xml(void)
> -{
> -    return !!gdb_get_cpu_process(gdbserver_state.g_cpu)->target_xml;
> -}
> -
>  static const char *get_feature_xml(const char *p, const char **newp,
>                                     GDBProcess *process)
>  {
> @@ -1086,11 +1081,6 @@ static void handle_set_reg(GArray *params, void *u=
ser_ctx)
>  {
>      int reg_size;
>
> -    if (!gdb_get_cpu_process(gdbserver_state.g_cpu)->target_xml) {
> -        gdb_put_packet("");
> -        return;
> -    }
> -
>      if (params->len !=3D 2) {
>          gdb_put_packet("E22");
>          return;
> @@ -1107,11 +1097,6 @@ static void handle_get_reg(GArray *params, void *u=
ser_ctx)
>  {
>      int reg_size;
>
> -    if (!gdb_get_cpu_process(gdbserver_state.g_cpu)->target_xml) {
> -        gdb_put_packet("");
> -        return;
> -    }
> -
>      if (!params->len) {
>          gdb_put_packet("E14");
>          return;
> --
> 2.39.2
>
>

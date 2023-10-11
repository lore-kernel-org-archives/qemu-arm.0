Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp515375ejr;
        Tue, 10 Oct 2023 17:58:22 -0700 (PDT)
X-Received: by 2002:a67:f9d7:0:b0:452:6780:a6d1 with SMTP id c23-20020a67f9d7000000b004526780a6d1mr18924640vsq.1.1696985902213;
        Tue, 10 Oct 2023 17:58:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696985902; cv=none;
        d=google.com; s=arc-20160816;
        b=yZj3ijjn6koRQmLd/oJ7/yN6fywK42Be9H4LzYleUKXQGnjw7bEUFv1OY6jVLBs4Fz
         dnM7NyyaEBDFWUlgAEN3OUV3l3CB+Ny8y7AainVzDCgwGwfKSFAo3VwuVPh4F7R2tqYf
         d13v3xk1uktN6CAl1P2PDVnH+N7UywgSdjLRK2M3PW9uokTq8BInFbMsSp2qNApXUoG1
         e/3rCY0MbWhSrK3sHXvXmOsgAl+YD8oafQds1yPRbcPuj9GACBDjEaZgC6xwQdYBH5lc
         NOFLmG9lv0fZryjR3cJc3jMdljbtoatkVKkmjzs4bGEaSDe1iTbMN4R4kh015qRhKTs4
         UM4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A57TM/3+3Y4XB6+NXinNYH6inAvqYR+M0a5QwRks3Bg=;
        fh=cqk238ux3/GdOijP7fp8WGbp8VqG0EAAdwsLvgVM+lA=;
        b=OFdS7dg7iSrM+piwwR+ip9+yVGOY3vqe45SUjYKolC+uFbVU6OVy2QUs20WtvTDM6Y
         etcGgFL2c+zgU5RGO5BcMmya4Uzh5Gf3qPYKltiBIhqWQKs2dzuSn8MLlsCSA+IOdMdw
         80TihW46cwlD/Sy8xD018LTgaoNJmpCR1RPt1OoGb4vqhI8aOQUVE8RpEUNORaCN1ihA
         F6Ql6pvUeDDoW+oLXdZ2FGGvEistX1vy3mpaf6zKc6hm5ReV+H0goaq07gSZYVaKzepp
         oRNbBNpqHlUrcFT6v1fD81/PkYARtMuHkn1YJeSndrVq+9AEbxv1LQMGCWM4frLrTQc4
         TKUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ENOaG8Ys;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p12-20020a67a60c000000b004526ecb17e3sor4832005vse.7.2023.10.10.17.58.22
        (Google Transport Security);
        Tue, 10 Oct 2023 17:58:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ENOaG8Ys;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696985901; x=1697590701; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A57TM/3+3Y4XB6+NXinNYH6inAvqYR+M0a5QwRks3Bg=;
        b=ENOaG8Ysq08RcAyVW+CIjXMNgvg/sNhHnwgXfvJKEDL/TiGeFkHKcZ+m1PNtXcmON8
         em0amrNCrrJWirI/jAhR3TxweAjykAXuwP1lZ/IFl5RT5f/6+h7kPkqe5dse6xnUQPlI
         zBrkmBQCWQa+aaY4vgO286b6enf1P4hzkxJtg5iKp8C1VI1/Gmv1+VxrELLkOivS5JJr
         AvKAwSS3Z5Ezu79t2uj3+fZWdV/uHrBArxl+gsuBLGo08TKFGgXxYJbxgsCmSZ5OZGDP
         uxjCX0ISiC9D8Pt46qc0gvKUahY7NMxLaQmK4OpAOXOe2DZ5T3CL5YIad6TJm+Y8ureh
         iuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696985901; x=1697590701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A57TM/3+3Y4XB6+NXinNYH6inAvqYR+M0a5QwRks3Bg=;
        b=bww7JvF/UYfvEAXrKjWCE6C5uCinEuf3tmXt8wuQptVoG1MULd+uZTf5M7UTIh2clV
         0JEMHW8hnyTDMZDC7HFJc0Irc+lnurHvJ8jSCtFHioKy3Ke5cG4yqNNRKqszvGw5tHJu
         03QU6Fz9bWuKFydEnS8na3QKYYDp+QsCTvQOYi8q/rnqM9sjjV+IQRpsquUNEjFprkEa
         0RpuQiKnMUuwkWv5siT6m87qu1zqqrJzSmMCBCDt3VXTNZ4FNxPSSZvU7O7WnWE9oe3R
         BJhQwYBiDicqkQ6tXwCIoQGeURFw5gef35geJK49/mw+6Ot+z8dfcjeXoJ8+/amDS4sF
         S1Og==
X-Gm-Message-State: AOJu0Yz3I51zCQ+fI6NJJk/zBO7z/g9AEk7aVu1DTJY47VFjrxGJ8SSB
	3mzsfx6/Tphefp2ZijjvW9gD9G0T8nWuOH0WCf14yN7jIAwuYw==
X-Google-Smtp-Source: AGHT+IF1/cGebYEyPjv1zp7eYAb2uu01zcnezyBsF/1P9pm03X3N0T/+xSZ0wkvVYuuaOpnngMp2DUm51frLL3M8bdk=
X-Received: by 2002:a05:6102:4a5:b0:44d:5a92:ec40 with SMTP id
 r5-20020a05610204a500b0044d5a92ec40mr19039711vsa.24.1696985901084; Tue, 10
 Oct 2023 17:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <20231009164104.369749-1-alex.bennee@linaro.org> <20231009164104.369749-20-alex.bennee@linaro.org>
In-Reply-To: <20231009164104.369749-20-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 10:57:54 +1000
Message-ID: <CAKmqyKMa1FU=gvOg8XVsexD6KoF_aZLU7Z=P=dExz3vu4sTEsA@mail.gmail.com>
Subject: Re: [PATCH 19/25] gdbstub: Replace gdb_regs with an array
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
X-TUID: 1MD7CRSbQtkt

On Tue, Oct 10, 2023 at 2:47=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>
> An array is a more appropriate data structure than a list for gdb_regs
> since it is initialized only with append operation and read-only after
> initialization.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Message-Id: <20230912224107.29669-13-akihiko.odaki@daynix.com>
> [AJB: fixed a checkpatch violation]
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/core/cpu.h |  2 +-
>  gdbstub/gdbstub.c     | 35 +++++++++++++++++++++--------------
>  2 files changed, 22 insertions(+), 15 deletions(-)
>
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 7b8347ed5a..3968369554 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -502,7 +502,7 @@ struct CPUState {
>
>      CPUJumpCache *tb_jmp_cache;
>
> -    struct GDBRegisterState *gdb_regs;
> +    GArray *gdb_regs;
>      int gdb_num_regs;
>      int gdb_num_g_regs;
>      QTAILQ_ENTRY(CPUState) node;
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index 62608a5389..b1532118d1 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -51,7 +51,6 @@ typedef struct GDBRegisterState {
>      gdb_get_reg_cb get_reg;
>      gdb_set_reg_cb set_reg;
>      const char *xml;
> -    struct GDBRegisterState *next;
>  } GDBRegisterState;
>
>  GDBState gdbserver_state;
> @@ -386,7 +385,8 @@ static const char *get_feature_xml(const char *p, con=
st char **newp,
>                  xml,
>                  g_markup_printf_escaped("<xi:include href=3D\"%s\"/>",
>                                          cc->gdb_core_xml_file));
> -            for (r =3D cpu->gdb_regs; r; r =3D r->next) {
> +            for (guint i =3D 0; i < cpu->gdb_regs->len; i++) {
> +                r =3D &g_array_index(cpu->gdb_regs, GDBRegisterState, i)=
;
>                  g_ptr_array_add(
>                      xml,
>                      g_markup_printf_escaped("<xi:include href=3D\"%s\"/>=
",
> @@ -430,7 +430,8 @@ static int gdb_read_register(CPUState *cpu, GByteArra=
y *buf, int reg)
>          return cc->gdb_read_register(cpu, buf, reg);
>      }
>
> -    for (r =3D cpu->gdb_regs; r; r =3D r->next) {
> +    for (guint i =3D 0; i < cpu->gdb_regs->len; i++) {
> +        r =3D &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
>          if (r->base_reg <=3D reg && reg < r->base_reg + r->num_regs) {
>              return r->get_reg(env, buf, reg - r->base_reg);
>          }
> @@ -448,7 +449,8 @@ static int gdb_write_register(CPUState *cpu, uint8_t =
*mem_buf, int reg)
>          return cc->gdb_write_register(cpu, mem_buf, reg);
>      }
>
> -    for (r =3D cpu->gdb_regs; r; r =3D r->next) {
> +    for (guint i =3D 0; i < cpu->gdb_regs->len; i++) {
> +        r =3D  &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
>          if (r->base_reg <=3D reg && reg < r->base_reg + r->num_regs) {
>              return r->set_reg(env, mem_buf, reg - r->base_reg);
>          }
> @@ -461,17 +463,23 @@ void gdb_register_coprocessor(CPUState *cpu,
>                                int num_regs, const char *xml, int g_pos)
>  {
>      GDBRegisterState *s;
> -    GDBRegisterState **p;
> -
> -    p =3D &cpu->gdb_regs;
> -    while (*p) {
> -        /* Check for duplicates.  */
> -        if (strcmp((*p)->xml, xml) =3D=3D 0)
> -            return;
> -        p =3D &(*p)->next;
> +    guint i;
> +
> +    if (cpu->gdb_regs) {
> +        for (i =3D 0; i < cpu->gdb_regs->len; i++) {
> +            /* Check for duplicates.  */
> +            s =3D &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
> +            if (strcmp(s->xml, xml) =3D=3D 0) {
> +                return;
> +            }
> +        }
> +    } else {
> +        cpu->gdb_regs =3D g_array_new(false, false, sizeof(GDBRegisterSt=
ate));
> +        i =3D 0;
>      }
>
> -    s =3D g_new0(GDBRegisterState, 1);
> +    g_array_set_size(cpu->gdb_regs, i + 1);
> +    s =3D &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
>      s->base_reg =3D cpu->gdb_num_regs;
>      s->num_regs =3D num_regs;
>      s->get_reg =3D get_reg;
> @@ -480,7 +488,6 @@ void gdb_register_coprocessor(CPUState *cpu,
>
>      /* Add to end of list.  */
>      cpu->gdb_num_regs +=3D num_regs;
> -    *p =3D s;
>      if (g_pos) {
>          if (g_pos !=3D s->base_reg) {
>              error_report("Error: Bad gdb register numbering for '%s', "
> --
> 2.39.2
>
>

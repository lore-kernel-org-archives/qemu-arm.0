Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp517219nji;
        Thu, 11 Jul 2024 18:45:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVM5XvdzAuqeeJRmA1RCQlAjAJTs15uxo7a61jZA+7Os4ZbJ4PffPS7Z9UGsn4mLQQyDQWuwprExAUDakOXcv+2gZsEsG0r
X-Google-Smtp-Source: AGHT+IFTD5x6lGX+i49UtVPeYUf9gDhNWiiFBpDVoeqQ4x2f5GjOmRyiHgomjBYUZESyAQLU8SKY
X-Received: by 2002:ae9:f444:0:b0:79f:b0e:2e70 with SMTP id af79cd13be357-79f19aba40fmr1148434685a.55.1720748708803;
        Thu, 11 Jul 2024 18:45:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720748708; cv=none;
        d=google.com; s=arc-20160816;
        b=ChaJN8SDC342pbYql2qhNZBBJlyyrtpU3MKn5VQEAQ182/VaVsrYs8ZNibAPQ7ZzGL
         McW4BKKs4FEnPGJYdAV2VLRW1k7bNep6wf9gKYlIRXn9GMfnSG0JTgLQHCU4iIIj4nYV
         PE3FXklfOCgYYuViRzCw4ATv9m0zARi0OOlu7KHjZuVvH/4Z16sjhsczYEIDuMjIEZw9
         mIB8BePOYJD6Ak1cxTdGCMm4qJs1KwI5RA4Z+MkMJioTyOXXxTfc4v6YTPl1exF0Ehgw
         4+71myRj3TI8FnEu3zKfZbcyh6j5fWKb99T3nikc9VX/f44iA38zmaMz5eLVq8qpqA7m
         oFCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=C3A4irkMcbwaGJoNr9hhzt31fuWVr5mids9uLeF2tZs=;
        fh=ij4TAkatZS9LBLrR2b4Ygcy7fmAueQ/yStp9tPBrbGk=;
        b=G4zz6dXajyPnX50ka/10wwo0GUMTPM/a/oHGK5W6MjoZ6XufFEB+5C9U0sCoaee7b0
         FYrc6GM/+1qjc7h2X3CnMHNYC9J+fILahPfpzT+uhelY5GKn+KXDf2uxNtsnblk6wUl8
         nzWEdHX0y3qi3leaccoBx4kP82sU1TzGsV/k0yQ5xvA2tFyJuSZdOHVEhFTsW8AR4ild
         Eye3q74Ke++WZskMjQEDNacbf1nuFdwrOqX/QI/wlpU9C0veSDmKUv2pbB2EFqDv1s6h
         g4bpZAmHAQld/Y1G4DNZUAzs1CWccyFVhsdmUwy0eeur4ci40YUepVJ8n6g1S+QAFFw6
         Vcig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kCYnLBR2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79f190e789esi957393885a.721.2024.07.11.18.45.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2024 18:45:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kCYnLBR2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sS5L7-0003o9-CT; Thu, 11 Jul 2024 21:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1sS5L5-0003g8-C2; Thu, 11 Jul 2024 21:44:47 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1sS5L3-0003TR-JY; Thu, 11 Jul 2024 21:44:47 -0400
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-48ffd139a9cso561182137.0; 
 Thu, 11 Jul 2024 18:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720748682; x=1721353482; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C3A4irkMcbwaGJoNr9hhzt31fuWVr5mids9uLeF2tZs=;
 b=kCYnLBR2uQXenhO0WzPPN2J1WW8f9vRLOqi3OV25U+JsdrkhjK43PA9jK1X+GVxjt0
 7s8uH1x0HCVVwNOKHKnmXemoo5rFQIboyHdanrWJbJzWhzTCmmTW9VHORp7aN2fKW8aK
 rmcYAgjd15XCqaTCijyIOlm4a7n5X6sk8ZeEJ/QPy8UhCHRwBi6lX3icIv/Quk0UBWti
 URVac3FX/8zMa8ZlNCS/CaMu27x2ovlZFj0EHqqszaSUjWzUS131RG5qNu5jDndU4Ys0
 k0AGWGCgsuBg5DdXOeIdskDb13l9gy+y6GqvSum0vIAk5X+urAWZan3U4uKA9oycUi9m
 yBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720748682; x=1721353482;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C3A4irkMcbwaGJoNr9hhzt31fuWVr5mids9uLeF2tZs=;
 b=F4Pws5AZ4egRFwqj/ghjdLZVimwpAyOSog8f2YYsPXh2AOqp7SCe9gE+lN7/WAOpll
 k6gAdYZebR2esdNNWKDgLZo1ujsnSTHxkf4O5Bksa+I15rvjg3iq4NUSnpwIdd8DmCvR
 yHylge8UAQ3JMbtnGs8snvU61hSGnPat+OyuN1XWyHVMckvy5B5bPnaqYn8mxnTjSlCy
 MgRy/PclqRb/a9ur25mYLrBkDtdNWw4s+3Dy0WdjCAXv0FqF/gcSKLhcTFjDNLXFJIZO
 bLUVrLudw+Hx3hX2Ru/jgodEWY0ZfhaIfUHhQhL3tNKynNMcO6ZPd1U+qiDPe1L1z+wI
 tk2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYy4mekT9xLXwx2hNYRbnvz4C8FZZyoAyQOWYFRdS2y71vplpUDbUgazCuw1QJJdfa7l7SYrAV3ylP3XESxRF3BVXp4NucOSigPsEyeKy2rozDNtFWZmkpEGDsEvVOP9ABiu8XIBW8niU8JJYPhhNdTb3S7I87kUGzjrQLdXljsyMT6hMf8g==
X-Gm-Message-State: AOJu0YwglKe39ecRSM0i8B1jVN3OFgwT7pwod0RSeFUUUUaZvOsOyKxl
 mC4w+l6OKYNb2znbQcfr0mTNF63G7+wbK1YllJMqFyDWLqlcb4uJyBbxR4jwDt5RTJ8OcQZF5dg
 w+LEuDvmN0txlKWOZGOqMK/JHlxo=
X-Received: by 2002:a05:6102:1607:b0:48f:e86c:5e1d with SMTP id
 ada2fe7eead31-49032134fa4mr11886198137.9.1720748682370; Thu, 11 Jul 2024
 18:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240612081416.29704-1-jim.shu@sifive.com>
 <20240612081416.29704-7-jim.shu@sifive.com>
In-Reply-To: <20240612081416.29704-7-jim.shu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Jul 2024 11:44:16 +1000
Message-ID: <CAKmqyKPr0WPz1jYjxphbumhdOtO81ETcGMiszAMtmEwOux6AOA@mail.gmail.com>
Subject: Re: [RFC PATCH 06/16] target/riscv: Add hard-coded CPU state of WG
 extension
To: Jim Shu <jim.shu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>, 
 David Hildenbrand <david@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>, 
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aleksandar Rikalo <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>, 
 Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>, 
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VkVJJHe7DU2G

On Wed, Jun 12, 2024 at 6:17=E2=80=AFPM Jim Shu <jim.shu@sifive.com> wrote:
>
> Add hard-coded state of WG extension. 'mwid' is the M-mode WID of CPU.
> 'mwidlist' is the list of allowed WID value of 'mlwid' CSR.
>
> These CPU states can be set by CPU option, or can be set by machine code
> via newly added APIs. If we want different WG configs of CPUs, we should
> set it by machine code.
>
> Signed-off-by: Jim Shu <jim.shu@sifive.com>
> ---
>  target/riscv/cpu.c        |  2 ++
>  target/riscv/cpu.h        |  2 ++
>  target/riscv/cpu_cfg.h    |  2 ++
>  target/riscv/cpu_helper.c | 18 ++++++++++++++++++
>  4 files changed, 24 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d70eedf957..4e87fa4d5b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2291,6 +2291,8 @@ static Property riscv_cpu_properties[] =3D {
>       * it with -x and default to 'false'.
>       */
>      DEFINE_PROP_BOOL("x-misa-w", RISCVCPU, cfg.misa_w, false),
> +    DEFINE_PROP_UINT32("mwid", RISCVCPU, cfg.mwid, UINT32_MAX),
> +    DEFINE_PROP_UINT32("mwidlist", RISCVCPU, cfg.mwidlist, UINT32_MAX),

These should be "x-" as well.

Also same comment about functionality and properties as previous patch

Alistair

>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 6fe0d712b4..2d3bfedbba 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -540,6 +540,8 @@ void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env=
, uint32_t priv,
>                                     void *rmw_fn_arg);
>
>  RISCVException smstateen_acc_ok(CPURISCVState *env, int index, uint64_t =
bit);
> +void riscv_cpu_set_wg_mwid(CPURISCVState *env, uint32_t mwid);
> +void riscv_cpu_set_wg_mwidlist(CPURISCVState *env, uint32_t mwidlist);
>  #endif /* !CONFIG_USER_ONLY */
>
>  void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 23e779ae08..de9c134b15 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -166,6 +166,8 @@ struct RISCVCPUConfig {
>      bool pmp;
>      bool debug;
>      bool misa_w;
> +    uint32_t mwid;
> +    uint32_t mwidlist;
>
>      bool short_isa_string;
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 161df34626..ff20ab6ab8 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -149,6 +149,24 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr =
*pc,
>      *pflags =3D flags;
>  }
>
> +#ifndef CONFIG_USER_ONLY
> +void riscv_cpu_set_wg_mwid(CPURISCVState *env, uint32_t mwid)
> +{
> +    CPUState *cs =3D env_cpu(env);
> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +
> +    cpu->cfg.mwid =3D mwid;
> +}
> +
> +void riscv_cpu_set_wg_mwidlist(CPURISCVState *env, uint32_t mwidlist)
> +{
> +    CPUState *cs =3D env_cpu(env);
> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +
> +    cpu->cfg.mwidlist =3D mwidlist;
> +}
> +#endif /* CONFIG_USER_ONLY */
> +
>  void riscv_cpu_update_mask(CPURISCVState *env)
>  {
>      target_ulong mask =3D 0, base =3D 0;
> --
> 2.17.1
>
>

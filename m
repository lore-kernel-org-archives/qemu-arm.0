Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp1114511njb;
        Fri, 5 Jul 2024 03:02:36 -0700 (PDT)
X-Received: by 2002:a17:907:3ea8:b0:a77:d1ea:ab26 with SMTP id a640c23a62f3a-a77d1eaacc1mr95398666b.65.1720173756161;
        Fri, 05 Jul 2024 03:02:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720173756; cv=none;
        d=google.com; s=arc-20160816;
        b=rEg27Bn3Lpp/aq8g4RmUdlKH92o8lVjRd4nJucBZ0BpkWGVLJ6uI1X69RXSoNDr5B/
         oDs9WeE5rtVi/M9JT6mXzsEnk27yQ115sOmI9sCmMqkEnTO6RSNlA4oAgkvtze2CIxlU
         2B4hlUQJH/lLw8+p1SY3kgz3GeG0WleDe3x6N2fhxiF8Q2snnTlBWeeCtp/d+6hE0dX6
         8XoEqceSBitvxoIZ10r7X5xRl/dLYhCTeIHu+od0rrnvQ3d3O6kCP6azG3s0Y4R8WJOD
         3P33mGy2BrFXMEvj9TwoWXhc3EMRks8Ha7WvmE5I1EbvCNCQi5LUTqZWE6AgGuila66S
         FItQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0xpghvKJ3CS5b+n5sfRES7MRyE9Haf74z2Qv8jnQiWQ=;
        fh=D8uyZejLYHQtwUNKtY39iIwPBhb1j2MMTF98+RktrMk=;
        b=j+7hKRnFhE4BL+ZHXJn59t4KR4TFAmIDoeFg0Dg5aUHEw5uJtwBeLpxRXQMslJM7ZO
         JaMjZ8LNJ3dbN9p6lL3X8aW60YEDPYu5drHSfAFX6H7ENHfaT+NSSkvKAonD4DdjU6wm
         o/O4sCtQ2WWrcmmVYyJpmxlK2xEASP8kyEdy2vGhDkawEADb4iFkGSAZG11ZEsc4fQ6F
         kZwk5xRkywwND7u3gx0X7V6w2JtUlMFnhOZINHSFcipmZ0Hv+3Dt2WVUjpNPI0+uyfVs
         ba1bYLC7E+c3FpOWhAxTDNqGLks+8XY9kJaXy6fMtd9S1yRnK9zrRtNggZXoRFQjIUSv
         6xcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vvPM7BMs;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a729d9c7273sor493024566b.15.2024.07.05.03.02.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 05 Jul 2024 03:02:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vvPM7BMs;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173755; x=1720778555; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xpghvKJ3CS5b+n5sfRES7MRyE9Haf74z2Qv8jnQiWQ=;
        b=vvPM7BMsLAKA2r2+yFz4tc1eBfzBH0l+Z+D2lOQS2ykBsGKqgugB6QPh7CEh1jTn0G
         Rj6I+u661Eza4Ruucfnh8QayLCzHK+EBbEX/H4gfLhkuCbVvRT9n/kFUCL4vELpRY7dp
         B4SY3W1cNnINTTuIwuKEGyZUa1DViwSY9wtAvRwL8ppjaHNsDLvkTJACExNtc1okIPwk
         iMZhXuWOPP25DfUfc8FQbGQrBo8meOOH+viFlI8724YdtOxaQmhC91B97iIxk0Ob3ky1
         4AJbbQ5V9mIbmyolgsil0uQWU9C7khVoq6j8L5hFW6aCVBHcR4+PVXdqZGvv0Raa+Cdq
         Dp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173755; x=1720778555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xpghvKJ3CS5b+n5sfRES7MRyE9Haf74z2Qv8jnQiWQ=;
        b=mVjPUgACK7GaAmthOIEpDnhhNCjqTeVnIBq9A1EXF2qPjZYwS97y71/COC3ISmmoXG
         J/iNxiA5WBB2Yp2B9xQzo0vNeOpRrh1GOi9pjVo5xSXOosnaapq4grtM/6UaK9b9MUXn
         d4ceU3bfgv/xtXk/DrKTs9OpEdaefS+vy4HhsFb+aIgZKo5bhLpwEoHXzbIX1uBydCYb
         1udh0ZwoCyKS529H8rnNChV/2YFRpZ770e6ixmt3WeqxyUYQKMubwbevF0h2pO3e90+Q
         OwwFH7DTQVdNrnZ2bvH98/fi3ZAy0y2/0406A6L524/dG6npWsICJhKS1rXGhRsLt8Le
         HHCw==
X-Gm-Message-State: AOJu0Yx9cHw5f18xfcI7dVQNFTUA0DAv8H0BmobRowSHIdFipzZDcpzZ
	d+zsqb7P7Ofe9WKDmxZdGEMOIy+YbY1LORnXvq3wc4s3IWfVB70Q1cL2uRMtLFkPvWpjJ74dkB/
	im6lEy5l0iBVqXLkDVs6VGZsCwhh/sn88l3sATUTR7B+oxtRu1x39CVZT
X-Google-Smtp-Source: AGHT+IGaZpaQnZQQgDoQbq5AB9VHE+OwI2XeGoJ4tld6AWQ6zZWJX8SBK/idsekr1yrmed46wFQSZomYTBSnBZWr8Js=
X-Received: by 2002:a17:906:2983:b0:a6f:5150:b805 with SMTP id
 a640c23a62f3a-a77ba48324amr254099966b.33.1720173754975; Fri, 05 Jul 2024
 03:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240705084047.857176-1-alex.bennee@linaro.org> <20240705084047.857176-22-alex.bennee@linaro.org>
In-Reply-To: <20240705084047.857176-22-alex.bennee@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 5 Jul 2024 13:02:18 +0300
Message-ID: <CAAjaMXajPROJp=aQnMqHC7X49sFba1wpMgi=EDxJ5z3zua59HQ@mail.gmail.com>
Subject: Re: [PATCH v2 21/40] test/plugin: make insn plugin less noisy by default
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
	Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: fy29+Upr3URv

On Fri, 5 Jul 2024 at 11:49, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> While the match functionality is useful lets make the verbosity
> optional while we are actually running.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/plugin/insn.c | 36 +++++++++++++++++++++---------------
>  1 file changed, 21 insertions(+), 15 deletions(-)
>
> diff --git a/tests/plugin/insn.c b/tests/plugin/insn.c
> index 5e0aa03223..524f9ddde8 100644
> --- a/tests/plugin/insn.c
> +++ b/tests/plugin/insn.c
> @@ -20,6 +20,7 @@ static qemu_plugin_u64 insn_count;
>
>  static bool do_inline;
>  static bool do_size;
> +static bool do_trace;
>  static GArray *sizes;
>
>  typedef struct {
> @@ -73,30 +74,30 @@ static void vcpu_insn_matched_exec_before(unsigned in=
t cpu_index, void *udata)
>      MatchCount *match =3D qemu_plugin_scoreboard_find(insn_match->counts=
,
>                                                      cpu_index);
>
> -    g_autoptr(GString) ts =3D g_string_new("");
> -
>      insn->hits++;
> -    g_string_append_printf(ts, "0x%" PRIx64 ", '%s', %"PRId64 " hits",
> -                           insn->vaddr, insn->disas, insn->hits);
>
>      uint64_t icount =3D qemu_plugin_u64_get(insn_count, cpu_index);
>      uint64_t delta =3D icount - match->last_hit;
>
>      match->hits++;
>      match->total_delta +=3D delta;
> -
> -    g_string_append_printf(ts,
> -                           " , cpu %u,"
> -                           " %"PRId64" match hits,"
> -                           " =CE=94+%"PRId64 " since last match,"
> -                           " %"PRId64 " avg insns/match\n",
> -                           cpu_index,
> -                           match->hits, delta,
> -                           match->total_delta / match->hits);
> -
>      match->last_hit =3D icount;
>
> -    qemu_plugin_outs(ts->str);
> +    if (do_trace) {
> +        g_autoptr(GString) ts =3D g_string_new("");
> +        g_string_append_printf(ts, "0x%" PRIx64 ", '%s', %"PRId64 " hits=
",
> +                               insn->vaddr, insn->disas, insn->hits);
> +        g_string_append_printf(ts,
> +                               " , cpu %u,"
> +                               " %"PRId64" match hits,"
> +                               " =CE=94+%"PRId64 " since last match,"
> +                               " %"PRId64 " avg insns/match\n",
> +                               cpu_index,
> +                               match->hits, delta,
> +                               match->total_delta / match->hits);
> +
> +        qemu_plugin_outs(ts->str);
> +    }
>  }
>
>  static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb=
)
> @@ -216,6 +217,11 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plug=
in_id_t id,
>              }
>          } else if (g_strcmp0(tokens[0], "match") =3D=3D 0) {
>              parse_match(tokens[1]);
> +        } else if (g_strcmp0(tokens[0], "trace") =3D=3D 0) {
> +            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_trace)=
) {
> +                fprintf(stderr, "boolean argument parsing failed: %s\n",=
 opt);
> +                return -1;
> +            }
>          } else {
>              fprintf(stderr, "option parsing failed: %s\n", opt);
>              return -1;
> --
> 2.39.2
>
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

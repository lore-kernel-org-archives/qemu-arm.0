Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3624048wrs;
        Mon, 26 Aug 2019 01:46:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxHzPs6c5JBF9Enlhb19aJIZsq/1YUfm+RyvdPm2jN04rUZ3bjwRw7+/vb5DAGHD2+gNqTO
X-Received: by 2002:a05:620a:143b:: with SMTP id k27mr14920150qkj.127.1566809169574;
        Mon, 26 Aug 2019 01:46:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566809169; cv=none;
        d=google.com; s=arc-20160816;
        b=Ep99qFboPIaGeHJk/Yqrwwqs+WE3EyJlk6ewZnyN3Tosq4iXHPZcD65zztA7HL7CPn
         IAxKusI6bZ5FZLcTNOGqG5B15WAnRZyplljeFboZrHKwqs6KNCuzhbBRYTdkYZkVs7L/
         f/OzbvN8BXqMWmclupDViJWdUigVWDixs27khPqoAfJDPln6L2T9dPNs6RYdqNAtzwq7
         vIO6so0qdSSn/uWtd1eAg+8SoOXQaR7wN/2cDcdZ8PvBVKs1QC3s3HbSmllEWSYMTktP
         XEwGp+62rNtp5rtLU8dciK8jwFb+doWaGodCRWfUFizD96DdgCNOhIYDnRyTC56KsOcv
         Wqmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=poraSRz8M3oFkfNAq9UaK4U2/iXGyh5o4nlKUmRvF24=;
        b=m3fRRaYh0wlssvLEmeOCzedjprWkrpwUSneWCLXTODc4v1/dCaxkRpb5LE8j1ox/Yu
         FUdBbFATwfbmB/dC6JFawADCgK3qvq4CzNtQPDa88CHzvzREB080K+OS27FkBfJYcWTG
         /9NNYQKTqbKZwTM65Gt+RAYjVbIILk38hiRNwJrZwq6GzxRVhpOrriA/SiqmXe3lxUbF
         z527CsL4mVhgwAHHkvcFnoMTRPmwDPErROUDoGCCHXPlRnsFpEUsns3QiLryETtslAhj
         oAhvPYkXcnwCGhF/eXveRhrqaGHrwHPNcG1wji4llODC6axkPqq6WcdQIF76ShPfrOiU
         kpZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HvuNVGgM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b192si6842598qkc.367.2019.08.26.01.46.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2019 01:46:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HvuNVGgM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2Adc-00039c-Tk
	for alex.bennee@linaro.org; Mon, 26 Aug 2019 04:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50197)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent.desnogues@gmail.com>) id 1i2AdL-00037i-UP
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 04:45:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent.desnogues@gmail.com>) id 1i2AdK-0003Nn-KC
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 04:45:51 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:34747)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
 id 1i2AdF-0003Kv-Ss; Mon, 26 Aug 2019 04:45:45 -0400
Received: by mail-io1-xd42.google.com with SMTP id s21so35497355ioa.1;
 Mon, 26 Aug 2019 01:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=poraSRz8M3oFkfNAq9UaK4U2/iXGyh5o4nlKUmRvF24=;
 b=HvuNVGgMfdkUJpHYfeMMR628nfSpspO2QVOyWnYRHuhEabc1yBzCgjbzZzs9gtnEc5
 m6U8xJzNiFolZVVOK0wJzsKQ5cVvsZ+nxhXQ//EKYLpPgWnzws5YpAqrjKKzcrO/yjVR
 k8F9+2kSBA/3iqVNZVETIseaOmJ4wJZwZra9hqMOjztARK2JeiC18SvNd9ttatmSeoRF
 4SLpPQsKaxOPz68KN5Gn+Xfbjdi9UhwWe32FCm2zkbxSYLm9Xp0e9zvBnz0JInKwZfsf
 0Q/zo5sT/l7eLBzuPpG9uwtq6bBJTxW5G74dvZzTIfGx7mlpsEKPwg2BS3oktuZEB/J8
 p3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=poraSRz8M3oFkfNAq9UaK4U2/iXGyh5o4nlKUmRvF24=;
 b=dbc6U7Er87OymUxiYl44WY3+FqF5iBkhJC/4lhx1AfOxIgG1MzJOF40UlhayxTWr4J
 E9xP2GgAWPnvA0QDziqqhPtOxtyCBetVmJDne4I77yyFiYlI9Iv7skJLe6yNnUzx3Wjr
 jBs5j3P9iYzgvXhK7YsmzokwevZdP3P5WLmhT9Ih6HjHmqnz8dg0uKlnIYCvBQWMmlXb
 2NtjFpf+bLHnOrscoIEwYY6cWhaKE7oplv4RFom4h1NZqjAwEyDbssZq+F6TznZXBxNX
 hBE2mkUGq0AZ4JloUsE6DNJKcR5W17YeS0PJbFpsYzwGw3AwEpvZlfZTmWRugS7eQVKh
 Kqjg==
X-Gm-Message-State: APjAAAWAVg3eDBBjN46kxjhT9/CBcpve6G4GYNhfe+31i5RwK4kVlcHH
 qRTZgmen4Tp1mnXG+ozJbeRNQzZPjKUcqH+evrw=
X-Received: by 2002:a02:8663:: with SMTP id e90mr16213894jai.98.1566809144434; 
 Mon, 26 Aug 2019 01:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190807045335.1361-1-richard.henderson@linaro.org>
 <20190807045335.1361-11-richard.henderson@linaro.org>
In-Reply-To: <20190807045335.1361-11-richard.henderson@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Mon, 26 Aug 2019 10:45:33 +0200
Message-ID: <CABoDooM4XBSoHieX58czpnjdU_Uq_dPqfkQYMhTb7UtrUjV6rQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d42
Subject: Re: [Qemu-arm] [PATCH 10/11] target/arm: Use unallocated_encoding
 for aarch32
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wv2LG25RcPlC

Hi Richard,

On Wed, Aug 7, 2019 at 6:54 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Promote this function from aarch64 to fully general use.
> Use it to unify the code sequences for generating illegal
> opcode exceptions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.h     |  2 --
>  target/arm/translate.h         |  2 ++
>  target/arm/translate-a64.c     |  7 -------
>  target/arm/translate-vfp.inc.c |  3 +--
>  target/arm/translate.c         | 22 ++++++++++++----------
>  5 files changed, 15 insertions(+), 21 deletions(-)
>
> diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
> index 9cd2b3d238..12ad8ac6ed 100644
> --- a/target/arm/translate-a64.h
> +++ b/target/arm/translate-a64.h
> @@ -18,8 +18,6 @@
>  #ifndef TARGET_ARM_TRANSLATE_A64_H
>  #define TARGET_ARM_TRANSLATE_A64_H
>
> -void unallocated_encoding(DisasContext *s);
> -
>  #define unsupported_encoding(s, insn)                                    \
>      do {                                                                 \
>          qemu_log_mask(LOG_UNIMP,                                         \
> diff --git a/target/arm/translate.h b/target/arm/translate.h
> index de600073d8..6a65df0b27 100644
> --- a/target/arm/translate.h
> +++ b/target/arm/translate.h
> @@ -98,6 +98,8 @@ typedef struct DisasCompare {
>      bool value_global;
>  } DisasCompare;
>
> +void unallocated_encoding(DisasContext *s);
> +
>  /* Share the TCG temporaries common between 32 and 64 bit modes.  */
>  extern TCGv_i32 cpu_NF, cpu_ZF, cpu_CF, cpu_VF;
>  extern TCGv_i64 cpu_exclusive_addr;
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index d68bfc66d3..9e1ffe9cfb 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -352,13 +352,6 @@ static inline void gen_goto_tb(DisasContext *s, int n, uint64_t dest)
>      }
>  }
>
> -void unallocated_encoding(DisasContext *s)
> -{
> -    /* Unallocated and reserved encodings are uncategorized */
> -    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
> -                       default_exception_el(s));
> -}
> -
>  static void init_tmp_a64_array(DisasContext *s)
>  {
>  #ifdef CONFIG_DEBUG_TCG
> diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
> index 5065d4524c..3e8ea80493 100644
> --- a/target/arm/translate-vfp.inc.c
> +++ b/target/arm/translate-vfp.inc.c
> @@ -108,8 +108,7 @@ static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
>
>      if (!s->vfp_enabled && !ignore_vfp_enabled) {
>          assert(!arm_dc_feature(s, ARM_FEATURE_M));
> -        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
> -                           default_exception_el(s));
> +        unallocated_encoding(s);
>          return false;
>      }
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index d6b0ab7247..2d447d4b90 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -1285,6 +1285,13 @@ static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
>      s->base.is_jmp = DISAS_NORETURN;
>  }
>
> +void unallocated_encoding(DisasContext *s)
> +{
> +    /* Unallocated and reserved encodings are uncategorized */
> +    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
> +                       default_exception_el(s));
> +}

Isn't the move of unallocated_encoding from translate-64.c to
translate.c causing issues since gen_exception_insn isn't the same?
In particular in one case the pc is 64-bit while now it's always
32-bit.  Did I miss something?

Thanks,

Laurent

> +
>  /* Force a TB lookup after an instruction that changes the CPU state.  */
>  static inline void gen_lookup_tb(DisasContext *s)
>  {
> @@ -1315,8 +1322,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
>          return;
>      }
>
> -    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
> -                       default_exception_el(s));
> +    unallocated_encoding(s);
>  }
>
>  static inline void gen_add_data_offset(DisasContext *s, unsigned int insn,
> @@ -7638,8 +7644,7 @@ static void gen_srs(DisasContext *s,
>      }
>
>      if (undef) {
> -        gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
> -                           default_exception_el(s));
> +        unallocated_encoding(s);
>          return;
>      }
>
> @@ -9266,8 +9271,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>              break;
>          default:
>          illegal_op:
> -            gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
> -                               default_exception_el(s));
> +            unallocated_encoding(s);
>              break;
>          }
>      }
> @@ -10955,8 +10959,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
>      }
>      return;
>  illegal_op:
> -    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
> -                       default_exception_el(s));
> +    unallocated_encoding(s);
>  }
>
>  static void disas_thumb_insn(DisasContext *s, uint32_t insn)
> @@ -11779,8 +11782,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
>      return;
>  illegal_op:
>  undef:
> -    gen_exception_insn(s, s->pc_curr, EXCP_UDEF, syn_uncategorized(),
> -                       default_exception_el(s));
> +    unallocated_encoding(s);
>  }
>
>  static bool insn_crosses_page(CPUARMState *env, DisasContext *s)
> --
> 2.17.1
>
>

Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp792531ejc;
        Thu, 10 Aug 2023 09:23:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+vL9y5KI8fRnu50Gv39AhMoAmG/jgfLGkFK+NGidXep8eS2AXYBumXBUY3zJM8xAfeXJB
X-Received: by 2002:a05:622a:1006:b0:400:9126:3f16 with SMTP id d6-20020a05622a100600b0040091263f16mr4151519qte.1.1691684603574;
        Thu, 10 Aug 2023 09:23:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691684603; cv=none;
        d=google.com; s=arc-20160816;
        b=vL3bz0L/FOWO4jsFXvWDgrgobLGwDmQxfkCzjzjMLrRZRDfgDpAAz6GJnlAu9klMLX
         NAgTOS/CTO0CskuLPsnQBL/KFewmw3raCoXfC/JohtvL2SoXtoh9mpKClIxyMjT/GvG4
         fUapF3lFLgMfXatBuFPGeLr59BgFYkzaJSL+lv8VOeGazV1/fOuVFgKz+unxbPASWZf/
         IpmqZuKv7rkY4fGnrS2AtuWkvh8mygiXg9I1465R7jTXDVHnJBsKuKlLhDr+I5OJRgnb
         7P6XxN8MVaz7HFv4dORht2JQRB7wHztsPH8E/kS7NdhThIHJOWU0XYtMSoroIvB2e4w0
         Z6+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=vzWOho4GMynsk2L81CW9YpHjDBR30YqTkrHWseLSMFY=;
        fh=2HckukKM1aDIhwR4Gf5EB0R8biZDVGAD3ibhLJ8HTaA=;
        b=ZJricn9Gb5FCQBPPjWkIgglASplO7x8UBkwdwGDXieR+H3hxuhgP5tLRydfSwheRFc
         lkxW9fLbetJV4VFiE56iL12V882W6BfhEBy97fsYygKngaYkpVmNXbL1nbAJUdRAcKSz
         LH9yguwb/vROzrcxreApUcGvgfGXpoCkC1rpfjJXWKWWVvmTyAFTVwWl+DQR2DZWmLLA
         jBiVX0cYunsLAO8n4Ju83eOOE8gnT++fOm62lzWOM5saGEbMj6UCxgppU/YpeneLdA/r
         jSh0p09tSOMTVC7ZQ++zz7oa8frQkd4WtCSW0eEKsl1axUShLU9zQkxHX8PQ2/toX+L7
         h0cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bccdww+a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k12-20020a05622a03cc00b003f518050347si1132505qtx.480.2023.08.10.09.23.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 09:23:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bccdww+a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qU8R8-0005aH-2s; Thu, 10 Aug 2023 12:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8R0-0005Yx-BV
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 12:22:50 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8Qw-0004t6-Ev
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 12:22:49 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-52327d63d7cso1367437a12.1
 for <qemu-arm@nongnu.org>; Thu, 10 Aug 2023 09:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691684564; x=1692289364;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vzWOho4GMynsk2L81CW9YpHjDBR30YqTkrHWseLSMFY=;
 b=bccdww+a8hWxja/oIPDnlncc6tgAU7sLq9JdUWaYD79K6r9KLhOks+Utw+IuU2HRuI
 bejcsLpl4v8/HwlFJve1nKPa+WGXQyFY4thrK+DkorCEsHlqzJPyvqduDgOiz2TaUTfj
 Ot6YGzahFHmLfmi7jcNpnfuYFF28IEkGLVjjixCzuNbUksUvrF/4QL8bVapryenfTAPx
 wBls8UkuOmeJaITQRHoeaAdrbv5tDK+Vp7mYkvNLk7OnGg0Sov8lBLIiFa5+K/oKuupW
 51pM6p6PBlm3w7XLov9dnVk673ClqSjJnfGryMIlmi1Qptto/qAdQOMDNMzks5qwOnxW
 Q3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691684564; x=1692289364;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vzWOho4GMynsk2L81CW9YpHjDBR30YqTkrHWseLSMFY=;
 b=XW0FF3HiZP3uiux7087MuUDZNe3Fv5J6fi0eVUXhWQxlRCq8PN2KS1qyYfepp8h9EC
 lmn1A2VW3rG3jCff7KdZLGEi79/WqkMhVq64jo0BQIVLYR2bQ6MG+ZPxwTcrYbTf/pnB
 5Fdgjk2Zv4LkidnlAH48Gl8xdo1RqcdM0P04OJzf2vkjnqqed4kI3xs7xWGY6jtqDnlx
 WSD04VP4+SPsNp1gocfdXgNdu2m1MAGpSDUqJZ660pyLM3XEEVbPGFyofSHbqwKES0gF
 FRPpMkWpVOYDWVHIakBWXCDFhhgAvehjuiwAfUXLu8ezuHR5ia7AavyF7tZR0W6Uo57D
 /B5g==
X-Gm-Message-State: AOJu0Ywx7NRcswEkhWlSMp/g7o4L037QCjfTfLfeE4G0ZG1HOcOOV1LB
 8etciqxtxZn7C6GwAeWkcpwEjoV6Xr9SsjSK9BruMA==
X-Received: by 2002:a05:6402:5157:b0:523:2911:950 with SMTP id
 n23-20020a056402515700b0052329110950mr2698628edd.18.1691684564237; Thu, 10
 Aug 2023 09:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-5-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Aug 2023 17:22:33 +0100
Message-ID: <CAFEAcA9ym=bQbfizfCbEOP9tZR3pnzBeVLzLQJ6xrc4C4fyRwg@mail.gmail.com>
Subject: Re: [PATCH 04/24] target/arm: Use tcg_gen_negsetcond_*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: JSLBiAv5Xtot

On Tue, 8 Aug 2023 at 04:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 22 +++++++++-------------
>  target/arm/tcg/translate.c     | 12 ++++--------
>  2 files changed, 13 insertions(+), 21 deletions(-)
>
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
> index 5fa1257d32..ac16593699 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -4935,9 +4935,12 @@ static void disas_cond_select(DisasContext *s, uint32_t insn)
>
>      if (rn == 31 && rm == 31 && (else_inc ^ else_inv)) {
>          /* CSET & CSETM.  */
> -        tcg_gen_setcond_i64(tcg_invert_cond(c.cond), tcg_rd, c.value, zero);
>          if (else_inv) {
> -            tcg_gen_neg_i64(tcg_rd, tcg_rd);
> +            tcg_gen_negsetcond_i64(tcg_invert_cond(c.cond),
> +                                   tcg_rd, c.value, zero);
> +        } else {
> +            tcg_gen_setcond_i64(tcg_invert_cond(c.cond),
> +                                tcg_rd, c.value, zero);
>          }
>      } else {
>          TCGv_i64 t_true = cpu_reg(s, rn);
> @@ -8670,13 +8673,10 @@ static void handle_3same_64(DisasContext *s, int opcode, bool u,
>          }
>          break;
>      case 0x6: /* CMGT, CMHI */
> -        /* 64 bit integer comparison, result = test ? (2^64 - 1) : 0.
> -         * We implement this using setcond (test) and then negating.
> -         */
>          cond = u ? TCG_COND_GTU : TCG_COND_GT;
>      do_cmop:
> -        tcg_gen_setcond_i64(cond, tcg_rd, tcg_rn, tcg_rm);
> -        tcg_gen_neg_i64(tcg_rd, tcg_rd);
> +        /* 64 bit integer comparison, result = test ? -1 : 0. */
> +        tcg_gen_negsetcond_i64(cond, tcg_rd, tcg_rn, tcg_rm);
>          break;
>      case 0x7: /* CMGE, CMHS */
>          cond = u ? TCG_COND_GEU : TCG_COND_GE;
> @@ -9265,14 +9265,10 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
>          }
>          break;
>      case 0xa: /* CMLT */
> -        /* 64 bit integer comparison against zero, result is
> -         * test ? (2^64 - 1) : 0. We implement via setcond(!test) and
> -         * subtracting 1.
> -         */
> +        /* 64 bit integer comparison against zero, result is test ? 1 : 0. */

surely "-1" ?

>          cond = TCG_COND_LT;
>      do_cmop:
> -        tcg_gen_setcondi_i64(cond, tcg_rd, tcg_rn, 0);
> -        tcg_gen_neg_i64(tcg_rd, tcg_rd);
> +        tcg_gen_negsetcond_i64(cond, tcg_rd, tcg_rn, tcg_constant_i64(0));
>          break;
>      case 0x8: /* CMGT, CMGE */
>          cond = u ? TCG_COND_GE : TCG_COND_GT;
> diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
> index b71ac2d0d5..31d3130e4c 100644
> --- a/target/arm/tcg/translate.c
> +++ b/target/arm/tcg/translate.c
> @@ -2946,13 +2946,11 @@ void gen_gvec_sqrdmlsh_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
>  #define GEN_CMP0(NAME, COND)                                            \
>      static void gen_##NAME##0_i32(TCGv_i32 d, TCGv_i32 a)               \
>      {                                                                   \
> -        tcg_gen_setcondi_i32(COND, d, a, 0);                            \
> -        tcg_gen_neg_i32(d, d);                                          \
> +        tcg_gen_negsetcond_i32(COND, d, a, tcg_constant_i32(0));        \
>      }                                                                   \
>      static void gen_##NAME##0_i64(TCGv_i64 d, TCGv_i64 a)               \
>      {                                                                   \
> -        tcg_gen_setcondi_i64(COND, d, a, 0);                            \
> -        tcg_gen_neg_i64(d, d);                                          \
> +        tcg_gen_negsetcond_i64(COND, d, a, tcg_constant_i64(0));        \
>      }                                                                   \
>      static void gen_##NAME##0_vec(unsigned vece, TCGv_vec d, TCGv_vec a) \
>      {                                                                   \
> @@ -3863,15 +3861,13 @@ void gen_gvec_mls(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
>  static void gen_cmtst_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
>  {
>      tcg_gen_and_i32(d, a, b);
> -    tcg_gen_setcondi_i32(TCG_COND_NE, d, d, 0);
> -    tcg_gen_neg_i32(d, d);
> +    tcg_gen_negsetcond_i32(TCG_COND_NE, d, d, tcg_constant_i32(0));
>  }
>
>  void gen_cmtst_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
>  {
>      tcg_gen_and_i64(d, a, b);
> -    tcg_gen_setcondi_i64(TCG_COND_NE, d, d, 0);
> -    tcg_gen_neg_i64(d, d);
> +    tcg_gen_negsetcond_i64(TCG_COND_NE, d, d, tcg_constant_i64(0));
>  }
>
>  static void gen_cmtst_vec(unsigned vece, TCGv_vec d, TCGv_vec a, TCGv_vec b)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

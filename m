Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp802843ejc;
        Thu, 10 Aug 2023 09:40:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFDJRpYI4r0By0qIKtODvZPvb1z67hxGPw1x4F0ILZ1A/qa5YpZ+XIYjTUdDS6uvynudz+
X-Received: by 2002:a05:620a:21c1:b0:768:142b:4fc8 with SMTP id h1-20020a05620a21c100b00768142b4fc8mr2673280qka.72.1691685624862;
        Thu, 10 Aug 2023 09:40:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691685624; cv=none;
        d=google.com; s=arc-20160816;
        b=nmD1/2I7PEmBkCnMaF/KkjEpQYXYnzTMqmlrQQZrlZ00HELNs0TSBJZBYfcGkpjZJn
         NkrQJQRwFP0gKkNLhSy3NmHcBzR8Bwzi88c/OhtAPe8oKE/lZH/hfHtq+IjOtFL56/i3
         tMrPhGCmYbF53ijlELp+KuIbbm8pL+GRRPtfNQwG7L22rYuk7hHBJfJVHunqskBuxtSz
         DZOoxuMzSDtTyvhy8uHdKlfXEGbBCCnBtVg3mjRgWvmYDaJJYkP9M5F8IznXpSfzLc3m
         sQXJNL0lJvEvkjpDsHYEpGzRyH74FIf6HCKqc+AEjCepoF3D8F0TdaYVjFoeaoF5yHNk
         M4Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=d4S6ax0GQAgWndF5nePyMopDHsjLNLNzVViEbcdlH38=;
        fh=2HckukKM1aDIhwR4Gf5EB0R8biZDVGAD3ibhLJ8HTaA=;
        b=s+y48CyIJXKenY1vfiyKtviKTWaPxaoSUnRsC3XAwegNsxVibOVUxql+6qHvT7dJ3t
         DTmDMMkSbScY6hlY2d+eH3KYn11pjjQTPCUu5faFg2aPkjD6b0owD9o3/vvQYxXAmQkG
         SQYKAj2W+8v+XLStvhAvRguFObe1B/iqOumRObUS0cjFUWw8ZITDlyAd57dNPiXESqfY
         T+CC4/TP5gNFjcUehxyKrmnoNM+jUgdvlHbhjh8tWn4ibtbA4egE4WfeuSoC0anKydC5
         2KX2SsIUFSz+ZAFxCA6q7349bXLI+sFqIX/Gj/TmQ3yGSCpbzqcCHbdXCHRwlrYYPelz
         qqNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z6xT7P69;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5-20020a05620a0d4500b007655a4d2ab0si1086400qkl.85.2023.08.10.09.40.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 09:40:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z6xT7P69;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qU8h4-0000Xo-8P; Thu, 10 Aug 2023 12:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8h2-0000Vu-Qz
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 12:39:24 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8gz-00089E-JW
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 12:39:24 -0400
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fe700f9bf7so1724344e87.0
 for <qemu-arm@nongnu.org>; Thu, 10 Aug 2023 09:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691685560; x=1692290360;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=d4S6ax0GQAgWndF5nePyMopDHsjLNLNzVViEbcdlH38=;
 b=z6xT7P69jrEWLWpdlUm/1I/Xf1wgMauXaQ/9u1xc/58QkMo8hlpwLkwioTOs3TQdtB
 zJ9YyYx0S83cWSUj7JdaainIia5+dOXXxQWVZamFJOOy3FpDsOqvjVqcHe6a/omhpj8j
 kzvL5gzWnDFi2696TUrMhv099IhWvTib+LpOvR61YXLTer4Pzz842Mv1BLfjlxuMRbjB
 tsH7IS/Ix9KZKHDLXsRP+82/g6lrmfNXlN5TQGqwyyS6oIctEVNZuyrFQOw/OajgOUJU
 qCMWRQjH4UBJSGQpzJOnfr87CV/cb52OgnXeDhjxT+fiQiejgQn9idZSSOYjndGQvxkh
 BPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691685560; x=1692290360;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d4S6ax0GQAgWndF5nePyMopDHsjLNLNzVViEbcdlH38=;
 b=K1++UXaFcFGhQX+f/ui/Xkk2HO389rvaoe29RNEJVu/c7HylqH11oy6rsYo12eselN
 j5jXP3O79eVPFr1nc6RGOmHELyWuVmhdtggq50H1NMXKJHbjt0u/0G1YMgYhVtcDSy+A
 f3/KV5CkcRIEaZErd3lHwXcYMBiZcvWaJI32Kf1r7jpRuosxtnY4a1oafzAXi4h0zYmS
 uEtEJyvm1smb6MUPXGyrtYiKlOpzP2sFGOvuXf9CC4CEn23tGcivvdMsmYPsdt1YvmRV
 HckD4Y/JRw8xvZCkDC1mbga3DI1o3peLfkaJvS3DEOpSX2aL2vRPHrugIuBkqkEuH4MU
 vmlw==
X-Gm-Message-State: AOJu0YyNL9ejeaaVHWpW/fOSrJlu037LDGoJ89V1Cw6z+rnQtZbWAl0b
 Azx977rS6JCxz+IjyIOlw8NFRU2o/GqLXuT4kFIsVw==
X-Received: by 2002:a05:6512:1d0:b0:4fb:9469:d659 with SMTP id
 f16-20020a05651201d000b004fb9469d659mr2098174lfp.23.1691685559778; Thu, 10
 Aug 2023 09:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-13-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Aug 2023 17:39:08 +0100
Message-ID: <CAFEAcA9dqnaqGrLz804UB8zHSnbCEWwhv1nzvdt_j0CS3=mCSg@mail.gmail.com>
Subject: Re: [PATCH 12/24] tcg/aarch64: Implement negsetcond_*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x135.google.com
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
X-TUID: +npz7ea3TKNq

On Tue, 8 Aug 2023 at 04:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Trivial, as aarch64 has an instruction for this: CSETM.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target.h     |  4 ++--
>  tcg/aarch64/tcg-target.c.inc | 12 ++++++++++++
>  2 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
> index 6080fddf73..e3faa9cff4 100644
> --- a/tcg/aarch64/tcg-target.h
> +++ b/tcg/aarch64/tcg-target.h
> @@ -94,7 +94,7 @@ typedef enum {
>  #define TCG_TARGET_HAS_mulsh_i32        0
>  #define TCG_TARGET_HAS_extrl_i64_i32    0
>  #define TCG_TARGET_HAS_extrh_i64_i32    0
> -#define TCG_TARGET_HAS_negsetcond_i32   0
> +#define TCG_TARGET_HAS_negsetcond_i32   1
>  #define TCG_TARGET_HAS_qemu_st8_i32     0
>
>  #define TCG_TARGET_HAS_div_i64          1
> @@ -130,7 +130,7 @@ typedef enum {
>  #define TCG_TARGET_HAS_muls2_i64        0
>  #define TCG_TARGET_HAS_muluh_i64        1
>  #define TCG_TARGET_HAS_mulsh_i64        1
> -#define TCG_TARGET_HAS_negsetcond_i64   0
> +#define TCG_TARGET_HAS_negsetcond_i64   1
>
>  /*
>   * Without FEAT_LSE2, we must use LDXP+STXP to implement atomic 128-bit load,
> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
> index 35ca80cd56..7d8d114c9e 100644
> --- a/tcg/aarch64/tcg-target.c.inc
> +++ b/tcg/aarch64/tcg-target.c.inc
> @@ -2262,6 +2262,16 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>                       TCG_REG_XZR, tcg_invert_cond(args[3]));
>          break;
>
> +    case INDEX_op_negsetcond_i32:
> +        a2 = (int32_t)a2;
> +        /* FALLTHRU */

I see this is what we already do for setcond and movcond,
but how does it work when the 2nd input is a register?
Or is reg-reg guaranteed to always use the _i64 op?

> +    case INDEX_op_negsetcond_i64:
> +        tcg_out_cmp(s, ext, a1, a2, c2);
> +        /* Use CSETM alias of CSINV Wd, WZR, WZR, invert(cond).  */
> +        tcg_out_insn(s, 3506, CSINV, ext, a0, TCG_REG_XZR,
> +                     TCG_REG_XZR, tcg_invert_cond(args[3]));
> +        break;
> +
>      case INDEX_op_movcond_i32:
>          a2 = (int32_t)a2;
>          /* FALLTHRU */
> @@ -2868,6 +2878,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
>      case INDEX_op_sub_i64:
>      case INDEX_op_setcond_i32:
>      case INDEX_op_setcond_i64:
> +    case INDEX_op_negsetcond_i32:
> +    case INDEX_op_negsetcond_i64:
>          return C_O1_I2(r, r, rA);
>
>      case INDEX_op_mul_i32:

thanks
-- PMM

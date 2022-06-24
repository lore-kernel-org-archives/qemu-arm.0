Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp295758lft;
        Fri, 24 Jun 2022 05:52:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sgLLXmHYS3aR/P/naLGuhNj+lHzxbxHhLKOro+aS1AezDadFOlffCFfbYlapEsMTPZjZJ7
X-Received: by 2002:ac8:59d2:0:b0:317:ad6a:38c8 with SMTP id f18-20020ac859d2000000b00317ad6a38c8mr5929485qtf.199.1656075166404;
        Fri, 24 Jun 2022 05:52:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656075166; cv=none;
        d=google.com; s=arc-20160816;
        b=GxUg4yS7Paqw2imz2VHPI2qFIKjZWYpyxoWjuN1p7T+aoDQNwzqN1WeGGipn9RpphI
         d3xY5fDqMz80Ux4BH4NdKs7DFEUfGIDV+YgBcmGMTUM12/4/QyKqUjkkUQcnn79HPTLR
         bFR83YuzWEErsU5ykmzCzVjikoXrdKACBTDb8v6H/B7y3aS0z3+A7ThuqugINEzQ4GDw
         fG6U7OG18BF01AX0Gca5c1LtzWutT549gypIpB+tftGsj4Zc//mGkHNDBpupsB3r3z0a
         tEB1xuIx6vOuI4VKuW1Dr9IgWrO85U4a9zuNZuZeqfnGsbCHCw0a0bzn22E0EVRb1aEV
         Cv2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/UNCLn/C/O19fDQ19Wqb4YIh37GCO1L8N6nznv7f0bc=;
        b=qUXnrXSy+qjF5LUuTPgTVeVxiLrbVIe8mgOnRy59V00WsJL+izDXYZmx0HkSDcKEj4
         nXfQNsZO92KfzEliPTvWi/kYwE+XetPLBwCFB4VZBXrlxS3Kd6/V/rXJeuw0HaVaEng4
         K60ZJMPk8gC7MWJzyR+le1cVXUvAZmKtF+ccgUgSq/fEmAmzpGowWFDVAj4jbQu6Qx7Y
         j88oeF6PH8P/8fZgeLEZmHxFd5PtwVQKHsRo9PqXQgxx37CiKh5mXPRudktAIySgL7aD
         XIfk/FpXrV42XaKz0/0WX31vDsTaTkg4LjEHeLV9l8i8UnnlK1hojX8T4p53CAbjxoXK
         eNYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lDb9ByyP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6-20020ac85c06000000b0031673e72f1asi1590541qti.625.2022.06.24.05.52.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 05:52:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lDb9ByyP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4inl-0006uN-RX
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 08:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4inR-0006tC-Pe
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 08:52:26 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:43692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4inP-0004tq-Eb
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 08:52:24 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-3137316bb69so23543517b3.10
 for <qemu-arm@nongnu.org>; Fri, 24 Jun 2022 05:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/UNCLn/C/O19fDQ19Wqb4YIh37GCO1L8N6nznv7f0bc=;
 b=lDb9ByyP6jG2ZeAe/3VWfR/9fHTc4nkcNQNiw9+F7sEkVtXPYrn0t5BWVDLotSYU/S
 1aj++Brc72LbzmcNqqsWyNVGu49jEZzRQjrefx71UODrCo2f8TQSjtkvGyYhYnfvBpV0
 XqlH5dHuPiIUV6YG3PArZurGVlFKJNhHlFt0mvUv599uRXC/8jFhN84TF9U0C+de5QzH
 ElotFMbGjCi4pO1s900dZyAAbKis6yE6agpozKmfp1lw00nDTFvOKFVOmNwjE5tGbK2d
 JZGt2br5IcGVuhE/JJZGaKz7BqoaWNplzSQilUaLERplRuFnjQrHmjb/uh7Rpfk7ae8F
 d1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/UNCLn/C/O19fDQ19Wqb4YIh37GCO1L8N6nznv7f0bc=;
 b=AKDiDeegDehTQjbPlNMjianD4A7ZN0FoNUefg5Y0b1h8jJuSwN0DSn0WHYFFelvIpu
 kWHCOhxQRcq3xoyzBq2PetilkKzigQqmuCG04e3nq/w2+7pbc8yQwPpjzupi8kWW1Kpx
 2LrWTA5h9i71UltNEut2UmUsg1wN7ROidjmgfiV2xH7zlDG8NtI01em0Yte5C148pA7r
 5kTH1TeeqWGEtT7XqCVcR1onrXVyNjcHa//ao9R1NL2oyf+c8PHL1este4pBK6WHsX8K
 1wjXRJsCWPfwBFj3DaaCjuaECBKkeTmFcfLVcFgOKj8kH+vY4Tu4TBG/877UZb6XvU6X
 xlzA==
X-Gm-Message-State: AJIora8lx2br31J1xvQIz6Wv5pTvyxq41fUXm68oqe8FiVfjc+yheVzZ
 hZIL/Vp7N6vmKCwyzJcnUEP94+8qoG/gH9yio27roA==
X-Received: by 2002:a0d:ca0f:0:b0:317:a2cc:aa2 with SMTP id
 m15-20020a0dca0f000000b00317a2cc0aa2mr17329249ywd.347.1656075141832; Fri, 24
 Jun 2022 05:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-35-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 13:51:44 +0100
Message-ID: <CAFEAcA_dMOKdzt08KwLb=pJTyMFw8PQyPhC7Ni253GLVGvay2w@mail.gmail.com>
Subject: Re: [PATCH v3 34/51] target/arm: Implement PSEL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AeYIDzYelXf6

On Mon, 20 Jun 2022 at 19:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Would be helpful to note in the commit message that this is an
SVE instruction that operates using the SVE vector length but that
it is present only if SME is implemented.

> +static bool trans_PSEL(DisasContext *s, arg_psel *a)
> +{
> +    int vl = vec_full_reg_size(s);
> +    int pl = pred_gvec_reg_size(s);
> +    int elements = vl >> a->esz;
> +    TCGv_i64 tmp, didx, dbit;
> +    TCGv_ptr ptr;
> +
> +    if (!dc_isar_feature(aa64_sme, s)) {
> +        return false;
> +    }
> +    if (!sve_access_check(s)) {
> +        return true;
> +    }
> +
> +    tmp = tcg_temp_new_i64();
> +    dbit = tcg_temp_new_i64();
> +    didx = tcg_temp_new_i64();
> +    ptr = tcg_temp_new_ptr();
> +
> +    /* Compute the predicate element. */
> +    tcg_gen_addi_i64(tmp, cpu_reg(s, a->rv), a->imm);
> +    if (is_power_of_2(elements)) {
> +        tcg_gen_andi_i64(tmp, tmp, elements - 1);
> +    } else {
> +        tcg_gen_remu_i64(tmp, tmp, tcg_constant_i64(elements));
> +    }
> +
> +    /* Extract the predicate byte and bit indices. */
> +    tcg_gen_shli_i64(tmp, tmp, a->esz);
> +    tcg_gen_andi_i64(dbit, tmp, 7);
> +    tcg_gen_shri_i64(didx, tmp, 3);
> +    if (HOST_BIG_ENDIAN) {
> +        tcg_gen_xori_i64(didx, didx, 7);
> +    }
> +
> +    /* Load the predicate word. */
> +    tcg_gen_trunc_i64_ptr(ptr, didx);
> +    tcg_gen_add_ptr(ptr, ptr, cpu_env);
> +    tcg_gen_ld8u_i64(tmp, ptr, pred_full_reg_offset(s, a->pm));
> +
> +    /* Extract the predicate bit and replicate to MO_64. */
> +    tcg_gen_shr_i64(tmp, tmp, dbit);
> +    tcg_gen_andi_i64(tmp, tmp, 1);
> +    tcg_gen_neg_i64(tmp, tmp);
> +
> +    /* Apply to either copy the source, or write zeros. */
> +    tcg_gen_gvec_ands(MO_64, pred_full_reg_offset(s, a->pd),
> +                      pred_full_reg_offset(s, a->pn), tmp, pl, pl);
> +
> +    tcg_temp_free_i64(tmp);
> +    tcg_temp_free_i64(dbit);
> +    tcg_temp_free_i64(didx);
> +    tcg_temp_free_ptr(ptr);
> +    return true;
> +}

Suspect this would be clearer to read as a helper function, but
it's not that long as a series of TCG ops, I suppose.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp572472ejn;
        Thu, 27 Oct 2022 10:30:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6yYgLYOawbfBJaBgERwC6/CMlsARuW/D8LKigzLZquCmvTyRR8F5Jn4wkj+qVWzjFnprm2
X-Received: by 2002:ad4:5ae5:0:b0:4b7:1bdb:d79e with SMTP id c5-20020ad45ae5000000b004b71bdbd79emr36977125qvh.25.1666891845266;
        Thu, 27 Oct 2022 10:30:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666891845; cv=none;
        d=google.com; s=arc-20160816;
        b=ibOvu2MohvBmt2zEAkCz7l6+Vv6+ZEsusj78k8Uiu98WMbUJH7L+ryx5FwbDenXchb
         6VqNVnwXFmPmN/oR02O5rSzPUyyQvtn354xa1WFofjkfBjnDI7lsL5KLVTK9Rq/aOWUV
         Z2ckEKIYHO4FaGQpycprZCiLhP5h9bL5sLcmF0q4wFAYMkK+N4FBjyW5tUneVJoZGse3
         svWIJPFJzWr5bkVfJnJoxru2prrzxq0FzRFcBf/xwceK8Kcun6TZ5MJA2TmfBRpPDzAv
         3Sws93LyT7ZsJsvNmQnfY/opkrirk5JzBlO+pnidNf6LrO28IobROtKbpMzyXVrtxA6B
         evhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=HJO2tKtQ7C9PRCed4J1puz67aPPWiZbJVdU6xmlhOQ4=;
        b=x8lgbGg8djO/P6zfQPk+eDRsU1QAHQis9G+r9gCG0NOURaQNeKPJIMu+dgbkSPjXml
         lrfwfrdfltH7KJu8I9dvPCncdKHYZvy5nl18Lk2Nm7hB9PF4eJIxXIWgZM9gsFelQXac
         R0X2LWxfDny6eNF+cetJGUVnGRDXWO8E4VUVYeUoMe2gqWN4614cpGx6PcZG27sW6KA7
         6HVwiCHkWnPhdI/+PAdGs3/9Hpg+zkRGwdelKaG1Uyg8u6gD8rSOLoEuBkio7+e0ldk1
         MFLiEJJ6m5wFpOteEhstW6lsgvbfMUM2MejfmqKnWOmQGQSGEaJMlpbkpFh21VEnY5Ij
         +h3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZsBDTLLO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jx10-20020a0562142b0a00b004b9e0f522d5si1275999qvb.306.2022.10.27.10.30.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Oct 2022 10:30:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZsBDTLLO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oo6i2-0000Nt-Fx; Thu, 27 Oct 2022 13:30:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1oo6ht-00066j-I2; Thu, 27 Oct 2022 13:30:20 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1oo6he-0000Vz-0l; Thu, 27 Oct 2022 13:30:17 -0400
Received: by mail-ej1-x632.google.com with SMTP id n12so6614538eja.11;
 Thu, 27 Oct 2022 10:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HJO2tKtQ7C9PRCed4J1puz67aPPWiZbJVdU6xmlhOQ4=;
 b=ZsBDTLLOEnzDpHQOwtv4xVaZGSgC8G713gWw05yvoj688VDP4G5z+/Tf17DddlR54y
 0387i8TgWHZDCyvy2e+15HN0oPRtEBZjMIYcIBzGq22mtz2mlHX5ixJBvhV0jdZg7gFT
 Z7Nrsq18S97H9pmjqMKhV+p9sJQYZL+4K60ABB++OI21CF6BiuwiN9T11jLrmCakEJJO
 KFkfHXCdNMutMEBoZs2dS1VWsN0U4Zk27arBZaO3bNuHQI6vUk//iw6lrN+fe5OQj1ml
 OQSikuVOlaCmZwWJciVHU8u26pesemVvaeEWEQSZu3telq7EZ50HOzGgYYM0SiN9Q3JS
 /nmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HJO2tKtQ7C9PRCed4J1puz67aPPWiZbJVdU6xmlhOQ4=;
 b=54Sulr3MJY0RrecwxLvmWxxJID++NVo0eQnMTI1udTiancdsNU9oTxNmA7AjIsDZBm
 iKHCnqsSJfEnGXGn2O1HXL3NhzlXM3B5dhk7GAz1jdFQ4AQl//hOWMMkQkkVMQ79GqTd
 glTzlQSl+OIpTy9X6IMvBPc5Vb8CJrcv9/MPhmqoDGI2ugQCDQJdvQ1VPSvg62VNE/5j
 o5ssMcsN8Pyf48cItiYT0ALBbRzbQaKkw+raCDiwMi59xb4p1NMct+Fm7I9WFtnVE/JF
 a/i7c5afwUtRoaecFNl1ldyC7OILyWSdXnyQxkij/pOImazJUzM5Rrmwd23hyHiD1413
 /h8A==
X-Gm-Message-State: ACrzQf1m9E3bbBCLJznplQq104XKy1WdKm4M6cTWWFjadlYPCrP/E2xH
 D9f1atq5E90nSeY8Xewc4pNgdRSx5NGcjss6hUo=
X-Received: by 2002:a17:906:6a09:b0:78d:ed9c:d880 with SMTP id
 qw9-20020a1709066a0900b0078ded9cd880mr41646827ejc.424.1666891799237; Thu, 27
 Oct 2022 10:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220527181907.189259-1-richard.henderson@linaro.org>
 <20220527181907.189259-58-richard.henderson@linaro.org>
In-Reply-To: <20220527181907.189259-58-richard.henderson@linaro.org>
From: Idan Horowitz <idan.horowitz@gmail.com>
Date: Thu, 27 Oct 2022 20:29:47 +0300
Message-ID: <CA+4MfE+XFOXgskehNoXYkVXx81ffvNAXTwgxuQaQk1utQvfyow@mail.gmail.com>
Subject: Re: [PATCH 057/114] target/arm: Move sve zip high_ofs into simd_data
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=idan.horowitz@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 29+8cDkm/hDq

On Fri, 27 May 2022 at 22:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is in line with how we treat uzp, and will
> eliminate the special case code during translation.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Sorry, a bit late, but I believe this change broke the implementation
of the ZIP2 SVE instructions:

>  target/arm/sve_helper.c    |  6 ++++--
>  target/arm/translate-sve.c | 12 ++++++------
>  2 files changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index e0f9aa9983..3bdcd4ce9d 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -3382,6 +3382,7 @@ void HELPER(sve_punpk_p)(void *vd, void *vn, uint32_t pred_desc)
>  void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)       \
>  {                                                                    \
>      intptr_t oprsz = simd_oprsz(desc);                               \
> +    intptr_t odd_ofs = simd_data(desc);                              \
>      intptr_t i, oprsz_2 = oprsz / 2;                                 \
>      ARMVectorReg tmp_n, tmp_m;                                       \
>      /* We produce output faster than we consume input.               \
> @@ -3393,8 +3394,9 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)       \
>          vm = memcpy(&tmp_m, vm, oprsz_2);                            \
>      }                                                                \

Unlike the for loop below, we are not taking the odd_ofs into account
in the 2 memcpys above. As an optimization these memcpys only copy
half of the vector, so when the instruction is using the same vector
register for 2 of the operands, and odd_ofs is not 0, we end up
reading the upper bytes of tmp_n/tmp_m, which are uninitialized
garbage. (Which is ironically a good thing in this case, since
non-deterministic incorrect behaviour was easier to find than
deterministic wrong results)

>      for (i = 0; i < oprsz_2; i += sizeof(TYPE)) {                    \
> -        *(TYPE *)(vd + H(2 * i + 0)) = *(TYPE *)(vn + H(i));         \
> -        *(TYPE *)(vd + H(2 * i + sizeof(TYPE))) = *(TYPE *)(vm + H(i)); \
> +        *(TYPE *)(vd + H(2 * i + 0)) = *(TYPE *)(vn + odd_ofs + H(i)); \
> +        *(TYPE *)(vd + H(2 * i + sizeof(TYPE))) =                    \
> +            *(TYPE *)(vm + odd_ofs + H(i));                          \
>      }                                                                \
>      if (sizeof(TYPE) == 16 && unlikely(oprsz & 16)) {                \
>          memset(vd + oprsz - 16, 0, 16);                              \
> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index 1e6bcedb9d..c2ced3e2bb 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -2298,9 +2298,9 @@ static bool do_zip(DisasContext *s, arg_rrr_esz *a, bool high)
>          unsigned vsz = vec_full_reg_size(s);
>          unsigned high_ofs = high ? vsz / 2 : 0;
>          tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
> -                           vec_full_reg_offset(s, a->rn) + high_ofs,
> -                           vec_full_reg_offset(s, a->rm) + high_ofs,
> -                           vsz, vsz, 0, fns[a->esz]);
> +                           vec_full_reg_offset(s, a->rn),
> +                           vec_full_reg_offset(s, a->rm),
> +                           vsz, vsz, high_ofs, fns[a->esz]);
>      }
>      return true;
>  }
> @@ -2324,9 +2324,9 @@ static bool do_zip_q(DisasContext *s, arg_rrr_esz *a, bool high)
>          unsigned vsz = vec_full_reg_size(s);
>          unsigned high_ofs = high ? QEMU_ALIGN_DOWN(vsz, 32) / 2 : 0;
>          tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
> -                           vec_full_reg_offset(s, a->rn) + high_ofs,
> -                           vec_full_reg_offset(s, a->rm) + high_ofs,
> -                           vsz, vsz, 0, gen_helper_sve2_zip_q);
> +                           vec_full_reg_offset(s, a->rn),
> +                           vec_full_reg_offset(s, a->rm),
> +                           vsz, vsz, high_ofs, gen_helper_sve2_zip_q);
>      }
>      return true;
>  }
> --
> 2.34.1
>
>

Best Regards, Idan Horowitz

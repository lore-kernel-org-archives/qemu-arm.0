Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp42690ejk;
        Tue, 28 May 2024 08:53:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUK4NMNPlzAyypN0IZzMmgUn+KImi4bTmC/Rw6dYmOUTsWqzgYJKADWL9sXYCrj6fdHl1oidEX8q1CMAXYLkMfLjcsGKBqg
X-Google-Smtp-Source: AGHT+IGIK8MJujiYlDU23H6T5BKwf9oMgtO0XErWEETT9N3jMfHR0Wygq8E78XMM5uzw9paWTVJE
X-Received: by 2002:a05:6214:44a1:b0:6ad:7055:afea with SMTP id 6a1803df08f44-6ad7055b2fbmr146285046d6.28.1716911606203;
        Tue, 28 May 2024 08:53:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716911606; cv=none;
        d=google.com; s=arc-20160816;
        b=0jJaLztHuL1m9TB+wsYfFnKBhlOs1BgfIAPZLZ2gwF/uY5MCbJEhkUNj7tHPNLs+OW
         WaJjVunlVqbFbPJcm2JtHizAgjmG+I5HXyaWFjsVQY4kzMbppW2NT+A0l4ZKeS1f01Pz
         UTqKMUH4dbLzXtJNvLcnnhC39A9IU5yxiFkomflDk+q8tvZZoPZvWW7gON1CLMosPnC5
         Q+nVDhhul3mJ1tHhZjoHR2Uf21fRjfa6IP8hTjsWJe55XD1gm5hbDWKFhP2Zz6RYF/gL
         P+s6++dV4ujU3dRWH0curSgvGvmYeaSK3HrRHPrNuKdM99Iv0kwAbFjlcIqYx1R+qLXu
         AXBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5P3AcQqQ87lTlP+Votciw+vXl90vVn4cW94kR/MwpoU=;
        fh=ghy0mOPVkUAWE4snuIwsM8OsVAKVaYv2AS+EuzcRsFM=;
        b=W6W9FaLTJVZzI1HQBViWlXECXS4dFNS1rk5WqCDpQbVvhdujBDMTZSa/NkxEgFIdFv
         5+5C0abYjBF04EW3V0SfrpMyansQo1eCrEyAOz54R1ulspfWH2BDU/TYr77G1YoJGNPS
         EfFqsfxVjIEDm7ezCggl6sM4L1ORALlh4b9YDqnnVSG/WNNXfKuRxr4jXZL+Ujc4Xjkr
         UOZAE1jqNEqvM2pttZ/AvYZE4TvryAx5zImQ1OJ0YcP5UJ01WT+5xNf/bPEA3IbW5PlN
         k4KJ2mM/VA5DUx7mWEzZK/CFKn+mvBA/tbACIdsTo6Pt4y1RVXiaV+YDFwltdbYfhu2v
         bDOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zNyyVpeG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac162e2a4bsi106539036d6.602.2024.05.28.08.53.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 08:53:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zNyyVpeG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBz8b-0002cY-Ip; Tue, 28 May 2024 11:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBz8a-0002ar-CZ
 for qemu-arm@nongnu.org; Tue, 28 May 2024 11:53:20 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBz8X-0006bp-7K
 for qemu-arm@nongnu.org; Tue, 28 May 2024 11:53:18 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5785fc9c543so1246460a12.1
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 08:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716911595; x=1717516395; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5P3AcQqQ87lTlP+Votciw+vXl90vVn4cW94kR/MwpoU=;
 b=zNyyVpeGk5NusljUtdDr0aYStIYRPXy16T9bY1m/8zj6PTTAmyuPOdeuNDzz+kYolA
 1H840oia8/ixA02+MojC4PuPMOnh2mkZeASgJaA4wM6NFwsL2OXlYG+bi3tu72yiDulr
 6R97VwAjUzC/jXFhR4qV5FN1S3OI/mbXzOm/zJMJUof072JTVTU79ltGyp4aMKH1LF/L
 LzyyUqVfv4B3Y1JlgmmO84tyFG0tI0ZEg6gdwbuoG8EVOBw9JMG/fJdY865DO6Kytq31
 It2oN3IWkHVJapSBUsA/t3d3mttb/aKeI4/W8tnOW3qpe9+EeONvDRg3D7dQitwnsmft
 KvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716911595; x=1717516395;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5P3AcQqQ87lTlP+Votciw+vXl90vVn4cW94kR/MwpoU=;
 b=fHKFsSH8K2/Gg9HbM/PcRbmfXptC9Kd9A8RbTXL12mjyKH33q1lugirgprnl5aWlld
 TXvwxCgM9db2xch19JgTGHr+FINt7B+SUUI7PcaBphrrTkCYjdHLWQ+VxqdoiCHNuyF1
 EQJp4obO//e4mgTU/IvmhJ5YJqrOv6UfyRND98yggfunHOWZSUS83RS0QcyKFvCdwe3r
 zj/tlfTjmmpfMubh5KE/brnxE2+JwvdrEvF4kh7nhVwQdasCLnVDGES/9M/+dtKJMfri
 dn0FmpCuSGweF/SXkWePIRwzXXXlIt7+0nT7/o0EqtUHPSmA/1rED6BdM/Vym3bbO45e
 Dkww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIQpapYPxzCO27hk7egwvzHKWcJZPg0FFei30H8d7ETvq+QzGV5WVzXS28O8m6fdQlvpkRpeio/vToQ10SZ1PCJ7pB
X-Gm-Message-State: AOJu0Ywyp9k/c+Vl+/cDKfKsmqYc8zDmNCkbnux7/Sxb6UgEkqWu9zAU
 l/H9uW2vH7Y8bObs8+z83hk7lw43A+1ZzMTyPg7IJe+3dPZkqo21HeuXTCdl1BEkqFX0Ce8NwJT
 A7cWJNJ4qhe/97GQCjzoYR8CVa2D/8Qxw5ionUg==
X-Received: by 2002:a50:d509:0:b0:578:4313:df10 with SMTP id
 4fb4d7f45d1cf-578519a926fmr13871322a12.31.1716911595405; Tue, 28 May 2024
 08:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-47-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-47-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 16:53:03 +0100
Message-ID: <CAFEAcA81fGFByCYbqYvDRWXib99tYGfYcujfBapfrsMxenMJmQ@mail.gmail.com>
Subject: Re: [PATCH v2 46/67] target/arm: Convert SQSHL and UQSHL (register)
 to gvec
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: VseblSlQxtIu

On Sat, 25 May 2024 at 00:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h             |  8 ++++++++
>  target/arm/tcg/translate.h      |  4 ++++
>  target/arm/tcg/neon-dp.decode   | 10 ++-------
>  target/arm/tcg/gengvec.c        | 24 ++++++++++++++++++++++
>  target/arm/tcg/neon_helper.c    | 36 +++++++++++++++++++++++++++++++++
>  target/arm/tcg/translate-a64.c  | 17 +++++++---------
>  target/arm/tcg/translate-neon.c |  6 ++----
>  7 files changed, 83 insertions(+), 22 deletions(-)


> +#define NEON_GVEC_VOP2_ENV(name, vtype) \
> +void HELPER(name)(void *vd, void *vn, void *vm, void *venv, uint32_t desc) \
> +{                                                               \
> +    intptr_t i, opr_sz = simd_oprsz(desc);                      \
> +    vtype *d = vd, *n = vn, *m = vm;                            \
> +    CPUARMState *env = venv;                                    \
> +    for (i = 0; i < opr_sz / sizeof(vtype); i++) {              \
> +        NEON_FN(d[i], n[i], m[i]);                              \
> +    }                                                           \
> +    clear_tail(d, opr_sz, simd_maxsz(desc));                    \
> +}
> +

Same question about H macros as for patch 44.

-- PMM

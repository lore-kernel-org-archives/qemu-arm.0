Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp547820lfg;
        Thu, 13 May 2021 07:27:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRXvlpxPcjRyKh7NDRFcPJnDz0/qXLxDw8XIbM0o2v74ji03hCyqLBJmdAz5232upz6EGY
X-Received: by 2002:adf:ff81:: with SMTP id j1mr52720154wrr.336.1620916030890;
        Thu, 13 May 2021 07:27:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620916030; cv=none;
        d=google.com; s=arc-20160816;
        b=IaGj68gfTqbz/E9dHeo1G6fnRVYEg/KTNl6RrQWyKga8NRRRBY5M+JV+0Cz9YqXUss
         wWRniGv9bJl1FtLiuUxUwbYfTxaFdhkcjGIqZ875688cONEhsPgfI/FaErtjb54p/vqD
         NVMFOzs61Wjs62QVuUr0rUQb6GHyQHce+eSW/L3931RlS8hPa+AvkHJDXqNrJ3lSiUKZ
         ySJrQ4D6LO1As+Lox/d44QinXcyNnVVMmOXeqtc2WqiSs3QeMlSyXeDtdviv2Q9h/9Xb
         s5w0oTpvbzG3/ZG7mPtKSs1ba/cgfbPaQhucYCVIx08o8IV8ZEKwQBuXzgAfMW0aTiKw
         Xj8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dwQQZQvwrhWCCIGdkKEkqh09KTjzTvaGzrC/UD3yLMQ=;
        b=Ji3B7XnqOD+bxf5De1Fj5rrfwLhlsQJWHfAw/3V8W6R2YTleNAXymIEZ0nNzsDS5A5
         kj0wAlU3f0EJeNIZuaxrup+/1Sf/6QQ8Ve9R2ifv+zDLdeMW8zNFZX8uPtXU+SqfZmwO
         CQx1Ms6WfywwPG1X3TI1smWj8QX6hMi3e5nuBjmjcdNcIePrDYPE+MbwEfdPBnHSzkzK
         CfnMejdMUzHr4rjJ5iNfXEjh2k8Lt1kgRj2rxhV47QcdbtA8ACZJZG4NlYj0XC/QLq+2
         vU9ZsIJDyoSau2mSCb8adUbM8bcoYWxNkRSLnzYRuilyGaHjlIXE9ahpLXjsyPlx+NTN
         2acQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mq6nq1wT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o6si1230265wmp.202.2021.05.13.07.27.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 07:27:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mq6nq1wT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhCIv-0005qO-PQ
	for alex.bennee@linaro.org; Thu, 13 May 2021 10:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhCH5-0004wm-I0
 for qemu-devel@nongnu.org; Thu, 13 May 2021 10:25:15 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:37532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhCH3-0007gd-IP
 for qemu-devel@nongnu.org; Thu, 13 May 2021 10:25:15 -0400
Received: by mail-ed1-x536.google.com with SMTP id f1so8967166edt.4
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 07:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dwQQZQvwrhWCCIGdkKEkqh09KTjzTvaGzrC/UD3yLMQ=;
 b=mq6nq1wT84y35qQTEfslh2s+LGFHz6Zx/ukj0GXrR7GPO1n0VeVMzJVCrDWwjZNzGH
 BlPKJ4814aA3HDkeK0ynnbQPAOCJyRhDRj2oygILfm6IYnYasV8EEDxtldoAyRN22ksy
 OTvKEDZVLRXn3fwbuGovpTdk9f5h0vhw/4hDhOYZrAUcrEGPNi41da6k+nCZpl40m/od
 UvvAlpSUAExh8YCimRbi6DkRyzw5k1SkumscMRmKVujKLN9IkBteV4b+yeWJjx2UINyo
 KG8r8C2hmBhBJyv7NuttM6NJVouag3wi4ec/U7nkvghQ+BtcU2TIyfgY3OYia+4jzQRs
 id9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dwQQZQvwrhWCCIGdkKEkqh09KTjzTvaGzrC/UD3yLMQ=;
 b=sZeDsMyxM87SAuUtOzNQAX8yBMzsjMQeY9jqo6RB4syViD/sWtHIWZ9uw3FT33ioi5
 daefhadOXDTi1tJIrKpat7AsCRNwSnltVhGPGIkMwinW8ASfWKNhebQkZcOfSOdr0SRI
 2XxX6EDOwwJcG8eTegv7XnAATHmFXOBkpmPpK1YIuhoxOujimKs8g/qAFcnYzp6y8mIn
 QcIh9kAjDOza6MSgI1lsnNfxaBj7vGbLkKWtV8i9UZ1IT9BNNMYGz6gZ3AzuYJdbSb2N
 iJByPiPj6EDm9YgJy2JPt9Lf2z+DZsUXnRIAc+3D1Ik//IemKeblL6k0pvqAWMloi++9
 2Ytw==
X-Gm-Message-State: AOAM532PCMpIvHMHm4YO/S2EbJNUQ9iEzr419IjnuqHNVT1G+yVLfFTT
 +Tq5SXRFBUScNC/yZHOIbBsDqzkstEvpjA4/gunmBA==
X-Received: by 2002:a05:6402:12d3:: with SMTP id
 k19mr50150657edx.52.1620915911530; 
 Thu, 13 May 2021 07:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-70-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-70-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 15:25:00 +0100
Message-ID: <CAFEAcA87ZLW1oxFuhY_-uHjvO37Wkd3gUCJqPTttOm8VYqaAHQ@mail.gmail.com>
Subject: Re: [PATCH v6 69/82] target/arm: Share table of sve load functions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lJYIv/koTszY

On Fri, 30 Apr 2021 at 22:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The table used by do_ldrq is a subset of the table used by do_ld_zpa;
> we can share them by passing dtype instead of msz to do_ldrq.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

> @@ -5512,14 +5514,8 @@ static bool trans_LDNF1_zpri(DisasContext *s, arg_rpri_load *a)
>      return true;
>  }
>
> -static void do_ldrq(DisasContext *s, int zt, int pg, TCGv_i64 addr, int msz)
> +static void do_ldrq(DisasContext *s, int zt, int pg, TCGv_i64 addr, int dtype)
>  {
> -    static gen_helper_gvec_mem * const fns[2][4] = {
> -        { gen_helper_sve_ld1bb_r,    gen_helper_sve_ld1hh_le_r,
> -          gen_helper_sve_ld1ss_le_r, gen_helper_sve_ld1dd_le_r },
> -        { gen_helper_sve_ld1bb_r,    gen_helper_sve_ld1hh_be_r,
> -          gen_helper_sve_ld1ss_be_r, gen_helper_sve_ld1dd_be_r },
> -    };
>      unsigned vsz = vec_full_reg_size(s);
>      TCGv_ptr t_pg;
>      TCGv_i32 t_desc;
> @@ -5551,7 +5547,9 @@ static void do_ldrq(DisasContext *s, int zt, int pg, TCGv_i64 addr, int msz)
>      t_pg = tcg_temp_new_ptr();
>      tcg_gen_addi_ptr(t_pg, cpu_env, poff);
>
> -    fns[s->be_data == MO_BE][msz](cpu_env, t_pg, addr, t_desc);
> +    gen_helper_gvec_mem *fn
> +        = ldr_fns[s->mte_active[0]][s->be_data == MO_BE][dtype][0];
> +    fn(cpu_env, t_pg, addr, t_desc);

Previously we didn't take account of MTE state, and now we do.
Is this an intentional behaviour change?

If it's fixing a bug, the commit message should say so.

thanks
-- PMM

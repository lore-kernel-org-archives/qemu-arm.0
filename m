Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp675365lfq;
        Fri, 8 Jan 2021 09:23:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/pAiIUSEauH7Ja2XuxoY7rKQjui/rUFPn/f8GJLl/R1sZ8bz0mPFVYC3OZvdlXTiSZGSY
X-Received: by 2002:a25:db81:: with SMTP id g123mr7178159ybf.277.1610126608934;
        Fri, 08 Jan 2021 09:23:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610126608; cv=none;
        d=google.com; s=arc-20160816;
        b=v6lB/ElDm0+QLfRU+Lf9SPwOzXBczZdbFk1J/rfx68Fw/VjTM/NuZO1P6GYDf/0tho
         B8RtQ6xdQD6Gjk5wwiUHpcZbC79/T8uze2CZQClf/gtDnwtg6dWzzLV1+aYg8GLaFInf
         ojrqnr5EUiw1427PySv/eW/Qt6X/ESwMCGp73KcYi/Lq0A+aun4yTih5zWwBbayV7oL9
         pgXlZVNyM/Gf8ZrhNOR7rrpI/zEcFpAOg68TTp0diq3wX9ggZKF/2tZP/84WjWXt+AXS
         kBpVN7cyp/tVj+ZsFSnHqoaV7AIFREtrVYc6bnzhdjx261ezK8zEyDp1/wjxrRDOJ9Z0
         qmOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HF4ple/5xnClgAKtApuD8Y+fJ7QJ8R+A0KPk+uOsra4=;
        b=ODzX29RnMyGl+8MH3BlM8wkUdKdfl15T04zh/p99TX+CCMpJ7uswW/4iZfh8sMQwvj
         6XaCE+oVdswSfZkdleFJrPGWxUp0EZA+pCugBrccKSpvOMcoZgKBFQsoKI1bEzE2fTf0
         brr0Fe1i6nN5olLoOtr5AMIwoWPUq9X1GaFcwWrF9uFw/OSkz8rcY3aGvsEMgDKBqwci
         MefOwimzFNxgZqamswy40dcT0vWigSrQeEZ9K+3WrUXJmU9/SG+g2pzsvDLa6lB+NNgX
         opHwWmGI0M/Tt8cJc7U5SFx2tJ+0z0aQ/8Zp+zPwTPStIceKgbA0AvS7x9uUYY014OoV
         Fyog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pqQ2EwNL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i193si9806586yba.471.2021.01.08.09.23.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 09:23:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pqQ2EwNL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxvU0-0006Hs-Bm
	for alex.bennee@linaro.org; Fri, 08 Jan 2021 12:23:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxvTG-0005Jy-QH
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 12:22:43 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:32867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxvTB-0000sD-4u
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 12:22:42 -0500
Received: by mail-ed1-x531.google.com with SMTP id j16so12005758edr.0
 for <qemu-arm@nongnu.org>; Fri, 08 Jan 2021 09:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HF4ple/5xnClgAKtApuD8Y+fJ7QJ8R+A0KPk+uOsra4=;
 b=pqQ2EwNLrRhDpu2CXcIejt1h6rOknYNW5m40LYBglp+UDHQTb08r1gV0CLIMFSHfv2
 8IwDDSCElbrp6NySHP82p6uTJjtSbl24WDNA7z3yitayTfpJa69bkdVlfqZhafdo5Lch
 z0DSqOmrtG1J3KIqU/p+w5KBan5PI2QK+pGHbWMA1fPnG4nAjufA7qDZa+2GbWULLALE
 ID7BJYKtEQ6YFBPbzy+Y+tIAumzLNlIwWFuj3FldF6ZlluM/LuSD8UqxxNChPqa3dDYA
 ZHjawLaCVKv6I99Ig/m+FPVMSKhxbZuLz3vp3SSqkOlUbHFKNN63T3xO0Oib4ZZa+Aey
 0oUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HF4ple/5xnClgAKtApuD8Y+fJ7QJ8R+A0KPk+uOsra4=;
 b=GoDGc3PIs06nCDYvqA3eiHu0xdnPlfSaY7yepK/WHE9dCyz54t8qK0PiZUAu/Hc4sh
 83o8yepXVxqdian2m3SDTPuo8XMkSgS33ytBn0VJo949fMADm8S+JsL/SDszxvWLfUdy
 Pd5+MG11w/1iZxq2ZD59BfjphsFuyghh28f2x3WWpgIz0XBW9LZgMbj4OkgtyjzV45b+
 0Wb+gyrtHR6/O/xsRhW9YQC/N9Oy68Rwe6J31M4oegqLotD1Su5Aelk2rY8e0XjKNyP/
 ZipVVfMSgyciFHc6NCToYNAF++dsNTx/u77FcvnYX9fprEMvDS98xzZ5NnofoTbTIB7R
 9MDw==
X-Gm-Message-State: AOAM530VbIaZG2t3XfhocvSrZy7PgXpx30FjQNpXIIr+7kwWAaPfQw+3
 j/vjRa7DRindzLlvPks5nptPOBehybSKxLeIt5/aNA==
X-Received: by 2002:aa7:c388:: with SMTP id k8mr5962574edq.36.1610126555306;
 Fri, 08 Jan 2021 09:22:35 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-25-richard.henderson@linaro.org>
 <CAFEAcA97CfTvAJkSHEYtEKrg9jZjCLTbra-KFxfYZVuCH7MMkA@mail.gmail.com>
 <6ff3c7b0-9254-2e36-89e0-e9eb59fd6e7f@linaro.org>
In-Reply-To: <6ff3c7b0-9254-2e36-89e0-e9eb59fd6e7f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 17:22:24 +0000
Message-ID: <CAFEAcA-50SFKWjppfzUOXiTyC_i458OnPuwv3bZQs4L1VE3O5w@mail.gmail.com>
Subject: Re: [PATCH v2 24/24] target/arm: Enforce alignment for sve
 unpredicated LDR/STR
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T6tcZFbrbTD/

On Thu, 7 Jan 2021 at 22:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/7/21 7:39 AM, Peter Maydell wrote:
> >> +        if (align > MO_ALIGN_8) {
> >> +            t0 = tcg_temp_new_i64();
> >> +            tcg_gen_qemu_ld_i64(t0, clean_addr, midx, MO_LEQ | align);
> >> +            tcg_gen_addi_i64(clean_addr, clean_addr, 8);
> >> +            tcg_gen_addi_ptr(i, i, 8);
> >> +            tcg_gen_st_i64(t0, cpu_env, vofs);
> >> +            tcg_temp_free_i64(t0);
> >> +            align = 0;
> >> +        }
> >> +
> >
> > Why do we need to do this (and the similar thing in do_str()) ?
> > Most of the rest of the patch is fairly clear in that it is just
> > passing the alignment requirement through to the load/store fns,
> > but this is a bit more opaque to me...
>
> What follows this context is a single memory access within a tcg loop.
>
> When align is <= the size of the access, every access can use the same
> alignment mop.  But for MO_ALIGN_16, since we're emitting 8-byte accesses, the
> second access will not be 16-byte aligned.  So I peel off one loop iteration at
> the beginning to perform the alignment check.

OK. Could you add comments to that effect, please?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

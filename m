Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp373303lfm;
        Tue, 18 May 2021 05:38:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdFvzd6izo/nRWQUchsnUML1NFX/FFG6L63srjFKO6VMrSdKk4C29Vtz7EvOKQYG1le6Gj
X-Received: by 2002:a05:6e02:2188:: with SMTP id j8mr4140881ila.194.1621341518432;
        Tue, 18 May 2021 05:38:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621341518; cv=none;
        d=google.com; s=arc-20160816;
        b=0EAl1epE9829qZwOj/wXkcLbsj3nMqk6CISiVov4nFEOS7iLkSrPTmnrqSt7joJp8f
         NZ7jnv+eO5/DsPMdznQZl9wjGcLuoYFM9PGoiHiNVwdO1tZWMi5gGDxqF/zQcYJBVvnS
         LSykwH+bhmDmLU2UmU/bAIeXD8TmZdQ0AmF/8BoRnIKox7PlHrRD4WIV+m68aO7NEIw9
         tqlWXaGawPji9ghKocTBR8wmIb9E/JBvnlMI5J0hW+Ri1/4i9iwnXufzLLVRFVqtJdoR
         pUPL+UqF59PxIFnzpWKCidqozsXvJib9K5RwE0GuB+ncyGNG2tJAR+2+CgJewUU4CbOQ
         d+nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3QOdQlWILkWnh99ps41PWVh/oeVlYiHxOpHjkNGMl3E=;
        b=XI89wJEz7wnUDSPTHDOxhf3CPLKYb5yYkcIlcQM6uvZ/Toj4K31n2zmW+FipjptvV3
         5qtt+Xf+5CrlwbOGf5OV4p0vxElpXKkFKHH4BqrI88x6ZO8RQM1nVfTedM17d5mWfePI
         ilSR+J8WQEnZKBYvbm3RIVOBxsSMics9UH+b0UnLbouEM00S7eZAmHudtwEWpCgGiwqV
         d0h5BAyMUIZl2PJsBRnS/IaJ6uKkDBc85c+m/UKzuoiUdHzQjNaKPfOmFmmB4ImbPw/s
         m+zOqwSrlriudOqrYxFYc3UeQhKFlzqgdDvYBBauiYUfIY0Wh7eYeS0f6JT5tw0bplQr
         /75A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zRXer3Tj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b1si20994587ioh.94.2021.05.18.05.38.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 05:38:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zRXer3Tj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liyzd-0001Tj-HN
	for alex.bennee@linaro.org; Tue, 18 May 2021 08:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liyzM-0001RI-Ng
 for qemu-arm@nongnu.org; Tue, 18 May 2021 08:38:20 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:37475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liyzC-00033o-DD
 for qemu-arm@nongnu.org; Tue, 18 May 2021 08:38:20 -0400
Received: by mail-ed1-x52b.google.com with SMTP id f1so10935366edt.4
 for <qemu-arm@nongnu.org>; Tue, 18 May 2021 05:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3QOdQlWILkWnh99ps41PWVh/oeVlYiHxOpHjkNGMl3E=;
 b=zRXer3Tjdk6PWQlmzzXkkTWlTu0bQ6n5McsKKxDwqDXiexXxivWYwn4C8wezrEwwUS
 2Z7RsbyN2boom9q/NbMStI3eLZ73NA44t8VRor1S1DwOy0Y/z1SHcZCeY482A4PS7sPq
 peYrklJHARHCn6nyOYCI4NG8q4W6ovFljypInfzS36bKpZzrR8dPYUEHCkY7fjwoldBv
 K8SoPToAIL+mI//2wMG4gtGrcfe7a8xQZbOV+Na6tsKCe785Ct6jAgwep5g0QTDZHtcs
 mct1jqgW3ElaGrpgRNsfFc6Hv5/pcGaqGUF6BLJ6y+Lf7Lp23lESPlVZSINVYdddVcwv
 TOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3QOdQlWILkWnh99ps41PWVh/oeVlYiHxOpHjkNGMl3E=;
 b=phHx6lh7wmrWM4hYNs+Vgeo6lLdtbo5yACyGhk3+tHvXTq6OovNU124DWu2LZ58Izd
 RdIKKd1xox2sUE6lmhdvb3IjL6c1iu7mKC4S7EE6Y3txM2CBGO9Lmpk3Alcjpm07HlWb
 f3y07pVy8aROkWJo82aNaT4VOfOJaM9MQ4MoZC8hKLDZYTQnZ2e8MXY0NTK53S8OrvZj
 eOBEjMJQgSYkoegUyWOjBZtet0vRwP/OjlAx9lilOMMg3vvX9S2RnYeAObPMR/fC+NRZ
 HAnOIBxbofSvc/Lqy1pMNdPwijC6Er2BYqZ6LvG1TDqDoAWDXgnycRwL2KNHYzxFWI4/
 CRmQ==
X-Gm-Message-State: AOAM533rg0FSU2Vk5kMz3NbukQ2pUkUvfPj9PjKNOKdzQGrLSRItMPun
 nUJdp6PTCuWSU1QYSlU5+nzIFTvN87am3wA9Op1JGA==
X-Received: by 2002:a05:6402:5243:: with SMTP id
 t3mr6778797edd.146.1621341488247; 
 Tue, 18 May 2021 05:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-9-richard.henderson@linaro.org>
In-Reply-To: <20210416235928.1631788-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 13:37:51 +0100
Message-ID: <CAFEAcA_T9f47uZSEt9BRsThxLsvauTPMiDSNM8B5=Dk5xRQ+wg@mail.gmail.com>
Subject: Re: [PATCH v1 08/11] target/arm: Implement bfloat16 matrix multiply
 accumulate
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 6xE2AAqtd/ci

On Sat, 17 Apr 2021 at 01:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is BFMMLA for both AArch64 AdvSIMD and SVE,
> and VMMLA.BF16 for AArch32 NEON.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +void HELPER(gvec_bfmmla)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
> +{
> +    intptr_t s, opr_sz = simd_oprsz(desc);
> +    float32 *d = vd, *a = va;
> +    uint32_t *n = vn, *m = vm;
> +
> +    for (s = 0; s < opr_sz / 4; s += 4) {
> +        float32 sum00, sum01, sum10, sum11;
> +
> +        /*
> +         * Process the entire segment at once, writing back the
> +         * results only after we've consumed all of the inputs.
> +         *
> +         * Key to indicies by column:

"indices"

> +         *               i   j           i   k             j   k
> +         */
> +        sum00 = a[s + H4(0 + 0)];
> +        sum00 = bfdotadd(sum00, n[s + H4(0 + 0)], m[s + H4(0 + 0)]);
> +        sum00 = bfdotadd(sum00, n[s + H4(0 + 1)], m[s + H4(0 + 1)]);

I can't make these indices match up with the arm arm pseudocode ones,
which index by "4*i + 2*k + 0" and "4*i + 2*k + 1", not "2*i + k";
are we hiding a division by 2 somewhere?

> +
> +        sum01 = a[s + H4(0 + 1)];
> +        sum01 = bfdotadd(sum01, n[s + H4(0 + 0)], m[s + H4(2 + 0)]);
> +        sum01 = bfdotadd(sum01, n[s + H4(0 + 1)], m[s + H4(2 + 1)]);
> +
> +        sum10 = a[s + H4(2 + 0)];
> +        sum10 = bfdotadd(sum10, n[s + H4(2 + 0)], m[s + H4(0 + 0)]);
> +        sum10 = bfdotadd(sum10, n[s + H4(2 + 1)], m[s + H4(0 + 1)]);
> +
> +        sum11 = a[s + H4(2 + 1)];
> +        sum11 = bfdotadd(sum11, n[s + H4(2 + 0)], m[s + H4(2 + 0)]);
> +        sum11 = bfdotadd(sum11, n[s + H4(2 + 1)], m[s + H4(2 + 1)]);
> +
> +        d[s + H4(0 + 0)] = sum00;
> +        d[s + H4(0 + 1)] = sum01;
> +        d[s + H4(2 + 0)] = sum10;
> +        d[s + H4(2 + 1)] = sum11;
> +    }
> +    clear_tail(d, opr_sz, simd_maxsz(desc));

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

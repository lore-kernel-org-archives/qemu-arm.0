Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp2297605ejn;
        Mon, 17 Oct 2022 04:01:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM59QBK7c5pT208nl5OeeY2hbaUvqDExA4W9EdhL6q6tU/HaPXnrqe8PIFVSMmN3sx4mXG0e
X-Received: by 2002:a05:620a:808b:b0:6ee:942b:dfc1 with SMTP id ef11-20020a05620a808b00b006ee942bdfc1mr7077302qkb.13.1666004507943;
        Mon, 17 Oct 2022 04:01:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666004507; cv=none;
        d=google.com; s=arc-20160816;
        b=NbK/y3+eLqWP/v7vUhM6nIA+oYPmuGY14Fl9MZQV58f6C8Aqaue3GokO/p4UKIXRzn
         MvMR2AuvInL/j7wA7q4Fbu88QDTyfgYx7X87IScltbCCWJuIjMO9RrD3WYNVoiPXtlsB
         iwcHhpYFWHF9uBnYPiEsaDs1+wJV7tdieBS19CdYjdJhLeCMPjY8ujUijFq1FUWWS7G2
         aN7pigv4fr4pBWhCuac4gyQOXOW1z8cH541VnOmGLKOqlmA67JbOYIDn0F/H3GNW2If8
         fjexZq49DYPdePDN1/KY8L1TPnAgFdGzSmbmnICPVgRsyr9Qp6nwWsJrnO9/HgFJknj5
         IS/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ftTPedma5Zescrvcv9LmQxOPuaIh7IaZ7R0zDO2ts9Y=;
        b=Y5kfVv+2GLjF2uBiB8+6GcrEbxzG5eoaAlPgb5+UUBHp+bS+0eGVajRbS8FHhRpFpl
         E7iP4s0Rb/crtnKA0TnD8VivHIlB817HjifxXtEr2J69g/FixnRMHDrRlMnILEgoKKyA
         vHqJ3wrmdWQ8Y+1Lpq7P7wLebFCBLPbQ4vRui0KM3tItI2IdK0FXx5c6VCDxeP/II3cp
         UvKG8Rokns6Fsk7GzHiL0Y7gKHd3+wmfWmK8dmcd6sRdBuzCN9kxivgDn9Jtg+zXiR5T
         Q4q7dRi8+Jt9Baj20Unt+hfGV/ZMFg1DePMQpTdNF0V8vCm2UzPxrtFS0zbJZBFluWdw
         mPhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZIuxmmhg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j7-20020ac85507000000b0035a7097f8f1si5177919qtq.301.2022.10.17.04.01.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Oct 2022 04:01:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZIuxmmhg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1okNsR-000099-Bf
	for alex.bennee@linaro.org; Mon, 17 Oct 2022 07:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okNs2-00008L-I4
 for qemu-arm@nongnu.org; Mon, 17 Oct 2022 07:01:22 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:42697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okNs0-0000ev-Pi
 for qemu-arm@nongnu.org; Mon, 17 Oct 2022 07:01:22 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 l1-20020a17090a72c100b0020a6949a66aso10633264pjk.1
 for <qemu-arm@nongnu.org>; Mon, 17 Oct 2022 04:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ftTPedma5Zescrvcv9LmQxOPuaIh7IaZ7R0zDO2ts9Y=;
 b=ZIuxmmhgsdakdRb1UqX/jzHrwNTL0SAO1YMt0AGMT/DPeWELK4JdactIPkg3L9wzY8
 EXPb6tZfLsfA0ezHlcNPmQlaFDzyNUaTbWxywdnQqaq3xSKlAQ0x6i8+04k5zZfCSkcm
 AmhSQHgrL1aBYxsWMXXO4xyl5V2uUP06rFwaP37+e2o9dyuV9imeKIX3XWe6aNbMV+VR
 o9C0JlXq4a72u2JIfTQtO2LWkooVv79h7EBjvfyC2qlMY9UjOXiYI55XqDRomkOrqMPe
 I0bKzTmCphj3UDxw1//zpepFVl5o/I3CktpZjK/0dK+rB1CrwcWKbPh5it/0/BtIN+ui
 Agbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ftTPedma5Zescrvcv9LmQxOPuaIh7IaZ7R0zDO2ts9Y=;
 b=jLPOyXHYWZKDbywuTehQqHRDv+BHOVb6++8vIF/Q3VQAD/I4gwjavVS7ZulzJtGjPL
 cvlrKlEfJpdzO1tiCQdO1fOd3maV3LdMp62DyfYfVbcEGkzLgMGnuilnW4sn+SYn2A3Z
 8Ja9JD3vw9oGT+KrXzIzz0IaMm7hNJ7yM8Xt6o2rrlj+BX2joxZnHF3abYD33ukLjerv
 Nmx0dFqztwf54M/MwA2EeweqI07jFqkJk5/U0WlN1qSUScnIfRl9LgxIIfI2WuBRjaMy
 QqNvSzhabbS/DkdFRng2dV5bNf8uISJPIbpV0ao9+ekiXNhEjR0wOvRDcs8EhPs6MLc2
 Swxg==
X-Gm-Message-State: ACrzQf0BhfbjDVk2YaQMroPKxkg91N+uW+pJhxJhWgM5LJ1Ys6AlW8YF
 k0l6sbiOFiwJDvrYdTqD+/Hxrf2SWbbdx3KoBoBULA==
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr11456399plb.60.1666004479243; Mon, 17
 Oct 2022 04:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
 <20221011031911.2408754-24-richard.henderson@linaro.org>
In-Reply-To: <20221011031911.2408754-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Oct 2022 12:01:07 +0100
Message-ID: <CAFEAcA8y=6okZaLFGu3BqXOZwV8ch9YFOf72y7fhMywXpobFQA@mail.gmail.com>
Subject: Re: [PATCH v4 23/24] target/arm: Implement FEAT_HAFDBS,
 dirty bit portion
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: SZagRdeFN+bK

On Tue, 11 Oct 2022 at 04:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Perform the atomic update for hardware management of the dirty bit.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu64.c |  2 +-
>  target/arm/ptw.c   | 20 ++++++++++++++++++++
>  2 files changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index fe1369fe96..0732796559 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -1165,7 +1165,7 @@ static void aarch64_max_initfn(Object *obj)
>      cpu->isar.id_aa64mmfr0 = t;
>
>      t = cpu->isar.id_aa64mmfr1;
> -    t = FIELD_DP64(t, ID_AA64MMFR1, HAFDBS, 1);   /* FEAT_HAFDBS, AF only */
> +    t = FIELD_DP64(t, ID_AA64MMFR1, HAFDBS, 2);   /* FEAT_HAFDBS */
>      t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* FEAT_VMID16 */
>      t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);       /* FEAT_VHE */
>      t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1);     /* FEAT_HPDS */
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 82b6ab029e..0dbbb7d4d4 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1484,10 +1484,30 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>      ap = extract32(attrs, 6, 2);
>
>      if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
> +        if (param.hd
> +            && extract64(attrs, 51, 1)  /* DBM */
> +            && access_type == MMU_DATA_STORE) {
> +            /*
> +             * Pre-emptively set S2AP[1], so that we compute EXEC properly.
> +             * C.f. AArch64.S2ApplyOutputPerms, which does the same thing.
> +             */
> +            ap |= 2;
> +            new_descriptor |= 1ull << 7;
> +        }
>          ns = mmu_idx == ARMMMUIdx_Stage2;
>          xn = extract64(attrs, 54, 2);
>          result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
>      } else {
> +        if (param.hd
> +            && extract64(attrs, 51, 1)  /* DBM */
> +            && access_type == MMU_DATA_STORE) {
> +            /*
> +             * Pre-emptively clear AP[2], so that we compute EXEC properly.
> +             * C.f. AArch64.S1ApplyOutputPerms, which does the same thing.
> +             */
> +            ap &= ~2;
> +            new_descriptor &= ~(1ull << 7);
> +        }

At this point in the code we've already merged the table
attributes into attrs. If the APTable[] bits forbid write permission
then HAFDBS isn't allowed to grant write permission. I think we
need to do this a bit further up, before we have merged the table
attributes in (so that the table attributes merge can force our
attribute bit back to 1 if the table attrs forbid writes).

(In the pseudocode the Permissions struct keeps track of the ap_table
and ap permissions settings separately and doesn't combine them until
AArch64.S1HasPermissionsFault().)

thanks
-- PMM

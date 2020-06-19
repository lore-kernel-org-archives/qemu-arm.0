Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp648785lfm;
        Fri, 19 Jun 2020 07:38:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhyePIQs0q458mkWReJftwzPBo0twUspKYJSI2pEihC0wlWtvUIdXVHMqwZ2xpysOHLGp7
X-Received: by 2002:a25:ce06:: with SMTP id x6mr6481108ybe.319.1592577488647;
        Fri, 19 Jun 2020 07:38:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592577488; cv=none;
        d=google.com; s=arc-20160816;
        b=W3QdgIU+ycAO7eGrqadANnMAzsDR4EildclZJl6rQmmx47ssPCVUyi8LvQiZhkmz3X
         ILQXO/2WiBN3NBUxWRbRlRcp2EuKQsyxoVfZ3mE6sfEj4G1dvGGjqNeIJCGBzSO7tPUa
         O+1dalB4C4XFxMzuEkzog41a3wyZTAFV37mRkqTqFv2yoqdwoFItFAzwvH0Vw2TgE0Oj
         32sbrO2dwWsWlEMcFlBN70osOBpd0EAwfJPF3S7TdQ1bUsIGRGVvddfEZOcU2NGd+CjW
         3KJqpnHxBRFTxcVYeekKd0DFQmRerx9SWBwVpuGKus+2Uy0930hXGLz5beSGkoeCr/jz
         PrDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nBoKVae58ToSfWedQL5+pEeleproogYVa99U5gP9OUY=;
        b=R9z8ZeAb5pbK7vhBriwIFpWXMPVlWR7nXD8Vivx1lcBJYP0C68G+16yrVHvJkzylPu
         BuztYEsHSXjNFDF5i8WjSJFyYtN/OE6T4BRsLPZiYOU0lZDGXtE1nCRjYAs/7LwZGX+F
         /MaPdBtR07UDxwv6UDNCyyPgmK/SPK8j0dGWUr0FO/4r5EwlP+eNGKPklu5iCAtmEdyR
         caHykyZU3S7je+BmZXG5ua5az+VEjOgq7n1iFWnpQ2B6fd6DMScgbOR/b1jLytvnBZso
         zTkXo2IX49Fn/oL/qDNkqooP65MN4CNwJopt8F8Otkzz+GEIhTMbof1a8KX8HHeorDf+
         RPZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QiDxat2K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z6si5131895ybf.10.2020.06.19.07.38.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 07:38:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QiDxat2K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmI9g-0007NR-32
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 10:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmI9Z-0007Ly-0e
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 10:38:01 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:39426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmI9X-00014J-68
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 10:38:00 -0400
Received: by mail-ot1-x341.google.com with SMTP id g5so7436003otg.6
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 07:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nBoKVae58ToSfWedQL5+pEeleproogYVa99U5gP9OUY=;
 b=QiDxat2K6HXhC5EXiF/jNEteSQboMepNPyQfVOoOKipdTpVYCvm67n9R2uIKGlq1F7
 LEMUM5V0/6A+1IDTMw1dJU3yVotGskv0xHKDJSNF12vJ08KptlSwp5bVlpc637qp5b2T
 v76XrUboXpMwR242FzXgiBVq3eJzqAVteQuTuEXHR4ZP+s4xz6igbqgL9m8wcS2SGDkw
 ssoOA3kApvwEQ/THcdBxs/sbtQECK9YdzVY5Oqt1/Qy9iB498JZaV8rqLHPUmkwtNHvc
 2zB9ID8nBI19ifys7cwHkfN4QdvjrBdo3662l5Tiu7RprD/TgjeHSwsAkH1pDZrhzrTO
 HeLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nBoKVae58ToSfWedQL5+pEeleproogYVa99U5gP9OUY=;
 b=k4Hb5EYEDf3sfUc8NB5JKFIEHNXk/WeU1l7BnVwGGHD8xoqp+YXLv2R/pY649iCWyk
 LP04+bCu0AbQMDE5UxPb2CIh5hFlLvFhKcMLVOyjFJx4ZERg/B89vLP1lwl7oOYOPb+g
 UHywj5nBkoYFESRFs3bk5UuzH5wPkCO5SVJeA8hntzAipdzkOWINsFtR8LoYR1taY5X4
 WjYkHGMI2YFjaQ5kcVM7KTWsPHsuCsdiKkE8RiDIPpDqc6ZM80GelI7wU+1ptikTlrsm
 idBu2dRN7U5vjJRc9Mv4vhnuGE7AhNGCJhsKabvafqETB2AtnahaH5io4hPPIobUV4lt
 HjhA==
X-Gm-Message-State: AOAM530e3QmssVboi6soCcGFeXj0CYRuyoM1ibo6iRJlv8kx1btn6xj+
 u6swYqWRwyZtPJqDB5v469nGUi5dgYtIAFjdGL0n+Q==
X-Received: by 2002:a05:6830:8d:: with SMTP id
 a13mr3222712oto.91.1592577478051; 
 Fri, 19 Jun 2020 07:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-42-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-42-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2020 15:37:47 +0100
Message-ID: <CAFEAcA_zz6Ed65qk4wVBriuREe24ppSUVce2JfFO4xXLeZSwPw@mail.gmail.com>
Subject: Re: [PATCH v7 41/42] target/arm: Create tagged ram when MTE is enabled
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sLqhQ73RTt4D

On Wed, 3 Jun 2020 at 02:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v5: Assign cs->num_ases to the final value first.
>     Downgrade to ID_AA64PFR1.MTE=1 if tag memory is not available.
> v6: Add secure tag memory for EL3.
> ---


>  static void arm_cpu_finalizefn(Object *obj)
> @@ -1735,17 +1754,43 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>      MachineState *ms = MACHINE(qdev_get_machine());
>      unsigned int smp_cpus = ms->smp.cpus;
>
> -    if (cpu->has_el3 || arm_feature(env, ARM_FEATURE_M_SECURITY)) {
> +    /*
> +     * We must set cs->num_ases to the final value before
> +     * the first call to cpu_address_space_init.
> +     */
> +    if (cpu->tag_memory != NULL) {
> +        cs->num_ases = 4;
> +    } else if (cpu->has_el3 || arm_feature(env, ARM_FEATURE_M_SECURITY)) {
>          cs->num_ases = 2;
> +    } else {
> +        cs->num_ases = 1;
> +    }

1: neither MTE nor TrustZone
2: TrustZone but not MTE
...but why is MTE always 4 even if no TrustZone? I would have
expected MTE-no-TZ to have 2 ASes...

> +    if (cpu->has_el3 || arm_feature(env, ARM_FEATURE_M_SECURITY)) {
>          if (!cpu->secure_memory) {
>              cpu->secure_memory = cs->memory;
>          }
>          cpu_address_space_init(cs, ARMASIdx_S, "cpu-secure-memory",
>                                 cpu->secure_memory);
> -    } else {
> -        cs->num_ases = 1;
>      }
> +
> +    if (cpu->tag_memory != NULL) {
> +        cpu_address_space_init(cs, ARMASIdx_TagNS, "cpu-tag-memory",
> +                               cpu->tag_memory);
> +        if (cpu->has_el3) {
> +            cpu_address_space_init(cs, ARMASIdx_TagS, "cpu-tag-memory",
> +                                   cpu->secure_tag_memory);
> +        }
> +    } else if (cpu_isar_feature(aa64_mte, cpu)) {
> +        /*
> +         * Since there is no tag memory, we can't meaningfully support MTE
> +         * to its fullest.  To avoid problems later, when we would come to
> +         * use the tag memory, downgrade support to insns only.
> +         */
> +        cpu->isar.id_aa64pfr1 =
> +            FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 1);
> +    }
> +
>      cpu_address_space_init(cs, ARMASIdx_NS, "cpu-memory", cs->memory);

...and indeed the code here only inits the ARMASIdx_NS and
ARMASIdx_TagNS spaces in that case. I guess we need to leave
ARMASIdx_S in the array but unused since we're effectively
indexing them by constant integer, but even so shouldn't
num_ases be 3 (0 and 2 used, 1 present but empty, 3 not needed) ?

thanks
-- PMM

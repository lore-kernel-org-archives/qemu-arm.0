Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1717837lfq;
        Mon, 11 Apr 2022 08:49:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXecnVnGcuO3NgEOXjC30wwd1muylYF3vN5dJzBz0nIFDAcjCCMtK/0ErDErbUnoR6o/Sh
X-Received: by 2002:a05:690c:13:b0:2e4:da22:27d9 with SMTP id bc19-20020a05690c001300b002e4da2227d9mr27716095ywb.298.1649692183119;
        Mon, 11 Apr 2022 08:49:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649692183; cv=none;
        d=google.com; s=arc-20160816;
        b=w3Fsalw7JaSLdFNT+ONAKilRb6Zj3DwaOimUP0nMAZCRco9Aj9yIYxBbSv3vKIhsaK
         H/6hlWMqZ1IUQyyeXcG50RS587vWsHRWRXRXPrQp3FBlHTgFmpLWJO+kCn/tOcwBpsLs
         mpde7CA2AaiuE4BKKnk4WC2vekDhgRHl4PnLoRKQioOZsktFULEF18tjj5dZFVpZRFgT
         YRqlcOYOvSgiMowa02kk2xv37lmACWtMkDGOFsLo8n51Byc3kJQGghPlsseEJkK2UR5X
         U3x7Efp7FGXw1KJZI/KrpWlIU7LMxGu2jB5kLOF+cN5kwrfbj2njalyV1310vHXi+Vhu
         kVYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DP5tM8qoB3TXB51K44XzG6p0DUHGWWFU4P3bHYwzRBk=;
        b=EqEJKpNSIm95MyNdva5Lfw1eqXrAMwl6MWHHoITVrOx9Hgb8dRVQx0o1fKPZPynUg0
         maVM7PLDL5dM3WdYc977MGOCeHOiBeB8aoZD7OJ2cXF4YXqYNtoECu2fzSywLJkvC7g5
         NKjwUmtkFpA/qHlKQJC/rFqHqHpT6GdsFIZt/6CMsieqrVeplqmZNnOHOMw6JgwrT0gu
         44T2LN7jCi8FDuUOUFfaFliO5TJ6TCRUASGafMtc8HSUeOb4uQB7iG1s/X1IBFAVUYa4
         cKrdPuG/zUL+Cri2e2T+9pIjt7vFOKS/enysLlMr7XXTHyXHe5bXXiBLmtslDaZf4mmk
         kIyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="HAChq/iT";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y128-20020a253286000000b006413009d5a6si2673537yby.599.2022.04.11.08.49.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 08:49:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="HAChq/iT";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndwIQ-0001Uv-EV
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 11:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndwIE-0001Rs-A0
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 11:49:30 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:44693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndwIC-0001Vx-Fi
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 11:49:29 -0400
Received: by mail-yb1-xb29.google.com with SMTP id k36so6557907ybj.11
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 08:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DP5tM8qoB3TXB51K44XzG6p0DUHGWWFU4P3bHYwzRBk=;
 b=HAChq/iTVVu2zBNakpZJn6CLT846ok4PomJ1mP3G5IXSZfmWScuzfZSU25Z4SKb5R9
 Bw9PQ4+0egvnJ0r5mW4LvR6a85j/dBOvQ+dBW+K9XTTSQUdqd0GT1OLjOP20cvFsdRMn
 /44Qe4NRtVLsOnqUmWybbH3ob63M8GelCy9RJvQ+hU/Ihiq3WPrDY7OS8iUuELYdXTL3
 kUb1THKaHdOqLzlTOHxCtIDIToogNbGVO/71xG0e+SGjEv5mP8+0lFqhkgiknRU7NdBt
 OvlG+it/c8FxadRZxldLyBGt5GKBXCcadauLeBJOhMCOfLey/KhCUY+93Vdeo4hRiiQZ
 4dhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DP5tM8qoB3TXB51K44XzG6p0DUHGWWFU4P3bHYwzRBk=;
 b=xPzAGrp3QdixkX7eatIDWCmwXlTsWyknT27c/eC84+ahnNbvTpmFtkXHGnQueDV5Ly
 CD/gte8jIUz+D6MPWic6OZR5IhR5ov0LjBy/TZjgWwgAsZGjUAp4AcjT3Xavfw8rrSFf
 C+Ox8lxlxg7lfyCoLId3d6fH2ctwIHDtqQQc5ua9ZywvUL/7fkdojxhIv899/atGHajg
 53rZlOUQ2fCmDkAa6lara8Vca87/YvuLRWcaDBnUYkWgIpePClJxaGtLPQG0MjZwcyWu
 ziJbZITohqWMUfWWuWQoPe2II2MNT6XbtvAE8wwb7Tmd8UzPaK0T0R8pmqPD5fbrEgSZ
 T/Iw==
X-Gm-Message-State: AOAM531r/5057MaHgjS0pcQ3rCLmajnng7Pd8jdOvfFo9fjBAKF5VPVO
 GA+0+lfO5f4OR+/m5tR5+HENVqLnoa3jLunijSRTKA==
X-Received: by 2002:a05:6902:1502:b0:63d:4d6f:dc1 with SMTP id
 q2-20020a056902150200b0063d4d6f0dc1mr22513773ybu.140.1649692167465; Mon, 11
 Apr 2022 08:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-12-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 16:49:16 +0100
Message-ID: <CAFEAcA_ASQ7Dwm5YMsXvPa6SS721HNuUkD7JPSCpuNOyDikJtw@mail.gmail.com>
Subject: Re: [PATCH 11/16] target/arm: Add minimal RAS registers
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KNRg/D0+1/mE

On Sat, 9 Apr 2022 at 01:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add only the system registers required to implement zero error
> records.  This means we need to save state for ERRSELR, but all
> values are out of range, so none of the indexed error record
> registers need be implemented.
>
> Add the EL2 registers required for injecting virtual SError.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +/*
> + * Minimal RAS implementation with no Error Records.
> + * Which means that all of the Error Record registers:
> + *   ERXADDR_EL1
> + *   ERXCTLR_EL1
> + *   ERXFR_EL1
> + *   ERXMISC0_EL1
> + *   ERXMISC1_EL1
> + *   ERXMISC2_EL1
> + *   ERXMISC3_EL1
> + *   ERXPFGCDN_EL1  (RASv1p1)
> + *   ERXPFGCTL_EL1  (RASv1p1)
> + *   ERXPFGF_EL1    (RASv1p1)
> + *   ERXSTATUS_EL1
> + * may generate UNDEFINED, which is the effect we get by not
> + * listing them at all.
> + */
> +static const ARMCPRegInfo minimal_ras_reginfo_el1[] = {
> +    { .name = "DISR_EL1", .state = ARM_CP_STATE_BOTH,
> +      .opc0 = 3, .opc1 = 0, .crn = 0xc, .crm = 1, .opc2 = 1,

".crn = 12", please -- no other reginfo struct uses hex here.
Similarly below.

> +      .access = PL1_RW, .fieldoffset = offsetof(CPUARMState, cp15.disr_el1),
> +      .readfn = disr_read, .writefn = disr_write, .raw_writefn = raw_write },
> +    { .name = "ERRIDR_EL1", .state = ARM_CP_STATE_BOTH,
> +      .opc0 = 3, .opc1 = 0, .crn = 5, .crm = 3, .opc2 = 0,
> +      .access = PL1_R, .accessfn = access_terr,
> +      .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "ERRSELR_EL1", .state = ARM_CP_STATE_BOTH,
> +      .opc0 = 3, .opc1 = 0, .crn = 5, .crm = 3, .opc2 = 1,
> +      .access = PL1_RW, .accessfn = access_terr,
> +      .fieldoffset = offsetof(CPUARMState, cp15.errselr_el1) },

By my reading of the spec we could make ERRSELR_EL1 RAZ/WI, because
writing an over-large number has a number of behaviours including
that the value the guest can read back is UNKNOWN. That would save
having the CPU state struct field.

> +    REGINFO_SENTINEL
> +};
> +
> +static const ARMCPRegInfo minimal_ras_reginfo_el2[] = {
> +    { .name = "VDISR_EL2", .state = ARM_CP_STATE_BOTH,
> +      .opc0 = 3, .opc1 = 4, .crn = 0xc, .crm = 1, .opc2 = 1,
> +      .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.vdisr_el2) },
> +    { .name = "VSESR_EL2", .state = ARM_CP_STATE_BOTH,
> +      .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 2, .opc2 = 3,
> +      .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.vsesr_el2) },
> +    REGINFO_SENTINEL
> +};
> +
> +static const ARMCPRegInfo minimal_ras_reginfo_no_el2[] = {
> +    { .name = "VDISR_EL2", .state = ARM_CP_STATE_BOTH,
> +      .opc0 = 3, .opc1 = 4, .crn = 0xc, .crm = 1, .opc2 = 1,
> +      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "VSESR_EL2", .state = ARM_CP_STATE_BOTH,
> +      .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 2, .opc2 = 3,
> +      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> +    REGINFO_SENTINEL
> +};
> +
>  /* Return the exception level to which exceptions should be taken
>   * via SVEAccessTrap.  If an exception should be routed through
>   * AArch64.AdvSIMDFPAccessTrap, return 0; fp_exception_el should
> @@ -8452,6 +8550,15 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>          define_one_arm_cp_reg(cpu, &ssbs_reginfo);
>      }
>
> +    if (cpu_isar_feature(any_ras, cpu)) {
> +        define_arm_cp_regs(cpu, minimal_ras_reginfo_el1);
> +        if (arm_feature(env, ARM_FEATURE_EL2)) {
> +            define_arm_cp_regs(cpu, minimal_ras_reginfo_el2);
> +        } else {
> +            define_arm_cp_regs(cpu, minimal_ras_reginfo_no_el2);
> +        }
> +    }
> +
>      if (cpu_isar_feature(aa64_vh, cpu) ||
>          cpu_isar_feature(aa64_debugv8p2, cpu)) {
>          if (arm_feature(env, ARM_FEATURE_EL2)) {
> --
> 2.25.1

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

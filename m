Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF08CA5FA2
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 14:03:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBBwP-0005Kt-Fq; Mon, 28 Sep 2026 10:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBBvT-000515-NB
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 10:02:03 -0400
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBBvR-0003ED-Oo
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 10:01:51 -0400
Received: by mail-yx2-x11.google.com with SMTP id
 956f58d0204a3-671563fb8beso2825277d50.3
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 07:01:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790604105; cv=none;
 d=google.com; s=arc-20260327;
 b=VfCBzWENkoTMh3+BOrZoroD4vAYPxg9TRT7v5YBYParb2nhIzfsZYS0ZquRIhKPFkk
 87aBwwJ9O0MiSNA+UZuSnm1Fmzgb4+8SKy1tj+Q78R5qvqyGkJBxwflPVEwET6ArH4oo
 veaON84RX1hrg64XCQ6YLffTjL5hlEtAr9KrdFBNbU6wLqzlS612rpcKyMYkEvnsg/OJ
 mlTyJ+GA8MgRj/FTcjDH4z170T88f6Zko1/sPSiwxJuPW1D/70k3RHg6WrTOHZ43NDec
 gs783yiIvDErLjmQ2bHYX+/WvE2w7XO4frfBZZUnO//Nqy3KcNWXFSJx1dJlmIB0gYio
 LG8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=gVo78a/wlP80EbN8BDeCX3xsqSYxql3c+VM4RzW0dd4=;
 fh=PgK1hO6mmQM//0zRySi54MtqPs9+14fQ39WlbuopFkM=;
 b=D4UDbgjspMu7lY2PQD0vxRg+0P25NU0tlwzq08bqDbAZyZEnZilGOzXk4/FNXyxMiK
 b4FPKk9SLAjxi0LoyfRobctsEs3YHEPgIUuHQaz6IwZAkzQOMJZtJnW4SXfeipiJx2QG
 UirM8M1qO/+qJ46l8gVnLzgRje4wIgi4bNIMgFmIg7/cMwyqu4p8CwLEgS99fZhzqJIN
 rosXdpxtdqo89KgsFCknb9WZwSZUcdQFBLEgBTgr1YBLuKsANITSlDGMaN7folO2m3k3
 jr6cCMfNKuQwlPpckrOTS8AyZ/xuSQsFkCk7ks1N50RykiX31H7VAZ7ThpgxiDc7rjge
 fCJQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790604105; x=1791208905; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=gVo78a/wlP80EbN8BDeCX3xsqSYxql3c+VM4RzW0dd4=;
 b=qxvHfP6n4NRaLUphGYB0tfvkrPEGyBcZb37ohSDQ2prajO5a/V5kEug0L8q+jUABAa
 7tdJDJGi4vwPHYmKVGNs3C0qVuuQEjrJLZFzRTkKJb8gH/9sMR9RQOWBcvhYJtdyL1KG
 Y/rQzPZXR6jBxIUrtHL3oA1muK9jXyABGB//rEW5lEu5e10bfO2DYORGMxeD+phaWTAl
 onlTnEaz8jhsJhZR1AaweCUM+QjnTDGtN0qHhzgkmG8eBeLhPtsS1zkI3oTZEyfIUtvu
 U+ylC/QXjawJXfZ/xFVPRy+tgyfQ0XUvfkdGcJSmxc4oWQRuZRwgO3pAhHrl5nsNnYaa
 Comw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790604105; x=1791208905;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=gVo78a/wlP80EbN8BDeCX3xsqSYxql3c+VM4RzW0dd4=;
 b=rS4MNQrJAhHWScqsPYwmJZ91j02VpGNcElR1JKFO9rW7Dg/UO9vTwjpPY3KxdM94S/
 FGHhCUQwoxnj33uQnEjFnAIF+vzhiKHciP3pGXJpcYVtKjjB7B6obD+q33kHcn5j5+tu
 M/tTgKyvcBk1uc0+yhVbwHRAgGlRVBY31LIW+7+Oc2oMFrjuiGcUYIWBgUJGqY6yjLnG
 j8zs8QtFb4tqSFjfTHryDm4Ja5S0l99oOQnL6X+yW4zroUAPvsLH19/baLXF/Ht/2q12
 kFEAkouZ8o3yNII12vTUfvo+4s7X6SEzaxAYEABTo7e6g0svG2uJPl22sLrkM3fwTUqC
 oLrQ==
X-Gm-Message-State: AFq9FYIfsfwM0BHxZ9e9xwdgRdH2f7vfiA+S04bHnKJC2ON+VltVmJtB
 dN+DQlHzEEL/llzSE05X/beU3tGv8q9thcYUPdB+FTQNA/8KHunv3amjA+KpPFi9K5U9DZMzyLk
 9UcoY6Mlr4cwJmVBVkHwJNeCqfzgNusQR45Cv6r6ULg==
X-Gm-Gg: AYBFou3HkX8gf9jqkOhQz0xNesURy7uxQG6LpO1GNgqa25qieZyCdRxo3mzsTqM8OIE
 /2KEM4HMsY7EDE2kp0moISiH6IOIRNfUKCjsIGmvAgNRhdt7EW3E9kGyDtMkl6FOcB7coz5pOQS
 QI73+FJpp1MUvavWRDK3ZFQXKJcC3TgzbfYZl8z+xqHtvl1stOezPB6huvwI3+sGUrz8aIXORBg
 7PJg0z2rBodMaG54qLjI2P3KHRGF1Yl82LPU0DsquS9msbDwzdQJLcXdbSNylNwAEl3Uya51ukM
 NRKUIUxmUW1xf7RiJEv2Gg6edH/XMLJnUKTbDXbTmwBrFG2wLBYY+YIuIgg/HmO/3DZyLnrr2fz
 pdKZtUD0wjdloBO6oIZTMZnJ60zSOUZnGBPK+haQS
X-Received: by 2002:a05:690e:169e:b0:667:b503:4d2e with SMTP id
 956f58d0204a3-672ed1d4e4bmr6799180d50.37.1790604105100; Mon, 28 Sep 2026
 07:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com>
 <20260924173051.2117637-1-coltonlewis@google.com>
In-Reply-To: <20260924173051.2117637-1-coltonlewis@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Sep 2026 15:01:32 +0100
X-Gm-Features: AclHuK-1ibztR8QVF_T1w6zQp7WvVuCy3F9mqxT4-ubotzdPTVl79C5Fj0zkGKo
Message-ID: <CAFEAcA9Rwrffx8bYiOxrtQGdg31QAz1oBm8okzpfqHZ6yK0Y7A@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Enable KVM PMU partitioning and counter limit
To: Colton Lewis <coltonlewis@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvmarm@lists.linux.dev, 
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>, 
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
 Mingwei Zhang <mizhang@google.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::11;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x11.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 24 Sept 2026 at 18:30, Colton Lewis <coltonlewis@google.com> wrote:
>
> Add CPU properties to configure KVM ARM64 PMU counter partitioning:
> - 'pmu-partition' (bool): enables KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION
> - 'pmu-num-counters' (uint32): sets KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS
>
> When 'pmu-partition=on' and 'pmu-num-counters=N' are passed via -cpu,
> QEMU enables hardware PMU partitioning and reserves N general-purpose
> event counters for the guest prior to calling KVM_ARM_VCPU_PMU_V3_INIT.
>
> Note that this patch is an example to demonstrate the KVM ARM64 PMU
> Partitioning uAPI [1]. That is why it aborts immediately if setting the
> device attributes does not succeed.
>
> [1] https://lore.kernel.org/kvmarm/20260924172928.2110956-1-coltonlewis@google.com/
>
> Signed-off-by: Colton Lewis <coltonlewis@google.com>

FYI for next time around, QEMU patches that depend on not-yet-accepted
kernel ABI changes should be tagged RFC, please.

> ---
>  target/arm/cpu.c | 20 ++++++++++++++++++++
>  target/arm/cpu.h |  4 ++++
>  target/arm/kvm.c | 32 ++++++++++++++++++++++++++++++++

New CPU properties should be documented in docs/system/arm/cpu-features.rst .

>  3 files changed, 56 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index f58a1db843..7538c6a24c 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1359,6 +1359,20 @@ static bool arm_get_pmu(Object *obj, Error **errp)
>      return cpu->has_pmu;
>  }
>
> +static bool arm_get_pmu_partition(Object *obj, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    return cpu->kvm_pmu_partition;
> +}
> +
> +static void arm_set_pmu_partition(Object *obj, bool value, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    cpu->kvm_pmu_partition = value;
> +}

If your getter/setter are only updating the struct field,
you can use a DEFINE_PROP_BOOL to avoid having to have them
(compare arm_cpu_has_el2_property etc.)

> +
>  static void arm_set_pmu(Object *obj, bool value, Error **errp)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
> @@ -1604,6 +1618,12 @@ static void arm_cpu_post_init(Object *obj)
>      if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
>          cpu->has_pmu = true;
>          object_property_add_bool(obj, "pmu", arm_get_pmu, arm_set_pmu);
> +        object_property_add_bool(obj, "pmu-partition",
> +                                 arm_get_pmu_partition,
> +                                 arm_set_pmu_partition);
> +        object_property_add_uint32_ptr(obj, "pmu-num-counters",
> +                                       &cpu->kvm_pmu_nr_counters,
> +                                       OBJ_PROP_FLAG_READWRITE);

What should we do with these properties if we're not using KVM
(i.e. for TCG, hvf, etc) ?

thanks
-- PMM


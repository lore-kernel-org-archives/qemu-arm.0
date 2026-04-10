Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC1FF44846
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Apr 2026 11:59:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wBAVY-0003WH-KZ; Fri, 10 Apr 2026 07:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wBAV9-0003Tm-2E
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 07:58:20 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wBAV7-0003F5-FM
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 07:58:18 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-64f48a5c3d8so2036893d50.1
 for <qemu-arm@nongnu.org>; Fri, 10 Apr 2026 04:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775822296; cv=none;
 d=google.com; s=arc-20240605;
 b=DcqIXPrzco+yXAk1zWqqfAspOqTgES5BMnh5WWVVVlN/N3zmB9SFxSDYCyy+F3I7q7
 X30aTYfEmemMwOFvDdGPaDWxHiSJPPRDHPvw0cZ+CkgjbGHxsPF57R4zJu6CTM/hffva
 LlnaeZrIz79aqU4x9U5b7mG0WJyeDputfWRHWNC9gV3TIA2sEwkyjWD7n8u2EipugpvM
 TaDiwBQr0o1QHfwu+VhGahDwZHmuVO90SueAGQAQFMbN43AAq6gaoNXikcr2HhjN8JdJ
 7LTAWhjBXrvB/Tk4c2yV85lUl+28FHl9THSCgVzmsNasUCiAueoHY8D2KCXdWzISXBmD
 sMBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=P5M4KQf/a3YX2BTOkf+nV0Z0qPJzsFCvpoUG3BFiwhI=;
 fh=CE2lE6aXcUayuB4xKWqiFfdbqTHTPuyhykzNo3A42K8=;
 b=aTirGjsErGT5vekrWS1O6iE1xJoe0tKdeswYE8ajh6HPOd19ofKjBIVSNq4BveYGaS
 g5WWBrbVcI9tQBhwdcXohT/0EfYL6Xg4HQ9sOo0bRI1k3Nlv/jbDvsTcgqbiY8bu+jMi
 Y7Ci3gOlSnH4m+Mhk70MMgRqk4NkGLBATi/8sWaZgC079VR6cxLVZCqwAx3XEzUaSJo0
 GpTOwOFSD4SJ6gulazDk+LyADpAytO3LYrrKHl3d0a7mZLDPnBUqV0YMG//Z7IXfvArq
 EmcYVUywaVUp7WPku3BgBz2+dwL3IP7JyrUZj9gHSHchR1Z39wNqabqkuyOtyagOe8gs
 HpRg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775822296; x=1776427096; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P5M4KQf/a3YX2BTOkf+nV0Z0qPJzsFCvpoUG3BFiwhI=;
 b=F6HWnD2rx/Ly5LKNTM99+WOzOH+zHxfrtXwttXDrxQ/9yYl7q4xcNF7b6wu3y3KOxP
 ou/6LvSryecsTKgD7S7okGjc2lQzQFtidBLBPFhlpwd6tBUyOhns3eaaP/fnx7UXpV6u
 Q9FOE6VO+5NWgWLm65sufw+3M+u9LJ1SqNKOYnEGxr0VFJJuDJvNskThOfawv3hRsz1C
 d8mZ8BqUyAY3QXJSyQv+C5zgLW8jRbY+H/476qcHo9ZeuQQaGvHEGYtR42n3vLS+v6O5
 Btt4zStzIDlnDnTDBKaMFpTU1A03kZ7JMeClQr45ZFJgg3dHtfr6JNTS72XtqjjdgGcK
 YRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775822296; x=1776427096;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P5M4KQf/a3YX2BTOkf+nV0Z0qPJzsFCvpoUG3BFiwhI=;
 b=cHGE96hIsMwWUINVD1MGmy/UFN/DoEKr2Tz6QlLzwco2eB+DPdAP7BICxfCWVH31Fd
 QpaKOigsfbWYPHp+ydMPSEcWU/6NxYXtLYv536JJ5yqd4CZ1sSQ3jTKdYncvBzgIS9Uq
 d+V1zLJjuJPFTtxkK3doQ4IEVw3tznYJ4x61LKsUSKopqA63UPKi9mpy4LcD70kW22B+
 A38CTjZLUzsMlmUswlDKoSopHc+DRBNbDkOu8gxUHvv2GrxKiLUrrZFIxWoGwJ4CzeVr
 r3L3WPELKIWwiXXr2cxk8afx2fV0iy+wmliFxNqACy6Z2J7TLqy3y1KQmdNtIFT+GDrz
 OG4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqCobfBnuODN5jgeBgZ2B/Tp+y/EKTr4rKbC3kgysStV4G3PefWNVqp+0tPhuSCJsC8KSzB7DoYQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywj1/vBn1vUoRLTj/FVldY4sN3xKjYxInY8dxjmTrBFSvDAa9SM
 FlCEjMSD8m1bnIcPnXoFRuuLsO5TaLllbfQmHJBDylNy/mpuybyfx5tAZWUNqfg61Ro8aHdww3K
 MmwqKul/TE749VU3wFqrV2uTBLjVbqdKrB5sraXpxJg==
X-Gm-Gg: AeBDieupLbd+tFN/Uu8D0yRVzvmXPr8bTAzMWomh/4ZkIgullJR6hiH7afSzDOPZgGU
 4gj7iNrMSFBF5fHIOb79/hmDThIjdgPpXeNmVGPrnBRxc4J83nzWWdAQV5kVRC89zS2lJRXqj7W
 2M3rR7odsHZj8Za2uQmhzMRZn0+ohlCEA6FGX5rwInfcNnp9YTrphs+u8pPez8zsN0s3hSUP0Bn
 wWTa7+P4orl+EfCTBrCPhZqSgynWB/Y+V4KqQ9hUpBIVWwxx9VmCeGqudZIxH4NmfKwVb8x4NmZ
 Mhgu6kPTbXSSTmL4jcLnMBfm2vvAOhYADCCk6nX/gWOucPbUG3KBqpQW7DQM/J7ovCg=
X-Received: by 2002:a53:ca4b:0:b0:650:4a79:f3a9 with SMTP id
 956f58d0204a3-65198c34dffmr1676618d50.69.1775822296268; Fri, 10 Apr 2026
 04:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260306150302.203112-1-eric.auger@redhat.com>
 <20260306150302.203112-4-eric.auger@redhat.com>
In-Reply-To: <20260306150302.203112-4-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Apr 2026 12:58:04 +0100
X-Gm-Features: AQROBzCwi0If5Qo_L8yIdVvf835y5bsPRe4x_VJ2Fdocg-8V3ZjqR28uv2x-n2M
Message-ID: <CAFEAcA_0GwsiEG-A_OGTCz4QAs5K2hEU2z8t1pEG7mp0MLO7nA@mail.gmail.com>
Subject: Re: [PATCH v9 3/6] target/arm/cpu64: Mitigate migration failures due
 to spurious TCR_EL1, PIRE0_EL1 and PIR_EL1
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 cohuck@redhat.com, sebott@redhat.com, peterx@redhat.com, philmd@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Fri, 6 Mar 2026 at 15:03, Eric Auger <eric.auger@redhat.com> wrote:
>
> Before linux v6.13 those registers were erroneously unconditionally
> exposed and this was fixed by commits:
> - 0fcb4eea5345 ("KVM: arm64: Hide TCR2_EL1 from userspace when
>                  disabled for guests")
> - a68cddbe47ef ("KVM: arm64: Hide S1PIE registers from userspace
>                  when disabled for guests")
> in v6.13.
>
> This means if we migrate from an old kernel host to a >= 6.13 kernel
> host, migration currently fails.
>
> Declare cpreg migration tolerance for those registers.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Sebastian Ott <sebott@redhat.com>
> ---
>  target/arm/cpu64.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index d6feba220e8..4cfddc6e8c0 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -810,6 +810,31 @@ static void aarch64_a53_initfn(Object *obj)
>      define_cortex_a72_a57_a53_cp_reginfo(cpu);
>  }
>
> +static void kvm_arm_set_cpreg_mig_tolerances(ARMCPU *cpu)
> +{
> +    /*
> +     * Registers that may be in the incoming stream and not exposed
> +     * on the destination
> +     */
> +
> +    /*
> +     * TCR_EL1 was erroneously unconditionnally exposed before linux v6.13.
> +     * See commit 0fcb4eea5345 ("KVM: arm64: Hide TCR2_EL1 from userspace
> +     * when disabled for guests")
> +     */
> +    arm_register_cpreg_mig_tolerance(cpu, ARM64_SYS_REG(3, 0, 2, 0, 3),
> +                                     0, 0, ToleranceNotOnBothEnds);
> +    /*
> +     * PIRE0_EL1 and PIR_EL1 were erroneously unconditionnally exposed
> +     * before linux v6.13. See commit a68cddbe47ef ("KVM: arm64: Hide
> +     * S1PIE registers from userspace when disabled for guests")
> +     */
> +    arm_register_cpreg_mig_tolerance(cpu, ARM64_SYS_REG(3, 0, 10, 2, 2),
> +                                     0, 0, ToleranceNotOnBothEnds);
> +    arm_register_cpreg_mig_tolerance(cpu, ARM64_SYS_REG(3, 0, 10, 2, 3),
> +                                     0, 0, ToleranceNotOnBothEnds);
> +}
> +
>  static void aarch64_host_initfn(Object *obj)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
> @@ -822,6 +847,7 @@ static void aarch64_host_initfn(Object *obj)
>  #endif
>
>  #if defined(CONFIG_KVM)
> +    kvm_arm_set_cpreg_mig_tolerances(cpu);
>      kvm_arm_set_cpu_features_from_host(cpu);
>      aarch64_add_sve_properties(obj);
>  #elif defined(CONFIG_HVF)


If your only callsite for a static function is guarded by an ifdef then
you need to also guard the function definition with the matching ifdef.
Otherwise you get compilation errors (either clang complains but gcc
is happy, or the other way around -- I forget which).

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


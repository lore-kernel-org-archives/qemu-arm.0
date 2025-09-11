Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3B8CAC58E
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Sep 2025 13:05:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uwgyN-0005xk-D9; Thu, 11 Sep 2025 09:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uwgyH-0005wq-6y
 for qemu-arm@nongnu.org; Thu, 11 Sep 2025 09:04:19 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uwgyC-0006Z1-CV
 for qemu-arm@nongnu.org; Thu, 11 Sep 2025 09:04:16 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-71d5fe46572so7304347b3.1
 for <qemu-arm@nongnu.org>; Thu, 11 Sep 2025 06:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757595847; x=1758200647; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8OYzAKS8UNIAfJWX6zf7rRXv1/Qvw89hpvx4JcJ/ayc=;
 b=nCtc4MFybK/M9fhhxbvrwV2myqcnZJnEmQrEjNdjZmP0KWXZ2NTJmRKUiiy5R7GC9s
 7N9FsYEm2cC/Nqyz8eeFySSc3aimDzRkpgUrEALOjpPa5AkS65V3HJdS3DzPUccouygt
 WReH1S34LgNL43IfUr+e38Y07S2xhYlxYFLJenPRi9QhrO9tQyxn3P0m3hIZvyVs1yX2
 Tzvq3aCaPxVmbtPdf7Bt7M5d4Gsh+hdfGhOrAjRGXfTxHGDbGP7D9DiV4XYg3NPzBpeH
 Eh8ZYM1xPR8Yqd8pH6b62hts6lw1XtUXp6k/BTNnDkkfrkudSOm8ces4ogqtAAM+3OeD
 ALPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757595847; x=1758200647;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8OYzAKS8UNIAfJWX6zf7rRXv1/Qvw89hpvx4JcJ/ayc=;
 b=IyYU3yQWDouDyvz64Da6i/U3jhnJbT/xwwjmeM1ydhr4qzIjvkJCJsZUkZiJQvyLYz
 mhMs1lYFL0oewW6R4cVs7UHAJku7kr5/HPwpmpTlulxjB8y+MirO5pq/JJIz+UVvxfMV
 uCCJfAYGb2/x3IfgT4JBBrUk+E0SGtRZY04e6frvg4VAk3D5XNjJ7BWbyQT1GX6xaLqq
 qPs71L1oNoo9xlLulceFkip5STFolfAo2UvH2zmjNu4ZOdgOa3z4V6XJxXfK+bTPDlXM
 vRu2p7YARI5h3ncSwYgDoWwKn9bwCOG24okI5h+23LMYrH8yC7VwhT3gtDjgUDxXneYe
 h3cg==
X-Gm-Message-State: AOJu0YyQsbZj3Y/JFG/os0OI+rsLqjzKUoHGuMi5g0RB6fBXafv3gQJm
 +PKSmpSIyGIDbXmiZ8f9SP5fcy1ZRluDQrpmHoriOs8ffeo6g7M7+z8rzO0taKqK/u3fj0M9X5g
 f0dviEogUIlKBuRUkg9pYJJ29cxKJvJRs7zIP7H0yEQ==
X-Gm-Gg: ASbGncs8SnrDMOu45x8mW1BbDgvUt2mgBQHoE+DQyuqLpVE1argpSgZ2uKu679DFWGR
 xUvWPMzHVHO/ZBXGSHR8bzP2k5wr7Ar11VHBQ+CeKSUcYT/i5TVyJMSh/5+KzhmjxwN+A87HeLu
 UgltlGXrJ8t/BbpHWBvm4oUiOHFCJtqkNdomzpIcHdKqKkSvS2qnAGMb5XPXl+GGeJEGprXZbZX
 D9QhlwhaggIUEJgUOA=
X-Google-Smtp-Source: AGHT+IHlEPB6zmIMmP3aLZ3Diba8MYG8cM6OaYkdLea0qKp57i+7hVl6exjEGnh34go9mWuCY95Ygl3WqGGD8Flvr9E=
X-Received: by 2002:a05:690c:9686:b0:722:8d7f:da90 with SMTP id
 00721157ae682-72eec5b879fmr31164347b3.19.1757595846553; Thu, 11 Sep 2025
 06:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250902092732.706338-1-cohuck@redhat.com>
In-Reply-To: <20250902092732.706338-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Sep 2025 14:03:55 +0100
X-Gm-Features: Ac12FXxjijJmJZ9BTHLDHOHG6M5hF7RpUhc-iqCIkX73kLJo9067-4VjOxchMAs
Message-ID: <CAFEAcA-_FgV69C6mKk5XiaQwj=LQD=C9ecjcm_gGuhEjYD3dyw@mail.gmail.com>
Subject: Re: [PATCH v2] arm/kvm: report registers we failed to set
To: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Eric Auger <eric.auger@redhat.com>, Sebastian Ott <sebott@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 2 Sept 2025 at 10:27, Cornelia Huck <cohuck@redhat.com> wrote:
>
> If we fail migration because of a mismatch of some registers between
> source and destination, the error message is not very informative:
>
> qemu-system-aarch64: error while loading state for instance 0x0 ofdevice 'cpu'
> qemu-system-aarch64: Failed to put registers after init: Invalid argument
>
> At least try to give the user a hint which registers had a problem,
> even if they cannot really do anything about it right now.
>
> Sample output:
>
> Could not set register op0:3 op1:0 crn:0 crm:0 op2:0 to c00fac31 (is 413fd0c1)
>
> We could be even more helpful once we support writable ID registers,
> at which point the user might actually be able to configure something
> that is migratable.
>
> Suggested-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> Changes RFC->v2:
> * cover different register types
> * less macro magic
> * less memory leaks
> ---
>  target/arm/kvm.c | 86 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 667234485547..0423d4df7c06 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -900,6 +900,58 @@ bool write_kvmstate_to_list(ARMCPU *cpu)
>      return ok;
>  }
>
> +/* pretty-print a KVM register */
> +#define CP_REG_ARM64_SYSREG_OP(_reg, _op)                       \
> +    ((uint8_t)((_reg & CP_REG_ARM64_SYSREG_ ## _op ## _MASK) >> \
> +               CP_REG_ARM64_SYSREG_ ## _op ## _SHIFT))
> +
> +static gchar *kvm_print_sve_register_name(uint64_t regidx)
> +{
> +    uint16_t sve_reg = regidx & 0x000000000000ffff;
> +
> +    if (regidx == KVM_REG_ARM64_SVE_VLS) {
> +        return g_strdup_printf("SVE VLS");
> +    }
> +    /* zreg, preg, ffr */
> +    switch (sve_reg & 0xfc00) {
> +    case 0:
> +        return g_strdup_printf("SVE zreg n:%d slice:%d",
> +                               (sve_reg & 0x03e0) >> 5, sve_reg & 0x001f);
> +    case 0x04:
> +        return g_strdup_printf("SVE preg n:%d slice:%d",
> +                               (sve_reg & 0x01e0) >> 5, sve_reg & 0x001f);
> +    case 0x06:
> +        return g_strdup_printf("SVE ffr slice:%d", sve_reg & 0x001f);
> +    default:
> +        return g_strdup_printf("SVE ???");
> +    }
> +}
> +
> +static gchar *kvm_print_register_name(uint64_t regidx)
> +{
> +        switch ((regidx & KVM_REG_ARM_COPROC_MASK)) {
> +        case KVM_REG_ARM_CORE:
> +            return g_strdup_printf("core reg %lx", regidx);
> +        case KVM_REG_ARM_DEMUX:
> +            return g_strdup_printf("demuxed reg %lx", regidx);

You can't print a uint64_t with %lx. I suppose this code is
only going to get compiled on a 64-bit host but we might
someday want to move it so we can pretty-print registers
elsewhere (e.g. in cpu_post_load() where we fail for
"incoming migration stream has sysreg X but we don't know it").

> +        case KVM_REG_ARM64_SYSREG:
> +            return g_strdup_printf("op0:%d op1:%d crn:%d crm:%d op2:%d",
> +                                   CP_REG_ARM64_SYSREG_OP(regidx, OP0),
> +                                   CP_REG_ARM64_SYSREG_OP(regidx, OP1),
> +                                   CP_REG_ARM64_SYSREG_OP(regidx, CRN),
> +                                   CP_REG_ARM64_SYSREG_OP(regidx, CRM),
> +                                   CP_REG_ARM64_SYSREG_OP(regidx, OP2));
> +        case KVM_REG_ARM_FW:
> +            return g_strdup_printf("fw reg %d", (int)(regidx & 0xffff));
> +        case KVM_REG_ARM64_SVE:
> +            return kvm_print_sve_register_name(regidx);
> +        case KVM_REG_ARM_FW_FEAT_BMAP:
> +            return g_strdup_printf("fw feat reg %d", (int)(regidx & 0xffff));
> +        default:
> +            return g_strdup_printf("%lx", regidx);
> +        }
> +}
> +
>  bool write_list_to_kvmstate(ARMCPU *cpu, int level)
>  {
>      CPUState *cs = CPU(cpu);
> @@ -927,11 +979,45 @@ bool write_list_to_kvmstate(ARMCPU *cpu, int level)
>              g_assert_not_reached();
>          }
>          if (ret) {
> +            gchar *reg_str = kvm_print_register_name(regidx);
> +
>              /* We might fail for "unknown register" and also for
>               * "you tried to set a register which is constant with
>               * a different value from what it actually contains".
>               */
>              ok = false;
> +            switch (ret) {
> +            case -ENOENT:
> +                error_report("Could not set register %s: unknown to KVM",
> +                             reg_str);
> +                break;
> +            case -EINVAL:
> +                if ((regidx & KVM_REG_SIZE_MASK) == KVM_REG_SIZE_U32) {
> +                    if (!kvm_get_one_reg(cs, regidx, &v32)) {
> +                        error_report("Could not set register %s to %x (is %x)",
> +                                     reg_str, (uint32_t)cpu->cpreg_values[i],
> +                                     v32);
> +                    } else {
> +                        error_report("Could not set register %s to %x",
> +                                     reg_str, (uint32_t)cpu->cpreg_values[i]);
> +                    }
> +                } else /* U64 */ {
> +                    uint64_t v64;
> +
> +                    if (!kvm_get_one_reg(cs, regidx, &v64)) {
> +                        error_report("Could not set register %s to %lx (is %lx)",
> +                                     reg_str, cpu->cpreg_values[i], v64);
> +                    } else {
> +                        error_report("Could not set register %s to %lx",
> +                                     reg_str, cpu->cpreg_values[i]);

Similarly we should be using PRIx64 here.

> +                    }
> +                }
> +                break;
> +            default:
> +                error_report("Could not set register %s: %s",
> +                             reg_str, strerror(-ret));
> +            }
> +            g_free(reg_str);
>          }
>      }
>      return ok;

thanks
-- PMM


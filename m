Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA38CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 10:38:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDh5S-00053W-R7; Tue, 28 Oct 2025 06:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDh5O-000525-CY
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 06:37:54 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDh52-0004Sa-Ag
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 06:37:41 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-63d97bcb898so9500455d50.0
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 03:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761647849; x=1762252649; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+VogG5bJlckXRcgChjIj0RuzZ9xCrcFLVwzWctAbkNQ=;
 b=d+DiUCqYtmmBS8+975zWxJ+tsqDkRijRURwtqVwR9YGQsVcF5l87AHjhnY/3+BEZqf
 Gn+V5UG2/DQHvsxbuLomQ3M1eKXtMvkKTKrOCuLO0DJlM2DjKZ46INxA+d/UaHKlGMbL
 cHMVTqMwNZQAE3BwjIAnGF8vf7fAJGWxJvBpHOnpR8uUpZC9Ko52y2WDPXA0+3YdVIsK
 yk/h5uh2lHawn6jDv6COobIaU1J6D1cdS/f/xYt2iuR5f1zrXUZXPtmjg6EcJS0sLMdo
 JkzTxVimdhJR4KZb+DCPkl40+psiXOzonnhDyNJYOQV0F/84W2gJQfaLkaoZf3GLV7KH
 krOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761647849; x=1762252649;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+VogG5bJlckXRcgChjIj0RuzZ9xCrcFLVwzWctAbkNQ=;
 b=c3oCKnRQO59pdo57MHRi6LDC7loa1wUcVhoBhiq0qnYYSLmeNG/A/YMt5EZGjLQ9Kf
 WFCGPeIkjz0poCfOW5U+oN85ZNGsz8KeX2PIpgGAk/x1WnJ5ayZWPb3bSKsb1IuJTuPs
 wFMy0RJNbfr+R0PFgyC+XTNYYGNwLzIu2gnsErQ0ByN9oZ4k4yd9DhlPHU64kdYnoTAI
 JL9MSKhTJyaCL/xfXMCwy1DkZSCH3dSya35OSKXqC338nqL8rlZKpo+TsFC2tVoUtPmE
 SFFh5t4A2r8CwyA3XRsL0ke0BGv2JROAkRlzVOFaKh9PQwste7gKKDT0XeQZWRWOaErS
 5ihw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUpwZopTzrvuWNAfRe9zFOxWCCWVt1InLtY485rBwJX016UaJ+HjjGxwebyvytD1cLfYJk+87AHQ==@nongnu.org
X-Gm-Message-State: AOJu0YwYUQNUd4xp+vylVHHvzSAddCrMzd3AGhSxzs35EFWm328I4CGo
 pB/O0zMYk0wBv2y4iQw9OIyoEIV2R4AoLkRkVhGMBytpb56y7AcOzG66ingqJG4IBlOh07oJlhs
 jmiDaYCAsyyj6FAgk5hX/vFMmM5b63WNjPv6mTC2jEA==
X-Gm-Gg: ASbGnct0g5fP6A72aKUFsUvIn/s+epqfq0EOXtHXPqFc9/TNSh3urToWu6cw9eNzf0E
 w4pdo+r2uX8TXlaTWOC0C7UYXZXtOqw85cqfeKKq0tizHAj8MN4wBcKVXmHGRps+PRZsw7Hti/s
 TAD3jbBh8bGKr9KPht0MaonBcml7jZC5rX34N49CIB8pSL6aB+PTeR4OjaY+Cok9nD9d+eCLp+9
 rQv8eVDBCKSbcpmkgd16TtrdENnQaIh1T3F9mz44hDOzo1q4e4Gd0PVuGN+CyaF2DE73xo6
X-Google-Smtp-Source: AGHT+IEZAM4auEqB+WSe5eHf5tb55iV8XjvGstcJeiHBlHKfHtoDsSVBcEG6hbld83dOg2ELkk9OTMWNP1XOnCzzI68=
X-Received: by 2002:a05:690e:4009:b0:63c:e8f2:2280 with SMTP id
 956f58d0204a3-63f6c5efbe2mr1952247d50.2.1761647849413; Tue, 28 Oct 2025
 03:37:29 -0700 (PDT)
MIME-Version: 1.0
References: <20251016140039.250111-1-eric.auger@redhat.com>
 <20251016140039.250111-8-eric.auger@redhat.com>
In-Reply-To: <20251016140039.250111-8-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Oct 2025 10:37:17 +0000
X-Gm-Features: AWmQ_bkTPwDs2fMRUDbNnqYdUbteCNQqyI7sAymkPHEOjuNAZpoZQ1cllrhnKtE
Message-ID: <CAFEAcA_DSo7COpwXF_W4sMiwwmGvZy21GON7UbKWm4H5uDxb4A@mail.gmail.com>
Subject: Re: [RESEND PATCH 7/7] hw/arm/virt: [DO NOT UPSTREAM] Enforce
 compatibility with older kernels
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 cohuck@redhat.com, maz@kernel.org, oliver.upton@linux.dev, sebott@redhat.com, 
 gshan@redhat.com, ddutile@redhat.com, peterx@redhat.com, philmd@linaro.org, 
 pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Thu, 16 Oct 2025 at 15:01, Eric Auger <eric.auger@redhat.com> wrote:
>
> This is an example on how to use the new CPU options. This catters to
> distributions who want machines to be migratable (forward and backward)
> accross different host kernel versions in case KVM registers exposed
> to qemu vary accross kernels. This patch is not meant to be upstreamed
> as it is really kernel dependent. The goal is to illustrate how this
> would be used.
>
> In this example, For 10_1 machines types and older we apply the following
> host kernel related compats:
>
> 1) Make sure the KVM_REG_ARM_VENDOR_HYP_BMAP_2 exposed from v6.15 onwards
>    is ignored/hidden.
> 2) Make sure TCR_EL1, PIRE0_EL1, PIR_EL1 are always seen by qemu
>    although not exposed by KVM. They were unconditionnally exposed before
>    v6.13 while from v6.13 they are only exposed if supported by the guest.
>
> This will allow 10_1 machines types and older machines to migrate
> forward and backward from old downstream kernels that do not feature
> those changes to newer kernels (>= v6.15).
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/virt.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 175023897a..c4f9b82c38 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -97,6 +97,23 @@ static GlobalProperty arm_virt_compat[] = {
>  };
>  static const size_t arm_virt_compat_len = G_N_ELEMENTS(arm_virt_compat);
>
> +/*
> + * if a 10_1 machine type or older is used:
> + * 1) make sure TCR_EL1, PIRE0_EL1, PIR_EL1 are enforced, even if they are not
> + *    exposed by the kernel
> + * 2) hide KVM_REG_ARM_VENDOR_HYP_BMAP_2
> + */
> +static GlobalProperty arm_virt_kernel_compat_10_1[] = {
> +    /* KVM_REG_ARM_VENDOR_HYP_BMAP_2 */
> +    { TYPE_ARM_CPU, "kvm-hidden-regs", "0x6030000000160003" },
> +    /* TCR_EL1, PIRE0_EL1, PIR_EL1 */
> +    { TYPE_ARM_CPU, "kvm-enforced-regs",
> +      "0x603000000013c103, 0x603000000013c512, 0x603000000013c513" },

Strings which are lists of long hex numbers? Is there a
more readable way to do this?

-- PMM


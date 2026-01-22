Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8BFC44500
	for <qemu-arm@archiver.kernel.org>; Thu, 22 Jan 2026 11:32:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1visv1-0004bN-0R; Thu, 22 Jan 2026 06:32:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1visum-0004a4-B7
 for qemu-arm@nongnu.org; Thu, 22 Jan 2026 06:31:54 -0500
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1visuk-0007Wf-Co
 for qemu-arm@nongnu.org; Thu, 22 Jan 2026 06:31:52 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-79088484065so8159727b3.1
 for <qemu-arm@nongnu.org>; Thu, 22 Jan 2026 03:31:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769081509; cv=none;
 d=google.com; s=arc-20240605;
 b=TLxeLMIarTTbDgzG3Ur87LGUmpfflon4RcT4rvQgxhO0qdpqCSz2cW9oH9zhSFxFs2
 S/MzX/bAL91L2jQEZe55aGgphSKbGpnCv0wB6Zlhf1qdjll6BPfRwF6o1FHvpCVrKfkW
 SHxBuTso26fSTLiiVZ4gJ/g0qMMPa4zC0BcUkKyvFlm7nUM9Ri9Y9UWO1T4Xef7CBe1h
 q+oPzVeizOpqvcvehSGMWSPFT6bUKueu7x+DL1HnKib4wI2aS4zp64LCN8SDtaI4Ra7w
 0Zw86lBe1ElDCp3uPFCZ6uRPSjzyTPPv40AOiT3Nzn4llJuXPT+/NX+LA1tZXRdK1tDC
 AIcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ZoIC6va/3cQgSH2eFyktj7RW0CONziEpklpiJPgaDbU=;
 fh=0Hhym2QQ4C0Iol3i/kX6qmgZqhPJyU8ZytUZqOwTwWc=;
 b=Vt/E6s3+59Lig1FoWsuK0W6v4XOBHLOUHsqDCnXDAnTioGG1n/gmpoXdGnkfjUzqXi
 Zso8afa1eu8yoaDBD35Vnz92UI0Jm6bV2pY7YERx1yhD92bWF4tVZW0azrp645Z0xY8r
 W1R7gniEVLj/E8tjdN6T6eEp215GDIRgKtUuNXg+LCYwwMuNGskgU5XizPV7nir7Q/bw
 wDq+Pi9yn/celw0QkgtLzuBT8hj11iXtR5INqHo+FQsPdERMiwz2Ph5xu0LDxx5ztoht
 JkYK8DHOnAj2M0DM0vR8vquxFibVHiZzp/P18xWRRsnK7MD9/46XlUsmXfNQq/isP+sj
 D5zA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769081509; x=1769686309; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZoIC6va/3cQgSH2eFyktj7RW0CONziEpklpiJPgaDbU=;
 b=rpDZEbu/T6M9vWlmITb9ZsCHIPdDzu8O79Oe5L3UyzIA9Hj+eZDoHPAa10Lf07kEcy
 9y8cYy/+FiqXrqVL0NFgpnsLwsIAh3sDP6SR5JKK61ahQwqmENR73vLI1hEf9vVIyhTI
 5HHEwBCWC4/g73G9ECP5zmOUNXahUGkwEGzAyfOJ9GCrmSiB1bUYeTwHT3osD6GkypGH
 sbqMYBZ3vlDtC49FDU+xCaXZelev1OuejIWUj/KO9cpEHTFx77dwvTYTnEZm6tIOYfmJ
 3DYO/qZ53PDIp8M8P7PT7cLYTNuL/3+PHF9L9gUk3luG+tOG/moNvS5R2O7Xzj9UJswf
 cxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769081509; x=1769686309;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZoIC6va/3cQgSH2eFyktj7RW0CONziEpklpiJPgaDbU=;
 b=umt4r15bmgIR4O+EZL8tDrqhPnpJB7KnQ48GwdEVEZVKkCUMQMmC6pFCI12wSg3w8A
 WIvMmV1LgmPvvVODTfnTusRDUA9YjR+5Qf5XpL8GGmj7Q8Z/8ZtaBU9Iz6d5bUBMHgVV
 ak0pV1WJx2RNHg3xd815LrxW3aplbXeaho6EsD+dW6H9H9IC5Dud8rlvZMo2aUIidkRm
 Jb9M8UcZJtgWx3wOW2wda58u6m+OPd4TyI/ruA2/ormRRCuwnTT2yYht33G/NNHw9CDJ
 cjnNXPBCSKD59nYdtLsCVQp/JQ8fujwZFHVq9zRcnzCDwjjQt6OXYgc85wi52NaeBoFQ
 FPRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBw2d3mD9YZLNnUQUdF1gHikO9Wk0/B2fxezuutUeq2v8MCntlqj8sBsZOA43tq3W24o3AUd9Ygw==@nongnu.org
X-Gm-Message-State: AOJu0YxvaHtKJbENsHG7xygF4K+iaCHz40pqdWY5xcQZAzEoBMC8Baa8
 dXYD9D3Sfnrma4d2GBv/B8gbyNKoL0AATvO38GBP6L6fWfzY+iGG58ZzJtlErveFE8niSwuqogi
 bTORgJnT/vKBL6t/v5Z+AnJoe3YcGfZnU/k3CXaNevw==
X-Gm-Gg: AZuq6aI+Pcru164fnWB0K6rgFa3aTGj0rj86Da8tMmCwRVczjYzEyLYhyfLiD985PCS
 EhvmeYFrbJhCJ0rXfMFfFa6oYGwMZii+BMpVvbq6iIf4YWGpXfIJaD8JJubtm42tClcmWmM3YCo
 SL4sWmkQefmQ4fUG1JdME4Kf5j/yGntBAhKTEyDo95dwi4W+uU4L6bsfMgjESw7Rno234VPBCgb
 FL/9i0M3jhlpNdoZJ0WWfzTdeSV181rjGCPkVbXCz8Eykp7mKTl5vAPwu1oYKU8bZQ3Sg==
X-Received: by 2002:a05:690c:ec2:b0:792:6980:36df with SMTP id
 00721157ae682-7940a0e6fdcmr163020747b3.6.1769081508931; Thu, 22 Jan 2026
 03:31:48 -0800 (PST)
MIME-Version: 1.0
References: <CGME20260121132716epcas5p1cab4021fbcd469b95d13ef4b4adc757f@epcas5p1.samsung.com>
 <20260121132421.2220928-1-ashish.a6@samsung.com>
In-Reply-To: <20260121132421.2220928-1-ashish.a6@samsung.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Jan 2026 11:31:37 +0000
X-Gm-Features: AZwV_QjoLqvHF6D-uCiLDuYZPj2COvdDKLSisRRv5dl_OfsJAfAL5xesCMv0iw0
Message-ID: <CAFEAcA_-DBkPbb_47vqeOhtPrdHq5dOkbtBmQgVRj8aBP1kyhQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Implement WFE,
 SEV and SEVONPEND for Cortex-M
To: Ashish Anand <ashish.a6@samsung.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, saurabh@samsung.com, 
 vishwa.mg@samsung.com, y.kaushal@samsung.com, ashish.anand202@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Wed, 21 Jan 2026 at 13:27, Ashish Anand <ashish.a6@samsung.com> wrote:
>
> Currently, QEMU implements the 'Wait For Event' (WFE) instruction as a
> simple yield. This causes high host CPU usage because guest
> RTOS idle loops effectively become busy-wait loops.
>
> To improve efficiency, this patch transitions WFE to use the architectural
> 'Halt' state (EXCP_HLT) for M-profile CPUs. This allows the host thread
> to sleep when the guest is idle.
>
> To support this transition, we implement the full architectural behavior
> required for WFE, specifically the 'Event Register', 'SEVONPEND' logic,
> and 'R_BPBR' exception handling requirements defined in the ARM
> Architecture Reference Manual.
>
> This patch enables resource-efficient idle emulation for Cortex-M.
>
> Signed-off-by: Ashish Anand <ashish.a6@samsung.com>
> ---
> Changes in v2:
> 1. Added R_BPBR handling as required by the Armv8-M architecture.
> 2. Unified pending-state updates to detect interrupt transitions for SEVONPEND.
> 3. Moved the Event Register to the top-level ARM CPU state, since it is
>    architecturally shared between A-profile and M-profile CPUs.
> 4. Updated migration handling to be profile-agnostic so the state can be
>    reused if A-profile WFE support is implemented in the future.
> 5. Added CONFIG_USER_ONLY handling for WFE/SEV and tightened profile checks.
> 6. Addressed review comments and fixes raised during v1 discussion.
>
> Link to v1 - https://lore.kernel.org/qemu-devel/20251223120012.541777-1-ashish.a6@samsung.com/
>
>
>  hw/intc/armv7m_nvic.c      | 85 ++++++++++++++++++++++++++++++--------
>  target/arm/cpu.c           |  6 +++
>  target/arm/cpu.h           |  7 ++++
>  target/arm/machine.c       | 19 +++++++++
>  target/arm/tcg/helper.h    |  1 +
>  target/arm/tcg/m_helper.c  |  5 +++
>  target/arm/tcg/op_helper.c | 56 +++++++++++++++++++++----
>  target/arm/tcg/t16.decode  |  5 ++-
>  target/arm/tcg/t32.decode  |  5 ++-
>  target/arm/tcg/translate.c | 29 +++++++++++--
>  10 files changed, 185 insertions(+), 33 deletions(-)
>
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 3a31eb56f3..854d27e413 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -221,6 +221,40 @@ static int exc_group_prio(NVICState *s, int rawprio, bool targets_secure)
>      return rawprio;
>  }
>
> +/*
> + * Update the pending state of an exception vector.
> + * This is the central function for all updates to vec->pending.
> + * Handles SEVONPEND: if this is a 0->1 transition on an external interrupt
> + * and SEVONPEND is set in the appropriate SCR, sets the event register.
> + */
> +static void nvic_update_pending_state(NVICState *s, int irq, bool secure,
> +                                      uint8_t next_pending_val)
> +{
> +    VecInfo *vec;
> +    int scr_bank;
> +    uint8_t prev_pending_val;
> +
> +    if (secure && exc_is_banked(irq)) {
> +        vec = &s->sec_vectors[irq];
> +        scr_bank = M_REG_S;
> +    } else {
> +        vec = &s->vectors[irq];
> +        scr_bank = M_REG_NS;
> +    }

You already have the VecInfo pointer at all the callsites,
so I think it would be better to pass it to this function
rather than recalculating it from the irq number etc.

I agree with Alex about using a bool for the event_register
struct field.

Otherwise I think this looks good!

thanks
-- PMM


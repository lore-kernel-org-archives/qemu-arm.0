Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB77CA0ED1
	for <qemu-arm@archiver.kernel.org>; Fri, 15 Aug 2025 13:03:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umu58-0003mg-Cs; Fri, 15 Aug 2025 09:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1umu56-0003lt-37
 for qemu-arm@nongnu.org; Fri, 15 Aug 2025 09:02:52 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1umu54-0001ba-G6
 for qemu-arm@nongnu.org; Fri, 15 Aug 2025 09:02:51 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-e933597bc2eso361909276.2
 for <qemu-arm@nongnu.org>; Fri, 15 Aug 2025 06:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755262969; x=1755867769; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w22re+Hoza2Gbca7r8hleQFVG9f15iQIH9TKnxlpBto=;
 b=TvMTD+OUpe+roL06L0ITg7H7ATU/UG+NWUt5zcELV31oNc2szfLfj3vRnF8Fhuh0gv
 4gA27AZEhCC7eX7k7kc8YxupVjvtwggeRL3UY74KDiF8qWLyL1SwsDIMUJZI81oFaajT
 kpKalT9Q/8QDi9MkuKr6qjAGxR5wS0eesDBYr4BsorY29cfWNJgiTWWnEJBOLK9ARQ1P
 MYW9KfhXxp9Nvx+Wk9QFSDpjmxhtqRYHMXI9M945nOf/vhLP0u/9Tm4pX0/1LDxMO6XX
 RJg98Guk4NDGrc6ZMZG1UCYzRd9Zz5XFXpABxb7Dm6aQY/FIOLPlFy5Lj8GlhUqz5L8d
 S8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755262969; x=1755867769;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w22re+Hoza2Gbca7r8hleQFVG9f15iQIH9TKnxlpBto=;
 b=MmvihKKSDHOttXppoiwzLYtrUTkBwJJlTaoeaodFQzRqXhs3SYxOfwj1p4PU0oArtb
 v9fKtBzUSqoXCm0T3HZm9VuPsvw2vQ8GpmYeOhBctUDED4YsxJOwVK9MK1CevjABzTRY
 sDaQAcsqlaxja80jQQhxIbr+d21LLbHNCex2imj7eHYwic4oBf3ahBQ4e/Sf5kZ49gwa
 e52QkEUiTn57nAJhr67Iaq6h815uZDOg0Jbkyu4G+6CZI1NJnq6vbdhbRZB4nJNLwelP
 yepLFL5aWt+S+nnfX3xo9cuuLpzDIBbKt5Ra8ftNOjn0VKwyMDAfB+C/b8Nk4TCuvAe5
 CvMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqMFGt8JnG/T+hM+9Li4ljJ8JXULUaFW/yOALJ7AU2McMlWQk9YJxF2XKaB7m6ZB3xn06kbZwBZQ==@nongnu.org
X-Gm-Message-State: AOJu0YzZ3ihdtfznqk9SlP4rKrOfNUvsG72R/vr/jYnB4vU+6wqCF6rQ
 PxGDjiEdUn5LYUxqgO01QDtNFgXiAU7Zv/6gOS0ULGI90lwtaO3dArLovkF1l8OyqK+JULSw5JH
 ZC/JmlNIxWe+Rcp6ldNTHwggRU7oOLV4y6NBSrJ+QPQ==
X-Gm-Gg: ASbGncsLKIUu499kyJ+1IT8H4RTWzUlcvPFpmGv8FSvxk+ZrsNAN69/gd4zzWTSRdTU
 PG+6bAO5bf0bA9FCOMPA5N7jX426tE9gMq9pkJBM4mqFc9IjOBq5+Mp0SxUemxTfA96ovLP/AbV
 fYa2Zsn7n/WRtFbzJLy0kZbC/ktCcH3lx31XzWcLI13gwDDivXeCEcWPWqCMUsBdtmKW8Q+70pQ
 6lnUeKQ
X-Google-Smtp-Source: AGHT+IFgPmLvToHU6DKeXyQm40TtbpFKIkTWnMVfABEkfFWSd212vdbuZDFvl/0Rvb2cYEaI94WxOTPdwbZ+gpNYNqE=
X-Received: by 2002:a05:6902:300c:b0:e92:3380:3151 with SMTP id
 3f1490d57ef6-e93324dee4emr2513604276.24.1755262968614; Fri, 15 Aug 2025
 06:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250811112143.1577055-1-smail.aider@huawei.com>
In-Reply-To: <20250811112143.1577055-1-smail.aider@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Aug 2025 14:02:36 +0100
X-Gm-Features: Ac12FXz6iEn2eELmNR_d_sp_macSV45u-KqfnyiPvsDOQ6hyyvP6lL6ZB_ylNaI
Message-ID: <CAFEAcA9nwajcS_MQ9wN8AOWNhS_3Ch9gRHF0hbB2AdGqXpQXuQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/1] ARM_PMU: Trap PMCR when MDCR_EL2.TPMCR is set
To: Smail AIDER <smail.aider@huawei.com>
Cc: qemu-devel@nongnu.org, alexander.spyridakis@huawei.com, 
 zhangyue165@huawei.com, liuyutao2@huawei.com, mjt@tls.msk.ru, 
 qemu-stable@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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

On Mon, 11 Aug 2025 at 12:21, Smail AIDER <smail.aider@huawei.com> wrote:
>
> Trap PMCR_EL0 or PMCR accesses to EL2 when MDCR_EL2.TPMCR is set.
> Similar to MDCR_EL2.TPM, MDCR_EL2.TPMCR allows trapping EL0 and EL1
> accesses to the PMCR register to EL2.
>
> Changes from v2:
> - Squashed patches, no other changes.
>
> Changes from v1:
> - Some refactoring to simplify code.
>
> Smail AIDER (1):
>   target/arm: Trap PMCR when MDCR_EL2.TPMCR is set



Applied to target-arm.next for 10.2, thanks.

PS: a cover letter is not necessary for a single patch,
only for multiple patch series.

-- PMM


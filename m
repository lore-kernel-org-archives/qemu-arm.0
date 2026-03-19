Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E971091905
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Mar 2026 18:13:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3HsS-00089b-Au; Thu, 19 Mar 2026 14:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w3HsI-00088r-BC
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 14:13:39 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w3HsC-0001mh-Fm
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 14:13:35 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-64e8ae85700so1536264d50.1
 for <qemu-arm@nongnu.org>; Thu, 19 Mar 2026 11:13:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773944011; cv=none;
 d=google.com; s=arc-20240605;
 b=fRXuR2fClE4jA4ks/av/dliFdf4jUDwEIH+FFAoWtd6V8rmQt/jhcBZ8P8GuXWG6MB
 2/vqqFGr7iNdhA63DcVeyiypD3kTVe8e/E532NWhpCGQChx5OjYGpoYhEgbnoY7pf56H
 n/+GLYbBgVqYS8DutM+kkRsMAn9SUSM9xMvgECAe/VNPv1uwh+kB9Egvc/gdt5lxRjOq
 e8B2mbRBEL3C6XYH19RgEYOHqSQFMOWcxL/8AC1LVA0exJT8/pNhouwOK+sMtfjjXfFK
 6/DUghISebZi8/mjnopF+5Yz6S2jjIN9BcSFY8zKEE660LczyvLhCA5N/opA7qWSnReB
 F3IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=h6dUmwybOkzd+tc4CxA5WMU2XRCU4BR0Zfvfg3spHAg=;
 fh=7KjsOWCDl35lAm2CisPaWrRBlZQGbQy+HrAyv72hXgM=;
 b=YmqUEW2IYFiIdRdqeLwZ9n2CoF/MB/wOI7xOmAEoydhsZlR7JEbYfjaKS7460dzSF1
 xoJY9S/V3hurbobN6UBkzLU0QCqFT02xyJcayLih8vkdTXk7E3N7GtfDyrlwzJPxqSSi
 o56Ux1YcVN5gefggjNIF+EddRJjRupWplIKGDq+s5A4eysKAk2kSgl2wJBDG63O952AV
 bbq2I2tHJc0FPPYyJTVhP8tqEF7vaPvHRb/4mivqlkPvKMd+d/XJ7iiKzdeC5zFw1kmb
 JGH03Hqy3kSXupoj0FiOj5VecuQkqytaiTtK6csjMRqsh304c/NljE23l5btjCblqqFe
 EDvw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773944011; x=1774548811; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=h6dUmwybOkzd+tc4CxA5WMU2XRCU4BR0Zfvfg3spHAg=;
 b=qFCLAOUpanfCNG0TchDKpJSzf9ZV3U6jQ+4nF3J1ycp+qta6/uRZfGrcLKMzu5hOX4
 f1dMyFD0H608svtO8MmD6uZEpLVZbxUS9W7BvMGLVadnQwzqEl65QZ+iooFdTZCo3SHP
 LjeyEojn4+At7o612IB3952NyDT0ZauJIuRzOQYAhE3+Eklo1vPzzpmceq3JHDmNLGaU
 +afJNnzEM30cyHMfG8OJZ1KKkMoUIyaVCtrdFLKVubDmZiIzYKVXxTdaPrhFN9YVmcAU
 mX9LChEF4cpL9z0TyNsjCaDof4TmD1T/MDwpg3NjLiJaNpW9VwdEr6V0Aiwr1W3ojYi6
 X5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773944011; x=1774548811;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h6dUmwybOkzd+tc4CxA5WMU2XRCU4BR0Zfvfg3spHAg=;
 b=S8qS/OeqvdL1S9pDbTHGW+hu1py1FLtPc/1y74jsK36GefYPTPOoozbmBklqdItsG5
 M0XYoBkSYsleQvoy0NiRJhDCE5uR8FXYn+iahz2eB16gVujJbLJYMOFgJa5wRpKb2MUM
 aw27rQMNuYtRjk1WW6BTUkC4V1oCBPfjEy8SZyIhXuBHALSdE6Ae7mZ/U1f5TKmCNHJM
 +Mt1zLkR/YyHb4Wrk0ro5RIwwNBBRlFimkwx6BlGyrmDJ/k8jT4sEyMlrWnkHk5T8xzq
 vy0IfYchxJbqvCiQGbzE2+iyCVIj61rsIqOvcof/Y8yYq1pB5bdWmz3ZlNkHrPJf83ga
 EIRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxPJXs3kYU5RWZfLW3IazfeqQzR+2uShCeZA2nY1M8XkX5iKSNOkIiSqwFsHhoLkzFAUXpLsIkXQ==@nongnu.org
X-Gm-Message-State: AOJu0YzgJjLwX1VKc0+SWB7buLOjiZfx2fIy8ZTCp2we2uSrFHVaZFs2
 ItrWObMbLG+Jwobl65cdx++RqvJI2RArK+qpQkKzwpBB9AVYouXx5LPf4VbHFSABdUTDYvX9fzZ
 +DLWNxlZ1kfnU7t3kwO3Dqauy+z7XJuvmiaR+qOji6qegvwSDVqDxzZo=
X-Gm-Gg: ATEYQzzlrsyUNjmERaW+6hX4jLxjNDK+MqxIRD3wqOSMvz1RlPbkoVgEdR/iUfzL4wS
 brMOYIOoCVwBCdHw8aiC3DKQ7ZNGPomM1ZaVHm0tFGlI69cDBo3aTIH/bC8HkqnkHoAQWPNvsXu
 Dm4PtvllvoYkWpOsfSjFivBkYgN8CrJebfIgBCJ+ZVyIaN+ISXjY3KD7IRBjeECzSPzv3tv4PYD
 V+bsFApoVi0pnV/8kBhjw700cujTDO5bRZ5RUdmNdnCNtZiqI8NYhKMo3VnM5mOI4Pn4ieOh4PM
 OreFDtFp/O6I9rvurrggCbDAI4Ak7a0nHCEo10ThGM/4E4DeKkwUBpJEKfh77pu1yKY=
X-Received: by 2002:a53:cc0e:0:b0:64d:5742:5ab0 with SMTP id
 956f58d0204a3-64eaa7c3e23mr380500d50.43.1773944010734; Thu, 19 Mar 2026
 11:13:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260314221529.47841-1-mohamed@unpredictable.fr>
 <20260314221529.47841-4-mohamed@unpredictable.fr>
In-Reply-To: <20260314221529.47841-4-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Mar 2026 18:13:19 +0000
X-Gm-Features: AaiRm50gB-YMmG7ltq34QsEMJRsiadnSsSPzaN4F4omYbrcr72mPhnaAsjbR6g4
Message-ID: <CAFEAcA8v59wSwRvig6NRjWHyvBGY=gPhWFN1B_jD9k+aXqo9Ng@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] whpx: arm: enable more enlightements
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Pedro Barbuda <pbarbuda@microsoft.com>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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

On Sat, 14 Mar 2026 at 22:15, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> Linux uses AccessVpRegs without checking availability and panics if it's not there. Expose it unconditionally.

The commit message subject says we're enabling enlightenments...

> @@ -953,13 +953,15 @@ int whpx_accel_init(AccelState *as, MachineState *ms)
>      synthetic_features.Bank0.AccessPartitionReferenceTsc = 1;
>      synthetic_features.Bank0.AccessHypercallRegs = 1;
>      synthetic_features.Bank0.AccessVpIndex = 1;
> -    synthetic_features.Bank0.AccessHypercallRegs = 1;

...but the code change seems to be removing one as well as
adding the three new ones. Intentional?

>      synthetic_features.Bank0.TbFlushHypercalls = 1;
>      synthetic_features.Bank0.AccessSynicRegs = 1;
>      synthetic_features.Bank0.AccessSyntheticTimerRegs = 1;
>      synthetic_features.Bank0.AccessIntrCtrlRegs = 1;
>      synthetic_features.Bank0.SyntheticClusterIpi = 1;
>      synthetic_features.Bank0.DirectSyntheticTimers = 1;
> +    synthetic_features.Bank0.FastHypercallOutput = 1;
> +    synthetic_features.Bank0.AccessVpRegs = 1;
> +    synthetic_features.Bank0.SyncContext = 1;
>
>      /*
>       * On ARM64, have enlightenments off by default

I've taken this series into target-arm.next for the moment --
I can either drop this patch or else fix it up depending on
what the right thing is.

PS: for commit messages, could you wrap the body text at
the usual 70-ish columns, please?

thanks
-- PMM


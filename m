Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9F11125857
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Mar 2026 17:05:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0MzT-0005Yu-M4; Wed, 11 Mar 2026 13:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w0MyH-0004lH-2Y
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 13:03:45 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w0MyF-0000tp-L2
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 13:03:44 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-64ad79dfb6eso142819d50.0
 for <qemu-arm@nongnu.org>; Wed, 11 Mar 2026 10:03:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773248622; cv=none;
 d=google.com; s=arc-20240605;
 b=KN2rb1ta1EkNlCTi/kElO0xphPlOvxXv0I28j0Pc0JJRTZutOlEViYExQ6kdA3K1pY
 //18LzHueF+8jC1bEgw3uij35/dgVTdHovnsj3RTDwNpsw+qRzAlGQe7BE2HXjN3M2tz
 Cwrk/I7lUm8EBVymuRBArKEojW5q+BFpZkpDIWgwUlnIhjfVic31F9NTUrluGSpq8fd/
 lM/tTqIX0Ilmhy4R43/wbst4eUmZOCIL8yhZr1edNGydTcIFtA/EDXzKvZi04mM6DBe0
 2NDXsKNLw4gJ04eqA4q0RNyrUMmlqpAhTgolxb3B7W1QFJQJZl3AF3BMTr+kV9kOWLPM
 uRZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=RJnkcIquPOFwO8qegqW/YJg1YrDqow8L+C0wncK6ATU=;
 fh=gdMAb8iJxFaLZ0IunYWO+esunrB8lPUwsWxP0ycZAnU=;
 b=kXRTyM5k/l9noErMqTTwymNYEQ3u+qAvgHtfFmTEKMZKrubpSq5Et13f6u+1xnPBI2
 Ud4y/biQmTCV7IB6WnGVyJFQK62bhVGfUTta3qJs2ta9i/XEPWSvILfFjzx32Ewew+3Q
 Ko9K3SL0RJcoRin2DGFyWcQSxoJT108hAYZZvDH1bEkyNb7EwoywnvCUO0WKTpsrYVka
 mSO0vqDlJ0HwEXb/M2Im6eLDNHkDINkIKxpfKos/ZGKNE0GzdNX7K+RXT8Yc1IhGrfvK
 NHOeuWw6XH1YJkdc4w1G6rPZcHk2CYSJdLx7A2yl8Rx9NwAWhHzy8/xLS1MlQ7YsJqmP
 I5bA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773248622; x=1773853422; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RJnkcIquPOFwO8qegqW/YJg1YrDqow8L+C0wncK6ATU=;
 b=W3CnMoSKklnRqR+iruEfCNj4gyJCi46xf2ry1qhzWlb34kczSrNBdeO6ksGrEgmm7b
 /IjT1P8vhktbYBFNapB3tnH1KoijJmYjDCD7J9OHp2yR7ZdLaOTq0FBTkTwJZ/K7/NbL
 EoTws3uCXRmty23STn6HjZVnQHFZjcwS/ONyFLjr2ROXtaQ9+xIYPxARoAfz831/JW7O
 KSOGcsV9BuOjyTze0ks7t4VfcBM81phLmkaM0cLyzm4yI3ulgmBhqVK8DvVUem5qcDk0
 Cou9KNHSlyoomE5Dzu7wCz1Y+jn6MhaKsvGy9PhaWOdaZIZEGUuvHbr6N+df5Hr69Yx3
 R6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773248622; x=1773853422;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RJnkcIquPOFwO8qegqW/YJg1YrDqow8L+C0wncK6ATU=;
 b=q5OeYKmpkxAnzV/is2CX7bNyhsgO9oWmjuJR/GGSld4fIhGmgoGzUEYEwkLoBaa86V
 pcNz1LucbVNT532aqOsUpWWh5xTu0cM0FoKjbzw5mbJ0Si3wL0f/yRdN0cnDj6s58M/N
 ATZwGoO4/ggHfzhZVrDpVxjrTSSiCUUIO42kHpgZnm8gcHvzgF717v1qdtxFuSITQgxD
 BYs+VQnMj0MnpWizZE7+mhJCdPKqd4biYnqwllbiAvDktKpVR5X/4Hc2N8VgTOb+10um
 WNS5dCa7cQ+vyi9dspJSXzKsDq+2lxmsuI6BqyetG5tNMJ1SQAmN7KVtgaz+U5i8Y5tp
 SAJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5qeit851H55YPMo2R3cluLazPORRyK3QEYJZHCgAPU/cQR+x/a/oh8bAQLiVF77Gw3ZM//+qquw==@nongnu.org
X-Gm-Message-State: AOJu0Yy5TwMVjR0L6alzZBbyKqMthV4p3TreTCHdIPFOCHB5VyRbwzPe
 8o9roqfvuM2s3wqepOb5BUXCy8mLyIhcTeKJj1PNv/3Y0FwoCLRxTXGKk9eEl7INHmYmrIwQ1L0
 JM8kiidP3ALRvXak1nxLWSIDcBB+8b9euitkvfmGLMQ==
X-Gm-Gg: ATEYQzz/m7Sg9cmQA97UQIqs/XlF2Cc7eTuqOOFHg1o7qfC6pVwffkmRoUL+R81umlR
 yOt7msHwshaRJdj3OfZR4BYR5181oI9KybMhyOkLZR/idsEm8HLJuQOqd390BrV3pw5NpbrS74b
 tX1ZuegQlgcachpU7hmUCIPAV3a0MXtSzWwYGAh0SCijYGuxbqP7vlINEp1xO3Bb7/pJb9P5ozO
 kpd8ODMC7jr7jPAiN1tkL5+S7uqdwdiHEppJy3E9oRJeb3jNwFA0DcyAyhQZGmaDUQbikHqyJ1z
 bnHvws1+IjDMeeHIW5y8Ft8xyNkp57mNxMEu+C7PbnblhIkLMFIJcEIqRiZ6rj6uKeU=
X-Received: by 2002:a05:690e:d09:b0:64c:ed9e:2e22 with SMTP id
 956f58d0204a3-64d65823d64mr3091544d50.80.1773248621603; Wed, 11 Mar 2026
 10:03:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260311095405.26297-1-hi@alyssa.is>
In-Reply-To: <20260311095405.26297-1-hi@alyssa.is>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Mar 2026 17:03:30 +0000
X-Gm-Features: AaiRm53fXzB5o-jO-zwjARu-4kwiJI74QwIG80HyHBOohcZT9gDOVcJOmSsF_wg
Message-ID: <CAFEAcA8GCz2c18e3+bwFooAxYZzBrX3OjjQ58CWJOdLfTYL_dA@mail.gmail.com>
Subject: Re: [PATCH] target/arm/kvm: fall back if nested unsupported
To: Alyssa Ross <hi@alyssa.is>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>, 
 Miguel Luis <miguel.luis@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Wed, 11 Mar 2026 at 09:54, Alyssa Ross <hi@alyssa.is> wrote:
>
> If I create a machine with more CPUs than KVM supports, but specify
> multiple accelerator options, QEMU will fall back to the next
> accelerator.  This is great, because if I've explicitly specified
> multiple accelerators, I've told QEMU I'm fine with any of them being
> used to provide the machine I want.
>
> When I create a machine with nested virtualization enabled, though,
> this doesn't happen.  KVM often doesn't support it, but TCG always
> does.  The nice thing to do would be for QEMU to fall back to TCG if
> KVM can't provide, like it does when too many CPUs are requested.
> This patch adjusts the behaviour to do that.
>
> This is very helpful for OS development scripts that run an OS in QEMU
> =E2=80=94 I want everybody to be able to run the script, always with
> virtualization enabled because the OS requires it, but for it to take
> advantage of KVM acceleration when available.
>
> Signed-off-by: Alyssa Ross <hi@alyssa.is>
> ---
>  hw/arm/virt.c    | 6 ------
>  target/arm/kvm.c | 8 ++++++++
>  2 files changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7456614d05..0b63b2eac3 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2372,12 +2372,6 @@ static void machvirt_init(MachineState *machine)
>          exit(1);
>      }
>
> -    if (vms->virt && kvm_enabled() && !kvm_arm_el2_supported()) {
> -        error_report("mach-virt: host kernel KVM does not support provid=
ing "
> -                     "Virtualization extensions to the guest CPU");
> -        exit(1);
> -    }
> -
>      if (vms->virt && !kvm_enabled() && !tcg_enabled() && !qtest_enabled(=
)) {
>          error_report("mach-virt: %s does not support providing "
>                       "Virtualization extensions to the guest CPU",

I think there is a bigger problem here. The code in the virt
board init assumes that the accelerator has already been
selected: based on whether kvm_enabled() or tcg_enabled()
it decides things like which GIC version can be used, whether
"-machine gic-version=3Dhost" is valid or not, and so on.

This bit we're deleting here is just one of multiple checks
we do that assume that we know the accelerator already. If
we actually don't know if we're going to be using TCG or KVM
then all this code needs to be rethought.

Paolo, can you unqueue this for a bit while we think about it?

thanks
-- PMM


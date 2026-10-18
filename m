Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2908FCCA490
	for <qemu-arm@archiver.kernel.org>; Sun, 18 Oct 2026 10:31:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIOAv-0003ug-KS; Sun, 18 Oct 2026 06:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIOAp-0003ty-9K
 for qemu-arm@nongnu.org; Sun, 18 Oct 2026 06:31:28 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIOAn-0000jp-Ii
 for qemu-arm@nongnu.org; Sun, 18 Oct 2026 06:31:26 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-8ab395abf79so8669197b3.0
 for <qemu-arm@nongnu.org>; Sun, 18 Oct 2026 03:31:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792319484; cv=none;
 d=google.com; s=arc-20260327;
 b=HCSWElrSASec9hWWwY7nmQ1Y3Yu9duv/4YUuT0IJsX39RcMtZMXT29XgtYf7+RzVkl
 iSAR3t/WAZCyQGe85Djd0qhFJbwWjfmZTaj2ht4UCiobSuqduNBd6mWfeZj7bCicrK/Y
 XxqgaZHe6R7o41tmAYqL8J06edEzd+Y08ujvbeUnUHizWpDWY1kzqtkxTfDQiIRR7H/s
 HQ79DdWjv751oEAw3MQSOVbaLMHwBGSr5Oh2dWfw9CGASHykGdNtjm3A4mdG5G4+QbHb
 LQic6KJuOSgfjydI/T62ObWBDvH4XLlwutgPw6bR1QC7SR8isthKB9uaEiPOP2Mc+hlk
 kD+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=HvCn8Yx+NAEkWiIUuKPGId2U8Jj/DfBOaVXjQg2pY+0=;
 fh=Lp8zUoQMWbeXnV+eevQszrUgzux88hczEViZWL5uuxg=;
 b=RdUo59P8H2Ya+uL9OiJT20HIu+gUFTRMLPk2Opn9o/KHmj27oHXBl6k9ECOH6ukRdW
 p9ldy5eE/Dt0BAzbIjO1WIaRMcblvejFBHGCfPv5FI0EkUpthGU3LWQf2rjgpDMTq4zj
 UV7N8M4gHbvWRhwdKmq4pUUm4otqr/IKywFwKjtIpriXbCkkhW3FEMqIlizmmn5hKK6l
 pz10su3cg4K1ZXL+hOZERYKZEbeNxQz4JZo5VwUbxj88a8/JNEE6EmAc6qzOlxUQJ/8e
 jyQvY3+rz7zfDzXuRgzvdCuzWGQQUy0ZJZJJrQFsRz2oecfzfUpWmsBUGplALBxdplV7
 fhdQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792319484; x=1792924284; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=HvCn8Yx+NAEkWiIUuKPGId2U8Jj/DfBOaVXjQg2pY+0=;
 b=eKop+5YMzPBjboLApuqlrgBE5yf/fkMA+4RZV0W1ecLHUITbCWnwJ1p/OpT3vTF230
 mv6kHrMDY475JXvr2ypqIjENNIFRmtJlGSaZyYMpU5wKUsozwf0kf6ITHJdBEhX34AUy
 t2dHIVqZWEWqZJ7QfAATfQI/bIQMSPCbHuwHyzXSCJnkRkO0p+dqGbK64E5I2/DR0YjL
 yYZfvi5bJC2sk/NrEczsxWBjyP7Tyi9Bux2xTIPKXWyWJfGJMmtq2Rcy0ikfhELFICxU
 4NwIZkr+JfAb+uLhr2Y+ARIP3W87r8jlq5vcxajLaRixVzHxv9Khx3ixuXO27RJHf/UM
 3mkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792319484; x=1792924284;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=HvCn8Yx+NAEkWiIUuKPGId2U8Jj/DfBOaVXjQg2pY+0=;
 b=n55aBarqbl4fYfgYbs2FDmf2pwIwBQRBNxDRHZFP0YCBLjc7EVTaZBjdDXecgjGSgL
 7KrFfIQ5qq7o+dagAFlgiTImYxuRozhIB3b2ZSJp2Kb50kBw/D7FDHaefTHusyioNeOX
 7uIi8pkRrVNXl4LDt1874GSaq3AVAPlPLixXFeETa6yhxPmw+yAspoC208kI2l4mtn/w
 5nEAzCqgNRJN7N/ax8qDQEqc3VvRab2/wRBPfiv3shd/wfVeheZnpF2GMfq8fw1WS6ej
 O7NPYgPNzgNP6c+ns9QHqye4VKOPq3X6uX15FMYoQzP4UG4WJWw+mh6IwCs1/Qz1Ct7W
 nLvg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxj01QqAvN080PfTzaZzjSkbENtqTOf0xPMXiDMX5yWNEbjK5Hiva4d9aj0MylritLDe4FdOA+hQg==@nongnu.org
X-Gm-Message-State: AFq9FYJ1UQjIKjm9rR40W01QucFQhKxEJSekg9Ch9TmTRZo2BlMcyW1L
 Npdn5z9t3VI1+xzCHFY4AF+cGnjBisfYzouxdbQDGbN83UN2aasAxTyqaHgQ/FqsFNWmTGDEe8l
 v0pmEllhl4isbU8bruGupyY42YbS8qLk+yU6bZWwstg==
X-Gm-Gg: AYBFou3aVaR4yOZFhM6LfamRxC8EcXHoZW2DhSv4aUtd/R4k22SI5Ot8qfz4wGwYkCs
 E3YIGK/Xg7ZDxGSuMzQFNBc/AuUtwO+2rto1uv2qKAb0Pl/pTvHDl43bQW32acEaovH8xi0VJ/R
 hyDv6rTN5FU0B2ze8OjZ5oBq/kj/r25ueSQ/Ux1DT6gp5vcscU/LwC/MOxCRZDMr1JYLZI/fuf1
 6zTHWiKbhxOdOwxZ2VDNDi7Fo5NbS6eqlpjSIEVk0DCnz0lEW76Hy1886bF/8VGQ9woIJ0oOvYa
 zA7E7IvFfdS9cc5LxN0Wo3vUiyo6gtH8zNRqs8DEKRDW6QXbsCr9/kUh8uySWbtX5Wp/AcJ9aUU
 ll4DBdRPw1Em+qrtj5KFVRWYsgbqsZ20IE8FPIts=
X-Received: by 2002:a05:690c:a594:b0:8ab:6374:561d with SMTP id
 00721157ae682-8b0f218beaamr12196817b3.30.1792319483742; Sun, 18 Oct 2026
 03:31:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260918101158.42101-1-corvin.koehne@gmail.com>
 <20260918101158.42101-5-corvin.koehne@gmail.com>
In-Reply-To: <20260918101158.42101-5-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Oct 2026 11:31:11 +0100
X-Gm-Features: AclHuK9Chsnsi4n-p4DxZpfHCJzNikDdBdMt9qgoTqFXQJiHn7JmA1NLY8iy380
Message-ID: <CAFEAcA9GcQzUk1TUQaYydxRotyWNWSbqp_-bjHnfsrcE7jkzFA@mail.gmail.com>
Subject: Re: [PATCH v8 4/7] hw/timer,
 cpu: Add Clock API support to A9MPCore timers
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org, Corvin Koehne <C.Koehne@beckhoff.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Fri, 18 Sept 2026 at 11:12, Corvin K=C3=B6hne <corvin.koehne@gmail.com> =
wrote:
>
> From: YannickV <Y.Vossen@beckhoff.com>
>
> Add a clock input to a9gtimer, arm_mptimer and a9mpcore. a9mpcore
> distributes the clock to the other timers. If no clock is
> connected, falls back to 100 MHz for backward compatibility with
> existing machine types.
>
> Frequency calculation now uses the input clock and prescaler
> values according to ARM Cortex-A9 MPCore Technical Reference Manual.
>
> More information about the A9MPCore timers can be found here:
> https://developer.arm.com/documentation/ddi0407/c/timers-and-watchdog-reg=
isters?lang=3Den
>
> Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
> ---
>  hw/arm/xilinx_zynq.c           |  1 +
>  hw/cpu/a9mpcore.c              | 12 ++++++++++
>  hw/timer/a9gtimer.c            | 42 +++++++++++++++++++++++++++++-----
>  hw/timer/arm_mptimer.c         | 19 +++++++++++----
>  include/hw/cpu/a9mpcore.h      |  1 +
>  include/hw/timer/a9gtimer.h    |  1 +
>  include/hw/timer/arm_mptimer.h |  2 ++
>  7 files changed, 67 insertions(+), 11 deletions(-)

Where you add an input Clock to a device, you need to do something
to handle migration -- see the section docs/devel/clocks.rst.
For these devices, care will be required, as I think we would
rather not break migration compatibility.

This patch is also adding Clock handling in multiple places at once:
 * a9gtimer
 * arm_mptimer
 * the wrapper a9mpcore object
 * the zynq board

I think these would be clearer done separately.

> +static inline uint64_t a9_gtimer_ns_to_ticks(A9GTimerState *s, uint64_t =
ns)
> +{
> +    assert(!(s->control & R_CONTROL_TIMER_ENABLE) || clock_get(s->clk) !=
=3D 0);

It's not clear to me why you can assert this, or why it's an
interesting thing to assert. Similarly below and with the
equivalent-looking assert in a9mptimer.

> +
> +    return clock_ns_to_ticks(s->clk, ns) /
> +           a9_gtimer_get_prescale(s);
> +}

-- PMM


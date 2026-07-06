Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38225C43458
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Jul 2026 09:22:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgfWS-0005it-SB; Mon, 06 Jul 2026 05:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wgfWM-0005gK-Nw
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 05:21:48 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wgfWL-0006Ab-8I
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 05:21:46 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-664d4478a64so3780938d50.3
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 02:21:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783329704; cv=none;
 d=google.com; s=arc-20260327;
 b=nqltWnZ5PYlz76L9+937lGFBfCAmOIPeg0OkJRREElC5WGh9nzD5i2GYMllB3Wh/Wu
 DKRMJeVra+MLPV1YUkuXu93YJt0K2LKBk17CB2mIIalMsWfB9WrTdTeadX+wtgA1IY5X
 ynpPQDkqoNbsUWCzy1lHnrxxhuf6Yf1n3y0QH13yWYG1/SqTohqPYX414kgVJw2C+U/F
 2rqbvDg1+xPtyB66R7wb+QGmt4oDZMgG/4xlqSuA++7hvMdl8zUThw5uHHlWR9oCjwDw
 QnXgoj4w9a6Sk8kusu6xcccYFb8Wu4RzbChzBnXUI4L0t/DpNvl7cJxUtImZ06kp0bkZ
 SJvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=R7x48NwT96HfzMiY0/kj8VUVqa2ageysyCYZFuhCntQ=;
 fh=FTQ0RgukGTxzm7ou5p+0CYTXW/unOFVJZIAXHc1JOOQ=;
 b=c3FwzmaRwzJJIwm4mh4+AOsHzzEbE9BcQ7zGEkge6o7SymBOmtH86QU2fR/GdFZPUw
 bk3vEi1qFPYGjgludA5v7MaI/fUW1FAB2aP2ivLrg1CEIeOEjGkIAiNTMAB2wCJ3IHDQ
 Wk4umtmWX8uyCdI+MoiH7AV3eiTcGolqcmTLDTTGsTOsd41DGtDlqM+bTrMm+LK2EfE+
 zrRmAJYZ2DCVHg74FclEm17PInLwvPAk3LB8L1QP07hfbp7NIpBNT/Ml9NVZFnNAreFP
 gNju90Uxx+21AhqZhSMNbXJ0yH4mou/t72TGCP0Ey5nadGqtNJmcujyL0AoWvz3PUSjl
 Q2Hg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783329704; x=1783934504; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=R7x48NwT96HfzMiY0/kj8VUVqa2ageysyCYZFuhCntQ=;
 b=tnkgagL8XVXZ802wIlrTcC+4HQ55XUIRdpJhcLclHj79E6XhKhSq850f3BVAhSpHnn
 YC5tnnr+3M39POTgBIEwc1tYYImZbPsjRkB5rMoj2br9oV9vgP7tOOR7lDBAeRWtqZ8Z
 6c6N+9nlqEukE0jrNGN76lefIhrj8C96X03+2H+0DYXYZB5ENN02y0fZBU0F26KmHqk0
 NrDVIvzxd2LU9BGVDX9HG0EspfSvzUgCY3zQyzma/K9iXMWLvsz2pblZaKSNVfB/GJPa
 ka2iyLn1oBqOMX4Zf1rVS2taEcNNbe0O+QgFElAotFJKYjugKJmhb4ByZmCJQU672ETw
 3Rcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783329704; x=1783934504;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=R7x48NwT96HfzMiY0/kj8VUVqa2ageysyCYZFuhCntQ=;
 b=e7uQhagNViPzlOpNdMuxcJ2E3rlBJ3eKS+o/MxX8FIsmsfTpnUvtcm7MF2syUyDVnE
 KOZPy11S+KTSirq49F6t2pNWflk9YOoiM85sHzhVP3LltjZ/CZddpweVAorw7ZsGe89z
 EKOrcG/eij/axdenqixNAIJJ6dZ47X9+scrYkcSGS3tGaQbS71hZWnQkcBcb+D62EM1S
 GZO0BhSd8voAKknrfaRopEXXVIp62UT917O5p2QFpyZYWKCYrEYavtlR+k6SxZKl6Ipt
 Mg6IjTFazt6ggnmqF8vPl+t4l/FwsJ6C171fic4scf39d6PXxfKSAPEIULtJbxAlDGpS
 Ys3A==
X-Forwarded-Encrypted: i=1;
 AHgh+RpP5X6NQG23L29dA5PX6Z4gH5VgCwx4C3BoPf2bSv8n7pOnHzBsBfPqKSRlH+DO4qElicmrgvh/bQ==@nongnu.org
X-Gm-Message-State: AOJu0YystiSytPaQZcFgMzp+vMrvHZzsQLzKK+LI+/6YNGvjA2eBMPJ/
 G9vje5rulN+HZNHRIeJQp5l9z4TnCi4L5wkgDAC5Lr2McMJU71N0pLrDCaEK1JTpyvu4IDx96YY
 U0gbK4rhgGqo4+rtq64tuZPrB4sDFJxCEnDFzLJIh4g==
X-Gm-Gg: AfdE7clBgBcmpZIljGJfWkrCUdQ4KmjKNLpgYZibEle980Gc1uPpWidLxY0rANNUQtt
 94ZQuVSSh+I6Vg2TomQZTKqN9iBOGpze6Ab/AtlrLZi6JTF36wWnbA+Tf4PPKGogLgggH7++C3c
 be3s7hBm2BvLRu+rhHGPHpuOrSwtAsF/fwHfCDe98QoZ1eAZzn6jGfutYq3qCsJ5wf+TBdUDERv
 Wc/3dmuMXxM4m2P1vzjDW3ckf6RAhz97gtkIYnkCMLF1XqJSicjWB5GEZ2EHpGuL0E2xKlEV+i7
 zCh6DJbMNVv21amuCxxH0NAGj1FAJ5rzoI5B/xvnzg5JcIevG6F6ZJTj
X-Received: by 2002:a05:690e:d5b:b0:664:cc3f:e2c with SMTP id
 956f58d0204a3-66652f08f03mr7431034d50.27.1783329703133; Mon, 06 Jul 2026
 02:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260705224407.32464-1-gilles.grimaud@univ-lille.fr>
In-Reply-To: <20260705224407.32464-1-gilles.grimaud@univ-lille.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jul 2026 10:21:31 +0100
X-Gm-Features: AVVi8CdKJKgFoJ21ehlGPs4Mpr22KcLrVTVui7lCW2N1WbKFJ-UvHJgKwV1X-nE
Message-ID: <CAFEAcA9Heev=ydTzO2u3EzeF_2q7dytOF8=67qF8ZMMY6Ky2Tw@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: report M-profile BKPT to gdbstub when
 attached
To: Gilles Grimaud <gilles.grimaud@univ-lille.fr>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Sun, 5 Jul 2026 at 23:44, Gilles Grimaud
<gilles.grimaud@univ-lille.fr> wrote:
>
> While working on Raspberry Pi Pico/RP2040 support, I noticed that Pico SDK
> programs deliberately execute BKPT from _exit(). On real hardware this is
> useful when a debug probe is attached: returning from main() stops the
> debugger at the program exit point.
>
> Under QEMU this currently does not behave like the debug-probe case. For
> M-profile guests, the BKPT instruction is routed through the architectural
> guest debug exception path. Without halting debug, that path should remain a
> guest-visible DebugMonitor exception when DebugMonitor is enabled, or escalate
> towards HardFault otherwise. This patch deliberately leaves that no-debugger
> architectural path unchanged.
>
> The problem addressed here is the case where GDB is connected to QEMU's
> gdbstub. In that situation, firmware that uses BKPT as a debugger stop point
> should stop in the attached debugger. Instead, the M-profile guest currently
> continues down the guest exception path and may end in HardFault/lockup rather
> than reporting a clean trap to GDB.
>
> This is not specific to the RP2040 machine model. It is a generic
> Cortex-M/gdbstub interaction: firmware that uses BKPT as a debugger stop point
> should be reported to the attached debugger, while keeping the guest
> architectural exception path when no debugger is attached.
>
> Expose a small gdbstub helper to test whether a CPU is visible to an attached
> debugger. When an M-profile BKPT instruction is executed with such a debugger
> attached, leave the translated block with EXCP_DEBUG so the existing gdbstub
> stop path reports a trap to GDB.
>
> Signed-off-by: Gilles Grimaud <gilles.grimaud@univ-lille.fr>
> ---
>  gdbstub/gdbstub.c      | 13 ++++++++++++-
>  include/exec/gdbstub.h |  6 ++++++
>  target/arm/tcg/debug.c |  9 +++++++++
>  3 files changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index c3c944e965..9f259fc005 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -237,6 +237,18 @@ static GDBProcess *gdb_get_cpu_process(CPUState *cpu)
>      return gdb_get_process(gdb_get_cpu_pid(cpu));
>  }
>
> +bool gdb_cpu_is_attached(CPUState *cpu)
> +{
> +    GDBProcess *process;
> +
> +    if (!gdbserver_state.init || !cpu) {
> +        return false;
> +    }
> +
> +    process = gdb_get_cpu_process(cpu);
> +    return process && process->attached;
> +}

No other architecture, CPU or board in QEMU needs to do this,
so my instinct is to say that M-profile should not be special here.
Richard, Alex: how do we usually handle breakpoint insns for the
gdbstub ?

-- PMM


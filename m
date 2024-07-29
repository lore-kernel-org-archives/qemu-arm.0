Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1850496njb;
        Mon, 29 Jul 2024 08:23:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX9+EAu6JR4E7nFCuFApvBFZezH4/SpRVF6R50ucR/URDtNoSCMrQAnZUcQ/OHyiEws4E1Xz5AozwxmVcGtiPGER7OJMGl6
X-Google-Smtp-Source: AGHT+IHz+WoiwoJibEh+NrXaseKWO4tWPWCtK11Dp0SaCqpHW/RTxGt7Zc3lZMse2V5zd0JUgHci
X-Received: by 2002:ac8:574a:0:b0:447:d963:ebbf with SMTP id d75a77b69052e-45005c21b00mr129749771cf.21.1722266630836;
        Mon, 29 Jul 2024 08:23:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722266630; cv=none;
        d=google.com; s=arc-20160816;
        b=Ep7UmxEmcgAGIN6t0yiisk1GwUNSqeFyPxw2Jw2OfR61VMiyosX9E7jF4bTD/HY5D1
         G5bUJFsSBnxgB6yElpOe3ssNrzjlrr5cQ1ciPNBq7yEzLW8H28LSJLOtTkmeapU9kP9F
         NxJ8VtK6GGAlnAyOvNEQGVY443MDfioO8et/2Q02mzKbFsFDh+TvuUXeUovcZgy4Scu6
         NEtCAYTzeqcKAuo+xje6YudBujJUuBDzNqvCbVJ6eJ/YQKn0kSnMRSXOOQWUejhI1WUh
         /BUBCr7LU3HM3OLimw9T3a80mpUK4vvPddDbYgUq3BlUlKW+eGLwV/AkIeGZ+grpnmbX
         ty6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=qzM61U8fDoolnr+6t8nBL4raAeC7Mlar50RUt9YjfR8=;
        fh=1zfuk4YrJvoe/T+P93Pe/cyBzz5qaHYvMNktYKvqHm4=;
        b=u/wbmS2K7BX+bKWgTQtBsMa32vhwL+iQczWeH7hJzqIHc5ynwbmbRKem6Nof8JQLng
         M4krUWMoO+GDlpYYLUA9REUR+8wo+fQIgavXyfgEYyenMbSe1SDW/3bCPg9ES5Lr8OFF
         LONHpid/Kk0BRKEFvA7hZ4eJR830kd5aq9GNrXMxW0iXb45/or90dCmZvtWLXr1UTA+Z
         Hjohsd9J6rAgyq8BWgU+s20HDKfvBy5UphqLDx0RE8qnlb977nRmn29GjS6SzIy8yvrC
         3djP0frtamRDNdHSXID8Cpc+0sueqDVk4Zomk56/j9rDhT3xXe1wlnCRy4J5zNVkP2y4
         MSkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uycKZzGB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe81376a7si101490491cf.1.2024.07.29.08.23.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jul 2024 08:23:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uycKZzGB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sYSDs-0007Ji-0W; Mon, 29 Jul 2024 11:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sYSDp-0007Iy-Ab
 for qemu-arm@nongnu.org; Mon, 29 Jul 2024 11:23:37 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sYSDk-0007Pl-NB
 for qemu-arm@nongnu.org; Mon, 29 Jul 2024 11:23:36 -0400
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2f035ae0fe0so42068551fa.3
 for <qemu-arm@nongnu.org>; Mon, 29 Jul 2024 08:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722266611; x=1722871411; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qzM61U8fDoolnr+6t8nBL4raAeC7Mlar50RUt9YjfR8=;
 b=uycKZzGBtomJyMfCJvPtlAfyGVfyXgCPrpDJ9Zu3xmwNV5r0QWnYA3Ze4pZDDzegdJ
 QWEXR7bF509d9485qV2VTEXzYUr6DAXe2bF3DkzNUcYgZfQ9EkKqhZobMKqwyaQYvNyY
 rYwK3Yc7LIrzd6mvqd1SKDdMP4OW/bUroArEHWzPi3q/IuXP/Mlfu5O2LWc+2nkuShoA
 VXvx2xapjA4JpZt1tT8bpIN0Xa9WRtXWO1r4JcbFVLm6xqR0tSsSSvdwNnhdg3g5xj1Q
 5Du0FYd+2T9yEduQP3ShOM1pBq2UVYCrkiVEvm0uNx5e7YapjGvkdFASP56avwKIGoFn
 Hl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722266611; x=1722871411;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qzM61U8fDoolnr+6t8nBL4raAeC7Mlar50RUt9YjfR8=;
 b=tz81t1zvBKOsNeLqkE5jRGMxHeaUfE/N34NhbHOFWwedWdTRVHc0uHwPdu1hpD4JEs
 4O3jZc+NiXuPstFZnbQdF1RaKwsGsgQZ4GNeg5+nv7oKb79mx0oIAngw6YD2Va1YyWXM
 /JAOPBKQ8q5v7qtu9JbMuHA+Hjz+mBZSLoxftEyGT1rTCigGCZo7YP/hRM3xci52jR6A
 phemWq4O699K4hx3+3QRSnqPpRekMyYVzk0v7IoV2Q983G3uP7zraXB6N7eTqATIjJQB
 1pbrd6iBq6CEG+WkWaxTBkEzYC9OEr6qPrlnhI8c9/O9i43TyS574zpKT8ItTUSuwXo/
 SAGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB0HZmKyb4gGf3CgYufzN28cO7oqSD4Ur0Uii7wQ2Infog3qZWGqjao9Yz9gHDs/XY/AkLNImForfhdp7lANQ7aQVi
X-Gm-Message-State: AOJu0YyLwAWSHEQKbHZs5ZpzmETcFPsnXVtn1BdVqfbaForxwavoCUkv
 8hKDkSCT3Iom/HZxBd4elIUwXJgISNkcPg6HQI8q9NpK6HUQLCDmnlhVROkQ2Uv2BiYErjyffdU
 zit7pTznWLZr+pG9WuUSqmmTi7nqkI4TdvAVrg1xlOAO3h5PZ
X-Received: by 2002:a2e:a495:0:b0:2ef:232c:6938 with SMTP id
 38308e7fff4ca-2f12ebcae5amr53080841fa.6.1722266610591; Mon, 29 Jul 2024
 08:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240726055933.817-1-jim.shu@sifive.com>
 <20240726055933.817-4-jim.shu@sifive.com>
In-Reply-To: <20240726055933.817-4-jim.shu@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2024 16:23:19 +0100
Message-ID: <CAFEAcA-ZkcJvFkYyHGi9bXoPvqEzvV0b_z6xaQPLMK9qNHSdCA@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/dma: xilinx_axidma: Reset qemu_irq when DMA/Stream
 is reset
To: Jim Shu <jim.shu@sifive.com>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>, Jason Wang <jasowang@redhat.com>, 
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x231.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vDJ2yC3HcmGe

On Fri, 26 Jul 2024 at 06:59, Jim Shu <jim.shu@sifive.com> wrote:
>
> Current DMA/Stream reset will clear interrupt pending bit of DMA device.
> The qemu_irq of device should be updated at the same time.
>
> Signed-off-by: Jim Shu <jim.shu@sifive.com>
> ---
>  hw/dma/xilinx_axidma.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> index 728246f925..beb3fbf1d5 100644
> --- a/hw/dma/xilinx_axidma.c
> +++ b/hw/dma/xilinx_axidma.c
> @@ -177,11 +177,24 @@ static inline int stream_halted(struct Stream *s)
>      return !!(s->regs[R_DMASR] & DMASR_HALTED);
>  }
>
> +static void stream_update_irq(struct Stream *s)
> +{
> +    unsigned int pending, mask, irq;
> +
> +    pending = s->regs[R_DMASR] & DMASR_IRQ_MASK;
> +    mask = s->regs[R_DMACR] & DMASR_IRQ_MASK;
> +
> +    irq = pending & mask;
> +
> +    qemu_set_irq(s->irq, !!irq);
> +}
> +
>  static void stream_reset(struct Stream *s)
>  {
>      s->regs[R_DMASR] = DMASR_HALTED;  /* starts up halted.  */
>      s->regs[R_DMACR] = 1 << 16; /* Starts with one in compl threshold.  */
>      s->sof = true;
> +    stream_update_irq(s); /* Clear interrupt */
>  }

The general rule of thumb in QEMU is not to call
qemu_set_irq() from a DeviceState::reset function,
and xilinx_axidma_reset calls stream_reset. I think
probably the best thing is to separate out whether
this is a DeviceState::reset or a software-triggered
reset, and only call qemu_set_irq() in the latter case.

thanks
-- PMM

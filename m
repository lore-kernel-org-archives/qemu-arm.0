Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7A360A2628
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Nov 2026 11:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zbCV0zNY
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xUN1k-0005we-0v; Fri, 20 Nov 2026 06:43:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xUN1i-0005w6-CJ
 for qemu-arm@nongnu.org; Fri, 20 Nov 2026 06:43:34 -0500
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xUN1g-0005LW-8T
 for qemu-arm@nongnu.org; Fri, 20 Nov 2026 06:43:33 -0500
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-67bee1f693bso738639d50.1
 for <qemu-arm@nongnu.org>; Fri, 20 Nov 2026 03:43:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795175010; cv=none;
 d=google.com; s=arc-20260327;
 b=CJRBp4GIwhN5tv82G5Fxo6ovYYWVV3nRHWqIlweCHhb7RBpx1dbLUggX50oOM7vopG
 Xb4RZ7KofrOsAhVWsofa2wt4vjiWacSna/HcHvLuiYvjaeIp7GtR8nYzlQKVAep1eJtf
 xdVj5QnyFu36P1Br1NT7q3MDs3gTaR6FovBwX7Yzp3i1d8Yv52elGewanF9/H4IVA+rb
 xDhOpTYPk0RDP+fPy9jga2tabstlb77Rppxql5Kry1gdCoD6URWiq8BlEh5/r6Jt37lr
 H8fHjrAsUV1uPR4gWFoFw2yv5Owc0x0MQa9EjJqs1uqtETA9+2cAfNhandtYePuoEtM3
 ETRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :dkim-signature;
 bh=rIAhL2QRLoNu8jSsk6OmKcyR2LzJ9Hd6xE+H84MiAK4=;
 fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
 b=YZQcgHfTrZ3yoZDZQr3dPheaC3jhN/5Xo1FzZh0XDcK33W+H+2cxgPxr7SyH+Nwizp
 N81tUPVBhWPV66OGkhc7fPDD64GD2svaYfAUojS4OaiAVl36QsNysYLNBV+IeeDlkyV7
 b85joW3k/JcqgrXBSruqAH73TwDDp6mlJQm3BQDppO4FCE6npDYeIcXlvLiNrGrhI4T1
 x7WeJM+mtsfDbtNu9SyhpVPTYfVXBvWM6aXdf4xjL9ceOKs/x6OwBwYwRf7OAUf1wXiI
 zMJatGv8nk8gD4ra/M8kjBtcgAYNJOSqSR+WEMQbKtF/Z9SBB7//pGfbLlX0diq873Jb
 TeSQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795175010; x=1795779810; darn=nongnu.org;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=rIAhL2QRLoNu8jSsk6OmKcyR2LzJ9Hd6xE+H84MiAK4=;
 b=zbCV0zNYLSJyalgViQ3jmuOVcH9hDZl4fPfOomTUQQzw8YYxA8SOt4s/1XCWFRZZgY
 CWx8og2UNAwD+ksVRHs0Ntyi3+4boQrp7O2IpdHxPSvkCnezDPcQYDCY3DfynBwM5Hdl
 jf+RwMsfV86YmAGLpmvrFwp4kGn3NHOKr8iOSZqEMseEWrfBcvBR8yL9nG3QRruIn83Z
 +6lGfMeU1B29qR3dCzHpUdfjThq0CxR46vlGLjD/HPAl5XLVnrXwh2jxgU0JAMaMDWtH
 mXDoqkRTZO34B1jx2jSolPH/Kxt6DHYadcAyY2bsKQ2FZ0xNKqWsJ9p713L0tiSTfPbB
 msCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795175010; x=1795779810;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rIAhL2QRLoNu8jSsk6OmKcyR2LzJ9Hd6xE+H84MiAK4=;
 b=1g0gpeCGvLzlffiL95ENHzKITrxBa64w3vjUTLH1TjiDZx79WF41oN3fmO5ww+Ot6A
 KjLsrcdrvVADAAtTIsl/QlPoAdyMfZDuDOQYiiUaFsMjPfcRBSdaZI2aNZDENcyQCprC
 K+0wcawrZvH8s4nm6zJLFyhchKD8fR0gpXVhZ8tayUeMiK8Us8t3l58EYJ06H0swZ39D
 S25mp99kmWsOlbqe4S3hZOJTdnB+axpvgeNCVtx2GG+8DmULqhKTIhXKVtpeZQsCxwn7
 xeHVy3IyFiZIzlAa4zUBWaLfMttx/MAvC+J9UWHXXidlVhqJPoGWR+YdaavLVdVeGez4
 WQNA==
X-Gm-Message-State: APuU4Z9c3t8k4KgxX642hqmarLDjm2gvQffsnSxjoS9gB6cPad8+zGy3
 qQex8psXeW1whFz7Qv0YB35TZMEYiOSkR2l5wHV8RA/Zd4yfb/tH9t61GF5yb/Q0Gb4KX7NkM61
 fjHxXadj/n6GTA95QxLp5TUMtIkaB+JsSOSiAwwdLxoydF0Wu75Szs+U=
X-Gm-Gg: AZFdTZcFKQ9Bg+uKgNH9P0ZIfSrioAXsvVqg7CWsK1PLD8XmsHr9Yt7mU9goHNTSQTo
 fXsg9qvb7aS+vW5AcZCpJ3CMzQeu/hQjnl102KWe8nDAVCAr2EBz3Me8pGwdFaYT5YsRCheDbt2
 njGCwBsUQ8UJ9OLevwM23btjz3pe5JPBptp+FyDKRpfWF95k5BRCL+wbCuQqKjN0ILAVF5/9DjG
 nSlkzMOHPCY9b5NZwoSU4lQ+NPplRKKCztXfVzJVshKx9V678DHS+FUsv667ZmB3kAxGEqM7wdf
 PgmvFeqmrZkQTwFi1LMpjPd8o5Hp+t20OCGecAnpnCR/wzH/RqHBV8a1mQIgitPu4tU8CspsGKh
 ZNCM0Tk8LxBbBIvol+q5ymWOHYEGBhnlbpIuW/XQ2aI8KIOtHEBR9Yzo+m0S4yWcpuYjs8hfbCh
 9rYuwdxMnScismIwVb8fnN
X-Received: by 2002:a05:690e:439b:b0:67d:b729:eee6 with SMTP id
 956f58d0204a3-67df448e155mr932899d50.85.1795175010397; Fri, 20 Nov 2026
 03:43:30 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Nov 2026 11:43:17 +0000
X-Gm-Features: AclHuK8RBBchCvZA2BhzAKeH08qHmMqRGGesUMJD8ZwQAs0IQ_PH0soEx9Ls3HQ
Message-ID: <CAFEAcA_He4P=0n2j_DL7P+gDd14jXgba3jRmE_1uBC976iFPTw@mail.gmail.com>
Subject: Re: [PATCH 00/86] hw/intc/arm_gicv5: Implement virtualization support
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 13 Oct 2026 at 09:39, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset adds virtualization support to our GICv5 model, and lets
> the "virt" board use -machine gic-version=x-5,virtualization=on.
>
> Virtualization in the GICv5 is more complicated than it is in GICv3.
> This is because in GICv3 virtualization is mostly delegated to software,
> and only the CPU interface has hardware virtualization support. In
> GICv5 the hardware does a lot more of the work, so virtualization
> support is needed in both the CPU interface and the IRS.
>
> I've structured this patchset as:
>  * initial preparatory and bug-fixing patches
>  * add virt support to the cpu interface
>  * add virt support to the IRS
>  * remove the check in virt that stops the user enabling virt

> Peter Maydell (86):
>   hw/intc/arm_gicv5: Make IRS_IDR0 reads return actual value, not 0
>   hw/intc/arm_gicv5: Ignore low bits in IRS_IST_BASER.ADDR
>   hw/intc/arm_gicv5: Ignore low bits in L1_ISTE.L2_ADDR
>   hw/intc/arm_gicv5: Regularize spacing in config_readl() switch
>   hw/intc/arm_gicv5: Use cached IRS_IST_BASER.VALID state
>   hw/intc/arm_gicv5: Free memory in finalize
>   target/arm: GICv5 cpuif: Use arm_cpu_set_irq() to set IRQ/FIQ status
>   target/arm: Only allow GICv5 on CPUs without AArch32 at EL1..3
>   hw/intc/arm_gicv5: Pass CPU index to CPU interface
>   hw/intc/arm_gicv5: Pass cpuidx rather than iaffid in gicv5_get_hppi()
>   hw/intc/arm_gicv5: Use correct type for value in lpi_cache_get_hppi()
>   hw/intc/arm_gicv5: Relax QEMU_GICV5_MIN_LPI_ID_BITS to 0

Just a note that these first twelve patches are all now upstream. I
think the rest of the series is still fit for further review, but I'm
happy to do a respin of the series if that's helpful for anybody.

thanks
-- PMM


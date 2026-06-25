Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AB8CDB479
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 14:57:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wclVe-0000ep-To; Thu, 25 Jun 2026 10:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wclVd-0000eI-H8
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 10:56:53 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wclVc-0003F8-4G
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 10:56:53 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-662b95934dcso2709334d50.3
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 07:56:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782399411; cv=none;
 d=google.com; s=arc-20260327;
 b=F6mHS8tbvhUHudqJFEUimEUwHyf6EomnP0hJ+bBQV8eogAmwytIwCcdsrfVfynmAQ0
 egHzW/xFXb8qanE5b/r46Pj/84c4B414zgVGihrMC98WVKU2I/RGF3ZaeASD7NRtztVW
 yG6sPGul8tvgrQl6yPdUEL5YtyITY0GGHQG60IweL6uj3KXeOEYod8IfGKdmCnRHVizf
 GvItZqLgbVG6w4EMGchzUHu3zoV73lW8x8JZMO/UHNI0hcx+eq/gRyNt/b5h4qVlEThr
 zh/U7snTq2TTDa57Pzt/f3aEGZKLkEIyy1fHsyeCnAwPtjh/NdoaDqrEJ1HUNy5yYOHb
 LKog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=i/zCXl+P6RPAZgR9hjF7z+0cuHq30SL+nR/NueNuT6E=;
 fh=/XQDj6PrjHn+fEnc1dFLAU/F3kXOIzQL6Kh9ftIwIY4=;
 b=VkqZxm+cG+r4DZPNp2SAUv9SOyCYNJPYTBL6LEZL0bqjIspBs3iRw4OKFdiWJQ8H9F
 1zGhIhjyMQ8PHLTZ444Vqg1OSDMu0w7sJ0oDAbT7fVyqftTHCn7AqXXQRZpSzN9CBrRB
 PMs6CBNMNMhtcPUVVVCWerzlt2bnjWHy+gvZMGTmc1dR5/FaQs9rqtgmY2be4Ocv8kjF
 BRR0xlBGTf98dIp0fbaNy1dByY7fhQGnuf/Hv1xDcSvt5NlHNVtpPyXgZ6eurYQ8b5km
 Fd/eWhXOFYOYKG2Mwc0UBLzzC/LaIzJsKZfUL6HEYpIWqBheFSszVPBDAUJs9ojsXUMN
 9ucg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782399411; x=1783004211; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=i/zCXl+P6RPAZgR9hjF7z+0cuHq30SL+nR/NueNuT6E=;
 b=pK/gQQN8fDxAhZyyPkVEF2JQboL2qad1F2wtlFq8STeoXW5FLOo7Pl1q9UWc/ziy2Z
 g0LGSrfZtheai5yGEhRUqwhDuTG3cQKIYxs+J1gV0CXAb+huKMs4hbNIToVIF0ag3TOp
 YJp9e51XQAgY/H84PE8n0NBGOnHz0nC/v0G/YQ21Rsi0siRPRAdtU8cstvgWNde6uveJ
 q4xsBBF+4UVVVdEuEQjCeH2WmH4FILNkW3MLPvHobOvmgU8JTTrQcWToZgFlZZz8TGgl
 PVYIFJsNt/joRK1dN10et8i7oVaJcczgmebR/ot5aG9qSkI+SLfKZSq64fy8r5AolbFO
 kOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782399411; x=1783004211;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/zCXl+P6RPAZgR9hjF7z+0cuHq30SL+nR/NueNuT6E=;
 b=EupHr/X6iZyo6mpjDmIXJvoA8zOBUJtERE/y7KkVoonskx5B/VUzFTtE7tvmM0KcLs
 yupQ1+cnMpxLWhVkWyq25DLTAVB3Prwmba1iXcx/Dgw9VRjau1DYqs8oUlrNDRzCzwqu
 0iscWN2m7mRbtCFyAwdLAI/fetVuNePAzVPHv2XurX1FEo9kUxZU01XTMY1frL2ajFVm
 mUC60DM33GKG1z5Nthe9FCgqZ8YKa0sZvhCjPLuFfir6vjVyXm87dROsx7Jzl+lzhJRo
 21N/Og0E7LuBZpY7Prm0540ETPMUFtFlg1SvZ17gkZn8z7fa2r09SYYwdEZomAyjdM0T
 7jCg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr5t+X+jfF/u2ami9gW/IC2LFbz06W/eoHM5JGxPL3u+2dubXjvvlk1rd0Sxv/m9HXyL2FPT1RW/A==@nongnu.org
X-Gm-Message-State: AOJu0YzKt5jXNpiqo/xrLkhXZPV/czNKjUMQQjmpLVLY0U9lxY9Y24ZQ
 aX1Hw42hm6qxWSbIByvXuI2GjZjAyyAeVmD3saG2bztmJ1tkbUQUGivevICiBW9xfYmn66ZU65q
 T4ZK66ix8hv5jXMAgL0oY7shyi5I1Z+bfntMLmMsPSw==
X-Gm-Gg: AfdE7cnNgScwC9Pl+97gVo7sTFbdHcMu3QCJQyJnSEOWY6VfV7TaNkqymFelKHswCTX
 rcoltCJ/RbPgvzSlzuPgWvLo8C6ALN9WA4lUwyjdnHFk2yQ28axIayQtdNnYXiRKz2XJCAR/2Db
 J5Bfv6XevxJnBWvkPvLKyzjmHVeMerHSVj6gJZwxzu5Alc70uYWIyMJ4i6PgApWaSa+Zh1Zu4Zr
 7ZGOlrl6bd0U7hzqBoQUn/paGaLpKWDsheemBp8EQQzDjpOEmNLpcczA3ichxlsMroffBss/M9J
 hkl5EVtbHxx4V30pwBrlmIvOyi7J36WU77vWD/57JmJ3iF6rubOCFr2f
X-Received: by 2002:a05:690e:bc6:b0:662:cf48:c1b2 with SMTP id
 956f58d0204a3-66487dd13ccmr2185702d50.36.1782399410875; Thu, 25 Jun 2026
 07:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260623170354.43981-1-163wangjack@gmail.com>
 <20260623170354.43981-2-163wangjack@gmail.com>
In-Reply-To: <20260623170354.43981-2-163wangjack@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2026 15:56:39 +0100
X-Gm-Features: AVVi8Cf0SnjwXIQ1CTkOCAcv4qg3CRrPYKhZ3pvioTVadpdCugm7dlv0EnTdG9g
Message-ID: <CAFEAcA9fS9v-=BTSVM+BJg8V3hbFf7q9xaP3MMVFC04cFJ7HVw@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/misc/imx_ccm: Replace DPRINTF with trace events
To: jack wang <163wangjack@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 "open list:i.MX31 (kzm)" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Tue, 23 Jun 2026 at 18:04, jack wang <163wangjack@gmail.com> wrote:
>
> ---
>  hw/misc/imx_ccm.c    | 18 +++---------------
>  hw/misc/trace-events |  4 ++++
>  2 files changed, 7 insertions(+), 15 deletions(-)

>  uint32_t imx_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
> @@ -37,7 +26,7 @@ uint32_t imx_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
>          freq = klass->get_clock_frequency(dev, clock);
>      }
>
> -    DPRINTF("(clock = %d) = %u\n", clock, freq);
> +    trace_imx_ccm_get_clock_frequency(clock,freq);

Our coding style wants a space after this comma.
(Running your patches through scripts/checkpatch.pl can
catch this kind of style nit, though it sometimes has
false positives.)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


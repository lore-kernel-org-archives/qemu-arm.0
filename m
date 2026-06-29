Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF1FC43458
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Jun 2026 14:51:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weDKb-0003Px-3o; Mon, 29 Jun 2026 10:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1weDKZ-0003PF-Bq
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 10:51:27 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1weDKX-0006RC-Ne
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 10:51:27 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-664c6304683so1491280d50.2
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2026 07:51:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782744684; cv=none;
 d=google.com; s=arc-20260327;
 b=rB7FGgtolPXfi3X/yNJyOlKz9EXWyCTwa/U2FWpf2NudBW056Tel9f4kl4r3bCTOqo
 03ZQzWNN7yFSu/ewrWzl3JbVDkuOAXlexavqUbiCtmOubn5hmneI8sYy06nYZEeU4nou
 EeombDaPD13/VwosSrTRxCLLo83klcAqRlGgLV0eCzwAwZEOhgnyt7vI6SX92x47VBxo
 K2ltDf4LuZNx2NDLIbLe2mg01sVqpiueLjFDntOIJ8x3nHSs/eCcyT1x4c1IpwCvdjpG
 W4jdD+mieiRHipViGodiigIJHts93BgzswtjY0O+UvupZFm/54EE/x4JLrPPv7zCYl4K
 XgQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=tnNOR9XALSS/+ObunG4i4AC+ILmrrqT3An3XQPSAdsw=;
 fh=PWBmbQDWtVIVdSkAEcfJ3p08bFiFTi19aka40YOQ7so=;
 b=c8AgO25Nd1F7MNBcLk+F1ZaT7kJVTweqT9/6akplr5HO8NVmUThQhmp1uFpAVnykyt
 XKFnn7nXd1bbqikoeaq6y955qs5IccYQB1cxL2I+S177/qJ9kDVV535mKaWHEVhloS4b
 k/hg864u6xvuHz5BqH9fLs1kGCKZlXcrwO4H4K8nFgiFCkotYetAF5zMZxVmzv0JS7J/
 fhfXnSr3blW4cwM/58IMn5x/ePD/h0sQ510eP0N6E+iSbTiFMuMhmkTf3uyDXxBKkW1f
 i8Jk5oFHHRP5FXHqTD9gg7h9Ui3/A9YNkI8aJDQ+1+kN5te89Ih1CRYarO7OxC9RqQz+
 MjEw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782744684; x=1783349484; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tnNOR9XALSS/+ObunG4i4AC+ILmrrqT3An3XQPSAdsw=;
 b=G7e7oe9ptzx3MSVi97q99zDd31AUBpgtVf/yfr6Inu8XydUSghpVWsDqFVXpgYVc8i
 RbX9gIPv91i8OqRMuMP3WZ17OTGJGLGdZRVfVigQHtmm6rmwnOlPIFVndK0pZrG9ECDS
 DJcIJxysWyxtoKe4zVeoioVgdl3ehhPMY0cNm7XJzZ8AAN9HxSejvXkZJoFfUihZwA/v
 zjARPYyGv3INGpw3t1UsaoLwkDuWw1ebxZLeruNWD4ZbvSeCIlfS4s2SPNCjRxFonlre
 VKzgE6m+luNvfCLjG8Vf4dX9OcBLowVtbAVZ7BhsXm+ICz0gGvKbLvYdAeefoCX1GHpF
 gkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782744684; x=1783349484;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tnNOR9XALSS/+ObunG4i4AC+ILmrrqT3An3XQPSAdsw=;
 b=maHHvrFKwkiRZ+0Jp7IbGkOFBRxax/HadHgA9/qkdCTW/4vKgA2SX3WHq4Qz48TCCo
 7LmySlmN/JV+WIrUYBY8/JsMZZtKPMI3E/+VJQvLxZmhp8x8FEWjUukC3FrMlN8sI2R2
 ttoDnY9q8VB0+neIaDE231VBZEIw6sTFyCFGZjuJOSl8xXzQ1uacteOgnZm8an/bGXo+
 WmU2hUiJWVKXhesMum2305Qs1uXqv7odlxV861IfnikK+HyNNLEO3ab0GL6lT5tAQwSz
 ZwvvDBpXbZRSH+BA0DF+8NkSInNMloR+ex5WsWYWSqIk/Db3C3/ZZRzmlRg6Ihxe3RHu
 1yFg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr0XP6tn4XIQnl7MBcWV6xoovYToy0xLSkMqrZFECIQK/ficEt1Ag1YGX3rlNovLI62/42Co5iq4g==@nongnu.org
X-Gm-Message-State: AOJu0YwOaPQJG31t65MZ79j+SaV9ihUdnH7SwASOj83YbO50m15VrGwd
 KygKCuKACxbEisSZDHJunD8Hd8fyFuYfGVecPvWKfS1zTeDrjBGuMRd5yUyex8wRXxcBVTAWzd1
 f27tgfdJmHjMG0QIqlARVduCPCnYsLK82Pmp4ijZVRg==
X-Gm-Gg: AfdE7clwEZcNDuEkWl+pvHgSDCFA90HpFMiz15LqZRfna38RpUNoGSJ4PjjTsEnFS+Y
 wz8l9IQy/ntZh8RyBmE9IYrI91Gfn4K6j6dpSfTgg36tqZX/IQq1Dem/Pv6yggKDSEVoxGCs57x
 4CcqJ4f8OQ/g4Qa+K9eCySx3mCOPD7+a8UGyJttOChcdAb17BSjUN+BCRBBbq1+oG/PEeLZiryj
 9uq4RNcMh6amJPymTMD5BMDQaoEWVsCKiaop3rgadJ5zcsWLMNWkgZleJZ0+QHS8/7NXPMLTGL/
 k8toHIb00/3CXlGeNe7MTl+9KB32bXEeBbHc/ZVmoPv2cgljSBAVjZqa
X-Received: by 2002:a05:690e:4185:b0:664:efd9:3def with SMTP id
 956f58d0204a3-664f9746b5dmr6288d50.1.1782744684510; Mon, 29 Jun 2026 07:51:24
 -0700 (PDT)
MIME-Version: 1.0
References: <20260624102830.1355552-1-imammedo@redhat.com>
 <20260624102830.1355552-16-imammedo@redhat.com>
In-Reply-To: <20260624102830.1355552-16-imammedo@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jun 2026 15:51:11 +0100
X-Gm-Features: AVVi8CdLvrZcNbpiXupPUXApaSNcgo_GRpLxcSgg7N-88Os4Rn-WmmjUyEMdQ2o
Message-ID: <CAFEAcA8xYw-rKWLWMUkSgYJB_c6tbpvuiJ0KhgnV84Xa2ui+2g@mail.gmail.com>
Subject: Re: [PATCH v3 15/17] sbsa-gwdt: move all foo_REFRESH logic under
 REFRESH condition
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, eauger@redhat.com, 
 shannon.zhaosl@gmail.com, rad@semihalf.com, leif.lindholm@oss.qualcomm.com, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Wed, 24 Jun 2026 at 11:29, Igor Mammedov <imammedo@redhat.com> wrote:
>
> No functional change, just code reorganization to
> prepare for direct WCV load support in the next commit.
>
> While at it, simplify timeout calculations
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/watchdog/sbsa_gwdt.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/hw/watchdog/sbsa_gwdt.c b/hw/watchdog/sbsa_gwdt.c
> index 6113dcd077..5ee0e06af5 100644
> --- a/hw/watchdog/sbsa_gwdt.c
> +++ b/hw/watchdog/sbsa_gwdt.c
> @@ -109,22 +109,18 @@ static void sbsa_gwdt_update_timer(SBSA_GWDTState *s, WdtRefreshType rtype)
>          return;
>      }
>
> -    /*
> -     * Extract the upper 16 bits from woru & 32 bits from worl
> -     * registers to construct the 48 bit offset value
> -     */
> -    timeout = s->woru;
> -    timeout <<= 32;
> -    timeout |= s->worl;
> -    timeout = muldiv64(timeout, NANOSECONDS_PER_SECOND, s->freq);
> -    timeout += qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> -
>      if ((rtype == EXPLICIT_REFRESH) || ((rtype == TIMEOUT_REFRESH) &&
>              (!(s->wcs & SBSA_GWDT_WCS_WS0)))) {
> +        uint64_t offset = (uint64_t)s->woru << 32 | s->worl;
> +        timeout = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> +                      muldiv64(offset, NANOSECONDS_PER_SECOND, s->freq);
> +
>          /* store the current timeout value into compare registers */
>          s->wcvu = timeout >> 32;
>          s->wcvl = timeout;
>      }
> +
> +    timeout = (uint64_t)s->wcvu << 32 | s->wcvl;

It is very unclear that this is a no-functional-change patch.
Previously we based the timeout on WORU/WORL. Now we are
basing it on WCVU/WCVL, which only in some cases are set to
a timeout value calculated from WORU/WORL.

This needs more explanation at minimum.

thanks
-- PMM


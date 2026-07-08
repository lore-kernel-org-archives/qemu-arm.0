Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A62C43458
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Jul 2026 09:32:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whOdV-0002j5-4h; Wed, 08 Jul 2026 05:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1whOcj-0002ZL-5P
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 05:31:24 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1whOch-00038w-Ee
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 05:31:20 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-66780d9d901so522888d50.0
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2026 02:31:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783503078; cv=none;
 d=google.com; s=arc-20260327;
 b=BVmm84f/wp/xrMy5O6J62yqzu9BjzBtnFa2YpdG/Qlu/xE0RTY03KVcSG3NmAKPS60
 nnNKwZrMI7nqh4BY4wuEe9gfhBgB0T0ebQ4hl9DE65LD6+ZOCuZBvPjmovkYR0fIvrLI
 Tpq6f0Qe/H/9+Gw341gApEHoAZWQvlPOmLA1TES2LS/0DTR9Qk/UQf+gKvnfZpR+zVl1
 7aL0lBAP9d7tLzVaHVAOHCcpjYld2Ns4VuWVGLFtdrN6Emvu6Quhs72coj6NlD0GwzkL
 1cU5vawU3026PEjx4KCq+kDYXuLMKTamJyIjlnk2YSFUIXL+a6W2NdPxu9nKTa3c5tEs
 mKBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=EX4ZaBtThJEvn6+hTN+UCvMpKGavs3Nhi1CFUMs/Qvs=;
 fh=vFJ6lIyhb60y3Jklqn/58V2wAkOjc3lCpAkO7pRVnn0=;
 b=N6BOS6cVUiYmZwTogkDuVvaFm7m41FDwrQ0ffVzJuTclel/ZWsZ5fOcThwm8sXW09b
 ufTqT+liTfkZCj+AyfucvtH1ezH4pFYTDDkhKf9hrc5gs5YtyIoWXiaoKKJUZ41UgWpn
 SOkyBVShOYoSpL8V1x/U31zA7UcMHYnC3WHBL1Hb1R0iUotDkV2IereJARLvTdM9vnbh
 UQyuZeIVolpG/wAnKvDujwqhIdpK/UG4MAYojtcGN2m+qDKVgEJ1jMTbbS8HTMdY+Fua
 IKFYhVFKj0oPwzVY+daURdFuong/PxHZfU7Nb/9Imp9SSmEC97yUBHK89hCvLY4/fenk
 gyZQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783503078; x=1784107878; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=EX4ZaBtThJEvn6+hTN+UCvMpKGavs3Nhi1CFUMs/Qvs=;
 b=VfKjmzYzD+IuHj2gz/feIySAJcbpO4w8hnqfnIELtMKtX9pPSRXPnsfj2utWJ5rxCn
 33ztoJPeqURm/BTJRq6pyDljFDrHFRyomSfSScelcD9B8x5SgLK1QiUyBDsdPCgfrN4A
 kTfNDecQC0bWGuXTyiwOW5dVY6xKVHfNDPOUTxR2snWSqrE6WgGcXPEvwqn9fDNHgkEy
 DrZ2MzQ1PTutw+yrVifezQzaSPyZxProD5AaPcfP1yqqw8U6zcvoKf/DDcN3RKfWu+d1
 MwVbKumL2poqMLMe7CSgsPDvh76qJPO7IWWOys/hATzNC5GLuAWIOrqUjSFOt8IYfKiO
 CEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783503078; x=1784107878;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=EX4ZaBtThJEvn6+hTN+UCvMpKGavs3Nhi1CFUMs/Qvs=;
 b=W4lHm4kZ1I6AV+mZsJF4OB00aMM89y5/mmj1f1Qso/H057aTH2WvPK12WjX5t6R/Wk
 ijp8nKLB25C5A17GMQsu0KZBXD5550OCY70peIjM7YB/vHN9aCm0djCMqTmzaYutPRU5
 vzpm1WtuLaG6qANbYskDWe0G5KzJohdN/JmucCEnUrRHfSHaEFOrFUhmpxXCCpQ7o6u2
 FigDBI7VIUygFPZ9TRcrtyfd3067cDQPv7L6AMSRPzTAeD+IIxX5PBDcoGFZLjVIIOle
 w7fofgatKd6hMz/WPaDDfdPG7QstA+IrxgcrKxUKSU7dowTKtkPWZ2CWiHNw1ZtLN0q4
 CeCA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqOTlPJhT+SfRuju7kYK4NmOMd/1K0/TIrYzcCcZL+ivPDQW2h5YFs6Ct30gXReSVoIFaXQHuGQTQ==@nongnu.org
X-Gm-Message-State: AOJu0YyCI4/6WGtke0eCmU3nYGDMDzHyD28NQA7WC2gTigZjc4ADy8UV
 4SHC5eJFi44fwZ3wxQyJVNXqpUzxdnmHsZTn5V7pVX3wCuvOU3ggqYtgELLAffU1KjTJNYvtFUf
 Mrg7MoV44XgsEebzIgXScFJ7xjlW5HpimCUD7mmd6lg==
X-Gm-Gg: AfdE7cl8Bk/2zOcGIlsHzJVa2RryPTtVvFlIgSKhHP+pFluymxM+TC4WN3AbTp5Gkw+
 9moEShrrb7zQhEDD6cNRTQarIlAmTdUso9zENb4TTARrnWaJ6uUgv2ErRAjYeiEFChZ311ZP208
 iRUNHPR1gbbbWaMGsxDkUZJBcvXsXEk8wANlDyN7o24NbwZ/w+5j77KxE68046j/8uy3cHudTxX
 WTwF9bb8q/essquJgBSagsSqFRtBrQToT2IJ6I6i3I8Zko9zM/ExiQfJtf5GpX5GLRY2x2tNU+N
 gjwWRbqUxFSvOX04dMpOcqBdXKtwGs3gb5XuUIP1o6oFN7fXuuv9hSus
X-Received: by 2002:a05:690e:419c:b0:664:85c8:f14d with SMTP id
 956f58d0204a3-6679f00e56dmr1125222d50.14.1783503078021; Wed, 08 Jul 2026
 02:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260705224407.32464-1-gilles.grimaud@univ-lille.fr>
 <CAFEAcA9Heev=ydTzO2u3EzeF_2q7dytOF8=67qF8ZMMY6Ky2Tw@mail.gmail.com>
 <a14481eb-9eed-43c0-a29c-187798f7f769@linaro.org>
In-Reply-To: <a14481eb-9eed-43c0-a29c-187798f7f769@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 8 Jul 2026 10:31:06 +0100
X-Gm-Features: AVVi8CexY1mKLXsWQsBsTgJpCsEZNagGTNEMRorW1Q3F8zPTODj9WYFoHZawm9o
Message-ID: <CAFEAcA9x7tjW9xuT_XwNntdvoVtLrCL_PB+50tfhiW2XDvsCiw@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: report M-profile BKPT to gdbstub when
 attached
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Gilles Grimaud <gilles.grimaud@univ-lille.fr>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Tue, 7 Jul 2026 at 18:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/6/26 02:21, Peter Maydell wrote:
> > No other architecture, CPU or board in QEMU needs to do this,
> > so my instinct is to say that M-profile should not be special here.
> > Richard, Alex: how do we usually handle breakpoint insns for the
> > gdbstub ?
>
> We handle them via CPUBreakpoint structures; we never inject code changes.

I don't mean "breakpoints that the gdbstub requests", I mean
"breakpoint insns that are already in the guest code that get
executed".

> The patch description explains the confusion: this is attempting to replicate a feature of
> the Raspberry Pi Pico SDK, wherein a guest BPKT really is trapped by an external debugger.

But aren't breakpoint instructions of all kinds typically trapped
to the external jtag debugger, on any architecture ? I'm a bit
surprised that we don't do this already.

thanks
-- PMM


Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B0E1125854
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Mar 2026 17:08:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0N2q-0002vP-BB; Wed, 11 Mar 2026 13:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w0N2o-0002re-Ov
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 13:08:26 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w0N2n-0002CC-1q
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 13:08:26 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-64c97997b0fso89117d50.3
 for <qemu-arm@nongnu.org>; Wed, 11 Mar 2026 10:08:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773248903; cv=none;
 d=google.com; s=arc-20240605;
 b=DcRogAowxvlHoijZrZDRCvI5/mFGscP3EToltRJrlVgRb4N1YqYNIbhzLXkiJo5k21
 TaR/7flDspiRQkPIpBv+4R3T80l2EHlMp06ZPFPrtI0AyrCuNtCNkDjpiY4IR/VGb2Eb
 SDAeHH5h7+v+w6GTwXwiV41edhPA0v3XWV9+w3jKy6UWicnmCkZ+Jn6NnHYkB3AeWqtw
 u5eY8oSxrsoToV/7RiZ7pACw/ZV9+5PxuRiTMmlCbYO7n4f496Wy0jGjQGNnuPiRBpH3
 Br0g6ytA4546a46Ba/GBg16sdAJjxdNUO/a3RAtyk5zF5Dm0Esf6IUWc9u1qLmkcc+Yr
 4WKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=oQ1ZQmTD+aQlp7Z0NCEYxNdfEv3Jy3pEAuTnQeKwK34=;
 fh=tLP/gRpi7Iczn5ziGL7f2zBG1RdOSHMz6mExSpHcScY=;
 b=OV0YopbFNb7doyFIN5otcA+zREIgkAZNyV4D8yHfqZNU9a0YeBlhn8U5908ioaUhsH
 +Y1SdXPvidSXYGWTPhnTGfa0HEkJ22LIwcWKpU75GRfNyzGl7awmX22FFSfCWcZITUxe
 C2GrWFZuzoCEy6v2G6YxG69oUppLY0jhDpr2ZXJu67l0l94BfdvfulcWo3NPpktNE8Ff
 XABQgvmtwbHx7Wu4BpVGgiLDSQaumBkifg3Ethr6KNqI5lC2Z5nnxZyHzv3b56FSfzOw
 Fx+2hNZWZoUZYLH7vYn9kfe+iazdO33J24b6Nicgf0xV9O/3h7yS1eRRoIdcGg1gq0Hn
 uR6g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773248903; x=1773853703; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oQ1ZQmTD+aQlp7Z0NCEYxNdfEv3Jy3pEAuTnQeKwK34=;
 b=Kb6tAi2hbKUv2I2QBxhlvPCueFBrrXoNqdEnAMDpnBS2wrB2Z9EweL6eGKSxhGA4lV
 SeMvSKO7fDwsxc/DSXexU3GJpIKdXOLaiib40DaZy24LVfIhrFYgvE5nRRfnLiT7WC8z
 MRb3+ZqSMuG+JVUCvbSndwCEX0I+CidB7XmlYkyDGLpkwZMmS5hX8tse1A8KFNv4Y3s9
 kaSPQ1ceU5h/AIux8G7Y6K/DjJsRIuD38DZojgfjlHPS7X6drGbrNrzP+NbDdQeE4pK7
 MWCKqhZl0Rh45eUokKRcXesxJbhOldCLR9Gz8kcgFeOK3nlMXyBR6KHMEC+VDJ2Z8IAV
 vTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773248903; x=1773853703;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oQ1ZQmTD+aQlp7Z0NCEYxNdfEv3Jy3pEAuTnQeKwK34=;
 b=QuQi/ED/4APSS/cuxPiQ3xu9FJ62xQTXmJ2FbbHTVJoM1EONgLdAqjUlsPzztqj5nF
 MjYEb6rQEt0Erdl5zQavYpcPUBJdGeEQoJD6shHlkUyATCu31+4JZCInrm8kC/oQUQKN
 gkBMqh8urxt29YlKfKnOTZ5zAY0DStxaui9E4dgykJ1YMcmPT7vBen+jCopIOL+h4qqi
 1xrtO6Q19v4tE9H5KSXNFZ5xNNQQPrxyHmlGpobWdPDAAwt3SyZSVjcKd3izaKMrtkee
 OaRI29EMukaZ9SHgzkd7JtZG09cErrWkFcg6BkcUJutSQs310VDd48vZQ/iDsnan+7Wx
 0ltQ==
X-Gm-Message-State: AOJu0YyTtX2BCkBIUsII8l7l0kuVd7zfd9qrfDcnm6jt4Ip7oTuLpmvv
 WLrqDOVRF3elzYSfG10aYE6ZdOJwrxM84B7k/be444f4uUtEDwgoC+2yPArq7lf8B+qoNtSFCoJ
 hrUgIldQBw9NsbkivE5e5pxcyWDBS30orBCMVSJfhLw==
X-Gm-Gg: ATEYQzzQvJZweGD94ZuSO2xcSkvmp+c29ItcJnBnagISpQ6pb4BFlFjPE/i5kLvIoLC
 mSTS33AFg7BEeKeRXtJJyfIqjQVIShBySQksL/YXIIcXzSJrY6NMJmhdqcmDCrllDqelmp7qKbA
 wHxGqWRm7Pj7g1EnuRpftfbM+ZlR1ZS32SR+ygkDqZJfx3ROD6xN/MTIdTfejNwRkIKIpPjDZ1O
 zvB0gO8Yz9mN9kRGlMEOp1VWvibEZVCxvgD20D8iCUbx/++scVIxrBMIVm19y7Rye3zP+4pluY9
 eJ/FJdZi2uTmnMcVC3qNGOZAUCJCabS+RuE6BxAsbOi+/3YDQ6UJlBS3A33vIDrnBbw=
X-Received: by 2002:a05:690e:144d:b0:64a:e142:a097 with SMTP id
 956f58d0204a3-64d656f7018mr3257779d50.24.1773248903342; Wed, 11 Mar 2026
 10:08:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260223170212.441276-1-peter.maydell@linaro.org>
 <20260223170212.441276-42-peter.maydell@linaro.org>
 <20260311165151.00004669@huawei.com>
In-Reply-To: <20260311165151.00004669@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Mar 2026 17:08:11 +0000
X-Gm-Features: AaiRm53foUcrHGH73x4RHe2nJMuFFsFE8-8eJqoxcq15DCycxkunh_KpQayP2U0
Message-ID: <CAFEAcA9UOGk3WZG3Dx5NmEAd4DUY0o+hnPo0+F5MGeMTcAyS1w@mail.gmail.com>
Subject: Re: [PATCH 41/65] target/arm: GICv5 cpuif: Calculate the highest
 priority PPI
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
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

On Wed, 11 Mar 2026 at 16:51, Jonathan Cameron
<jonathan.cameron@huawei.com> wrote:
>
> On Mon, 23 Feb 2026 17:01:48 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > When the state of PPIs changes, recalculate the highest priority PPI.
> > In subsequent commits we will use this cached value to provide the
> > HPPI info to the guest, decide whether to signal IRQ or FIQ, handle
> > interrupt acknowldge from the guest, and so on.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Other than struggling with the reference, LGTM
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>
> > +/*
> > + * We keep track of candidate highest possible pending interrupts
> > + * using this struct.
> > + *
> > + * Unlike GICv3, we don't need a separate NMI bool, because for
> > + * GICv5 superpriority is signaled by @prio == 0.
> > + *
> > + * In this struct the intid includes the interrupt type in bits [31:29]
> > + * (i.e. it is in the form defined by R_TJPHS).
> Not sure it matters, but the particular GIC v5 spec I'm looking doesn't
> seem to have a R_TJPHS (I happen to have EAC0)

Hmm. It's in the EAC0 download from
https://developer.arm.com/documentation/aes0070/latest/
in section 2.4, on page 32, second rule from the bottom.

thanks
-- PMM


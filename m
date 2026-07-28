Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC773C53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 09:02:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wodhI-0007GE-TW; Tue, 28 Jul 2026 05:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wodhH-0007Fg-77
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 05:01:59 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wodhF-0007YW-H8
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 05:01:58 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-664db84f074so4660806d50.0
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 02:01:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785229316; cv=none;
 d=google.com; s=arc-20260327;
 b=g7Ho6ACXnn+v2cmExbuOziEuqswwJX07sFmpKIrukR7bq/I1JHJS0hONuXAClZknyo
 wEXz85z0xZeGTHsfc9j5dhd1ESdLIqMwyBVBtxubrF9lGPU+RcgmF6Gf64GcMEEaPzMh
 JfO7kVtxKj4tmY/UXTk7yrfyRb1gGDVNj/CLWE18Y75JPs5AYyx8c+pxCQlhrCPGANX8
 +NWt8kZPaC9UCWzoXEf0JVkgV0IrC+u+I93SO6bZg6Wmz9s2rtEPFebA+vzL2eWvTZD9
 ox0SmHTXgdmgKqvgfdBi4vj91m8niY+j6C5ysA7b2AdTnKzl3JsQU/N+hkyDrl2/lgHT
 ukpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=/O1e1QgCmvZVbsVP7BYBNHDqnpIPp2EA9lqFhqaqi/w=;
 fh=X/0M8Hipi4oCnDiC1rXYRLNAP+KGnuM2DB3qE81F9Nc=;
 b=hn3Ec5sHAEuRj+rQuRoMUOwTILm+uZgFHSZDAaZhSwl9DgSECtUAGeVAzjuxiJ3F8r
 RXQayUrfsBr0doph1Z63khLO5EP4vHe4AvdkIR7NAsDdtCO/5Mad1+piV8KntIvbx+5N
 VoxsFjfWevR7L1Nz8kBFcOZSYQkIGDhibZ+df5hBxTf7qNc3nVNaRmkLbmxX+un38n3a
 cmhWXelJB2L4Lj+UEK6zqbf9FUDurjZRgwSO1qKYFT5zfitUTJ/T6UYqol0qGtdwX0Go
 QAi39JUwK5zO7wc0NqrP61mWl+n+BPMNUhyG3/Woc4Y3D1YYnDT6qIZ7BrB7WOeMyHF0
 Ghtw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785229316; x=1785834116; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=/O1e1QgCmvZVbsVP7BYBNHDqnpIPp2EA9lqFhqaqi/w=;
 b=PspjOYpSu7+Y/tnJLW6qkrqDXC9Pw7lVR1F7CXl4R9zwgIYLIK23n8CA8nS0A5Havh
 t9B8YjMbZXwdFwLo/KW4c03sugLHRI+oBkG4FRduRvVAyfrDQxSiSkW2l2MGag404EhA
 uTFY9TTIyywNtJ6QwLmA5L2O6q+6uUSulGEWCp9vzm6glYfOrV3mElwQ2ND+UBUeciAm
 GhPWZqNZPEW3SrLpJVCqm9uRN/F8S4VZv9/K2DuOvzwfNH3kTZ2SIvm2cGCSawI/d6jK
 QzoXRse/djJIh7XzstqeSNTULipn6TB/lE++O0/AOwx/C0TGAoRqQ/6XkTSgEp5/lBGK
 8VrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785229316; x=1785834116;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=/O1e1QgCmvZVbsVP7BYBNHDqnpIPp2EA9lqFhqaqi/w=;
 b=h3L2hwjdGMVj3HlOPyhk2EudBGPDcDDA902JoI4fqw4fwt3pZ4w80nMLwJvPWPFKr2
 TnXb0H68t+vmzPHUnvy/O2pZNJbRbkj2ToS3q1vbDP3Hv/IR99o/FK07OUR10auBNbLs
 6JBcfzXAWjQ/DV7A8T9ty4jZZ7O+cJKhEDltRpJQsCEP7SywKoS7DRudvu5r5TrAkNZ2
 yZsWFkEYeDJFNmqMW106/D43aMmBArBYs1jQjoHW5weBCGTWg6n/ilu+5UWiMQvGvozj
 41pPUGgnu7Fzl55NFW4i/QcWlXJOdYDVWhLyiB7OIeeX/6GOEagZz9rpEMBAwDpk/PlY
 nk5w==
X-Gm-Message-State: AOJu0YzX2jCUSmTAo/zJvRmSiELq+xZS1goYaOxnmhdvSDkh8rNf0uss
 ZmTIeqffEz8CphzjHlkgHPkQSVJqGRDs9IsZKvtO5acQZVUX88Z/s44T2EwuQieAcwGmOp+Bt+j
 yHXzrvIRraYxAYwj+hCTInco+PkAZtZgbEP1eQiJrqg==
X-Gm-Gg: AR+sD10vzpx3mO513Do2j+eSLiYj9epk6bH8SoT+9KaZ7AiREqEtHyrosEy2LmpBSmK
 aYJjKjsm2J99Wr0npgrl/rn4qTYGVqs3Ov6+5o39r35A2zIPQX53p+D7CeiBpMXqQRgNvpXK36s
 EF3WGHQV6+VuD96110m57XL0Pzrp9X7ooS1ordyR0d7y7U5seLMtyYCs1UrXuU78LQl4g6UcLBh
 yfkBev3SlmMwzK3008NY9ki3hbZVCN1DlbDInaJ/biGvrArnPhZC2FP+iUmv2GIQK8H/sGHbUkJ
 oyDAHaDoz1LG6zjTCwbKDxSv6GDAtzHHJZLyasDpAumJCw==
X-Received: by 2002:a53:c70c:0:b0:668:111:b895 with SMTP id
 956f58d0204a3-6690580e328mr291405d50.83.1785229316193; Tue, 28 Jul 2026
 02:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260727032649.145381-1-gshan@redhat.com>
 <20260727032649.145381-3-gshan@redhat.com>
 <CAFEAcA9_tDRAd97z4UtNhFPK+fMbq37LJhWTSmD5cueo61hvvg@mail.gmail.com>
 <0a384d67-fc56-4a21-9d0e-25f218a45228@redhat.com>
In-Reply-To: <0a384d67-fc56-4a21-9d0e-25f218a45228@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 10:01:43 +0100
X-Gm-Features: AUfX_mzZaSlhFOGmRL7hAVNwbkrAj7yyDQ20dte6sSEpFsYt_seZpNpIhuS5X60
Message-ID: <CAFEAcA9HbTSj9cJfv8o=jYSuPhScr-RVKWCos4kpUJ+T1S6g5Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] system/memory: Use qemu_ram_move() for directly
 accessible regions
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peterx@redhat.com, 
 mst@redhat.com, philmd@oss.qualcomm.com, richard.henderson@linaro.org, 
 alex@shazbot.org, berrange@redhat.com, philmd@mailo.com, david@kernel.org, 
 clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com, jugraham@redhat.com, 
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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

On Tue, 28 Jul 2026 at 04:01, Gavin Shan <gshan@redhat.com> wrote:
>
> On 7/27/26 10:51 PM, Peter Maydell wrote:

> >> +void qemu_ram_move(void *dst, const void *src, size_t n)
> >> +{
> >> +    uintptr_t test, len;
> >> +
> >> +    if (src == dst || n == 0) {
> >
> > I think we should not bother testing for src == dst. It's
> > vanishingly unlikely to actually happen, and if it does
> > happen then the code will work fine, and it's probably better
> > to actually do the access in that case than to skip it.
> >
>
> We can drop the check of (src == dst), but it will introduce inconsistent
> behaviors. For example, qemu_ram_move(0x1, 0x1, 0x2) is finally turned to
> memmove(0x1, 0x1,0x2) where no memory movement happens in glibc::memmove(),
> but qemu_ram_move(0x0, 0x0, 0x2) is turned to qatomic_set((uint16_t *)dst,
> qatomic_read((uint16_t *)src)) where we do have memory movement happening.
> So I would like to keep the check of (src == dst) in order for the consistent
> behaviors.

Well, it depends on which kind of consistency you want.
If we do the src == dst check, then we have the inconsistency
that a small aligned access always happens exactly once,
*unless* it happens that src == dst, in which case it doesn't
happen even though the caller asked for it.

You can see this in the documentation comment I suggested above:
if you don't check 'src == dst' then you can document it as
"memmove, plus for a small access where src and dst are naturally
aligned we guarantee it to happen exactly once atomically".
If you do check src == dst then it gets more complicated,
because you have to say "memmove, plus for a small access
where src and dest are naturally aligned *and* src != dst then ...".

I think that because it's the small sized accesses where we
know that it might be necessary to really actually do the
access, that we should do that also for src == dst.

> >> +    test = (uintptr_t)src | (uintptr_t)dst | n;
> >> +    len = test & -test;
> >
> > What is this doing? I am not a fan of clever bit twiddling
> > that isn't commented to explain itself. Readers of the code
> > shouldn't have to go off and search for an explanation of what
> > is going on.
> >
>
> The following comments will be added for (v5).
>
>      /*
>       * Maximal length of aligned access that are determined by @src,
>       * @dst and @n
>       */

What I mean is more that it ought to say why "x & -x"
achieves that goal.

-- PMM


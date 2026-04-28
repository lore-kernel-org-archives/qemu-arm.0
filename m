Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3758BFF885D
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Apr 2026 10:44:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHfvD-0004ed-5D; Tue, 28 Apr 2026 06:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHfvB-0004ac-IX
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 06:44:05 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHfvA-0001Tz-5J
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 06:44:05 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-64e87a81639so10149661d50.0
 for <qemu-arm@nongnu.org>; Tue, 28 Apr 2026 03:44:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777373043; cv=none;
 d=google.com; s=arc-20240605;
 b=ZrOGLF7ybE/5ZSXc/71f09GkEnUB+Xjc1Q0ttvN3JF5f2dIRS3zYlPySdxcl2yVtiI
 CXD/ZQ0CGjfTxRlB6gecQ3x9/IueYlTkuIi2DlkYHbGh9pz9B86KZzvQrl6k6+YpTF3e
 KFpvQycJUteBXD6oGXD6lUrLVr1AHvyHbGQCqUnzKg/ZT1d4A2qrx++rwzBQBFkdxl6j
 Uft593YApunML4Oe2vVPS0cQ0MWvfHiynFT9aBsRxGsKum4FG2VPRE+HLB3Q5IIWxAbu
 lCP1uYA1PkoWFjXIl4e/mNT3bxFbBicVjCY19v0Lx22XskNNme69E1m7kOQoSBNPYd0B
 jiVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=tGn/7ofAJkPeLznmcMGIZw4zwGjdtj37UuvN0GXBlAE=;
 fh=PKodlsZ4sLOulf3vcyB9a9UvxkkwctzJ7UL5PZ8dNXQ=;
 b=FIU8xfHP1L4YZ7Dj4uLew3nPshA0N+l7lfJqY6LTNKI6IWwElU+y5OtkrFuFpwK/Qk
 22VCnPlLtElMF47khodUI5KKmhz4ESNwZTkoMwjQPF/ubDtfPiNDvBxeS297Hg29VRmo
 Tqq4pNXLPmfEoZvPUWAdaYs13lBMcbI2lLA43qaJEbc3s++Gmo45mSF+kueNDO9bgMU8
 5qnLMecEr0MYAYZSQCS8+eNT+6pmYM0BYhSBpziOkAamsvnpfO6xRq27W+o7ZlT9iPYA
 ixzUO1MMWTLnNZh4tgvgqvhKlE2HmmleSEiUhnemtG/wo2LzM8n9z1UJJNTdT6Zo5BFy
 CzuA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777373043; x=1777977843; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tGn/7ofAJkPeLznmcMGIZw4zwGjdtj37UuvN0GXBlAE=;
 b=hFxFTrt+oNZTAARCTybAJaonN0A0/JE0jIT26sgufrCfgV1G2tWzwWbELmw9G79Fod
 9DaiT4BAZImZYCUE1NCdHo0FyGD1/TiY5uBbab35rAB9bWOXr0sM4Yq/oPnLmZGwqs9c
 wOwWntDdKZw/DvYT98Or7U1fQxvMNV5PXTw0tB+eMS8BmFypQ2P7MpoZxX0foS413adH
 rMatyR1+Xf3IV3YA1UCoOJ07wvXA/tyRe+6l9ikRCYE5Na6UngQbGBu+hhvdLHOb6CGT
 3O99rmqcIhh3mkKSj8wNke8DcIendbtLC30eX4xAmx5ar+XCJATUOCtQY+jYBWiWcHEz
 0G9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777373043; x=1777977843;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tGn/7ofAJkPeLznmcMGIZw4zwGjdtj37UuvN0GXBlAE=;
 b=r3ttXH1DN1dsGfhFEpql6EPv0uvx8E4VHO0iJVeJ66ugfTM3MDg7ysFl0yKZuIs/um
 SHJ7AzTrfE7ZfofPiS51r1F76Jgvg+Kx5dm0Mx+r8S9yEvHhrnlCogJS6ymAXEiXqHXH
 vwDc6sl2zjVP97kfzz6X7gI7cUa6Y7n0yU/3ecQC3/j32gjZR8CLDAfr29Fuz/7v1t0/
 +StxkcXn/MnE4KBbtI7aESobzqTocFawmqdFUCiqVT2edwNabl2jeHci5gm2xjf6SI7y
 DewofW2jB5AoCg/OHoOrFfzrlbCw7QB0Z6ZEEPZj3gyV9ByNzxW1hRS+U2Mu2CfL/eNL
 bBRQ==
X-Gm-Message-State: AOJu0Yzv7txDXBufGL9SQE8WrlQf0MKqVnu4Vu7FjA//0YZGfoD3fzoj
 P9gTU/JeSKUjqOV0fbQWvqdtNhvrqWPljIi++AMOrJzmqHS0MhriqNVlMXVAFTEFc2+hAat6SxU
 XXdNq5Me2Ufha50W65GYUG56D6VIO7SH6q0UViK/Vdg==
X-Gm-Gg: AeBDiesquhpX4Rd5XEbGVeNSjS/ZPzCf678kQtORY3+HBWPGXzDrU8DKxcUaxJ/VGPt
 nHvSELcBgqFHVdOUZXHJmHsddbcJMbEdJMCSIZ53NOGDV88wGsSqlH8elC5Dh7k4u/XS0wU50sO
 H9s0te7CnYgQsig3AIO8jMnApLKdx/g3iihlWWCRQOfpeC/DlDEngPLGnqUesqON5Y/dOVeEA9i
 fXbpXpmoNZ1PBNJEwsMqdlRYXwTgwLlsDMe2u0EFFOTNQ0UOSsrMMWUOoZ8gFVekZ0MNYUv+hSa
 h3YaC14k8wi7dlSjCAL0t1TTfGjk8MiiItc/PnQHPahwgu80ygiRdx3SM8/OD26UUaTNSYGop3G
 cLQ==
X-Received: by 2002:a05:690e:1446:b0:649:b31e:8f54 with SMTP id
 956f58d0204a3-65beedaa291mr1973392d50.24.1777373042916; Tue, 28 Apr 2026
 03:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260417173105.1648172-1-peter.maydell@linaro.org>
 <20260417173105.1648172-16-peter.maydell@linaro.org>
 <fdbef0ff-453f-4e3b-b7bd-a164cc38b341@linaro.org>
In-Reply-To: <fdbef0ff-453f-4e3b-b7bd-a164cc38b341@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Apr 2026 11:43:51 +0100
X-Gm-Features: AVHnY4I6hwEL6bXLon5c6h0njHnXsyV6uR9XuiWD8HTaCYkJfs3dnGzw-4SDK-o
Message-ID: <CAFEAcA9hD1tCrJCdKcy9zw5p8gwobQGuaKDQaBLyVm7kdx=Dxg@mail.gmail.com>
Subject: Re: [PATCH 15/17] hw/core: Implement cpu_get_phys_addr_attrs_debug()
 with cpu_translate_for_debug()
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Thu, 23 Apr 2026 at 04:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/18/26 03:31, Peter Maydell wrote:
> > Implement cpu_get_phys_addr_attrs_debug() with
> > cpu_translate_for_debug(), so that CPUs can implement only the
> > translate_for_debug method and have all of the wrapper functions
> > cpu_translate_for_debug(), cpu_get_phys_addr_attrs_debug() and
> > cpu_get_phys_addr_debug() work.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   hw/core/cpu-system.c | 17 ++++++-----------
> >   1 file changed, 6 insertions(+), 11 deletions(-)
> >
> > diff --git a/hw/core/cpu-system.c b/hw/core/cpu-system.c
> > index cab65d549a..be5cb48126 100644
> > --- a/hw/core/cpu-system.c
> > +++ b/hw/core/cpu-system.c
> > @@ -90,19 +90,14 @@ bool cpu_translate_for_debug(CPUState *cpu, vaddr addr,
> >   hwaddr cpu_get_phys_addr_attrs_debug(CPUState *cpu, vaddr addr,
> >                                        MemTxAttrs *attrs)
> >   {
> > -    hwaddr paddr;
> > +    TranslateForDebugResult result;
> >
> > -    if (cpu->cc->sysemu_ops->get_phys_addr_attrs_debug) {
> > -        paddr = cpu->cc->sysemu_ops->get_phys_addr_attrs_debug(cpu, addr,
> > -                                                               attrs);
> > -    } else {
> > -        /* Fallback for CPUs which don't implement the _attrs_ hook */
> > -        *attrs = MEMTXATTRS_UNSPECIFIED;
> > -        paddr = cpu->cc->sysemu_ops->get_phys_addr_debug(cpu, addr);
> > +    if (!cpu_translate_for_debug(cpu, addr, &result)) {
> > +        return -1;
> >       }
> > -    /* Indicate that this is a debug access. */
> > -    attrs->debug = 1;
> > -    return paddr;
> > +
> > +    *attrs = result.attrs;
> > +    return result.physaddr;
> >   }
> >
> >   hwaddr cpu_get_phys_addr_debug(CPUState *cpu, vaddr addr)
>
> As far as it goes,
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> But I'll note there's exactly one user in system/physmem.c, so it'd be better to drop this
> function entirely.

Yes; I note this in the cover letter :-)

-- PMM


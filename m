Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445CFFF885D
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Apr 2026 10:27:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHfe0-0007si-IW; Tue, 28 Apr 2026 06:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHfdy-0007r4-G5
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 06:26:18 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHfdx-0004Ma-00
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 06:26:18 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-6501725d888so9099854d50.0
 for <qemu-arm@nongnu.org>; Tue, 28 Apr 2026 03:26:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777371976; cv=none;
 d=google.com; s=arc-20240605;
 b=QDDH7EnL6IUDFh5Ts8ajPlPyKJAbNjym/hsUzo6vpyayPoCSzmAL5e7NraI82ac6wA
 Fh6JtCvpJos46I8G/ZVYBM27SNJ5xAfA8eA1rB8DxzaGNP6am3mp3SIcM7MzbK+S334s
 VMbLBwkg6hVOrOPrRFyN5bGqipELPIf1Zm2CRZ65NobF6+PfLdmpBJYrcRNxPAXaE/Po
 BmcdcdzzVriuzEk9ST3R5w/FWBWdU3U4KwrOAPjXx3t76AaeRsi7HGdVglnz6Q5gQdYK
 PjdpdGKDLCLWkWDeX6aWlz9EX+YC/9zUiRp3006QcksSCCFtCgRL26pHWLOeH0+QK0bO
 99ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=bNYuY+mpqB9tvsQdv75FUl/u/ykE7yH04LUmseV2WuA=;
 fh=PKodlsZ4sLOulf3vcyB9a9UvxkkwctzJ7UL5PZ8dNXQ=;
 b=OqeA4epshgkt/6ld+muqVs5gMRUZAIQLEgu9ZEyByWQeGolvxE+YvT7aKtnUj+NnS7
 4WtJSc1O7rHh5G35/NTFSxVlbGigsUvrfz0Cxf23fG0JliO+JYlH3SaHX1vu+Z12UUbz
 qVKo7+CCGbAmxLnsC5jLTqy9fak5LosUAV7kSVSvpddV32S226lELMgW2O3YW7e1h9ON
 XHHeAqUgyg2gLUU6rYcQAdsdC+Ykwhuito2kqv3zfnDjD11lDDYyKZK9qtJY+/sb89xq
 saIstWNmTRZrak6ae9+scEVrcssLeZzVn4vLYzdnvPtZEbT9YBHfOUO7pkgo8QK7RkTG
 Tc7Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777371976; x=1777976776; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bNYuY+mpqB9tvsQdv75FUl/u/ykE7yH04LUmseV2WuA=;
 b=Ok+hUxiXN4yYoDdVO90FJc2Okdz3P8sYPXVArTttI5wyVdLKgpHq6rbXO9lfWWfKiw
 ZoAZM9DOcT1EZ0OeirT/HQ/mUp9pAhayx5bAQsy4I7WEedIiZhRx1Wh4kFAnb2NGZaiL
 TIrkioqIXpJcF6L9v1jUyeZ449ArzcRA0cCAczpPYILXmwlbv28N8tNyO0PkyEjKu933
 mHe9YyFKdFV9RtmpUoq4cNDxyAu703pL8KBJoJIzyJIvQax2fSCe74cOx8RsXOKsFy8W
 T9xAzuSv7hYbAbDvwjHcaQylZ/lYazgn1zUo6fQ9NPPGAsqtmlEbc0dp4Z39ywz9X4Df
 O+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777371976; x=1777976776;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bNYuY+mpqB9tvsQdv75FUl/u/ykE7yH04LUmseV2WuA=;
 b=Ffrh7IggmTjJryzof/iYjHOT1uH0yNapSbDph1a1gjVpLILOD0Cbg/OwA4Bwjg/Hqp
 ESq3v8L7VhTomYutbimAIYoggEOfBdMo7rG22rkgHzYyl62HyH01jf6i1MPwn1oJzaDo
 8u3oFuY8klmDPG0Q5tNnaTYexRJv7SlcS3iLIKlEUdbqlkg0yeaSXs5T+Y0CeGzm2BcE
 3hcvz3M4YrFUwYWUXKBb+QaaYavQzwYhF/RIpTeVMcIxFfIkTsikbgB5ByTwhxvZ4NFS
 06hZG1+2Etako/5SRIzh9phk2GmeB1LZFutSHB+vYj+Hb6U2rXVNohloX3gxVZor0FiQ
 bK4w==
X-Gm-Message-State: AOJu0Yx5EdbQqnvsXJVuh3CTcfgfaUJzHXRD6L8K66VhiHU7vCGjYHlP
 ofjWmbGlWcH7b1gWYJ8gvpBkd2gVT2cxP19LlL6BlssWIH5yL9+ELI+sJd+Wbu/Uk3iPCUD1aMV
 jHPHSaNFZ0ycHlPfmP9IAoxjvEnaPFiSM0SdRan1+IQ==
X-Gm-Gg: AeBDievNkjVvsViwMrMmS2IciaVI2wMcUKeBaN7o3NHZbiXLbZtLsCikJ5D60UKQ8ea
 KHP5UNlSv3HUgFqVO0aCZlx8VVjXUcqpOAgLSduaBNGrPz1PuGU5M1u0CwvxbvlJmWnlc8yeT6d
 Y7jSW//BmOLMC6pnp64suoXYbM6sF7OmJj3O0FyXLuO/CedseTRL9yMJVhT5qxW43MES9hYV5Pw
 cNV9nZh49TXyW0jmssVycvxlq0jgn4m2ioVAYo+3pDZejZlA4thkmF3Hs1S9GXDmz+MAKfBKypE
 QaQxGqfXVEYWFF6l/Pxhs9AtPyXTe8oEGFjymuJCJFAReHWwQnx6JRyxDOV8dqVWgd3yFE23TgI
 Exg==
X-Received: by 2002:a05:690e:1406:b0:650:3e1f:907c with SMTP id
 956f58d0204a3-65beeba511amr1996675d50.0.1777371975587; Tue, 28 Apr 2026
 03:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260417173105.1648172-1-peter.maydell@linaro.org>
 <20260417173105.1648172-17-peter.maydell@linaro.org>
 <44df274b-6179-4e63-aee4-1e29ad5f4b23@linaro.org>
In-Reply-To: <44df274b-6179-4e63-aee4-1e29ad5f4b23@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Apr 2026 11:26:01 +0100
X-Gm-Features: AVHnY4JOrdpIlO27eYt75ZDtPg1k4zS9uDE0SB4DBSEbiX4Ru8l4hWpH_ip6_yQ
Message-ID: <CAFEAcA8fXkUmcLd0D09GWR66fnDEe_PdnFnUvvvctCaqma8iRQ@mail.gmail.com>
Subject: Re: [PATCH 16/17] target/arm: Implement translate_for_debug
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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

On Thu, 23 Apr 2026 at 04:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/18/26 03:31, Peter Maydell wrote:
> > @@ -3935,25 +3936,30 @@ static hwaddr arm_cpu_get_phys_addr(CPUARMState *env, vaddr addr,
> >       GetPhysAddrResult res = {};
> >       ARMMMUFaultInfo fi = {};
> >       bool ret = get_phys_addr_gpc(env, &ptw, addr, MMU_DATA_LOAD, 0, &res, &fi);
> > -    *attrs = res.f.attrs;
> >
> > -    if (ret) {
> > -        return -1;
> > +    if (!ret) {
> > +        /* translation succeeded */
> > +        result->physaddr = res.f.phys_addr;
> > +        result->attrs = res.f.attrs;
> > +        result->lg_page_size = res.f.lg_page_size;
> >       }
> > -    return res.f.phys_addr;
> > +    return ret;
> >   }
>
> Inverted return value.
> This would be obvious with s/ret/fault/.

This function returns true on fault, matching the other
get_phys_addr functions in this file, so "return ret" is
what I intended here.

arm_cpu_translate_for_debug() returns true on success, which
is the opposite convention, so it does:

     if (!arm_cpu_get_phys_addr(env, addr, result, mmu_idx)) {
         return true;
     }
so as to return true if arm_cpu_get_phys_addr returns false
(the successful-translation case).

I agree that this is confusing, but that's why I put the comments
in and the commit message. I had a choice of making the
translate_for_debug() function follow the existing
tlb_fill_align() convention or the one we use here in ptw.c,
and I picked the former. That leaves us having to do a
flip-the-sense-of-the-boolean somewhere, unless we want to
redo all of ptw.c to use true-for-success instead.

-- PMM


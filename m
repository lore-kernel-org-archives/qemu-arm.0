Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp767955lfb;
        Fri, 22 Jan 2021 03:53:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8kDngiqM8wUz7BoiyKKMV68N0uKiyK3hH1cavHKRYXPlRQDcLYxUVoEl/sXFIwWq9JdDy
X-Received: by 2002:a25:7a44:: with SMTP id v65mr5745997ybc.0.1611316429916;
        Fri, 22 Jan 2021 03:53:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611316429; cv=none;
        d=google.com; s=arc-20160816;
        b=ZoDwvt9lk1UD/RNyAVu9diUElQ9Tst4ewm/0UyCoia+/xv1OBofifk9CPwnGtr1RBO
         g0GahRvwepP8zJKYL/0lZO8IepfKcBLZMeteIQYWSmyCw41P5Sm36BkSRRrnd545iAPO
         C20oqte4SM9ioso1aXvmSEk6Q8I6CmsXyFak1DbN8aYVCGPbLDtIE9u2yimuLoJKjiQ7
         +jyEMAvP++1CgfDtNqdHqAanRT2ngm9uDIVgr1Nwl1T6Iz7k6/d+QNO3MBkQ2+Np0pRR
         6ViTsXQI+CUwdhIGx1Y9muB3bKvu/NyGkvzk1hgcLrxayaOYdR8xNfMZ88/UT/fUV/OH
         xn5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S/niuOmXyqXBJZ6gv5bg6OJguEBxsoTsFEx93XPe4cU=;
        b=krKFQZxEWOzrieHjzLWb16lXLIPd415b9dS9RWk7esyCHrjBSX0GcN5atQzlhFOV1h
         GeZ3KMRATY8/mynTPM8+xOR1eIS/pNayfYhzpgdaqw030yfAcBFYeS6YI62YVoHjmZJP
         iEHHNHd3pkgBdeFyQ1+5/rXI8gu98VUEIawJoYraoZ+pOzc5uzMMf2iDGUNh7Ilgq5hN
         iroYMKEQR7U9N4LCRnKNQXSdOSpcq6i0Sa1oMCk4xgMiUABt05ziGd0imZTjdsaX5FYc
         QZ2TWc9Q802MYvxjOt1XYJwW6/lvrNystxxL02mke+Y6RxEW2kdE2I8dl2ntqEPA4qKl
         4iCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FuA93NIt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b64si8056511ybh.32.2021.01.22.03.53.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jan 2021 03:53:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FuA93NIt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2v0f-0000bp-8d
	for alex.bennee@linaro.org; Fri, 22 Jan 2021 06:53:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2v0H-0000Zw-3s
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 06:53:25 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:36656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2v0F-0003gD-DI
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 06:53:24 -0500
Received: by mail-ej1-x629.google.com with SMTP id l9so7280545ejx.3
 for <qemu-arm@nongnu.org>; Fri, 22 Jan 2021 03:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S/niuOmXyqXBJZ6gv5bg6OJguEBxsoTsFEx93XPe4cU=;
 b=FuA93NIt3+g1bPxHi0uu4mi5HiFXM3ff9lfAGMTU+Q0jvUCQ6iwn0rY1PTjutH7kil
 tt83YYGdOA8tjS3AFeLWrzW3rPQhuRLuq76Av7gI9x2yxLul2MrhInTfkY0TUHSJSFir
 6vDeMIRNySsI1SFEGXS4oq5thKkgredcSnLF9orfUghc63Pe/jyXf1Z3GJ5JZiqLCdyv
 qLADIpZuYS4hOEYgJf+9tuM3rZ0hRyj+uRdXW7xFNOA9vu95CSxltoFTEC48hWSN4icT
 fXqJb9L2N8gR5HhI1XeX4+OUO+228UBpqC4zQsaenoiD4aJiOjBbfJydmiCdKJLsb6Bd
 9+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S/niuOmXyqXBJZ6gv5bg6OJguEBxsoTsFEx93XPe4cU=;
 b=GM9L1w4MbDlbcO4IrV12WQfPNPcYBcQvrviKarIfCkrdd8J0bzD2ce04So6Fk8xrpy
 HrCdGvHK3HhON6e6ZM1CcY4+P/ZzR4zzF/b7YEJiTcoedd5Mst4wF6vzRYAtUczhw3av
 tJscP4mGMKsVB02V3U4OnaPyK/A1c3gU7fPP5g7H1LMnGQCVC6z5jrmHKFmc7c/US1rT
 74uZ9HpaAecdz2T+C7I7AeXfKl5tenyIziFaLADhjRgvxu6/6iY7LnWV7io4CLpUOP2l
 LtEBr5dHTcnMCCPZTCj+HPf0/KaBAW5N0T3grypmTpyA02nrdO1ReBVnmvx4mm67Sn+b
 3DyA==
X-Gm-Message-State: AOAM531OG5bx//cI+du3DJ5NKLgTLbb9jqX0NMvhAhnthGSmoGw1nj2w
 jeotaPBepcBbGuuaNA6jlHgJoUNjO1+64sk1ECNxNg==
X-Received: by 2002:a17:907:1b10:: with SMTP id
 mp16mr2764347ejc.482.1611316402084; 
 Fri, 22 Jan 2021 03:53:22 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-13-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 11:53:11 +0000
Message-ID: <CAFEAcA-hyjfb399qWC4ORNtoLxNs71G=paurrVX4g+aRO2=26w@mail.gmail.com>
Subject: Re: [PATCH v3 12/21] linux-user/aarch64: Implement
 PR_TAGGED_ADDR_ENABLE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2kskcjNxfE68

On Fri, 15 Jan 2021 at 22:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is the prctl bit that controls whether syscalls accept tagged
> addresses.  See Documentation/arm64/tagged-address-abi.rst in the
> linux kernel.

> +#ifdef TARGET_TAGGED_ADDRESSES
> +/**
> + * cpu_untagged_addr:
> + * @cs: CPU context
> + * @x: tagged address
> + *
> + * Remove any address tag from @x.  This is explicitly related to the
> + * linux syscall TIF_TAGGED_ADDR setting, not TBI in general.
> + *
> + * There should be a better place to put this, but we need this in
> + * include/exec/cpu_ldst.h, and not some place linux-user specific.
> + */
> +static inline target_ulong cpu_untagged_addr(CPUState *cs, target_ulong x)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    return x & cpu->env.untagged_addr_mask;
> +}
> +#endif

Forgot to mention: this only does the right thing on addresses
in the lower half of the address space. I guess that's mostly
OK for our purposes? It probably means that if a guest program
deliberately dereferences a bad address in the top half of the
address space we'll report the wrong (ie different to what a real
kernel reports) address value to it in the SEGV signal handler.

The kernel's "untagged_addr()" implementation:
https://elixir.bootlin.com/linux/latest/source/arch/arm64/include/asm/memory.h#L203
slightly confusingly does "untag the addr if it's in the userspace
half, leave the tag bits alone if in the kernel half".

thanks
-- PMM

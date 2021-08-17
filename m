Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp839442lfg;
        Tue, 17 Aug 2021 13:27:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3j6+m0IJ220dtUx3EogYl2wb5wSpG1d+L5D0cliBK0MpAzYAKkcr+BlqED97P0SgWBoPf
X-Received: by 2002:a02:6a24:: with SMTP id l36mr4559264jac.4.1629232074360;
        Tue, 17 Aug 2021 13:27:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629232074; cv=none;
        d=google.com; s=arc-20160816;
        b=r/v7kdvMiNVRrBuLXcIwzaU50nlzqeJU+30p4U9m3qtiHBk4ZoNUY4wmUH0HQ3xxaS
         CjuPZ9pgPtmeYk2ADPgXZx5PffJghmtY40Tx1MZh/FW7e3VbKEQhYT77dHoSo1JcdJKO
         Cmv/9+XuQcpwIWCI6RyUyWnC6o3sg4QkQhQ7ibMEEEVNFGJdtxNZHtMRZboL5L7guPCr
         o6LyhgZcojVtGIl/9o0BXwan1O+ByUS/oojC0R3Go+o7q5NdTOOtBLgj7Epl2BNR+O7L
         THdd3zMpKAu3nI51KnOS9XpDKN7WRxuvxp9RHF5ittxXCnIx4co4mF31Ah4+Zh72epL/
         TzXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DSMNVCgBSQr/zYMbuai5x9ZefYjxqBmZYkewd68wZT0=;
        b=Udv7HywWmijfMCgaHGyEiSjKj0L1N3sRZgqkM34I6PTOy9BCLWpzfJrENtDF9DC5v5
         Iyi2BEZ1wfphWhx7NYPDoWO+YGmUNLndIRW6viwuPoaALjuIaUzbODHth/QH5cJsDsHj
         WKtnzza+vN0aQy+w9TFd29md8wUZ9n7J32GUzxwtNo/5WeiE2RyHoWk4wlp3ILi1Wy+y
         8IATikhcRWm3ER5ACutwqAd58yewHtw1UzllNyQcr947qQNMHIiqM6bojo8vk5uMJdrA
         xaZwepqJ4zXxXkTJBee+VEttd/WqF5OKT3xcl2Apr2dspmAcMjYFz+itjXxR8fzs790/
         Y+OA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zNefOs4j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z5si4059077ioq.70.2021.08.17.13.27.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Aug 2021 13:27:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zNefOs4j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mG5gf-0008Fc-MJ
	for alex.bennee@linaro.org; Tue, 17 Aug 2021 16:27:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mG5gU-0008Bk-0E
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 16:27:42 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:39604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mG5gR-0007lx-4s
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 16:27:41 -0400
Received: by mail-ej1-x62a.google.com with SMTP id gr13so94349ejb.6
 for <qemu-arm@nongnu.org>; Tue, 17 Aug 2021 13:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DSMNVCgBSQr/zYMbuai5x9ZefYjxqBmZYkewd68wZT0=;
 b=zNefOs4jbDG/mq/juIEWVVbXcWAK/mQ1eziaQVIz9+sP0/yoO7WDWDu65vt7gKp2Hn
 DedfzUcNRGEo0Dy7sysKyX9LjgjEDB1/npYA5hx2yCmLZcJvkl6oKFHF3ipK2dBSBI6d
 I9xWOrGfCYw+NBQO7K4PaS6Kfy6nHCsVa4IK/UzaNg9hEe48m5YfIAUMpx22iXGVqovu
 weD1BqqclqvVjYeQALm3pqX3UTk1t6iRVX7Bq+c8GNJ/PIGSX7BXYv5srXVQRXkofYUP
 j4GdtlwWdt9VB/7KNG1KxFvQA0zA6A+xllANZPSMFh3xknL48klPSPc0aY7A5//4GYSP
 rmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DSMNVCgBSQr/zYMbuai5x9ZefYjxqBmZYkewd68wZT0=;
 b=S23r58IjQO89kP0La3dXouqV/+HVUQHXZmVkwHPZygP7xnhCBxe/Utgo7t/8dPkuzX
 Bn61x5UZon6hmtsNdNDUn6aqmS4/YAXmg3phykDheJ45383HTN+Q/21wBnU4LrwTHvGo
 TWyEQCdMQ8/2hlKNQrjK1qgGGdqp2EJ6APEoE4yv8LJ0W82j14YKs3urpNL+0DmkzjEE
 icf+6WhCXEoZUOs4n1sYaTJeKnYdeY/ruXBjKzH7vmS5CB5ZfcbSWReURN0C1EhpqSeL
 s26h88dugPbbcJ/+QgCEfdP8B0ozLIwF+YQtfcRRJ0f4Tmgebd7+rgpG9OPHkxrddFYt
 KJzg==
X-Gm-Message-State: AOAM530GuVCINo6053LYaYJZ/Opc3xDhQ0Oi/K4v3ZqGxzTpk9hBO6nX
 02DR/jOoMls/mBdOZGzBHL1ocfdbHUvCm4movnhBxtgb/CSc7A==
X-Received: by 2002:a17:907:1048:: with SMTP id
 oy8mr5715363ejb.382.1629232057350; 
 Tue, 17 Aug 2021 13:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210817201843.3829-1-peter.maydell@linaro.org>
In-Reply-To: <20210817201843.3829-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Aug 2021 21:26:51 +0100
Message-ID: <CAFEAcA_AXV5zvhWoyxmB03tN_UcTwJhp0V3rRD0Z7VcRMHM+KQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Do hflags rebuild in cpsr_write()
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gIRyH0s4JBh2

On Tue, 17 Aug 2021 at 21:18, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Currently we rely on all the callsites of cpsr_write() to rebuild the
> cached hflags if they change one of the CPSR bits which we use as a
> TB flag and cache in hflags.  This is a bit awkward when we want to
> change the set of CPSR bits that we cache, because it means we need
> to re-audit all the cpsr_write() callsites to see which flags they
> are writing and whether they now need to rebuild the hflags.
>
> Switch instead to making cpsr_write() call arm_rebuild_hflags()
> itself if one of the bits being changed is a cached bit.
>
> We don't do the rebuild for the CPSRWriteRaw write type,

Doh. I said this, but then...

> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 201ecf8c67f..cdd6e0858fc 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -9215,6 +9215,7 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
>                  CPSRWriteType write_type)
>  {
>      uint32_t changed_daif;
> +    bool rebuild_hflags = mask & (CPSR_M | CPSR_E | CPSR_IL);

...forgot to actually check the write type.

Should be:

    bool rebuild_hflags = (write_type != CPSRWriteRaw) &&
        (mask & (CPSR_M | CPSR_E | CPSR_IL));

>      if (mask & CPSR_NZCV) {
>          env->ZF = (~val) & CPSR_Z;
> @@ -9334,6 +9335,9 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
>      }
>      mask &= ~CACHED_CPSR_BITS;
>      env->uncached_cpsr = (env->uncached_cpsr & ~mask) | (val & mask);
> +    if (rebuild_hflags) {
> +        arm_rebuild_hflags(env);
> +    }
>  }
>
>  /* Sign/zero extend */
> --

-- PMM

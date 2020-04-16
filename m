Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1865008lfm;
        Thu, 16 Apr 2020 07:15:28 -0700 (PDT)
X-Google-Smtp-Source: APiQypKFM8h42qB7begJJQ3lsKZYlzbjIVe71o2yVV6Q9o5/tLLZKXmwH/7inCCrAXqqR693Znz7
X-Received: by 2002:ac8:4d06:: with SMTP id w6mr25709340qtv.180.1587046528091;
        Thu, 16 Apr 2020 07:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587046528; cv=none;
        d=google.com; s=arc-20160816;
        b=t8FAdKdOtE8Arh+6JNhS+5zqUVvDEUWSfctfCXnEwRLL1i4maGZcsZC8azRalc30Hx
         wZM0fxrt/b9Z1CBKM0tHmBkrFm/YFAQVnOGzqRmsbdUPn0tH+UyBTm/1teX2JwzCKjuR
         vZtrAVloJCK03hfqtqXAXhpl3kY/s/rqloHVUPkpq1aTDZDlNv/CfyEuSp/uNSnMRAz5
         MLPc30YuUvGscwZcDzXpU4plkPfBq5G97KGqdcwtKZOH9kQxmMWAj40UPU5eTpFVb3q8
         oAsJRSxHncWnAHZkar6kcZsGsDVrdBDTlTNTacaytQuW5O0Yxegxwgc5qphCK0M42EmK
         +CvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1KdzUyR24JGyuSdT3X2ybdEiBULSA7QQZx8pJoHprqU=;
        b=K/UMVqwyp7roHUpwgQHl9aVOGu8B+1No2Ek0Rc9+EdOKyPd6fE+2v6Z5GYvK3k1aR8
         DyoUziNO7ay2fgkxoTc0KZcqJhNhLBSR0GYC0LKtTXnf7B7fitJhybOjFtcnn5boqP5r
         9TWo0SSCvQ9LLkxsYjeCs7rTRyGZ9hwiL8ak8X7cl72IB3oUWDDhXxPMFhUs3KyAeNxT
         GbE0FyjWRDuheVyw+tMUGC0IR+l84mpDfHHavxeyQBWpycxSeE2QCginTpDEG0lytubN
         VXVRH8Tq85wATJpSv6l30T+F1bD4lyuyqq3/N8kKzx6CaIPNuBDW8/+6/USgDrgEO/Og
         stgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RyI4UX0f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ei17si272280qvb.82.2020.04.16.07.15.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 07:15:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RyI4UX0f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jP5Id-0002tc-0R
	for alex.bennee@linaro.org; Thu, 16 Apr 2020 10:15:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39215)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP5IU-0002tI-Dy
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 10:15:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP5IT-0004mk-87
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 10:15:18 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:40408)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP5IS-0004mL-Vr
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 10:15:17 -0400
Received: by mail-oi1-x244.google.com with SMTP id t199so13278927oif.7
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2020 07:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1KdzUyR24JGyuSdT3X2ybdEiBULSA7QQZx8pJoHprqU=;
 b=RyI4UX0fuYfWjR4CkrmrA0aq3YkfM77uaZHUFeisnAIoaTGLhyUp4o1taUH+QgFd+v
 kdlhxMGhxBrXWdS5otHqAwcUdXMRErN68vcA5HstyFBfw0zwnQ7u3z158XJP2V/vcfPY
 c04/4whWpJsQKBRztILNGRMxOcMTuDIPkdhEa+w5to20BqEfKOV24umqdRZ0cpGZeAZB
 dH91jKoJOnWx9IZD/Ir3nmagYxXjP0y1lYkNgL7JcP3Psy2/ERzcappmxSXuwq4OzM5O
 2Z04uxtDm7dFugh+iv6WTCVaY4KOcB4yIl7aEx2LepEbzDVRHSVYrJBgn3scBBqq2CIE
 MI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1KdzUyR24JGyuSdT3X2ybdEiBULSA7QQZx8pJoHprqU=;
 b=jAOHHsMCx6s+9WyDps2MH86DElWmEGQKhJvZ2NYX4SDqfodogZFaR8mdawNNrOhFSk
 CF8JdC6XrzE4DIgYBYQXnwDJEiGylAL7d8Xvy5OwpAZzLYM9QeKbvDSb1Cl0UxPkSMVA
 yJXgnHMF++bGmOt6AEfApkA48ihnjuOHjSCWeCzCe2uU3hCdHYft62aXPsMcU61cqmxg
 s5KHQts13/IQeq0INY4Jsb0cv/GxlofsMQhXP30md5XZjetsoGkyIUhJOeh5lqfgXtmo
 NMcHdEGVnvb2s5g5QUiQmVk0F62kN/EH6W//3qPijhp2WG6bOVzeCGonrdMjLQ/1ECXV
 Z3GA==
X-Gm-Message-State: AGi0PubbSYIJ2POZOxHw1khLo6YMi9yKFY5MeBj/wLiyEvfxuVWEqxhc
 J0P6KinYeEk1RcyzpOc+Kvg+ziu9j4JH6xwWOxtmIw==
X-Received: by 2002:aca:dc56:: with SMTP id t83mr2870836oig.48.1587046515773; 
 Thu, 16 Apr 2020 07:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-12-richard.henderson@linaro.org>
In-Reply-To: <20200311064420.30606-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 15:15:04 +0100
Message-ID: <CAFEAcA_V09rpr4X_TTZgo+v5Dj1yZR4zA9-94q+C5xikkhM=BQ@mail.gmail.com>
Subject: Re: [PATCH 11/16] target/arm: Update contiguous first-fault and
 no-fault loads
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
X-TUID: YVSWv5dYvZUq

On Wed, 11 Mar 2020 at 06:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With sve_cont_ldst_pages, the differences between first-fault and no-fault
> are minimal, so unify the routines.  With cpu_probe_watchpoint, we are able
> to make progress through pages with TLB_WATCHPOINT set when the watchpoint
> does not actually fire.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

>      /*
> -     * Perform one normal read, which will fault or not.
> -     * But it is likely to bring the page into the tlb.
> +     * From this point on, all memory operations are MemSingleNF.
> +     *
> +     * Per the MemSingleNF pseudocode, a no-fault load from Device memory
> +     * must not actually hit the bus -- it returns (UNKNOWN, FAULT) instead.
> +     * If you map non-RAM with Normal memory attributes and do a NF
> +     * load then it should access the bus -- but doing so is illegal.
> +     *
> +     * While we do not have access to the memory attributes from the PTE
> +     * to tell Device memory from Normal memory, we can validly assume that
> +     * non-RAM has been mapped as Device memory.  Thus we indicate fault
> +     * on all MMIO.

I don't think you can assume this; for instance a QEMU 'romd'
device might reasonably be mapped as Normal memory but currently
be in "send all accesses to my read/write functions" mode.

> +     *
> +     * Similarly, CPU_BP breakpoints would raise exceptions, and so
> +     * return (UNKNOWN, FAULT).  For simplicity, we consider gdb and
> +     * architectural breakpoints the same.
>       */

thanks
-- PMM

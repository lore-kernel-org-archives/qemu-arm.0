Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4536098lfc;
        Tue, 1 Sep 2020 05:24:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+oW9kqf+gZa3zmFqLqSXorFSeH/ochYmmlyq+XUnI/NpsutO3O/fXpEuwalPCci2OwtJw
X-Received: by 2002:a5b:2c7:: with SMTP id h7mr2578037ybp.40.1598963048383;
        Tue, 01 Sep 2020 05:24:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598963048; cv=none;
        d=google.com; s=arc-20160816;
        b=iGhJ7UMsipluEv6QPfkrsByfPdar/Axu2ACyUov2Y18qUaya1ypSsRprgcP/bC/G8e
         6Hkmwkp1hAkxM9EhypHXc9zk2m+j+XFj/XnT1302CUKtyO7KMoXcqMl0HxlEHOVVEb4u
         sFz4LbhKSr+RkIUZrZg6Dt/nfwA5OY+Ccyarr3fSmcIqGfN1JT0pX3fjd4JRY2YWFsWC
         ffZW07mPBoTMLPrtl2Zr0Z5MAYUvAtWDi5msQLT/yVIb08Nh+Jal986A0WXi6Fjr85CQ
         vEyFRhruO0SFLwWvIdioUKRjc7VkAZWr6vfRLbkOiNn6hnb56l3t34sjK65zz6qFxDLn
         7cQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rdLm/Pxqqjl8rP7WR6b8uK22y9/1nHZDoovBciQjKWE=;
        b=bA1+fRYUhFdRHa639gf/VIkBSV9oKPDqutYjKcm9xssqvtUaH5/TDO+KbWV0ySXwQN
         ZBWmSvQCh9o6EC3SFP95LvsjH+LfwFGNkitFEbMVR+VlXrPDNjp1R5C61KG7lLMxLurD
         Fg1X5KABr8ZFXF6mfsKPfxSfaUfpFg8U66np+ze6YSfPUGc2Uwy2LMyOd5TT4esSlCPi
         XA7cV6Tj1zik9Se1Cp0OOR51YjH3v2E9ys2C1FDKGj/Vgl8Dh7Mjb4RbSTnueGrTY9sL
         XT7qXjUnbFpNpLxc0rL0+gcGZ5J+7oGYP9wZDEmSqCqhROpsZAFxRZiJj2ohcnpbu4bG
         yH7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=toOKTv3U;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c187si899031yba.355.2020.09.01.05.24.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 05:24:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=toOKTv3U;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kD5KZ-0005hc-Pb
	for alex.bennee@linaro.org; Tue, 01 Sep 2020 08:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kD5JL-0004PW-S1
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 08:22:51 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:42083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kD5JK-0006wH-9g
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 08:22:51 -0400
Received: by mail-ej1-x642.google.com with SMTP id q13so1314686ejo.9
 for <qemu-devel@nongnu.org>; Tue, 01 Sep 2020 05:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rdLm/Pxqqjl8rP7WR6b8uK22y9/1nHZDoovBciQjKWE=;
 b=toOKTv3U6hU49wgCrlyF+iptCOGFriFDOGxvZl93CWUK5tsxt86QWYSlypiFxALbQf
 O+OlXfsJfFrsRmt+3rBXJF6UKvJV8xW7wuJCC2U9nZ+VULUSLC1dbsD8ZSCJ1HZH1cn1
 eJEupNEQhfS4HlOcS08qcSncX3Cd/nf6VhsoSomnJ328DSmURVHJYTZzJRvUq+rPgSHM
 oMl27jzlKNkZsZuLII0fbtrShvIkKJYBVFl2+Jg+lPbhnTV5PPMkvKV7k93eggIJN5J3
 Nt67UCE4CuOtEPZryBZH7AQXh9VMXPxMhRgTRKC+fxc/KKuLi6gumVPRoJBXOmOZnGWL
 qHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rdLm/Pxqqjl8rP7WR6b8uK22y9/1nHZDoovBciQjKWE=;
 b=nl+UzZb+P4Z9+7BLjHv4Uvy/82Fm5LcRILzjIQWZnqEOo7EY7FWncdpBuXtQ4DLoav
 mXUrxthr115JYV9Va8rCxJbn16AC1R/FydEi26jV5dMKCngAiptJ6qH815w7HnX2En01
 lGxpalfbyGQE9e8UiKmtz8C00ydzWS+PkRq1PYqqLI2bIDxSxMfpVOUHIeVCGvl9gRQc
 /rZ9D+xui+7GHkjkD1KTWmeoAtNYOwyBwzAoFMiUyDONNYGv7jQPllGPjGYhpLhFGDF+
 mJJ6sw9EhAM2KwSV/ZlK2awxVrU0reGU45rz21Tmn8zkt1O91UFQawGkDw4oG3u7GlMT
 Hn8Q==
X-Gm-Message-State: AOAM532oTSR2cZYPEO4gEvOquvT4LKCYkRcLQ+bRwV7V3ih/KVMZp09q
 Z1aurrCpmue/Ltz2qrGBku+KaeITlCgzp3KSADUNBA==
X-Received: by 2002:a17:906:f28b:: with SMTP id
 gu11mr1177181ejb.407.1598962969020; 
 Tue, 01 Sep 2020 05:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200827124335.30586-1-leif@nuviainc.com>
In-Reply-To: <20200827124335.30586-1-leif@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Sep 2020 13:22:37 +0100
Message-ID: <CAFEAcA8WHi6WPzdq9Mn6M26Xo3_VDAC401OYSSg3t-g6JOL0Rg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm/sbsa-ref: add "reg" property to DT cpu nodes
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Graeme Gregory <graeme@nuviainc.com>,
 Tanmay Jagdale <tanmay.jagdale@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KqU6LKZ66U/g

On Thu, 27 Aug 2020 at 13:43, Leif Lindholm <leif@nuviainc.com> wrote:
>
> The sbsa-ref platform uses a minimal device tree to pass amount of memory
> as well as number of cpus to the firmware. However, when dumping that
> minimal dtb (with -M sbsa-virt,dumpdtb=<file>), the resulting blob
> generates a warning when decompiled by dtc due to lack of reg property.
>
> Add a simple reg property per cpu, representing a 64-bit MPIDR_EL1.
>
> This also ends up being cleaner than having the firmware calculating its
> own IDs for generating APCI.
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> ---



Applied to target-arm.next, thanks.

-- PMM

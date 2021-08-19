Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp624439lfg;
        Thu, 19 Aug 2021 12:47:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+lAOvR5tyFwgf2oKxbxuSmJb1unRscujSa+g1lnyi2CgtSOX3isROeNb+4Njn7yxun7T6
X-Received: by 2002:a25:9885:: with SMTP id l5mr20546628ybo.467.1629402440309;
        Thu, 19 Aug 2021 12:47:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629402440; cv=none;
        d=google.com; s=arc-20160816;
        b=gHOztLBYsnPVAuXwuIItcbmOl/1rZ8bNzRkJA/YTxPF7JduOx978OhSIMhH2czuoOc
         GtcSaWQMAr4rzO9PRkIXSxRRXHnLqgfU3dM57wpmjKYUSWA/tVWzb2iYlK4nRqlAbZae
         4RBcLFMpHGxbshgbBsVKQQ4jBXIgzjNc4HcHJ4LVG3m62C+KKSNfk4TmbnQjl42fioV6
         5K2+O6TBZKXLPl4VpACvi1EyeDoI8d63sz/Vy3o+gbEE/ZAbnoyzbW/jTQq+fcVS+xuy
         6AFoDsAh1cWpSp1eRKxjoPFtqGpxJY/YiX4xbnIxmYvGPBlDQhrICTwAqXxeW2pzm2yE
         mdBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZVOWCqgXTunldmOAR86bLE0W72uE3GAu/PrGxuUfztM=;
        b=xHoCcxUQFvYGzqHHZEl3qYtH8+4eIibReZ4cYsHrDOzfFgeEgpHYk4Kfx6tm71XgpZ
         uOJwU/H45IVvKZxabT58o2/NyJ04N0jaXzqD+SEPYCubUhJuwzEhpDDwi8m6N0bJieOP
         AJkwzrqrDdTKwGjTC5cdBvnSmPQCErp7nyHczq1p0uIvMgI98aLeMAusFFJw9lH0Dd7M
         ZJcx1jphGI+lVzA5Oi0xBoZgbDerxYgJbl8Q6KC7Jld3eUuXpAs570Txl77wFZM/5ozh
         Gz85065nB+GVtDCnf1a4vfwHqKxLEiq4LS3ks2HO+B17ZKi+oxaKp+MOLZr27KhHAXtW
         r/Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aqfJg38z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f201si3254979ybg.185.2021.08.19.12.47.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 12:47:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aqfJg38z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGo0V-0002qW-LS
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 15:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGo0K-0002pq-Hc
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 15:47:09 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:41608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGo0I-0006E4-VU
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 15:47:08 -0400
Received: by mail-ed1-x52e.google.com with SMTP id n12so10468296edx.8
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 12:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZVOWCqgXTunldmOAR86bLE0W72uE3GAu/PrGxuUfztM=;
 b=aqfJg38zQ76fSW4AcKJqcpVWMJsIpRLtCb2j5vvpqN5fFXOqFVMe7hybUtWvPLvI3p
 HMqb4P94VlS/B03PsmA9Sumopmr0bOinRTL9Gdt4GYCPcoJ5MX4Xeigai9M+kQvbbMei
 I1kGf7aHTw8KMpanq9TZbyWrq7OZTo6rCRW0FHbaxJ6oUYwD/p8hp6t/vD1j2Np6+s0I
 9OIEY4ndwhch/2V3DOvcWEQ2WkdRge95kF7yZ00FCz1MvSS9Ti4X0mEgvFXn7AfdMWky
 cMLnJ6RrJfgzlMBZsJL97urHYVPgEdb0giraqsudw9mjiskcp1GxWv3PV1TYbf4eafiA
 fL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZVOWCqgXTunldmOAR86bLE0W72uE3GAu/PrGxuUfztM=;
 b=o1Pb9agFRBbNMkGhfBt9CF6tQqrHi7O0a2BtkU5ytTAQLRc5WUu7mUbCL3IF97ZBV4
 uHR5gGU/9rvfZRAPKY8WYX4gaUYZHt0yh6IJ0vSoH2YSNbPVDhWv6pKE9PAw83YBiOaa
 r5zTA8VwNw7Nv99k3XAxh5xPMzX0pCHENeV963mxCAWdUERN2NlVeN0E5zA021Eq8hsC
 jOad8kgb8jyMUAVhcY8r1vrit8IGiEFf2PuyqnAizABNVCrTmoUPiRPpq3+jMk0PgWPF
 qAnHH6TV4X+AtiGWcwpVzAwUCsr5LKvFkZ7BY9UD3pkugHwCTv/JlB87kMAg7Dct323o
 Cdlg==
X-Gm-Message-State: AOAM533fGOFmDKmxNX9zedIMklhjIu7NVUhwDU7sJOqqUbiWG1+fcj9l
 8u4KfZiaxfAOsUVdL+sx74GeW3xsoIg8j57GvLqE6w==
X-Received: by 2002:a05:6402:3099:: with SMTP id
 de25mr18056850edb.36.1629402425192; 
 Thu, 19 Aug 2021 12:47:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210818010041.337010-1-richard.henderson@linaro.org>
 <20210818010041.337010-4-richard.henderson@linaro.org>
 <CAFEAcA9NF0zR8eyzys-V6+VjhfM=7WGLYMYTHkSm-RSH7LHnGA@mail.gmail.com>
In-Reply-To: <CAFEAcA9NF0zR8eyzys-V6+VjhfM=7WGLYMYTHkSm-RSH7LHnGA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 20:46:19 +0100
Message-ID: <CAFEAcA8eiSB2fjk7P_r=+_LzsVxtJP0H3NnNT-5oZ0FWqQq9mw@mail.gmail.com>
Subject: Re: [PATCH 3/4] target/arm: Take an exception if PC is misaligned
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
X-TUID: dWPU7LjwEVh1

On Thu, 19 Aug 2021 at 20:18, Peter Maydell <peter.maydell@linaro.org> wrote:
> Just noticed that section G1.16.7 says that when we report
> PC alignment faults to AArch32 they should be prefetch aborts,
> not UDEF. The fault address and fault status registers also need
> to be set (with slightly varying behaviour for when the fault
> is taken to Hyp mode).
>
> For AArch64 we should also be setting the FAR, which means
> that for consistency it's better to use EXCP_PREFETCH_ABORT
> and set exception.vaddress in the translate-a64.c code
> (you get better logging in the exception-entry code)
> even though these different EXCP_* all boil down to the
> same synchronous-exception vector.

Also, looking at kernel code while reviewing your alignment-checking
patchset, I realized that we should also catch this case of
a prefetch abort in linux-user/ and turn it into a
SIGBUS/BUS_ADRALN with the address being whatever the value
in the FAR is (for both arm and aarch64).

-- PMM

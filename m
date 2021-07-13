Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp657379lfc;
        Tue, 13 Jul 2021 07:49:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmdikR8+0OCAuKhkkIxJh3M+djiOXhfkidPU8mMyjU1hBb409eObA5NMSb78XMQb5Kl5SM
X-Received: by 2002:a92:d3c7:: with SMTP id c7mr3165664ilh.59.1626187745832;
        Tue, 13 Jul 2021 07:49:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626187745; cv=none;
        d=google.com; s=arc-20160816;
        b=y5Q/Qbzk9laRzJPkgIQZfBoNuDOmvSOKSs+Ln/BVgAxF/lRvBitdnYWzKkXx9bEzc4
         8TG2krN072tZX9GJWSV9FbaFnid+9jcjrzEVjwmLW0wG01BAyzTALyNahy41CmWgZO5g
         Ta6t59MmknsDON8s+dS4d3ImOXRoSyO1Wz+S3McASRvemhXYgVGkOIvezKOgEa5n2Qoe
         DA+Ov/z5VNnPvFHAMik5Nc4bQbZMsFeW/pNTj4ryT7PGahyvI8GdFDDHk6FOJjPn+tcY
         t3a9dUk4BQJjy20i6VwJw6ltDxn/053SB6TF69dOJigvLBsVavE+AO94SOdk3B9ESA89
         NjLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aOdTLvUu/CksPpsv5K8PPdX1hhzVsx/u/WQZzZ9mkTg=;
        b=oXauipXDxLXcgY1ek1wCbs/oxJrq2cr1vC2ofOql04j5WZcXyqS9Zbg3ucOMNAWWGZ
         UCI90hAlM4+GFbAzFT1+jCPftYPETAYCs+9qZre4yukdFHTI518QIJX4yYYo8ej4PIG5
         tEUesFE2TefnowOmtjHAXIn918sDDom9SIVJESDJMprXtI71RbxLNs7oslrrp7euehoU
         2tYRa5W/NK70rWpU6wK6tWy8DCl/M62+5Bxdq1JlXYqcYnw+cwmI91ti02YNoJH2rGuv
         CMVoNyc62uydYPlnAwjMOl0dsI0ZmS/DttA8J57yPwjGvVk4RWseMwFGE2R8Hq6taJR+
         TuNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JkvBDf6+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16si22574350jan.14.2021.07.13.07.49.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 07:49:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JkvBDf6+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3Jia-00042c-TE
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 10:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3JiS-00042D-PV
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 10:48:56 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:38819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3JiR-00023Q-9U
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 10:48:56 -0400
Received: by mail-ej1-x62b.google.com with SMTP id gb6so41959509ejc.5
 for <qemu-arm@nongnu.org>; Tue, 13 Jul 2021 07:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aOdTLvUu/CksPpsv5K8PPdX1hhzVsx/u/WQZzZ9mkTg=;
 b=JkvBDf6+PFrFn5g6kH6kbWcfo3tvjQc5fqGkyvt9o9zSpNo4t7K+d33reQNUwpfmmC
 5ooCDt/QJ6HMj8pTLQSOvewbOVx+XBsLyHBncFLqh/yqYMrdNsqTKuZwYwuQCzjZwjBs
 boUZNf6LM65xQPYZL2goIhYPFnHHrm8aWFsivs2RfVc1bT/rbhwt3t37TaIg9VBToY0p
 pIQPPMpjn9drNWZsPXe93leyhguaubvpn9mbzef7TSo9a8KmkUUULKoEDYJWqgsJI1vL
 QWP1jHC6M/wDaIuYDTeDIqDZGwxxTlIEiDXUSVO2i0qfD24Dsa1LHRc20F/i+sI+gKB9
 FBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aOdTLvUu/CksPpsv5K8PPdX1hhzVsx/u/WQZzZ9mkTg=;
 b=ZolEZsVM6Lp7qAqooT2BKYF3acPn0l13lXCotfIUqlx9J1HOue9Z5jEUey1ZAz655h
 MwwX+mZ2zqVA35lT7bEBb0AV/QDGSgXTUzji4b2Y1IBRynX9rsY1QVOumtXVMnSWn2lb
 POTM9svQ22hFOEIxlxiuTi95gJoQsSDNUq2lfN5sCqNudFO3uIbZCAogwEruEIIXvodb
 3ujemjPgeVuEwEcbMQ/d3LtTu9yOFhPQljvuedBo4Q9oEOTg8T3a8Ygs7d6jSh+F1JZP
 sm7Ww0izu4Nd4JU5dH0pdCzNyF77mB7ACYG2D6Kk0B+9HEbP/2nwZxe59GSasMcWcSab
 Gbbw==
X-Gm-Message-State: AOAM532QHBoNkfOBbovalSorz2njiaGy7ap8N9jQhktUsZ8PdGLehpbs
 VZmttNBKrTSp+wYbOMtm7lGQc5bwpfKB1tJFO+ZPBg==
X-Received: by 2002:a17:906:924a:: with SMTP id
 c10mr6171235ejx.85.1626187733832; 
 Tue, 13 Jul 2021 07:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210709230621.938821-1-richard.henderson@linaro.org>
In-Reply-To: <20210709230621.938821-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jul 2021 15:48:14 +0100
Message-ID: <CAFEAcA8ozOismw-xUAe1qnWbq4DP=45qWjf1+YHwgKrRYqJ+yQ@mail.gmail.com>
Subject: Re: [PATCH 0/1] target/arm: Fix offsets for TTBCR (#187)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
X-TUID: 6CYwo5vzVFn3

On Sat, 10 Jul 2021 at 00:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This one patch fixes boot_linux_console test_arm_virt.
>
> It does not fix all of the failures.  The next one on the
> list is test_arm_emcraft_sf2, where the cpu boots fine but
> the net device doesn't work correctly.

Applied to target-arm.next, thanks.

I'm not sure the TCR struct's precalculation of mask and base_mask
is still earning its keep as an optimization. We only use them in
get_level1_table_address() which is old-style v5/v6 page tables only,
and all it's saving us is a bitfield extract and some shifts, which
is peanuts compared to everything else we do in a page table walk.
Perhaps (not for 6.1) we could drop it entirely.

-- PMM

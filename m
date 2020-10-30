Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1588983lfa;
        Fri, 30 Oct 2020 07:30:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2f9pxUyaNuNnX/cNqq1h/bzsdgDuQ2QZTGap0qu3T6NpA116vth6BKV17bUQsxaE0Daiq
X-Received: by 2002:a0c:c187:: with SMTP id n7mr9864027qvh.19.1604068247103;
        Fri, 30 Oct 2020 07:30:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604068247; cv=none;
        d=google.com; s=arc-20160816;
        b=pd9td0FQptYKD6Xiv1mQ4ljxt2kch+cYa4P/QEFgUsE1U5CONTzHcYLpibZRks2FdL
         kQvCRXaQcnCS+3le1+tM3TW5/pabAcSA8+cmwsRZCUpbZgeRU2rGBBRF1hqRd9Gnk+yH
         RvOethUEpnGMV6uN1lOAX2ks+JDTcwQDjVuN5DIDBsePPaauJ5gj5aOkY0Fyfn4aq21I
         b3BMGgmSxFPskn7UQl1V0q52rNfxCOh1U2xHWspThUbwoTJ5LctB7xebBkZdDk+CSGK8
         LcUWJ9DufZhqcEg2D0l9CaS8oQnIWjGNChDCQ3Qb9VU/KFJXlg1GbBfjynNW8Jwa3nLy
         UOtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NFC39zceG2i5PizwvZ93zNijf5+W6zdm3h74OVX7MHw=;
        b=IrstEwanoVRL/Q/ULht73KBS8yi6Md5rvsITHq1moA1Km5Xg0NNXBqpxelhf1P+GfJ
         2VvTkGuh3oWRf58j3JhZuG2C//40Mdkj4WN/0WdR3YtQmTLZrJm5mfLQM0qUN3NdB+mH
         49KkveodbZDPLhCx8tlmxkFf17tjl/quBjeAOZT3qzOq0h1vW+d/Z6Wpx+zKHAh4N4BZ
         xXBznAoL5qC3hAZC8ZQE0SE33AjKcxMXb2/3b5woU6e8YYtmYrhf8BIGYnFNIn7cpEjf
         zorMBzZUYduaDijNmMzefkWGRbXxzRc3lcz1rnd+X6Z67k0f6mfPypdB3Mw5EWLCCxHK
         KydA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=u+QJ+YdX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7si3633286qkv.325.2020.10.30.07.30.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 07:30:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=u+QJ+YdX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kYVQU-0006Vq-GZ
	for alex.bennee@linaro.org; Fri, 30 Oct 2020 10:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYVPr-0006U4-CO
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 10:30:07 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:44450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYVPo-00014Z-7B
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 10:30:07 -0400
Received: by mail-ed1-x544.google.com with SMTP id w1so5737534edv.11
 for <qemu-devel@nongnu.org>; Fri, 30 Oct 2020 07:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NFC39zceG2i5PizwvZ93zNijf5+W6zdm3h74OVX7MHw=;
 b=u+QJ+YdXWOzUPGLjBli0nwiLKVuv471nujgNi/3R6oF3X6zsMN0E3wsg75seRCVAuJ
 JNTvntIE1UJOcldV+vP4tAmdR4YuG9X9O4dCa4jeXNh+DzfvUAT/D29r+tvNzkpOxo6u
 Sgov0uQD/mFtATUnQlarNkCeeRmr9VSQHvYplgEV1uBnR7DL4yzu7LTaGEJN/ERZ+4cK
 SbYwKI5QGBevA+jI8sVHtmWswVk+1Y5DLGRjhjyomj72R4v6nUIsFH27ROmlUnWRmOc2
 PmJ2rki2L/MMr8q+Wi/hCLJ/jXeOecjx+uf3bfCg5yL7veNuBSbzqikNrV8FLX9AAkRv
 EQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NFC39zceG2i5PizwvZ93zNijf5+W6zdm3h74OVX7MHw=;
 b=gxO2jfPehQeiYrUKZxjqX0qTWnreXZucWVeGO8d+e8JcqFYIr65HpeHDdvlnaeMZUD
 FaUxtJwNH2VPrrKCutatIJivpI085asghcWEown39lxqERcO79+B8CsEKXnDM2tkFrGH
 /fUw7u4QUwsTYCgPy5vH2xbde0WFDzzO7fIRqSC+87d+2F5CJLPBDxNi4UrHYC5hB3Wn
 TXNfAKvhv9R+MJbLR2TAIzjBQEfS7pL5Ve4ByOIh9ddM3d0M/rAQE4UFOHwoe/gHH4NS
 ZHYygpAIw8GDU3PdVYN4LOfteFlKoRFoju4kUvCFTuxxmJAsPHnzq8qzICbfKiDfxO7I
 fi5g==
X-Gm-Message-State: AOAM531d8IQa2ecJZXvqq57366j51Phfcs5morIvHiCGs0m5dkkL+NmA
 VPSo/H2cvYRzTPV4+D80ZW2E8yoR24E53o47ILV2/w==
X-Received: by 2002:aa7:d699:: with SMTP id d25mr2639196edr.44.1604068201154; 
 Fri, 30 Oct 2020 07:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <5F9BE993.4050406@huawei.com>
In-Reply-To: <5F9BE993.4050406@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Oct 2020 14:29:49 +0000
Message-ID: <CAFEAcA8hpb2UVd3PSY4XuEpKYeu1Am1+41DQ=gN48xbAv281TQ@mail.gmail.com>
Subject: Re: [PATCH] hw/display/omap_lcdc: Fix potential NULL pointer
 dereference
To: AlexChen <alex.chen@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: als7DEkkkXL0

On Fri, 30 Oct 2020 at 10:23, AlexChen <alex.chen@huawei.com> wrote:
>
> In omap_lcd_interrupts(), the pointer omap_lcd is dereferenced before
> being check if it is valid, which may lead to NULL pointer dereference.
> So move the assignment to surface after checking that the omap_lcd is valid.
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> ---
>  hw/display/omap_lcdc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM

Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3527312njb;
        Tue, 10 Dec 2024 10:15:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVLuvb+S23phi0ooe6yjBfQRaaWgdX1VoV5z5uilDVUYzgk3nsbLgqryA9Xoh2p6ai1c7JevH2eLtnwEQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGD0alimcrjh5dnk0O7yPkfdfnBb+VXYK/aSQjT+5F1DMkXyUHuk89fQaVkGWvwCzaodi0g
X-Received: by 2002:ac8:57ce:0:b0:467:5e69:2e1e with SMTP id d75a77b69052e-467752f6cb3mr78390241cf.26.1733854505917;
        Tue, 10 Dec 2024 10:15:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733854505; cv=none;
        d=google.com; s=arc-20240605;
        b=Iixp3DHSyjeomUldU0BeCd4zmx1CGnRvP2IZcnex0JFiXJP5RLxQQMlboJUHNux6H/
         DeLC1vUA30vWaCV4AjVZZBlEac99rcXwnhPFs8DcoiZ45GI+roNbUilw3tPwJ/NqM4rt
         we+F2P27gQC6HaGGIyEivMHvT6t/bRby/QUFB00jcNx4v9FlgPafzw0JWa0YgwE92HqH
         EOt+h7dHMbP0Y3U6F+IXt6sRdD74nG8WURWuEypbu9OPiS/lV8R2W7XR5UItYjb6SYvX
         9B+ioYx0Q7X4UmsmISxNBvS056eIOsyG87etIeVQehwUqIgM6uLK8CNu7cxRxGHSSxpK
         kq7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=hFPlVsLKIwsd78NBZXnTlXAizTqn1aFdRF+H5hipd3w=;
        fh=PKodlsZ4sLOulf3vcyB9a9UvxkkwctzJ7UL5PZ8dNXQ=;
        b=S/5sX/gBcder+mOnjjQMXDVNvK8fZmyay/nU33VPGdpCy0WipQC1jt+bSlI1qGwkRx
         d3x4kE6jkQJtd4hzQyo6hOzBKZ5clw2vLPpaFI1eOHrACBzmUlGQgyI+G3YVYsap60Do
         PJf+hohWq/zJLq8KLG0dwKcPUC+tFIosLAzWhRY0oZDJcXvjmICtJVSv7JFrvigYD8O0
         2Zp4tAK6C67qEL81hCYIwD6Key3/HLwUGn2sjz6ZPBH6dItJW9gjXke2C1wZuXdYHjsB
         7QGDjG1ZjarTlE3cNxuE2XiHDBAhYwl5Rb4ub70LiF0IcS2yYdJ8+RiDPzd6M3L8JoQE
         U5Gg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y4ZAKT+H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46748eebc41si94083781cf.351.2024.12.10.10.15.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 10:15:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y4ZAKT+H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL4l8-0007bn-B4; Tue, 10 Dec 2024 13:14:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tL4l3-0007Ss-8S
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 13:14:53 -0500
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tL4l1-0002og-KW
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 13:14:52 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-6ef6ffcc2dcso46441127b3.1
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 10:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733854490; x=1734459290; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hFPlVsLKIwsd78NBZXnTlXAizTqn1aFdRF+H5hipd3w=;
 b=y4ZAKT+H3Jt6JELvc+8NQ1QTdOFFMBkjks8y2j9qpMeE9P3yaP2/3ZsOwwCWn7oC9x
 IXWnMA/IYzo+OBlHVHotkUTeJvhER0x2T5QFyYzex0M/eN9n9UECUlVyLMp3dJCwES3j
 pS6eLlA+ZYolwD64Qn3NYK8i8cC2fp0miJv1VRrTRsng60CW7jhq2/T+x+cz4CghHPPg
 zpJ7/oNAH4I+Wf01JzQ/hp1wLHRiEUnTaCuYNSXmroQONHW4iUGeYG5/psiJpZ6wDZ+h
 o6SVSPy1Uz74Y5YXt9aDq1eJHsuGRiZRiDBgAkojvVatgG4FTQ3rT3iWE4mzUqB6Xoqn
 3J4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733854490; x=1734459290;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hFPlVsLKIwsd78NBZXnTlXAizTqn1aFdRF+H5hipd3w=;
 b=kEJeLuycOCM5bryQqFXykoBhdAR8xJVUBafawCk0+ovAnNIutZ6gNovd7FGgn7Tkhr
 Xr4Uv0AYA4XDA1WVWNi3t39EV/dUAZBsagUUwUrU9Hps8Kr/989en/Ewl2AQXlNIROpB
 1pUTGJ+MEFeWFc8KO0/Inz/Rmcxm220C6pkRhyZaoWHuLerGe1R6Qr+q/EHnk5pxbXNq
 KdoiKceVUOc89c3wte0paXX8CmcMyVEGY6KbJZ4vKUqcvR+7PL1cw+gfkPwqUKrB1T6E
 5SxG93WS9vjHJNOY6huVEo4KNBPgVgxqLuKqkEIq/fbfivS0Az/KQQMHAALrmmXxDuAt
 LbJA==
X-Gm-Message-State: AOJu0YwobI/nTXma+YMWTpemeyJWpbqHRr/KtSCuk0BQ9XS/Kj3o3BEa
 8rl1pSYFW9kpDIMTew9U+rq2LQZPliuIkSeV68HTPSNa+rc9qxENXEI99SgBxTarl2ib34L3avJ
 x3M3fzDHRntPKnY6xNHY7QL3rP4addbM89vASPw==
X-Gm-Gg: ASbGncs9+D+zj4GW8ac8bHc4bkIxM+NDqoPxldN+crWSUjlt8jffG0pLwUHBQ1YRD1r
 M75VD9JUurPWvdZmrN2Jt5Dj3XLjPlIkhyoXH
X-Received: by 2002:a05:690c:67c7:b0:6ef:f020:601e with SMTP id
 00721157ae682-6f02588d7b2mr44114347b3.19.1733854490541; Tue, 10 Dec 2024
 10:14:50 -0800 (PST)
MIME-Version: 1.0
References: <20241210160452.2427965-1-peter.maydell@linaro.org>
 <20241210160452.2427965-3-peter.maydell@linaro.org>
 <bdbf12a9-0e34-4924-88a5-80b2f7eb1961@linaro.org>
In-Reply-To: <bdbf12a9-0e34-4924-88a5-80b2f7eb1961@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Dec 2024 18:14:39 +0000
Message-ID: <CAFEAcA_tanX5Z7dms154Ruf1CMCkmTG_w4OSKRiaG0MuSPaVSg@mail.gmail.com>
Subject: Re: [PATCH 02/10] target/arm: Move TLBI insns for AArch32 EL2 to
 tlbi_insn_helper.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gmWSNF400/WN

On Tue, 10 Dec 2024 at 18:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/10/24 10:04, Peter Maydell wrote:
> > Move the AArch32 TLBI insns for AArch32 EL2 to tlbi_insn_helper.c.
> > To keep this as an obviously pure code-movement, we retain the
> > same condition for registering tlbi_el2_cp_reginfo that we use for
> > el2_cp_reginfo. We'll be able to simplify this condition later,
> > since the need to define the reginfo for EL3-without-EL2 doesn't
> > apply for the TLBI ops specifically.
> >
> > This move brings all the uses of tlbimva_hyp_write() and
> > tlbimva_hyp_is_write() back into a single file, so we can move those
> > also, and make them file-local again.
> >
> > The helper alle1_tlbmask() is an exception to the pattern that we
> > only need to make these functions global temporarily, because once
> > this refactoring is complete it will be called by both code in
> > helper.c (vttbr_write()) and by code in tlb-insns.c.  We therefore
> > put its prototype in a permanent home in internals.h.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   target/arm/cpregs.h        |  4 --
> >   target/arm/internals.h     |  6 +++
> >   target/arm/helper.c        | 74 +--------------------------------
> >   target/arm/tcg/tlb-insns.c | 85 ++++++++++++++++++++++++++++++++++++++
>
> Subject has an out-of-date filename.

Yep; as you've probably guessed I changed my mind part way
through about the best name for it ;-)

-- PMM

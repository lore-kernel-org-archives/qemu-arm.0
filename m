Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1501580lfm;
        Thu, 25 Jun 2020 10:15:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxupP2zMl6zxH+l0Ld+RtdQ56Z6QpiB5TrOTSgF7/jzogtp3FPHQXB1j3wB42NGc4a3ipGQ
X-Received: by 2002:a25:d88e:: with SMTP id p136mr55601052ybg.358.1593105343205;
        Thu, 25 Jun 2020 10:15:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593105343; cv=none;
        d=google.com; s=arc-20160816;
        b=ZR1g+V6DgKDyRbIkGYHegiMbw/KZMN50DBTq3LahApbPRQASbMJvIKshlU8nJwZFLj
         48FrUv/arPil3/N80Z1EKYjOGBM33hyiswbyQl1cEhLJC6lErcmQMR3oYU/MSC9jq5Xx
         O4hwStfhbKPhJbZ7TdqNQEq6wf6LmGO7dj8aQzzinfKtlrAmKqhzYDw52wHC11bmbsfq
         oNKhDTL3LDRaC4vci2jvl5bj6MCwgAnt/HLTyWDfErjI2mNcmP5Pdtu7iiyr9Ymnsyu1
         294P/kHiTkBhCySQ1pYjOsbXoZJHNkxyTEuunh/nSw5R0rllvTdZHJVtTA3BTQhvgvpU
         tJNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/DHuqCTBEttHEHbwY3BkdETHjtz0WWooikM9ux/nuQM=;
        b=FeI3LANe18kRwpNzalk24cvzV2YGc4EB8F5hC8KcIwVgTLAuT+LNceaTy6sA5eYSUI
         4yK4gYhRs+gCFFi6KRcQlMd+AU/E3uog7JNrGHhM6OAISLyiv1GvR+DYKcgT+kBN2x21
         HQXcf2TW40Iwtg1IsYUkldzxRna3Y9HYq8CV9D8+IxW6suhVYqCxisIsI7YgoYLtkIEY
         6b+Tm59cJGzLw4Jgl3qnyQysaS9dLA8nuZzqYHqmE2zP5DhatSAM+Vwvk61QMp67brpF
         tw6hgkcgfkAtajyFLg5CDZ/pRGjZ7AfkyxBCUUMnJsErYeCL16sZSSj/R0aGVG0i45EH
         OLTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X72peg7u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s88si27626325ybi.345.2020.06.25.10.15.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 10:15:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X72peg7u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joVTS-00088S-3D
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 13:15:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joVRu-00071d-J9
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 13:14:06 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:33353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joVRs-0006Un-Lw
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 13:14:06 -0400
Received: by mail-ot1-x344.google.com with SMTP id n6so6002635otl.0
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 10:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/DHuqCTBEttHEHbwY3BkdETHjtz0WWooikM9ux/nuQM=;
 b=X72peg7uJ05DfE3Ay16Ngzw6Cw/Xao9gNwroTOlOrAspCZu1IUgEpP5d+l6NocvyQr
 /ds6rp3JgxGD9iB7kIk1Fg/BOT8YdABB5P082pCZks5rhY6LOpjIq7iVKnuvOV2aTsQR
 D5Yj3zs6Ew2xZgqrgrrBPgjtF6c54zLfceRip+Hx0Ui7oQo4+McvEv1RG14TJm86fUVq
 hCaQJA5a1dwSKQJJuBaxvJQJo9A88fjt+YDlRQaL7ikpGhgTvQ82RHZWRPLfOhYXUiIO
 X4I8fPEjAU35/gHvNq9QeJddJSpTgGTLpc5vlsFe+Dw7lJN8ZaObRVH/JJ2lyG1+NGk9
 hc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/DHuqCTBEttHEHbwY3BkdETHjtz0WWooikM9ux/nuQM=;
 b=Q7TDwe3X42FGd4NMt89nP03Fh24w1iKnK2SPpu3VadYnZJundwR7jLPqrfr++7KvLD
 M3ukMSLuQXdGqRCGMif+A6CBVUIMClk3pUHM5iyhuxFeMjy3dhKyyaO/MD3NYAty41sI
 FKEydq8R2o4ZgyJxN2FuE+J8a9dFjcVAnFTxcUnXXSH0Wn7jRy5WvkVQpWx6S+eWwePG
 9jq5VIpUNF2Q9FYVmTaRH2U67Uvt/iGU75mYdoP35ghhM6LJds9IfYoEdMewXTlfOc5I
 QXF5SvYV+aAxho+BrSIzY/2yOfjFcNF+NW5e2uOgTvalb73lQTZ2Q1RnMXppcnpcBjh7
 cAWw==
X-Gm-Message-State: AOAM530C8v628Z+3K9kXGD/9wHdMvie4HFHmoim08+UZIm729Yl3WaKk
 DRhyd7eH69k1aDCVp22mymkkpD9snuppqlXTXj6bfg==
X-Received: by 2002:a4a:221a:: with SMTP id f26mr28475121ooa.69.1593105243134; 
 Thu, 25 Jun 2020 10:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200605041733.415188-1-richard.henderson@linaro.org>
In-Reply-To: <20200605041733.415188-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 18:13:52 +0100
Message-ID: <CAFEAcA8XKGLipda3FaowO=JT1Ey5x0BKMqEt3znThk6k-ssJ+g@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] target-arm: Implement ARMv8.5-MemTag, user mode
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y40iaNCD9lR7

On Fri, 5 Jun 2020 at 05:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Version 1 was back in October:
> https://patchew.org/QEMU/20191015163254.12041-1-richard.henderson@linaro.org/
>
> Although that post claims there was an actual v1 in March 2019,
> I can't locate it, so... whatever.
>
> This version -- call it 2 -- is the first attempt to implement the
> actual in-progress kernel abi, rather than making up a private abi:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=devel/mte-v4
>
> Based-on: 20200603011317.473934-1-richard.henderson@linaro.org
> ("target/arm: Implement ARMv8.5-MemTag, system mode")
> Based-on: 20200520172800.8499-1-richard.henderson@linaro.org
> ("linux-user: User support for AArch64 BTI")
>
> The full tree is available at:
> https://github.com/rth7680/qemu/tree/tgt-arm-mte-user

I've reviewed most of this series; the later parts look ok
but they're implementations of an ABI that hasn't yet gone
into the kernel so I haven't bothered to look closely at the
details.

thanks
-- PMM

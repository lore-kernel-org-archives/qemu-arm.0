Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1604877lfu;
        Thu, 28 Apr 2022 02:54:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwWGLxMTgRzfbGzTBYhBxj9u1/qEqtBY/nKqeyrb28EcOFCQSbFGLYhrGCgie/mTKy8eRn
X-Received: by 2002:a05:620a:16c6:b0:69f:64e9:31ba with SMTP id a6-20020a05620a16c600b0069f64e931bamr10479589qkn.344.1651139677099;
        Thu, 28 Apr 2022 02:54:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651139677; cv=none;
        d=google.com; s=arc-20160816;
        b=wrf/YMRdnh/Q++XDhZ/483hPuv42RqFdHudHnhlnZYTEfOeit+uEPElwSSaJZIDdVH
         ZBGjn97ntt59Jk8B1KEWRtnxGD3T9wbya51aZPV6Gw3+AWdqrHEOO722EI1GOizqiO/9
         8paTHU+6DBfIbuANsODuJhmx64DbmVe1N5yYlHDK6daUectuCCwGQkzJAW49yHRU0ZJ0
         uYTZkoq7gMsFRLkypQv+ihOLjMci1mr2lEN4vzajFNVFPaBXmWJ/KyjVyAYbWXlUniBA
         aFRBXP8LqNFhiD1/FsPHL/mWQt3a/uxX/rlSBKnvkBGs3sSjGxGwpuHYxEnwPXSiw6DI
         pt9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=43uBsnYCpbjcbMwE09rCNL8zmAsCXKgkbMVo3buZ3xs=;
        b=Vks8NgR0U25TrkXKq05vdL1zo/Gg/jSii+zUB7lSwM84gYJXoSMFfUNFRB2l25VsPD
         clmS/23BCdZqVf/LR6WiZY647bgqMW/onRwHAF3jH0bWsyA/n+E/52o/vPSqq2rrXLFE
         Aa5tXj6dIp5xoiAWFVaUGNChK9kdO66/SWYHQC3JpVAdUE+Zf0NsbQZcEGZVe1m+wagH
         kL5u6Tb9ZkIWORyXWk8Na/b1GQwpa4++R2ZdrOAwxeXD85wCZiFx6ZfXG+459+9qdLVE
         TlvBbdgcZYdPEW4YhvLX0kXERLbwC2rkPqG5pSeRl+CbXluNNZsD4pJY/K3wXdpUDEB7
         N8rA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vBON4e8t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v84-20020a376157000000b0069c29325041si1434945qkb.704.2022.04.28.02.54.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 02:54:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vBON4e8t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk0r6-0003IV-JY
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 05:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0gk-0008HK-93
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 05:43:54 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:46753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0gi-0007a9-Lm
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 05:43:53 -0400
Received: by mail-yb1-xb36.google.com with SMTP id i38so7935061ybj.13
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 02:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=43uBsnYCpbjcbMwE09rCNL8zmAsCXKgkbMVo3buZ3xs=;
 b=vBON4e8tqh7o3GmT0FRmMCEQyOkiULPB7qetL3mNPc5SUMowjXlo666FDarDz6HCKr
 TJKGJrGGECQtHyTjwL83D6PF02xcxqoxPmbEQca2Xt/zgZ0tcvGtu2U2XW6HMRZLVPMt
 Bsmvu/4PYazsfsStT5y4Ypo9qZMMem1ROghdOt0Q4iagVNqOK0jmxqjfW9bAbC1yfobA
 u2J/euV2K4B2rGh56GiaMsEYdAubRVaveRFSkEMK5+Jt6kbKMNo+zxFIPxErifjKKG8z
 o7NakYAPbdYphMDmPat4WwyQa0uJtt8lVo7TTsHbPQB7agUz2utDFyBCzD/qJzs4nrdY
 M4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=43uBsnYCpbjcbMwE09rCNL8zmAsCXKgkbMVo3buZ3xs=;
 b=ZbAJIHVMBByM5EmrOU5PK7HqZZ+PZcybB7imEyf903BbuOId5pRClQNtbSV85GWHN7
 9AZVkIjHIHDZqvKtZtRRAa3sgdC3OVnA7KsJ29TnTd6kdHt4nUroHL9shzCEHPGt0SpD
 q4j8f2zVSYxaX/zNIkIH/4IoOfaVy6qYupO2n+JiEKpXcfxHceuhSw9IEQxgPqZxT3oU
 npadrlTzrRKrgPaIEjkWn+dGv7j5NWmGXTOe+jySGi39Kk/rzx8uvp8KfOW6Vt0pT9Qn
 egTiZ/RPy0/4b1dfgLLKZ4jPKbARlpglr7YYQbEequvClKDMepmvO+j9XFnvH5igcPRj
 S/NA==
X-Gm-Message-State: AOAM5306SBT43YbXVQwrshd2QykEaq8cUss47tA59IlFYYQWpsrOaFuX
 p/Nlm3P8dRftnyDPkEs2qZwYshkN7YvysuYagndN/Q==
X-Received: by 2002:a05:6902:34f:b0:645:463a:b824 with SMTP id
 e15-20020a056902034f00b00645463ab824mr29495552ybs.39.1651139031665; Thu, 28
 Apr 2022 02:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-9-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 10:43:40 +0100
Message-ID: <CAFEAcA-kO=nNPpZuqCkAqO3fUHLjom6vyxDd8WzhNRV29C8izA@mail.gmail.com>
Subject: Re: [PATCH 08/47] target/arm: Use tcg_constant in
 gen_compare_and_swap_pair
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vJtNfvwMXwnP

On Tue, 26 Apr 2022 at 17:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp215821ejn;
        Thu, 20 Oct 2022 03:37:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM588myRzVHflCNEreDM9CXDCCbiruyiu6nKDb06uJAfO2JoJy8WR68NENdzcQ0CGX3w++oA
X-Received: by 2002:a37:9ac8:0:b0:6ea:a959:3eb5 with SMTP id c191-20020a379ac8000000b006eaa9593eb5mr8405234qke.551.1666262231130;
        Thu, 20 Oct 2022 03:37:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666262231; cv=none;
        d=google.com; s=arc-20160816;
        b=CEPuT/cCpiZIGGV5Nxvyd+Rcc7AEqXmOpYdwDcWybNPanQoI51BOuZGlwaf6V6FckG
         D+TUJIBAg/m2a13zUk5/EfNvi4ZSHOvII6q0RC8Vji7dvO/AAQP+EYAl6Zqd4T47YmfU
         46rz2WZ6lHRAv+QIh+Lj7WjrCD6aIbzE+1L5NPt7V+PGHqq9o1rtu82esD+oIP3Yyrrb
         N06pMHw9nr8hC50tH/1uWvP/BUuwvInkooLOVK9xxG2ZgVT43rJQcOZYh18Kpkw97qER
         f7zxf8EYO1c6i9z0cqoIP40AQzmdlL0Eu6KPQIvJvNQZesZyIXpvSGExAGMjLPFEAAkl
         85Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=VAF7/mjmRpZ4cPucRoBbILILRUzjFD4l4pIihinsl3I=;
        b=zxofk8OeJURojkcgL/AeqQZwSCEIutFR36JJnBMnVJuT93buZKgSaqu8YTNHTS7m1u
         tulZzd4cIs4+hngPJZE7zSvdew5IYErtNcFSETaYIGrwZMquC53cgUob9qyMXgQKspTg
         05hIMRMhoA/3iMX4/GVeRarE5rtiwfKL+tRg4bIpfMkc4PafmtFqKSJY+VC94FVzBknC
         qC1NGZC2iXJ8yk0tcBYLLESrZfEbROTDVEsmGqkFp8erj3kLTqeZZrAvmAUt+4AlnEq+
         4VIrjFUklhY4zqSWxZfm8wXe8V6Zy88yQsQDCzeBLzRijtHC7wr0c5H2eeEXCViYoC8A
         b/ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T611UuEt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fd14-20020a05622a4d0e00b00399ec779c05si10629735qtb.57.2022.10.20.03.37.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Oct 2022 03:37:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T611UuEt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50404 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olSvF-0005x3-Rl
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 06:37:10 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olSqv-0003iQ-Cr
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 06:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olSo2-0003Kt-EY
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 06:29:46 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:44577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olSnz-0000PS-UW
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 06:29:41 -0400
Received: by mail-pf1-x435.google.com with SMTP id i3so19837146pfc.11
 for <qemu-arm@nongnu.org>; Thu, 20 Oct 2022 03:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VAF7/mjmRpZ4cPucRoBbILILRUzjFD4l4pIihinsl3I=;
 b=T611UuEtZm/Y6C09aUSGvv0iIShUYWdxbQ11b0U1PKW5HzWTpqV2VV3Kef43X8+vXJ
 5lGNhVKeYwz//k35StwvMnS8uTSouNMhKVYdOm9dJRf1af+RAG4t87WhkYw6CmrCIJCw
 MMT3wJGrEl4BdB0k/cMIT4CK2qUcItamFs72hMsGr0Ay+B+2w6ppcmCcFPiF51tj2lEW
 19rAnNIuKOVwMPw4SBPuQgBYIBhFoEh+ib4qkq2f4N7SC0q3t1YDSbPcfCf0JxYaBkpd
 2hQ9dYoA2q6ZLyHyi8IjUEgncp60i5sG9znvO8hV8QZv3ZKOp7hDu8v8yvVTbqtNvDCi
 vNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VAF7/mjmRpZ4cPucRoBbILILRUzjFD4l4pIihinsl3I=;
 b=LH9QySAEqVxNQ76Cb3jXQoElUaDUqQe9Y2+7gj+4kboVnPCRRo7+Zg+pA9BxMm40l0
 2Y2eIC54LZlHC7kF8Wbmo0qpN6q7wwuWvBUxEtKHP3g8Ue3MjJ16etWMFelPM2HxXYTQ
 umsshRPQSWeXuN+kYq+iocgcvnju0NKjxuhA/JTln1+ZsZGi14xPhsxN7Qq8f4U+vTzP
 yGnenLXOOSIvlng1Xn5Uu/7+UDfw7Dw+eokI4aMxfR2Rajod1NLwaIcKgBOwspL3h46F
 coPnNI8i0bLPyHPBcfgFPAzP9RxNU4Lvr4mmrVJnDp0zHpCoGTvANLAEeadJKpmXuX4+
 ChKQ==
X-Gm-Message-State: ACrzQf3ge2WFRN3jpc3xYagHXHW7L1kOAQGE0HsjJjKcUJ3THLIFlUSz
 LZqSe9LIYkegDoNjTACXOiqfDtf7Ok4K9J3Nl2PpvA==
X-Received: by 2002:a05:6a00:1595:b0:563:8fb6:ae53 with SMTP id
 u21-20020a056a00159500b005638fb6ae53mr13296196pfk.51.1666261776986; Thu, 20
 Oct 2022 03:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221020030641.2066807-1-richard.henderson@linaro.org>
In-Reply-To: <20221020030641.2066807-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Oct 2022 11:29:25 +0100
Message-ID: <CAFEAcA_imgBaVqd-7CP7K6mwTQVrStdgKsagbDHq-RcOEHGs4g@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] target/arm: pc-relative translation blocks
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WicYXdJRZuRM

On Thu, 20 Oct 2022 at 04:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is the Arm specific changes required to reduce the
> amount of translation for address space randomization.
>
> Changes for v8:
>   * Add a comment to both gen_goto_tb concerning the ordering
>     of the pc update vs the goto_tb opcode.

Applied to target-arm.next, thanks.

-- PMM

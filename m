Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp2661277eja;
        Mon, 4 Mar 2024 07:32:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW812Cz70hlZYRCSSQz5UZdwj+soA7L9trYI+3Q4rHPm4fQtqKjLoPN8z6/6pEEZ4g0AETMg8LAqEquq0UdM+RyydHUrsQJ
X-Google-Smtp-Source: AGHT+IEh2wTHNoZ+H9LTofafH7oVgmGBpUsr8fpwEd8VKIWSB30ax1uMxr160s1QiWZmOI3AL0r8
X-Received: by 2002:a0c:aa4f:0:b0:68f:2c76:38dc with SMTP id e15-20020a0caa4f000000b0068f2c7638dcmr9696517qvb.57.1709566328076;
        Mon, 04 Mar 2024 07:32:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709566328; cv=none;
        d=google.com; s=arc-20160816;
        b=wpREpDe6CXfteq6PdskAdK7Lc/+bv4gyYJovGI0J+IebKAUFQmDAnlR3ifwtFOHu+W
         HHCJk0DA7TazisBIbJpWD+8OEGVHXsjXGwOBZLn6XVSUpUBufeEepqSrkQFPPg7AlLQX
         gPG6BOIhrqHIQ/KCV3EL268dN7X9WTXZQK2821dkrssJ6KHyZBFKCUXHhTC80JnFimrP
         EHS8axOwlyT1d3/Av/5fMyeKBYdupEfPMhwh9lgi/a4B9KC/v6BaJU/kYMNjpgHeR5ey
         O9Q3fP7+J4/2YlvY4wpSc3iCuv3NYPScLyVoEVNXjg+EG0vRAucv04BhkQY6mOIHSu6F
         co4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=jNlEAps2RdInrw/fzJby2xxi5laZepePUW8FL58p5Iw=;
        fh=4psryKizM46ulqyC4fMhRH1f4fX5ydgy9bmg+XmTRjQ=;
        b=WlneRXSyU0ZA6bvc5qK3MYjxdZC9PbieidpXbFegEVK+8Y4s/HoGQZ0uw3DKN2dwsG
         /nF2R1rGunIslTHBALZLoVMhv8ZuGUFM1Q5GfnQD4B0Oxrv3ZeHx+lr3znFJA9RfQwkd
         TNqMzdBvcjujcodmFPET1TcEO8yh3cUKiNZPsAvEqfUSCEhdC9pLqFBvUrfApzR67rx6
         WsIWiJA0elGcpay6aL0l4dfxZl5uyFzWU5O4Z+y4ft0CpguWI1lahSdXzLrxp847vG2I
         qVMnGanTyXtHWV0D5Xr170yaXJemJP+atrqyORwoLQjQG2BRGPZ2b0Y8nwcvJyqqvng5
         tuwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OZFZGVET;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a4-20020a056214062400b0069006b70b6csi9916731qvx.280.2024.03.04.07.32.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 07:32:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OZFZGVET;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhAI7-0006Of-OC; Mon, 04 Mar 2024 10:31:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rhAI6-0006Nx-1B
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 10:31:46 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rhAI4-0007IB-FT
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 10:31:45 -0500
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d180d6bd32so56739241fa.1
 for <qemu-arm@nongnu.org>; Mon, 04 Mar 2024 07:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709566302; x=1710171102; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jNlEAps2RdInrw/fzJby2xxi5laZepePUW8FL58p5Iw=;
 b=OZFZGVETiy7Uo66D1HwG2vfo9fbcXJppmmDOkF2D+Y5cq+MdvxHV9/5tuVNmyLbYiP
 +pRTo/RuNlF+vDX5d04h1GkhUqAofqhysgbZ91hKywodGQ+/JKdqGTpStlObic9UI9qU
 rHkFc9X6ebON8ojL31wCNhZPFCCgH8QfQpuoa3PLXvrbuozwAfdd/05gk6Q+pD837DyT
 N97Rti9sQ8rDXW1IhmzAFj3lMcEdXcoUjqLXyysM324uin0xzMqJQyo9MotfRQSwD1t/
 qa7PdU6RVQ+29suO4BJpNIi9rBj1HjtNOnwGkwee4lbCWiJ2Es6ksKR0HvQzYGy5gXrG
 RWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709566302; x=1710171102;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jNlEAps2RdInrw/fzJby2xxi5laZepePUW8FL58p5Iw=;
 b=QHmtNUguvEsxj4y+W7g1IdQv6t+08mp+Pgwk/ilQh/lTMbENvZkLWZMqX+uWBbFYhU
 8pygZao4ZJT6kmeuU6NbS9lQhYiom9/czP1MCwl2erwG8NAVCMcmM1sUEw9ZvhGnZaFR
 JS6fNSSArC9zEwHmW7BQSqlkJN/ityQBh0BxAI6FINwUW37ACTRYgPU4gEr9dgcArXcf
 RZy+e6rMxfFtD/I4uzno455LmYIKYh7pwaPm5BvVhOfKo1ZGvaaaEogDAFe+ysuI4fg+
 zhlskSzmp8hxxrpN3FUM0nanCXqxr3pCSH3aXBATEYuhGRHlemezXRYx/h57hz/fMLEm
 xvKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCTiRx0ShmQrxpn5GQIsWb27aUaYRAyoBNKJHCxaeuW9P43RbG6HFjEaYWPUVcDdd74RMEQeCQ3p7B8aBZ/F2/rPmM
X-Gm-Message-State: AOJu0YwyZPWqYrPJYmXoIieh3HhmmnuTREDZZ6veo+jzoe1Ya2j+omkH
 3ugNqDEiZ5cg/HoRqdeMoGgaXvWSX+40k5M7ZwYDVgxu8/CNbiigI+sQy3rc1N2D+/84PbAPftl
 Xj/1Pr0AorD+TdF5y2hm0nnamWa63A83l7pP+0Q==
X-Received: by 2002:a2e:874e:0:b0:2d2:b915:e073 with SMTP id
 q14-20020a2e874e000000b002d2b915e073mr5208024ljj.27.1709566302445; Mon, 04
 Mar 2024 07:31:42 -0800 (PST)
MIME-Version: 1.0
References: <20240221110059.152665-1-thuth@redhat.com>
In-Reply-To: <20240221110059.152665-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Mar 2024 15:31:31 +0000
Message-ID: <CAFEAcA_X90UiX8tJZw0vYpzFHB7FcrgzvdKOfe2zOL4ux4UZLw@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/Kconfig: Fix GIC settings when using
 "--without-default-devices"
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x234.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZJEcjre2fmS+

On Wed, 21 Feb 2024 at 11:01, Thomas Huth <thuth@redhat.com> wrote:
>
> When using "--without-default-devices", the ARM_GICV3_TCG and ARM_GIC_KVM
> settings currently get disabled, though the arm virt machine is only of
> very limited use in that case. This also causes the migration-test to
> fail in such builds. Let's make sure that we always keep the GIC switches
> enabled in the --without-default-devices builds, too.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/intc/Kconfig | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

I don't understand the Kconfig infrastructure well enough to
review this, but if somebody who does wants to give it a
reviewed-by I'm happy to take it into target-arm.next.

thanks
-- PMM

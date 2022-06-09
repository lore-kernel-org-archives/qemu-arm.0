Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp578065lfb;
        Thu, 9 Jun 2022 10:08:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBsduOTjfdDWzLx1t87AF0KygisuhIFOlyeNW+ciseD2noVDZOg4BPugZVsuFrvjAWJhcq
X-Received: by 2002:a37:a584:0:b0:6a6:8fd2:fd4b with SMTP id o126-20020a37a584000000b006a68fd2fd4bmr24315198qke.734.1654794483112;
        Thu, 09 Jun 2022 10:08:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654794483; cv=none;
        d=google.com; s=arc-20160816;
        b=pIpicJNC8Z2hHs8AbFk7s5ALKGN2JsMgwF3t2z+J5kveTWA0ETL6EhLFB5ZTbgEF3a
         lEoRyqC/IEUa2KHXvyF/I+bVwBHZuDxmlbcCvz7OceusXHC7km2nMUm8+elChu4OqWP3
         N2k75ryUT7aFp8Qc465FsKTSqe1D2SX7xnPaPnN2vaHU19Ln6a4pj0LrilIfynZeP+pT
         f0lw3GA4ufC3y+3xe/Dk+TdTLgzhXPx84WQLpLedI/wbJV0a6IO+nk5gQDezLQXyd21I
         6oOiq6sTy+AqcdVDjTctGdPwK0siF8tVbypPHKiMQNSdvEzG4uMk0Nc7v9dbiB51CcCl
         0atQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1lgo/BgbIJSMWW6RBKu9rdwZ/51M+gT4m9V13+86mgU=;
        b=jGZleFSdLLGjZXFY4fi12gOLWpHqm2uxtOG242l2ArBr4HX0QoEVy15WbdVRXSaCJ+
         etoaLPUEjvhdeXO6WZEpV4Za9PWCAjn9Lb5n9UtZGiLDsX8+p/4xusLPHgUEiNZzZIBY
         5djz0m2XRF35rFMWhr8Ytsug7Ew1ilIZOr+UaVsfVkMkCPYAalyN/7IfCZvwyE5H4asb
         fHa+3enooUQafg8NYbc1w25QHiucF3E35TAY0LwP60psFdAW/roy7OwO69EkK5tCHTo3
         nEcovc8zxv9jImjFXEQtmDqEb9eYaneu4v4yMbbEQUYdT0zde6N26kkrL+4+SajJ+pEI
         dAiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=obq2uePC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5-20020ac85845000000b00304f156ebc2si5593621qth.507.2022.06.09.10.08.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 10:08:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=obq2uePC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzLdZ-0005Nc-2C
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 13:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLGT-0003SE-Ik
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 12:44:09 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:37161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLGN-0005qT-EW
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 12:44:09 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-31332df12a6so99285387b3.4
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 09:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1lgo/BgbIJSMWW6RBKu9rdwZ/51M+gT4m9V13+86mgU=;
 b=obq2uePCJnAPYBn2gpVFBmD2luYkjtjJkVXrKlFwjGhx/YMzl31Vh8wkiDJsrnXy26
 8813Q3pbsO5ggzpOrgLOnKQDZfp+2jvLAakfEXSpQBxhtluR+fB8Fw6yyNlCTus+WNXg
 hLNCcYIfMVb8GSwF3Rf3lG8CM9pLrUSUHQtsy/iqcY1Fm4vU1yrD2LIFMzokZZPTm7bC
 I+OZuIZAxWMFChIyCjsH8zJMUpyjkrRtzdNTI+7Wx1S4gcniOc9H2z2w0jBRBR/JAM+H
 cMeEHc4Em8Jg/Fhup4rY7behymOxeGANWt8lnGjU5gY+y5WKQkFn0Aec+lwgCgcKAclM
 Rd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1lgo/BgbIJSMWW6RBKu9rdwZ/51M+gT4m9V13+86mgU=;
 b=mgRivoP8emW+ckNUF+xkthkMO3u0e+AqAvOctkCva5VIXH+xYtDFS/YdbyqVXGauqz
 X5BotMG8PQg6JjI8wjQLWbMANq7ELQvSK6W6U8rZIMEBM9UEw1n/8FDXCSyjTmAI8Coi
 lhaF4Zpx8JP6ipsXltIur1Y6ucVDNQV6Eh/DszkDmLZespW687WE5yPJ3xjKbqwirzd5
 TEkueYD3Du4asmjyieOjmlLusoA0/lvW2Gvr7qSoOB8Ol9wGtOUROdLSIfl3yVUq16xO
 JwaA4QZmcl8VD2OFEy/GXKMzFveK7AdDNclOOd+TMyUypw5KV0l0Gt73e3bm4FWl8Rm1
 kh/g==
X-Gm-Message-State: AOAM530uzfmlOvmyL7B1UNXDaJyy7PyQUyuFMmWZuHR0ROE4L6qEhJ86
 RBQ7PxZc1JWnk+OAT257u07lwJtVpApXVw7QkvctNA==
X-Received: by 2002:a81:6589:0:b0:2ff:e11d:3fb3 with SMTP id
 z131-20020a816589000000b002ffe11d3fb3mr43440849ywb.10.1654793042346; Thu, 09
 Jun 2022 09:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-24-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:43:52 +0100
Message-ID: <CAFEAcA8Ba7hVp5fDk9C=ARarJTmGhUmPdzNQt52O0S5mQhDc_g@mail.gmail.com>
Subject: Re: [PATCH v2 23/25] target/arm: Move arm_debug_target_el to
 debug_helper.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: bssKosW2sx7/

On Tue, 7 Jun 2022 at 04:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This function is no longer used outside debug_helper.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

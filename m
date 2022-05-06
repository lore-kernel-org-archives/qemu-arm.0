Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1753984lfj;
        Fri, 6 May 2022 05:13:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOQIa4zwerEuE4GB3b8DWZYLbAF/uKeDd8ooV47fgLMn7AbpWRljOc0/SarsOgBctfxKrN
X-Received: by 2002:ac8:4e45:0:b0:2f3:b5bf:808e with SMTP id e5-20020ac84e45000000b002f3b5bf808emr2403537qtw.537.1651839190340;
        Fri, 06 May 2022 05:13:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651839190; cv=none;
        d=google.com; s=arc-20160816;
        b=jcs14t6QNJaM/4v+v1/mgR1bHBTp7Tn1GlnfKau9Q5ySej2Kwnhi2u/DWLV9VD3/Ds
         5n01dsiXTQ0UxXIsVD//1Kl09jRxW19n30lcCG7R82H6BlgEQ8ZnlaGHS+IlLbyXd8p5
         3dkI6z8A9SxxUWdTEBKTrwNkb+VL43/pE2yrqOaCjeRZfi6lbtqce8F403NaWjjEf5ze
         zk41eHJMBJ6XJ9nwz5Mwkm1SnZONk3CFMMH/uSj9cRRU+RFJwGLskdJirs+zC+BJ0OUq
         laxHg+T56+7mv/0gGsEVuLEos52COPeoGTaPO+vXbBoOaBe6DOvsTMZPWfHnUpYAwgd1
         qdpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=pVqmGE2uPQElijj3+6D1j/KSIGQ3WeBppv2U5idx3nw=;
        b=IJAtMW7SDR0ggkCmAIelq4te1pKhroMxaSJtkFbR2kdUELpZrfr6docALV9gL9WgJF
         c8u0yQyKF/llXmF/pum1mbXzGMK08lbiyMHCt+1KL3Dn62mhYYEBZ7xOzvWItlzcxFuM
         TJz2GOBu+ExShJ9VFkcMF1b2HpHMGHT6MO7M0h/8LLWsirU7NvQF7P4UMysFtWD/aSVL
         IjKVteOfnS5pRFflH/VNNJ5T0CEcxXIhEONkArppQB17VdrOHCiEvdhgFyz1WxiNZQpu
         umT8l5N5iSIlpR5xKvmUFyXjXtslPeZLNNfGsEgidMlzmEoJ8JN8g62MH1wfx4WFkIOw
         T44Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gLMXPRZf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u30-20020a05622a199e00b002f3873b83desi2400593qtc.605.2022.05.06.05.13.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 May 2022 05:13:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gLMXPRZf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmwpZ-0000CK-RP
	for alex.bennee@linaro.org; Fri, 06 May 2022 08:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmwoi-0000AN-9Q
 for qemu-arm@nongnu.org; Fri, 06 May 2022 08:12:17 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:42660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmwog-0004cm-O9
 for qemu-arm@nongnu.org; Fri, 06 May 2022 08:12:15 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2ef5380669cso78736697b3.9
 for <qemu-arm@nongnu.org>; Fri, 06 May 2022 05:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pVqmGE2uPQElijj3+6D1j/KSIGQ3WeBppv2U5idx3nw=;
 b=gLMXPRZfXG+O62P4avaySl1o6FbBhT+w3q+wgvds/BVm3BLVO9Y0hkRB6Z4GEImoea
 rAIjy94Ah/W6WhzGDC8ncNqmcIHXaVxi8k5dB8dfUQmvrq1Z/izQguDzQXiGAGTNoztM
 WilvDZP0ayH0I1uQZ/JnNLHis0agGhQiCZjI4iE8b8r40x6gR2uQkIHi3Gxn09WBtxMS
 P9q+fUepyUrWhPXHSixdCalTDzbgtUVTX+OL+BI7fHD+/X9uMOaezMzGyyJtwWJhynWD
 Ry0qc80Edni7hPC52vSjVqWCOb7R9veAjOvsuEbkSIhopjD0XXIt+pTcM3b/TVaSjvD2
 RbQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pVqmGE2uPQElijj3+6D1j/KSIGQ3WeBppv2U5idx3nw=;
 b=73uw8ixtqpQw/lI+sRy6O5M7W7yFkvQJURcBBINdBzEutbZwztwhpqtcTf1KjUoHSy
 JpmTaUUMh0gVYpHO6kEEcVZQbLV2fXvKOybdMRd7Id94cSNhAm5KnWOF3GWifDn4AFm+
 pcQxcRstvNZ4DZi0eCmzt4TdxkHT7L/1gZyEdxXwJWH3H74MyeYswv5eXl7PNPRBAeaX
 eIHbHRc55Y5yzFQLSaCozzGHKnentXo97Kqli+FJr8haWNdml4fCQPHdj8qzqNqsG1SA
 KD9jANgI9E5xT5Xxpch542iwrRBioDm1naEFBjmSh4B/moujO9H9XNo9FdoXJz+Zo0Pf
 aO1A==
X-Gm-Message-State: AOAM5315qsh3//avOywmKFwO0Te3u2qyh5mLCll0CMMja3L0efJSPfkE
 VrNVPkVmWp9F6v8+OB7HEjo2I6QQCVaEPjYVYQ+wRQ==
X-Received: by 2002:a81:6cc1:0:b0:2f8:bb31:143b with SMTP id
 h184-20020a816cc1000000b002f8bb31143bmr2237620ywc.64.1651839133199; Fri, 06
 May 2022 05:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220505185006.200555-1-richard.henderson@linaro.org>
 <20220505185006.200555-21-richard.henderson@linaro.org>
In-Reply-To: <20220505185006.200555-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 May 2022 13:12:01 +0100
Message-ID: <CAFEAcA998FFitC6=EoP51wg-sirdoAP9MS9Y3OnEfceHcvq0MQ@mail.gmail.com>
Subject: Re: [PATCH v5 20/24] target/arm: Enable FEAT_CSV2_2 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QPgTc5r3kLBI

On Thu, 5 May 2022 at 20:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There is no branch prediction in TCG, therefore there is no
> need to actually include the context number into the predictor.
> Therefore all we need to do is add the state for SCXTNUM_ELx.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Update emulation.rst; clear CSV2_FRAC; use decimal; tidy access_scxtnum.
> v3: Rely on EL3-no-EL2 squashing during registration.
> v5: Set SCTLR_EL1.TSCXT at user-only startup.
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

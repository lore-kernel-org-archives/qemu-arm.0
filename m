Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1999416ejy;
        Tue, 20 Sep 2022 12:43:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7okNnye+D/2IRBG4iOuH41xRgnFwilO4tPha6eh3Rs3pMgOi2Q58591VK7ruaClR6MybB1
X-Received: by 2002:a05:620a:2699:b0:6cf:3ee4:5657 with SMTP id c25-20020a05620a269900b006cf3ee45657mr2737255qkp.475.1663703010476;
        Tue, 20 Sep 2022 12:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663703010; cv=none;
        d=google.com; s=arc-20160816;
        b=vImTk8FlHq3rldJLo2+bzj4I9YepOgz8srF94IK8B/4x4uwslvmuS0FFhDCeUJBRFq
         f3Uibc743SSIWcUr7TraweqxawBxamwhg5S7kg8XN77LseXDWQBh4oUoxmQtnlaXA+mV
         mR/nA1nYS91rGWnoN4Iv8vqDQTI7imw7C4wVmlNfoHMC0nR6xWofM7yYwFbRv9BvB38i
         zQ6wbU4v1DFxepNbUqcnTNCfek/+zwtEUO9UonsA+0H8IfzkQ+AIFFrtQk8zAl7pV0La
         96GxCxZIdhQjfMSO8RYEUI3Bc2N8uzzqvcYyIfYc2m6PO7spyBpIagO5u+DS9K8J6RCE
         mNxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ra+vsHoo1jj3Tu2LtRfk6afnJmxLxo7Ks/T3LYx6qvE=;
        b=qUeO/RYil5AYzpFJtT7Fam5K8sKbHYp2v6Zf7UfsxJio3TKd1EH5yyBC2lgXiXySFC
         dlkjrF3xOhh0ZNMl68xPAdYa9eQB8niI0NQdI+NdTWIv5h1hVZeACbFTFlGVv6iHFVI6
         eY9/OEyUZOgtT1kfudsw8eAL+qvd9+h4T3vu+rIBEBxcJTX7LQ/wbuYM3tRHRUbVBjLb
         ahBVwBssNsQMjoWldqly9pwh19mYklEyUk6gkyHBMvdI9t9TD2VhHCelSBXf1w+T+6Tm
         FGrM2FX6LJAiR13HcT6Jnqn65UEtdnB+Cv8YHeBoh/INj/XNhZh4fVMFUrFlfWx6eReg
         I9pA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F5bgmJzb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u17-20020a05620a0c5100b006bb41b438fbsi544920qki.110.2022.09.20.12.43.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Sep 2022 12:43:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F5bgmJzb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oaj9W-0000GL-0X
	for alex.bennee@linaro.org; Tue, 20 Sep 2022 15:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaf2m-00073C-5o
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:20:16 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:42549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaf2g-000721-MD
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:20:12 -0400
Received: by mail-ej1-x633.google.com with SMTP id sb3so6959819ejb.9
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 08:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ra+vsHoo1jj3Tu2LtRfk6afnJmxLxo7Ks/T3LYx6qvE=;
 b=F5bgmJzb4W1ysnoWU7v/9auJuje2PWi23x27hd+pR8iGk279aN0qtfCL3rfvRQuSlu
 SiFw8yL5JLK5bVnxNc31Hr/BRF3rjn8DRnG5v6rqTQQF31DdiKgW0hybNBNwdcKn56FV
 5tHbccTN20Fnra+FFiETzL6kzrZwAIfNdGfNaxoLxFx94qVonG5TOJ0RpsnQH8RSc29P
 8rOuiQE7gHeAfbvR+Bn2xD1J7raLPeyrfYMavm4o5b+PpgS39qdMYSlZuynn48Gb6BOb
 G7svm2U60FTDBtWJfMM0R8MWEAhRT8rMlbiKGqTJ7d+6A2n5WOIaBpqaytv3EmAHbguP
 zMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ra+vsHoo1jj3Tu2LtRfk6afnJmxLxo7Ks/T3LYx6qvE=;
 b=VVa7JIfeNRnLj6ixAsdWoX20fVkJQ6enTPEIkegp60WdHI2E77AYJCpu/E0pDH/rj4
 yJuormFvH79tbIArvYNxdYf6I8OSuoHhlZht1EJLktCA5oJ/ADf4eG6lNrwKmUFYuRKW
 sgreCzxyJEJ9OupKYLZRqjgMTlfV2RmSSn0f0KLddxumFD/iP8fpKI9RoYuy/B66nHJ5
 lFEeP3ABFEXWy4ob1Lep67Icp2om4QYX/ncuUmzbeh3Z/zaTW+rhlc6JC1ujjwA21te+
 BM6m2j1V8JkPNRyv7THkZ3r02Uten5yp9cQgbTkO8X7jMEGCsnC1/w+vaKNCdhGH0Dx9
 mrBg==
X-Gm-Message-State: ACrzQf3B0wlemWcNXvTZKHTduMuYxHCq7hVC+jol/z77CH05r62IBc1z
 vx2eJU/UtkJyiKV7KzyASjOTYRTQU6kFB5f8ttxFTw==
X-Received: by 2002:a17:907:86a5:b0:780:156d:e842 with SMTP id
 qa37-20020a17090786a500b00780156de842mr17148045ejc.555.1663687209060; Tue, 20
 Sep 2022 08:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-22-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 16:19:56 +0100
Message-ID: <CAFEAcA84FRmmRJrEV20Lto6JYfKf0DKAO06k9UmOxHT+t6BmZQ@mail.gmail.com>
Subject: Re: [PATCH v2 21/66] target/arm: Split out get_phys_addr_with_secure
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iWWgUOkelrR2

On Mon, 22 Aug 2022 at 16:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Retain the existing get_phys_addr interface using
> the security state derived from mmu_idx.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index c338e2324a..c132d0cada 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2282,12 +2282,12 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
>   * @result: set on translation success.
>   * @fi: set to fault info if the translation fails
>   */

This doc comment needs updating to add the new parameter.

> -bool get_phys_addr(CPUARMState *env, target_ulong address,
> -                   MMUAccessType access_type, ARMMMUIdx mmu_idx,
> -                   GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
> +bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
> +                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
> +                               bool is_secure, GetPhysAddrResult *result,
> +                               ARMMMUFaultInfo *fi)
>  {
>      ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
> -    bool is_secure = regime_is_secure(env, mmu_idx);
>
>      if (mmu_idx != s1_mmu_idx) {
>          /*

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

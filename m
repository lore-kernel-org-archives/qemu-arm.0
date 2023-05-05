Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp380470ejq;
        Fri, 5 May 2023 05:31:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5T7atgcm+JoT7z2Xw7cqSgCOBUaP20QAVmLMlCC3AiH2zOtnLEhu98C0M0CMW3zWN+J3t1
X-Received: by 2002:ad4:5745:0:b0:570:5389:2216 with SMTP id q5-20020ad45745000000b0057053892216mr15061195qvx.22.1683289868901;
        Fri, 05 May 2023 05:31:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683289868; cv=none;
        d=google.com; s=arc-20160816;
        b=ISp0BV6jsI6ulOBt1fIZaPmiwj3grC8VUYLSco0v50uB26T1dMg7x8rxm2Fy/7pArw
         f2GzmpjwbAlsczjxdelQSkVOGg08XjGRBRYIvTW2Vrz8G13xfy4K4F8RwDwN2/m6tJRW
         LEUQvC2HC1PTW6txSb3q1Je9FfQzs8zoKZPzEoqejUgYkuz9bYt2zOUKXqgVYXCNRywH
         OV3LeI6u40SDsaRO9yhzWAtwNNaL4EMbbUSfxEwMrdGmV93olvrliCnZIOb8Gwx6WB9c
         C8+1KfzLtmfyRplzk8l+uN/djVwD5l0W9K9rs2CBtJk5LC7S2Ib1p5CCLSGxO5rkLbF6
         5s+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=cbvXxw6ZAQT9U9fcJMesQufLYpJLQd/f934mnhTig2Y=;
        b=ZUByrMBNCjj1oMEDeyiJDjTym2l05l9wH/WbYI1KECIlDYrCXVfHkHyUfViEqV8O0+
         AipEKgtY2UrDyip+xEXjAJKNQ/VEmxToNn+07nl2qzKtODRWsx2R3WQR0+VZnVPBRLQZ
         FooH5N2+4FQcl2QU0ZPcYz0lVoZoO6vYiPJ1iCKagXdjcQ+NvKR9F/3hLuW1FBPkrJim
         A9Wy8tZst9ddvQzKCtUQmvXkdI0U3gwb6OpdzG1x25J3lZjfpVYkbN9u/K10jP3jy47e
         DIzs9PnZoUh0fijpX2HNuFq5bkgqSUV4+bCec54X6bQg4QiPjoZmS4R/fC1lcsODaEmG
         3pYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sIb10+7u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x10-20020a05620a01ea00b0074311501b51si622647qkn.264.2023.05.05.05.31.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 05:31:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sIb10+7u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puuaN-00017Y-HH; Fri, 05 May 2023 08:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuaJ-000174-Cf
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:30:52 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuaG-0003pf-Ml
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:30:51 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50bc456cc39so2554658a12.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 05:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683289846; x=1685881846;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cbvXxw6ZAQT9U9fcJMesQufLYpJLQd/f934mnhTig2Y=;
 b=sIb10+7ulyE+SNEDGga5tPUkTrVbpuTzPMolcm1IUSs3tXRLDvDJMn+hfREKud13RN
 GgcmgzUoERiTFYk6S21EoxrObzYUuGXNW+LjkR7mcEP29uNk2TNY2EDboRanmRkcv6P8
 1o8/9r56dceC/909mtievCchLftfXABQkC+zcffOExXSMJIhuzxLDPqALDYtUouYiEft
 FVvjTDI5BErwKilOTrYuAgb8tUphUmWmhpJ8bmdW1n5xmq7p9yTjH36X7qGb60s8GVFV
 puXJwu30pt24P5PLzz/LCLE2Z6/QL0Tfzx0knbnHI1AWb260WmSprfxE8o5eQoO5EV4l
 vtmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683289846; x=1685881846;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cbvXxw6ZAQT9U9fcJMesQufLYpJLQd/f934mnhTig2Y=;
 b=V4Hgm+a7sJMnGHhHCPeVnw4GoseMCJ2J1YM1VwypCV/+FjypyPc9zKEMORPi9tdUcE
 0FB9nkvIsbaNMlArMXUR6Rb6bd1ZuCnNmQ/VItLP6rC8HaMCFceqTca0fdiiDQdm/KKO
 U6eaB9Ivyo33MqKP6K9wm67hqmj+ZpPYkPKJmC5vMo6fHr8n6NxshriFxPYFGx7f0iff
 xo/JfA/bhwhSS2bqSjusHFMk/kNJKY33wtxIB7vcdRLAGCEPOWUJyBuAs/nHUStyRFAA
 VMnFQXg3UPdy7nud1JwUwyMwoecY6kSSOFjPG8ZceN3j1sVcwhp/Xp3RiV42FudI8exK
 gdxA==
X-Gm-Message-State: AC+VfDz8tBx43T6ZMcEsCYseFArr02uw3haue56qMP/evZe0evSH681f
 +JW9tVWX//GqYaCEq6uS7LSFe+pE/OfYNJP7XXKpnA==
X-Received: by 2002:a05:6402:1857:b0:50b:fb29:1d91 with SMTP id
 v23-20020a056402185700b0050bfb291d91mr1268243edy.1.1683289846043; Fri, 05 May
 2023 05:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-37-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-37-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:30:35 +0100
Message-ID: <CAFEAcA8YXLJwZEeLytwmtwFnhg4NAkVZJHC6D6PcdcqvmgSR4g@mail.gmail.com>
Subject: Re: [PATCH v4 36/57] tcg/loongarch64: Assert the host supports
 unaligned accesses
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: e0bCvwbf2uAl

On Wed, 3 May 2023 at 08:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This should be true of all server class loongarch64.

By this do you mean "anything that runs Linux" ?

If not, we should be a bit more user-friendly about bailing
out than just assert()ing. For the "tried to run on an
ARMv5" case we use error_report and exit:

            error_report("TCG: ARMv%d is unsupported; exiting", arm_arch);
            exit(EXIT_FAILURE);

thanks
-- PMM

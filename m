Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3322816njb;
        Tue, 9 Jul 2024 07:22:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXXKtoTmqaZa26TWoIoBj7RirzzAXT9Aiw2EMCve+6MydWJSkNmj8vPk/UTSVUqgXBDGcYWrp7EHKCacR5sctadUchn/bkb
X-Google-Smtp-Source: AGHT+IH0wVbJJOili7Zk5h9NCK3LRdDekoECj5FmovgKbHD9CenRq1i+kTkOcTVKZ5z7ig+fM5Qk
X-Received: by 2002:a05:6214:f03:b0:6b0:774b:38c2 with SMTP id 6a1803df08f44-6b61bc7f074mr27245256d6.6.1720534939141;
        Tue, 09 Jul 2024 07:22:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720534939; cv=none;
        d=google.com; s=arc-20160816;
        b=dlYPqWDl51EaTvTali53FEPa2MHNO936rh+FrHZLG2bcTwd6mneTKjIe/6Hiakhqgd
         YYH1aQAZ1n0ai0dKifnmBA4rPfUOV9j3MT3Pp0xH24SR2nXVZ4d+1k51JtNVdQts6Vfj
         i0Ib4fcP5KJU5ttLCobAVvP/e6WJ90FuhVCAO7W6Vz2x6Dpl8giwz+NR2cjhaxfZNFc8
         Y3BTC59l3HpH00kjxWqy7tx+1OMBfRzfTUL/iWgDifgY/zWgO5W+ekpnJG1J8W7ljWT1
         veQddqgbSlNCh7vpbj1ICfv3gTqOSY/VYmYOAnTLY0WzSVnvxJ7uIqnAY3O/B9Vkscyt
         V37g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=r+3l+j/Hlofy6QABQMrAG7pxbpS8gpF0W5xXlJYtjjM=;
        fh=cqLQLWBGpPVdFOSE3pypaGKd/RVszfd75OkPGjRN3mk=;
        b=OljzTwDwvOUi2uNOdiPTFxU5rxB0dZeHArhd2QVhZtdQHcWXsTCdKcFvNcp1VXEEKs
         /cWKKxJhIvAOp/sqMKG+Pshs7JKzLYDyuSEo44zeYw+/M6X7syRI43N/rWOEj9ARzvIV
         A5rvs4mW+VNeleluJyuB5UriZ8PEcieTJ1vj2QxH4v4wikdRH/fHwoBJIxCGHqffob02
         R+v/HLDqiVOzyZ+ARotU9jYtSUnIBgcns4CL2hMMJQytdCWG/DGUtaBF5C7t3xhsohPT
         xN/mFbUlwKvKNKXx84T75a4XDcvYIQI6pPeh8GNM0rn1WKui4kxi3IHvzKe4EysQbMyJ
         tXnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BFQdXU2E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b61ba8ff59si23197556d6.277.2024.07.09.07.22.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 07:22:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BFQdXU2E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRBjN-0002Zk-EU; Tue, 09 Jul 2024 10:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sRBjM-0002Tt-DR
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 10:22:08 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sRBjJ-0001rt-HY
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 10:22:07 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-58bac81f40bso6833113a12.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 07:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720534923; x=1721139723; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=r+3l+j/Hlofy6QABQMrAG7pxbpS8gpF0W5xXlJYtjjM=;
 b=BFQdXU2EqFsJiadnO1cTw0YOHwkY3N68IS4jXpMFJqlM4IO63JejOukUwajwCjDj21
 zboyFJyGK1++ju7AYETLc0lG8F6NlRHVq3exeDclHfYyuYaKWqFAVjOJ/N2mEcf0Me4N
 2JlkkCD1DnKZecC+7A1T7HNjxtJkRrYS2iT0RYLVvxlywdD/8j8I93CtUj2QJZL7XQ74
 a+FX7t8Bd3mofLxrNkcAWdVwHTa7wBdEkEjNrSlkn2N74kTMiEPDBIe7oPQiZtipJcLh
 CUaFwF6FJ2N7CSPqF58Sz+GJ3E6zJipYiZlHozrcjmN/e8LNpLSMhHaTNNyt5SOFu/Ll
 yrFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720534923; x=1721139723;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r+3l+j/Hlofy6QABQMrAG7pxbpS8gpF0W5xXlJYtjjM=;
 b=Pp2ZT9crqU8OZxRGfO6ismhv2lJsGdXSEtBTYEWg/G0Y6sXsy9tUUodxlVARTISXs/
 vkdDGQqs670qD53poK8uWwEILifSGY/6tbBTBS7F5ElDVj6BzZG947tQWAMNowYvjTRj
 xcxNfdFwA+3E1e7gHhI2Gyphn5xEWS+NPbUXofEKx2/+cWNQfUSY5aeh+gMXlepiss0H
 gz6PP0PvRR4gQp+zPUhl4sx7tmVsY/dFsM+a9gyZm17f7h2VFssxdync0h6YRNkLOS//
 x06JsYm6SuuH+Dn/GpZBl3+4Cg9ryqpP+nTy8j+JYJk2w9i6vU/odXGJtIdadraIs0zu
 xIFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk0i9G9cUcJV6VwTEwk/3lhIz+mdGf8f4931LEiBHlq6IhIe31QxoXpKCtshS7Z69/8TX069AUK8zjn4Iik0/VQ3Io
X-Gm-Message-State: AOJu0Yx64wXXgKAMoeNbU5dN11ibtB64/aj/Aa+HAE+pFmmZ4sZDAxkd
 wHDXQlGDpo+gwGDzxmN0FFEjZhIu1f1q+wVapotvbCjXT2WLzvXw6MGqJ3p4ZnZTuJuSbBDb6Cx
 KJxMJdy69rJ8WsOKhfUUVd7hob4DhIrS/nx9F3Rzt2rpIWMga
X-Received: by 2002:a05:6402:2c4:b0:58e:4e62:429b with SMTP id
 4fb4d7f45d1cf-594bc7c7e95mr1578999a12.33.1720534921993; Tue, 09 Jul 2024
 07:22:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240709000610.382391-1-richard.henderson@linaro.org>
 <20240709000610.382391-6-richard.henderson@linaro.org>
In-Reply-To: <20240709000610.382391-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jul 2024 15:21:51 +0100
Message-ID: <CAFEAcA_S5sFHruuRwPpVd9BzHVNCLf=v1uM_mt0=kkF1APXHPw@mail.gmail.com>
Subject: Re: [PATCH 5/6] target/arm: Convert ADDHN, SUBHN, RADDHN,
 RSUBHN to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: etJDqcbUNuU4

On Tue, 9 Jul 2024 at 01:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 127 +++++++++++++++------------------
>  target/arm/tcg/a64.decode      |   5 ++
>  2 files changed, 61 insertions(+), 71 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

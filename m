Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1850777ejb;
        Fri, 10 Feb 2023 05:22:34 -0800 (PST)
X-Google-Smtp-Source: AK7set/x6HRVpygCj9SvHJfj1Ve0GVT0TAuexgy7YSKwOvtZA5ghXfS5X9ZDRI7PG8KsibkGGa99
X-Received: by 2002:ad4:5dca:0:b0:532:2dd4:fea5 with SMTP id m10-20020ad45dca000000b005322dd4fea5mr22853364qvh.7.1676035353973;
        Fri, 10 Feb 2023 05:22:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676035353; cv=none;
        d=google.com; s=arc-20160816;
        b=o9P9JGOSEJrXurAT7NwnmaV5KkhuuZDBmY39IgwXkACl73eW/x2HyNoWTSRNHJNSuK
         jUYhmEsT29O9NjpGA+9bd3SXihih3/H6CNoP4k9OQ4OGBKG69GGYWOWqJzwi80PP3CbB
         9uLnjPbgmmWaDZGvj4QrwZbpUqB4okdO9t9H/Lgbn/ymTSExANfY1+ho4DRoPBigNPyA
         VQVduoKvL/IM1NnkpU27IokLzIpYCKnkLcSQ9UJjGOoTUwJaUr5JG8JzN3IcK2onkfbz
         4vEZ4990BC5whjkGfhEqmp9U0Qh0qFLXrwPb6LDYm490OuMH6ds7SuoOKz9y5e585jyv
         Wz/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=X5DjDxf+vVbTXxHByiTyHYe0fPglJNAodfV78mD5iU0=;
        b=M1cXAfhG+QD8DP0OrMEDaL1XJ4qJyzu5SQgiKGwUMzk6K577sZT68n7BpSGgEzco6B
         hkXfWmP1mOm2zgIegD35jFsbL2JBxgkOhgywE7qZgcaMFu+YZ4yHk3RmyXMl2M/01evy
         XSmNLSGVeOnw8PrO6Uh7DJdUtqYwLi7QPahJ/QgjDFeUki6VR+kG/hxk5R82EjBBy0XM
         Ja4GeK9jJAXLCv/nqtCXlQFVhK2NRx3cv4On2zhGCmWbT+3+p3yQY9JOy/4g1o5lyNGV
         c2THL/Y1EcaPgQTNcMQSOpKlwJwi2zl51CDC6TFKwb8L/CxNFqysaR8RHSDsBbebsyYT
         cTOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BqPW1ElI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fh6-20020a0562141a0600b0056c22174518si3860014qvb.149.2023.02.10.05.22.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Feb 2023 05:22:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BqPW1ElI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pQTLq-0004SP-WC; Fri, 10 Feb 2023 08:22:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQTLo-0004O4-3T
 for qemu-arm@nongnu.org; Fri, 10 Feb 2023 08:22:04 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQTLm-0004gl-BA
 for qemu-arm@nongnu.org; Fri, 10 Feb 2023 08:22:03 -0500
Received: by mail-pl1-x62e.google.com with SMTP id o8so4062053pls.11
 for <qemu-arm@nongnu.org>; Fri, 10 Feb 2023 05:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=X5DjDxf+vVbTXxHByiTyHYe0fPglJNAodfV78mD5iU0=;
 b=BqPW1ElIdXpRXQp/pskOxdo5YlnUCHy5ONGxQirY6D07peeKa+6vdGs+IEqtc60lbM
 D8hncUNATxOxMqfzTnweRV9vls1YZQlkpvSjZ9z7oSypDo5G55yeZ59szgJA8rkJq3rM
 xirNhv7VA1yAVJpI5rGflwU1Tw0zC4C9VZbyI+OJEquZ89OsLY0hTjVsB5ApETF+Hxbk
 LUWe6rA7XeztASe/AdoiA5UHK+6/dZKa6381zqVPhVi506mv9s6i9c8ogtrJRPH0W8AO
 k0/EaFQeCbR0Ggv/7VDAfyh4fSoXWsiyU+3uc2Sypqmie2CPwpARkFZcaEaMoBQJJtFM
 x5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X5DjDxf+vVbTXxHByiTyHYe0fPglJNAodfV78mD5iU0=;
 b=7a8+6YKDviFT/DTTAILPosTawY9TPFCljtu/OJLJDOathGqSM7TU9JuQw99QMlwfbe
 1bknzs7xpQ5HMNjl7/fbLfCbYhlaDMOpS84i/5O6LS2yu124I1VwBwoDzaHqtgL/42yR
 EXFHHu8Bf61wkE6XQCAEXt79dhI6mvMzLEZ6R4mgsxJSX9pg+9ikbS6xuv31qetgSSX3
 Y2rldR6dYc6DdRoGa6/7QQTdwtZ19iGdb+syMM5eTq2SiRnBO4QwhP46totSBvcuGjlX
 8BohNo0C/CeLIoGFqV93jhnUrPR1+gcl4Hfp0v6mwmJ8fOtNq9T9DXFiVLR/2IOmMdCw
 ywgA==
X-Gm-Message-State: AO0yUKWfOahPW/ESCvFKkIbMmkKgpeLLaKTgRBvkKiTA8sG+dHNloJmt
 6b6SYQoejpMFOrVMxZ+v1/w6cRmGw/OhCZsLrjARGQ==
X-Received: by 2002:a17:90a:8581:b0:231:2896:597b with SMTP id
 m1-20020a17090a858100b002312896597bmr1590939pjn.89.1676035320838; Fri, 10 Feb
 2023 05:22:00 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-16-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 13:21:49 +0000
Message-ID: <CAFEAcA89_2i4z_5X9MQTY5DE_Nj14r+Mh7Yi+m6zwi3qD=_B4Q@mail.gmail.com>
Subject: Re: [PATCH 15/22] target/arm: Use get_phys_addr_with_struct in
 S1_ptw_translate
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62e.google.com
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
X-TUID: oGPvmjR88Jqc

On Tue, 24 Jan 2023 at 00:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Do not provide a fast-path for physical addresses,
> as those will need to be validated for GPC.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 35 ++++++++++++++---------------------
>  1 file changed, 14 insertions(+), 21 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1328061lfb;
        Mon, 6 Jun 2022 05:25:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDWH3jlWsyao3DVfYu3fJS6xAP0mHC9ybM0m6lG4Q5KScVD7Tf/ng7Q4JoImrMPuys0xnK
X-Received: by 2002:ad4:4e04:0:b0:467:d601:dc9c with SMTP id dl4-20020ad44e04000000b00467d601dc9cmr14023045qvb.21.1654518354852;
        Mon, 06 Jun 2022 05:25:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654518354; cv=none;
        d=google.com; s=arc-20160816;
        b=Xoi5A92oRkfFSEwW5F/qXogMhCKmC15KO50hDS4IGM3qq+UPBZRsWDiqUyGJDAk8tG
         K9hgrFJ2O+Vbs/EQDsKkde/kl4LFTqjZOXyy+/9zGcxb2msxHtF1GRBOAuVmLiLKqHe7
         NyfmKqNtuazRgqmV1xXjAyJmpEucHtIpcEp82jpGwZKV4AVGMQxi4qJ3/l8LFqb6Vc0e
         a3VgacAiPo5vzkaWpSRWm8CWguEdtSYjvhwp45aSvHoTKvGXg63f4HEuqA1pg+TeEUpQ
         ZGMfhIHygSq42+rtZmyO7/yVPzX381WVzoOy+Jul+RwayQKP5pvRkq1Of1gqp3IT+1kL
         oing==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=9KquZqQKJqPdMBV+cYemE94zMrosLHxV8r2qmsniTuc=;
        b=lgdLkdYsCxuHRS7BuDjXwcQiSPmQY7YnLf2AoXMjAvTLxO5aP+cyU1C7L4gYi49Ple
         EspDULfxrVlog51lpwye/ZCylccqcsvXevsJylYaeFAezqbh2npbpbNdIkrP0RxDewvj
         rxFFiqPksZ67yYuEzUn3nlr+0BJGFcjg1pbw493dQgKPYqMxU9gKfX7++lVYvV7xvm1y
         TDbJl77gNMNmqH7g9TNiXDimnnwGOmpcm1jOFNp2xDfElgJVH1Va9e4OuoLrlZB5zogB
         y1g7ahj4+iZJq/AXprWwfhV3n1AKxN1VmhaYKW90gig0aTH3LVUoxmw5V6gdWbGWap/F
         lH9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XKADugig;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11-20020a05620a288b00b006a01b4b9f44si9158353qkp.17.2022.06.06.05.25.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 05:25:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XKADugig;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyBnt-0004bO-Dp
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 08:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyBml-0003zP-7K
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 08:24:43 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:35594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyBmj-0000rc-81
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 08:24:42 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-30c1b401711so141416707b3.2
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 05:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9KquZqQKJqPdMBV+cYemE94zMrosLHxV8r2qmsniTuc=;
 b=XKADugigHr1PNWXUJiEVFtQ5dD26nD7wYz+Irmnidhdunk7a2jQNn00aZeSlauYxsH
 bNVOA0MCb2gWKtEQpjd6oqJt7RwTDhr0fAzY9br6UlztHs2LSy/lIV/568rjQusiSSPu
 sfAzw8MCrnrPJFlbn9Xjg26KfFQvKzD3ebPkr5qao9BWN19KD7ie3nptl+4vrGV3r76P
 dGQCIx0fYRYm1tCOh/7ggk4MrStRHUUI1oKILF3wvdxt5MydDavAinxjbGJVZ3T3Gdli
 GRsgYNf6Wsme2UvN6KkT9jZlOnkmP52VZ7XOA3hjlKg+AlnX0yL974d0eE7vJ23suXxG
 gcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9KquZqQKJqPdMBV+cYemE94zMrosLHxV8r2qmsniTuc=;
 b=jsgrkGrp0oe1w9rNi/NR7qHEGpqU7fQ+hKV1qloTQtnCoNO+jRVqUmP6VUAN4uXAHU
 AgxZK0f3sV08oO76b0ZEQMAXnly11CijwFeG7FHJfCWllntYSZS190KVsPvjEcFFeUUA
 /mxbPKdoGvjCS4WnLvoe3FEe8PCZCUwPn+vMTxaS/woOLK1gf20dgMWMVO9bL8JHeJPt
 12UTrS0hankuf3jr7QFpBB2/24i5F1k98NWAnIbQyF2V01SEligzBaFWp7h1rhQFlPJ5
 WebZ8iGbSoujfRTdCNWdGFQFOkzxWSJl/Z3yp85qVUSYNUGef+6tW2hGREYzU7DUYQE6
 F0Kw==
X-Gm-Message-State: AOAM531uYTf+QzvyshGaxcFuP5AUUI81Hcg7qoIMz9uw/KwXRv+7ZV82
 YMpjGM3gmBiUc/RDFA/ki8qLAnKefX4h7mL2JEV+0g==
X-Received: by 2002:a81:6904:0:b0:2fe:e670:318a with SMTP id
 e4-20020a816904000000b002fee670318amr25267263ywc.329.1654518280211; Mon, 06
 Jun 2022 05:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-8-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 13:24:29 +0100
Message-ID: <CAFEAcA8bZjvQhK_DVBV+bOqqTzEDy270hj1zQR1puvgUSZCXyg@mail.gmail.com>
Subject: Re: [PATCH 07/71] target/arm: Use el_is_in_host for sve_exception_el
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
X-TUID: 0H2kJk0gftKb

On Thu, 2 Jun 2022 at 22:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The ARM pseudocode function CheckNormalSVEEnabled uses this
> predicate now, and I think it's a bit clearer.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

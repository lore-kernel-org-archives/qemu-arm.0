Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp433029ejb;
        Fri, 8 Sep 2023 06:42:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGML/JjEFx9bFWxNRD1WWakdtcgNVrw7LllNiKcVLGCCOu/amW0/cFuAYUtUydigpMww5K/
X-Received: by 2002:a0c:ab15:0:b0:651:6968:ae40 with SMTP id h21-20020a0cab15000000b006516968ae40mr2584572qvb.20.1694180561902;
        Fri, 08 Sep 2023 06:42:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694180561; cv=none;
        d=google.com; s=arc-20160816;
        b=pqEIhPfGLEcqyFJHUpGZ5Glrk9A1g40PYIdXdccoS3bvm61JY+Tci/Gchh3WC4ptwc
         i3IG+XhXh48oYaz4BLo6X9nJK6biBqZepV6e5bNwQONA5rkxvRJfR2/JXzqO7MkOwrBY
         gWarJkVc1AS6ozpSj8KPJ8Li+nVq5zyJca3O/l5MWs9kOagQsbv2bR6cCHshegdYolfs
         RTC1r33wn7xyCbCZtyl3rQKn2LEq89reFV6H1xEkAjosByWFryCdO7HdJLtz5j6FoHZs
         GpQVEIZvBjiAL+3STgCzOJVAy+NgTVeobqhGlWcdt/ViHFNx9lyaijZSpW3wZjv2BjaR
         QC+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=MdihRmGVf653hvyytkSn9JMWlM4kTYEnM3FpjmKGCO0=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=M2bgl6dNcox3isZbrezc5yOJhZITdDp0l3NOyHsQi+Op4XkUAtT7BrMLScSXVHxCj5
         9rgFHh633B3I5618PW4bDJdFytqTF3pEAZXZ4wNKIrcW++1tfdjBW1eAjh5pt/wM0OPF
         ouKTLX3k/stXCP5LJ638wEOav7ICXeUQjpT8nCs7wf5XU8mHzozwFHcb32VPek9dgQoG
         7snXbmEzmLJu6ntjqPXr4Tgk9r0/GKwRf7CgBzjjNTNbaxYKXnHCqK/ypokbKmbwdX22
         3vE26dRXHiCWzGavVvlGeg8jNvQ6N4m/AT1yOBTLePR0jW0/G07KLzCh/imj5mds1Zuo
         n+UA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sb0UieAN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n1-20020a0c8c01000000b00649a195fbbcsi1113248qvb.303.2023.09.08.06.42.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 06:42:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sb0UieAN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qebko-0000ap-0m; Fri, 08 Sep 2023 09:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qebkm-0000aV-E0
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 09:42:32 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qebkk-0005Yj-91
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 09:42:32 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-52bcb8b199aso2820682a12.3
 for <qemu-arm@nongnu.org>; Fri, 08 Sep 2023 06:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694180548; x=1694785348; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MdihRmGVf653hvyytkSn9JMWlM4kTYEnM3FpjmKGCO0=;
 b=sb0UieANwhWQ0ZF8CTWGkuGYyrhhJ0/u3mGlzzOXukI7Ygpn4JuuUbuYYGLlfNu0zB
 NdnGamNbACOSXCmqNbaCJFyxVZ7hfdHbnmNTzp6khaqzq09qiTCIyDro0HhYjJLDLg5g
 bQpl+U9aqKck6GTlZbc3vSORh41WIyelUnr2SGCoW8WiZNiuPTk2uwye5eKrU8TgJf67
 WKFE9c+z68S/YERLuV7eSHHa4ZxIrdYdzocd6+cK1BB0O78wJJ/0ghsy+1elxaBUiF00
 n2CHHgmujsiW5knDHkH9sHBbMfHLFmJkCRDb4v6r3nGV7YvjS13bR8oSsX9z+NI3+NeI
 95bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694180548; x=1694785348;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MdihRmGVf653hvyytkSn9JMWlM4kTYEnM3FpjmKGCO0=;
 b=RbZhFYc2j+Atwj9vCNBKo9qXLXJT4Gtu5ew8IGgSERFvVLmYFHPhfjmZp0Nfo/s6Y8
 nbcUkELJPF31OLwwRey/BaCgf/cNbtfeAinXm3H3+o7ySRjDq925oo4eKLIhybLzlJVl
 Pq6wekcK3DXBBIjFBtPvRk3r+Eqzu3GNuEfAv314/Ci9s5xU1UWg1f+eWCBjJbAb7ggj
 0415rcwA4MsOJ1wPO43TDcUrQQI+4ZWUrIKXDJMYb+QfUOqwnUqbF/QLSCN9UDlNmdb8
 u3mW8Y8q2ysqvj6irU518voNp+UREy2i34vG20lNslqYLmiH3tmvCTMzLg/NYJEVjIXp
 8vWg==
X-Gm-Message-State: AOJu0YzK2w4svfOMWSmez9VoPcRFi8bR1nT9H//2kmH+adddBT0EcUSz
 bg6FywTEVGno8cGWRsFWGvf4sU/oZ9dQ7aIESbARtg==
X-Received: by 2002:aa7:c502:0:b0:52c:b469:bb01 with SMTP id
 o2-20020aa7c502000000b0052cb469bb01mr1821062edq.38.1694180548550; Fri, 08 Sep
 2023 06:42:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230831232441.66020-1-richard.henderson@linaro.org>
 <20230831232441.66020-5-richard.henderson@linaro.org>
In-Reply-To: <20230831232441.66020-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Sep 2023 14:42:17 +0100
Message-ID: <CAFEAcA-Yb0tn0oemVChWkUmQM4YavWQhSHiMDYY1=NNMyBQyNA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] target/arm: Implement FEAT_TIDCP1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: 9k0RsEif8HiC

On Fri, 1 Sept 2023 at 00:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  docs/system/arm/emulation.rst  |  1 +
>  target/arm/cpu.h               |  5 +++++
>  target/arm/helper.h            |  1 +
>  target/arm/tcg/cpu64.c         |  1 +
>  target/arm/tcg/op_helper.c     | 20 ++++++++++++++++++++
>  target/arm/tcg/translate-a64.c |  5 +++++
>  target/arm/tcg/translate.c     |  6 ++++++
>  7 files changed, 39 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

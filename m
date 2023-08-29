Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3806262ejc;
        Tue, 29 Aug 2023 10:05:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3VdCU0QnpJdfa5/n538WveJPFuLr/ChTt+PN4l0FmCy+KuB7VVlA4c+1elYM0zaU/hXgJ
X-Received: by 2002:ac8:5b53:0:b0:403:a701:1ac3 with SMTP id n19-20020ac85b53000000b00403a7011ac3mr35949482qtw.46.1693328759397;
        Tue, 29 Aug 2023 10:05:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693328759; cv=none;
        d=google.com; s=arc-20160816;
        b=utuWigf607c7YZTGI5t0CgKxIbdZCfns8LpPe1/taVXSmgXHHFEqGgmR9wl2J93HSc
         BqB3Ga9Q3V0TosRngVk20EtyBc4gLWi6Nk4nQZk2Hi0VyOUl7Thr2U8Nod5aOKOikbXY
         zsYY1tSHVNZDnbKRv+lfnoc2LtCeMjyGQvvyDQPvxdsXZwTBCnDjXTElwI0v10ZLJYmF
         00SjQrTw9zph7cRjsZJns8l4pD1wUPYn6tJLm4RvdAMAZPv6w25dk54JtJg1bVqVjvXd
         hpBFv1tfcTKuSjrjvIecOWwvyM/bnvVB7DkTX0X5ZCwwfnsvXVqA1bCs6TyYv4HS9dyA
         78mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TiB6ubqPsy3z0PuFkp7234GAkXg8zqYSxGbl9JAIdeE=;
        fh=m6ro60Caf406s+3x8XRYfXkytlG/CXnsTlMqP0udiBw=;
        b=KHNugy+DOw0IOj04TicTNz4w8uopPveXeXGgCNh3DIemUhkGjEtjXxDpup4PdZL5wJ
         WbhpCLbcYBUqpqR1HEUrkSj/2QE6WRw2O4cbT8W7Mouo0ztKJYP49u6XjdXS2BNATQly
         N9hQ0t2yJRWyuxbrZLlsgET2DO6V8bj8+axCk2gv/oD/MC7TfC1/CLulSFXpMTvF9ZAU
         QPXwJH/OrPjdfTX+T3dyu0Xzc80viEulft3qXX5Spu02aB/f820Mr16vMIxYUjbEtc/2
         L7Q4CpDyMB+XaHIX5X2LLNVH3pY8iu7ULUnaF7dRU7AJ0qoYmLo2y3G3sbtEnIJEYzwE
         ST5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WyQGrPJM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e18-20020ac85dd2000000b0041222f5fe03si3418960qtx.651.2023.08.29.10.05.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 10:05:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WyQGrPJM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qb28s-0004hn-PP; Tue, 29 Aug 2023 13:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb28f-0003tv-SO
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 13:04:28 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb28b-0005Mw-VQ
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 13:04:25 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1c09673b006so24123845ad.1
 for <qemu-arm@nongnu.org>; Tue, 29 Aug 2023 10:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693328660; x=1693933460;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TiB6ubqPsy3z0PuFkp7234GAkXg8zqYSxGbl9JAIdeE=;
 b=WyQGrPJM3pI5ZDNJmXorCKQf7bvdpujBZx+yt6r8Szo5b7Rri342n/JBWRzZfU1H0k
 GZmbfkp+FFo2srOldLW8R3hGZxjeZ3/XDd8hB9LE4xAKh1gmSwV7Yb8z7sCCVRRLiWU8
 ATBZ6Amo8xV+25wF9svPYjWEbRWswhvekJ+CMi44uX6Gsr5mS1JGYjIKKIf1SgTl1SDa
 KxYXG49D7MGcBggK7dPcY7Zta1GQWv/Xk/Nzmvs0QeVwj58O9UFIjEEig7/1yyK+o4/X
 IPGhV2uMT8XszNRnMyJuNNKdj/+5q6i/O6zaOqYxV/OyiQKDI2qG64WVjsDSQz3NrE2y
 sU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693328660; x=1693933460;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TiB6ubqPsy3z0PuFkp7234GAkXg8zqYSxGbl9JAIdeE=;
 b=b7qTZJYWmbAdL5ZsqMIh+j3ySRC0fpwJpxspR+TxmnGOj8rWUvJta9WIHYc8ICXl8T
 hL3rlYFVUAKDpktswp9RkLVXLa8tWnH7zRnRQj3I6a+nH3dPyGrZQkGD8XahQQ0LlgJH
 LSHYCRwiT/ERFU/fm6LtkTDctJOkzXVgxj2bWCIWQsxB7H066shjKjsFPrpCv8/DyLae
 WMeSubaTTQnOGhj6gAU/qMBwKLxN8zFUvDxsn9c5J8XsS6CfNdMk5XddgK8XXW2Qux4z
 AjUX7TesnAAEnZVn+mJl6E0sDG/dVHNSJaAfLPMC+vnQ3JkhSKg+QgPRnrZoRlMCV8LJ
 CmkQ==
X-Gm-Message-State: AOJu0Yz34nHXfS3NZSk3Nng6K+yv/BSGjnugLaAF66Y1VIF+HNCVt9L0
 2h1K/7PCLToA9ip7UMDLKwHi9Q==
X-Received: by 2002:a17:903:4cd:b0:1bb:b855:db3c with SMTP id
 jm13-20020a17090304cd00b001bbb855db3cmr21738192plb.41.1693328660136; 
 Tue, 29 Aug 2023 10:04:20 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 jw6-20020a170903278600b001ab2b4105ddsm9595725plb.60.2023.08.29.10.04.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 10:04:19 -0700 (PDT)
Message-ID: <57992cba-6230-2bd1-be85-cf7b78e31f2e@linaro.org>
Date: Tue, 29 Aug 2023 10:04:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 02/11] target/riscv/pmu: Restrict 'qemu/log.h' include
 to source
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230828221314.18435-1-philmd@linaro.org>
 <20230828221314.18435-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230828221314.18435-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.242,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: VDi5TVbv/dew

On 8/28/23 15:13, Philippe Mathieu-Daudé wrote:
> Declarations from "riscv/pmu.h" don't need anything from "qemu/log.h",
> reduce it's inclusion to the source.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/riscv/pmu.h | 1 -
>   target/riscv/pmu.c | 1 +
>   2 files changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

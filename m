Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp5669930lfa;
        Wed, 9 Jun 2021 12:15:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeKEBt5IKcrze4WKExTS2e2e2vg2h7OLp+Z8JyDdGz4gmZVCXaWVXZT33bIwCFEyn6timP
X-Received: by 2002:a5d:4f08:: with SMTP id c8mr1327845wru.197.1623266139759;
        Wed, 09 Jun 2021 12:15:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623266139; cv=none;
        d=google.com; s=arc-20160816;
        b=ZMhKweEoua7KqRE/2X/z/OznLmT3PAHX92FHbj+vcFgE2CIVaujTdCH+jMoUmyytjE
         NQ6nZfBIg1MfOYDHWNzPpN5sq7wN8xoQjDIbhGt626avLxBtp17NtKRvuTHBwiQYk1Lv
         CNzqvvT+TdgLkfSr10uD+dimaPooji7ynhkyp6GyTE4+sjRkQXEw4/vsRPzj5Hfw0p4t
         xMBseq4CToHMVn0ENEWrbWs/gGl7D4I99kytyYxNjdKmJt5L1h73Pta9adJ9DtldHD+J
         M5b9BcL2Cygn3RX4eUzYJa09OuIVprQU+Jb8JwWaIc1ZpxlkNBZZpDcI5SmhM7ILZgBB
         V7QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=dVROZKETV5g9pd5icw4Pjz+sM0br7otAB1vDz1vnAvg=;
        b=nfQPVt83jJPTQxT5muHUOZgKOv83KJUghgu+DYiWdDXQD2uJT4R5FcQ0kSflLkBkxf
         Nq7XEXB7KELqgLp568a/5nW0H0y7nCQUOiqng2U00fCNS+OL4OkD4ZyBwN5skc6O2eTR
         K/Qrr2nznA8WRbh6bW7v/FIzarrFFjnaUtMOnVqMw/J4Dqo8hbXiIVpT7j6C5ukV34aU
         +8/QC8XC7ZiN0LTDq6nxBTTdmY3RgEnUU/rrfZJeAK7bd/dJGzzVIujGO8E9eFFL80wV
         ++HPun/r5y6jMW7sBKaa77uUD8lrr2zjTcMtWM5BptYtI3c9CwK7PjVYaWHikWYGM3l+
         rJ2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xjXdq+0e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5si682974wrv.346.2021.06.09.12.15.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Jun 2021 12:15:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xjXdq+0e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lr3fu-00065b-SZ
	for alex.bennee@linaro.org; Wed, 09 Jun 2021 15:15:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr3fl-00064r-A7
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 15:15:29 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:35730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr3fj-0003Uu-Sa
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 15:15:29 -0400
Received: by mail-pl1-x631.google.com with SMTP id x19so6015773pln.2
 for <qemu-arm@nongnu.org>; Wed, 09 Jun 2021 12:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=dVROZKETV5g9pd5icw4Pjz+sM0br7otAB1vDz1vnAvg=;
 b=xjXdq+0efLob+7P+fkOrxF0B1W9FHFKaM595aHg6t0pFQBt9L+TgXORKY/bqHCPwyl
 yTtW7otLvi1ISYtJZXdZYN/oznhL/dhQe1/RgafsPm4iCQZ4qt79aV1zS0k7uu/cwrJS
 PKkpRgAFxR73/kaOG3dC3y1iyphG5IlHmUQ3sKnCVrYw+rvZwdXrkCG7OoIEoDoYSVr2
 2LaDxzuRcntTVWog6vIQ1HCzGOQQM61q8Ww8p+Fnxh2CNrnTQbjR5uUpki393yV/NjH3
 7h8jxO22b1fW4eOrlnmcFKmnQL489M40Shs27hUs1t5eMqDMHgjACJ0D+fj+1Gqub7a3
 /gVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dVROZKETV5g9pd5icw4Pjz+sM0br7otAB1vDz1vnAvg=;
 b=UHOYc9cd3uGKGwtGF+/AFWxFreOfe0WiGbAsWHILhZtfdaYcaUm1Xq4rItIgxVbcl7
 0f9BHlKtExsGOjXOr+nBTMKCKAQINb34kkzm4gq9PGpjOTbNQgmQc8PVfHHIzmQ6jh/v
 dGcnrvbFajnTLXN1vj5CLeIVSR51DQfqnnztgrjFUqtYMwwp+VkktJI2q6HB2Kbf+En3
 CbrwomfXo93ui9PpSdIfgYvKptyFD6mshzq7OZV5DaN5Q4sFfnoI0Z7TzwPKqCjIXs7C
 URlA5/2eGWgkNpr9Z3hww7SAw+8rqh4asQAximdeWWner9xFU3BueeLAwqmHRbt0zl3N
 8rzg==
X-Gm-Message-State: AOAM533P0CCvswagsl9LQ6xkaGmRZiEK6KAxW3Ct2qRi+DjZMTlUvwkZ
 Be6hrXziM45hTf8Pj6M+p5aFFA==
X-Received: by 2002:a17:90a:5504:: with SMTP id
 b4mr1087353pji.208.1623266126417; 
 Wed, 09 Jun 2021 12:15:26 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 d3sm305188pfn.141.2021.06.09.12.15.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 12:15:26 -0700 (PDT)
Subject: Re: [PATCH 42/55] target/arm: Implement MVE VQADD, VQSUB (vector)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-43-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <df2353b4-5b1d-1501-a235-11acf00a04d6@linaro.org>
Date: Wed, 9 Jun 2021 12:15:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-43-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: Qcs58jN5Ohco

On 6/7/21 9:58 AM, Peter Maydell wrote:
> Implement the vector forms of the MVE VQADD and VQSUB insns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 16 ++++++++++++++++
>   target/arm/mve.decode      |  5 +++++
>   target/arm/mve_helper.c    | 14 ++++++++++++++
>   target/arm/translate-mve.c |  4 ++++
>   4 files changed, 39 insertions(+)
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

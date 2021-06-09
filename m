Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4932140lfa;
        Tue, 8 Jun 2021 17:51:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaGzGjOl3QVOR2SAKY0EuRbYINPjtU2KNcgXNYzyIJ/u7PRXvGKYkDfs8jmq0wyF6ouHLn
X-Received: by 2002:a6b:4105:: with SMTP id n5mr20636870ioa.148.1623199880578;
        Tue, 08 Jun 2021 17:51:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623199880; cv=none;
        d=google.com; s=arc-20160816;
        b=ygLHwdKXfBz8milSrEjl4U9vwqvlRVMmk9T2DsLJ9sCuOfhsoewdJNTYvuf7Aj/yK3
         7TkVB7wYqeW0RvlMf7SuvM5tYa07lGnjXgthlXaP5gSpqO6zYy4TSAk6gC0x0ufoHssA
         zc+3FbdaoQBRTuIoR9HLvFMlrqI3Vb7WIdIbRSE8YMWFMGJiyUa9zUDFOd8eeGrhWN0h
         gzYrQTTFaTvZtT6JGtOb32fFP5osdYvJu0XI8jgFEbNUghxKwNc2671Zs7suRD9R/T1c
         027yRsCT9NdXNOA3Qg0wX9VSe2kVK1TyVsqUcOL/oETvvFhijtGOYyqgNvJ5+oxhmZ5j
         qkuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=F6T7h8ovOfMB9opQId2NISc5MiThM+887pH1CNDP9Pk=;
        b=C7WjW51Ub4f+s7jODmi61GOgMq++OWToeH9OXyoVkp8aD4KaFRBDOaXkO/ikpJo8qS
         U3xJN6mRbPahx1yn8LCCeY0YMJpHNLemnke17rSX787gQZkFE7jkZkPkRwKvN2i9qR+T
         rEUud49VXVr1+qSGsXacnk2E0o7BG4bIwUgno3SHIFVjbVQV2VQgEVclShmenGfF1wH+
         1iHmz+W2t4DLf5fCJna6rZgQTtWjokdFn6awON1u9a5ioAb6kT29S+MHI5Tzd0RB5Eoy
         MpuCld7jt0N/ilFySot+zjNv0bVVmFNblhVbx9K6wC6/JWGhaGIYnSrk5Zb2Q/Etvq3+
         ejkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sn9NeVIQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w20si1402444ioc.104.2021.06.08.17.51.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 17:51:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sn9NeVIQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqmRD-00084Q-S6
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 20:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqmR6-000846-DR
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 20:51:12 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:40902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqmR4-0006CJ-QM
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 20:51:12 -0400
Received: by mail-pf1-x42b.google.com with SMTP id q25so17077288pfh.7
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 17:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=F6T7h8ovOfMB9opQId2NISc5MiThM+887pH1CNDP9Pk=;
 b=sn9NeVIQzCtUREX2YWCPc78MSVRctp0u4FYZZfvhlwrLEfoCgul+4pGo2BkkYg3BM4
 lZ9pOxUdDSf/LfkOFgN3JVj52LUm5KgrAbv4dEc+40cZaeNH+ech7n8ZMlNdro6SoYv/
 VaSLOLDwiOagCvBlwm3bYz7owaH8cZPg+ALsoLswayYqy2SrdvsjT+8UXMGfvuXORGwV
 huyWIZl31iQFPHg9eCPDjjQzS6SCD/QpIQxZxy2NqJ5e14eBcDHPvYChUiNCibJOUY4G
 PVIcnat9xfMaOuC9vu87H63BQOWYCswpYktZ5yOI5fG3o44OqFRHhgcQkYnMk3ecHoRI
 QQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F6T7h8ovOfMB9opQId2NISc5MiThM+887pH1CNDP9Pk=;
 b=fVKDPaJFJTy0C+OV1EV/bBSuZisvsIakFtfn3GaZIsSiusstrHtFuFq3b1eqar7pDd
 qkMz4Mb4Uo1AmrTtTmR4VXC3XtkFjqSb6WmNfpw7m4VEVSZGReN2XGa34yBe75DfvmX5
 S1Qsan9JiBvWFrYhLPR3sjUUxlI9gPc0O3+IP/8KgE8LXwy1WrIHgWjzAhTiDpfQD/ao
 iZv0wFdQQ5aisfIPSv9Ycl1IcxPmBmXjK8J5jmgqY7vN/XA0XpC9cAz8Zn2Z3FKx6glX
 aVoD8yn63Rj8D4thsMV6lNLLdBwY3hoCM76i0+mjYPjj5dzz/G2r9iRzW/MQgUVe8S8N
 a+VA==
X-Gm-Message-State: AOAM530JoryO6x6CQhk0XCX9jb37cfpP3PJqhFr4wMA5AL4WrBK3qd1Y
 jxz8yMbp6VoaZ0+xapgOhDwJzA==
X-Received: by 2002:aa7:9706:0:b029:2f2:4481:1e17 with SMTP id
 a6-20020aa797060000b02902f244811e17mr2727407pfg.53.1623199869419; 
 Tue, 08 Jun 2021 17:51:09 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 a9sm2818273pjm.51.2021.06.08.17.51.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 17:51:09 -0700 (PDT)
Subject: Re: [PATCH 31/55] include/qemu/int128.h: Add function to create
 Int128 from int64_t
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-32-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <06a0666b-e982-347f-4ed2-22f3e7dc04f3@linaro.org>
Date: Tue, 8 Jun 2021 17:51:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-32-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
X-TUID: fskAnmq36X3N

On 6/7/21 9:57 AM, Peter Maydell wrote:
> int128_make64() creates an Int128 from an unsigned 64 bit value; add
> a function int128_makes64() creating an Int128 from a signed 64 bit
> value.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/qemu/int128.h | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

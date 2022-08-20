Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp62719ejf;
        Fri, 19 Aug 2022 22:22:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4cAR+hQo6zfHU4QICqFv39paXPWRqTGQIGhQNKji2YVYaB7Tk9WDzNE23mXY9Yr+l2KPOx
X-Received: by 2002:ac8:5d8d:0:b0:344:a747:ac00 with SMTP id d13-20020ac85d8d000000b00344a747ac00mr3434348qtx.205.1660972965057;
        Fri, 19 Aug 2022 22:22:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660972965; cv=none;
        d=google.com; s=arc-20160816;
        b=rl951Qbl5VdoO8tSn01awkUGdaCs1Lwo7Ugl9hWek/kZWDXkk775mAdJ5dKtWjo6xn
         0dICur0d5RUnf7GVysCuRg+Pxe7/XJcDzTMlaWtCl9AGmkTOGbfZzUZ94JEpD/j0HJBv
         UuQpiyDeWW2tt4C+o8Jq/j3By9myQjgInktETrGr8t6GrqI/HZti1ECNU11ik3/99qK0
         SXJK7xn+zJRlXhjpsLZJvvBOIqT+p3RVbK0dtJr67b0F1PhPGMuPwAC/+l0Fq8G0mCPj
         LvQDYxpyXxm2MvNfqz6+MEZnUSzUvU+BiQTU3jQ3/wJ2tQB6AFoDD1twOogSuu6ohT4h
         weSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=XlZgOSQ4NES66fut4fiHJ48r4KbfdGGMFc466qIdkkw=;
        b=V6ep58lTLBgLIrdB9bQhX7KPr0jZt2dF9p+wY89nJFpHPXb3leT0ydO3h38YCfEens
         Hz01hb49ZdpHDAmZ69f//RDbfYtnhQuH3doJ+5iyA7SMjueTrYKZTJ3eiUevXZ4hqOYO
         ZEob56eg9LoeJqvW2RefQrbXyyW1VJweJqqXXjp73VK7rv2Ju0I3ABXBnESFfF2fXAM0
         ZnkAden1bmLTXHeG/O+MTdBmK1zpuLFcuoyp/TnTdupOcSXLb30s6xg6KPWPuMwMk0NO
         jBW2jh6NA1ahDrWSLeDSd5JN9/avbB85K+9u3KsKdgpcWL49GAeY/eyILsuApm/wAdin
         e7jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OHMeD9ci;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ga14-20020a05622a590e00b00344661535acsi2632080qtb.352.2022.08.19.22.22.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Aug 2022 22:22:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OHMeD9ci;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oPGwW-0006P6-JT
	for alex.bennee@linaro.org; Sat, 20 Aug 2022 01:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPGw7-0006Nc-8J
 for qemu-arm@nongnu.org; Sat, 20 Aug 2022 01:22:20 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:36445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPGw5-0004QV-Su
 for qemu-arm@nongnu.org; Sat, 20 Aug 2022 01:22:18 -0400
Received: by mail-pg1-x52f.google.com with SMTP id s206so5191786pgs.3
 for <qemu-arm@nongnu.org>; Fri, 19 Aug 2022 22:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=XlZgOSQ4NES66fut4fiHJ48r4KbfdGGMFc466qIdkkw=;
 b=OHMeD9ciras5hDTvtgrUFdp2AMKqVQAwBjUoAYT/U9AQVBRmVpm4vxTewNzUZUmG7X
 9RNJUnftITYr+M2QRatp6I/a78/7CQ9XUJltuM/hSZgSmLHwiNF4cTZwGXtHSH4Gu1vw
 k7kBH0KTR5g/eqAYHad6f3pI5sBhJZ7bciPSPKGBnUaBVTrP2XEQQ+gfwy+8Tb3fb9uy
 Fejyh4eLM5bbgwmUbSQpR0v6h7+E8XM+yOnpfnEwQRZwu28dGWYiUBvJ00CKyZ9mAY/D
 vS6t5xomGJIWveoNJiUuVCXtpQU09VT7qp+xgxinGixCY2QpWJ3LYMcx82q/jgasqELK
 nQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=XlZgOSQ4NES66fut4fiHJ48r4KbfdGGMFc466qIdkkw=;
 b=2acofbjjvJCIqSe1MSZxwvUBLFxVhvRsACayylQXtYgCXCPrQzZKuDnbOCT64fsPib
 UQRXw1QntFObJB1i9ECEMyfjFhwhzYlb6Lv+F+UVREA8y6VCChCIxAr98bAjHcf1YB0d
 AelKmwbokenL09Ae5E12UERh+zb1dMNQJY686xgrrNf7/gkvLVQ2IprMwnu4SQqcPfaF
 jKSrzItE13GOfv/dWV5fDF9T5y5kSsiqf0HOlayyJHebiO4l+0aPDr/YZ67YcJge64Cx
 W60VqrwTQAnA38k3cr1CvnV/QChd5bNFwQ5fvq1u8YO1eHuppSmp+P2uDl0hx/F/lKmk
 Qeyw==
X-Gm-Message-State: ACgBeo2b+hl4Slhuxn88oknydgfYrwp3F5ar1soWZ5WGzryUjc04GPD6
 ACP0RYWId85/opfX8SWy5KgBXA==
X-Received: by 2002:a63:8ac8:0:b0:429:71e3:4af6 with SMTP id
 y191-20020a638ac8000000b0042971e34af6mr9052151pgd.218.1660972936517; 
 Fri, 19 Aug 2022 22:22:16 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:b651:a70f:2852:70f5?
 ([2602:47:d49d:ec01:b651:a70f:2852:70f5])
 by smtp.gmail.com with ESMTPSA id
 z16-20020aa79590000000b0052d8405bcd2sm4322149pfj.163.2022.08.19.22.22.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 22:22:15 -0700 (PDT)
Message-ID: <923c77ed-f3e7-38e1-6637-3c1196ec51c4@linaro.org>
Date: Fri, 19 Aug 2022 22:22:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 6/6] target/arm: Add missing space in comment
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220819110052.2942289-1-peter.maydell@linaro.org>
 <20220819110052.2942289-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220819110052.2942289-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: 8uxifAucB/20

On 8/19/22 04:00, Peter Maydell wrote:
> Fix a missing space before a comment terminator.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu_tcg.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

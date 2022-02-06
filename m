Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp3551236lfk;
        Sat, 5 Feb 2022 16:11:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjb2tYC6VvdCBbVZYSFgbCOTKjkQjUfL05UV1ACy3LWCttcnuufIETXUa/gRaSvE68ZQ6Y
X-Received: by 2002:a25:8501:: with SMTP id w1mr591894ybk.261.1644106290894;
        Sat, 05 Feb 2022 16:11:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644106290; cv=none;
        d=google.com; s=arc-20160816;
        b=0YUsejO7UvVZAf5R/tiRe9g7vYYr2nhhbzHBX0JLIbBwLrJ0Agwf7tnJiWY7sgStbM
         vYnwgIo5hx5RwCDbKY2Eg7HVDJCjbqOhlZgk63sYRyLTXMeFhGXPxnyWwwcQQPr9WV4+
         6ebuqdesmcdmBfvZntzYEhs1hA5fqZ3v47l55B2ksnS4DBUvknEXuiQawowi1PdO+5/Z
         Q8wc7w5TcoBkmUKSaW/avUSzP6dc9HZ1XgWnsTxC0RDHjKbTJeWmg3m5/Y+K7EAzBVRw
         cx4BWJqTpOUMJg9Zcr+lgQk0dBqOjmqkO1IWPsm64itDx8VqED0xMr7281Jdviqp8Y62
         2BpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ufVuWVwrrtW5tk/ACBiP10D/ynDt2wY6N1ienR9ysAA=;
        b=mKFBVoty3OJpyIsHAVAIq4Qg+S4GF5pj2fDBBBw1PL0VdF16eEaDRigP6hMu1hJ5MP
         o9VjSh6RFf6vgtz47TmebQuiBGUBsbJmaCULBdsswpXiuLTrIXWTHFrgrJ8G1MzLkP9F
         1Koj3mzT7nJ88vXN+bx64ZcAXTr4rhXtKnnP+3V/why54/zrT6FItRmnDxoWpYs4xG88
         739V3t2kDdzn48ZDRU1njqAerdByxaeyzUzIU5ov+B+GF2XSzYZrt/FBuG/4ZmOO/eI2
         jt2oOZKYilZswNGA9WLxNT0wqx9ETFRUekuYBSUSKv9tg+DyfuubSHM++opJFnUdD/W8
         zFpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GguCIyZg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7si4652439ybo.234.2022.02.05.16.11.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Feb 2022 16:11:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GguCIyZg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nGV9O-0007Ji-BS
	for alex.bennee@linaro.org; Sat, 05 Feb 2022 19:11:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGV96-0007Fy-OV
 for qemu-arm@nongnu.org; Sat, 05 Feb 2022 19:11:13 -0500
Received: from [2607:f8b0:4864:20::534] (port=41950
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGV94-0000PA-W6
 for qemu-arm@nongnu.org; Sat, 05 Feb 2022 19:11:12 -0500
Received: by mail-pg1-x534.google.com with SMTP id f8so8328737pgf.8
 for <qemu-arm@nongnu.org>; Sat, 05 Feb 2022 16:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ufVuWVwrrtW5tk/ACBiP10D/ynDt2wY6N1ienR9ysAA=;
 b=GguCIyZgTe/wgseIxlx5KbEH1Sbvaku+nZziQrejxkYo/RPRfXmcKw1DHBOHv9d18k
 ndj8pjDmPmxsAVn5fFu1NH4FhoFQk9B5+LhKOywNeFi4KkwbghhNf94JHbANm4a8FHVW
 Jc47M36v47yZXdDQUGUD9o+yNcYJtbzxF1hrnfPxlFVquVGzd5beMDSyQs77JCd2j0VT
 EbtDBK5pSWBC2vLjIwVIL6ofGPenTIHyOy7/C7MCycmN0An/a/KKHyShbLWyOMBYf8u5
 bo5kR/9groiu7rcbuYVXEtturoaBNqsrFir3zX0I+D3/W+NqKceMR88ryNNQ3jXMPUqH
 K3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ufVuWVwrrtW5tk/ACBiP10D/ynDt2wY6N1ienR9ysAA=;
 b=tOq6N3EfQSjQ0i6eJsjdx+0Za8bZQor3l11xBiBrYOR13X2PS5YODKKfJNMFYMn6f3
 mtfUBlmjDWur7rrqTKG1nqyYinHDdoxSMHRPVmt4MjVwVkfzvRCM8v8ilE29/IWCPSmt
 ACYlWTH9uhS8NrUnSV7R/I7eBR2MYnRIv6kytCUTGd2hUuI6WyEhL3EcRWYc4d3sC/bx
 kYRsokqwu7SkTQ2Clhgt7Yquk4wsonpjUbQtLP4ZDUnpMgUvj4nPsTCXQT/w2iS8clja
 /acx1WUxRKxUOpdzvn8GujTh+zzeEuRF8Gq7wh5HdFP90aL8WcEREQZm0yfy42EcT+KT
 Iufw==
X-Gm-Message-State: AOAM532cz+b0xjbmlIvry+x2LWYzQFq7RCIs/w2iFxKdp1XZaEVc2vEg
 NqcQIOqCPKV8bb1bUDYqI7BH+g==
X-Received: by 2002:a63:1655:: with SMTP id 21mr4400161pgw.498.1644106269385; 
 Sat, 05 Feb 2022 16:11:09 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id a3sm6854530pfk.73.2022.02.05.16.11.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 16:11:09 -0800 (PST)
Message-ID: <0e62474b-c597-9bb1-4837-2602f4ac9f09@linaro.org>
Date: Sun, 6 Feb 2022 11:11:04 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/6] target/arm: Move '-cpu host' code to cpu64.c
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220204165506.2846058-1-peter.maydell@linaro.org>
 <20220204165506.2846058-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220204165506.2846058-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UvifejG0FpQ7

On 2/5/22 03:55, Peter Maydell wrote:
> Now that KVM has dropped AArch32 host support, the 'host' CPU type is
> always AArch64, and we can move it to cpu64.c.  This move will allow
> us to share code between it and '-cpu max', which should behave
> the same as '-cpu host' when using KVM or HVF.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.c   | 30 ------------------------------
>   target/arm/cpu64.c | 30 ++++++++++++++++++++++++++++++
>   2 files changed, 30 insertions(+), 30 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

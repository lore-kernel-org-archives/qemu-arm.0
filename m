Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3604110lfq;
        Tue, 15 Dec 2020 07:32:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxaBIQmFOut+/R//mc+0HvufuWUgmr5IhQoXuwGUk3JuIe8ZUTuCQ3GjVL5sRHn5yd1g1Pl
X-Received: by 2002:a25:107:: with SMTP id 7mr29144584ybb.337.1608046373225;
        Tue, 15 Dec 2020 07:32:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608046373; cv=none;
        d=google.com; s=arc-20160816;
        b=fpjwBmLscDxQyFXb9VZWZjqlVdC7Rl/XHWdoqZQCAQhb1b+rmABC/0PlDOj3E8yFaf
         aPuMCYnqtx9FxsP4Sx5JYpLFq0SYed6MtXluCfqeNnd8ZLi09rVJMPR10ZGtN/w0RDSr
         uwbCkAQ4xGJcYfUXtqV7npzCz5JBKU2VFuMq3bRObIPG2SoSmDyhsOwVgX4cvuvGyL/7
         j9NsSFMxqMiClCyLuwrzrX5JOZpF8Qym7CXzsvqh7TSrOOttVRUWL1n3Sxpgl9RA8XeR
         w5XYujuRwKDZt4zJee2F+zStlYJpDBrHku1+92P6ycX5r8DwvDD5BxJsbBvqG38nppvE
         yd5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Qxyg1YGy8MOdvkRLJMY7S/6YpqiFWz0vCsZe6cd6Oco=;
        b=J7vPvH7I6aEE/eJ++4wqjuTNNcIdGaxsLWzxW0aA1koF+phWfVMU5i4yNVc6mC4qSf
         6fZ9U5OxAwXT7q0SI6op6HcOWlPar0qKlCB3c301s55FPpM5WBPdwYcC1uJYklYaSMet
         qpVXHVznqZIiFekOdQREvZVX+a+2dEQDz8cxJR40x/BZu2girCkDUIAgDxQPH8e/Y+2s
         eUW/gRKlE9uQnBx/twD/O7mpD8MHAior8bIgL77rOYyGp/uKXrZRNROCKMTTkgUwF+iM
         yD0v7G47Zba+c/0rtZ9uTU4/97q3YvR5IFtIfmEzfPTUYlNP1RdAm+ys+tBmWVlaLiOo
         9sQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yI8OBzLB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1si18584815ybo.308.2020.12.15.07.32.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Dec 2020 07:32:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yI8OBzLB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kpCJo-0000Ft-C7
	for alex.bennee@linaro.org; Tue, 15 Dec 2020 10:32:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpCAt-00030Q-Vz
 for qemu-arm@nongnu.org; Tue, 15 Dec 2020 10:23:40 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:37561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpCAq-0002gt-Lc
 for qemu-arm@nongnu.org; Tue, 15 Dec 2020 10:23:39 -0500
Received: by mail-oi1-x241.google.com with SMTP id l207so23721002oib.4
 for <qemu-arm@nongnu.org>; Tue, 15 Dec 2020 07:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Qxyg1YGy8MOdvkRLJMY7S/6YpqiFWz0vCsZe6cd6Oco=;
 b=yI8OBzLBkM4j8OfqV3OO9c0BlCynZ6FdoISI0LMnQeL+DRVmM3NNW3933EKL+6Unef
 z3NmhlGVJ1BM9Nmb0SrI6fitDJhZo9pz1L07lrCoVTeEV14gGS7sAcE6pKXyOYx8FINk
 iLUKdwZGSKVwBP8q/3PsS+wai5fXODsaRiTRa9TFOPwxHBNxgVQp/qMdS+VJ9Fm01KUt
 Gn5DhI0S1p7gNRrA/S3S/Hs74ocGw2ahWgco591xNURoGjl5TKbIxj9bIgXgWp5N0Dyy
 rv3rjxF2HmrB67bajDUiRtPaJK1yrWQ9ES7dVzKVB2NcEzdFD7bJxVMlv18Q1O38A4Q2
 vOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qxyg1YGy8MOdvkRLJMY7S/6YpqiFWz0vCsZe6cd6Oco=;
 b=owhZm/iVGUp/qi2FGBreMzBlz5sIF/akZvI8Qck7FNoG3fJcUytdZ/HUHTT+seFP5z
 L/B564WcrENo3xPcK+fmLawzPW5NHWDfDtILZvJ3cWqHfBdDPTUfgWP+sw8fkDZ3yVqZ
 gMvNZw707w3IjGcz6bUjyZ2dAGepUL8c3i0uUPJDi0PoUvOF7LKc7q3Ft6wvDswJixQy
 5mEMXSDQYVtQiIigSYfzqVHk3R3ncWqEYHpQQEu8bZFKrbP24Ic9QKjAtmsxhWJtgMNO
 OktOAlPS/C+0A6LizAhbhBtYaWep7wAPmqCtL9r+2PpTC4mNxvRnBLbA81xYn+4TP+rh
 GRxg==
X-Gm-Message-State: AOAM532ShVbdb4yllpcuN6ngig318OL4czH57KTFDbkfH/FhskQ/PE7p
 /bbA5S/OwpsIlDLuN0V4jzLtiQ==
X-Received: by 2002:aca:f48b:: with SMTP id s133mr21709813oih.59.1608045815428; 
 Tue, 15 Dec 2020 07:23:35 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id e10sm475298otl.38.2020.12.15.07.23.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 07:23:34 -0800 (PST)
Subject: Re: [PATCH] hw/arm/highbank: Drop dead KVM support code
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201215144215.28482-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9d617172-a39c-dddc-639c-accdbe389891@linaro.org>
Date: Tue, 15 Dec 2020 09:23:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201215144215.28482-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Rob Herring <robh@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 22HGOO4HKJwa

On 12/15/20 8:42 AM, Peter Maydell wrote:
> Support for running KVM on 32-bit Arm hosts was removed in commit
> 82bf7ae84ce739e.  You can still run a 32-bit guest on a 64-bit Arm
> host CPU, but because Arm KVM requires the host and guest CPU types
> to match, it is not possible to run a guest that requires a Cortex-A9
> or Cortex-A15 CPU there.  That means that the code in the
> highbank/midway board models to support KVM is no longer used, and we
> can delete it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/highbank.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


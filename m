Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp1650542lfc;
        Fri, 16 Jul 2021 14:04:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHjhAx1rjWKpztMca/iY8dPVK5aT4zra+/7L0UvQ4ceCT3NMEthX/STKXzR9d2biLhKTrD
X-Received: by 2002:a17:906:998c:: with SMTP id af12mr13641140ejc.240.1626469466489;
        Fri, 16 Jul 2021 14:04:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626469466; cv=none;
        d=google.com; s=arc-20160816;
        b=gJdjNgcoQGBilyX2gpLW1sEsFNAxXu0mF7pEiyhTabUIFY3SEl3yh7HeZQtc1iZDHw
         dmJQcv9p+APFKl2LcjdFAj9DgmVqroyQ7jSVUHnMd0Id0A2+6ft538U8ooYkt+AaQvWD
         z7FzFOsLLmNgbmzk8vWPBEmOJiBloQ064DZ1cVOuXTPILd+h8hATkzUE3AjUUiEOlkq6
         copCTb6PcN+f4mZ1pXM+SDLJdBdpejx0FL7VfP/S/Ea+Bz6O8wYVYmdS8fPgiC69im28
         VStrdGskgd64LJb8bpk3zauGNgM7/Fiy4UC0rBHbC54zF2nG9lLzYo3ZCuSL4Jx7DHuR
         0IEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=KQkMC8R4wVC6NLmErpjT59dZcGQ2i93cORHIitGMKWs=;
        b=kDBzqz+8sU6Var9ogYCT+foB/O6owfscK0eRWV9i90uGN1alFWPK4X5pUaMReZEGXi
         uxFPjdM4Sy7KOMv6uWi7dwq3vT9dUa5Ob8vKizIeS59L5etCSb40/UxABEhtZOah1Sr0
         +VwN+BZMk/sN/e76EhAU2Iq4yMZY8Drz9sP0OnlPbBfn5I9aWE7xRuTDpSwVsUed6gh8
         bwN2/usTNvV+dOIVB4QZYm1DIozt9VfxDMzilhqIdp66CU/g6OoZOhno6jXt4SV/8SE0
         xNN9aIeezOOjB1QUfsOr2aG6IZmBQWcQVMbjB5aTYNv+FJuoc3SMyA9OB16Ps6Q2dqIO
         eKbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="a5pa8i/U";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c26si11994159edt.227.2021.07.16.14.04.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Jul 2021 14:04:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="a5pa8i/U";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m4V0T-0007yo-JQ
	for alex.bennee@linaro.org; Fri, 16 Jul 2021 17:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4V0J-0007y9-MF
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 17:04:16 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:44826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4V0H-0007Bc-L7
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 17:04:15 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so7795228pjo.3
 for <qemu-arm@nongnu.org>; Fri, 16 Jul 2021 14:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=KQkMC8R4wVC6NLmErpjT59dZcGQ2i93cORHIitGMKWs=;
 b=a5pa8i/UULFBsyWdjQ7/MWOIdYsgAgtbFVseSGkbP+paysO0991jnKO/0yFzUcbO7U
 Qylh44xe+4XxUIBGm1FyqX+E/IstVorZPpruY2859nW5NB3maSTNu2ahRfoVv0r33oNd
 YHxKTf7lnO3lzHNRmHYguPh3os4Tz3EebgdWGU6EksOXCoiiz1dg8/cEWKhwaqLW89i5
 eB6kmMI8cEUiR08zR92m4dp8NVyDEH+xxSpjBmkMQlmnPWuWQtNvCTLLU7Q5HmYxu3QZ
 buB4oQoBGle/ZIcAKzfkNJTmPVIKicphkenpevfdH+IkAst8ZZrPRk90rnqPvGAWifUK
 LMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KQkMC8R4wVC6NLmErpjT59dZcGQ2i93cORHIitGMKWs=;
 b=NcUjI2Vf5mKwTDUx+FMOsAlDMiVfP3Y1gkLhXGzPVBIt/OByqpSeH87VZqs+KSAnZn
 fpce3AENHXpkPAomoSvrQnPBNaDZWEo8Q8AJZqFsoh8k0uy1NfGXh5+/8uB/oJEsOH/R
 Gclh+NmkzWTcvj3oMfs2B6vZpSYVzM09vqK6hEOhIEebshAjt/siKyOPkN281J1BL071
 Trsb91g64ie0eLUYzD6NJyQTCJ6s7FC+n7ALM+ESh1/uvhREwJSjdEMMsUmiCpjvilmU
 eaVQEK9CmjuRAkkhP3Bs57nkj+UUxNaowjMYP0FmwdD7tVOMcV7T6EaqNu5x6fa7ewO7
 8K6g==
X-Gm-Message-State: AOAM532qp+E9Y1pB07WOWxasUPzPmmHZl5cYQeVyr1ng4GfSiGZyRmQj
 6Ib9cn+1Nbb9K3nxd4TMtQFLXw==
X-Received: by 2002:a17:902:dace:b029:12b:5e9b:c517 with SMTP id
 q14-20020a170902daceb029012b5e9bc517mr5743893plx.37.1626469451974; 
 Fri, 16 Jul 2021 14:04:11 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y6sm9036793pjr.48.2021.07.16.14.04.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 14:04:11 -0700 (PDT)
Subject: Re: [PATCH for-6.2 13/34] target/arm: Factor out gen_vpst()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ce35158d-e7bf-3b3e-978b-8ee277151de6@linaro.org>
Date: Fri, 16 Jul 2021 14:04:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
X-TUID: k5qvXJ/ISrHG

On 7/13/21 6:37 AM, Peter Maydell wrote:
> Factor out the "generate code to update VPR.MASK01/MASK23" part of
> trans_VPST(); we are going to want to reuse it for the VPT insns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-mve.c | 31 +++++++++++++++++--------------
>   1 file changed, 17 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

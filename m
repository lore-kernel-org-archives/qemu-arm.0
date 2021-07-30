Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp512789lff;
        Fri, 30 Jul 2021 12:32:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhaR2Qkc8YYjY4uezX4FcaoaOR4oo1w9/ithLYqS0eynDWnar1czb+dqoGBNmlvq5V9x9O
X-Received: by 2002:a25:61d1:: with SMTP id v200mr5593371ybb.219.1627673574114;
        Fri, 30 Jul 2021 12:32:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627673574; cv=none;
        d=google.com; s=arc-20160816;
        b=JNGqElKA3gfe1NYYq18GNKnd8jgtZHFh73MvMBoJZ6h0xdPiqok2u0f26Zhrdy+zuf
         lplg2gyyNXqtt4SIfYNWl5zGn9Ts95tVTiHbHCGiE8fmbZGufPyRqQ91our0+ANldzta
         G/UnsYZhXD8qoZKnqTSmP78yE6SgWg2cb5q93rJpHjcvDsS26Vf01bT8dPxAfZxr3ieU
         5+WSIcbsu4H569ovcqrzrYOWlUrvYrW5+7MF58iBI842kPxIiGGPGHMgpb4/hKaYO/fI
         Tn1uAUTDpLFXc31YP2byRYUzz/MrHFNhtbcS0DwlG9Dp7kg8Qle3IPW8RI5+/UViqYlJ
         R8UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HS98Z3MuPngXWSfJF/7Py4DnlR+5J+FyFR0VBuy4MwU=;
        b=J4hqEStiC+o6MsRgyeJ6Kzt4jL0QnD8xOjm95yMNPYexIg9iqTnthWgv/L9jIBmCCo
         PPEcKO5DUH0OKLXrvVNQ2NCQBvTB5Tpubf1KxBqfOHFatz/NprYOhsR4fWqtfJkHSl6m
         oW7e+4tC98FQnveAemx6ejWULNhJR2SnKMpy51+0tJffUiBmTa1dMWBK6FL28uBMaFsT
         ZIfrWvqDQ1rD64zm4+ijP4tR+vlJlnfqfSnLHFE52sNAGCyIJND27Y1knUhEtkyJqNGP
         V0h4X/zhXnl9f/fWz+MC83Lou9I0LgGz2GfIFJIPlxL6AxQsQBqs9IwAq/pEhIHft23A
         Tbng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MxbTmvUU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g15si2996153ybj.51.2021.07.30.12.32.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Jul 2021 12:32:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MxbTmvUU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9YFZ-0007De-Fb
	for alex.bennee@linaro.org; Fri, 30 Jul 2021 15:32:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YFO-0007Bf-PX
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 15:32:42 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:41830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YFM-0003NA-S5
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 15:32:42 -0400
Received: by mail-pl1-x629.google.com with SMTP id z3so10961881plg.8
 for <qemu-arm@nongnu.org>; Fri, 30 Jul 2021 12:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=HS98Z3MuPngXWSfJF/7Py4DnlR+5J+FyFR0VBuy4MwU=;
 b=MxbTmvUUIEC40jKpJPZkxc0CWRivp+W75oWBsEIqre76mOnvUmMirMUGIJxoPGXlx3
 emMJqeclLSMvIRuHzOthYOpea0WzuCLGoj7eECIBkcwaXPbmmACJsQ98NxDULpvuSshw
 qX2byLoK9jztNc6h1XSwwgciTWFLTgqbi/VlZGlS74UM1xC6f2AKr+plRcjp9/4AuBtq
 uZfefUvrHOpIICzVyPY0LZRPWcXr6k6ZU2Le3GpB04NiEE5Mj/YNnQBvG68ntgvhpOsi
 VbtisQR4NdYV7DjC+Iu9F7XZCcR7SzaiQ5NklGnCxYt6f65teq9pq4Li+qSptZh8Vghk
 xt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HS98Z3MuPngXWSfJF/7Py4DnlR+5J+FyFR0VBuy4MwU=;
 b=J7OEx1YeWIsanCnvGFla3ZuH3G+Ac1UU/ARCofW0W+HfUqMFMI/1Qf46GFpmQDcRZI
 aPkLlbLakP4MmqxOEm7+2X9wRkoIoqy5RBzInVN0YgZePp1nmaA7kTiWpd6IhTsoLfQx
 mkEgpQfwc2jWS9ivSrXhmSaahN50coI2MDVhpAOAVWZP9OwE3fAD/QUlKfzbWlPsp7Sl
 gIrmj+zEp3wQWajBqU33z/T1deg5WrAied0xINgPOo/szkJMQOOeDVbSjyHo4/FqVVPn
 RYGZrCVbm4MTdGf0mFj82Ap2w1nzFWIe++sGeSfAYR2+FL7jy9HSoT0CLBhie8G+/R3b
 rvjw==
X-Gm-Message-State: AOAM530A6C4MCW64wfbOAPom7zshbBk7WNSYUK80OlqftMbwqIDE9WS8
 810+F9RNR5md6UL5fqodSU5hCw==
X-Received: by 2002:a17:90a:9411:: with SMTP id
 r17mr4565239pjo.49.1627673559372; 
 Fri, 30 Jul 2021 12:32:39 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id 20sm3388630pfi.170.2021.07.30.12.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 12:32:39 -0700 (PDT)
Subject: Re: [PATCH for-6.2 38/53] target/arm: Implement MVE VCADD
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-39-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <edd9edfe-c303-5072-e5e0-cfe95a88eba9@linaro.org>
Date: Fri, 30 Jul 2021 09:32:36 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-39-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ffyrxz4Ts9BB

On 7/29/21 1:14 AM, Peter Maydell wrote:
> Implement the MVE VCADD insn.  Note that here the size bit is the
> opposite sense to the other 2-operand fp insns.
> 
> We don't check for the sz == 1 && Qd == Qm UNPREDICTABLE case,
> because that would mean we can't use the DO_2OP_FP macro in
> translate-mve.c.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  6 ++++++
>   target/arm/mve.decode      |  8 ++++++++
>   target/arm/mve_helper.c    | 40 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c |  4 +++-
>   4 files changed, 57 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

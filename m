Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp551656lff;
        Fri, 30 Jul 2021 13:27:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxE6EdNQwqs/73v82Uf1y9cj//p70FKbX0iHjXDGeHV2jRHVMhwRsU8FqJ1nZLvIs1/jErg
X-Received: by 2002:a25:2396:: with SMTP id j144mr5211851ybj.481.1627676868828;
        Fri, 30 Jul 2021 13:27:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627676868; cv=none;
        d=google.com; s=arc-20160816;
        b=ZVaULWY4QoWlL9fzTNUrARgow26mxK1c68fG3uUyv5YxE5MvPjhJrvfwpl5KFWSeMd
         jDIvsCtaBl9MyYRphGueSEjU5d4LdLKfX+zJQ3U8/MQ3Lwpn8/SC6Rr8mtLz4mblDVjb
         ha9/5xjurpP1nfscrodVnD5CX56TMYgX6Vk+2WqylTF6W7Y6IRvYSCh4zq65tnnyefke
         fnCpXSlHPruTdd7rYxuO32E8TaWn/0XzNc6oUER/A5jTBi85zN5MyRjKAYj75hEtKE8c
         6cAucMkYFJztARDXiQKiwQsrzWJhM/OwBRR+vGwu+MOgHhXWPRX3GAIPM5SuFBIPUlT5
         GO1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=LXvqGSbeOcGp6b2KGG49U1TFPQ4xk0cX4DSMyzdLqpo=;
        b=fbMOBaI++Msjg9JmK3WIqN9EPX0HMW5JTaKVLmRRmIfDGkoIYoVN+9PSfDGjPoBbIk
         s6aqsTyQDM5P0uEkmFXyriG6Si8alSIJlq1NJV38+Hjl0tAhfDH5vxCdkI720920LsLo
         oKPkLs37cXMllaEfkghN5UJQ4E+pxoQtf1qAr/e7Qwu5AOV0MZMR6OwH/QsUm1rr7KuP
         meAxjJXSLA4LrBiQcXq4vC8PMJhuMQ10ndKhV20s+TcZsRg3jfjqKRRjHzzLXI77mi0F
         22xIIfRHAEyGgFpdjiLKlpndDivf8PuUab9oSQhIk4OWK8QBLFm8OfWEAoCczUKHaF+/
         6coA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cpYT1pIw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12si2628030ybt.494.2021.07.30.13.27.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Jul 2021 13:27:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cpYT1pIw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9Z6i-0002LL-3o
	for alex.bennee@linaro.org; Fri, 30 Jul 2021 16:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Z3Z-00027Y-Rh
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 16:24:33 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:33577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Z3Y-0004R9-7S
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 16:24:33 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 j18-20020a17090aeb12b029017737e6c349so9627077pjz.0
 for <qemu-arm@nongnu.org>; Fri, 30 Jul 2021 13:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=LXvqGSbeOcGp6b2KGG49U1TFPQ4xk0cX4DSMyzdLqpo=;
 b=cpYT1pIwii4U6Gfk5qDkKWdzFPR/Nw+jOPMrQa0RhhLkFXooJmfYLO/c0oldlxNeIA
 l1aWccuLU8UaxKyeLO3S8iYOidstgYsGa56hF13/E9vask7bVsBSOj1M+sjYhAdFwdiP
 3Uk4mBGIrOt3j7ZHEuqFyy7H/BAVWSW/0VAWlNmF4HcEDLjdXky2vp0T/BMQHqdj6714
 iQZDghCqbginwd9I1r7yzWDlb3dmbgW0xauQkG1K+i7QgIgdJzhjJvDwVdKPUmgsAPpj
 Tsb+drQOxpUhJC+7AFBHgcikpuzT7J5o26+jtIHk9eyIFGhfrh0b0NmX8ukWBYHdhcO4
 zkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LXvqGSbeOcGp6b2KGG49U1TFPQ4xk0cX4DSMyzdLqpo=;
 b=UaOtCL23sD9JoDf8alkneB8R56YFwrOd12c/ROQqXuPletWDFPLUXr1VTDbmocxZDJ
 MWyfnVd6Nu4SVDzpZ/PAydmI7VSiAZ8Z0yPhDL7ffF8Tk6wTMmXSZn6C8tZZXZC3RyAU
 EMFQaQjvASQiTd1sPZScr72j1tze5uf0EoVS5yemeIVATqdGSrXEQyCbLCFgRdM/6kJ/
 w61ReydgpL7ZwAFes9V3WJon2Inuavm6y12QLwxpmAbFmHdk7ABEcFaYILGtx+TUqOk5
 0d+bdzyq/2ufM/tc4gPpd3l6UuYGlnrTWZS/9fRpcuxcNxhNmZDj1wzLwFNWsB9mFBhf
 dPkA==
X-Gm-Message-State: AOAM530GQQ+k78fX+UUUVU38xy2fP5a8hG4Og+hcT5OyN9ix/LbDrQIX
 9rScLdqn0mGdeqMmSi87XBjGYQ==
X-Received: by 2002:a05:6a00:238e:b029:35c:c5e:b82d with SMTP id
 f14-20020a056a00238eb029035c0c5eb82dmr4646183pfc.33.1627676670562; 
 Fri, 30 Jul 2021 13:24:30 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id c206sm2501384pfb.160.2021.07.30.13.24.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 13:24:29 -0700 (PDT)
Subject: Re: [PATCH for-6.2 48/53] target/arm: Implement MVE VCVT between
 floating and fixed point
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-49-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <57510c4c-0253-ac75-9a21-0a292557c8fd@linaro.org>
Date: Fri, 30 Jul 2021 10:24:27 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-49-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
X-TUID: gl1bggj8eQk5

On 7/29/21 1:15 AM, Peter Maydell wrote:
> Implement the MVE VCVT insns which convert between floating and fixed
> point.  As with the Neon equivalents, these use essentially the same
> constant encoding as right-shift-by-immediate.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  9 +++++++++
>   target/arm/mve.decode      | 19 +++++++++++++++++++
>   target/arm/mve_helper.c    | 36 ++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c | 18 ++++++++++++++++++
>   4 files changed, 82 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

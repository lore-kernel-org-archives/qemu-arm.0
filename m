Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp207881wrg;
        Thu, 13 Jun 2019 14:25:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwlVeRv8olM3LISNuAZ+65i0szXT08p1ZtR9cSbHntSOIpRw9x5dJvHg1qJogyrFgzGXYf1
X-Received: by 2002:a0c:b659:: with SMTP id q25mr5043353qvf.29.1560461155083;
        Thu, 13 Jun 2019 14:25:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560461155; cv=none;
        d=google.com; s=arc-20160816;
        b=ZQzELn0jDXgZ2T4Y6qPjFdqfsrXKqQZD1XYx3bFefqsbyR8Z1ldxJLLYta24w7Efa1
         0WM8KeY60prePSCDL3EbBKqO4qPPs2Yh6o51MGtYB5Lx2tyUvun1D1I9yCca5gh+EGQS
         AzyOdTItRGYUwkXkdOzIs93uvGHTxzccD5pfRPHURzxgtIk6AYfe8ZuqnQTEtDN4nyQA
         4gcuV6ngu3xlwMRGVzF+d9sEbyG22vWOXSj4rF3OH+oskNptrDnTXDr7SdXp7hkADefJ
         tBgwYSaJ1oNJdbSVHSFwWJ//hcJuRP5xOS+3EUE2Hm0ys490YYOVq/X8NeVPw22VWeQi
         1NNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=qUztuGQSty9lg5aMBAyILDQxrq01iLy2gukKWXrdxWs=;
        b=RmYdlOUnjtc/dueWjTkK+6thrmgl0qFpuSjNqqypxYMHOxE/uoTJejwc8+63oPPakt
         lPy/NYd8AUZzuY3nMgEW8nf8v/OC87N/aYW+8N98/UUSpVRGj46zapPM/6GlUb/be39w
         8Ctf/OksCvzzoE8srQxUFyuAUeF0PnlNUsDzK2NYHCNsIy36eceNPxotKLiC32Ea1uW0
         /TZWZLNAK0z+fDdsUfzN6LZKBxbnuMiTjakt9IemwRoCks0/k3NturuNOiBP3M+V8G4d
         9Ib22BCbvGkJpCNinAvh2Bl6TAshseM3QZHZPb2vlva5rdPL6JRoPQUQ3kfHEJJkoAC4
         B2Gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZVnIpcK6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a128si462041qkc.7.2019.06.13.14.25.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 14:25:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZVnIpcK6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45684 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbXEI-0000jd-IC
	for alex.bennee@linaro.org; Thu, 13 Jun 2019 17:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48306)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hbXDl-0000ga-TT
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 17:25:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hbXDk-00076D-Jj
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 17:25:21 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:44478)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hbXDk-000745-AI
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 17:25:20 -0400
Received: by mail-pf1-x444.google.com with SMTP id t16so39034pfe.11
 for <qemu-arm@nongnu.org>; Thu, 13 Jun 2019 14:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qUztuGQSty9lg5aMBAyILDQxrq01iLy2gukKWXrdxWs=;
 b=ZVnIpcK6oloY4eWsyR4UmMr+gxfpM8YKlPiIEfvqAp/E4QVUXnRq8O90OEPlm/nGA+
 lr91bTuDJQZ6kB5cVklbUOez5VREhyicO4ztQ539Jkvzcwo4P7laXOctm+kGoMtEIqqg
 Vn6RLjz87JnzWgnojhRnz00J92P60ZgIE3R0Y8dm7AoQxTESLG2thbBnHIAvFJMKYCzq
 ZQqx60aG/oMtLWRLpUTXLUHsNYIRFhBLBI4eiwJWePDeASpQ4qombjeQ8m27fscbhrYm
 /IAvM9Wotm2U6U3Fwcr0iFYGpasbI1cUYFwxhGi7A+smxYnXrUbwAsfhAMZrFZQhpC8g
 NVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qUztuGQSty9lg5aMBAyILDQxrq01iLy2gukKWXrdxWs=;
 b=lx9pH8iAfUcccrIU3QiHFVEK4VTwDrXNx2MkcllN1j+WZFjzlZD7c+FMAKcrhwJtxR
 CZe5ibmUaBcc1GMfXrSiy/DC6zic5Ef/FpDmHn30Q8+Lg4MDFI4appRi0lReyw9LzchZ
 ar0826psiVcFghxgsaimNMz10F7tXJvfhEnezuwpjNbpkdj4O433HyjyPQhlUecFcBaQ
 pYG1mxVlYx+JXGSNQ84lHeaf4LGWmXctihiLaS1R0wVX9AXh/cCZBVevepyjM+UWl+9b
 CXHTKEiSjU6N7k1xFTZJVeLfPfl6lTvqkd7uSrIN7FsPCf6Byiz9UmJD4ausFMIBlzz7
 TN7g==
X-Gm-Message-State: APjAAAUNyXp93Q+KCW1bIEEY/x0oedRrMEz/9cOyYq6q7dldWe2y8aES
 +5PgpADkHeIkdryKseKVZ7zSkg==
X-Received: by 2002:a62:6143:: with SMTP id v64mr58324265pfb.42.1560461119008; 
 Thu, 13 Jun 2019 14:25:19 -0700 (PDT)
Received: from [10.10.150.239] ([149.199.65.200])
 by smtp.gmail.com with ESMTPSA id 139sm593175pfw.152.2019.06.13.14.25.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 14:25:18 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190613163917.28589-1-peter.maydell@linaro.org>
 <20190613163917.28589-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <45d470d6-d0da-894d-475b-93cd3498a827@linaro.org>
Date: Thu, 13 Jun 2019 14:25:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613163917.28589-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [PATCH 03/12] target/arm: Stop using cpu_F0s for
 NEON_2RM_VABS_F
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
X-TUID: TEZnXkrf1xg1

On 6/13/19 9:39 AM, Peter Maydell wrote:
> Where Neon instructions are floating point operations, we
> mostly use the old VFP utility functions like gen_vfp_abs()
> which work on the TCG globals cpu_F0s and cpu_F1s. The
> Neon for-each-element loop conditionally loads the inputs
> into either a plain old TCG temporary for most operations
> or into cpu_F0s for float operations, and similarly stores
> back either cpu_F0s or the temporary.
> 
> Switch NEON_2RM_VABS_F away from using cpu_F0s, and
> update neon_2rm_is_float_op() accordingly.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


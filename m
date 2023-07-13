Received: by 2002:a05:7022:629e:b0:68:46be:293d with SMTP id e30csp2850051dle;
        Thu, 13 Jul 2023 11:29:32 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEyXtv/FPhzYiu8fmKmIHZY/FYzeXlDeinSP2hcgvyGxiW0PGeX1bnd1ZlGoInfCuIRwSoG
X-Received: by 2002:ac8:5888:0:b0:400:8f5b:d3e6 with SMTP id t8-20020ac85888000000b004008f5bd3e6mr3385868qta.6.1689272972175;
        Thu, 13 Jul 2023 11:29:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689272972; cv=none;
        d=google.com; s=arc-20160816;
        b=j4jdS8jZRZDkRAxgOeDMSRiXPxLTY0OBNg8vuYZ0m96U8J/0e1WQ487bC44zI66Ori
         FichRBddyNyg6xUmtEppxeKyPP6jB7K2RcjQD55YWtKlCxR2d/1DBIZr0MRp9HDyhMa2
         tGSIEhfbPpj4w+HHjfbDlrgB4vDLNBjUFlA5HJajm7Ck6LIiSc7D2JdMtUZWil5+gE8R
         3K8+1qFAtRPmwYYk2kZQ/FHsrzJF3FqJWZ0jKQU2WtAZhQSoRFKmSvFbrt+nLT2KJJI3
         O4v52EFnWKf9imiXx8dNG/BbLUuMCIFXYrQKkRtPeZWqHxXYyCHR/6QM5CuICG92j0Ec
         BH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=17j90EH8n7nIALhhxhY9RcLMseNefN+FfaJAuNQXiDQ=;
        fh=8BOuv7eAieu8uJPT09bTs8lQLOGBrEJe6CvImfJ4rQ0=;
        b=UXF/WJfF5Gmn8R7rFAwscOZ+So49M/wivkbJEjpaq+DcxHLSSyzMaKHo2DsC4ronN+
         fmdC5vLdewZ74u36MouWiQUL+fUMgBD9rXobcAubBx5veF5addQbObflqoaYPznJ5ZEm
         HtVNa9wfb/tUXZpWOmGO/AiuJxPw13suOqu2zPGK+O5oeg8A7+AtiwyztL/dg2NPXK9H
         yEWOWU1W1FfMw9lW7QIs8gW1jubArZc5CNKvQMgq0TK5DN8MAqEV74Tc5JGACI4xUXoL
         SKB6C7fsJdxJkmo9bgZVgukVVr7FIPhznm712w/q32lSGo/jv4k4nsupfsdB05tsRtCg
         pd+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BQihItzT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e17-20020ac85991000000b004032991c379si3384274qte.426.2023.07.13.11.29.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jul 2023 11:29:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BQihItzT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qK13o-0007oI-Nc; Thu, 13 Jul 2023 14:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qK13n-0007na-9A
 for qemu-arm@nongnu.org; Thu, 13 Jul 2023 14:29:03 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qK13k-00075N-Ce
 for qemu-arm@nongnu.org; Thu, 13 Jul 2023 14:29:03 -0400
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-40292285362so7948931cf.3
 for <qemu-arm@nongnu.org>; Thu, 13 Jul 2023 11:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689272938; x=1691864938;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=17j90EH8n7nIALhhxhY9RcLMseNefN+FfaJAuNQXiDQ=;
 b=BQihItzTb77krOw7tKkCNb4VE6fvWdOksQMzkPVdAmInO/6AwsoydFCbveBiwI0mWT
 tG42BxKwksqePhu0uGW/LcY4O/MPZEPkh8pq/yw7gvcJVCp9TUqdq7Jr4gjtXFpFJ1gQ
 bBxPgptGcW3lFKkR8TGprjONC7GIN3qM16BFu7nq5hubo46+fN3Mu39uAZe09BVNtaeY
 JEogpcWto1H8dcM6+p4w3yQcbKWVbyUImTE6YPB+XIuCCSR3sJP0hBNchRhSYeYGfUMJ
 3+iij33bXRrRG5BajY2JBmAIJnC9SKRDeKI3ujaaTewZQWUCk9dkvmT4a/jrh0e/yjWs
 /orw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689272938; x=1691864938;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=17j90EH8n7nIALhhxhY9RcLMseNefN+FfaJAuNQXiDQ=;
 b=OC2ohB/z6orNH851UU3P9xawizXD5RjTGHvN6x0QZ/FfPWuMnFFKbj3IadaH1DklD1
 0cSH/b2ax/kjC0LSXzuVK8g4RnTSe1FLVrQ74LGcYHl+hPp91d0KLeXEdGUk7+KnTeHe
 IgdaVy0FVizcIx3pNOFybH5F/CBc7z04SeePJENVB7RXs5ZR3zr8G+PEL9JX8yMTNj6h
 pb9Bgpzn0F9lpGNJi1sF1/JYyFwZv8uaC5Xm4yqisYIGj5qSwPCJi64w5bdOoYPGfhuV
 7qTvWkaekwmlWzcTkxdz4QG0GyhmKEPx2pzPcY35jnOUjtprSbRcYHknR/hSDpaJgAtB
 EReQ==
X-Gm-Message-State: ABy/qLaJqmIZnivwq5/03TS/kqVEr43gOY0fnLYXYqXelIoJaDhYul8T
 53o8ecF2pVOdAwOOGooSHnXysw==
X-Received: by 2002:ac8:7d10:0:b0:401:e29c:b1b6 with SMTP id
 g16-20020ac87d10000000b00401e29cb1b6mr3146955qtb.39.1689272937801; 
 Thu, 13 Jul 2023 11:28:57 -0700 (PDT)
Received: from [192.168.88.227] ([172.58.139.107])
 by smtp.gmail.com with ESMTPSA id
 r18-20020ac87ef2000000b003ef189ffa82sm3246825qtc.90.2023.07.13.11.28.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 11:28:57 -0700 (PDT)
Message-ID: <e0d55ddb-3960-6ff3-e480-6f2fdf2d1407@linaro.org>
Date: Thu, 13 Jul 2023 19:28:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH for-8.1 2/3] target/arm: Fix S1_ptw_translate() debug path
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20230710152130.3928330-1-peter.maydell@linaro.org>
 <20230710152130.3928330-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230710152130.3928330-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.096,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: y37BpdnajZDY

On 7/10/23 16:21, Peter Maydell wrote:
> In commit XXX we rearranged the logic in S1_ptw_translate() so that
> the debug-access "call get_phys_addr_*" codepath is used both when S1
> is doing ptw reads from stage 2 and when it is doing ptw reads from
> physical memory.  However, we didn't update the calculation of
> s2ptw->in_space and s2ptw->in_secure to account for the "ptw reads
> from physical memory" case.  This meant that debug accesses when in
> Secure state broke.
> 
> Create a new function S2_security_space() which returns the
> correct security space to use for the ptw load, and use it to
> determine the correct .in_secure and .in_space fields for the
> stage 2 lookup for the ptw load.
> 
> Reported-by: Jean-Philippe Brucker<jean-philippe@linaro.org>
> Fixes: fe4a5472ccd6 ("target/arm: Use get_phys_addr_with_struct in S1_ptw_translate")
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/ptw.c | 37 ++++++++++++++++++++++++++++++++-----
>   1 file changed, 32 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

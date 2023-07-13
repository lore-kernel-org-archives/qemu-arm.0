Received: by 2002:a05:7022:629e:b0:68:46be:293d with SMTP id e30csp2849130dle;
        Thu, 13 Jul 2023 10:38:18 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHO6B9Am8F5Ac7NB4IMcsjTnhoulqYzzXSmyfsGnSjcHfU2b+3E3K67CFWx0J+dajerHM+8
X-Received: by 2002:a05:620a:2494:b0:767:e04c:8d71 with SMTP id i20-20020a05620a249400b00767e04c8d71mr2482818qkn.60.1689269897965;
        Thu, 13 Jul 2023 10:38:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689269897; cv=none;
        d=google.com; s=arc-20160816;
        b=dbmLohGNcBHx8GmCktr6CLkZyswO8ELdZ0dWdj7PF9cgKGbvNpoY1jTdif84ELHOOw
         /uIYDaXKu/aWPvvGjAA4dkVR0ZSXt8p4iVvqO8UFiku4bbkRX0t/X1CERS2pXGdBEO/L
         +NrBUP8pCDKJFmcKSu93Vyzr2Bmyt2/l3/6TsqDEOJZdRCxOV6qf9kuWZSJnp8aT7B9W
         EFKXqzOuUT80xyxNYx45eRVqA3iP9do5hlJIx2nJFwKB6Sw2emHe6JaXTCfJITIf+pq3
         SCwqkLc7cxP/G5hcpuOIk9MIwXygeK1/j4eJtsgXedIRD5cnPHfqukI5igp5NjabomvV
         IV5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=dVFP3JlHoUQ/pnlO9li0Bc+vPsPmYInxmgBiusg+Ytk=;
        fh=8BOuv7eAieu8uJPT09bTs8lQLOGBrEJe6CvImfJ4rQ0=;
        b=CWnYf909FfTvAAUerZ62KQEBWMFuvMHG5y8+QUazwvbfiiZzf2YKVUoC6cz8mY6QZM
         uvhLbovk9FPd4cmEEIXEhpvsN4AAM87bisqrFjXhaxpHfcQLfQLE6xS2Nb/KitWt8UxS
         kBvelsUoB6lxAyukM6JpmX+P4LrvnvA60qGQYsRC0Ri04OmqEVH7h2zeaPw6hAD6y/zA
         zvZ6+Nq+2rtjZuda3yvXQZq79mOhxnh12hCOkqOAj1e6qSnWi+sNAAUYXaYls7ydqpcA
         PxH7kr8q5Hy9hyzNcTAENJE2+p97Nrnpg4jOfF5371U4sEylPpG+bISdvxwWeRlX1o0K
         9/Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Q7d/bRoI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j16-20020a05620a411000b0076429e28ec6si3547774qko.288.2023.07.13.10.38.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jul 2023 10:38:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Q7d/bRoI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qK0GJ-0004rW-2y; Thu, 13 Jul 2023 13:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qK0GH-0004qT-S6
 for qemu-arm@nongnu.org; Thu, 13 Jul 2023 13:37:53 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qK0GG-00073d-HV
 for qemu-arm@nongnu.org; Thu, 13 Jul 2023 13:37:53 -0400
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-c01e1c0402cso901082276.0
 for <qemu-arm@nongnu.org>; Thu, 13 Jul 2023 10:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689269871; x=1691861871;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dVFP3JlHoUQ/pnlO9li0Bc+vPsPmYInxmgBiusg+Ytk=;
 b=Q7d/bRoIj7VGol+5DJMNBS5JGNsowEqHEyvSNH2Ik93uYnf1uvUN/MJXT9DRmDgSdZ
 azImftPRxt1rwTk5NW43P/wlRirGlx5ux/yKIWpS7XFkllJiA+X7J6sqyRQl3rWRGrpy
 vmDpOls90kCWoZfNFEtN3YrPcjlkWXXdfZM/YCINX645Uy85WhTRwxTSWNoDI+BWbYWf
 LN/TQIzYNTZAyFUYjCMOTTgB5qD1niH2n1e6+da0P7OvfHvWM21rwnjAf9j9cyn61iM0
 dxYlBjeUBCgYTC+cm8sJMoTki3CtTXVm1y7B6O4tqEDw21MRq7QLQXscs9D1urDLLdo0
 08mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689269871; x=1691861871;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dVFP3JlHoUQ/pnlO9li0Bc+vPsPmYInxmgBiusg+Ytk=;
 b=HvgIcZ+SbRZiqWP18dt+LizyjeS9yR6AbZU51LeB9uyLD7KXQeuKfak9iOYWUdLsBn
 c9uVLMt0mzezPkegHD0B3FIkW98nRzbR7FHbK1PUJn43QiLZVZX3WHyrpQWetIzfZJdV
 GPPcAIFZCAQktHPyQWTsETNNX6+7JjMm2263Qhm9btqVYBwRM1Sa6x34sZ1weuyASQ/d
 PF6BMtyNwHIfplLyoHScJwbcauvlVL9++yzVGJDxs5iJRI8kJE5YS6duw0dPy8m4i1Yj
 aQx44cjWvcqKArMIV0hLpY9atUYIn/If6cVtKx52BrzhhB4eXfNMU8V7uau001cTBngr
 bmtQ==
X-Gm-Message-State: ABy/qLYSw/31XGUZby6nAAStzQVbyPuFJd6o3Nt/A7lSe9t/71jNfyWO
 9Ew5zNXXkdEEuFYoPOVyjDlVIg==
X-Received: by 2002:a25:b44:0:b0:cb0:3ce5:2bbc with SMTP id
 65-20020a250b44000000b00cb03ce52bbcmr1632321ybl.16.1689269871090; 
 Thu, 13 Jul 2023 10:37:51 -0700 (PDT)
Received: from [192.168.88.227] ([172.58.139.107])
 by smtp.gmail.com with ESMTPSA id
 k77-20020a252450000000b00c624de0d9absm1505377ybk.5.2023.07.13.10.37.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 10:37:50 -0700 (PDT)
Message-ID: <ba359b58-c854-3608-c736-90dac2eb6356@linaro.org>
Date: Thu, 13 Jul 2023 18:37:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH for-8.1 1/3] target/arm/ptw.c: Add comments to S1Translate
 struct fields
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20230710152130.3928330-1-peter.maydell@linaro.org>
 <20230710152130.3928330-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230710152130.3928330-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.096,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RckSI7f5YPiM

On 7/10/23 16:21, Peter Maydell wrote:
> Add comments to the in_* fields in the S1Translate struct
> that explain what they're doing.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> I figured some of this out when writing commit fcc0b0418fff,
> and then I found I'd forgotten it all when I was trying
> to fix this new bug. So this time I'm writing this down :-)
> ---
>   target/arm/ptw.c | 40 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 40 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

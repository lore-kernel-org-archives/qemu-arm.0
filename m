Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp779997ejb;
        Fri, 31 Mar 2023 10:05:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350ak11QnZPmBgVoUdh+Fr9VZVBmxnG00kr9se20WlurGcmKsImv1zVwZtmxU+/W9ZytBR+kd
X-Received: by 2002:ac8:5c96:0:b0:3e6:386b:2314 with SMTP id r22-20020ac85c96000000b003e6386b2314mr9271483qta.62.1680282305695;
        Fri, 31 Mar 2023 10:05:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680282305; cv=none;
        d=google.com; s=arc-20160816;
        b=dLDNj+JdCebHPyI7MXOYBJ3eubGo2k1l2Ge5ews0xZWMphQREwPC29n3/bhb1xW/sM
         1bbfTHwWigrTsXOeDmYC3I04aPnunMi3i1osS9hQgIKiYMrpJ69+9Kan7WlNYWjny/lM
         mIZa/SKmKu81HqeJGVQve8pVmxUQJ1fLTuiClQ3+u0b4d1j8OoGfcGRznVzFmD77ma3l
         gpcdheEOr2DXioz698/ktDn5ibwZEKEvhKtBzskkNLrWMMtN1NZBSdv0ixjoHDWh5ZPH
         O9cqnYLGCMCJhYW9sEiF7MjxSAWKNOTRZ0zCZ+D4O+Xl+AX3qtzfgATR3JB1A47hcVwW
         FuVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=73WpggZpPKBN91u13PaflwC4TKPrC0vrOYMOkErfrQ8=;
        b=xJHUCOa4u5R+R8DIrVtpltVfMobcF8w7V4zVaNYXutk5n5A17Kvcw0Hda3dsrfWvd0
         V5c6H1oHXs+Yy6zETv5VH3L4hVvzsbBx6vurkuQNkn5HUNz55HQIJClzfvr+zfoKvkUX
         F2aUtiMkCL4oe9gi98KSsHFy6kt87GRYV5ccLpbMJBYf9CL+dx3gm6BIij49MBDEkrIA
         5lHcGhMRxCWBFMz7dej6xQLqRm/Rjl83uZYUbwpM/J2UZ1uELnqrqNuljqRfe9MSAoSV
         w8z8yBY2tcaOHaPA6zYcWofDz7XuNbcVK3qt7ZWuevQH5r2ymn8AaJYlRj/7dS4ylQsO
         bHRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="uCzjj/Fa";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f9-20020ac859c9000000b003d4da60a9d5si1937685qtf.214.2023.03.31.10.05.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Mar 2023 10:05:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="uCzjj/Fa";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1piIAu-0007vY-00; Fri, 31 Mar 2023 13:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piIAt-0007vI-3h
 for qemu-arm@nongnu.org; Fri, 31 Mar 2023 13:04:27 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piIAr-0004E8-6Q
 for qemu-arm@nongnu.org; Fri, 31 Mar 2023 13:04:26 -0400
Received: by mail-pf1-x42f.google.com with SMTP id y2so15229711pfw.9
 for <qemu-arm@nongnu.org>; Fri, 31 Mar 2023 10:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680282263;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=73WpggZpPKBN91u13PaflwC4TKPrC0vrOYMOkErfrQ8=;
 b=uCzjj/Fa4JUFL9bfexRbHhpxajmAC02PCPJNxR9WB3xJtQRtNLjFKNsPYPc3YqHU+N
 P36WhhpkIiceihRaWlmywsnVPN/w258EZpoFLwA6PaQeKvEhF+tLbF62BGtMignlMjCo
 rEK0aWVyGR/OlLeZ4RssDdms07h8QJDAVeqcDAJOpV0/dkDtVj1pQOfxWSO7CofmnW8g
 rFc0+NO4MIIYwy8JNmAPIv+kL76C8yB7HUIVt0X0rREqcGm+33d3WTb2iKgOUWPIlq2g
 u8XG2+Gdr1bU+BqoBxP9WcyJo+5W23BeI1pHkoJbH+1wmcvnn1BUtwzeddqYtvlFLZB5
 0yHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680282263;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=73WpggZpPKBN91u13PaflwC4TKPrC0vrOYMOkErfrQ8=;
 b=HeB8udhrKOj/jf0JtifdGqelUqgjuKb8u830hiQViK5A+l5DZlCUXN21nyDU/6jEec
 FMW/jFWYBDWcMrPvo7+4UF3H2ByUst/5J/PMAcdDeNPXygS7FFD+Asm1WifMiRDUZwJV
 1xnJpJnUHm2MoQW9FdmECPjzwOP9EGYGI1bnAlrXQZDsu2ANze8sTXiNa24Zv3g9OnfN
 An4+iQEdeFBe6sfWHtWJkCCKl3EsJPRNPwSp36rSRgokgXscQVgoaXTg+E2gaF4WybwI
 eo+iwybIT20TGBLZ1d8THBEXWTMtMmjrewuLbXASrkdyWEplbC19qkImTLJkTL/1ib+O
 Ef9A==
X-Gm-Message-State: AAQBX9elDGg0Ch8mciVByvOZkdHWHCGOxOAc7okUp5/TvAjImQYBJVa5
 tj0WQj91u5621/ATztrbJVEXFQ==
X-Received: by 2002:aa7:954a:0:b0:625:cb74:9e01 with SMTP id
 w10-20020aa7954a000000b00625cb749e01mr27653991pfq.25.1680282263518; 
 Fri, 31 Mar 2023 10:04:23 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 i17-20020aa787d1000000b005d6999eec90sm2042476pfo.120.2023.03.31.10.04.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 10:04:23 -0700 (PDT)
Message-ID: <db3fdecc-1438-fb80-0853-6d3482eb8ea3@linaro.org>
Date: Fri, 31 Mar 2023 10:04:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/3] target/arm: Implement FEAT_PAN3
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230331145045.2584941-1-peter.maydell@linaro.org>
 <20230331145045.2584941-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230331145045.2584941-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: wqDngbWTddUs

On 3/31/23 07:50, Peter Maydell wrote:
> FEAT_PAN3 adds an EPAN bit to SCTLR_EL1 and SCTLR_EL2, which allows
> the PAN bit to make memory non-privileged-read/write if it is
> user-executable as well as if it is user-read/write.
> 
> Implement this feature and enable it in the AArch64 'max' CPU.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   docs/system/arm/emulation.rst |  1 +
>   target/arm/cpu.h              |  5 +++++
>   target/arm/cpu64.c            |  2 +-
>   target/arm/ptw.c              | 14 +++++++++++++-
>   4 files changed, 20 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2349883lff;
        Mon, 14 Jun 2021 14:58:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMY+A1+bpmuLCItLMk8R139QAB1IL6OxqXYNl3Jo1rZKNxdTwLbeW7QPMTQMYwtIvT7DEK
X-Received: by 2002:a92:c9ce:: with SMTP id k14mr15704365ilq.99.1623707919797;
        Mon, 14 Jun 2021 14:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623707919; cv=none;
        d=google.com; s=arc-20160816;
        b=iligVMeqhbm5Kt9fXGsBm8t66e7rM96x/LXJs7vcwVY2FS+Ql6vUpp6YlWUU6ElmS5
         aOdsNREJIZg/Ebhv+gXmxz+TcfPRu72ZdrRABIVZI64E13WE4dIjELde3faJhuL2Xdtl
         0sGwiLB8rwTN+7X6WDf9gQsY4B8GnoKTzN6ssGU4P44NcTX0/aJU5K4d1wFQzHfmrMk+
         sTBiNJHyvwNcD5K9iB+0FlFYkNRA9sv+tiweGyx4X0K7GMxQAoD9GDx5fS8kppZohZIo
         xTwI23RoWnOqHGN5TeJB9XWn8/t7vPQ/14B0OnzSg2Y6Wuus3IXlSiDEU65eIe9Swc2c
         lL8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=mYa/g4/Mw2qGq+y/k9E8eE5hCU6MshHAslXqZpFtjTc=;
        b=mEI4m0Ppb5QXBxXtqOILb4RpZzRN5lEGbrHK7gniazNljHpQ/FZm8BA0cL21n09rhI
         emonHwDSquiN5tIpDhkgSQpbIzJ/xgP/lkZtd0nmO231dfe6kIDi1JuLUt8Rew1nkYTo
         Qd0aiKYwDefaEVhCwflZV4Qx8eUj4WFgCQNqAZ556DSpDp6NdsDRRka7QDYTogZDJwbD
         N07hmd+WzQ1gcLA0abF11zlYT4Jj9iG+lclcZeUL2Tv8/oFU9PshTaIzjc4jeuSk+uJ5
         yDA7HSEzv0/3to1hnrPTCeOS3OId7Ud42gBh6EeYFGkndopq+ymKIa3/ZXGwtj59SVuf
         SlHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=moUvxyKH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e3si17569452iom.57.2021.06.14.14.58.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 14:58:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=moUvxyKH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsubP-0007YF-51
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 17:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsubH-0007Wy-C4
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 17:58:31 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:34458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsubF-0005ZE-87
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 17:58:31 -0400
Received: by mail-pf1-x42a.google.com with SMTP id g6so11667703pfq.1
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 14:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=mYa/g4/Mw2qGq+y/k9E8eE5hCU6MshHAslXqZpFtjTc=;
 b=moUvxyKHbDT/GNswTE3t6JLDRtTL+nMoqrIXJonlT0ssihfbYl1llcz+OCor6NA9oi
 8Ofc2EStFpKHGYw2EvuLupctO2G75rHf2lyeHXWWlTum/dDCob1YbRGkAZ3mFron1bXi
 2m8ZUhBABlMFzTwkYxju9+9j112MXZXfuybduh4mLGx+sRHUq7COCXtK003bz3SwykOP
 uc96LuBXBZLBK06mfZfuUaYX0HvZS8OwHyvy73nwRfMgYYR3vtkkmZyK/+LqoQLn1x29
 0PiYr6WtMbEbocB/c5A06mjEUvZlO2tHPb4Fhk8Tnxz5BeT0D5TkfIZdCDQBvXZCblVS
 If8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mYa/g4/Mw2qGq+y/k9E8eE5hCU6MshHAslXqZpFtjTc=;
 b=DYEyT2m8KgLJainlXmf+NK8cSBWrAy8qiYjcbJut9j1LW2E1qJ4hB+RZHXQHJUF4q0
 hqcbc99Vh3AIuGCTTrlqzemv/KiA+WhO2OUv0LF3WTjXLplSi3rIeeZcZfjhcrG3B1B6
 ScZy3FnUW6Zy4QwF9mUTXsrkYfQKXPheWxvnoXIbe6KSn9/0iTrlv/a27XFtgsyCnVhE
 6qX7VxvYcAiNFFdCyis1pBUc1/zQ0vjAoUCT9K3mp9mHu4pLR0KuVD30vzgIfRs/c4Kn
 K8U2YwiM7wF44gUxemd/EF1M3R8yGOyj2nZ1fbBa3ZhJ61gVNwl5RkRoOFkgVUx6YFye
 rj9A==
X-Gm-Message-State: AOAM532ipmq7R/qaLUyL6fTH+TzTYv0dSsV+IgPk9HNOEpLJ8mnW69I/
 B5PqOlerfnkS0rYiJE0N8D/lzw==
X-Received: by 2002:a05:6a00:bc7:b029:2f5:7bdb:f694 with SMTP id
 x7-20020a056a000bc7b02902f57bdbf694mr1019844pfu.41.1623707907678; 
 Mon, 14 Jun 2021 14:58:27 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 pi8sm12887959pjb.52.2021.06.14.14.58.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 14:58:27 -0700 (PDT)
Subject: Re: [PATCH v2 53/57] target/arm: Implement MVE VADC, VSBC
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614151007.4545-1-peter.maydell@linaro.org>
 <20210614151007.4545-54-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a1945e65-c0cb-215f-7ec6-a37ed9f50592@linaro.org>
Date: Mon, 14 Jun 2021 14:58:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614151007.4545-54-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
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
X-TUID: 0ZP3hkuywBSg

On 6/14/21 8:10 AM, Peter Maydell wrote:
> Implement the MVE VADC and VSBC insns.  These perform an
> add-with-carry or subtract-with-carry of the 32-bit elements in each
> lane of the input vectors, where the carry-out of each add is the
> carry-in of the next.  The initial carry input is either 1 or is from
> FPSCR.C; the carry out at the end is written back to FPSCR.C.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  5 ++++
>   target/arm/mve.decode      |  5 ++++
>   target/arm/mve_helper.c    | 52 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c | 37 +++++++++++++++++++++++++++
>   4 files changed, 99 insertions(+)

Much better.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

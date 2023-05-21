Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp716396ejb;
        Sun, 21 May 2023 08:06:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6ccL+8TPldzbart3u0YdpTmtptdm/oHYRzPmeufZ8JNyDcT/OpQBVnAZ9gDhA4SEKGdZYV
X-Received: by 2002:a05:6214:5183:b0:623:75d1:fbd0 with SMTP id kl3-20020a056214518300b0062375d1fbd0mr11696368qvb.44.1684681582985;
        Sun, 21 May 2023 08:06:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684681582; cv=none;
        d=google.com; s=arc-20160816;
        b=MIqFHNfxHJHeDpsGYfOO6U39IDf4yBy+jqbxS6cjHLYbbXKJNjqZhVo6cGud5hIEYA
         7fGvaxD4h8l3m2aL78XeJD8wvhZ7iTtx+KOfNxwK/1mUe8srudqrP3rkjn40lBLMS91H
         BDQIX6E0Sj0lmgl2aU5D9LuLLuBBr7y3ymylyj/wcK3qoYu+/SLTEtEf7YYaAiLTsn3g
         0qFpZgBAahVaStbQjqO3xGbZy4rCLhM0yrAGDeoYOh2jRioH8MSxOJbGbg4thXbC7AWc
         midbTsTkECmjqGBw/jesTzwrtx65v7XBKdraCQEVUuJY7RCAsg/04t0f7oPb0tkqQCT3
         Xpbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=kauN85zUEcijoU9C0IuXVfoqSTj2H4oWskwS+fpAtkM=;
        b=wCARILbc6qUINd5lu/7ab1yKm+cuIvkMEpe3i91xUWrl2pIFWd6wnmR95gnSkmqJTN
         Jt4qyYGQP2U7uze9Q8AJL3zoq/jX4vswpXg47gQirrDDnM6sMq/VoK5cObbYMjz1Xo4O
         d7YWqF3LIeZEE6JwP+2VI8n+Q0NL2jlLIHaeMvRiJ2Z2LT0oOauonxrhi7Rx1fnVygG7
         Gwqq2PZjCrndqe+3PrpC2Pg9XrZnInHmjZUnHWN7KottuZYEaRQkIA4yVNPbl1qZ6OhW
         dl0M74UrutbOB7TqBHHwacGgD3iMuc5tFHynAJsFEP8kuecaw6BGsNk5PF6/xbu3kKRX
         NI3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZQejgiE8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTP id q11-20020ad4574b000000b0062561e40af5si1464675qvx.406.2023.05.21.08.06.22
        for <alex.bennee@linaro.org>;
        Sun, 21 May 2023 08:06:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZQejgiE8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q0kdC-0004hU-7x; Sun, 21 May 2023 11:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0kd6-0004hD-RS
 for qemu-arm@nongnu.org; Sun, 21 May 2023 11:05:52 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0kd2-0006gF-PR
 for qemu-arm@nongnu.org; Sun, 21 May 2023 11:05:52 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-64d24136663so2409679b3a.0
 for <qemu-arm@nongnu.org>; Sun, 21 May 2023 08:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684681526; x=1687273526;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kauN85zUEcijoU9C0IuXVfoqSTj2H4oWskwS+fpAtkM=;
 b=ZQejgiE8mXpC2HhLyCm98/4nU8g8mBH5RALgFG7yJGu7M0QiZdkLNFliiy4KMAHpKE
 Jw3U5YCZpXkcFgXT7RDt4GHBE9P7H1vbIDKgWhfNiNvOEfK0Y/v6uEPNXtGtnVT1ubxZ
 wjOC06l6s/SnZItrjzqeTi4g8itXmSKh0/PQi/Dj4mIY6P/wXbe/Irkrl2mSnn1+0z79
 RmQsXBusuFhG96xqSexg0/hy5uTglxbXNP85Qhzfo840aJXRZzLWlTSW4xJU3KjvnUIf
 bpawry0YCEeT76id7FkazD/TAx8oSrAiwOxgoTYm5M+cX8BtkTlTZ8JnCFVO2dCwgTtE
 WA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684681526; x=1687273526;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kauN85zUEcijoU9C0IuXVfoqSTj2H4oWskwS+fpAtkM=;
 b=bv0Jx+OoO0hRZK5+Ft2oWl0cSW1oIZAVoP1Zs8tKGi3gFmiBNtLssPqmnZqOlZ7zHk
 FIg5gAxhL7IEnnQz7W+zbS1J+ic/u6ERV1PYdeiAGhuvoPzlCEdFEBbz0WvIFduUVM61
 i9iVPYxsu4t67GwB1v1medIo2Oi+0CFNlDWqYtOXzCMASqIKPJzaBkBcBSkoGSbi5e5f
 qODPaYte9rOOtnAOBsmuXQPJhduECZ78IDRQzq5adqx/oRle+auJIRYfyI+QJ3/Ta8tQ
 UlNUt5jUnV+VAJWeA/O3whMSQ7KfO/rqC9JCCwCDuLIRkfQYyj2hoZMHUXSjgDJiQjcw
 0kGw==
X-Gm-Message-State: AC+VfDwfE5C2lDitlJVVyw+fQWAf9uMUSQQNPQTNNBKihF0/oSF6AVwe
 C7AN8uG2al73P+nDTdn7VTGcSw==
X-Received: by 2002:aa7:88d6:0:b0:62d:cfd4:e440 with SMTP id
 k22-20020aa788d6000000b0062dcfd4e440mr11416956pff.8.1684681526242; 
 Sun, 21 May 2023 08:05:26 -0700 (PDT)
Received: from [10.40.30.162] ([66.172.120.86])
 by smtp.gmail.com with ESMTPSA id
 k25-20020aa792d9000000b00649ac17779csm2617583pfa.160.2023.05.21.08.05.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 May 2023 08:05:25 -0700 (PDT)
Message-ID: <dddfb5fc-31b6-9561-5d71-1e83534dc269@linaro.org>
Date: Sun, 21 May 2023 08:05:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 02/27] util: Add cpuinfo-i386.c
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
 <20230520162634.3991009-3-richard.henderson@linaro.org>
 <b51a6df0-b53b-c6dc-b496-0c320aad463d@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <b51a6df0-b53b-c6dc-b496-0c320aad463d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
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
X-TUID: QOZQXetPvfCF

On 5/21/23 04:28, Philippe Mathieu-Daudé wrote:
> On 20/5/23 18:26, Richard Henderson wrote:
>> Add cpuinfo.h for i386 and x86_64, and the initialization
>> for that in util/.  Populate that with a slightly altered
>> copy of the tcg host probing code.  Other uses of cpuid.h
>> will be adjusted one patch at a time.
>>
>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   host/include/i386/host/cpuinfo.h   | 38 ++++++++++++
>>   host/include/x86_64/host/cpuinfo.h |  1 +
>>   util/cpuinfo-i386.c                | 97 ++++++++++++++++++++++++++++++
>>   util/meson.build                   |  4 ++
>>   4 files changed, 140 insertions(+)
>>   create mode 100644 host/include/i386/host/cpuinfo.h
>>   create mode 100644 host/include/x86_64/host/cpuinfo.h
>>   create mode 100644 util/cpuinfo-i386.c
> 
> Missing F: entry in MAINTAINERS file. We probably need new sections.

What would you put there?


r~

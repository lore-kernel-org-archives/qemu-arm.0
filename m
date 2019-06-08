Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1550946wrg;
        Sat, 8 Jun 2019 12:42:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwN5Mo+t61XBpuRWKbr6sqBnoj5KBUHaWjIk0WJX312VGKwdYkoJF/5+oyRmQc4Hs5jlw+0
X-Received: by 2002:a0c:c16c:: with SMTP id i41mr49143622qvh.33.1560022935386;
        Sat, 08 Jun 2019 12:42:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560022935; cv=none;
        d=google.com; s=arc-20160816;
        b=dGxvMzJLCTkVzMWAh8eREokwhFzfYcIEic+dttrbIauFu9DiV+mApPxhmtIPD08C40
         5jRNyHHIaM1tPqNvzvWqPjiqTUIo3KXfwf6HGGGaHhVeZCJEx+D40U2MhtmbHpFa8IRt
         gL5wZvrGCK8tPVUZdzlKLoXh/CWbctkk8XJijnPtO9tGjZRS4gA/1amquaEii2aazboN
         ZGnKGVYrkDK3vZKVHXXssAs0ZayeItOQI3DueXp94qNYKPF1aCHYh7TBck/EpRYDhB7C
         W/oA4BYyOcHmS1lbksF/nfCQoWC6/xrDIRyEQ0wFvyYb3HcDmrVnaoUZ8zEEvnbG1djX
         Vbzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=rj2E36ngY6AnNq+UCpUAKpS4p6Z0dG7frbklF6/2p9o=;
        b=hvW0LAeT+oxKfLaICGZ6YkYTi/HB0xixVHdCNxrx7HaTFH16K09bxHnnYdibbGvSKt
         ktH1vtdinmrZB0Ut0aOvnKkolJoVcPWSryO29C62dMkdYeW0WRXRi+05jlbRHDObbrqr
         ptTvh0RlNyn/iKp8nzTXKLaQ1EhnovdgAJiXKmHkwQu2QA4+wOliuN9Nb6Lncff0JKW8
         JPv6sZqY2LCL5zPrxbYkzCvfLpGL+101lTdPlS379xS6Gu0SsWH91YZKMWD8waKZrqd1
         3+NT4wyeX0b9AvPw497XrX6QTEgf8AKW4XuWmVz3Ngamiv24EXuj+4Uo6Q3GxEmygteN
         k1hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qyvGs13R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15si3948443qtc.306.2019.06.08.12.42.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jun 2019 12:42:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qyvGs13R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60138 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZhEE-0002RM-Tn
	for alex.bennee@linaro.org; Sat, 08 Jun 2019 15:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38067)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh2S-0008FB-HK
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:30:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh2Q-00086y-Ka
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:30:04 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:37059)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZh2Q-000854-8c
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:30:02 -0400
Received: by mail-oi1-x243.google.com with SMTP id t76so3715989oih.4
 for <qemu-arm@nongnu.org>; Sat, 08 Jun 2019 12:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rj2E36ngY6AnNq+UCpUAKpS4p6Z0dG7frbklF6/2p9o=;
 b=qyvGs13Rht1Pttbmv2WlNqmWxc7d3o4b9WedsavwXoNuIoExzxTAR9HxNNkfhG19Ub
 xBbz/xWC2Twl4fIq7UcrCZyDzo/ULvPcLptQo81Qmutwn0Lp5DcIkoDXsLudhcEX+YmU
 PNQuyMEm2pbIbP6IchkFWblUvDNzLEcm6WRV1+22t24/9U0CgaZMYL4ikYkKq5+xz4b4
 dHP0fj3b1wO9Wli74Hzk7Kbg1IK9BTWpVIOsrcxZal5KwU+rxk8A55vATAIluY0toK+X
 RVjzjnc9YeqscidDQqAfvLYEH/T4Q+m4iGyI6mojmr1C6Fnuzytcuy5xDVb0G504ZB90
 Q25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rj2E36ngY6AnNq+UCpUAKpS4p6Z0dG7frbklF6/2p9o=;
 b=DPWUONLGSU4J+NN+ZOKxe0CqPtrAINoZZVK52YpthARO6v0JDoTTT5C0gqExuGHNUU
 cTEgvZgiDT7qHATbJ0vKBR6bddt2Rvdi8CQJzPAXJ+10Nshkoi+ZYTRgPAv1/Z19xMWr
 jkhe0Fap5LJa8+4+vDT0mMq9EPmHI20yraRo0nepqREFurAsfyDME0pRmMcVlO4W5/wH
 8hYZBIbwgA1I3+vHHwfK5WJXnabiqXc52DLZ5Vg6K7rsFnMAWJDkogIc0DQThw4p22Le
 FDX88D8CmXuZRrCR0C4QozyDc+WjdTmsyhCx/kAQ65gs+m7CQyJwa+FtktkuK/MQ3Aoy
 WSVg==
X-Gm-Message-State: APjAAAVzufcvmxM2zqr+gQHKWM8BkWLzf9dNBpFfE9Agfnv9FliJRkqI
 7K0cUOZy03sGXLBGJO9ozmpRFA==
X-Received: by 2002:aca:efd5:: with SMTP id n204mr7834806oih.60.1560022201514; 
 Sat, 08 Jun 2019 12:30:01 -0700 (PDT)
Received: from [10.219.49.199] ([187.217.230.84])
 by smtp.gmail.com with ESMTPSA id g16sm2016260otl.40.2019.06.08.12.29.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 12:30:00 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-35-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f80c49ec-6075-d27a-56ba-a0ddb501d7f0@linaro.org>
Date: Sat, 8 Jun 2019 14:08:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-35-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [PATCH 34/42] target/arm: Convert the VCVT-from-f16
 insns to decodetree
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
X-TUID: 02zFG7f3+5WN

On 6/6/19 12:46 PM, Peter Maydell wrote:
> Convert the VCVTT, VCVTB instructions that deal with conversion
> from half-precision floats to f32 or 64 to decodetree.
> 
> Since we're no longer constrained to the old decoder's style
> using cpu_F0s and cpu_F0d we can perform a direct 16 bit
> load of the right half of the input single-precision register
> rather than loading the full 32 bits and then doing a
> separate shift or sign-extension.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 82 ++++++++++++++++++++++++++++++++++
>  target/arm/translate.c         | 56 +----------------------
>  target/arm/vfp.decode          |  6 +++
>  3 files changed, 89 insertions(+), 55 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

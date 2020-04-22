Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp182756lfm;
        Tue, 21 Apr 2020 21:17:17 -0700 (PDT)
X-Google-Smtp-Source: APiQypIX/bT71Jj5mvt2bjmEBkW93nnpGVIz7JlhRz8myzMVeTjyeCRrEABuyQNpmb7rnltHPjj6
X-Received: by 2002:ac8:34b2:: with SMTP id w47mr24804173qtb.271.1587529037508;
        Tue, 21 Apr 2020 21:17:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587529037; cv=none;
        d=google.com; s=arc-20160816;
        b=0W1GeEb3iTl+dZmliY1V6ygfLXR73qBftdTk42DJSoSya6xRWLON7ZdLFtIHkGJwLi
         bCu8Sp4NIc07BCIcxyoppToEsvTu7oMdnPKFt1vDP8zBmGy97Ri3epRG0+HjqVObjy/n
         6MrNf3y5SZ9ahqwjb0j+/2qHsTsWV1lJtZMvns33yCEj1TgkZeH3Am4QO7CSFakwg0iP
         EZfCo7Q3LV77kiwls51CZuumTu4Vc+LrFp8HccLc+BX5dNJrqHv3C2OI5Bcdaj+zJrmr
         yczRVdgPpYiibek+tCH/ypjLGnVKGGjqAumkr2FIK4oJrs5BzH4OxyP1mdq/HiSBArIX
         9BRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=r0r79z2+nHaVF1DxyvosXpCQZ6Jr5rWQhT/IjvDPz4I=;
        b=TWmjthhE+lLA4Gk08LzMM/nRriy8w2XMciLQvKKpS69tNfiLMdeO1OjF15y/1Zkrgq
         xOmU7zNWbveeAHvO488vvJWmcXykQRcRTnf0Gs4giyA3/yOZFzyqPgT/lCPP2XTrbHX8
         YL/6Qwf8FRS+nED7DSSx427FeLaI9Kp8QAyjM1OWjj1rLFuxCjcpW/Tb2esuT3nK2sbd
         9DK2ceNmEUATWKO9QjzKR0fBqKJne/+pNeHAIS4KIZ6IETn4tUMQRSGAARxd8AqL0qU+
         dee7zqS1dx1mOV3YGZkJIfw8vz404/IKskDzpp45jaytSuM+Qt4/Tu24ayKJaZ8+s3SD
         LmFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=serzzMeG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y5si2306694qtv.122.2020.04.21.21.17.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 21:17:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=serzzMeG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jR6p2-0000v0-R2
	for alex.bennee@linaro.org; Wed, 22 Apr 2020 00:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37832)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR6or-0000uT-LH
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:17:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR6oq-0000jU-II
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:17:04 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:33860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jR6op-0000Rc-UO
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 00:17:04 -0400
Received: by mail-pl1-x644.google.com with SMTP id s10so432931plr.1
 for <qemu-arm@nongnu.org>; Tue, 21 Apr 2020 21:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r0r79z2+nHaVF1DxyvosXpCQZ6Jr5rWQhT/IjvDPz4I=;
 b=serzzMeGhqQZmOQ2t1vtrzrIrG0kKyBSeUcGTAvh27MxIDlO7RV1PwLXMblQI76ufO
 Lkjsw3PmJS4KDCQLQCsjUflFu0KYAsOnebkCAgrFF7DguMXipxrssT39ytmZH85hlrxJ
 01FFLN34mr88jjGX7i6hqucgjIjo0U2P+YSquvfof27ECIQQXGTD+uy/x/mZJsT11hAr
 4vI0NOw+5hVTZokWuA5v0dSKlNBmaVFGpS5orYeWO6xcgxN0NtvZu3WULNVPqhzp7bmW
 smyHZhfHLYgOJE+RQFMzwkd1aKCXY0BDGdJO61jzPnjgSPyah136xsqpsi/vuEH+BmCg
 IZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r0r79z2+nHaVF1DxyvosXpCQZ6Jr5rWQhT/IjvDPz4I=;
 b=VNTD7QKYC6V4v8WcBkXFF7c2W9h2++MFOWbPvQzyfA40ZA8TkNKD5WEUn0EP+perh7
 RFIqxQ3yvaZzHvI4fTJGkBXkrICF0Rw20M9w83DE8QLDvG6aX9KK1CaDl4ziiPwKuQH7
 SS9AKBjowMGKuce0O0R4z0GnZs9MWGrsbatC3BD70RedF/1a4Ws/hGWRR97iArOckGpT
 yu8JpGd/OuZ5K5FMaLiXRWrEpkc8MsTe+8vrTIvhq5UJEBKuuculacgaw05Cb6MPJIvR
 bApmdj8a9KSA2iE6gVbbDDFqoueP/DYcxcIUPUlHhrTvva1Tg17LL6EuPyzG6nSBu+xB
 8x4A==
X-Gm-Message-State: AGi0Pua5C1ijleVBd0IlYIf4+0OrgejNiY3KPGRhtpW7yztoTP9Lh01d
 BeP5jVMpZcNmkz4JuOHnz9zC6j4XZfI=
X-Received: by 2002:a17:90a:37c4:: with SMTP id
 v62mr6536388pjb.177.1587529021721; 
 Tue, 21 Apr 2020 21:17:01 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id d20sm3912113pjs.12.2020.04.21.21.17.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 21:17:00 -0700 (PDT)
Subject: Re: [PATCH 4/6] target/arm/cpu: Use ARRAY_SIZE() to iterate over
 ARMCPUInfo[]
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200421131926.12116-1-philmd@redhat.com>
 <20200421131926.12116-5-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7e4ef1af-64bf-9eed-6a57-8aff5e67a5ef@linaro.org>
Date: Tue, 21 Apr 2020 21:16:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421131926.12116-5-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::644
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wGDzMu+lNylU

On 4/21/20 6:19 AM, Philippe Mathieu-Daudé wrote:
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  target/arm/cpu.c   | 8 +++-----
>  target/arm/cpu64.c | 8 +++-----
>  2 files changed, 6 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1209415ejc;
        Wed, 27 Dec 2023 15:01:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExs9HjfqCZy3wiA4VUgEBo+BTe00WX1qXnvV6W8+GZIhBA9BmJOUJRnUBH+xD9PWe/cy79
X-Received: by 2002:a05:6870:a693:b0:203:416c:d2dc with SMTP id i19-20020a056870a69300b00203416cd2dcmr11159633oam.45.1703718113406;
        Wed, 27 Dec 2023 15:01:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703718113; cv=none;
        d=google.com; s=arc-20160816;
        b=SStBAGUcdYYlis3f95S4nJ8lfEOsV9EMdzHjrhBD+0YYdhprZSjxsRWSbGXUR7beUU
         HxCk6Rz056nCX5SzK0lxEVkP5c7yXDbVfpfeIVjnF610M/aF9F+2kAOQXVp2N5ZT5ll7
         3fm2XW31G3RXT40YjxyJ0bjACjzWK6Vn9FRACtTTw04MFupCTGFeWPz/IxO7ZQKJd4YE
         O/ThjfIz6JeaNg7+fHHHC8Z8/u1qDSXZJAiRTrtotb+GR7Y44CXv5O2usFlziZ6/s2zQ
         4+yT4GZROZ0mo+Bo/CtJCXj03X5paOrIF3A8NmnCVfK274DM9ZMfNikmBN8zQ3De+cL6
         eXlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=9r/yEVJ+mBLJ3aom8HmY8tt/YOCxiKBpVIFqRkW5Do0=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=eNQqNjLpDHEloIsJUoWTJjczAQ+y8JFgVp87+GHnTKqA9GFLkYO3uxp/xeqDsJREQF
         MlDSuiNRYaixfz5kQu6k+p1PjmASNcG7e8gia9B5cQYSz1KMgKqM+y72Qae5c9xuWJuc
         yxFEIv0IG33lWRhgCNlZer29Y69fgibIriRticZL0TK+2NJyx4qUN6CWfF538BhP6j/3
         fHJf1c3HFipziiCwHZiC1WHrz60t56xdcXQKiITdU/5ofuFTMS1cZlqpjr/vF3GNm4SB
         wvB7x+Fa3eRxNcTQiD4WkCv2asd2KxU6n0nzbIXVOElcTeJSwUPcPSIY40VBlX9yOzb9
         lUXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Bje95/4+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u2-20020a05622a010200b00423916f2a80si15662094qtw.706.2023.12.27.15.01.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 15:01:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Bje95/4+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rIcu5-0005xk-3C; Wed, 27 Dec 2023 18:01:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIcu4-0005x4-6S
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 18:01:32 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIcu2-0006ag-J1
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 18:01:31 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1d3f8af8297so21098985ad.2
 for <qemu-arm@nongnu.org>; Wed, 27 Dec 2023 15:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703718089; x=1704322889; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9r/yEVJ+mBLJ3aom8HmY8tt/YOCxiKBpVIFqRkW5Do0=;
 b=Bje95/4+p5I7gfVDpgN7MBXosRUZQ6ohlBSudjIv+Cq1wcNU9WKhcj8Jw/+Sw1WGiZ
 oz2CLVh9YGrT0pBxXM6no3lFCoxIiiBPNfcORbl5afLp3fCNT2QXtrdQU/mgEae5L9Ca
 4B6Zpxi+McEbC2cXZV+htl4tT9v88ba7U/DvR43h1tHuIVjtygJcSE62HCE6tQy1aCKK
 o9uyLaTJ7juUyI26bcq1o72EAFvX+LkvnUPkdGunuM9lKwolCVxJVtO/AeVg8XY9EDkH
 CA124zbXM7SPxB9N7pMrRxVyvyndDJKTEzm4slggtdzYQRxfk5v0Df7eUe424sDiS4hJ
 i8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703718089; x=1704322889;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9r/yEVJ+mBLJ3aom8HmY8tt/YOCxiKBpVIFqRkW5Do0=;
 b=nfFYCchTvYCzSR7AJgtrz0zH/lS1DfHDUXkGA4s1ZFN6pNGB0BokyIZSg6jRlZ8b8a
 /B5XZ3LjwO6qhRABytmr7Q8Mw2sZmMtz9HcyqOtre0CA1KUFN+LHrFmINb43Sg/X3vGh
 lW0bcDI1O92RwrZcIuTXDSEqqhrEq+lcfU0f7suxqWXuu5BBLYG86+LYRnJ415xKPTBF
 5+s8u3tFI7Y9EgPT34yJu/3O16BPUQuUpREcFpt22X0DzRmihNW8GWZw1Rrd4eEJW5cv
 f8pnmYWlP0oDDjQfEEgzBO4mVA7Mb7YrEh5trwNbQ+Rulp+SxfiZXPKXbPbttckMwcHw
 Am6A==
X-Gm-Message-State: AOJu0YzYXU+6bG3VdkD7Hvbc0g5zdmL7wKMRjfIfuWlg1C8arymOmqzj
 UEGL9yhiemdOd2d4OWLK9VRcXknZTWTqnw==
X-Received: by 2002:a17:903:32c5:b0:1d4:4ca8:eee3 with SMTP id
 i5-20020a17090332c500b001d44ca8eee3mr2620306plr.68.1703718089222; 
 Wed, 27 Dec 2023 15:01:29 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a170902ea1000b001d331bd4d4csm12493472plg.95.2023.12.27.15.01.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 15:01:28 -0800 (PST)
Message-ID: <9ae6d5d6-51c1-4c7e-ab21-4da2a3bbd681@linaro.org>
Date: Thu, 28 Dec 2023 10:01:23 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/35] target/arm: Implement VNCR_EL2 register
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-24-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-24-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 5boEnybup45X

On 12/18/23 22:32, Peter Maydell wrote:
> For FEAT_NV2, a new system register VNCR_EL2 holds the base
> address of the memory which nested-guest system register
> accesses are redirected to. Implement this register.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h    |  3 +++
>   target/arm/helper.c | 26 ++++++++++++++++++++++++++
>   2 files changed, 29 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

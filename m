Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1546021wrg;
        Sat, 8 Jun 2019 12:34:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxV+HJPrtbMQud/R1f4zAlnb04pi8+XaKUFeLEIW2jKf0HiHj5lKWCfXQUVjsA3/4hPGpl8
X-Received: by 2002:a0c:b627:: with SMTP id f39mr19014321qve.72.1560022445421;
        Sat, 08 Jun 2019 12:34:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560022445; cv=none;
        d=google.com; s=arc-20160816;
        b=bWtyrpAdX5uk0FwD4Mrpaoebr+xJWClD3s1j3OD5xEgrJYyaytqzImC1TtTUImZjTM
         0uj5rTMp2FRa/BNtxc63nmRbqrPBhaZctKb8Qk1VgxnktkMr555l0FfFGQTY5GWjHo3s
         1ekrhA0CJyRVI3SM+ioOwmDjin2wGBaMdn0vpWxEkTpx4sGlggb+9bRhNTnq5TxlbS8G
         Uv2+vs6HRxMp6OsZmGU6QhyebyhYU3XPmU2BOTM1hwKbCS+nGdj/q1P5mpakwkW+3Rj+
         rP2z1uw40y1rw+aynijeAoVSEVzvWJNKog4JyecjLqJY/wsDRl3BsgfvqnvhPc5VHZ5N
         FlyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=WgrX3J19wwKX0k2H9ea/RG3aK0Zw9Z2ydapxiKr+e74=;
        b=dnSgOjbRtWI8we6HwTlmW/xfB4WZeTqBTZI2JgQkJgPxdrQcN9r8yz+G4ZV36hm+ZN
         dXm9mtgpGXz82b3PBsH9W4D5KcDfgoBlMKBu1VTPIOHD3O5Rq7N+y+VZLkmg1+6Lf2QM
         skFJefv6qnQXNCeYr/U+xFXOXg3CHBhLm3TvsB9TzK8eJWyy3mn8tWOZ1X8tEvRQl/DS
         kNwSmmUv46GQKsbZHziYkIXFwPzwmKRbib2Rk6lGXgAqSSrH9VH0Fg5X40bqTY0c2mPS
         qEhExWSo2c5+x0AiG4oWjHbVVRXzprqFdvnt93loem3diRxJ7T6Bu5zcNgsQfSvZnRLD
         lJwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c+MuEHgB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9si3831415qvc.166.2019.06.08.12.34.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jun 2019 12:34:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c+MuEHgB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60074 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZh6K-0002eh-UU
	for alex.bennee@linaro.org; Sat, 08 Jun 2019 15:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37804)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh1n-0007Hy-Om
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:29:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh1l-0007US-Nj
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:29:23 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:45269)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZh1l-0007Ti-HX
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:29:21 -0400
Received: by mail-ot1-x343.google.com with SMTP id n2so4888223otl.12
 for <qemu-devel@nongnu.org>; Sat, 08 Jun 2019 12:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WgrX3J19wwKX0k2H9ea/RG3aK0Zw9Z2ydapxiKr+e74=;
 b=c+MuEHgBEG3NLt/mMaBs2leWy6zKawDN1K0v+0hBJxIQEQbHDaaFtrLwN9/aOJUC5L
 BCnG5eClQHTw7RwM5SjMHhrYk+oxxeenGMdXtXZU+6x6GDc1uYxAVPlyVzlrNO6X+BSx
 /5sOFg/Qz3D0FmLPUBmT4ruVf8CsZWfTCh/nFbPHHz9AgRpOpwREGisjkmYhAluhF6LD
 N7aJpNVZSuIkB66lM0x79cqEQL7lBybarHlAF4rKdzKhnV0dvFNVSWnOJwJs8JFh8AA0
 UBt2vzhjvzhooRjUIGOtfdiSPhwUIq0XR320QFqHwNlulBrAJfzBRjEoQRG9Tl2tACMh
 l2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WgrX3J19wwKX0k2H9ea/RG3aK0Zw9Z2ydapxiKr+e74=;
 b=e7w0Q0Y/MLMZ1+RWnvJDtv4cT+ZBn+P099en8nerA5B3sI+2To9ovW/8V2WWobkqxU
 5M3QhH2b7OUYCpRlZD+XgNYk/WKHqYwIXfiDo/0jyEHRcG2E49xqFYLmuAwOjxBV0s3T
 8BmIT9jV0i2xPEtkpt0KZmwUcBn4AWkSes9pKvgKV10xjjs5AWWX9BKDKUvG6mXXorQY
 e4eBcATgf78c2AubzTIMlS4Sj/QQTt4aFQz84dpMsjR6Vzpirrjyx2bzdUND/12FafMn
 jQNBZ6ym/oxrwoikmnuFgyZ5a8nzanXlx0vifWsFZMEi8KmZ6fz3aevs58cyB7FgJPEC
 iEyQ==
X-Gm-Message-State: APjAAAXDCAX9M6W5i8KEEYm97y9w36s+1TjZ5TpoWXsHg8d9/8H9cHuK
 8qXvzMyRyS9fcTLU0Vaasqhx14j9Rr3fTg==
X-Received: by 2002:a9d:764f:: with SMTP id o15mr6852319otl.102.1560022160484; 
 Sat, 08 Jun 2019 12:29:20 -0700 (PDT)
Received: from [10.219.49.199] ([187.217.230.84])
 by smtp.gmail.com with ESMTPSA id i13sm2067978otl.27.2019.06.08.12.29.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 12:29:19 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-31-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1e5fbc07-009a-d2da-04c4-bae77859f6c2@linaro.org>
Date: Sat, 8 Jun 2019 13:57:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-31-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH 30/42] target/arm: Convert VNEG to
 decodetree
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q3YEgXjCbzgw

On 6/6/19 12:45 PM, Peter Maydell wrote:
> Convert the VNEG instruction to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 10 ++++++++++
>  target/arm/translate.c         |  6 +-----
>  target/arm/vfp.decode          |  5 +++++
>  3 files changed, 16 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

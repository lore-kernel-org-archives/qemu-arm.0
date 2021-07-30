Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp548915lff;
        Fri, 30 Jul 2021 13:23:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdnBc8CJFAehhVNvLmOuQiScpeUnagH0CzJJOepqUTXE6LqUrv/nU0pwCgqgVxMbvRdQZF
X-Received: by 2002:a25:d495:: with SMTP id m143mr5318261ybf.269.1627676618217;
        Fri, 30 Jul 2021 13:23:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627676618; cv=none;
        d=google.com; s=arc-20160816;
        b=O6uVp4IJ8WnBComv+I/ezu7TWC30d39FncMRCXpokPcd1rduzxxovJEdann2XenJey
         vSbbS6rPW3CSfmm6eTsSJFJlOam4IZF6QuK+r6n7o7U7hvwa2m2bRFRLivG5caiy1kst
         0qiq47/eL/eoWd3xqhA9PX5kCGD08ITIO6V+7xaO0moZP4tYABovtxc73KlVCEAjGMPs
         w/+l7kzHyk5+/xwyzdrswqNIyLYMjX+I8X5VNSqryFfkhH6HJSJluaN5mppDrJtSX3gI
         1XVNd5a6EWKF+PxlRbm5ccRgmPJ2oKkgjuD0hGNc/HyzDQdMnlT6p8/p2iU6RCoFGvN9
         vedw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Et+DfHSBoGmzvGKxbwDrDqi/eKCCEycpeiPXIWsQsIs=;
        b=Pyn9rFaEOCPXS8K2gna1V0YwAcOc6NNChG54DgKdBAvN09POIzMztiLtqSk4uEtODU
         qiXPGzcP/4LFo5QcBXAyBDZBbnd1ymxrNgKfgzj9IgZLKYuDAKfaBJTz7qkyE9h9+gkO
         wSjU1BmnlUzo9mg7meHc+5nzs/EXc+c1jx2g3Vrn9FF8YY/NZXMiMKle8Qigfc8t/rAw
         rfHPIqDNAgMiItjqXNWqVkNzGmCrHjzQJYQhd0O0ZQkpr6nK8KMLX9xGF9h3WVkuzUB6
         z66h4EVasuKAWyS7B+8nJzPWQ3MuJkgbmuYb+3X6XV+O5BXx87aoHun/ydnvOf5KgXxu
         E63A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XEjEvYyD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g197si2643776ybf.255.2021.07.30.13.23.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Jul 2021 13:23:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XEjEvYyD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9Z2f-0006xy-Io
	for alex.bennee@linaro.org; Fri, 30 Jul 2021 16:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Z1o-00052L-Lg
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 16:22:44 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:36426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Z1m-0003L5-J3
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 16:22:44 -0400
Received: by mail-pl1-x62d.google.com with SMTP id i10so12452437pla.3
 for <qemu-arm@nongnu.org>; Fri, 30 Jul 2021 13:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Et+DfHSBoGmzvGKxbwDrDqi/eKCCEycpeiPXIWsQsIs=;
 b=XEjEvYyDg7jxKpzy+szJkZQTjVSEXdILd7zJG85miWSBn7OOD8wGmYwxxX1ZnZ0c2I
 bse0P03+Lpcuhnzxt08QOTsezPsnot1Xko2QcTABMJ6TFOBg5dqD7ZObPV3iBMPAwdgj
 Mj5mNacOikr+yL92B7p6Z7ElURbrBGJy6FIiwXiIA10wg5aum1jvSNQQxv7vByov01I9
 5rU55mjVQIQCkjwjwy5cgjr4vY0RUwQN6o/DXyWN+YONFutHCGSjRkAYgbc2lxI0goXR
 mSkD/5GnQlfVmtC+0kc7l8n8Nm++9RKxYhrqcgtxu5kp0YfGu8I5StXa9qtGoLH+HVWz
 mP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Et+DfHSBoGmzvGKxbwDrDqi/eKCCEycpeiPXIWsQsIs=;
 b=HSAJ9ps5t17wOpYhWW8JJcTo2MtqHYAxUbzzcBsMsbD35q8HTHb9IGaca3/M0e1LLI
 GO4xJNwipEOGx2IZIZ1QxQZvJLBu8P1d7kXMKbQVJ02l0TVrXa5C4j6qkRRNYbEGHtlX
 BFHuTXTkWd8GJYN4IhNnCr3OAPtJbiTZvsdxMjkJoGZpOpJwXIKfj1+2cz/fZFWAPYv1
 mxt1ypy4plDZ/MaDUxj09xx/4fU7HyIx2leg70gGQQcPmr86YmkadhanMNlvLWu0mFN/
 p6uOes5m25vh2YWI5OFeywX/GoASojj3PxO69IW9z4thD/4h/hPZyLt5th1WKDe7IRgD
 o1HA==
X-Gm-Message-State: AOAM533yXCd+ZRDmtBvVcpmCbP+ickJNhKQiqC4OGd0D5lhtsjcAcxcA
 YM9b531oG65gW6qaZPBqQGeGdA==
X-Received: by 2002:a65:450c:: with SMTP id n12mr3729647pgq.316.1627676561183; 
 Fri, 30 Jul 2021 13:22:41 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id 11sm3342962pgh.52.2021.07.30.13.22.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 13:22:40 -0700 (PDT)
Subject: Re: [PATCH for-6.2 47/53] target/arm: Implement MVE fp scalar
 comparisons
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-48-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1fd213ad-ddd5-1d9a-f14d-5f76848447f5@linaro.org>
Date: Fri, 30 Jul 2021 10:22:38 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-48-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: zvzKAhok9jQo

On 7/29/21 1:15 AM, Peter Maydell wrote:
> Implement the MVE fp scalar comparisons VCMP and VPT.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 18 +++++++++++
>   target/arm/mve.decode      | 61 +++++++++++++++++++++++++++++--------
>   target/arm/mve_helper.c    | 62 ++++++++++++++++++++++++++++++--------
>   target/arm/translate-mve.c | 14 +++++++++
>   4 files changed, 131 insertions(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

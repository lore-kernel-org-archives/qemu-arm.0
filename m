Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp349008wrg;
        Fri, 7 Jun 2019 08:56:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyZE3+MZCFCSnTcoq/h+tFMBEqIeQXG+a0LzPbwpph0JTQR4gOUEjS/FQEI+y5N+nhivo7E
X-Received: by 2002:a37:744:: with SMTP id 65mr30773012qkh.239.1559923015332;
        Fri, 07 Jun 2019 08:56:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559923015; cv=none;
        d=google.com; s=arc-20160816;
        b=dmLhzwUrHcTIjnJZhb3hzK1qsMTGtUI1Z2uw6VKvSjd/AE+aAx8D7zphHAUndRcXQL
         SdtoHIwYa0/7wJtXVvudRSpdfpuAihfQPiR/9LzXtnqZc/nRxBL/jiOd7/khtFkjz0uN
         Mi2z8O3ZQx1NM6gr0PC85RrrRybRgX3DV0N9nO+NHr+r0hngqMh1bEZ9d31fmIzvz/Mq
         QdwUzTTgrTji8sMMJcKx6dWfaCLijLGEagg2rye/irdk5zHjXzusOcWoYLRTfaOqMlso
         MIDmg+qr9SQ1Y/UfdSNk+ZSW0D7L0tXxkE2fmPaw9jzjmcb5lRVGXH+gnoG82diMmUku
         bsfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=G8Kp5dsS4Em5s2j1Fedn1hNl0iFVVRUOtdPjd5R86FQ=;
        b=olnAHrVwCFhASh3hVhQ8f7q6NaJS1SB2TTZcfB6vKmTH0yduX3z+AQDAiyQDREAP7n
         mpqHv1tejLkUL9I5TYdF+qSLeXmiZd6b+gpZM59zrWywNI8QmtbAYmCnwB056S4syFf+
         uKfDo7ynzgG4zwVlwOdTdlDwIshlLVEWG6eLjN/gvY9adVFV5wtl/+ngTTWuk+WVHO4t
         FV8FzSPr3p1Zko01omIMsAK7bV9ZtfK/eVGdbEPD7J7v89ipSle2KazJP2UKBPrZdUQ3
         crgIEOYoZCgF8aTnCw3g//gtau0RY/G8z6kgQ/ELn5lbTOIkKSp+3ySQgj07TDlA7pDd
         CVPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="y/eNvOmu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y68si1426039qke.154.2019.06.07.08.56.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2019 08:56:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="y/eNvOmu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49076 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZHEc-0006Vz-ST
	for alex.bennee@linaro.org; Fri, 07 Jun 2019 11:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41614)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZGIv-0007yb-Rb
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 10:57:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZGIt-0001eQ-Rs
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 10:57:17 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:36475)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZGIt-0001cj-KQ
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 10:57:15 -0400
Received: by mail-ot1-x342.google.com with SMTP id c3so2119161otr.3
 for <qemu-arm@nongnu.org>; Fri, 07 Jun 2019 07:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G8Kp5dsS4Em5s2j1Fedn1hNl0iFVVRUOtdPjd5R86FQ=;
 b=y/eNvOmuaAO8ewLpsuZzQfft/m+bRT362GpTFUO/GdbOa/MidBboSgwXFiBrc6BQGB
 vefG9hcQlS6jeJBCPwsbaF1mWVu5m+JSSC5xLbuWP9L9MbW1KiClT/zry6T1TcjwMrRw
 z0nwZ0n+wIJfRkQUEwARpEYlYSq1toIeeac7f2MuFhAyD3O8CO8hIG3irpINR1W6TOoi
 NOg40KZ9H7jInJtzpirY/0fslig7U0+qYKm37b37Qz1TB6gwaSUNWItheJ2uWqbbXQc+
 S+/0Ycv3kQytNk4zVpw4ID2rKh8gcUFRiP7jsMq0s+k9BfklDzo3nEJdgpdwbpLvCVSe
 FZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G8Kp5dsS4Em5s2j1Fedn1hNl0iFVVRUOtdPjd5R86FQ=;
 b=q787Pyb3LpjuNMt1JVOk8BXehPo6Pevhv/m63a6rgIQzrUhb3FF4XG9sP10Z3zi2DG
 MMkH3tR9vW6XSqvgGIjaDZPrrIHXmTkaBEK3YakhW9QTqr04qOQzHDq68iuU9cjJhSYs
 gWE3ivklCWGK3he2/BusXXzZ6/A16us5zZvryzrKAOfsb7JEcKRnMOcmknW+wAKLpoFh
 3PtZCENV0dihvvuqOnVQGXxAo3LyKWlNhmR6AigGVLKWOfKCOG3X5ZNktzAhURj+m1gU
 eYQJ+3Oes8XbRdm2n5io+0oynR1dBxrWU49RIvihJZKBBtXzrkFjrXLz/xd8XR69akFC
 4t3w==
X-Gm-Message-State: APjAAAXm6O7dlWBy4Pzy5XFiEHcKvZ4DHp9432g30/qTGpqCJ+TZ6n9i
 NMHgLKXMuu2ZTxo9uYSLGmuVjg==
X-Received: by 2002:a9d:5d10:: with SMTP id b16mr20430391oti.35.1559919433151; 
 Fri, 07 Jun 2019 07:57:13 -0700 (PDT)
Received: from [192.168.3.43] (200-56-192-86-cable.cybercable.net.mx.
 [200.56.192.86])
 by smtp.gmail.com with ESMTPSA id i5sm832559otf.26.2019.06.07.07.57.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 07:57:12 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <949c7dc4-62e2-c3c9-bd5a-227b318d9e64@linaro.org>
Date: Fri, 7 Jun 2019 09:57:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH 08/42] target/arm: Convert
 VRINTA/VRINTN/VRINTP/VRINTM to decodetree
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
X-TUID: yK+UdsTqjiHI

On 6/6/19 12:45 PM, Peter Maydell wrote:
> Convert the VRINTA/VRINTN/VRINTP/VRINTM instructions to decodetree.
> Again, trans_VRINT() is temporarily left in translate.c.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c       | 60 +++++++++++++++++++++++-------------
>  target/arm/vfp-uncond.decode |  5 +++
>  2 files changed, 43 insertions(+), 22 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


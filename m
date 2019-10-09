Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp332559wrm;
        Tue, 8 Oct 2019 18:50:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyDwlEZp7xuGH7fCC+qh5kouvhAdOWDWzvr+4ZEBwmcBn8WDH6RGK9YVNefAQM4MRBpeD8R
X-Received: by 2002:ac8:5496:: with SMTP id h22mr1118751qtq.227.1570585846625;
        Tue, 08 Oct 2019 18:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570585846; cv=none;
        d=google.com; s=arc-20160816;
        b=C5rdbKedZQ7UoMiiOGov8Uw9u3XAC56JVrLB+DQw77EOCpknF7rLZ22tABJx+wjKI6
         AddxdQeXcx7r3G64IrnuwSiz0axSyQuYuQzn+jSVAuJhagy5CiQYE4afXwC3tBWSqm8l
         MECWT5b98vw9wqbT9duxZulAxKwODuvzP2lwdHCEI8SUoI8PYbTsaDbbYex/DcxcCf6a
         OeYejz9M+sld4XA+KgGk3fUSMpOX3klpbRtrMV1XiP6/6abedVdyusxaP7k0mrVdOEnC
         8VuOsOH31xDkQhiFr8USa8MugTz0ovHU48CBQ5ib5K601b+PXFWCFyw136PNbsd6OmBD
         ayVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=pRRGey9Kw0lIsuaYgixcsQ5RUwHu18e511yZ1VzoGaw=;
        b=UAIQMevnY3VckOCrFM8kv7l55a1OTM1wVIMuHYR9iwNuuBZT2uGfPmzfAzyaMlybWS
         eIlLOf2vguJGQfXcY2d5/wJGlRCJZraXeXNuhztJfuRJk2e4H1B7HQt5ZDQ0ZajhB4KX
         Ff7ijZX4UkYVoSedPmd9G6cj1Md8/oYAh7iI/KXDTdDBV13aK5xUd/udNdzezpP/VXI2
         3hQ7l9Tn4qx2EXj5W9YPb2HDYvWTDoDlS3END6QVfuW7BPLTiE7cf6fjo8eJtkaj+/Mi
         0yEpv7pHcb+5PMBqpYn2/52Mp78g2FHZCzqdAq0TIWSM49mN8Swdg+luI6275mzZ33v5
         +fag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nsJ5KdbN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 35si620100qvy.170.2019.10.08.18.50.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 18:50:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nsJ5KdbN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iI17l-0001gP-Cp
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 21:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42498)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iI17S-0001cQ-BU
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 21:50:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iI17Q-000842-Ub
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 21:50:26 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:45289)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iI17Q-00083o-LS
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 21:50:24 -0400
Received: by mail-yb1-xb41.google.com with SMTP id q143so194418ybg.12
 for <qemu-arm@nongnu.org>; Tue, 08 Oct 2019 18:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pRRGey9Kw0lIsuaYgixcsQ5RUwHu18e511yZ1VzoGaw=;
 b=nsJ5KdbNIcVTWQaU2tkP6YvmGjvcPYk83PN/BgJ59Esc9XlDWXPuQV03UngQUGUJSk
 Tew/2feqXzbb0XInqmCpK1iLfewqA25ui1H2Zexg6ew13yUjViG4OP/zGy9W3NbhkZw7
 gfXnd9cEkdsxAhrHJm80/m0DvyguPmvoXxzkNk3WJqcPY38RM7g8JaON1ycBO2v6DNYX
 GG7sA0blF8C2acwtAgZL01qg79NsxSnS9UrTF2w4J6A0ZXaW8vpFiBc6T7MhMzLOEhCQ
 ScjRLJ2kwAewY09YqyNIRBYChl+jrga3t2pQM22+erQx9qTbsPEN6STmmLgvBEaSttXt
 dGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pRRGey9Kw0lIsuaYgixcsQ5RUwHu18e511yZ1VzoGaw=;
 b=jIV+nP/qPHrNIcCcYIF9I4B0sHRdOs0sLODU29jA5skX/YSwRTI40xMkv/NyFeQ6/j
 G0IV/aHaxhUyUE8ofxRDCu7MiV/JNzduCEBNnmhIJ7D2Dx/CJEly76ErsSKHQEkF0fOW
 JZOB0YI8o/1Im7lTlLBJLMglnrIdbXpRAcY7BgKzrH84qpOwMjUFWOhmhVPSG1Y13wFI
 BADL5uKCzMTeWucpXGMxwRsN46oowzhAO8Cg0JmNEoP+d6HiQP9sJsokFLrgNSlU88r7
 Oq9ISESGxVHmraCFklFui2Lu9Xt9XtmiXFqYQzFwhHXRVSIR2KUKBN+1K9LafpAyVT4t
 KNgw==
X-Gm-Message-State: APjAAAVSFK2DuPZQMkICw+K/Li4c+LOrbVueX80aWpfg5HPgRrd86DIC
 M+/fofDoWbF0q1+ayf0/6Rx49g==
X-Received: by 2002:a25:790a:: with SMTP id u10mr487573ybc.273.1570585823438; 
 Tue, 08 Oct 2019 18:50:23 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id g81sm199521ywa.46.2019.10.08.18.50.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 18:50:22 -0700 (PDT)
Subject: Re: [PATCH v2 07/21] hw/timer/arm_mptimer.c: Switch to
 transaction-based ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191008171740.9679-1-peter.maydell@linaro.org>
 <20191008171740.9679-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <dac4fae6-0cac-2f1c-43ab-fe011cb357e8@linaro.org>
Date: Tue, 8 Oct 2019 21:50:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008171740.9679-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b41
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2jAGEx0YJR+b

On 10/8/19 1:17 PM, Peter Maydell wrote:
> Switch the arm_mptimer.c code away from bottom-half based ptimers to
> the new transaction-based ptimer API.  This just requires adding
> begin/commit calls around the various places that modify the ptimer
> state, and using the new ptimer_init() function to create the timer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/arm_mptimer.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

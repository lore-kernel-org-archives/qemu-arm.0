Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp211389lfm;
        Thu, 30 Apr 2020 21:09:18 -0700 (PDT)
X-Google-Smtp-Source: APiQypKl83kCDmINpF28j8Cyp2z4sPaePjtcwN+AD9eCnl0Lp0QqyqmEjs2ucY8yaYri6oGy/RDJ
X-Received: by 2002:ac8:17c9:: with SMTP id r9mr1953902qtk.392.1588306158510;
        Thu, 30 Apr 2020 21:09:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588306158; cv=none;
        d=google.com; s=arc-20160816;
        b=EyMomlIU8eKw3UAN8Xa8s1Br+p9VY7jL92CX/ZXGy2WXoN9X6FobTYbYvC0z+O6MQx
         jBoXJ00sptMg4XHE5yqGaRy9PA48FMLQMmHiGVdfwqsB0vnzv8bihxNEgOMmxOULsGvD
         iHDEEWlDUTgVVMOX1s6JfC07D80LWuQyKaVrYkBwARS3dHQB8kBF4vtVdJobzxjpHj29
         aPHibUbklgIK+OPZgse0kXN0KkIyKUtGL8WjtRMcHkzdiVdkqDgfgpPPAfPTRlUw92ze
         6tZHvPq5ptauAU2s1h5P1x9cJAhRxNo4K8UjvZaSBK/sbT+DFaXeVYSoSd4AN7dnKTwR
         cTWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Hh8nHTJ6UzCPx2NiIk0I2VjvMuRz5RX364GJS4ow66s=;
        b=wo/KySkJdInMp2YMhBpt+ybISkmnZjQR9tNqXGeCOyQS3dQoy/nOnnwu5cKdyO+V+I
         xbn8UWIWVUExQdrppMtsQXE8UlGfAQjlh7csCnjuCHH3djlCxVEAfZwv/+W7CjlbR13F
         iJVVOWv8rJT1sJtKSNAi8SpllEguITtdOpCuTDfdAW/7tjZWTZQbq4nZD6TYdtN9YcgX
         MXOQu/xKZjln0adctyqi0bKUdVzhB3RQESLA6eI1ge1f4nGedBDuKC4OLNXfEwqYABy/
         RoMv72/nbQmTArK/AVOyNUq1yc82hSGuhk60HCQKfBmmRsu0qE7yKAC/AzR9FaF8C0BO
         tYsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kKZidy7p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id i36si1005404qtb.96.2020.04.30.21.09.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 21:09:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kKZidy7p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUMzF-0006i4-U9
	for alex.bennee@linaro.org; Fri, 01 May 2020 00:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35866)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUMz7-0006hj-Vi
 for qemu-arm@nongnu.org; Fri, 01 May 2020 00:09:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUMz6-0005CU-PJ
 for qemu-arm@nongnu.org; Fri, 01 May 2020 00:09:09 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:39535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUMz6-00059Z-BF
 for qemu-arm@nongnu.org; Fri, 01 May 2020 00:09:08 -0400
Received: by mail-pg1-x542.google.com with SMTP id d3so4058416pgj.6
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 21:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Hh8nHTJ6UzCPx2NiIk0I2VjvMuRz5RX364GJS4ow66s=;
 b=kKZidy7p8Q7REp2L9SF8KK9nEgscOjt7PlMmNmXky6pewdduSSnhVQ6YnXvyYQmG4Z
 +iQtLXzHsbRd7pyDq9JcDJxFtNePym0rPyONfdW7UI4yZpI6wR8WPl8/fXFojcBicgt/
 84ZBOK1cToTez2OXnQOB/7YIGbwySbr2V7H5wXhu/LoWXRDCqWoHAzgvCcglZzcldF7L
 JMlPuACy7eoq+QzrlUL3KNU6wJCcb/uHtcSnLpYernJWrF67A5C6Yf1N2ebv+8ByBJu0
 JKclPA/1aU0aCuld3VEKqzp/Xx/MKkTP4mUpey00X1X1yK0Ewl0kIOeTmXPx8OhYD6c3
 2OJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hh8nHTJ6UzCPx2NiIk0I2VjvMuRz5RX364GJS4ow66s=;
 b=VOo9AujfDnvCeZRAtib/9AOL9wu9ei8K5Tg/01Hk8cp4+QrcSbZfFjM8u/AwH18Dry
 kEI8jhy3GJnXDn5HxGTwB6d+CfqdnEC/liiKkRfNDBlKMWxRj/vFIWxFjjLG3i0V1bZF
 VvZfntSsevJMc57C5m5uMK+22JucpSRoaGxGWezdaeoaOgoONrNcC1WeeA6ggEzDvYvA
 2sx30i9r1mWmLI4ZVxaVsNgB/FopNbir9NfvgrOM+bGgEAUpTJXXyTQB9l9dzcEEnOOt
 3fw+9wPhdDZX7UD4AgLcKpfBdD+ezb39Z5bRgFno+msgjE3cBdHsJu8+vHwR109EQiVb
 lF6Q==
X-Gm-Message-State: AGi0PuZEQsjqAmQ+wCV56yjmYDMmIaHQIgbl/KxypOQZT0te2WdLLXYm
 E2woc5mz3YZXcVig0gfimI67dw==
X-Received: by 2002:a63:1361:: with SMTP id 33mr2224598pgt.265.1588306147006; 
 Thu, 30 Apr 2020 21:09:07 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id c4sm161776pga.73.2020.04.30.21.09.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 21:09:06 -0700 (PDT)
Subject: Re: [PATCH 34/36] target/arm: Convert Neon 3-reg-same compare insns
 to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-35-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <318ea83f-1d2b-e79a-d8e4-385f0ce8084b@linaro.org>
Date: Thu, 30 Apr 2020 21:09:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-35-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::542
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
X-TUID: fnylLpAoJRYl

On 4/30/20 11:10 AM, Peter Maydell wrote:
> Convert the Neon integer 3-reg-same compare insns VCGE, VCGT,
> VCEQ, VACGE and VACGT to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c |  5 +++++
>  target/arm/translate.c          | 39 ++-------------------------------
>  target/arm/neon-dp.decode       |  5 +++++
>  3 files changed, 12 insertions(+), 37 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

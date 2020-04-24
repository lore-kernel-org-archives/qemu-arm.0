Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1081595lfm;
        Fri, 24 Apr 2020 13:38:35 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ2Ns7Yw2/Zk3bOYZAn/buNeqoL0Uu4PVWdVxFLCxkzFyg5MEgP0ICIuLDgFqvy1pMhio19
X-Received: by 2002:ac8:3102:: with SMTP id g2mr11492786qtb.349.1587760714684;
        Fri, 24 Apr 2020 13:38:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587760714; cv=none;
        d=google.com; s=arc-20160816;
        b=TnRGqpKDBJHLwg0OLh57jvwSm4p06o0IowHqDGhsvUHtVF7500FMSy5TR4R4umWagY
         0WpJyZONYpzHJ0WDVMaJZklIo0CAvrohS+ZC43QobeY5/JGqPN8HXmpIHmmzUlXcruTR
         VmowO+f7jmokRCMIdd8N6K3I6X1FQ2b37n3PdH/KZHLdobk6rsnyTPfJ5jQGJLZNh9ht
         5HcDdgDkqbBsousM6c5FZMlI0WZ9tVn22HdcCCDKrEqlKsR94lgQslGpszBDSvfFKLnJ
         LSRpq+YtcdDBCMmLTH6/e3nuwTVMYCW6x9ensl9Bltv8PS3roYk58foo3xDTh5hepJdC
         uK7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ctTuxbQQm+/XRBg9BCNL+uchEbto7jd0sQyXDe89vGA=;
        b=zsSRYlGtE2l7YdmfFoF9WrV91EXLo6R6BpAH5B3s6mrhbuZ644EBPOPkSHQuYfkwLU
         9h09tQTnxtgdt4b0QiHha9IxbjPSMvZf0+T87zn2Hx3xn1xe+tPGJYqk/gWEkpcvXid2
         Jsia5UTor0eWNT8ejGeh3fGVTaYcdA8I82QicrU/ldxs/8xH8uT7HtbXfKQHG/YYWMoC
         jcPRT0CdQqsPv5Li/efN3PJ4siuLpX3XE/iJiNPPeWDn+r6JBF4oV1drjW/otjFkOzNF
         kFN4c13IjMXUdzSU5Ef4x0bHc055sU2MFyP7PPzjmbvktPWkYfJLi81/pKnDzW8eo+Yj
         tUQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aeVxOSE2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d16si3693261qka.337.2020.04.24.13.38.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Apr 2020 13:38:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aeVxOSE2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jS55m-0006Nh-4R
	for alex.bennee@linaro.org; Fri, 24 Apr 2020 16:38:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39042)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jS55e-0006NR-HV
 for qemu-arm@nongnu.org; Fri, 24 Apr 2020 16:38:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jS55a-00063k-7H
 for qemu-arm@nongnu.org; Fri, 24 Apr 2020 16:38:26 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:36585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jS55Z-0005yU-PB
 for qemu-arm@nongnu.org; Fri, 24 Apr 2020 16:38:21 -0400
Received: by mail-pf1-x442.google.com with SMTP id z1so3676751pfn.3
 for <qemu-arm@nongnu.org>; Fri, 24 Apr 2020 13:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ctTuxbQQm+/XRBg9BCNL+uchEbto7jd0sQyXDe89vGA=;
 b=aeVxOSE2H33L/VvEDD0YPHLvpL3O1EDTmqYdORpWEZfHJDo4Jc/1dLfS2LPEij172A
 o4DHqoiGlPY00TcABHLDuJIyA0qNjndYPE/GPoasotTXKxLY3MPtK5RwOIZPwKAnoaaZ
 uEn7J6JrdfQfLgX/hltsz99JzLt34JodDKzvnN+U+FDVYthVvbQTiPoYlzzNkgvV18KH
 1mY+uGEabnIsErT/93K2maxtgtokALNbout146eXHeZs4E7qxvTceqkivftSKlUKCl4+
 XCBtS3r6ZjsP/HixvcJUbIptuWSTAe7Ur9AXae3cTFrPi+wNC7xEzCSTFodkl8huhwrM
 nnzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ctTuxbQQm+/XRBg9BCNL+uchEbto7jd0sQyXDe89vGA=;
 b=G+FvtsGB2IgEgoGrGUX9zdn0aN7uen9YkrLghI4Q1+zidBEQ2/bgpIbGOSCKFJEqzp
 XB68qqhzjPs1Sbsf+WmIcaPn2ZQquIvsHYmlUYFH/p9MKezHKFK6Tr2I9Y8rKQ/FFwqZ
 X7l75Pqgd/Zs8aZsexeMakHqdbWY2BBGZM3x658wtH3/n03w7ux9c6MPqyBnyI8A+U34
 f6u5knI6FcmbTHz6halj3P3Lc4TBffw0wp4bYfPAL1c3Xk/ymiJ2oT/UNE9XofxlKONW
 66cM+h+VJn5S8l+5Wp6Htcw5yoyFDNlM2s70Hjq9SsUfBJ6SDh9ivsQiFfPZgjfaeGfj
 2gBw==
X-Gm-Message-State: AGi0PuaWxv4BV6d43DB6JcVvw7TwEVi6a0MAQWgHl8OnekYAW9M7o6kC
 3Tymck2QYoZ/Oi3XjNYBmwb4Aw==
X-Received: by 2002:a63:cf0f:: with SMTP id j15mr11166072pgg.225.1587760700028; 
 Fri, 24 Apr 2020 13:38:20 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id b24sm6543424pfd.175.2020.04.24.13.38.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Apr 2020 13:38:19 -0700 (PDT)
Subject: Re: [PATCH v3] target/arm: Implement SVE2 FMMLA
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200422165503.13511-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <caeb437f-f21d-652a-3721-44a9265785cf@linaro.org>
Date: Fri, 24 Apr 2020 13:38:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422165503.13511-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::442
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
Cc: qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3DdUZD/PYzj+

On 4/22/20 9:55 AM, Stephen Long wrote:
> +    intptr_t opr_sz = simd_oprsz(desc) / (sizeof(TYPE) >> 2);               \
> +                                                                            \
> +    for (s = 0; s < opr_sz; ++s) {                                          \
> +        TYPE *n = vn + s * (sizeof(TYPE) >> 2);                             \
> +        TYPE *m = vm + s * (sizeof(TYPE) >> 2);                             \
> +        TYPE *a = va + s * (sizeof(TYPE) >> 2);                             \
> +        TYPE *d = vd + s * (sizeof(TYPE) >> 2);                             \

Shifting the wrong way.  Need to multiply by 4 not divide.

I've fixed this up, and also expanded the macro to two functions; I think it's
clearer that way in this case.

Applied to my SVE2 branch.  Thanks,


r~

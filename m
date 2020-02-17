Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5499564lfp;
        Mon, 17 Feb 2020 14:56:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqw8hnlApDNaAJDUSDTjasKPJL7CUC0+5c+2DfdYsP0LyS8Y+8NyvfYMOiUhVuqricbCxrsJ
X-Received: by 2002:a37:47c4:: with SMTP id u187mr16706365qka.165.1581980197843;
        Mon, 17 Feb 2020 14:56:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581980197; cv=none;
        d=google.com; s=arc-20160816;
        b=TdGmUZURTZKB/dld8AjMsKWdJhNScUKkMbGll++imo29dwvDywYdLbSZeSa9Qb7N4S
         6ZSC+4NqbjkEOv8LcB6legF/dWunO3U2BsbpuQV9zVKGU95DPPm7LtSH9f1zeNlx52ec
         ai0gihTbBWNrsYjR259nR41zX0jyr37n5LM5HgrLEb0Wsyw2x1sPEOnsqp1mVSfrK2ee
         tMzMLIp55ry/RqamjNmnB4nZC61wpwHrKKvOD8WP5gJaIhXeWYl+Lm0ovWX2u2CFfzUs
         9Atz1W/aAZMeDh9pEEkv6bhWfXYkj7fJGIi39rREDfkRGcX36QN/d1zj1gOCWE9zjnej
         4IBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=B/yZw8BsUCzvzPWgM/M/oVrIGRQRILRpW+5b60Kx/8o=;
        b=RcQEb8s8zBgOfdwXxXlP2PCRzhMPxJPAR1nBFG8JQRuk963nYVKGjUR8pog74FjHtu
         eFkU/SpYyZyYt3PUpy4ffNJBwQfo5Ad/SMJ7ElLUHEwjZfCie7hXLAVUw6derRlTXKL4
         0tgpmscGNnRAZ4zHubT6TJZKHQZDAJoqoek/7D92h+yt1i19qZ9sc36EdW/auYmz8GkE
         aWCL4SJQR5hBrhbEWRgkvSgRqOpVegAeFvUegYTwnfVRkAp+YLF60oa8NGblFgZJ+qGx
         w2HG3DHZDzvpHjrRxAlzkN35C2XjeEuj6eZQLwvqw71hgUp86qE2jD8BzDf07i4B/Ch7
         W9Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Ca/oPVr9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6si942227qtr.366.2020.02.17.14.56.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 14:56:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Ca/oPVr9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3pJd-00016A-Aa
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 17:56:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56084)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3pJU-00014r-4x
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 17:56:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3pJR-0001Ji-KI
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 17:56:27 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:38403)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3pJQ-0001Ik-Ka
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 17:56:24 -0500
Received: by mail-pl1-x642.google.com with SMTP id t6so7273813plj.5
 for <qemu-arm@nongnu.org>; Mon, 17 Feb 2020 14:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B/yZw8BsUCzvzPWgM/M/oVrIGRQRILRpW+5b60Kx/8o=;
 b=Ca/oPVr973xjWW17Ed8M5C+tKVyWAMmmHGiwHbTfWHPujkA/MtwCWE9kmeLtEY6WzO
 7bWDCU2JApbedXk29hUYSiXkqfSTdedhvNt2gwLsI1oadkEFQf6a7pfMtTJf14i5zI4j
 l3lbtWjOW+mOuKGC1NSGzPs0bZjGl6Ur9cT7SEEyC3B97TiRc36evF/dZCTQ1m/+uyhe
 3X3LGahihviDacgcFpYaoDtpFCNidwNdsHPAXk4SSg+gS9+OUSnO6bgfz0/4pwTn+qQb
 35/v/Bbb2pNJS653RcMGMD30wzZK9GD+F2mXdeB4keN6ykEHNJtqNXQFJvNUzSj+RmxJ
 MV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B/yZw8BsUCzvzPWgM/M/oVrIGRQRILRpW+5b60Kx/8o=;
 b=gDagB5ezUoD6qQ74BxMpPirGp4qrV+K+OmlTpJI6djf4AQvlsHuQ94DkL9ZEO0Wwo/
 /Ltt2OFR4Dnw4VRrD2VeQRY+evfGn46iRkAk2/QxuJUPngv1GY9rBeigACndMnYlkwe/
 UbfWwJynbb+hRFkfDP9Cso0GYybLeeualG+cKwPQ3fQ0dZVsMG9ef54UWK5bt40aJg14
 3+AsaacFBkdcR3PzFPFtuc7HXTLW9hKVaGloO3PXvumGy2Rd/FPCtnVSAfWkOTgV6f/h
 To32irj1G1uNAPIwMnVSpnm9us3gy620sm7rajG1K8sckwIuTBhI1sf1ZS51yTMHSsRD
 SIAg==
X-Gm-Message-State: APjAAAWQ/LxEhOzR9cg2ZWGN2wchYbR/ifY0Mtd5lc26A1HS8JIuWmY/
 z+p/rRiKy9eiJ/VxfpB7qdH8PKrPlGs=
X-Received: by 2002:a17:902:124:: with SMTP id
 33mr18460218plb.128.1581980182915; 
 Mon, 17 Feb 2020 14:56:22 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 u1sm1348362pfn.133.2020.02.17.14.56.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 14:56:22 -0800 (PST)
Subject: Re: [PATCH v5 10/22] target/arm: Define arm_cpu_do_unaligned_access
 for CONFIG_USER_ONLY
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191011134744.2477-1-richard.henderson@linaro.org>
 <20191011134744.2477-11-richard.henderson@linaro.org>
 <CAFEAcA-MKN5vJYTwF5fbQVvgC_QpfezG_S4Z1gF1Qxtc5NSNoA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0ecaf16f-d5cc-9448-0953-64f71af4aa26@linaro.org>
Date: Mon, 17 Feb 2020 14:56:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-MKN5vJYTwF5fbQVvgC_QpfezG_S4Z1gF1Qxtc5NSNoA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2Q5VA/xsDfoG

On 12/5/19 8:12 AM, Peter Maydell wrote:
> For arm_cpu_tlb_fill() which handles prefetch/data aborts
> we just have a separate much simpler codepath for
> CONFIG_USER_ONLY which doesn't call arm_deliver_fault().
> I think being consistent here about how we handle the
> CONFIG_USER_ONLY case would help avoid having a codepath
> that isn't very well tested because it's only used in
> the odd special case of unaligned-address exceptions.

Fair enough.

It also reminds me that I had failed to add the linux-user changes to go along
with this to raise SIGBUS instead of SIGSEGV.


r~

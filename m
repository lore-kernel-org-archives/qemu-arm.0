Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp624131lfy;
        Fri, 14 Aug 2020 10:14:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6ItHfc83CUPw8LaXn1YSR6j1SCvzAPMUSqRmWWN8VXT0BQhi0NpCjTxJzL7GAM3Lv35YW
X-Received: by 2002:a25:6cd6:: with SMTP id h205mr4891739ybc.250.1597425267852;
        Fri, 14 Aug 2020 10:14:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597425267; cv=none;
        d=google.com; s=arc-20160816;
        b=jLczaICVFj5KDRocPTQ4RAQdeqvA1jtXTs3x+xZ+G2h75ZW8zgUKSiCc1WUN9rUIes
         UdMPGogPIB89dt1gWAJGRHstBESaq085tbUFkFqH3fxeuYXAQ5JWvb+9cablbhhjMZaZ
         U5m9bnRQai5GqLI0poJe/upv8c3wrWOozVZ603YTHPQxDA4d44GXCxqqb/h3uKwkDltH
         0ko2BW4Pi60EdAAOki+eVlxvqv+xlUlCfELPB43i9ZajjcCup9LHX53ucUtKvn5qpJpu
         qMFG1QvZ9yyAfT5OhqS1+yRA4RwJIDd6tLr+ztY8TlxryLxInLxAjhWLn9MIJU6dKQyN
         Lvag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=W/wUZOH5ocCYaxtdFeNeV+AHNSModoUQ1LO31NfMKFA=;
        b=OoKlvK7cfnpfzl30PtPM1oHRJAIKhanmqzyNISbTl6nxwTK0zUTwjq72hsfEtJ6BUZ
         a9tv7fI1LVPVOyyxnJb8WeCGZt/XTBO4ovmcDGj50lvsOhRpOCJMv8adXRvDbpYB1Ys3
         umIpIUhzisSEIs58tHLHa8zkouh8OJn/9Fx5/oXzY6L9Sslp6vU8gZL4XatJ6Qt2XcgB
         JA3a/wB+ArCePScj1qlzXx18UmC2jErHJgx8BNujoYO8bWBxrjqZIOKKMu9gmw5U9SBu
         w/ubMBkUhb8bOiiXJOouRgSRGxBuPL77jmmJz1mz9BayS5Onpo3JmzxWA07R0chONDTs
         xp7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cYwBfwhe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 62si8937439ybe.220.2020.08.14.10.14.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Aug 2020 10:14:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cYwBfwhe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6dHe-0003B4-PL
	for alex.bennee@linaro.org; Fri, 14 Aug 2020 13:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6dHX-0003As-Gf
 for qemu-arm@nongnu.org; Fri, 14 Aug 2020 13:14:19 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:38491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6dHW-0006T7-29
 for qemu-arm@nongnu.org; Fri, 14 Aug 2020 13:14:19 -0400
Received: by mail-pg1-x543.google.com with SMTP id 128so4833979pgd.5
 for <qemu-arm@nongnu.org>; Fri, 14 Aug 2020 10:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W/wUZOH5ocCYaxtdFeNeV+AHNSModoUQ1LO31NfMKFA=;
 b=cYwBfwhesFb/1funJnrCKQpm2JzwMCpjBJutJMgWpppjzezWedLfIZhK4bC9YrWvia
 4NScMwAoJSgFLrx77fQKND69g75BXoAXffyqpPAbUYpm5+Zg2xej8uqrF62ksyhT0g47
 dPvJ3dwcJj/UaD6SBISj/c89JSNqO9iwhSDDb5JJ8DLq01l2+JAc/PKh0gPI5LR9dYxj
 zHY6HZhqzV04JrJ4VAoArgS/6wyMWWGjonLqAr/B1ladfuH8Tyr2cEzlWnujfXrCLt43
 CVAjtC2gpmZUriUE+mrgTOfpSVS9SIx3xqiSDqFNDJXX0pshvdt1gEPQhyFfkNwOauee
 hiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W/wUZOH5ocCYaxtdFeNeV+AHNSModoUQ1LO31NfMKFA=;
 b=FQ1Og2/n3m4nvm2i3nDUgjy2+rt7CcI+7BK/lJTW0U8fJR3jWFopJUqg/AHG+B8Pra
 E4qgnrbmu3KlyYMqTWo+DqEs1oADGS9GMG94tEqbjy+ldavVeIr3FLkzwLB97zVBgrHW
 pp4pMuqqfCGTjAPpwzGdpJBPrWKkFwNKC2P/4O5m8hO1eIBzD3LLQP9YoyVUKHdGPk8v
 OX21V35SAz0MdXepBHOG6OL/cvWwrcZPhfoWj7txZCMv+6cwip2tgxJp5M7nZCnzH87Z
 AR7llZi2L0kC587EHLsBvdyI+eVbcYH2K/SSNbkspvIY1nzuBein7OooQ5x5/xUssyIj
 YUIw==
X-Gm-Message-State: AOAM531jI/mcHeii26iXHLZLGJamJlSRS9nzK2qNPh0GNB6OoBozdZ8n
 bpVDnSM1t5UJh8cBVb8xlzAL6A==
X-Received: by 2002:a63:7e52:: with SMTP id o18mr2300825pgn.273.1597425256591; 
 Fri, 14 Aug 2020 10:14:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id t69sm8901617pgd.66.2020.08.14.10.14.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 10:14:15 -0700 (PDT)
Subject: Re: [PATCH] hw/arm/musicpal: Use AddressSpace for DMA transfers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200814125533.4047-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b20c1d3c-8ddd-4e77-9fb1-8e52badad5b2@linaro.org>
Date: Fri, 14 Aug 2020 10:14:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200814125533.4047-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bIXu3tHCRoEP

On 8/14/20 5:55 AM, Philippe Mathieu-Daudé wrote:
> Allow the device to execute the DMA transfers in a different
> AddressSpace.
> 
> We keep using the system_memory address space, but via the
> proper dma_memory_access() API.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/musicpal.c | 45 +++++++++++++++++++++++++++++++--------------
>  1 file changed, 31 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


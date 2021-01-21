Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp210956lfb;
        Thu, 21 Jan 2021 12:21:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsB9oZ3yZw0D8TsbCi2EeB/3ZNVvQrNSIdauPd6hhGwiWhHIhegD9ynuFxKTuWUr5PMdfl
X-Received: by 2002:a25:5382:: with SMTP id h124mr1474702ybb.171.1611260485831;
        Thu, 21 Jan 2021 12:21:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611260485; cv=none;
        d=google.com; s=arc-20160816;
        b=o5bJ6KkTffaLx6Ll8aIzAkVfgXhjTuglbBWJ/MMnbOiDMAG+6+lFkkPgRHmrrpEfzn
         aYxd00H/AGbHxiCeFIgc7u3DY4/3zEUjv84O8ky3Sw7LAJst0fNJINvKcmw2qlj9Kppj
         Wnrx2gDG25M04bkO5Tsep/NMPg0PiFOZdkycaHcqEowLMeEkb1w3ZnicjccUHMVJI+Fi
         b+A7x/fmeFho8psCvNQjoi+gSxED8zERauB2+PIlcAuHbLJlAyyThxfzBjvqj26nG7nn
         UkDXYQoc+cZI6KRo/ZWKMtXuXggOwE290huNUmxoPYqqg9mVM7HfDvj2METDSUwUf7WU
         EoLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=NSTvq2STd6U2RpvgIeu3fQA6GEXSLfXZ1us/azMianM=;
        b=iyyNvhbyIcNwYU5AtpQzY3Xb7SfD0RvwsppfHU1pno32IGvs+soESsrrtHCUZnmz4y
         5zRCAgx4tm0HUXJR0P4AQrvqqHvkZS8NBFDfLHdHtVEMDjb97zsAS+/QsvoHAqHT5YEu
         dWPgY7l7Iuu/zAfZCrUBeWM2VcGTNrRDRfdFxjWmBFgYIEkOn3UF+V7H6hghJmSpzLWC
         6FAZqQHfGXjWA4H1ylkOZqBewl7Ll1b1DjdFyNgq+YchWxXIBrb34NQkwcn/ecEJyGVC
         41nV6fpvcBOTBbUrCklcY6n+wnFZONRavorPsjhgzZruvFNCVQTLV8JcARyAQQJmuJzJ
         lfkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=k8Mxl0U0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h131si5676562ybh.239.2021.01.21.12.21.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jan 2021 12:21:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=k8Mxl0U0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:46800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2gSK-0006tT-SZ
	for alex.bennee@linaro.org; Thu, 21 Jan 2021 15:21:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2gS8-0006ss-EG; Thu, 21 Jan 2021 15:21:13 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:41908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2gS5-0004AK-Sn; Thu, 21 Jan 2021 15:21:11 -0500
Received: by mail-ed1-x52f.google.com with SMTP id bx12so4017342edb.8;
 Thu, 21 Jan 2021 12:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NSTvq2STd6U2RpvgIeu3fQA6GEXSLfXZ1us/azMianM=;
 b=k8Mxl0U0Xw2T/lcSfR0KBb2sttFYTuXZ9oo4vgg+oNjdfz3gkRfj8xyd6aeA9vPdZZ
 3guWWEOb2HKiuxtOpz2gQctfUGqO6kaAQdgO3pvzOFvvM4DJWaCK3Z1iszH5vzQxsyb/
 /ag6WbMMbosTDTvqVudxHm1xhqHezoTL9PP1zeUPeaZ6nybwFrjjW8CF+rV9qSL5RWI9
 u0hbaUYf2SMezi1zNBgaIdpykxNRQkMsXsPNop75wcNaHAtRJgnOC8cXMHmFINTjK1dh
 ubjMsskvLHSPxmDcKSETAatJjM0S9i2MVDlcjzb3qRi9Ylj81DKhaZYI0GPpiwjBo7wb
 +gdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NSTvq2STd6U2RpvgIeu3fQA6GEXSLfXZ1us/azMianM=;
 b=W14r+GZJ91QjSSdE/kpsB9s7ExdyldYSgeT4An0rktJFavOV8WtnERXbYqoQ4fxw3m
 RhXifCDm75838bUijA+Uz8jZxlVJSxyeIUSx8cDec7O+uPA5dJWGz4KGn6rzdLZYzuEL
 ueBh9QSydMeAX2OTfxlBr47S0vDXwnO3ErPvNgIU93zNVdJhoDpPjZR4W97gO/aZHP/A
 4nyJ05ALV7/RISMpsjSD324GfbpuVgMLHQ/jnbo7yU00ek02OMxbu/W2lK9QazIQNnG+
 g6clyoch0+iPwk9noZB37v38uhbwCHGIYWwZ5lrSA4YQXa11OEe/xS7qNn95QyNhHlNU
 ChdQ==
X-Gm-Message-State: AOAM530ExZXp9pjhDDXHO/tQpPxf9TGx61FdDqg1PsDW51Q+DXs9lYC1
 CgZW80ToD8q3Ua7CF7AJMuU=
X-Received: by 2002:aa7:c34f:: with SMTP id j15mr700520edr.120.1611260465751; 
 Thu, 21 Jan 2021 12:21:05 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id f9sm3343214edm.6.2021.01.21.12.21.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 12:21:05 -0800 (PST)
Subject: Re: [PATCH 06/25] hw/timer/cmsdk-apb-timer: Rename CMSDKAPBTIMER
 struct to CMSDKAPBTimer
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0541fd0b-28be-b0f1-aafb-5a30a1bd1f96@amsat.org>
Date: Thu, 21 Jan 2021 21:21:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121190622.22000-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FJ0CRyq4wZWP

On 1/21/21 8:06 PM, Peter Maydell wrote:
> The state struct for the CMSDK APB timer device doesn't follow our
> usual naming convention of camelcase -- "CMSDK" and "APB" are both
> acronyms, but "TIMER" is not so should not be all-uppercase.
> Globally rename the struct to "CMSDKAPBTimer" (bringing it into line
> with CMSDKAPBWatchdog and CMSDKAPBDualTimer; CMSDKAPBUART remains
> as-is because "UART" is an acronym).
> 
> Commit created with:
>  perl -p -i -e 's/CMSDKAPBTIMER/CMSDKAPBTimer/g' hw/timer/cmsdk-apb-timer.c include/hw/arm/armsse.h include/hw/timer/cmsdk-apb-timer.h
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armsse.h            |  6 +++---
>  include/hw/timer/cmsdk-apb-timer.h |  4 ++--
>  hw/timer/cmsdk-apb-timer.c         | 28 ++++++++++++++--------------
>  3 files changed, 19 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


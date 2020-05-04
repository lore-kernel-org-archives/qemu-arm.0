Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp652184lfb;
        Mon, 4 May 2020 10:14:02 -0700 (PDT)
X-Google-Smtp-Source: APiQypIJzC5WfIKHv7sL1WHMAtA0qD8y8ze20H0ct/vMIv4EDmoXz7JBaL6/QZ31dOSJOwYlunOs
X-Received: by 2002:ac8:550a:: with SMTP id j10mr74753qtq.193.1588612442312;
        Mon, 04 May 2020 10:14:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588612442; cv=none;
        d=google.com; s=arc-20160816;
        b=QPLArSeloqCL+Lm0gRWHNr5t1ZI8nOix8xdED4nAXyM1RPgTSQBmZv8v+wX/3joxIq
         RQdfbZnRvu6pekTfGbZyq7497/PeAwxdtiar4Y6hQ9RuXPh/A/BAzJcwH3k+Sk/j58w2
         tPGtktIMkhHCcPMjBJ2m4CRVZBBiPWh810P2PhUKgjophGzD6bIJ7eH+jbN44mIX3aHh
         InOJpRn1huhGOJGpeNUdxROKDoCSZ15h0q8FizxEX31R01Sm2Yn37gnKgrCC9NnIROh8
         3UgEgsbUP6gt3OREJSeISmoaPlzroUrDd2iosfsfe96VnCYzRBBFwVox53OfeQSu2bun
         AS5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=exBctjxIOKZHQxJx4FgZbVtAE0UvVUSfUUwvNOm8OoI=;
        b=0pCPjgYVroH5snVt0Ryn0tiEPwcOKOBSJ2wUwWq3GyHDYmtDS2B5+z7dtgnhho2aJ2
         9pdETgou5mgyz675oHJ0alZEn4Z8oq7PQ8etN7UnxEt84foXAhzHB16oKx2Ggb5zr5Wj
         BFGB14b1XfnAp+B/4FB1hbE1ShtyNnA4HHe+SkUpLVYrtJiCEP5iN35Bli4hW6YTEEae
         wI5EvFLem1Y6IX4iJz/TF4pLDSpBVUCirUXrJQ/yYuPg7PqEhvF7B1lM0CyYAmiKF+t7
         c9ZSww8YuI43er8jeuh9m/olWsxTM/+VJB/ki6EidXXw2Wzhph02uH+RKz3qlSJ7ZSbK
         OnPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FU7a1Ebx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id y67si6809619qkb.105.2020.05.04.10.14.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 10:14:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FU7a1Ebx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVefJ-0004gB-Lk
	for alex.bennee@linaro.org; Mon, 04 May 2020 13:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVef4-0004cd-OU
 for qemu-arm@nongnu.org; Mon, 04 May 2020 13:13:46 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:37051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVef3-0001wt-9A
 for qemu-arm@nongnu.org; Mon, 04 May 2020 13:13:46 -0400
Received: by mail-pj1-x1043.google.com with SMTP id a7so159616pju.2
 for <qemu-arm@nongnu.org>; Mon, 04 May 2020 10:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=exBctjxIOKZHQxJx4FgZbVtAE0UvVUSfUUwvNOm8OoI=;
 b=FU7a1EbxqVOcoAknvPbLGBV0Mx2A2OaLZ+xKBAHTz1+18Szj7umcDDoXVhFKP3FlYr
 2ZVUaMkynuefRlRT14g5MALphB1uO8WeDKYj1wz2/lJzciwuMkqmjVnoKyXgK6SHItgH
 MJNZCydIg73im8FV9ShtrxxLIiA4z/JG/HglwAL1nquPg2sZskW8IinU/nQoNhD5sqzz
 YJ0LUeqJgxaAEo46/TSSEALh+rApzg0L5/VSzRgdc3m2G+3B59koriaJA4wAf1FfG2hP
 MgCeFMMdDd/Vt4FeNd/Cb5f6CO5CH1xsUShvzInriXvUpN1I4vfjJQcU2wS8qqdpu+n3
 L0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=exBctjxIOKZHQxJx4FgZbVtAE0UvVUSfUUwvNOm8OoI=;
 b=j80RtzB8AUUH6lqmOvi/vNPniFza1ns0476ZgEVFDNagWs368Pf11fzyWYdNibM4X8
 FSithNwhSVxOYr5qaL8HwlEIckoq6F/4J0L/fdrQ0A++Fx/ktF8Bxx2y1zO3MTVhmzqD
 8LFSTTx9yonnSJoQ0dHIhTSWlyA4VPNWtoVSOSU7pImVw6D8yKmLCSikTTqcBmnN4nKv
 pJ9oqZD1erdyjiwrfEhN5lWs9UVaQ3/bVdNz3l8JCvv8+xlm5YWfxZb3KCuxkImdgLNi
 YVYmTSzyJHLy0KwdL8FsRXIobj9NSCuVzO5NnngaBexnzUTcqoLIUD0/iyQU3egTspI1
 8bOQ==
X-Gm-Message-State: AGi0PuaX0/6VHQ6+gtsKkFImedFWOCEQb9bVHMdrBLuCYGzU12k4LHCZ
 eAVIoLP/B27+EGKdD6mYgyW24Q==
X-Received: by 2002:a17:90b:3751:: with SMTP id
 ne17mr215257pjb.114.1588612423358; 
 Mon, 04 May 2020 10:13:43 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id 127sm9544223pfw.72.2020.05.04.10.13.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 10:13:42 -0700 (PDT)
Subject: Re: [PATCH 2/4] hw/arm/nrf51_soc: Mark some peripherals as
 unimplemented
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200504072822.18799-1-f4bug@amsat.org>
 <20200504072822.18799-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a5278614-a9b5-f41a-53ea-f89331d6a3ca@linaro.org>
Date: Mon, 4 May 2020 10:13:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504072822.18799-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Steffen_G=c3=b6rtz?= <contrib@steffen-goertz.de>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ijb9+Ah58KNT

On 5/4/20 12:28 AM, Philippe Mathieu-Daudé wrote:
> Map some peripherals used by Zephyr Project:
> 
> https://github.com/zephyrproject-rtos/zephyr/blob/zephyr-v2.2.0/dts/arm/nordic/nrf51822.dtsi
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/arm/nrf51.h |  4 ++++
>  hw/arm/nrf51_soc.c     | 11 +++++++++++
>  2 files changed, 15 insertions(+)

There's a fair few more devices listed in the manual, and not all of the ones
that you add here are referenced in the dts files.  So what criteria are you
using to choose?

Perhaps it would be easier to add them all?


r~



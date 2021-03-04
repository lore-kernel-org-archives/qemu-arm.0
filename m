Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6503256lfg;
        Thu, 4 Mar 2021 11:11:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2r4wE4wWgLv2uLzKELGHLJlYzru2hvJ/ZVZoxrNuvJjyuVW6ipBhhi8EIO19gb++anl1f
X-Received: by 2002:a25:df4f:: with SMTP id w76mr8245043ybg.37.1614885115145;
        Thu, 04 Mar 2021 11:11:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614885115; cv=none;
        d=google.com; s=arc-20160816;
        b=LfyAgSlv0n4UzK8ppwBYBVqyVB3n/sCNpoGixKbu9igB9LpN/sQ6LIq2vJJGmlAvOO
         1+JTYwQGG5fA9SBSu3W4nAX48miKf6pCcVspl+RRx238sAYDvwpMEXvRn3HGZvXWvEij
         uKIFD0lUZzRqGFVWNWFzQtBqV6ac//dgF3iYCiNlT81KZvkVml7XGMcWeqZXN159nTqb
         aYRqC02ggDqcLmZX6k/r2llHsmGdFDe7uKRgvttgN4cgoKyM2PVsom5zJNWX/3dNgkcv
         Gbt26ofrQm4JZ9qbb/sP+rcDM4nklc9i8Obbg2N6I4C2FexkX3GBHhMYPybpgEhP9iAE
         40qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=xGwbO8W7Jb5U6Q/IsPx2xFYM7RKCivcfmD4FQ3b7Kbo=;
        b=JsGwYGOdYzz9QE884nU16VE8OblWQLD9X7Gg1EVR2NG7kD5Gk6DEUIyN+iUn1j+Qzl
         wLwWLb9iYfiJrU5oEWM9bXSwSvXkwEZMe4iXyoY2f8tytA/Co5l5+CTEPxUCYkJpz2Ga
         oCdNVES7ih2icqnkBHMSJ7F672dCT5iDGgMp/pWEcEfLtICK27KSzuPCbtMva7MDacbm
         Qn7XsRkBcamleJqQ4RRt1pRCkUmFyR3poxKiGm8EioFKUw7HX2vgosnq7rnfbkvCM9Kc
         tbMySWrtzpUSWsGShrma///XtO5V+nDLuj4XkdkXs2QTU1DwBBzUvSPGFS1/59DO5900
         XBvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jLfXGOUg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2si140701ybq.32.2021.03.04.11.11.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 11:11:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jLfXGOUg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHtO6-0004YP-Dl
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 14:11:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHtNc-0004Y1-KV
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 14:11:25 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:46667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHtNa-0002P6-LS
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 14:11:24 -0500
Received: by mail-pl1-x62b.google.com with SMTP id u11so16677521plg.13
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 11:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=xGwbO8W7Jb5U6Q/IsPx2xFYM7RKCivcfmD4FQ3b7Kbo=;
 b=jLfXGOUgmqV0yP2JydQGmGhB+NgVE+cnDD0pmH4ziuWASCfCaG9vYVn/gCm7di49jy
 xumArdfqmJoE1KOoHgQ52hSg2N+imDq4cL1+9iwVfuOMKBbsM15KomiTUPFKyr3k4fTN
 3RUQqiDyNeIXU2HESL5KCamSqPFRKp5hZx4B2xf6OVCgxNByvhswbrmkeVr7pJUNn/9S
 ReMVj+k+aFbSkp9ufR9YQXVcWZqnWj8Wn4oYKVWVAgmzgy4jsoZMoI5/forBI//dMPb5
 n0VX2iZY7Gv0fgDg0h4ZfxM2XrUXtG41k+E10IZxQOSInOPI/+3MhX9OeoH6V9Sthvvf
 sbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xGwbO8W7Jb5U6Q/IsPx2xFYM7RKCivcfmD4FQ3b7Kbo=;
 b=QUC3jJP/kHXq7gEaqq6R1XmzqeUJGfcppsGT8DshlOei1fOlBZBq+OWcUZ+kascu3m
 Pmk7QAiZwTW78ai+HAOFxg53IrpmpYaR1UutrkFTyjvPFVoFQCybWRNOvLsIeN+R7GlX
 o1u78YC/7oeGXXjkse/MDXrJIB/1FZkAg4dbnUGCeNaHVb6d91/8xMUQpIrqdsxE32TG
 exvbtMygxHH5LTN+dJ7OUGA5nWK59nDDo4zVf4chj0J0fRsVM1m1cHPuLqxTW6CXX60B
 Wnfj/vKOboUQcYa4LDidC6QDZgCctnSgbRKdy/ASlwwGXU11YlFQdqi1wGypK4vSJUI1
 w/mA==
X-Gm-Message-State: AOAM530hRcLEYB0UM7EeU3P/At1f7lftZvhVmNYNzFhO7iribH8i9uOh
 LvajboRTaBPkWqQ4sqbmoE+wLA==
X-Received: by 2002:a17:90a:e298:: with SMTP id
 d24mr5961751pjz.171.1614885080934; 
 Thu, 04 Mar 2021 11:11:20 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id c22sm149438pfl.169.2021.03.04.11.11.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 11:11:20 -0800 (PST)
Subject: Re: [PATCH 12/44] hw/timer/sse-timer: Model the SSE Subsystem System
 Timer
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <89898e8a-a43c-b2f0-91d3-c3337b960646@linaro.org>
Date: Thu, 4 Mar 2021 11:11:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: ZcToD4WYZQzn

On 2/19/21 6:45 AM, Peter Maydell wrote:
> The SSE-300 includes some timers which are a different kind to
> those in the SSE-200. Model them.
> 
> These timers are documented in the SSE-123 Example Subsystem
> Technical Reference Manual:
>   https://developer.arm.com/documentation/101370/latest/
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

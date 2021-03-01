Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3252390lfg;
        Sun, 28 Feb 2021 20:41:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7yorHjYuf0wRkHXoqOaMy2PugKyYtGqsVeJHsgm2nqMAoFJm+hjVONvrRZWgz8bJcF8MP
X-Received: by 2002:a02:cbb2:: with SMTP id v18mr6056951jap.4.1614573691093;
        Sun, 28 Feb 2021 20:41:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614573691; cv=none;
        d=google.com; s=arc-20160816;
        b=i9ykbAjwsB3WjBOhfUT85zBKvDCYzVTg5iOSEQjlsGwMn+qKFe4tUrtxPvjJkNIu/z
         obR0mmPYVD18zxO0uX9FkPoyvK1nawv2+4NvOWYQb9qnlEj72hqJo7gVtk2aoVWfbSsd
         H8u1e7T3y8ZIeXmIwxYCT4z7/F0OX3FGhKse7cYSafH9JEQZohVHti0n4pxasNpr/C6B
         qnQw24TYFf6RoPTAfQ0AbzepNgkwPBLIZ95j5nnRmHzCYtBrATarkVJPA+3iB5k6WHzC
         oqBdsPwDDAgvGrK+odoLbwYBhsGPNfh51Ei1UQmd1hiCaBPGQD+/ASkXymvG67nzd0YG
         bvag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=e7JhDheMZfHdo69q8lTpaPiSuT3hdmt8cxbr+xvSuiw=;
        b=r8gjJOf52unsgKxHcyt2+DbxrUuZPlyjyiYgwvFtqhnT6fnxg4X65QvABw/X/XR9fW
         U8MmfVE4KewZjLF8/mqcWuzZ+u6gx2lQVVmRVZaK9OVGXfSG7QUe5exR1FjhAyIA5iXq
         r9Jh5dp0EXxvQDb8Fob9DB//OJPHZwM9PuHopaMUBbMxATb4Nog+QMeJGyDN5UbDepyI
         SK7+/7i5yxwT4eAnUPgZMJ8Lge9RTps+MdX3aiLTUa71Zg3jAPZGBKvGnBSUaBLbNiwQ
         kKDxbRmKwgs+2mkghXNhkLpZFK18VSv+PDuX6S82a7FpBcBsGJT8tZy2UvXW2BeNHunz
         NGFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YWjaNoE8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o65si6887751jaa.22.2021.02.28.20.41.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Feb 2021 20:41:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YWjaNoE8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGaN8-0005pu-Ej
	for alex.bennee@linaro.org; Sun, 28 Feb 2021 23:41:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGaMy-0005mi-Vs
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 23:41:21 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:35601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGaMw-0006Q0-Sr
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 23:41:20 -0500
Received: by mail-pl1-x62d.google.com with SMTP id g20so9105756plo.2
 for <qemu-arm@nongnu.org>; Sun, 28 Feb 2021 20:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e7JhDheMZfHdo69q8lTpaPiSuT3hdmt8cxbr+xvSuiw=;
 b=YWjaNoE8FVeQmwn79zvnXkaorQ8e3S3HVJgdjwDEIGIXSw9LU8hdUBRqxlBTCCbwfn
 A91oN9w9d3W24uBQ0IQJe4s4+ux1mdvAHJlWBL7+G2ui0tYcB5lumi7SUU3UMbJ421t+
 VQpbcQd3kE3+qcxBjxFMnRJ/uGPiwuRHNEgzFC30NhRK6qS59RUzEgdox1OVOZXC4AAc
 NEEb0J9ZwG33jGybXCRQjnl7dPRFIa8xzzcCXo6+pcrcajN9JO7gzkINF9THJSlTKfV0
 B654mChqE2VKGYSpsUIi1X57+S4AGsu43aJBGiZMIiLEFExnxhaCUorrDGc5508Mj1ZH
 Fdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e7JhDheMZfHdo69q8lTpaPiSuT3hdmt8cxbr+xvSuiw=;
 b=iQrMrI7FPbPZBQGFDaNZLE6bwZ3W3hv+NvIMyLzWgAG14nuEcwX7qiKEwCie3YdSz+
 DP0JugM81+SDEE5l2kS4r/BxhuPnRgZ0grjawgef5jMexNYxlsrqlPPS3JZkNvRWi+TN
 VSibguFdgr4myeXf5bxpf57LLNNl8M6myzBgPqTBuzgi1ZYIjrWBVzPSICnsFR7/3JlV
 HRwXZpdwPQTKjlcDOPnkzRrEkXkQuTGTDWJaBE930QcsKg5SONJ865995fam03ZRNEsx
 dH34pG+SBuFoMr79Whz0ss6qkGdwKrbpOyVjtYl7rImFjHgoJyo+DUBsXGaFw8UDSmHr
 Yiqw==
X-Gm-Message-State: AOAM532CmRlAD5iNMkM2+sf4bFSAQU5AeWtCLl6GrgUTpxmYAh6xTYxf
 yrdEZQQxP5sq5x6IZZaj3QL1ug==
X-Received: by 2002:a17:90a:4092:: with SMTP id
 l18mr15636895pjg.39.1614573677333; 
 Sun, 28 Feb 2021 20:41:17 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id q95sm5991012pjq.20.2021.02.28.20.41.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 20:41:16 -0800 (PST)
Subject: Re: [PATCH v2 16/24] hw/arm/mps2-tz: Make RAM arrangement
 board-specific
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0042c3a4-8778-753e-7a4e-67bf1f394821@linaro.org>
Date: Sun, 28 Feb 2021 20:41:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vbo/6mI/QWEE

On 2/15/21 3:51 AM, Peter Maydell wrote:
> The AN505 and AN521 have the same layout of RAM; the AN524 does not.
> Replace the current hard-coding of where the RAM is and which parts
> of it are behind which MPCs with a data-driven approach.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/mps2-tz.c | 175 +++++++++++++++++++++++++++++++++++++----------
>   1 file changed, 138 insertions(+), 37 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


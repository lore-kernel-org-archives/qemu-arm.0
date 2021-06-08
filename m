Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4157304lfa;
        Mon, 7 Jun 2021 23:53:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5oid7TbsV3iZpBhG119hSdMEqIx7o2fT+gNltiK3tqByUhi5fB6yYaK22MfgvVrEWACKL
X-Received: by 2002:a05:6e02:5d1:: with SMTP id l17mr18413688ils.162.1623135208758;
        Mon, 07 Jun 2021 23:53:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623135208; cv=none;
        d=google.com; s=arc-20160816;
        b=jcZHIHTt/7d1Dv8AHhOlZS8xIqFCwibGlLqNUfhfWZi9vcF2VSDxuFWy1COsS2dT+l
         vs68h9IWIhyc4LrJNuYjIvzH9HvgliNFw/y8/lC8mMx/urpxbUhTvIdP/HxVzYAn/q42
         fYsMKjMUhBAbROCFZfI0B5IOUo2+bTe73zGAtK0Kjq7Ea2qadPNOIhYqEf1L3iXLV2DR
         3oCnQa/m+xHJ3ASYk79Ge4o++h72BLHump+PZ1p/U3Wl/W3JgmJaCkvde5SweZbS6O7D
         /DrkPodwcC3IDsaEg5q/fgDgp0nFNr1dgQonjv3pHkD19QfmXLLj19l9jvFvVhRtWAPN
         ybFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=eIbS1rpTaVfP0tyNIUEJ/FyS7nySsAgxj+Gu02JTOWE=;
        b=TaIJmfkn5k83UF8Vka424yt63R13mBDa+TGFVLhk1k5Tbgk5+NaJ2ovHcJtKuGS51x
         +4EF0I6rvZEsFx1/KGtlIxTqmWKl4yZNnQaAlPzFLpGckHH8VCKUkw/7AItIMJ9v/7+W
         rD7EN2MSopqRIiBdzdafiu3pZHUWLI31bjivpgkj5exKoZtXfVTP92m0SW0nJP0jCXja
         +hhytvqvEq0mBZGUMlbG5+L5Vn5ndQ30d5BQce6yxW1RjfUFdePn61p8781GkDHVNwBS
         CUhqDzLy5nOVPT0qpjKM8OXk9EQ485ZNcYXniMAXD17awLWANoClVE0OC0ZKWZSFJFCj
         XmUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="UHjcBD2/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g4si16315932ilj.40.2021.06.07.23.53.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 23:53:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="UHjcBD2/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:52136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqVc8-0001mI-2S
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 02:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lqVbz-0001m6-FT; Tue, 08 Jun 2021 02:53:19 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lqVbx-0005JH-S5; Tue, 08 Jun 2021 02:53:19 -0400
Received: by mail-wr1-x42b.google.com with SMTP id o3so1854420wri.8;
 Mon, 07 Jun 2021 23:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eIbS1rpTaVfP0tyNIUEJ/FyS7nySsAgxj+Gu02JTOWE=;
 b=UHjcBD2/3XaBV/4ZOGPyoIWL0uVn2eT8To8dVvEy/YWJmRtyGJ5+QZpnNZqQ5tZNoX
 SGG/aOA1sXHDg+2cc+Nv+tBCJYy99vWb8UwoyKGHuhrtap1/cn3kAQ5937gvYdCbZ3LR
 cLEkVSL70gAatHW7O8NFoxU/FrkFoLTWrNimZkJMt0gqn96Ojp8pK8GjDvHJxV8FJoZW
 HjtJ2FFlXbup5HlkvG7iBZForqZGSBYLt5UPc6994giQjNQVbImV61dhWdJc/bTt5wBB
 MXI/oghjfD4jx2DJ0v47rOQh48YTy68z7Gru1tKNe2rUexi+qDEhYdOvY1fbf0mbyR0u
 unAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eIbS1rpTaVfP0tyNIUEJ/FyS7nySsAgxj+Gu02JTOWE=;
 b=S9Ukm9jj7otWqCO1pEqELNrqRWVU3w3jy5GjZP9aBhYWfIpJ/F6FrywmdTTaRumcZy
 OB6b6RXbNTKQ47XGeBGY6oV/nhizxTRcIQ38xK3PWfIvhtI/nkkxZh9QkP0LlmwXqgzw
 p/VX1bvKDKhx7Zly521bwKuIAbeGBZ24ooD6AmOcKG/3g3OaNZH4zVfKVkTIACs4kmx2
 GkxLgwZrtUqxjhWTqg4s+DIXbUOsx9/TURvRG5SFV7woFNHgt4hIHGoWRP+2d8m8a9Zs
 0XvIC23VlPL/rSmJ8RV4qBfCH2dPcfQfTQEzDsmYfbhoeW2KQMoUpw/ilIYt4N0xhoVO
 JGZA==
X-Gm-Message-State: AOAM533iBYIwTTE/Qr9izoA1B1n3KWVBYPCLIEDifQfeBYEvYVWQ8u2R
 b2YPlIt6bWedwL5fyh401ns=
X-Received: by 2002:adf:f7d2:: with SMTP id a18mr21583397wrq.111.1623135195526; 
 Mon, 07 Jun 2021 23:53:15 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id l31sm5149566wms.31.2021.06.07.23.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 23:53:14 -0700 (PDT)
Subject: Re: [PATCH 15/55] bitops.h: Provide hswap32(), hswap64(), wswap64()
 swapping operations
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-16-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0934308f-187d-19ca-d741-08c90501bf62@amsat.org>
Date: Tue, 8 Jun 2021 08:53:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CQuVDihIRtFP

On 6/7/21 6:57 PM, Peter Maydell wrote:
> Currently the ARM SVE helper code defines locally some utility
> functions for swapping 16-bit halfwords within 32-bit or 64-bit
> values and for swapping 32-bit words within 64-bit values,
> parallel to the byte-swapping bswap16/32/64 functions.
> 
> We want these also for the ARM MVE code, and they're potentially
> generally useful for other targets, so move them to bitops.h.
> (We don't put them in bswap.h with the bswap* functions because
> they are implemented in terms of the rotate operations also
> defined in bitops.h, and including bitops.h from bswap.h seems
> better avoided.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/qemu/bitops.h   | 29 +++++++++++++++++++++++++++++
>  target/arm/sve_helper.c | 20 --------------------
>  2 files changed, 29 insertions(+), 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

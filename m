Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2661807lfk;
        Tue, 6 Jul 2021 18:28:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoNXiS9vxd032CbsPa90PT/2pvLFTgxKYXLVamqmTgAyPKZyFW2nljwzknzL49xSjO4aTi
X-Received: by 2002:a05:6214:1d23:: with SMTP id f3mr21307572qvd.10.1625621292085;
        Tue, 06 Jul 2021 18:28:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625621292; cv=none;
        d=google.com; s=arc-20160816;
        b=XhQHwBcAouYnLkDZsxifIP/toqDlwZPV9TMj4xR8xHTK3AoBmJECConxQEEiW2dzaq
         bR/ALTWqRk3GjU4AUXQd9ebqjeOm6C9WsDPRwAGbqv0rHBH0/4NQB+jZIfmtkve74uqC
         ZtM5MtHWTMTFORJikv+Qj90CONUHt7kfopYwe0Zt2P/KkABcRw/uoDLLl6nxJFu2MMEO
         97wCY/GoSHmOmsDZAmAqyySE+S0SjQM1W4eVWDVv0zHP81BVuzVWUG48nOzGHDrsVI+r
         H036lQE1xpTS6ZzA07yQitX+K7FIR4NPS6NZW0Ls7waMw/ikPGDdqqTq67YRzSaKlGr0
         VTXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=B3HHX395898sL1hA+VtQvlcegUrojS5XQ8U5oVvMMzk=;
        b=ll+VnbLNiUDvWPuAYfTBmORUbsISvrZ5yVK1ZMJzYKiSCq5qD3lirlaA2pEEsMndQv
         a/hUiTnB9duxcehr+1kTz1ymM5O8jKtnHpNQklP2eHOByu3xLcvor8ChWgTFtuJOKpIS
         5MwuqkzNBs5lo2CPZSzCX+ZFzj+pZr6fxFC/2Q+9yxwcOTLYA2WkTpXLMtIYaM49DdFy
         3TyB1SqSgukc14kDuB7COJzKTyYWQe4XkbPav5Zo9aj5LjHATMfhwB06r6jPeJNSgW0X
         1+0gwNePCgYfwFN710cgtojlzTwAooZue9yORxkrZGQH6XF2S4KVrDXDNEeJ9g7Bux3i
         5/xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HmLrgSwm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k22si14310302qko.201.2021.07.06.18.28.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jul 2021 18:28:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HmLrgSwm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0wMF-0005bz-Fx
	for alex.bennee@linaro.org; Tue, 06 Jul 2021 21:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wL2-00041M-Us
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 21:26:56 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:41949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wL1-0005Up-Go
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 21:26:56 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 oj10-20020a17090b4d8ab0290172f77377ebso626773pjb.0
 for <qemu-arm@nongnu.org>; Tue, 06 Jul 2021 18:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B3HHX395898sL1hA+VtQvlcegUrojS5XQ8U5oVvMMzk=;
 b=HmLrgSwmT78g2/O3zEsq6GHqorsG9VWKXAWkSJaTce7ZHqHDma7WgKV29lE+aMTexn
 gCLUIPYleFIDzCkrc96bvp3Awagfh14lysGjqzyckpk34cFNxdYY+qONVaVGT+Uxo96Y
 fxkSxZcvWmlsDu269xyrep0G0DY36Oe+GjEICWzonulbe9XX7IOb4A/0BZXcA6tFkYaR
 vrFu+H7uj0Ob8/c3PA6cLerFVb2q8eU1xioF/PwQslwP/tG1b/vK0ONcx0+JZsiU2ksm
 EtCjC8PyNt1zyOCtZLh4gUn+aoYomMcFUBCPuBNxypDdEt2HeNUtmK1pTVyO8tbOYN5J
 8ZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B3HHX395898sL1hA+VtQvlcegUrojS5XQ8U5oVvMMzk=;
 b=WOa/fS63u6ux0tsMkq3TEKEt7kpkN4O2Ivktycw6C080k1mJah6TMfnZLsECMpV2lZ
 KOCmsPFr5R3B3gbss1ooaifcMe5Oe0N/D54hep1ovmo5yQlvlCpvS90RmTYvOVxqOol7
 5Dl0LfA6KBapaFCgHTUikgDhbvSR6HjSHygGra9cF7Dkgdt5kXzaHN8LSLxhoo6A4u81
 wE8bxkd5BnxMSsMzKy5dkGbgf7afoGCaqeHOlppHtGa24sFj0DEfmCIfBTyVt5RzgvUP
 TmB3rd7TbbYmDgKbXbzQenKIxb4N0p38lLVPzWh6zNjQmDikd1D+/WIFFN7rFRAhq8mA
 Fqjw==
X-Gm-Message-State: AOAM5301GHxf9kKoUaCJW50x/1S+BH4oMUTZoctHPrjC+qn3MvT51jwn
 XKPMkqqeFaKJ/5Q+tRN2g3FGWA==
X-Received: by 2002:a17:90a:17c1:: with SMTP id
 q59mr22540354pja.231.1625621213803; 
 Tue, 06 Jul 2021 18:26:53 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z1sm15074159pfn.126.2021.07.06.18.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 18:26:53 -0700 (PDT)
Subject: Re: [PATCH 05/11] hw/gpio/pl061: Document the interface of this device
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3d1f0efe-a59d-499d-0f63-f7df4f4e151f@linaro.org>
Date: Tue, 6 Jul 2021 18:26:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702104018.19881-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7so2P3ApZjCi

On 7/2/21 3:40 AM, Peter Maydell wrote:
> Add a comment documenting the "QEMU interface" of this device:
> which MMIO regions, IRQ lines, GPIO lines, etc it exposes.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/gpio/pl061.c | 7 +++++++
>   1 file changed, 7 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

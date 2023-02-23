Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1119688ejc;
        Thu, 23 Feb 2023 13:26:04 -0800 (PST)
X-Google-Smtp-Source: AK7set9SSgySgUgimKIBePBhiHSwukM3C/vq36iFYJkrQvKITpPj+eM45HORD/mjRx3mjzRjW1kQ
X-Received: by 2002:ac8:5d8f:0:b0:3b9:b66a:2569 with SMTP id d15-20020ac85d8f000000b003b9b66a2569mr6724670qtx.7.1677187564033;
        Thu, 23 Feb 2023 13:26:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677187564; cv=none;
        d=google.com; s=arc-20160816;
        b=NY4bbQbrN8DdoBUbdK+LZJYDJ5Fd/om2XaMJfKXG5xLdVwaptpP9JOxo1rvzX9AC8y
         7ncqu+Ws/6rLxpe8L0sKyUyej4vmf8pvTmI9r0tGOujOtNVeps61linYJy5AmqoIhbMi
         jybre44VNsyFtOvyuq2k4ZLwJtyIgNFXNMXHeOTFzbztL3+ir/4gSZONVd7y78cFmEEt
         H2h9aMwpPeWAO/6vjBS0FntN/XBoplq5JJ66/oD+0Y23SSm1bqrBQPOC/skv55GvGKSv
         bjZuuh2Vtp6eh4AT3G7ZZQbhCnycZLQoVF1wf8h6JuL3lR3+qwB3uVpKjXrFLSFIhHwT
         9L8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=JP/Oh76mN6Cg+YU8sgO0Pw9l1PSXNnWsm3AkK8yVEB4=;
        b=Z9eu5QwCArvXXtoleNquOSnNVGDNWl/ZpWtkJaEwIUQgcvuGWIGrWg2qzJxlE1SFvL
         zU5Z0eA1aLZsnr5sKYxpNsZKtIqyvqrAoC9+Kr6jBlAM4mmuyzTEt5tCcfHWzel9xuhj
         oBwpTElR7lTyx2rmX/walb3T3EJOzzl9m+NL5t4qzF5eXW1cydmJuWRqTZVyDRpchJo5
         wttB4lXKBmWtmi/HvDu1UG0ZvGjCHOR7DlGcaAaZtJctcShBvPQavPqth2hRimhp8cLe
         cvSIhM9TC2pgLLNcH4vOZea13S9v+lbF4FFypmKnG3cg1DqGpmRFGpnEmQ00aYpUFVcT
         +X5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lGkcbmQK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z188-20020a3765c5000000b0073069b1f8besi3736688qkb.602.2023.02.23.13.26.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 13:26:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lGkcbmQK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVJ60-0005Yb-6i; Thu, 23 Feb 2023 16:25:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVJ5x-0005Og-Co
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 16:25:41 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVJ5v-0000yg-4U
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 16:25:40 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so428932wmq.2
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 13:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JP/Oh76mN6Cg+YU8sgO0Pw9l1PSXNnWsm3AkK8yVEB4=;
 b=lGkcbmQK+7sSZps5vrtnFwaVOJGkSXXkwHma+q0/AX7HIebpNft47g0W8YBLavdMjJ
 Af9dJIWYSLSzc+xsmjZvKN5rURPHVKX8mb1nzpZmWLPe5KtgU4/DatwalIKUR45vQ8vU
 i20Sd82nmiDFcssTagOQMbaWtQBt8cRB3CeQ2jfA1XGUpoUET48MJ4o20cjpbbvA8D/r
 BS0uqZAnppxqZauYJ/iPMDNyABdCQJf52KOkOj6k8hp0aVpIwXwVDaJvWGC/4UpLhnNL
 XKbcJZ0AkD0W9ve40PCvpory666Vml4pfRLbW3sY4eA2HhtztD9jA0jaa2pSaC64dx5k
 /7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JP/Oh76mN6Cg+YU8sgO0Pw9l1PSXNnWsm3AkK8yVEB4=;
 b=Q8X0blWNx09M+/SFeLRgfxs08dd8OgfEIo/FLJCNoVZnbiuohFl77CQRLb//L0XI8j
 8Btb89L5eEhOYSn8mECn09Lu/gkC3v6fdS5yLfv3Li74BUWLV/2f0UyjKIqnEZsURodi
 v16u/KDnAnaoDldUkI473biLjd196c8MmPc5H/TlU6gglrGeSyKOjMmCQMsSY5i/ztp6
 E56Y7NFXpfWKvGh8YmQHb7XHrN9216JzFwsEaPBmMaF66JKhzePQQR4vvlnJs/g5IEgP
 0/ZZMZlrGKpmdPtJfaBt8Hetl2+6nOtdXMkI4hbs6MCd364vZTNkcLDrK1nbV4K9z2MP
 3kNw==
X-Gm-Message-State: AO0yUKWLD1/LjQ1Rj/deusCopS3maj99bgkcrvOcQGUbK190VxtGZStA
 JWgCMbwTPs9akV7KrV77AoIYRA==
X-Received: by 2002:a05:600c:706:b0:3dc:438a:c381 with SMTP id
 i6-20020a05600c070600b003dc438ac381mr3965152wmn.28.1677187506312; 
 Thu, 23 Feb 2023 13:25:06 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a1cf414000000b003e71a6be279sm475080wma.37.2023.02.23.13.25.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 13:25:05 -0800 (PST)
Message-ID: <d65c998b-a061-85c8-8719-7fa0ec1aff8f@linaro.org>
Date: Thu, 23 Feb 2023 22:25:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 01/13] target/sparc: Use tlb_set_page_full
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
 <20230223204342.1093632-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230223204342.1093632-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XaARmHQMEre3

On 23/2/23 21:43, Richard Henderson wrote:
> Pass CPUTLBEntryFull to get_physical_address instead
> of a collection of pointers.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: Artyom Tarasenko <atar4qemu@gmail.com>
> ---
>   target/sparc/mmu_helper.c | 121 +++++++++++++++++---------------------
>   1 file changed, 54 insertions(+), 67 deletions(-)

Nice.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


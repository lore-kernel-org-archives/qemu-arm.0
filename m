Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1212204lfm;
        Fri, 19 Jun 2020 21:53:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuWyGDcoS47RdqyHeEdzpNgInO/ACKO0XddpwJnsgtT+8L4DMRN1K3iOfsyOmTzAeHenUQ
X-Received: by 2002:a25:e083:: with SMTP id x125mr11832262ybg.338.1592628784805;
        Fri, 19 Jun 2020 21:53:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592628784; cv=none;
        d=google.com; s=arc-20160816;
        b=RLWwEY/hljlRPwqcOJjuAMBxeXxR3fYiGnLsd5SRQetFYQlpkX64k4CbfkjoPqsfys
         RS58z9nhTo7IZ0ts7JJzgrOdUqLg3u0m19zw0pHjr8wfQU6rr4rd27EPbNTL8uquP1pe
         FN1/oeCEsPs9S3ELCBeOEPaUyRp2u7WhjhcwjMmYN4rlDb4ZcdojMNf/Z/bUwDAND3Ki
         fLte3sdPoU51LhpT0E7FG1xN6rhxWk27bqZyu1Ov2AG1neZH520r3VSLj3k02mfSawDT
         DLZaOUNjJEvQkeJhLs4POmhCehbets8uay5RuTFA2lBmp7c8SSfp6IPDZHqLzLbeZpjp
         LRng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=2+5sC+jR9prNwT4gof3OKyfZTNvdJYm7c8yu4K/Wbto=;
        b=JtFCxDZNuvOzhCmjfNo4BJArwPlniXeTnXjq/Sgl3FXxTPK01JH8BHLvkd+5KJstcc
         Za204JPiNM1t1tKCgwNSzGi2+B9PwLwmgRL1fF1V4OtnS5FbuKxwuPBi8YrV6BNEWXmx
         x38tRdTqDOmcQTo8RgtE9NO7Ur0n4mPsG3WQOhBMlQ+Fg3F42NkQ4COSFjdEL+94Ec2V
         teBFhL5mPppPHpiAEaCGlOlxw4R4ijph1nH2tWKO+Bo/F74WsSTcfvdrSLEom8/0uAz6
         Hm+yHwgWhPmwnUyn/lXb2Gg5iasNqJXlAltFnAmmkdu5eTL1hOEip1Si3RVYr64WHO5T
         Xvzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jQ7YzWNf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 188si6750175ybm.234.2020.06.19.21.53.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 21:53:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jQ7YzWNf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmVV2-0000be-8O
	for alex.bennee@linaro.org; Sat, 20 Jun 2020 00:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmVUw-0000bN-58
 for qemu-arm@nongnu.org; Sat, 20 Jun 2020 00:52:58 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:33514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmVUu-00018R-IC
 for qemu-arm@nongnu.org; Sat, 20 Jun 2020 00:52:57 -0400
Received: by mail-pf1-x441.google.com with SMTP id b201so5466410pfb.0
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 21:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=2+5sC+jR9prNwT4gof3OKyfZTNvdJYm7c8yu4K/Wbto=;
 b=jQ7YzWNfav2cMFBEEbJq8ZLSmabVHQ5ODerZ0Hccx0It9DzoPz4WaJSbS5O75TJpim
 OER0rJNrB9gy8kE+78Gmpw2boptcMMxz4Szwh82KsiZalEAU6KTv1DRNKgX2eEJh64Bl
 +vy7DFUVFlP1R7Z9NXQkpQ0VFXDcGy1MpUtiPvNR/H00foEh8U1fsvtbvCpzGS+I4AAe
 3x4Zuzi5yj7Cu1t6tcDbRlIZzyfhKGtIokn/+viySqoyity28U1hAZ4W1ZsvOen4/KB5
 aqUB2mqkragZPeX3UBO/hucfQ3uT3ww2DLudvhZ8Ayd5XSd95M2JA6j+oTc8utjopohK
 u0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2+5sC+jR9prNwT4gof3OKyfZTNvdJYm7c8yu4K/Wbto=;
 b=jM9Za6gEYSroHJy7uoJVia51/g84gqdSdRZEaRrEtLz5xODJU6U1hnICtxwvpkjH5w
 raLtPBQML98VpwQd4ibimiEG7ZNXbmaCATeS3sya2ch1UjlOPLejypNCXTgaEixIq7Aa
 RDMEfmv+ZAVfzV+FdGAbApPQCi8qEtIZ9qFIGZdZUU6KM2o2JYZwDHnIe/DnMROHMQfo
 07LV26d5pXWhYeAP6jO7lhjaCd443yYZeC215Yv//cjOWgeiwXihrhHUwLsYN9EGyl2R
 GflIyWZCcEFqKBVN0J1F/v/f+Rp0Ke3iVj0ZAF656a4pp4c/QbTASTmjmAlniuTvnNO4
 JyEA==
X-Gm-Message-State: AOAM532zsvo+BLxN02XHKc+wH3xAL801tMFvm8klw+er2StdLawnSJ2J
 CETt8UEPty9IcvjgGpC5KP2T7w==
X-Received: by 2002:a62:78d0:: with SMTP id t199mr10333739pfc.77.1592628774834; 
 Fri, 19 Jun 2020 21:52:54 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id a17sm7288029pfi.203.2020.06.19.21.52.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 21:52:54 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Remove dead code relating to SABA and UABA
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200619171547.29780-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9f9d22b9-da79-9d93-106f-d951b5ddea80@linaro.org>
Date: Fri, 19 Jun 2020 21:52:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200619171547.29780-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: qdnZUPbXJvI5

On 6/19/20 10:15 AM, Peter Maydell wrote:
> In commit cfdb2c0c95ae9205b0 ("target/arm: Vectorize SABA/UABA") we
> replaced the old handling of SABA/UABA with a vectorized implementation
> which returns early rather than falling into the loop-ever-elements
> code. We forgot to delete the part of the old looping code that
> did the accumulate step, and Coverity correctly warns (CID 1428955)
> that this code is now dead. Delete it.
> 
> Fixes: cfdb2c0c95ae9205b0
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-a64.c | 12 ------------
>  1 file changed, 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

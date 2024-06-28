Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp214205njm;
        Fri, 28 Jun 2024 09:14:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXtEVwLjleNIDC+6hFDNWzGhL+y5LaTYShG38gTtOhECCg6ljG6RT6xfaJNe0rSAgu/Hu8k/R3vJTUY6IxbAOlIWQg9Xz9V
X-Google-Smtp-Source: AGHT+IGIpSIXPjfau7sNtmpab8xt/TYAE05eV1UMRiTSBHdZeqKkYy0x1XYFtp9kc5TVA2rv1hYv
X-Received: by 2002:a05:6214:1d26:b0:6b2:a333:2a9f with SMTP id 6a1803df08f44-6b5a5452d04mr32154506d6.23.1719591278078;
        Fri, 28 Jun 2024 09:14:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719591278; cv=none;
        d=google.com; s=arc-20160816;
        b=Q6tHk72j1wWqoUaa15pBaCpYGVzrYBpE9ci+NMRT+y35sOSmMAhmoArWW7RdttCN80
         MDx1UhcwIkI//TVB4++oSlVYucG45wY7Gib2yKzAakS0KnhnXVDvuIUgX8SKI0B/LNi7
         XnPd9R5LKcGsQuoGGnzX6CYsW0QrcYQMEbHN6++z90Zw8D3VWYErsdN6K30OQ44EZu8R
         IYYydw+w08or1QFv8wmFzeXXj2xwfLOaE9kGHms4nPPS8VeyhvniLg2dQEesrgWltL0X
         KZo7PAGbAcs4saPXzHU9JJwxSPDzOFh8BB+CBmjX6BHuPt2iqLWeWU150cDN2NylPaWM
         /b6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=QZP8kctCzPqb+XVusCA+TZZDfcfOZKoPaur+h5nqVhU=;
        fh=BBAE/pCwYeSTDfULazepQyrMgQKEt7iRb2jlugSW6KQ=;
        b=U5KljkOdg4yCAE9UEfmBz6LXUDSWBChuHpGFsmVe2GXOYZEVSCtpla7CNW3cfU+4P5
         MJINCPEmkWYtGSQ6zGYjWZ/LoX383YkeOGXFkmfxELBxLqMOymGZdwwgRiwGCUQVaVA1
         9PQyTTzIdz1NQh45ZcC7K3C978st0wTfvcpwaf4CKgesA5YqFon0mPCVB5MalR0xPHed
         6qiSHQe67kwq2zBgH4aZMwmrpcc8wOrpBvG1COcnFYpPWcGq2oWD1o+bL+/K7aeiWq1t
         1jwQInjf2Q5BAd6Kr84uTTbwMktl/CBGZjTWqkfGvKuky/RYbuseiQIWuGhmycGW/TUe
         YFhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gnzxnABW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e5acc91si22021736d6.305.2024.06.28.09.14.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2024 09:14:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gnzxnABW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sNEF6-0004Y9-6C; Fri, 28 Jun 2024 12:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sNEF4-0004XD-Jc
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 12:14:30 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sNEF3-0003Uz-4D
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 12:14:30 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-706b53ee183so1400886b3a.1
 for <qemu-arm@nongnu.org>; Fri, 28 Jun 2024 09:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719591268; x=1720196068; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QZP8kctCzPqb+XVusCA+TZZDfcfOZKoPaur+h5nqVhU=;
 b=gnzxnABW/Y7hFg6+AlFs70dVzv3hGiG4SKW5rFHVCHMxJMrJO2IoCTpdJd1y0NJK0A
 Dr9qq4adBfARrTk2bmXXbGCkvhWYOCjkyk5VrVtuqc/6BmKk+0+oAAtCBZb/jUhb0jVe
 9nlfKgUa7rojndy4o4KAVshVPsl4l+6tFfks6g0cE+hEb5tVROS29894KasWes8MFfTQ
 C0aKg/UEtME00SoRvEksL2uaJ5Uo07RMtlSCkDmYoAs37uwn4CK+p4ypaVbVpXGCmoYk
 u4Nup/rOwtxm5MTlt3MHRAURshsCf6+4wLrUs+fYSGYbkrHjbf/xBfFQfEb/AC1YFyfJ
 TvtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719591268; x=1720196068;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QZP8kctCzPqb+XVusCA+TZZDfcfOZKoPaur+h5nqVhU=;
 b=lYsvHIX1uzTvPmQulGW55lcSI7APs9OigiUwSasDmf+pEmduWteoAEcM436trEYLRJ
 jXrcrfIiQyAGcqLfoYinQTNSNBJdOYl7rVnL94UUUSLemkgvch8qXxsLKp0Hgum95gij
 /YB89PeIjtZEU8zc2AKhzqSchvbwAWJSG1HPOfnlY36EUpTX76Ds7iJFUqIgnPlEAQkN
 ADmPecUrewlx2dSR7c4FjhDCdSNclNLRzZkG2g6GvLvW/NTB8K+NnrJFs6E7DOip+5DO
 Gb8Gg9vD9ncbztXo/IgRpY/p/UoUn/k/yH6jCuT9w4ta/S40dle+O6Jj8rLmK6CEy+zf
 TIwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZmLprTBWyIphi/KaERyal7AIx71v2E9rVJmzZi4BCTLHehdL+fRaOQs1ma9McSCr0PcHwxKK8wvGiWRMmQhbDBe9h
X-Gm-Message-State: AOJu0Yx0jWZPdtGOSEl7QIt8bbsS8nxmEvv9S5Z5DHDih6ASN1EiksXE
 FQpIY7odrQz8Pi+fFS2DAoHmNohfCaQOaqew04gpBJSVms8zH3u1IFALozKlKU8=
X-Received: by 2002:a05:6a20:7f93:b0:1b6:dd1e:da51 with SMTP id
 adf61e73a8af0-1bee495cdbfmr3596431637.21.1719591267468; 
 Fri, 28 Jun 2024 09:14:27 -0700 (PDT)
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70804a7e7c7sm1782397b3a.208.2024.06.28.09.14.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jun 2024 09:14:26 -0700 (PDT)
Message-ID: <f078e65c-7e77-469e-8643-033f81026bbc@linaro.org>
Date: Fri, 28 Jun 2024 09:14:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] target/arm: Allow FPCR bits that aren't in FPSCR
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240628142347.1283015-1-peter.maydell@linaro.org>
 <20240628142347.1283015-10-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240628142347.1283015-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: PuyYrvxSPIeh

On 6/28/24 07:23, Peter Maydell wrote:
> In order to allow FPCR bits that aren't in the FPSCR (like the new
> bits that are defined for FEAT_AFP), we need to make sure that writes
> to the FPSCR only write to the bits of FPCR that are architecturally
> mapped, and not the others.
> 
> Implement this with a new function vfp_set_fpcr_masked() which
> takes a mask of which bits to update.
> 
> (We could do the same for FPSR, but we leave that until we actually
> are likely to need it.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/vfp_helper.c | 54 ++++++++++++++++++++++++++---------------
>   1 file changed, 34 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

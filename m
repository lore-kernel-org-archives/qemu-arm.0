Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp74356lfc;
        Tue, 25 Aug 2020 11:14:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwE2aPsgADAUfeE2SVZRe293rdvd3bwrlFVZyu5pXxtQWSWypvqo4v58EBtVYCmkLUSPHeV
X-Received: by 2002:aa7:8f04:: with SMTP id x4mr9026793pfr.199.1598379267889;
        Tue, 25 Aug 2020 11:14:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598379267; cv=none;
        d=google.com; s=arc-20160816;
        b=hLEX/JF9B3sVvYfeKNhRBudPoKKcOtbRNEWEjXGW4tZUbhZWAjasmzKYlp2NFp3Vgs
         y+4DEn0bB2aytTMVrZaIfmMSvs2av1yT6SYAYV8yqy7GAvEdKX9X+9Y1/C5E/781ooVL
         SnQkrP3Mb7BBTSU3buf41F/ErS8Vr8ZCSPEXN0NrjiG4Gpl26TwKRE1vHtY+KcDJzqm8
         6xk8rjD3sJddmoI1lVTBGxTkWvSS+o1rUWCDptD2x0Kf8aRs+k/Zy6hSlXcQeOyVs4li
         TqqvGCqOGKfbr/3keBOUdDN9zfR7+l1eIkUVwFwLPJDbZrucU6HpsAV6y587RFlW7JGy
         dBWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=PxDrQLK7k7N4OKzB4Gfo/YC5NEnyiMSTznWDpyd82VY=;
        b=ULYcDUEk93js5BobM4JjTf+f/tCeKz7oO1J1ycXTg4YTbXUzRvN/v8GYE/ZeZNtlxH
         0HVahENysDOTKNgFYYo9MADZAe4dzBMAWlt6S7X7qdcxNGAitp4DsjjmDU1tPAI6LzW8
         BMvDqhnGnu9SzYRdmFMAAyvG85Zo/a6/wNQGgrboxOzm5M3RaIUhwoyH+qtD9rXQ3yCr
         GNiVgCPT3W/3EiMx/s0tDGLyzxb0V5Kl0sfX0tcQeqUggmW1IXTUePfhCKJRWxBpVUo2
         9pExv7rshAn5gzmcmGygPp2QRLL/N2IAL9Vp8QT13zu1nUhK/STKVl+o7n1sOzRGZ0k5
         CBKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q5MP74EL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bk3si2505405pjb.97.2020.08.25.11.14.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 11:14:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q5MP74EL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAdSj-0001qj-NH
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 14:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdSb-0001qY-9N
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 14:14:17 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:38388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdSZ-0005hZ-El
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 14:14:16 -0400
Received: by mail-pf1-x443.google.com with SMTP id d22so7982403pfn.5
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2020 11:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=PxDrQLK7k7N4OKzB4Gfo/YC5NEnyiMSTznWDpyd82VY=;
 b=q5MP74ELhOayaiT5nKh2mKeey9pV0QscKq668cw48cZ+PiPGZ0mLL85K0BLkE6ZQGY
 q7DjenlZ/tHZuZpH6pYNvGVY2hL2j39As1H9h5j6ku+bjNAvGqvV3jQilM4g4MElSTcw
 ftuq/BMUkn9NxHIbzmU3ygxXuusW2owW+4miG3iWgTN/aOjseyeyhtYHPgRrNTE1CZ/t
 hlVzjzejEMvyi32sQ22DFWGJDdDxlWjSPYoXnXJJsze7bdm98yJERPMD+2tS/6UsGtwK
 WcMH6apnbyv0ypGamzp7LD71uriSht0ujpwSDpaUvNq3YCoasLcYA0aEOAbNimsJPlEI
 NRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PxDrQLK7k7N4OKzB4Gfo/YC5NEnyiMSTznWDpyd82VY=;
 b=Ekmq2O+dPOs7zDX2p86BaszSvZAhfGdVrCx+xWgppM+MpxricjG1k5+qj8G7bK6vfQ
 Z4g12sxGUSTuWnrhPSNcdcCqyVm55mOuIDP8Q8sS+qHzTFHvRRzvv45xEDTnL16I9c1v
 9wuuEP4dkJRMw9LuN1VDkSVaeagju/Jid1LqFKgaP+o9dGM7LhxREhwg+Oa5Dq/pW0QG
 M/U8yM9xCmgGl4YybRLZ3rMOyxIkToMHdabxlh3PTgSR0oeV0VONseNtIV8iBWi53ka3
 1A/rf9ZI15R/FTgd0VzA+g8VXxDas+8eJ7w970v3ODQivfyJpIwFYZjYbvvu9iBqK7nb
 31OA==
X-Gm-Message-State: AOAM531VSE7x4quRQ0g2FqjpXRDoeilqhjoXl9u579L0pNPQbyGr/D0q
 WSo93hhWEj9tPcYnS6rGbuyEeQ==
X-Received: by 2002:a63:593:: with SMTP id 141mr6265680pgf.302.1598379253763; 
 Tue, 25 Aug 2020 11:14:13 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id p20sm2151106pfn.130.2020.08.25.11.14.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 11:14:12 -0700 (PDT)
Subject: Re: [PATCH 03/22] target/arm: Implement VFP fp16 for VFP_BINOP
 operations
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200824142934.20850-1-peter.maydell@linaro.org>
 <20200824142934.20850-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6dee2bdb-f585-ffec-e57f-47517e278baa@linaro.org>
Date: Tue, 25 Aug 2020 11:14:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824142934.20850-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.602,
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
X-TUID: kecFMuNiQ9V1

On 8/24/20 7:29 AM, Peter Maydell wrote:
> +DEF_HELPER_3(vfp_addh, f32, f32, f32, ptr)

We do have an f16 entry in helper-head.h, for documentation purposes.  It
expands to the same uint32_t, so it doesn't make any practical difference.


> +float32 VFP_HELPER(name, h)(float32 a, float32 b, void *fpstp) \

And here it would be better to use uint32_t explicitly, because we're
definitely not returning float32.

I guess you could see if dh_ctype_f16 works here?  But that looks a bit ugly to
me.  Perhaps we should have introduced a better typedef somewhere...

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

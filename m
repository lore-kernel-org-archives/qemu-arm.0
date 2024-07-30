Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2198227njb;
        Tue, 30 Jul 2024 00:03:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUGNwSHk8qLDI8K6b2rqYgZVc3jH9mYpTvrsrBINA5sGpbnwNCuA7QeOHHEdWyTEM9PGzL/CfcPfPDexhj32KSEanfq2+Wk
X-Google-Smtp-Source: AGHT+IFCy97uEdwxKpE6+FuXU9v0G4VZQIlanGuRJfgTVkW7L+0srpFXmsFuz9Hvg6LeLLKKZ2gr
X-Received: by 2002:a05:622a:178a:b0:44f:a273:1e77 with SMTP id d75a77b69052e-45004f3da10mr128738761cf.45.1722323019723;
        Tue, 30 Jul 2024 00:03:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722323019; cv=none;
        d=google.com; s=arc-20160816;
        b=c5ShKKoOui1/S63PF+Pd0qqbG41ba24c/IE+eGrl86oKsGWQRWZh4x6gvk9BYwHYvV
         Da4g4XUAWV9L4hc0bN9U9xU0gUhz98USioeIFGpHeTKmmJMDyjLVrX00YD3N9gYGxSie
         MEGxpbD7VjMFYPVZUZHsrDNFuw3qYtYb0Lxkz2NDi2fPgad4tlIqNaJyyNkXcx1oTJdY
         THjRdzdQg5JgavA0C2sf54jtKgBwcrQVYRY1v8UrZThShKinJNouZff88VqxhEvoOBpH
         jd8xpCx2THBIwIKcZ2BoBSOLHnI76lRxve60b9a4JvNRSd3wVnTuf1t6wVmG2WwP6+A4
         thXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=5GFY/lfUyAuH5OvgunWn9+ug2c6lDtS9cdsH64QGOq8=;
        fh=1dJPZ2bgfClRK4pEd3GrJkjpl4u8ePcBtjOTg03Den0=;
        b=dUuvFodvEcCaFUQjz6pPFtOCWbZXWwlPqUR5LQtU6A9aYC9RemXVGr5nFtjs/Y4gQD
         s60AzRXS+p8IMpyiLM2BZeR6U2s22NouTrL8wwQkg+dXycVZoHf9DfFTWExgrQEhEtiX
         u7WTW7WFAkWivCVKodU3UlUaJnz1n+3aL+Y5nmiKUIC6V/+pm8p1WCNA9/tyqyotIHrQ
         xG57otOewdW72unUR+mriIByNJEMm0gsPzYePcBwvKWB4bEYWaq7+eePOxu2Q/LEZAAB
         a3aZgGNOFhtNd80guV+xg0SDpVfqKsSolDSNdA176bGxZJEgQVRXCiooUK3YSNQTEEgp
         IjQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PTdHpdvt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe8136c56si121412301cf.77.2024.07.30.00.03.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 00:03:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PTdHpdvt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sYgt5-0002N3-ML; Tue, 30 Jul 2024 03:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sYgt3-0002L8-21
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 03:03:09 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sYgt1-0006yX-4U
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 03:03:08 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-428163f7635so22230755e9.2
 for <qemu-arm@nongnu.org>; Tue, 30 Jul 2024 00:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722322985; x=1722927785; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5GFY/lfUyAuH5OvgunWn9+ug2c6lDtS9cdsH64QGOq8=;
 b=PTdHpdvtkmRRVHUH8QomnHhkBo0iYmiIXqwd1FVnLL6WbbQfgmCvQTQWa4weP7hRsv
 xASUfyNw3jZ0xPTDBYdCFHByjpnKcS9m3DqJyxUHG4pttkBvwm//qmkUwkcbSLDIcftK
 4/tVmlwF5jZ5sX32sGrHV9FYpkdt5/vV9yfw6BQAT8Rlu7qtGam6e0lI+uCCA8Ds9dtC
 EttAQEK+CCIluZoLrtFVr25EuWJD8OGqxcOObwJgiFORSj2rOlLT8Lt0UVXfPnFlqF+G
 uKAoxpmCLn+/soeGwSCszMskbFeTrn1d8VRbpPgZ6jXAgb5Xu6EQo2cY6URCXuaIOs5B
 QbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722322985; x=1722927785;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5GFY/lfUyAuH5OvgunWn9+ug2c6lDtS9cdsH64QGOq8=;
 b=R7BQvhNXlIzjdIRTsI35NmqQC55QTlwpnEiIK3ICOmQqs3mHE4gUoOkB83oiNPBUP+
 /6b94ML1wWWIbP3IsCYMKqltVlbQGR5VpJtdTHfG6L3VGAhgR5n+NYxX5EESdbSYcjV3
 fuxfdS0WR/Mtd5PkoT6aeyj03chC5o86xbrYif+nSrMR9vyyM5BiTIFlES9GLnsiMRVz
 ty2qo2otBXVPoYqYbjiwioXidFtqPPe3DkU0nLZjlqRQIYYIikuz1T2UlERRLc8HOQ25
 KsQ+ScuKBK7GmpxIxb+ad0TTeHXgyOrpkULUpRvwqRdWTmomFXWt1rZq7yKFae3hqNbE
 8LaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTmhJcFdJi14bSomSB/VKNdD2u+NDAs7lqPgLTx6QCm/iHU/ACVKdLrsBJKrx59HewHpOvRbiUS9MEQ5nqaBDBn2t3
X-Gm-Message-State: AOJu0Yxotu2+m3ToogRLmX6EPGvK8Rg+slrsQoj6IgdFWUAE2CwWvppD
 l17UKdG4Vz0vfaFP0Toqu3VZM4IIAabqrmHZpMRLZbQcLMrip0XnSJmW9Z/tZgI=
X-Received: by 2002:a05:600c:154b:b0:428:1090:cfd4 with SMTP id
 5b1f17b1804b1-42811df08a0mr67088045e9.33.1722322984970; 
 Tue, 30 Jul 2024 00:03:04 -0700 (PDT)
Received: from [192.168.38.175] (82.red-88-28-10.dynamicip.rima-tde.net.
 [88.28.10.82]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42809e4423dsm168545885e9.13.2024.07.30.00.03.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 00:03:04 -0700 (PDT)
Message-ID: <d5baccc9-183f-4ce8-9f1e-d7fae5d59870@linaro.org>
Date: Tue, 30 Jul 2024 09:03:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hw/misc/aspeed_hace: Fix SG Accumulative hashing
To: Alejandro Zeise <alejandro.zeise@seagate.com>, qemu-arm@nongnu.org,
 John Wang <wangzq.jn@gmail.com>
Cc: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 berrange@redhat.com
References: <20240729190035.3419649-1-alejandro.zeise@seagate.com>
 <20240729190035.3419649-3-alejandro.zeise@seagate.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240729190035.3419649-3-alejandro.zeise@seagate.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: 9v3iEBDYHDCN

Hi Alejandro,

On 29/7/24 21:00, Alejandro Zeise wrote:
> Make the Aspeed HACE module use the new qcrypto accumulative hashing functions
> when in scatter-gather accumulative mode. A hash context will maintain a
> "running-hash" as each scatter-gather chunk is received.
> 
> Previously each scatter-gather "chunk" was cached
> so the hash could be computed once the final chunk was received.
> However, the cache was a shallow copy, so once the guest overwrote the
> memory provided to HACE the final hash would not be correct.
> 
> Possibly related to: https://gitlab.com/qemu-project/qemu/-/issues/1121

Likely, Cc'ing John.

Reported-by: John Wang <wangzq.jn@gmail.com>

> Buglink: https://github.com/openbmc/qemu/issues/36
> 
> Signed-off-by: Alejandro Zeise <alejandro.zeise@seagate.com>
> ---
>   hw/misc/aspeed_hace.c         | 91 ++++++++++++++++++-----------------
>   include/hw/misc/aspeed_hace.h |  4 ++
>   2 files changed, 51 insertions(+), 44 deletions(-)


> @@ -252,20 +228,42 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,


> -    if (niov) {
> -        i = niov;
> -    }
> +    if (acc_mode) {
> +        if (s->qcrypto_hash_context == NULL &&
> +            qcrypto_hash_accumulate_new_ctx(algo, &s->qcrypto_hash_context, NULL)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: qcrypto failed to create hash context\n",
> +                          __func__);
> +            return;
> +        }

Using a instance_init() handler, ...

> @@ -397,6 +395,11 @@ static void aspeed_hace_reset(DeviceState *dev)
>   {
>       struct AspeedHACEState *s = ASPEED_HACE(dev);
>   
> +    if (s->qcrypto_hash_context != NULL) {
> +        qcrypto_hash_accumulate_free_ctx(s->qcrypto_hash_context, NULL);
> +        s->qcrypto_hash_context = NULL;
> +    }

... and instance_finalize() could simplify a bit.

Regards,

Phil.


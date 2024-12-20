Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp2263374njk;
        Fri, 20 Dec 2024 02:45:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV+Frx29AHx6jH/j/HNdPkpUGbq0vuYjuHegs3nLMG2NEMA0LIKR0WdrU2kNZL4ox3s3xrFr/hLYIcXbg==@linaro.org
X-Google-Smtp-Source: AGHT+IGLIIsAmH3tqIZjrHtkMlp6f1ttRxVbcRVo9O9/ZE4C1DxGIB1h/a4oZ4prJX9iJ39XjzFq
X-Received: by 2002:a05:6214:124c:b0:6d8:b2f2:bcb8 with SMTP id 6a1803df08f44-6dd233207b0mr34900496d6.8.1734691541231;
        Fri, 20 Dec 2024 02:45:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734691541; cv=none;
        d=google.com; s=arc-20240605;
        b=PefT1Prd+3vibVFqDdbYEUBuBNlwfzCHbDpmbWneEa0G3K+OtUI0/OBuCCjiIyNzXn
         /K6WrHAOWjhhDymvcOyaVeKmYtu0FPK3zDE2S0jVDJowmjT85ey+La+KkSSOZ1vreUpG
         rlQ090bEnTLVDv9XjJUaLzdEfR1yimXbFXh+WcPsfvpLkZqVyIwgMECxnL5K1pSdeIsl
         dJVOolbI0QLvoY+QVcKzqaV2YKnH9XYk3UcDOpUpC6UNsjI6iRkHeS02c7L3q7pg15Xi
         aF9+qovmLLYAUS2PSezpot8Od/zRGKjqWbHymvdJUp0WVI1W11BjqMN3TGqoEqEsAAlN
         K/Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ByA+t6wtE4y6Ap+K/de248nOE77Dr9SDbhFGzaHg81Q=;
        fh=A8nO7a0tBUhLGi+NEswzYxbY1HHEWKlCzQLgN/KLBsI=;
        b=fimwzPkes1XNt+GMGO4kEa/JtVJJdijnqlNBaKnFV5avXX4bkAAnnn1tSqWcO2vAfD
         qSt1SxNuydXh+dZXmx1jCt9kUsV5mBP9OsB6L8cDfDJfTLYVDm2nfvH6H4Ixdk5Z1LPK
         PqPH8+3gzjtN6RI0Ooh+6w2Xj6GxMXNIvKG/i9310DWz46CwgXyGCRnkErTKWgQrnEuY
         L+LS8rXifKiEqU+xwmfetUvO+35eJN3EXpQ8mfgdniIfqdJqOZcbl8PIX19z36dY2BJ/
         jzHjrkVOumpBTBbc6dAYWoyFtUZg0BYr1QgGtAYEiNR7MA2beNi0b6hwTlkD9OzSlrxc
         LsPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w5WSWvZF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dd1823379fsi40389836d6.264.2024.12.20.02.45.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Dec 2024 02:45:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w5WSWvZF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tOaVa-0002AF-H4; Fri, 20 Dec 2024 05:45:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tOaVC-0001pM-R3
 for qemu-arm@nongnu.org; Fri, 20 Dec 2024 05:45:08 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tOaVA-0005sp-0Z
 for qemu-arm@nongnu.org; Fri, 20 Dec 2024 05:45:01 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43621d27adeso12000045e9.2
 for <qemu-arm@nongnu.org>; Fri, 20 Dec 2024 02:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734691498; x=1735296298; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ByA+t6wtE4y6Ap+K/de248nOE77Dr9SDbhFGzaHg81Q=;
 b=w5WSWvZFe3W/eqcx8aS5ZTSsidhPmgEIEawEwtpSG1j/+ps0i+tGpPh/NznfVCypQx
 0H7GM54yuxf3K7qiF2Q/ySqSp/0XgCXg3gf67GXDo8kMmTPcqFvAwb0pM6wPE243Xj63
 2epyoBbGizOpkBd7fJ+PEJ3rm+DEQEeJl4jcJ9MJcU2F0WmatFwcIJswCrUqJPXhEdqJ
 on6EuyMwSPyt+m+60YZrDsEO+7mnADU531da0bqvteW56/NjVjyejqvXicpQ9JT552iN
 zd6bBia3JAiX05vyyJY/syem+Ld01mLy3hMaG59XfooIO6IITmUEMeXSH/ES2vPg2yvm
 JoVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734691498; x=1735296298;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ByA+t6wtE4y6Ap+K/de248nOE77Dr9SDbhFGzaHg81Q=;
 b=CXoh0Dhs6akyFWh3jNCJM5KGU5apjIdfzirWPV1bPMpftPjJGWzs8ZdPSHlYSJSAqh
 +sSIz6qDYY8rIVdsPsG5CkVsf3DjbnqxSmanUO43BCbU0Jnqd1Oqdwb31az1wyljpcMT
 hLHyZ+QIt6rXD9/vxuuvVFveuwd8FMe0fCVEJCMJBQ4nO6dSpmxFbYUob2AHU7JnThI3
 gHGE+YwXp60kfrUYNt4OimW9ePfbMdCIaKX1cNjmx951u8BMjeRSAODow3Poc9nWzCAF
 yJlzup5N7vtA189xULGEDqFR5/YVbVBSW8t5vOvK3KDbCU0mUf8crjXpdK2faeR80pi+
 a+Zw==
X-Gm-Message-State: AOJu0YwGwCp34+RHx5WMwGwBaj3Z162fU8WgnSLqTQS8pw5ti8nq7dH4
 5bI+mdEtIcu6r41vKSAXxTPzfZwEivVuY5iMdGyeUZNEXIuBdkMl9WknAAMehQo=
X-Gm-Gg: ASbGncstiawNZTLuzgtJGYQK9IovKw6jE+8wQ3sX0JI5dVsCRDMoCZBbdLq1Q3Z2pGu
 lmFzffthCjKngMUOx3GOM2eEqEisdgH39b5dq8fuZE8jYEn1+hSKAc2N/mUTkrbCSTgNCblZOoQ
 HtXF4AsjA13EeoABF+ro8V16nOeNEQ0OaI9FwmiQu3rqgGBLZPeOmj4lIx5V9JRZGJyQt/M4Z7D
 IVgl0KGrd5YHgnYqLomounLwrm3kUjipf5WXvXgrIoiciVnVju36KgU+TtUeVm/pPrWatA=
X-Received: by 2002:a05:600c:1c0b:b0:435:9ed3:5688 with SMTP id
 5b1f17b1804b1-43668646750mr21065475e9.18.1734691498179; 
 Fri, 20 Dec 2024 02:44:58 -0800 (PST)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b3b1f6sm77453515e9.31.2024.12.20.02.44.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Dec 2024 02:44:57 -0800 (PST)
Message-ID: <07199b31-d791-48f1-b5f9-021cee8e2101@linaro.org>
Date: Fri, 20 Dec 2024 11:44:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm_sysctl: fix extraxting 31th bit of val
To: Anastasia Belova <abelova@astralinux.ru>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
References: <20241220103320.83385-1-abelova@astralinux.ru>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241220103320.83385-1-abelova@astralinux.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: Gipe3/69qaIC

On 20/12/24 11:33, Anastasia Belova wrote:
> 1 << 31 is casted to uint64_t while bitwise and with val.
> So this value may become 0xffffffff80000000 but only
> 31th "start" bit is required.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
> ---
>   hw/misc/arm_sysctl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/misc/arm_sysctl.c b/hw/misc/arm_sysctl.c
> index 69e379fa10..ce8be44b6e 100644
> --- a/hw/misc/arm_sysctl.c
> +++ b/hw/misc/arm_sysctl.c
> @@ -520,7 +520,7 @@ static void arm_sysctl_write(void *opaque, hwaddr offset,
>            * as zero.
>            */
>           s->sys_cfgctrl = val & ~((3 << 18) | (1 << 31));
> -        if (val & (1 << 31)) {
> +        if (val & (1ULL << 31)) {

Alternatively clearer using the bitfield extract() API ...:

            if (extract64(val, 31, 1)) {

>               /* Start bit set -- actually do something */
>               unsigned int dcc = extract32(s->sys_cfgctrl, 26, 4);
>               unsigned int function = extract32(s->sys_cfgctrl, 20, 6);

... which we already use in this file   ^^^^^^^.

Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2164586njb;
        Mon, 7 Oct 2024 12:56:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXM1YPQbjgvJqRrhRsqJnoqmf7RYpLK+24O22Irmp/IsgIEEp5XcQspDRFJj4hdSfbbOcjN9Q3UZtgjUQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEzWMdU1O/gUqE08Ki7qm9IPF0xNoKs0KgMoYQDsJN96dJikorRZWDVN+pvPJTAWru8LAGO
X-Received: by 2002:a05:620a:2806:b0:7ac:a0a5:9be6 with SMTP id af79cd13be357-7ae6f43a940mr2182859285a.19.1728330999496;
        Mon, 07 Oct 2024 12:56:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728330999; cv=none;
        d=google.com; s=arc-20240605;
        b=kcPslL/XyXLQlR9UdHlmSCmoYyp06e3Iinf7rgHMtW10ntK1j2uaE2dwgmj0edr1dF
         IxOtBw5tP18cQo2gme3JJldjqx+W2FdtQjtL0DcvkBYb5GTh2T+DsvGw/jYf5CHyXvY+
         saocRVLup7If2iIT11Cmy1b+p2wYbhsBGF7afQKWK5COScEqa/rh4htS+d6MnUn9VuL9
         1OJFywyziKsRDw0S36omxks6JJ6zzTyl2AG86jnv2WAZpaBoZEwDMiZI8PAT73NZYJVX
         ik/OecCHzEXEya6BWKCzI2K9A56+d2mKhb9b12AfFiosLYgwgnxMVUEriXbuELtsgTm0
         WQ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=GSxqW0uHxp+sUL9P9ODmytM1onOws+nrF3B0SCf/b5c=;
        fh=R45dBIBi+o2bO1MsNv0/Gsn7a3hVqThmH3T8YTnHbPM=;
        b=IRYUEmGYxRfKkqQEiVfpj1JneCeWnlS8DdLHFunPwkClW4cWRBdq82Js7kjpgx1lNw
         6UTysBXjb7FjFTCsLBhukyefV8rFzQPDo/ZTCMs/MpQsG1LZlv0oFo4EXx5IMeGttXjP
         3WijnfgAw7arPK9i7jQSLdcaYox9sfLQooc3xPBoKCZukPxmf3tKHn72AS/cSXM0VQZA
         ehXcEaDIHv5pCHCbfep8nj3avqgFAUTODE+Sq4ZG1cKggzRc7o/S2pzWYGCB0XjDveL1
         7Bn+AFz7v4LzhSIdMyf3QkyPsGa4E/leRQzOBWHp2sRFB04cM85ibN8skgBJgzprsbIl
         8QeQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H7lRvVfM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45da75e4196si73575151cf.297.2024.10.07.12.56.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2024 12:56:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H7lRvVfM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sxtqC-0003El-HH; Mon, 07 Oct 2024 15:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sxtq6-0003EB-3l
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 15:56:18 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sxtpx-0008QA-7I
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 15:56:13 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-7ea12e0dc7aso794433a12.3
 for <qemu-arm@nongnu.org>; Mon, 07 Oct 2024 12:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728330967; x=1728935767; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GSxqW0uHxp+sUL9P9ODmytM1onOws+nrF3B0SCf/b5c=;
 b=H7lRvVfMCm1ymvsjeQy+xb2M4zNnSNJ6xgMYKZRihql+Y/G/6KDsUpr1RPywLSDOGH
 PaxKcFGWRnMnWHG6hIdJ2PrNfx9o+2SC7EmRDDxh+22DiHEBBCUyz6Ncq90DkD4N+kpg
 CGopWqVdjsgtriqnUOE3iRoSUriTNdk//6/wDOH9zPYvyDPdjhlQJtVngou+2o8pMBYN
 cIMTbFJ+Ts4Mv6hf0ejwbjLcw2rUa78ECZyA1+Saj8aRy6GwPTeqbsGSfbMSry4zI9BK
 9AYVgG+PFJOtsW3EMZfi3Yv5RNPAFKSomtnLWQJi9ECXVqeexOWBwVw6pjMpehUebIFn
 SweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728330967; x=1728935767;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GSxqW0uHxp+sUL9P9ODmytM1onOws+nrF3B0SCf/b5c=;
 b=WjNt0UoCt3olORT9CDn96+5Kjd8/az9m/jt6MohtMOgvz6WUIt9VvYhOEjgZyAxBgJ
 SBXKOYigLhM82s0fmqk9Dhxei1RVBuyF2oBZvQIMS+crnKw1r8bzDxEw4rRytqEPcT4/
 7f/znWUV5tyen6FgkZUGE5tfYMwTy52dUr99B+UTwWMFDrQw621wcU9kuiPR6CcyfRaP
 5NO7I56sqjVct9nKIBBpSWDie3C74Ua9aeRcjFAy7QhpNqkZSaHgjhWNb8YyV8OCUulK
 42WFF2REP7P6qCX3JheLMVrriQ+M9w+s8uGblmJ0W53Fuwsl9a/aRFiH6XP74UYwHJkO
 EEBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWPssNVMGefQ6xOEkkW30PU4bxXshc8L4Z/FXNJtXLBgx0MSudX5+DXx3lI0/baTTiw/LBo44WpA==@nongnu.org
X-Gm-Message-State: AOJu0Yzs2ZpHX2Y3RnYDd0a8kzK9ce8nKsH0XO5GjhZolx1dol8QOGNV
 MIBEafFRAxhbm54pXVH1I/euQiho4jHka8PENyX6O9yxsC/oerMJYe5+jwD/oic=
X-Received: by 2002:a17:903:18a:b0:20b:7d09:8c86 with SMTP id
 d9443c01a7336-20bfe49666fmr217491655ad.38.1728330967028; 
 Mon, 07 Oct 2024 12:56:07 -0700 (PDT)
Received: from [192.168.100.35] ([45.176.88.163])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7e9f681fe06sm5352518a12.20.2024.10.07.12.56.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 12:56:06 -0700 (PDT)
Message-ID: <436ab3ab-4b07-4bfb-88aa-4c9b2c2ec6c1@linaro.org>
Date: Mon, 7 Oct 2024 16:56:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/char/pl011: Use correct masks for IBRD and FBRD
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Zheyu Ma <zheyuma97@gmail.com>, qemu-stable@nongnu.org
References: <20241007144732.2491331-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241007144732.2491331-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: xOg/8G0lay94

On 7/10/24 11:47, Peter Maydell wrote:
> In commit b88cfee90268cad we defined masks for the IBRD and FBRD
> integer and fractional baud rate divider registers, to prevent the
> guest from writing invalid values which could cause division-by-zero.
> Unfortunately we got the mask values the wrong way around: the FBRD
> register is six bits and the IBRD register is 16 bits, not
> vice-versa.

Oops indeed, I didn't check this closely enough.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> You would only run into this bug if you programmed the UART to a baud
> rate of less than 9600, because for 9600 baud and above the IBRD
> value will fit into 6 bits, as per the table in
>   https://developer.arm.com/documentation/ddi0183/g/programmers-model/register-descriptions/fractional-baud-rate-register--uartfbrd
> 
> The only visible effects would be that the value read back from
> the register by the guest would be truncated, and we would
> print an incorrect baud rate in the debug logs.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: b88cfee90268 ("hw/char/pl011: Avoid division-by-zero in pl011_get_baudrate()")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2610
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/char/pl011.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)


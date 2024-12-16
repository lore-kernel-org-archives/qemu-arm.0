Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp2198905njb;
        Mon, 16 Dec 2024 06:11:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUEgCIA6N3EwsuQhsmOB5Ne/yYHqz4ztvqLp0eB1mBV4t63YHL27Ii7FPXV+YcndCHPdbn0sSB7jmjo3A==@linaro.org
X-Google-Smtp-Source: AGHT+IEjb7aWOV9tZYwzGOWnadNOSdkDAs/2IkqWQxpyTCK4WiZzHhmV4IgLIeOlFQzoiiJkahxW
X-Received: by 2002:a05:6102:441f:b0:4b2:5c1a:bb57 with SMTP id ada2fe7eead31-4b25db3c33fmr12191970137.20.1734358299354;
        Mon, 16 Dec 2024 06:11:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734358299; cv=none;
        d=google.com; s=arc-20240605;
        b=R54pTYVlyHBWE1gV5RY5KXAVHQtXYLnqPOBMqca8Lpv+ZfSdLMPGyNwiWXsVPzVpdA
         VB4GFMPkbNuDiqqItebYSukuWZm58Tph+cvZqo00YYbL79QkPAWqK62qSwQqfc3itJHj
         q/uftapaooSpjEH0dpthHANFlEDuG/g2fYFPQCSC/tArLJYuTQuFIGTfoRAZCxo9eH/L
         qc9VirolLNFTbvHeXYg1+9k8OLjJ0/AvAzt9sjYcAnzbM96sj91LqybuWpoMCfhlHaXY
         EBTOJnOlVCVKgl2rRKyeazvy7ZfK0TWODTTdStiuS0evjicfuWEgxLhqWm+WXvXFy/ro
         /aPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=dl7va4bMEy4UsAhgaxe/RmvDU+0cIOOibLwaTU5mkuQ=;
        fh=BGmGs93E9jzhKo0rG/DQtJEV88kgtC4mP1FDw3PrzQ8=;
        b=jmnNv9pGni7DNXwEEXmXh5Lookclh0yZs3Qt774pMxnM/juwRBs2gWjm94W06wCXrp
         076DWbHHSBUUVpjiDQTvPvpcgyXbQb0RmTvUAb9oYnJh89jj9gykrx09uQtLdfWJxF7f
         WDxZHcsilVcISkXECiRXzkEz68CenyuPpotroNDQl0460jNhBUqg6P5rEclWyi0M4UOf
         tTvDcaDlFsxwaFsNn2/9PMrPNgtM7f1jNNjrz8aygAhtNaVnWUQyVjpoKR29K3wNvnka
         3//ziIVcbiJZ8/0VeI8huxWQIWMvr4AO8vtUoVQLMbdSC7rSD97upmENPkXYF83K6ljc
         USXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ELGbGRMD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b270208a69si1221247137.99.2024.12.16.06.11.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2024 06:11:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ELGbGRMD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tNBoo-0001hV-Jn; Mon, 16 Dec 2024 09:11:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tNBoi-0001gy-K5
 for qemu-arm@nongnu.org; Mon, 16 Dec 2024 09:11:26 -0500
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tNBoc-0007fo-Tk
 for qemu-arm@nongnu.org; Mon, 16 Dec 2024 09:11:21 -0500
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-5f2e3f6180aso1706439eaf.2
 for <qemu-arm@nongnu.org>; Mon, 16 Dec 2024 06:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734358277; x=1734963077; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dl7va4bMEy4UsAhgaxe/RmvDU+0cIOOibLwaTU5mkuQ=;
 b=ELGbGRMDcW71p/Mf287zRKznnL8+/C2Ym6X8O2uj4lf1MBFO6RRxu2gY9htZfklTWX
 Ei5+becVzLWIPDCXdbNXN3EMmyNxF9J1xTDgOjK584cVCXSoBt+vMCpW7N5zRl1V3zgA
 fQAxkbQjZhvDR6gRxxyEzVOhZMlHtfAXITUBKas0C7GwM+nabxdDHN2raBIHwAZplCZX
 dLH2yrVuE3gXdis1UocMRnnTV36RX6pEkfaUa0WhsmaX2ReKL7Jgb5W1A80eWHJmkI5N
 htqi+t46BjzV/u4zFDXhe+1uN+VwZhlSDYk3CjE3MUJp/dxT26rbFIR+NLnJpsSIxypa
 HS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734358277; x=1734963077;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dl7va4bMEy4UsAhgaxe/RmvDU+0cIOOibLwaTU5mkuQ=;
 b=qQ8WqhDXiTR/ia1zzFlVkWSbj8+Cos+EniViS71yNinZfQsdTNsAtnDg3ePPfhBRth
 svKKff5vugeFzYj1dH6F/rAYq06VDVBqZE76O1coazZySSaoOPvFa11EL1TXRFrWRoJa
 vhCp9Ai5zARJskt3i/ECFPWnCzGGJ4l6gPip/np+vz5jbhGBCFfksGy9TTWswQrsEUFp
 RpZ4ByxWMleaAFnddCXslDpE9zdbs+CgUsJ5La3Uf7m/JU352QRhA2f9xiXS+cBnaRCF
 nJ6MzmOSnANfXxCkUwyUcVSp7B/UHx2ymtItbJqTJQrDguPfbS9hCAOV/62t6mtbwKdg
 zfWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVC+BSJ/MGIWjawFDhFyJD7yhuTB9zFQK4Eu5DOVn4/CZWex94hrZt3G5qjr6m/tSjQbSqVHXJyhA==@nongnu.org
X-Gm-Message-State: AOJu0YxjUh7+8w8PgOuDpWrzsqAibSftKoVXecyrOnNxcyqViOKLeWkg
 sj/gdLUchobCWIDaHav+a+enHW0Z8yw0WHJ+HS2Vn/UTek/0xpbZPPCVuCvoZgQ=
X-Gm-Gg: ASbGncuSYw5qZqILMDnVvJUbb7GHxfXkPjYB2fCTkjOX8zB8A8FwWFpsOKkxLszSPR6
 WNjF7ceQZRPhNN/ZIs4ioXGJ5wJzeN9DGvrUYjV58+G/YpJQz57BZXzKSk0/2df5KpMuXcagYAq
 Af4sr4ecZV5dHCcVUq/uLP0MjQwVY/4Gq3aSqOEfeo9APtRpW4Jqkh00Cj9nlJXBalNZYKK2QCU
 Z8umWUQq4yuLfdb/nCOJa9AOyxcgE2zlkUvnHHxmkab8iRtuhzRB5k+SQPUKqVo+Td9/OTEFRKK
 7SALBMQ5HkPsDlFxTMe1N7A5WHS7IwZUw98=
X-Received: by 2002:a05:6870:207:b0:29d:c709:a76c with SMTP id
 586e51a60fabf-2a3ac4a4ceemr5522285fac.4.1734358276846; 
 Mon, 16 Dec 2024 06:11:16 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2a3d29cd6dbsm1904042fac.45.2024.12.16.06.11.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 06:11:16 -0800 (PST)
Message-ID: <038d99ca-65f4-4a76-bb2b-409108b47ad7@linaro.org>
Date: Mon, 16 Dec 2024 08:11:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] target/arm: Helper type cleanups
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20241206031224.78525-1-richard.henderson@linaro.org>
 <CAFEAcA8-P=cmov6FNP1uhD3YRpZk8BB0tdrS_yx-5L18SX5y4g@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8-P=cmov6FNP1uhD3YRpZk8BB0tdrS_yx-5L18SX5y4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2e.google.com
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
X-TUID: id9qRLkDD/pv

On 12/16/24 08:01, Peter Maydell wrote:
> On Fri, 6 Dec 2024 at 03:13, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Add macros such that "fpst" can be used with DEF_HELPER to
>> indicate float_status* instead of "ptr" for void*.
>> In addition, fix a few uses of "ptr" that should be "env".
>>
>> r~
>>
>> Richard Henderson (9):
>>    target/arm: Introduce fpst alias for helper.h
>>    target/arm: Convert vfp_helper.c to fpst alias
>>    target/arm: Convert helper-a64.c to fpst alias
>>    target/arm: Convert vec_helper.c to fpst alias
>>    target/arm: Convert neon_helper.c to fpst alias
>>    target/arm: Convert sve_helper.c to fpst alias
>>    target/arm: Convert sme_helper.c to fpst alias
>>    target/arm: Convert vec_helper.c to use env alias
>>    target/arm: Convert neon_helper.c to use env alias
> 
> I see that commit a9af119f3d to put the fpst alias into
> helper-head.h.inc is already upstream, superseding patch
> 1 from this series, so I've queued the remaining patches
> 2..9 to target-arm.next.

Thanks!

r~

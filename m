Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2664540lfk;
        Tue, 6 Jul 2021 18:33:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvD3lKeSrp0hvuNyCREPBxc4K6QSg4yq3Bd2AhMb1wmHwzmpnIA3UHUQi7mAUcXfyHlquP
X-Received: by 2002:a1f:1487:: with SMTP id 129mr16591334vku.14.1625621592337;
        Tue, 06 Jul 2021 18:33:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625621592; cv=none;
        d=google.com; s=arc-20160816;
        b=f39T8T8LSHuP9j2WKcLCbjleeJw4TKxEVanJFP+GKzdu6UCHd6C77GaeAE+oYsp2hi
         NBc6trpHcZD7roZq5o3RmtFrRuDCDLmAYlzQd//rJUzNKoXnvAcORQ7VxBKMFhKriWjc
         CbkpZ9tsGPb7iOZKyDlHUO7VoyqUDqjbBYPycMjQMyOPN4T/vScqY/nuBsxaGXyM0qId
         IN3xU3N7YbAkED+HnGLx+IRMZ19Uw5AuD3Q0+2pNuk3LK5pvrgetM/cTpFqnpFo8amdZ
         dlTfDF0K7iZToEIdDrOHCgNe9skjUQijj2s5TwQe9fGe+tZA2frubA1SP4w8i/GG4yyM
         dVJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=5xe0rW2DfzVZcL35mReT6fuZ9hjF3alH87O+aqyNIac=;
        b=tiUko2FaaKiqkyakD3LQySotU68vZazRllj/qbnxitas0f3a2OQcGWFihNePf6TUQ6
         Pgj6I+wHaZd1yYH7Br+E5W/4ihKkvfiINp76wPX89IX2afau+UENsjnTYc9zeXxNtsv8
         JQjYKJq3aq9qegV2iz1MXHv+6x9HntV+A4JmluOA61upwB92bPvPm4bfB8YkyvM/pOir
         cEWFfc4ELUlKsZzEtV77AmSU8/88Xjz6iJESj5YyQyC2htWFXa9A/xojJeMGydZVgag/
         L+Nw0yBqhF3aGROzOfU2+fsQRxogpO6wEjnccV4+aT/xfqP6zuCIUYAwsf7yxqRu1xJu
         Brbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iMt06ui9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5si13186391uae.108.2021.07.06.18.33.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jul 2021 18:33:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iMt06ui9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0wR5-0005K5-MI
	for alex.bennee@linaro.org; Tue, 06 Jul 2021 21:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wQ4-00030i-Kj
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 21:32:10 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:41485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wQ2-00068K-2Y
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 21:32:08 -0400
Received: by mail-pf1-x42a.google.com with SMTP id f17so702973pfj.8
 for <qemu-arm@nongnu.org>; Tue, 06 Jul 2021 18:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5xe0rW2DfzVZcL35mReT6fuZ9hjF3alH87O+aqyNIac=;
 b=iMt06ui9DcEjW7w5zxzjBP8KKqcIMX+X+h24oykxw6xhyGH7Bvb4SXMqYaj3nIR9Tv
 gl/yBrJF9A1WTlInQOjxEGXC0iMJahrH7xfjW56Y47frz2Xri3b3Lv2hQikPUjUwIKgC
 kj+xgePqzBA31z6En5E4x42/6av++7ymGhCUryupBYjVsxoH6xRl+KdY2t0yrHMPspg+
 SH1nOfS54ObicTUi4NatcnWUfxlPeCxkr6G3enT3iD9jBo2C4vUAREmQfv05KG+nx+kA
 ucI2LOL3MOlBJmoN9X3ytZVR8hHM6Y5jHjVLsjLENlHB4hE8WfsdX8UPdA6GjK8+qfP0
 qz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5xe0rW2DfzVZcL35mReT6fuZ9hjF3alH87O+aqyNIac=;
 b=WtuDj26CyW7X0yEqvEoNvt5ORDkFMLMCF5n0rIdTrsaU36Q6C2sZxJWSgpG8mIqBgC
 QdumSF8rTpgEtgFKJldwfhDSJ0BImR5G6pV09LxP6NWZhMx9WwBbjrf9aDVkz17jV6sI
 KV/Gm3JWZ/BLttAi3X4hiakMt1YZDpqMbJADCrscxhKpPTGluHhFG4KyQfT8wC/w9z5g
 t7XkcoW/QtTEmmsfl7qfDa9Xi/eyrT1MH14vOzkdCSw4aPrroOZTCGotLonu2cLO+zxZ
 nTJjxvTei1nZcn+GPTv5VxNdVd1e9Wz8V/1hEuEQURKTp1zoK/9BFfSzji30Z1fHyzpE
 MUSA==
X-Gm-Message-State: AOAM5337x8Gh9s8r2ndgV/NkZZvza8XMpCMmiw/4ZSW4VztoI/BxFoue
 L1MAijNIDCg6dYUK8oWb6tas4w==
X-Received: by 2002:a63:ef4c:: with SMTP id c12mr23890728pgk.441.1625621524645; 
 Tue, 06 Jul 2021 18:32:04 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id q18sm20014397pgj.8.2021.07.06.18.32.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 18:32:04 -0700 (PDT)
Subject: Re: [PATCH 08/11] hw/arm/virt: Make PL061 GPIO lines pulled low, not
 high
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <30151204-d365-7c23-071f-b740b09d8b2f@linaro.org>
Date: Tue, 6 Jul 2021 18:32:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702104018.19881-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
X-TUID: 0OIhC9Yp3QtJ

On 7/2/21 3:40 AM, Peter Maydell wrote:
> For the virt board we have two PL061 devices -- one for NonSecure which
> is inputs only, and one for Secure which is outputs only. For the former,
> we don't care whether its outputs are pulled low or high when the line is
> configured as an input, because we don't connect them. For the latter,
> we do care, because we wire the lines up to the gpio-pwr device, which
> assumes that level 1 means "do the action" and 1 means "do nothing".
> For consistency in case we add more outputs in future, configure both
> PL061s to pull GPIO lines down to 0.
> 
> Reported-by: Maxim Uvarov<maxim.uvarov@linaro.org>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/virt.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

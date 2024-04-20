Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp3177915ejd;
        Sat, 20 Apr 2024 09:58:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVGk7cXUjvBmKyhc7HmfWIPJtUU6VqSL5UqPiP45ij2PaOPrOuEOl6e1Rqu1r5+y8lEQ73QEE4e1HYtsRDO9BV7vlKK4iAB
X-Google-Smtp-Source: AGHT+IEI7Izar0r0A4U52PIk5Ja3SG7uxI6OU1r726VV4nBLdgKLYkuKWHruhtuoR3uYAXCqPH/W
X-Received: by 2002:ac8:7d89:0:b0:437:5fd3:ed9e with SMTP id c9-20020ac87d89000000b004375fd3ed9emr8363992qtd.9.1713632328608;
        Sat, 20 Apr 2024 09:58:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713632328; cv=none;
        d=google.com; s=arc-20160816;
        b=bzY+2eeQWiiPHTMz8CoTOUrzkQhd1dla1WtyndCuXBiAJJyUQ1Zm2YE4SbFF0hjyTY
         WO/zRX6/qRM1ZcZCJCYlFN3tUN6LecDvQFxXYo0Zy4BWmmMEAiOi1gQdDXZjhhdiqOLS
         6Vv+QaRQxLlTPgTorPX96iB/nwZRiNl8+XqoeJ5dqf8Ki6ISoEfhtCfK1UDIHQhHbjoV
         EK9Ohy2JyXnkc5upQCA/tiS5vBxPK2z5z/3dsovybgziuos+QLDD8dtKky52oSFysu0+
         5VcsaOLd6znn0/uImQsp8fYz7DyzoaaOuQVglZNz8GlITJm6EzxbPr8CzkzovfFnNDaJ
         kxBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=B+QLyiCf+uFcHpkr5TTRwntyRa0C9XRuBropwkRW480=;
        fh=Z42cPULqWiNJ1bgmzUSHO9Kp/AAFcToFcAM45jDox0k=;
        b=lfwUx6M1QCYuAOgAyNmEmrJhaKv8+7zn1Bh2i0NNgDchhOz1S/4UzAetSu3DIuJBhk
         wycpu6CPKfBkI2Jc/lMh/Ue9/NVxwisp8WwMgk/T3gMsSPwmFMjgjdKv+Sah6ZjwxNeq
         H0K8Cwm/wb/1kAxARkZbWfrpBDw+3JmCY2ad9q4kBTy2ANy3nuPdbDKs8rmUR1zu1QNY
         Nd85ctNG0avfG479Xv2BRCaGuqZmSaSCEJJ6ZAUMQTuS6pIhiSuGPjPf/D7keNbccxCZ
         gmGamGX+AMH5SHcKD9U7Rd5d7j0VmELl3fPnvycs3cn5bJ0yVqG1qThORmL1Aqvja6YM
         hNRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QgxJztKZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay12-20020a05622a228c00b004347cb49429si6902205qtb.65.2024.04.20.09.58.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 Apr 2024 09:58:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QgxJztKZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ryE2g-0000c0-Qs; Sat, 20 Apr 2024 12:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ryE2f-0000bR-5F
 for qemu-arm@nongnu.org; Sat, 20 Apr 2024 12:58:21 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ryE2d-0006w6-Iz
 for qemu-arm@nongnu.org; Sat, 20 Apr 2024 12:58:20 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6edc61d0ff6so3069003b3a.2
 for <qemu-arm@nongnu.org>; Sat, 20 Apr 2024 09:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713632297; x=1714237097; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=B+QLyiCf+uFcHpkr5TTRwntyRa0C9XRuBropwkRW480=;
 b=QgxJztKZAfSogjKkO5EXi6SZdtyj6J8JudS4vV056zW0I+xOtEYsoutL21VATiOyL7
 IpkPNK5pjzBKbjoPQBf5z+LsNfgRhsOsDQ1+lITrbvDVCst6V/fcvk6DkOfdUALPOWgy
 UIBaBF9bZRf7TvqwuPUQo1ZcoMXJTKioniGjCMAU8yAIWugLBTpnuwblv6FDeQ9jxGml
 8sXbPQl40gn2hAk8d4mTpzDJw3zVaBRcpsLObkLtxpdKMMaXdjnzCjHhCoDPiunxfYF8
 YhMZthaMCCTx8O6wdtglC6f1MXY7y18aFcenoIbMJUI9cHlpjXSABZwfiNe02EkE/G4s
 BXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713632297; x=1714237097;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B+QLyiCf+uFcHpkr5TTRwntyRa0C9XRuBropwkRW480=;
 b=HzNIbc/2/lSYrDPWDeBaKnFYpENum9s1GquEUGtwSvrZI/9XlHchD32qe01thn+Xv3
 fZVJqVe00CnaoDyvKE8pkq9yO2ufvUqTuDnvK2K4/3OWm4zTWnpXD2z6NbGeu/MSyc99
 7ZjmEQM+ClDf9+vuogSuqN2K2pXCPrzLii5Ejq9fY2+AgO/f42G716XOWdUBdjvGb6zN
 vwTg5NId7CPnAvz8cg2djxhreVfwBCrro5U/Cy7npt9FCZlfL6pPHmhiSAO+VOLTuvP7
 GFhuuS9hRjU/2dvJcXYFpVi7OHrz5WFpBDQHQlBuXIyLQKaebOIg3LpKB13lUHfmWxAm
 Zy3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgMAd2XsfB/0dvwZSYK3apxWHXEqLYWy1fRz9ypPXj6iqzscdLi4VeV/X6UuV2+rxtSBm0GJ5WPHj5JsPoX6EwsYAe
X-Gm-Message-State: AOJu0YzXVrKduejcqeWDI0ntNlXddUMpQ2tenjb5SzrRoCBSKFNUVTEs
 HvoBlugjZC4BD/tams6NI8UOYMRoBNLO+2ZQ0UafTNq6pAvSLDOxz7H9nMj6Hds=
X-Received: by 2002:a05:6a20:3955:b0:1aa:bde:8c78 with SMTP id
 r21-20020a056a20395500b001aa0bde8c78mr7620079pzg.54.1713632297609; 
 Sat, 20 Apr 2024 09:58:17 -0700 (PDT)
Received: from [192.168.91.227] ([156.19.246.23])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a634c11000000b005f0793db2ebsm4947401pga.74.2024.04.20.09.58.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Apr 2024 09:58:17 -0700 (PDT)
Message-ID: <ceff450b-834b-4bee-a655-79112ecb0e16@linaro.org>
Date: Sat, 20 Apr 2024 09:58:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] target/arm: Refactor default generic timer frequency
 handling
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240419184608.2675213-1-peter.maydell@linaro.org>
 <20240419184608.2675213-3-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240419184608.2675213-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
X-TUID: hFV/egfw+y1I

On 4/19/24 11:46, Peter Maydell wrote:
> The generic timer frequency is settable by board code via a QOM
> property "cntfrq", but otherwise defaults to 62.5MHz.  The way this
> is done includes some complication resulting from how this was
> originally a fixed value with no QOM property.  Clean it up:
> 
>   * always set cpu->gt_cntfrq_hz to some sensible value, whether
>     the CPU has the generic timer or not, and whether it's system
>     or user-only emulation
>   * this means we can always use gt_cntfrq_hz, and never need
>     the old GTIMER_SCALE define
>   * set the default value in exactly one place, in the realize fn
> 
> The aim here is to pave the way for handling the ARMv8.6 requirement
> that the generic timer frequency is always 1GHz.  We're going to do
> that by having old CPU types keep their legacy-in-QEMU behaviour and
> having the default for any new CPU types be a 1GHz rather han 62.5MHz
> cntfrq, so we want the point where the default is decided to be in
> one place, and in code, not in a DEFINE_PROP_UINT64() initializer.
> 
> This commit should have no behavioural changes.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/internals.h |  7 ++++---
>   target/arm/cpu.c       | 31 +++++++++++++++++--------------
>   target/arm/helper.c    | 16 ++++++++--------
>   3 files changed, 29 insertions(+), 25 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

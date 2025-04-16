Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp240171njk;
        Wed, 16 Apr 2025 10:06:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUuBv66uRgqADgtZKlKLlt3oZ/9mKWi3ruoNO7IE4SMnWrDOcYafliVfuBB2TjQ5kiiqHT5og9b+R6PTg==@linaro.org
X-Google-Smtp-Source: AGHT+IHgc7KB+o8XAMRxzvRPFztu7Wi620c2IkUY46iXZE3kPFaMVIYpQ+B8Qz17/gXwuEELW2MF
X-Received: by 2002:a05:6512:e94:b0:549:4e88:2e6a with SMTP id 2adb3069b0e04-54d64a7b5a8mr1093899e87.6.1744823210798;
        Wed, 16 Apr 2025 10:06:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744823210; cv=none;
        d=google.com; s=arc-20240605;
        b=loRItuhkG7XHs/m3T5ZQiCFRUcmGXTr6oguu01YQ4BoOSsHrCLQL+j/ctmXvxeiyod
         BlNQtprnZPVHornD/IYLdc93tSKRFZq4op9poLLpwQMtLOHRxs9J3JQYeNGxZ6SZ42S1
         h1zQr6Lw6N6QTKNs9t+x2GJGnUa+YM7AlvvuXe3E9SiFsPgei1fC9h8/zohj2VlgZwGV
         RgJzvyog1wBZ5q176/MFKpRZ8fnKLjuBm81mHYQjX5N1MVordvJfHa02Hg6WHVF6OpA9
         UQZacHJYLE3Hje9grpYjSbm1Vlim/q+WbESdsliyVwezKcFqIaywRkZwCSai/nJalqpu
         nlqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=d4LAk15VOmUFsD68OxDxhd/71imP+xPo8lm1R9AXufI=;
        fh=JxcMSeFI7F4CdSYuWnzSp6uy9akhMbtjMZ+EejLxu+w=;
        b=lrNrErr+bVcsQGZDbu6rA2zEgbxKm7zzxI8ICVXeRkAx7o1FAVwDGayT3oydgWNQvr
         s5ihUEqOp+5WoQoyMTuoiwPYp+c1S+IVUg/fQ9IyTMCgLG8XzrTfXel9fbQMaWUR41pf
         xWB6Nraot80r3TXRMBcadYcHvbd98LY/M74PSixEokBhnsagcgMc7ujO2ilaXduLbbwS
         7cm4iU6kT+b8+yA49MhtO7EmMX6tDYBFXiLDN72LoE+H1JGzRH/v6OhYHrdw7rTqnVvh
         3GksfAzokD5MA31N9i/FpPpsv7dcQq+3Oe0hDXSO/4vbUlYhcn1vYT6I5Lt6YGg03oSw
         GzNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hao3X0G5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2adb3069b0e04-54d3d54b3bcsi5313749e87.403.2025.04.16.10.06.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Apr 2025 10:06:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hao3X0G5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u56D5-0002bD-Rk; Wed, 16 Apr 2025 13:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1u56Cx-0002aY-IB
 for qemu-devel@nongnu.org; Wed, 16 Apr 2025 13:05:56 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1u56Cv-0004dy-Kl
 for qemu-devel@nongnu.org; Wed, 16 Apr 2025 13:05:55 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2295d78b433so74144665ad.2
 for <qemu-devel@nongnu.org>; Wed, 16 Apr 2025 10:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744823152; x=1745427952; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d4LAk15VOmUFsD68OxDxhd/71imP+xPo8lm1R9AXufI=;
 b=Hao3X0G5nhikHMwvnii04tBIOqWXfPQw0HKsYlQQ1ojxg1e1ydD2wcn+6weRHvIkSP
 INlsH15qqb3/Hawjscs4k2M6OsKPWq8zGdXLSRwamT8gMnCX8bTRtC/6s6AzylS3/qdj
 7xyFYRN39rQSJkcrF/1LWRWAf+hnMUPVvNCmWSEvKsbUhJfYtLYFsI3pppnNb6jUmuXK
 +4kLfkZ9cz/UsK/+jiozeHTI5fJ/6Pq8Lx4U+cWQ/ZxW/o0JXZDteGl0G+M+ZlG4weC+
 foJ7ixhCyUjRiwcW63eCNaVgV1FRZ8CrAsFggB3jmX3eeU8QfBm+nGNuN/JGgY4ybdM/
 ZUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744823152; x=1745427952;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d4LAk15VOmUFsD68OxDxhd/71imP+xPo8lm1R9AXufI=;
 b=CB96H0QZ86GewjRjn02BcwWWr6ax7qbxDJ/OIinUMM9XTyWa+xDmf6XStc4cwL6AYV
 pHj3kg/3NeuP2U2JO1IMNEZaExoG4uYCyYeTYPURrYodoPj8c5WtIzipq0lJeZw9IHVn
 wKyVFAoOPwNuucGKPx/mK1XEFmkKWotkl8nVj3kzxrHw6B4sgB2NCoxszwHVE0rZ24zV
 h47OoDO+7NlcJ7rxmbJ15Z9uIR1Ea97Ji5fseRq4LdQIr9s2p5K4KF+TfMu0c5blUXnw
 DWAN0k2S62na0/LuLpfQgFBr+wdxajCGVjzd152XXhmDtklTbrxX0sNDW5cuOawf/4S1
 2h2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjZ+qllJpB4C0xE8YcDojn/kvoWHWOu3yIgYycsvR85RmKNRADbHMshL4gSfG7GyLycdycbLRmhDe3@nongnu.org
X-Gm-Message-State: AOJu0YxNb9Qa3nGAHdwoPc5V0PE+iEDM0MS8JdM6MtqMexK8CxbaA0x3
 6U6hiKYdXsSVeACsNKFw7MQ1887Jcvk+rlffr76ll/YXOWYfeAQJcghUOOFF3O1bvzpYlWQsk34
 5
X-Gm-Gg: ASbGncuerLI5tb3lTtD8XYCDHiFUDxcNf8AFOLb7SHf8GF88l4Efn+oG5thwcPmP125
 IMQC9LJbT8BNffSa35ztW1wRYqcZIkcusBqBV4UAK/Vl6dcL8StCdt3BfPVOvXbPQzzm/PKIcfn
 Gr8ok+3iWowRumGseFsJnLyu+IXvR2FV5472a/8vqLGdE0MAZq+Ncr2YMy6PbdxRNoEMYep4w+4
 FLxMXD/xWK2tzgNtGv6isDXVcFUhUBLSX1IsYiHw6iVqsN5686RQ4gMO/L0INYH3x1v0stre4j+
 AicTTfRs1zsLpYepggma/QMO8kAobnIReIXcMxE7WJ3+dzIeTgCU7X6cgyC6ZT9Cp22+AHSj1lg
 XJzA+PrA=
X-Received: by 2002:a17:902:f552:b0:21f:3e2d:7d42 with SMTP id
 d9443c01a7336-22c35916c9bmr44994395ad.23.1744823151781; 
 Wed, 16 Apr 2025 10:05:51 -0700 (PDT)
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c33fa8186sm16700745ad.128.2025.04.16.10.05.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 10:05:50 -0700 (PDT)
Message-ID: <655c920b-8204-456f-91a3-85129c5e3b06@linaro.org>
Date: Wed, 16 Apr 2025 10:05:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] target/arm: Replace target_ulong -> uint64_t for
 HWBreakpoint
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250415172246.79470-1-philmd@linaro.org>
 <20250415172246.79470-3-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250415172246.79470-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fDyCTrpD438/

On 4/15/25 10:22, Philippe Mathieu-Daudé wrote:
> CPUARMState::pc is of type uint64_t.

That's not a good argument.  It's a guest virtual address, and using vaddr would 
self-document that fact.


r~

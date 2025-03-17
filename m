Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2335699njb;
        Mon, 17 Mar 2025 08:42:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWIdzwUMhHQBoddOrwjay7kqXay8IBwayClPk30yWaZBwXxgKNm3YBKWwrAOKgjhorCLLIN4o6sMLMEjg==@linaro.org
X-Google-Smtp-Source: AGHT+IG3FRGaaxlVlyOBwwzVUNgDelCob3MGtSxYKCFV41eEyLwbPT1KAhBCpIkjq+dLoO+IH1ea
X-Received: by 2002:a05:622a:2b0b:b0:476:a967:b242 with SMTP id d75a77b69052e-476fc9f4ae4mr83481cf.30.1742226142100;
        Mon, 17 Mar 2025 08:42:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742226142; cv=none;
        d=google.com; s=arc-20240605;
        b=lOtc1gjSAp7zh560qPwZB0i/ZCAESna+NXxtiAKCEgG9IQJNlhOfk3JkmD7fIg0xVc
         oS1Da8MMZtor8DVLoInMVLjZz8JDyYWOT5NPHiEe9KLG5AZiM5/Kz1HEsEWeb5ynUV+o
         JAK0uIgxcrSiHfiRKvt2FfkXMr2c0D0bf0EANM7cOCXcWPGH79lX6EccxYpwZ0LD+iTb
         wp+IHlglgHF80HFT6A8ax4j2PPW/U7afiq14llrYzkW0rsQNX7FTPOyLgmAidu9KB+K4
         5D5Mn/PkMnIx3tDD21PB4Lfpi5tdChDMyDgkCrpm7PjqNTW1Js+ocA5YwPRc5MaHkrNH
         9pmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=VTMMap8G1h+27iOmQaDryC+9L7h0iGzRq3RCXHITEj0=;
        fh=veQFseobcb1XnuZQyHl3dy1D2vadQh82SO2uLSU3LUU=;
        b=NqpfsN1XhjcPJDxX1OJbYq9HE6C1QQPeTTVtSfexNVedHu3xUt/AHRpu2xflPDgT+q
         qyoQgW/s1u8OaDX4x6+VjQIysZCV82kJa/sHXUQ2DhYuZdZ47Q001TwtNTP/0F/irKcF
         RPR72ul0I5ayJUeEtQKn592Rcrxgr1Hhp35EM+bl4R/OzJHAviiwA1NAm68tkOxzbwz4
         x4V1GvkAUTpGH6bOCot9eCaBkkH0xxpnAQbTF40P8qnzoqFmbD4LAK69KcTFIHBCk2jh
         RY1I9UQCoTSTcvSALHobIvpUADQOb+JnL4sXA8LQZqhhCkqv5vzvJ7bC7A4rJqgEeDYm
         RTJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y11892wy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb856799si99055731cf.484.2025.03.17.08.42.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Mar 2025 08:42:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y11892wy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuCbW-0003hn-Jk; Mon, 17 Mar 2025 11:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tuCbC-0003bZ-1V
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 11:41:59 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tuCb9-0006Vt-0k
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 11:41:53 -0400
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-4769bbc21b0so46415251cf.2
 for <qemu-arm@nongnu.org>; Mon, 17 Mar 2025 08:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742226109; x=1742830909; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VTMMap8G1h+27iOmQaDryC+9L7h0iGzRq3RCXHITEj0=;
 b=y11892wylAtuQAStg/ZMFQFlvFlgVJ5kkTfBs85U2cvBs/Uw+KPqAbCJoyzMehPmxT
 pDbAFD8cdWgzv7G0bYXjAih3D6os7NY0Nqae5hPISpdJNasrXu1fS+iH9uUjN2a2ycXZ
 F3Jqc7j6IaAoxeKABo6v9e+MLKk9EkBTh2AZ4WZD4WXSQHpvAmvcoW7+8Z5YwCPiRqcE
 eZcaI099rM8f/jBDWBbjRhMa5rUmZajcHiYicWbK9ykKeFBM+4ZsoMjrgTvZ/PeI4Gp0
 ip5rb0btbkHUaq0LCHw9VANfXJ2gdGlbajbSgBmYJsQ7Wh8i3/qhckkqbr7UmJ+GyS6y
 mM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742226109; x=1742830909;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VTMMap8G1h+27iOmQaDryC+9L7h0iGzRq3RCXHITEj0=;
 b=gatKoE0RMwQbr47vzK91BL6HBk8f5Y+i/wUIfAG3fzIBclvwqHnhsnxZqh76HJ298N
 mNSws0at91GHyNhgPomwwxf/oZB1neo5WQjmZZFcL3C5l+rArDuSIGqC5KnZPEWSxoLp
 scTODHsUDGyteLvIsV3HjTxuvJey4PopG8PXkLD1twj+qhHT/itNo1mgomsOaBt4ejB+
 JhaeqaZd2PGlWfoK3jFASsEtdQBSn+X3e7bjZodFTk+UnEJviy2LXpOpDN2Lc+NPcHVV
 py0HHQwDSa6OXc9WV07Ebk1nu9pMMYyyUMoYWdifjkGOvZ6jcRGAUIAzYX6NZuZrnVtf
 6hVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4GckebFbsstHQqd3xBdWFRGwIDxQhIrRSJlOq3VKibVq7QnuLktzsBfSa7Z5xqrXclVbYBnHJAA==@nongnu.org
X-Gm-Message-State: AOJu0YykwuVsbCQ7MJHJNAwrwvs72iLXCZFx5Y2y9RcDVjf2LcsnC8w4
 GimS6JKcERFyfz2aMJ2DsEC5ng4Dw+hWeUOIJ3pFCTd5gU0/kNTzm+mZphJWNwQ=
X-Gm-Gg: ASbGnctRRMfiRykcoOVPXOW+xT9VsQ1ICekQlPqRPcBolPZRUUL0WEncz+0ZkAQ2cFT
 Ik4e+OMRDO6UEdDIslo4b2q+EEqRUU6Xr4J1NnQCnfQG/BlFOZO4FPkpHH9I+cNmYjRYpiWj3Io
 j6n17QVN1jrgsgvwt+3qyElgTF6hEl8n4pPFpUR7qaEqQvcrk4hDVVDOyREJjoO9MkGcjHkx6yK
 sBUx+tt/7aMF31FC+cGG+xyR84OsbTEznRfKV+liIgBKSug3hjUOuilkDbR2meIpAaJODmKNPv0
 GVyZ1dWND7wUPKUY7qeDZqg360fYtHJk1sBBNS0wLgSIhWLfO/Ltnq903547vf4PGpESAGt/ww6
 rF81WI+n+iQ==
X-Received: by 2002:a05:622a:4d06:b0:476:b7e2:385e with SMTP id
 d75a77b69052e-476fc9a374fmr2711cf.17.1742226108836; 
 Mon, 17 Mar 2025 08:41:48 -0700 (PDT)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-476bb7f4f08sm55119001cf.56.2025.03.17.08.41.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 08:41:48 -0700 (PDT)
Message-ID: <d7824899-fd1f-4223-9234-223eb3eae0dc@linaro.org>
Date: Mon, 17 Mar 2025 16:41:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.1 5/9] target/arm: Handle AArch64 gdb read/write
 regs in TYPE_ARM_CPU
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250317142819.900029-1-peter.maydell@linaro.org>
 <20250317142819.900029-6-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250317142819.900029-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=philmd@linaro.org; helo=mail-qt1-x829.google.com
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
X-TUID: FT9OYNpakm01

On 17/3/25 15:28, Peter Maydell wrote:
> Instead of having the TYPE_AARCH64_CPU subclass set
> CPUClass::gdb_read_register and ::gdb_write_register to different
> methods from those of the TYPE_ARM_CPU parent class, have the
> TYPE_ARM_CPU methods handle either AArch32 or AArch64 at runtime.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu64.c   |  5 -----
>   target/arm/gdbstub.c | 12 ++++++++++++
>   2 files changed, 12 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


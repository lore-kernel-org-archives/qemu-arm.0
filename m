Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1654795njc;
        Sun, 15 Jun 2025 22:45:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZXubb62cPU1GGEluAtJoBtyMkft9/YdiVIlSQsOb7sJpFMiJUqwb3PewxyISbW9N2qEiR5TqoGBejGQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFMrRHlLLzh7R6T5gHZy3eFmAWgON8EFpsWMAOP11yVZk07BsX6a5oDsAoVdxqQlxndtdmJ
X-Received: by 2002:a05:622a:1790:b0:4a5:a96d:6068 with SMTP id d75a77b69052e-4a73c61c0f4mr128465991cf.37.1750052732777;
        Sun, 15 Jun 2025 22:45:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750052732; cv=none;
        d=google.com; s=arc-20240605;
        b=NaLKfrAIVa05FA2lF2j7FIuCZ/pDW1if0c3cYQRHv37EfBj1QH2RoAkEDG78Sn2Qma
         QAqVrqPeOmqf8Y9WAbZoNfJ5lrga9dtLM9Bkg7eSVQT4in/C6zmjJyXeB0wRBE2+EFL7
         d9n4+o0JaY1M90ryN6IrFTsqA33uce9jIYQwE2oSiGF6rCSwjSdZ6LWmYvulukSQbxH6
         GBBz49VDXluD2PDAN0JxuQ7rmDsGmmH5R/p1ZP8eXF/OdfKHzx06ptvXWcHdeNN0Vu7p
         0CnpaiYO8jaCltbkrx7607wGcSeAnrho+h+SwOFu2R1nc80aiWB8mm7ZWLYPSJM8h+g4
         iD+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xc2cLD2ntBOLWn9J2QDVOrWC0n7u+YczZeWOQbn7lZg=;
        fh=Qlt0TcO4DbMCM21l6ZAE8N4c5704FP2aUOKKKL2t+ug=;
        b=ch21zJH7K1se7l7T0jWWt7ler0+pQW7s3A4IxZylFQ+vScbP4Ik/hrywCT/BZLhUXl
         L+p2KhWN3usgR/S0+eGfUcZBx+6FG/CI5k1s38AgUAfGamCLJr6qMwdSp6uH12mIXbdL
         rvoFXnRiBrIezL99Uk/FvT3/LIcwDjIyG1KMKSkTc1gc/zbjdDfemFkD3/bYtNUQAc6K
         ozBwxLpjSVU3XvV/ecV/t85DYARIflM1vnHQc2iv4m/vomuTY9vZxv1cpX0fwg416S9S
         fuozjtCMKcqDVm7/FqJsXwdzz7BN6JO3WSL7OWaOrSlIzACxntXlG5wTdu4CgpUWvAnL
         mrqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IR0Dk24x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a2b970csi93169871cf.126.2025.06.15.22.45.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Jun 2025 22:45:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IR0Dk24x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uR2eP-000186-Ar; Mon, 16 Jun 2025 01:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uR2eN-00017P-I6
 for qemu-arm@nongnu.org; Mon, 16 Jun 2025 01:44:55 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uR2eL-0007do-S1
 for qemu-arm@nongnu.org; Mon, 16 Jun 2025 01:44:55 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a536ecbf6fso2691969f8f.2
 for <qemu-arm@nongnu.org>; Sun, 15 Jun 2025 22:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750052692; x=1750657492; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xc2cLD2ntBOLWn9J2QDVOrWC0n7u+YczZeWOQbn7lZg=;
 b=IR0Dk24xpQp9nyMw8WVWaiCH3ilFul40ZcS7NoLK/vqfCsr/Qg1RV1K5mrnTFE6scg
 hhNBtp7xTYrMaFNIcXud4cGgPC4g3s43lLdvhlO3LJDAzJTIxMIWDVB9+nJqX/20Hn3s
 pc0OqKFRS9Ehc7zLQ0NEr1u+3kWWdKY2xXfAzOMsTbPlFxBflJodJkH+oxNwiXxIHMhj
 drMLlt2ZUHYWHy6Y6qK4zyzcmuVh3+2PBxX5WwG14+ihM4Pb5wtl6RyvIK48QoBx5NFu
 58iM7CErbOld6n8t6bH/jGXrvMd9F7kQcQBOu8wspWUskujjCaxSgwoyuwArH3M0lWcU
 jbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750052692; x=1750657492;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xc2cLD2ntBOLWn9J2QDVOrWC0n7u+YczZeWOQbn7lZg=;
 b=WldUrJjPGiuIE8M8dLseH7Tvrkna8T/PiPUL6mT6mmtTSN1ysXfwO8KXS7+AJuLBbS
 Liskundk/iCzA8J04ME9DFpFboKYTBpcWlYj7T21qK5eSSORYPt3l7u3uAfWfitXzGdr
 GExMyx1O3wheqLTcReUjVHZUbkX/tIfn8Nt1P+ELOdYryYBq9LKSeewepSgQxbIGQN6W
 MnYSTwvtNiiN0YqIx6moE5DcWnWZ8XyJGaMrtGLrmJdV4ilv1+Kv6eUrBlhAYGCcS1dW
 piCjQL07QBMuvuFbstRAo1SV/lRqnft2BPGL6909cqKx7dgNAbU5C7gzZsSBbcg118Xg
 GcUQ==
X-Gm-Message-State: AOJu0YymlNp8vG0ACve08WSywJDyLpBPRMfdJERJIfzby1/Nq0hrpbQl
 AuT1lGNFqxzaN6Pi6Md1ARNK3i66RFGvcsj85f/2HpBCPSguyOh1neMjcG/cj024rJw=
X-Gm-Gg: ASbGncueXqRwaI+1YaWI58b2xqiwL1uBPI14fz4pQCSZs4SXBS5jGADxA8iPXaN6UyF
 Lebj96qI6QhUNpzO6gGl40dwyHbBuPHclR/AFABhNVFRrOP783vi5WzuGtiPnjDddagVojf2ZQe
 hxeUhrwNIPJwP4t7JiPdSOsjSK4aaXJZanVLT8blNJkWrcrslrQhsFQfhuHaa6ta1PiQPS+zZPJ
 IydlcrQ7naKuMF4ska+cX0+YHWlL3DexBOhDa+Ro6Q12LARTZv+8XCL1YGUkPO+VoAxfoDe6HOA
 NajuKUT5L8yb0JXAowS60gG7LSQlCt50w+13FFrStcqjKLRiUNAARLIpV/DrA7U0Z5BsgEX8EAR
 gQJdUsdYJLa4qinnS/zBKXIBpOZRb+g==
X-Received: by 2002:a05:6000:708:b0:3a5:5278:e635 with SMTP id
 ffacd0b85a97d-3a572367577mr5888410f8f.3.1750052692022; 
 Sun, 15 Jun 2025 22:44:52 -0700 (PDT)
Received: from [192.168.69.167] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e256630sm136115695e9.29.2025.06.15.22.44.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jun 2025 22:44:51 -0700 (PDT)
Message-ID: <23605427-8930-41a8-bd92-6a3a76a950cf@linaro.org>
Date: Mon, 16 Jun 2025 07:44:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] hw/arm: make cpu targeted by arm_load_kernel the
 primary CPU.
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, edgar.iglesias@gmail.com,
 alistair@alistair23.me
References: <20250613134208.1509436-1-chigot@adacore.com>
 <20250613134208.1509436-2-chigot@adacore.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250613134208.1509436-2-chigot@adacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: v9b1L9Z6S9WD

On 13/6/25 15:42, Clément Chigot wrote:
> Currently, arm booting processus assumes that the first_cpu is the CPU
> that will boot: `arm_load_kernel` is powering off all but the `first_cpu`;
> `do_cpu_reset` is setting the loader address only for this `first_cpu`.
> 
> For most of the boards, this isn't an issue as the kernel is loaded and
> booted on the first CPU anyway. However, for zynqmp, the option
> "boot-cpu" allows to choose any CPUs.
> 
> Create a new arm_boot_info entry `primary_cpu` recording which CPU will
> be boot first. This one is set when `arm_boot_kernel` is called.
> 
> Signed-off-by: Clément Chigot <chigot@adacore.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/boot.c         | 15 +++++++--------
>   include/hw/arm/boot.h |  3 +++
>   2 files changed, 10 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


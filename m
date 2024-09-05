Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp458509njb;
        Thu, 5 Sep 2024 04:52:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXYbd244zAN/p7OPwZ/eUIJDlmtbXJXYRICcXgMDortMPJ5nHm1wkfXKlAxjatrIViRjZIcsXMTH/yjqw==@linaro.org
X-Google-Smtp-Source: AGHT+IF7NMe+JwCSXIj0zAvwLpbyvdQ4i+4wuCnoa3qcMqSOSQcH6IV5VUrdNq6Zrmv9OyD0Wkao
X-Received: by 2002:a05:6830:2c01:b0:710:b2b4:693f with SMTP id 46e09a7af769-710b2b469d0mr7497529a34.1.1725537129604;
        Thu, 05 Sep 2024 04:52:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725537129; cv=none;
        d=google.com; s=arc-20240605;
        b=St1y4QXPAQBAvaxDVBoO2iBaedQ2bP6sqrC7D5NIRJkdJh4rbtoum8Y7unsLqCTAGu
         EvVu1yE5C+Ayd0RDkhh5t0DUnZqAfwJKGmRZPZ9LcjUQw8gQ3P2rSr51XKDsNpHH41CI
         wa0BiONWzxzldC4A5Mnz2nu8fTq2QuYniYpkWoY7TBaOATEIaSb4zK0J8RTv5BBCoZjG
         DCCYz30KgbvXXafC67r63B9cLKjC4vm6KKM7ooDsrYcrm9DD6XNLeMne7G8U99wJy2VN
         ouXF690y1qxf/QBtCFaofy5rTi1eBV0OjlbWra2m5yxKPl1AN08VdUXNL6rTspRr+puC
         NGFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=g1RPH4G/jecz5xS6t1MJvinb0vzJwHEK/hgmd7/HqFI=;
        fh=MFRerufFxmjOhW7L7VXWbbmQEEUI/cfWxzlVnCRiV/s=;
        b=Q/u3QXu84ZC0oFtRGgQjIYiseotH0gJlrYCYq/kCcWQoVooS4b76QHUM9Pyoct8WtT
         QRW6J1V6qlY9cPEJMhyXK5xvGEH28i7qv/wU4jHq6t+7yEuF/yp5tD3oXMZ2UVVvCGb9
         q+gU7NdnEc/5drlqizIKuxvuJD9F328uvcLe+KN1veTaGz2v86Lxb8YhiRfr0StglwDH
         JAz2wLo1QITF8WAe71TMJ1SU63uRqI6E0c/G6qTWhqcEB4wsXhnfMapLEpXKQDzYJPRz
         Tab17eHC3hScx5y7HjqSsmnqCl5sgMAkJhSEok4bBA2U7EqidqnLVksJf6EQ2v4/EpKB
         bT/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jGwQzRFy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c52051c24asi18075376d6.516.2024.09.05.04.52.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Sep 2024 04:52:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jGwQzRFy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1smB1m-00055x-S6; Thu, 05 Sep 2024 07:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1smB1l-00052b-Pn
 for qemu-arm@nongnu.org; Thu, 05 Sep 2024 07:51:53 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1smB1k-0001w5-A9
 for qemu-arm@nongnu.org; Thu, 05 Sep 2024 07:51:53 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-374c7d14191so978460f8f.0
 for <qemu-arm@nongnu.org>; Thu, 05 Sep 2024 04:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725537110; x=1726141910; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g1RPH4G/jecz5xS6t1MJvinb0vzJwHEK/hgmd7/HqFI=;
 b=jGwQzRFy5/ndF9EcFBMnRlVXOKLCnuGqRh1bH3CJ8Dz6LfrQlzhJ4ugBkR0WRRWJUT
 mkEjoBQ/rw7R/0E9uUIimUKSLW6auwVvn1g13AP46NGeNcdYsN3EluuwlHozeQuK+YXw
 y0HlKGo57W4PcgBpUiIYQjQ2AyzPFhzZDUgImmTa86+vP0M3+QhPvaRDFuLqs8+tuYre
 gX+zXigJ8sRuRcIVnsP9cLadg1V2Vq9T5SxksBPPNSJNFwRfQQPgSGT6KWDt9C5mylKy
 mfHPBe/gvxgLiNlQOX4mbOVEp1L1mchPyX3RjO/W/NquKRagmvui8j20yMr6c4v5+aM1
 lS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725537110; x=1726141910;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g1RPH4G/jecz5xS6t1MJvinb0vzJwHEK/hgmd7/HqFI=;
 b=lrmnc58jUqxI/brW8mrh0CAZWrx+AHOLvblwHhh4UuAeQWTgN0kRI4u7flbNS4lPTs
 6/xtZMF3gA0HStJVjqwD21f5S4lZnKUrq3XccXTvFT2WbW/nk/az/gebMK12IqavAGS3
 gtNOVYAiaAflUOZJysWv8+YOFwEXezn3P7QAXFpwIaAt+q1p9v8ZkNeCpwi+8B+BbnOn
 7P1R5RLbOHjb3mHEsxnagpxNB674z/smZKVG518eBVy/JmyXcYmQ5BQJEpYdbMxI/Tm6
 VioHcco/MI+1GaI56m4Sjzn7eO6+avr3QpH7TQD0FYp18LGzbSTf0+Get/eUBk0x9OPw
 U4jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbklGGS2nfCg2zyriqvczYOXgCfSgzIuX0yOxRv7suQyM/q+cOSQR9qtjEuN6RepYxndKTXT0jHw==@nongnu.org
X-Gm-Message-State: AOJu0YxhH3uBPmMSeDIp5vd58vOy+A6cZmX1/Di7uBRLqWHOI20q9l+z
 ZOkpo2LdlcczRGV+pBJDVVSTBf7mVkjw/FcM0jItLm1xz98q2o+cWMUcKgY6EKA=
X-Received: by 2002:a5d:4601:0:b0:374:bf6b:101c with SMTP id
 ffacd0b85a97d-3779999f893mr3152625f8f.7.1725537110008; 
 Thu, 05 Sep 2024 04:51:50 -0700 (PDT)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba639643esm272244215e9.1.2024.09.05.04.51.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 04:51:49 -0700 (PDT)
Message-ID: <97d6e91a-d0ba-4fe9-915c-891c6175e073@linaro.org>
Date: Thu, 5 Sep 2024 13:51:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 10/53] hw/arm: Remove 'mainstone' machine
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-11-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240903160751.4100218-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 60WkHZuewGvB

On 3/9/24 18:07, Peter Maydell wrote:
> The 'mainstone' machine has been deprecated since 9.0, and
> so we can remove it for the 9.2 release.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   MAINTAINERS                             |   2 -
>   docs/system/arm/mainstone.rst           |  25 ----
>   docs/system/target-arm.rst              |   1 -
>   configs/devices/arm-softmmu/default.mak |   1 -
>   hw/arm/mainstone.c                      | 175 ------------------------
>   hw/arm/Kconfig                          |   8 --
>   hw/arm/meson.build                      |   1 -
>   7 files changed, 213 deletions(-)
>   delete mode 100644 docs/system/arm/mainstone.rst
>   delete mode 100644 hw/arm/mainstone.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


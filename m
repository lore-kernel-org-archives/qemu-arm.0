Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp724642njg;
        Tue, 25 Feb 2025 23:04:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWGj3UoIHQGjhyPezB2InoTkIiX6d4PR8xiAY83Gk7waFuM430N0AtJxwiDq9gLDQns52e6U3NetPuwEw==@linaro.org
X-Google-Smtp-Source: AGHT+IEZKVBmjS8RRrYBs/RICTvtqxviHk9rJtLxIdzvafOYt599ju4VpYLnE5IKBnUs5vZU0PtT
X-Received: by 2002:a05:622a:1387:b0:472:744:e27c with SMTP id d75a77b69052e-4737725c67amr111310801cf.35.1740553465992;
        Tue, 25 Feb 2025 23:04:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740553465; cv=none;
        d=google.com; s=arc-20240605;
        b=J1UYKESxuxz6V9BWK8T/YMemDh2q3jo/6Q1M2j8WOra21zTOAnGYfdfiv8p575dxZV
         tae+Ja0WJl6OT5iQa4wMQ/pC58GMNBB4t7nZ2K8ux9HDyx7MGFIzaCxnUTUtdwxlJuF1
         bLoqH0Hms22WLqqO4KD8ald6nNtLrqJ9LZ81a1/AbbJaauyZnJOAymLi24tnqVRuzbey
         3xyuQY85I846ydTSQQ21XQ42QwFRKZIffnbOEyXKTzjGFJ507np8GbddofOizKuwTKgV
         MULZ82kaoP2cjVVLCP/LqdURklCdsOZAAS5hT1LZk8R6hSp3umrJRs/ZgbBXo8YW7QeW
         A49Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=x3+rDLr1IYC/sg2FsAeyY72QCdeKakGfIfnvwJ6M5A8=;
        fh=JoALJx11yMHv/XpyT76MBU7PP4wyGsRciwGal1SNRgg=;
        b=LcTWQXb0Q7SdqPBfopZLVJQCUrCVajVdam60K3YHNQnkYrP3C4kRjHkCKdD70sYkc2
         4DO2gG7aoO2c7AwS4yskWhgidmIdUxwybsFXjlkBxKlPRrEcviiVVV8GliudQIQ6sZVH
         GlqVrzWIglZ5p31ecI1VU/fz2jR6donmrpu0B/dsnqBbZ2tjlofdZ/2/lYLNWUJGD5z4
         3UFIptxGSglfvobQ2AEAfvG3bTZUjJw0GIy3R3QIgKwa6oSd7amVoIY39MhjsTG8uP+f
         z8JAaoa+pCxpSzpVNhuhomAcS/o9wBg1KHLIV7F9E6aJ1TpZDCFbawA+RfHK7CasWT9w
         EKUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DGEId8EO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47377e1cbd7si29925081cf.124.2025.02.25.23.04.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 23:04:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DGEId8EO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnBSi-0006YW-4r; Wed, 26 Feb 2025 02:04:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tnBSd-0006Xp-3g
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 02:04:05 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tnBSb-0006iA-BK
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 02:04:02 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-390d6b29ba4so128811f8f.2
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2025 23:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740553439; x=1741158239; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x3+rDLr1IYC/sg2FsAeyY72QCdeKakGfIfnvwJ6M5A8=;
 b=DGEId8EOArJwEziTm92xeKQ7AKR42OriI6d3Bq7+2y5HPT8G3Myzsne/9zks7zXH2Z
 kh3Ek9bBprBvKJoGRXynL4xgmXTlrBCwrpdmfPOHNe/oWxz9qWaKbi049MkkkCMWN/iS
 pSejCGilZZo5awIzRA6WcYiBC+Oixs9kpyfFNPAGiWmeEoFe448iJD+qvEwpmT5Y+omQ
 2gvOkY+nq0GYHF3+ShTgIQAoeQcts2Im7rVKBtCmQhar21pROjcp8pKwsA9Z3X5RcAxA
 al0vbbx2luD3D17hK36ZLU4fr7HjZ/2sx1WRDtMl9XORnqrdFLmT+2/KP53U6kdOfdk+
 /ung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740553439; x=1741158239;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x3+rDLr1IYC/sg2FsAeyY72QCdeKakGfIfnvwJ6M5A8=;
 b=qT0V3sZtVrbRuwtEakPyV7P6EsNOpZhxMQ6Bx6vn2gQSJW3VkTOJLo+HagBvMBq0NC
 H4HuZp/db85b/Au0WkADlsGWltLAdqs9MREc5gnybHMHU4HxhKS2oTLmfl24WkQOt5Ub
 17gx+Yo4YK8sBR8+oAUNxXaG2wfuv2f6tqXeO4RivlfW0C0iTRqj/V9woe06SA8wqBsi
 Il0G/59tQq4lD1WNHqx9eXYha1GrNMp0fETcgzYNhfBxQOS+wp5gjATFOlf9MZ3I7CH5
 a1HdO6UZxD9ZgQGC+LSVtViYCAXKWvtUeME03OqtkvODJ1QePyWDDtOCuhPIP9HdnLew
 G11w==
X-Gm-Message-State: AOJu0YxV7VQG9/hJNHd6YhvOS8k3VpgqC/ffn7gDjJ8qkaBaPT/VH4yU
 9PlnOw/SPEUcNkij3Qn9pdLEi7Cf7+lYEqWz55N1V45idi5NLs6Rsgx9GioROmGLPVRYNYnYcGa
 gvBo=
X-Gm-Gg: ASbGncsjCEHlxIB6awEwlXCrT68nmxN3YDXoMsN02zZhx/SrRVtsnQRrGdWpX4W1HUA
 tkkbfO6RV8SjM9Ts2Ve7+kPfc2xLGuAjq3jaqwwljFdiBy4mGl0tq/xg08OUHGwNBIXrrQT0XWU
 7qGQutbMCwuAlQFa1Ho2Byb74PYiaq6s75sCXRfFtudeWMjC7PRQeTmwzny5Nuf+481IZFEyES3
 +o7eGpMUswKVE8trV3r6uZe4WVYiLc74TnTk4Sm+KdZfORygxKSkIYdLUZpJeS5+GWLuz/1TyKI
 6IkW4BBw6HWO6Ze1jWliTPm4mrgLe+2AU5tuLJ8WMN0elY/sF0CHxqQ2tGob1b3FAOvtTALmDXc
 =
X-Received: by 2002:a5d:65d0:0:b0:38f:2f9c:affa with SMTP id
 ffacd0b85a97d-38f707aabe9mr14657230f8f.33.1740553439515; 
 Tue, 25 Feb 2025 23:03:59 -0800 (PST)
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd866f79sm4618286f8f.17.2025.02.25.23.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 23:03:59 -0800 (PST)
Message-ID: <f4b1dfc6-5265-400b-8842-349668c8e972@linaro.org>
Date: Wed, 26 Feb 2025 08:03:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/gpio: npcm7xx: fixup out-of-bounds access
To: Patrick Venture <venture@google.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com,
 wuhaotsh@google.com
References: <20250226024603.493148-1-venture@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250226024603.493148-1-venture@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: LPn83Fp9N1OB

On 26/2/25 03:46, Patrick Venture wrote:
> The reg isn't validated to be a possible register before
> it's dereferenced for one case.  The mmio space registered
> for the gpio device is 4KiB but there aren't that many
> registers in the struct.
> 
> Google-Bug-Id: 397469048
> Change-Id: I2fb8d0d3d41422baab22e8fc7e9fadd0f2ee7068

^ Both lines are irrelevant on mainstream git history, otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Cc: qemu-stable@nongnu.org
Fixes: 526dbbe0874 ("hw/gpio: Add GPIO model for Nuvoton NPCM7xx")

> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>   hw/gpio/npcm7xx_gpio.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)


Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp699013njb;
        Fri, 6 Dec 2024 00:41:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVj2LriaFXhVHENgdPURz7HEUOWWlunn7lQVEdTVesxjWjiNYo2GwkHfi9+srP6SCcI5EGCBiK/UV7T4w==@linaro.org
X-Google-Smtp-Source: AGHT+IFpcxRLOJOBGHQeOg4n+yb/HBShc/+MObkH5e+vBtjNZKo+YUV/iu9cWCCm7zfNbpC3VEbN
X-Received: by 2002:a05:6102:5093:b0:4af:c89f:4f53 with SMTP id ada2fe7eead31-4afcaa19156mr2794789137.8.1733474500121;
        Fri, 06 Dec 2024 00:41:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733474500; cv=none;
        d=google.com; s=arc-20240605;
        b=eZQheimSeEz7RebPFrKYQ6xWHRuREi6uFoXcvyv+HhtAMrFn3tNTRSWL72pVg92dhw
         AJzmjls+yY7pMBApO81rABgKWj9HQW+aM5Tu5B9chwmkFImVT+G/m3tw2I5lVe/pv6Lj
         FuGVcyFbwW8KpTO0qrZBY5QdOpHSTEV4md+zUf8eqOejdSiq/yRA6U5mlRSlR2c8VwQy
         EVM0s5vf+JEpKObxDtKkN0dofEfguiZ+vnBMpK6e6KBAAbXTVgqJ3JygIV+I2LLmbsBq
         ki/luQaggitPnER0vSXB5p9VYfCFSzCWE1gKhZBSaXIPDNbNoOu2qy1dmUJKgOtSpQjD
         yqqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=v7LXJTAkpA6lTm9Xnbzp5+iCARf4cq6KrTqF2RNcWzI=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=eL8bZICUHncCaGIF0OMsXhYRcU4s2Ok4EnPiSNcb5EGfvTngBaj3yguIoL+k4gQlta
         nHkuukpwqNiTsNJ0OSMpzWXjnx66sscPYZmxicXiVHPUfbRYDYvovopCa1LPnBh21dIR
         X+hLB2voR1ZTtDyCvhGLlnXJlMpg9Ytqdq9359tSnQ+G9sT00c7QqnTsH5jT4EkEzwfY
         s2B2+oH13jYfo6v1KGE0mB/YwcYD7lAYjG+CFeVQr+CL7rDjeMje9lL4pazjveIMZpDN
         DgvosOz7XzcZHpdoMlaWOxJYLTHT2SESp0zUTRiCWQefGv9u+4Io2qGvfSch8Cu2VcFu
         XnLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wQCi1ee0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467297bb266si36922651cf.227.2024.12.06.00.41.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 00:41:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wQCi1ee0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJTtq-0006lR-4O; Fri, 06 Dec 2024 03:41:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tJTtn-0006j1-Fi
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 03:41:20 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tJTtl-0001NK-QH
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 03:41:19 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-434a736518eso19954045e9.1
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 00:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733474476; x=1734079276; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v7LXJTAkpA6lTm9Xnbzp5+iCARf4cq6KrTqF2RNcWzI=;
 b=wQCi1ee0t7whD7quBqR6CttKWzxGJNNRCtpmSLIbKzElZ7DQ1tcwbH0xOaIkdY0fdb
 XV/G8mAI38wotwWeg59ceB16JZooqApGydSjIH/cfbclhlcrZIgoSDQ/uqaUtBlOIDGL
 IihYiWM3o6s/qec09fgRVVoiGdLMKewmnlZAEQQ9kTbknnSJl17fOQkXqri+eDQQTp89
 VVq9x/VxljcU8Z0lBF4xSOn1FrCMQi916K/0hcPUj9NUYuulnmdijEy7w9PMF3Dbvuiq
 YNTr6jVWwPPaHGky1YHIDKqFXeJcLteodRZOWN2VyiWN3+yXwtOLb9a3/e1aKBVgmj/n
 nNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733474476; x=1734079276;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v7LXJTAkpA6lTm9Xnbzp5+iCARf4cq6KrTqF2RNcWzI=;
 b=dYSM2w3uZoAc0QCTnF77ZJfVSV1CtQ6+fDaQOzvhNZyqFQAo0k351MyfixzcyU2u80
 AwrFrOz4fKbBGRjEpJlUszNiaZOp8ESEAsCgPwtPepG+UyrxQjf1aT7Q8qBHG5NS75dB
 t+xqMXl1miK/MqhfHYgVwkkTiHpwrD1N8cvq40j5sq3f7+GKMKQWNr56L3FDOpw+JZTi
 GyyrIY1JAfXR8HZNQkuSpmnwSxLsN5dsczO8RTStX6Yf/yj7ljVxdSbDGKXILOEuGBb+
 dRrG8cax6xzHYPNuvN5WqP9FpP8rVRG/F7NwF96GNTBVB10uB/BtjvHDkVJ5J1WPTtVp
 MsLA==
X-Gm-Message-State: AOJu0YzQxGrDmUGZT+WhtAx0acD/YtfhpMJEH51o528Qn+DDJjce1fGx
 MZ3Tqsp0iQlxfB8fsQaWGwBBektUY/pJqUyi0yza0X63UJ+hYnsAdzpdMUVSKXcxwmjzZAzMWMK
 H
X-Gm-Gg: ASbGncu7XPLSKR8Bf/e6f3E9YeF+cMjnRmPr09vN60iBU9OxuY4SvHJ6XHxiNzO7XJ9
 R0Ubra6RtLa52+MMYFssq96e96Fx169fdZtePZcD6/LGpkpt3W8Frt+tKsDNM4hQMH7g1KTVj03
 tjsnglLZ6YopHDmEawOulCQaeLYG6MOocyiES00RpTScOT+mR/CebvfEECMYYUz1rRCGzbROYs4
 bbniHPOCJJzAVUmh0kwlzafNK+XckB4KD44BEpGkoIC79g7VkjxDzyAoBPhLtBkSqBntYMbM+wS
 k24LTUicR1hHb8JK3A==
X-Received: by 2002:a05:600c:4712:b0:434:a04d:1670 with SMTP id
 5b1f17b1804b1-434dde6b312mr21015405e9.0.1733474476440; 
 Fri, 06 Dec 2024 00:41:16 -0800 (PST)
Received: from [192.168.69.223] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-386219098c8sm4127372f8f.77.2024.12.06.00.41.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2024 00:41:15 -0800 (PST)
Message-ID: <08ed4f7a-18ce-4797-8144-944ea9254df0@linaro.org>
Date: Fri, 6 Dec 2024 09:41:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/arm: Use float_status in
 helper_fcvtx_f64_to_f32
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20241206031952.78776-1-richard.henderson@linaro.org>
 <20241206031952.78776-2-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241206031952.78776-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: jdc77NaYBTSv

On 6/12/24 04:19, Richard Henderson wrote:
> Pass float_status not env to match other functions.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/helper-a64.h    | 2 +-
>   target/arm/tcg/helper-a64.c    | 3 +--
>   target/arm/tcg/translate-a64.c | 2 +-
>   3 files changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


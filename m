Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB38FC87FCA
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Jul 2025 16:46:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufLYA-0007u4-Dl; Fri, 25 Jul 2025 12:45:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufLY4-0007pe-BV
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 12:45:32 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufLY1-0007Z7-3U
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 12:45:31 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-7490cb9a892so1633213b3a.0
 for <qemu-arm@nongnu.org>; Fri, 25 Jul 2025 09:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753461927; x=1754066727; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HqMiNDfkvMYOuomvAPL/wjINCW5poUXOI2FNYtKyvgw=;
 b=BJ25IwIxHFXEuH0JbWuplr58/K+Byu4qAZjST+5aHtotAdwRZmZ3Lbe+fYBfdFX3cI
 jhQujJvjrKkWbFtXw4HpoTT2xXjPeY2KktNOn+BLEjfG8OTzD10vJzVj7XpDxzBak/8Z
 qw5V29QOtIQaGGZ9LiCAJ2H1q3RBQoiKLhjuLbRqWKrFD+pSl3A/4qGq4LZ6TmMow14a
 ybL0Ad4FW8XXVaGrbefY3gfEeDlFSsPmx936xyVeg52ODy8nvncvd13ZIb0rDGlrxg6O
 bl65sh7db2Bsl9jUqa1aY0bir0LoVPKNSTPMzB6gBf8SxgGc45E7vylEExmNjow8QSMu
 xLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753461927; x=1754066727;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HqMiNDfkvMYOuomvAPL/wjINCW5poUXOI2FNYtKyvgw=;
 b=UtM7KGvAp+uEiYj9/WP2zYFdfe42oWycCSpQicDzg8AVmuqpyaS19tq+y59W49ayVt
 PaTyGedsFcZ5f3mewBFos2/qpAp7sDGgAhZ3zGxRLQ5a6Yl7RDYJIOQjAqO9OHgb2tMf
 zPQ4HGctmWJXrBLdELInm6fxW5yK7v5s8H7Uzc1u8+D4OeR2c0bF7+aYZKLdVt3xKV0Q
 CdB2Y7EWdk+dOzSo475C5Osg3U1IRxZ2SjBmYTgn/9+Qnn8Yn4QPNTTiY3M45R2E+25Y
 TuAd7baAbauBiashsz9yaKWLf+ypo9GjSg9MaAQMTv5IWsF2dm0QFO3Cl0aWVnxb3OLh
 GN1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkssYsjdNPXa6GIa5lK1CbmbyJMOD3jln4XDMCTUiHO1wPd8lHCGBtxD5+gnX15ZRxbEvmFUsRbg==@nongnu.org
X-Gm-Message-State: AOJu0YwYh7lQzOHyq7vkKWgAPxE7deoNaMNMmO66xHY5pUfBYyBfgVjp
 WqNWFCR8ttbkVDwQCLZGb+zNYLJfrOcPqjuZeb201zEY7l0x5ps5CnnkiTCfoVnZe+Jp2yOWDIv
 SoX7A
X-Gm-Gg: ASbGncvO/+mGfPqDKejmqaMfxiALJPaTKBK34pI9ObdRXGaj61GjYUCjBweBM2Fnf9y
 tQbF8AWCSz7EwVr5oiSovT4OP8k/6JHs0GlPQwX80Kr0eaC3c/DCPIBtnV4CsL8/CLOgyH/lQD+
 uWijCUozpZl8FErWyOW5tUO4QpjDZ+Yv9L5AsPyeTcfehTxgL+NudggCTc0npxohWmd+BkQX6VX
 GarmlBzPnhzCXV7GzKy1yRmrznFDlVncIb6544KdhyxEFawgmdZU6pE77nVCRS8LT65WZ1Bo65G
 pbaDekcuYdCwDjQbNiWlfiYSyxI+xQ9RPf2tfcYwg9vwjfmN6r+tct9iHGXyMVLJl9P/jncWikF
 qeNS2S0MV6AiUJ8b+bE37loXeTtCd05K+WDinM0MnU7yc3SFBwI9XnqJoHq0+9rWSX5D5d2cRqO
 xBrw==
X-Google-Smtp-Source: AGHT+IHCLjKrdzORXPbZl9RJ0qC6P9MAhci2Y8MqN6UofFavBT6+yszssqBk+tHirgxaqr6iAdX2mQ==
X-Received: by 2002:a05:6a00:2383:b0:74d:247f:fae4 with SMTP id
 d2e1a72fcca58-7633636aef3mr4303963b3a.4.1753461927019; 
 Fri, 25 Jul 2025 09:45:27 -0700 (PDT)
Received: from [192.168.4.112] (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7640b4c86afsm110007b3a.115.2025.07.25.09.45.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 09:45:26 -0700 (PDT)
Message-ID: <13da0e27-1775-48d9-a458-08d18e09b984@linaro.org>
Date: Fri, 25 Jul 2025 06:45:23 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.1 3/3] linux-user/aarch64: Support ZT_MAGIC signal
 frame record
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
References: <20250725142240.3760452-1-peter.maydell@linaro.org>
 <20250725142240.3760452-4-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250725142240.3760452-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/25/25 04:22, Peter Maydell wrote:
> @@ -428,6 +467,33 @@ static bool target_restore_tpidr2_record(CPUARMState *env,
>       return true;
>   }
>   
> +static bool target_restore_zt_record(CPUARMState *env,
> +                                     struct target_zt_context *zt, int size,
> +                                     int svcr)
> +{
> +    uint16_t nregs;
> +    uint64_t *z;
> +
> +    if (!cpu_isar_feature(aa64_sme2, env_archcpu(env))) {
> +        return false;
> +    }

I think this is better placed with case TARGET_ZT_MAGIC.

> +    if (!(FIELD_EX64(env->svcr, SVCR, ZA))) {

Need to check svcr the argument, which has not yet been stored to env.
You even knew that from the comment before calling this function.  :-)


r~


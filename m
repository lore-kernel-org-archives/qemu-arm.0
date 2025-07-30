Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B37C87FC9
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 21:19:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhEC8-0007UU-BL; Wed, 30 Jul 2025 17:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEBZ-0005zJ-Im
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 17:18:05 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEBX-0000HJ-RY
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 17:18:05 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-b271f3ae786so203900a12.3
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 14:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753910282; x=1754515082; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T1qvaZaR2aXMejWTIkJwK08jTvId0LRFvbFnoCtri/c=;
 b=H51otNlkIPW9u3y89uHwrfOW3WCpQEWJMsZK/A+vH1JYkuwHhYg6VcNesKLNc/tEPn
 ri0r7CloMSznBSgarWjRVCzlDQHrd/AyL4+HesDcGu9dE5/Fndp+LvyN673qmn/c8m2B
 giqQGcoOsayqJaKLqUcgs9C1YNUkePqJ6Ymo0OlnvA7dnzryFOtiPGfggDhtE3/QZU7D
 1SfeQupS/tDBGtD6OQtnrZByVAywlH0FJEzdB9sgarfjCr4L4qmyd4cleX+ebJM43cHO
 wJKTBExGxHyDyyuA7xVQy99oZRpxQwqmsFk1lR+sMY1GxY4XenNqbxppRN9F4Q3V1x57
 SWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753910282; x=1754515082;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T1qvaZaR2aXMejWTIkJwK08jTvId0LRFvbFnoCtri/c=;
 b=W2hVtxEv3Pb6Ft7n/4RB6IoqLg/WJjVe89FJovNQ1baRO+t36TuDtRBK+341c1+ypm
 uvYpBNQpJwVxbhw7ZpjNGyi1lU923O0kIbx8L69+MHvpDKoyor1nAnF6xXh6pY0LsmTx
 vMrVIehPE2JEKDFOYaeuE6SP77Ac+/J3aO3ON02oFpIp2/oEQ8AuDHkLgMWbrrUJEdzW
 KoE2tIzmiLEduiXD6z9EkGQH/93V/sU0d47W3EeZ0JOLkkh+fqpjTlvc41pVCORG1wBI
 3Pduc7P2mT0iDPm1UJ9K9Mj/w/yuXB/hX4Mt0YYd9/wgtTBZ3d5oB6/iJv7AcflJoGjA
 YPAw==
X-Gm-Message-State: AOJu0Yxf8fudvMrPQ2vJJQQc8+TJk2sNpTi2Gx3zqIQbpuLblYyOzRz1
 A1oKIFXdF9vWS8G172e3aLwF6JDkhdHnYGWNBfkb6W9VYb+wB9AxYGmRtivicprkSWw=
X-Gm-Gg: ASbGncvGEv0d3J1qw7W9XwCPvOe13Pe6Q5dTLhy7MyOLyXfPVDxyDxuglpTLq8ZyeCi
 T1pebqcvJpMBzhCJg6dNs4WrVg9RiLszXXoZympnAdEx7nJaCL5/Fd+3l4WoKLfPiA5iJcRwPcL
 jk0BWGjYr+3BX6CPYcwmRdtGmkgY3IhyFuHdI9dXdPL5jwyUktxRLDRgJROk6MfmFp7Hw47zEFK
 DzN+CPlqZ776Voh3q5sjDQC0hvXjeO3twRc0qzS+Ww8iHpC92yY2E+UMrQrV5J2WA075PcDgoI/
 FHVIrY8Qek7cXCeZD1Q8tNJyPz3AC0Ozy997nJNaqHQePeppJq2FDaF1Wm2wCeyvdhZvzJU1XHJ
 oTxzTqtUgrYSnvdk5fFaKcJkIAa04hA0Zs70=
X-Google-Smtp-Source: AGHT+IExUBetOsAy9McHC5FFZqXZAR65FysnLX6ULHdFdtiECE3p3ZblaVaOd9cHDSliO10jqyGfhg==
X-Received: by 2002:a17:902:cf42:b0:240:90d:468d with SMTP id
 d9443c01a7336-24096a4770amr70995405ad.9.1753910282483; 
 Wed, 30 Jul 2025 14:18:02 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aa9055sm442125ad.150.2025.07.30.14.18.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 14:18:02 -0700 (PDT)
Message-ID: <4c1575d7-0b2f-4996-b67f-2eca0a4bf9ba@linaro.org>
Date: Wed, 30 Jul 2025 14:18:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 36/82] target/arm: Remove unused env argument from
 regime_is_user
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-37-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-37-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x529.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/27/25 1:02 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h |  2 +-
>   target/arm/helper.c    |  2 +-
>   target/arm/ptw.c       | 16 ++++++++--------
>   3 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>



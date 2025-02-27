Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp543519njb;
        Thu, 27 Feb 2025 14:19:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWMwfHnIo71wpwihYzcS6HQDW5pOIEEZve6hMMWN1HEDxYCbokAHBzrGo1uaTgBe9jXbp6EEDA0UWYJUA==@linaro.org
X-Google-Smtp-Source: AGHT+IFbsRD6OKjnYOa2FYD9QPp/bWj2gErNC0krMF/McPxMSxFnnow/JieR4mWb5WwrQos6z9k/
X-Received: by 2002:a05:6214:1c49:b0:6e6:5ec3:8688 with SMTP id 6a1803df08f44-6e8a0d8b1cbmr20048696d6.45.1740694746489;
        Thu, 27 Feb 2025 14:19:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740694746; cv=none;
        d=google.com; s=arc-20240605;
        b=bYcEH+zaT4cWsXja8AxnFbKwDSquhYV/F4G7PKS/79p52qttjVa7XceZxu1sbm7MNv
         7LlP0SrFVte0c7NuyRY8npHSVU87PHrBHy/v95ZOXZARcWtiAcSP3NJHyIWw7lv0Ixrq
         LoSsZuLH91l82ZoJFQ1S2ieTmDzKR9Gy/wAutA3k8drcBBLJYcFn3BpYuVbxY19jt7Az
         jd0j+Zn+9BetIOc2Lho32aZxYCV+Xm59Ewq3LRCnj1jwtkONplAyPxit+ZTcsL/3+mhU
         9md3Rm0K14gcMlCApoaH3q2JL3udjSv+Qzs2MJd/tP828GxDX8mOBLKwG5jj8hzkD5Fa
         IL5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=hCptzdxldMl3pzZW66domjqhVCcDOR6hIsxI8YUcwI4=;
        fh=HnQrPb0u0aKVUmTFQvGUXUPYzaAT+Jj43GxARw2CdU4=;
        b=MSqGEK+6LGYbn3MzF4ZmPHKbeG1XJogLrFTrEVh0Y/iPDpF/7VZLADe7wRfClByT7/
         O1MtqfHj5iYTD9xCDsjeNZAn6UrD3aWZAGORkhknSsU2WP9MlVPNpDmfyyJALy/ukhwT
         yqbeFGFC9sdsog9H0H7i01UZwm7wxbCwnZ3ESly/vQomI8xVBvUZoHGvJ83BLmHA6l8H
         Fa2Lk6YfITqKePAUCVsfsl3iSgHgSTSP1HK3T5ajMi6DCyEevPT7qgqljYWBjk2p/cnr
         Co8P3jWfr72dcta89e/QkW5LheZe6pbQa6Zf9qnSjm34XyF2XDUTBumOuwefeOLKjvyh
         k81g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sih3v+Fx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e897600de7si20029206d6.147.2025.02.27.14.19.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 14:19:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sih3v+Fx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnmDb-0001w6-LM; Thu, 27 Feb 2025 17:18:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tnmDO-0001rv-74
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 17:18:52 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tnmDM-0001vY-7Z
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 17:18:45 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-439a2780b44so9788995e9.1
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2025 14:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740694723; x=1741299523; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hCptzdxldMl3pzZW66domjqhVCcDOR6hIsxI8YUcwI4=;
 b=Sih3v+FxDGpm783AYbpFRqbn2iTFOnmHBUFCPBFrUQfPBwhZH6p2U5TdfxK+jYYo+o
 oLup9LZQtD+LT+Ek5+Zq+8aDaaufZ0NUgAVkz02GK4u/NBbXfhm3X0TikBUVqpe+iebA
 Rq4zep5P6ANOlsZAF7y2oB08A/X3y9OHJrNX5ghnHtZCtGHszSElMPM77/hpUg1CBzJV
 JRn6ozxPBGo8mTxTTCpaCp34n3uF+qH9fyv7qvCgVy2EQEaiUJKLJ/yQ15Lmb/y6H8FK
 DO+yW0PC0YyEec2wnzITEcWjkTxFd8xRPOjh8KE89ys2MQxtRjijLHC01SzWXI/x4Nnj
 o+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740694723; x=1741299523;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hCptzdxldMl3pzZW66domjqhVCcDOR6hIsxI8YUcwI4=;
 b=dfHQvCNdZNVhbQTLGRP8PDRl0RwkPC5En3v2xZblax5qkBWdK5UQBuYkPREDf00sCr
 D80nvITa7vXKJop4JIkNJZ90A8cpCflBEKS9LiCyiHtfTEofmOH46nuz9YhvlOBpKwsw
 18H2rlr0d4j9Zf+G1abs058giVorObVoCfQuBpE9lW12IAc2gR57GNQttzhO0EuDhUt3
 pviZQw4xOOTKuFU4BMsgNJfH+THrOt8BR0ZYo4I98cfh3eb7yOlgnp/fAsAA38AADD9K
 SYRBL+WSt5dxdHC0+X4xWqw7bPzkQ1oq71gFyWWmRgG2lQ9Sq5vX60Qd+/j5vNgTUh/c
 EagA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUca6f3coCfBb9+s+nz2bu5ooNa/Fq+Kc4lazBbz4eGYlIRFBKWufYUeOWXeIUNlaap2Pmf0sN1TA==@nongnu.org
X-Gm-Message-State: AOJu0YwlG2wgnyWBi4Xw4rnBtLGB6PJgBlyZwdU01b7oVQcmQocdiMhi
 Wi9l+Ios6Gdgu9gCPKMJNwbSpL2uZr3QHyOPpQcCKcrPUIIF3i3srRmKar7uR+8=
X-Gm-Gg: ASbGncvKdhP45YUNsCXxuB1D0Gcq4OBYAtyw4Pj6f2wEPkIP1W/aD5s49rlcQyYvSMK
 yNdwdNpr5ojLHyCVgaHtadlnQJlyB1v6CAOIZQkCoudispXVHpyr/+Xp3w9ZA0uv2AqmBAlxX5o
 NExoLY9JlLV8Iue1x3CuvyVMcJ5Mnr+7nYK6Y7L7DTdg9JAsnKeA/ZmuoGQIpZCxdMgZSgeB+MD
 en+UqVaEPk57fNNdyCjJDMu0/O5oZ4oBcdXvpLvxpAhmnzmwF7rGeCsLa3UEoFe2uODGP+RkNqC
 B8X2NZCkwo5q6VSEk6aT/znA8OksWzESo2hLb9ZYx7/PDSKknZbLDF1+iOlBKCDm+2ED/Q==
X-Received: by 2002:a05:600c:4f89:b0:439:9951:1220 with SMTP id
 5b1f17b1804b1-43ba66fa281mr6982655e9.13.1740694722654; 
 Thu, 27 Feb 2025 14:18:42 -0800 (PST)
Received: from [192.168.69.202] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47b6ddesm3286202f8f.41.2025.02.27.14.18.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2025 14:18:42 -0800 (PST)
Message-ID: <ed2cba1b-f0f4-4b33-9452-4279f84bc088@linaro.org>
Date: Thu, 27 Feb 2025 23:18:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] hw/arm/versatilepb: Convert printfs to LOG_GUEST_ERROR
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250227170117.1726895-1-peter.maydell@linaro.org>
 <20250227170117.1726895-6-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250227170117.1726895-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: Rqki4k+0JQZN

On 27/2/25 18:01, Peter Maydell wrote:
> Convert some printf() calls for attempts to access nonexistent
> registers into LOG_GUEST_ERROR logging.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/versatilepb.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


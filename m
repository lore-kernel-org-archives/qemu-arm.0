Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp1873169njb;
        Mon, 10 Feb 2025 03:43:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX8DyFw25UiebV+sdfR6sNZ1OR2KQJI+wmYzMczR/thqfkX01Wcr+PZ0oVQjDcODLN7thluTda60SmRwg==@linaro.org
X-Google-Smtp-Source: AGHT+IGBmZuNeG0VGsRd1rk0LTLGT3q2BDld4gBwRt/TzQ5RfLfjHokdnTux1IPD13EZDNGS5mrI
X-Received: by 2002:a05:620a:4394:b0:7c0:6728:125f with SMTP id af79cd13be357-7c067281529mr53587185a.50.1739187804038;
        Mon, 10 Feb 2025 03:43:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739187804; cv=none;
        d=google.com; s=arc-20240605;
        b=R8ji4ivTk5AdrJc3clh09VVvkekccz7CulEPcd6pEB4JJUA8obe7eTfkhOIZlcO8Iv
         mUHt18Ezx8w0gKhu11x8FoHX6fL4ItAXa8c2zAzHtjX+SNlYaARRe1dUN/2uojLDh7D5
         OZwZd1GB2qi/IrX5VhGf2GxrNmeu4LPY1FLywZYj4p7zAY1obSj0PaBnOOwZNWyDGf21
         G+Gm9S/OrAE1Da/SKob8vN60dFwfQB/KSj3vsx4b/aJtXkBST7auFK6LZw3eiLoNvFdK
         +N1coKZ3IBgsNTlq6UylxhQmmQpZPClC6cQgwiuzRqvQmzUjmfsjXXS55ByB/9Of2fJz
         nmHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8EfAEcBZVfgER+PyjUrcBoEN2a5jycU5m9Zrs1Vj4dU=;
        fh=j6S+EfI5hmtm9YYJIFo9V14FnLHOAIJkWH05bQFYkwo=;
        b=eNTBSw2VfbIrG0jAne+ZIW2xnekOZx/sP+8VIrLWL2RNhbWZU4VxrcnoK5pzWQHJU/
         RGuVzVzw7Pj1/JbjpYzZK56m/MpWvSanUnJSa/xelQtrX9IrW7d100TMDWcaGeOj+ENW
         A9I/FNS0+3slf2zqBMJ/kof2hAIscu9U+XmMRec2kNNpz0LF2pLRqUxyYv8dS5Se5gtK
         yaHTiAVks2emv6l03hjXbpTJIwGjUr4LiI245/5cuZwLM0xxJdukFTLmrlHUFDShvpUJ
         ZUbo2LWcMxx3ko7D8/20sv/7lN2a9dTN24R32DwJwLbBXCtmo15uKsLj05NvoQY2+jqL
         N8kA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=btU546x3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c05a410ad2si300425185a.9.2025.02.10.03.43.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 03:43:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=btU546x3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thSBy-0006Q9-Tj; Mon, 10 Feb 2025 06:43:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thSBv-0006On-8i
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 06:43:07 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thSBs-0007D9-BG
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 06:43:06 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so27685655e9.3
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 03:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739187782; x=1739792582; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8EfAEcBZVfgER+PyjUrcBoEN2a5jycU5m9Zrs1Vj4dU=;
 b=btU546x3o3G73Idc7HYNR0PYZDnk5C+Uuz9Y54/q4NdV/svSkITW3WuzcAziVnYw0N
 9ov5gJ/JkUQDfa8JSLiSgToYPTTQDm3QZkJlnJ8135FEGJOPNtRVmhvhRUOWjMWsmRqD
 adqCqtgaDGCMQaciYupoyTS0HHLRw5/cQRLjTVNsmioiGbQV0Qgkb4aIw4yIJog/CSHA
 qdFw2TqZ5NmubjF+rJXiIDvier1F+/XQIebCncfWr6ZgY0XgmVM4xz4rk8rksxHgphET
 lM8qLt5OTfp+mkNzJRayMPHahLkGqgaUvcduHbLpchTkWjJ9qkAO1hL7L4EXZhjXPEXB
 6XaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739187782; x=1739792582;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8EfAEcBZVfgER+PyjUrcBoEN2a5jycU5m9Zrs1Vj4dU=;
 b=EFwmZIyhuB5XZeG2xGgOUKXMaTslX0Fn8nL/I+Zw6a28GjswidFQqcH3sJ89hhdvX8
 4T0+aRqNlZn6MD0tgtWh0/A4MO/nP3L9252+r1uqAtsR2PNt7Z0SdkvfbGbBWfG3qSBU
 D4blEAGDPN88wlxAPaxmb4qNvhpDG1GlWTWXIx97dEi/juv09hEAIaV1Ovma2/Wsb62f
 1TmybAj0LvZU4DYXzpYNJ1slFMP+FcDz2Jmn4IZG6NiGSJ3Kmu0TotoCOh1N9xRauPBA
 d4kf4RR6nHmhHvixuCqw+HM5EBtkf2Dmyq6JgeLE+FEyda+TSbEg0Mwt3M+GN1zXSEAx
 b7FA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpjNoVqvbFdGcv3Z6i8NM2L9xjTGTANL4Uiw6jdgtUcGmfbGu0CrSBvmxJaXPnpN8Y4K1Drtln1Q==@nongnu.org
X-Gm-Message-State: AOJu0Yw1QYrYAVaipPpu4M17i1ERTmpnkQjHVyZH0YHjP8J+a0jhhn5b
 BlSttlFnsx5UgDIka1NRCouCxWMjMdkS4gXFi8sKbAQ0U4asU438oDWauiPELWA=
X-Gm-Gg: ASbGncvBNlwnP0RHBtYROpGxDTT6fcIYfi6Z/a0MBqbMCuzmVW6/1QTyck/4BxfUGPc
 WuF87hQ8/I5aXKJpPD3TYW/HEgVpSRN9PUSdmCGV7m0JxeYpDh0+0jkaiYnOLCwXmx/ekqo/P6o
 Ep463df1HlrphZgVnfKEg12HCVwzD3M7ZeBnjMSE7y7huXmHL42Jr46bH55Rhd99OXCtjkDD++u
 6QXlP9qvZN+fV//QZaYF2tQ8pOAE0vHTf+2BToaPcI5tp1lnnCfGJF5c/HEj7bKSV8TE7xAraIg
 +sja4KYLytn2EFTQa34zeFChu3+uvPdYiFcEsJUaf/OEYLhHkWOkkV3dNMw15SGT
X-Received: by 2002:a05:600c:204c:b0:439:3050:1abc with SMTP id
 5b1f17b1804b1-43930501c28mr65743385e9.15.1739187782022; 
 Mon, 10 Feb 2025 03:43:02 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390d94d753sm177623775e9.11.2025.02.10.03.43.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 03:43:01 -0800 (PST)
Message-ID: <69457f04-47bb-4cee-9f10-64dfb1dc9447@linaro.org>
Date: Mon, 10 Feb 2025 12:43:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/net/smc91c111: Ignore attempt to pop from empty RX fifo
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20250207151157.3151776-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250207151157.3151776-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: UeihKt1icmYM

On 7/2/25 16:11, Peter Maydell wrote:
> The SMC91C111 includes an MMU Command register which permits
> the guest to remove entries from the RX FIFO. The datasheet
> does not specify what happens if the guest tries to do this
> when the FIFO is already empty; there are no status registers
> containing error bits which might be applicable.
> 
> Currently we don't guard at all against pop of an empty
> RX FIFO, with the result that we allow the guest to drive
> the rx_fifo_len index to negative values, which will cause
> smc91c111_receive() to write to the rx_fifo[] array out of
> bounds when we receive the next packet.
> 
> Instead ignore attempts to pop an empty RX FIFO.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: 80337b66a8e7 ("NIC emulation for qemu arm-softmmu")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2780
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/net/smc91c111.c | 9 +++++++++
>   1 file changed, 9 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp511844njb;
        Thu, 8 May 2025 08:40:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXdSOSQ8SK0rj8KmJyHgu6xm41KfiauQ67nbvYYU2DlXm0oXAu2sL9T77VqBxTuauouNr6EaDphR3Yl5Q==@linaro.org
X-Google-Smtp-Source: AGHT+IESLu8na/CIIFKvQdyqrObswmNucA53nqFP5QLe5owsGP93mpgybWCd4oiLrVvgTHy1XHM8
X-Received: by 2002:a05:6102:5047:b0:4bb:eb4a:f9ec with SMTP id ada2fe7eead31-4dc73880b16mr6604898137.16.1746718840410;
        Thu, 08 May 2025 08:40:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746718840; cv=none;
        d=google.com; s=arc-20240605;
        b=PhaBkX8XDbkaVhU9DfB9uDg1tefocxmkJ+N30x8moyH+ZHjN6GgjPOXVZACfBFzTYY
         pY0vY+E3t2ofW5pZvgO2EnDuA+nL5EsCBw6kxWuITGafPym192TmCVn6ImfoEWsYaVAZ
         B7rD0oyzTx5f5SVkunB54bo2rEorgYRg6HtujwABYQiNvYUaKc4ewfc3OxXcmnSplVW9
         UW3jYs3eipHq+GpyaOGw+4veoWhBROP2cSYol9sSCxfXvu15Em5P4dKYZu4ZMaHSyofP
         /5sNgQQ3d6LPD5+04HZx5YjJKFVJ2inrWoh7oCoaO3Ql0CwERC8jpyFdyPQOjqd8gVuE
         7h4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=mwetbVEbsWlEBRMEp55p88gTN7b1SIR115e/4o401sA=;
        fh=vj1ksOHxwc+wf2WSNG3M9z3oSZC5RjFR+p6fbQPFLB0=;
        b=Yr0JX8L6xcOH2LEH7FDz0m3oJoaC0uDzIdwRfZppebsvn1/V9n8fbDBqyiBpM3D0Xz
         0FuAHzt/JekPfk+9mG7jjpK1ycQAn0MTTlUMEf55UFooTasxa+GrQ/yLERpp/BH4BP3j
         emidC9ma1piWD7blVNjhCq6t1XFXv1XtWCpkUu3PJ5sxim/V/FZFU1kQZT1AjDyq3NE9
         Q5eZ8gd/4GYuhkbUUH3ef+VLL5/XsPEDyom43mLhkPROye2Aa91ONpnDb23hNMmW91mb
         xvaD0KkKWwf9h6/jzZVMiSEtQor8dWBnL5cmLQVNZXCwsuEkjiqcR67fpAlz0p1KvwdT
         ypzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VlmCcULk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4deb20507dasi135459137.689.2025.05.08.08.40.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 08:40:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VlmCcULk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uD3M5-0001WD-Ja; Thu, 08 May 2025 11:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD3Lt-0001UN-Nr
 for qemu-arm@nongnu.org; Thu, 08 May 2025 11:40:01 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD3Lr-0003P0-Nx
 for qemu-arm@nongnu.org; Thu, 08 May 2025 11:40:01 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-736a72220edso1245980b3a.3
 for <qemu-arm@nongnu.org>; Thu, 08 May 2025 08:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746718798; x=1747323598; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mwetbVEbsWlEBRMEp55p88gTN7b1SIR115e/4o401sA=;
 b=VlmCcULkYHOXVAfCK+GypA2ShZTW1csnA+pABRVAsjRmQqXphQOvzOObFZf0fFJbZh
 a7bVDrXVp0NA7/n9ExpuNoULqva2ny6A+p2tuvenWyb4GRgyodoyk6gqNVshBjWlvsud
 fTmB5vORTYieJhnryV1ERLll6/51BiDI4TR21v1Cx8hwa3pu+XxgPhZ/1u/CLQV+kGlT
 1YCyh4sQEbxGD88cIS2rPBPKy/Htir4N3j5xJ7loB/RyVN+mIzVCp6HvoKc64ZdUpOIr
 ZcOReR0oFPbHHHtGivyvkz1sL0GBYjY2gOe+fyOWOnf7hZBzqDznDfNXDXnyZqIiMh0i
 WIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746718798; x=1747323598;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mwetbVEbsWlEBRMEp55p88gTN7b1SIR115e/4o401sA=;
 b=GwIUUmnLnhvw+jU1jJQkhpfI5iUHlEtWhD9bj6pbrsQUOXONmfk+yXhy8mGsMQsDWC
 oWyDWgjXY0sqBikZZN33XUKyaxS1RG6/zGZKPyVIWJFmyvUV2miAVslMSbZlkbR2Yjv+
 5B3uHDFKPRBmLOC7ZBd1DONuq5u0WMRKW1nF/Mb9lVkcICASVN5cIyq7htGFqRj92l4e
 M+NIpwf68QfgCgFosJU+KSQyB/2V3BH35Q94EM/eecceAbwMr7a8T50WnevaoMOkQPGj
 AAwNNgw/sxp4IQzewsmGeYnXAyBZ1L3FWQ4k5B8dqeqrE9Itf7AJvZKTWBXDlbkLKXu0
 fZlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAz9Nf9Xt2co014yMrWHmhXDr9fiGWih4khMnTkWziFh054a3lPW8ZvNY7WYanL3ZtQ+UZGAI1IQ==@nongnu.org
X-Gm-Message-State: AOJu0YzeF+YlNmu3DHZbe8bf59h5x80JNd2xE9aVwCMZcVFTH3SoPMur
 sXyvVBzeZ3HMru42NfAxcIfNIGD27RpxV3U5Ljl+BK8+5G7hp9NRqF+oNm6oYww=
X-Gm-Gg: ASbGnct2fEn3c7h52vNpeI4yRvtdnt5Cay/B4PbWvSlvnewu98b6ZkPSwUv733dwzzY
 3jQrMO5qn9Ixk99k5l1UPEEeKpyqIQyecRc+v15VMtMkUtY92BxMpZih8Bgkvi4N6WpAl6QLTVN
 nI7bYmfX9BijIHSg1QQ3jeJ37N777UxqjlsVaHjhhUrJUah60vjSKfd5tK5TKI06JmcU8nMsKZR
 W1PKtNLphGUhrFuQJOlIwH+jxYJkj7vdsy8q6TwEWycYMdMEG3CEjiUAQvRxbLI8yhpXinFkTOS
 kXejRULKiS34+xpI+TQqmBdUx6W0bVxkaZiR7ATVUHNm3uKc5emfzU4kHt35SVF1YVYqW3rXiwM
 SoaunrEft
X-Received: by 2002:a05:6a00:3394:b0:740:595a:f9bf with SMTP id
 d2e1a72fcca58-7409cedc6b7mr13438104b3a.3.1746718797759; 
 Thu, 08 May 2025 08:39:57 -0700 (PDT)
Received: from [192.168.69.244] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74237703f97sm146736b3a.8.2025.05.08.08.39.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 May 2025 08:39:57 -0700 (PDT)
Message-ID: <44064e22-bbae-4102-8465-7fba276559d5@linaro.org>
Date: Thu, 8 May 2025 17:39:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] include/hw/dma/xlnx_dpdma: Remove dependency on
 console.h
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-arm@nongnu.org, Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250508144120.163009-1-thuth@redhat.com>
 <20250508144120.163009-2-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250508144120.163009-2-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-pf1-x42b.google.com
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
X-TUID: qbHiZ3TMOmPu

On 8/5/25 16:41, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> console.h brings a dependency on the <epoxy/opengl.h> and the pixman
> header file (if available), so we should avoid to include this file
> if it is not really necessary (otherwise we have to specify the
> dependency in the meson.build file, too, to get the right include
> paths everywhere). console.h does not seem to be necessary for the
> xlnx_dpdma code, so drop the include here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   include/hw/dma/xlnx_dpdma.h | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


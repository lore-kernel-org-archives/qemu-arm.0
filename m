Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1026241njb;
        Wed, 14 May 2025 01:19:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWf09OpNGPEadJnNvapedMW4uwW9cehOoTwRmWMTuMIvCpZUnHgjebrE5B5gDJ6CWAkHmzUs8bgxp3upw==@linaro.org
X-Google-Smtp-Source: AGHT+IFZ+AE8ZsppSe+obWRUa9m5/pseKofKhGmknFWZEqSpWJANhx6hK9X0xJJbYZ0An2Noe7TL
X-Received: by 2002:a05:622a:248:b0:494:990f:9817 with SMTP id d75a77b69052e-494990fb3f1mr11040451cf.26.1747210762560;
        Wed, 14 May 2025 01:19:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747210762; cv=none;
        d=google.com; s=arc-20240605;
        b=Zp41+eKXHEWr+/FT8JwwW5wgESO89EdyBQAKICxa/GktPOgAeRF6K9zruz31+hzL3d
         hyCW0KPdy1fKiPs4Vu17xmA0eszCf9642qdWYI/sS8U0HItN0Hio55jfcpG9gtCXgTP0
         VQeFgmWKsHoZhbuMwZTJ1GaFydG0wjkMkr/htc/NpjWjfX+6dbtren/kpDrUKILJxj5a
         83rMPMNSrNCipVKcsJel83omFM0hkLGP3ODaY2GHFNcyIW8jHrCR9qiv0sQ+l4coVkG3
         CcZ6C7ctF83mMwX+vIEaOWlyze6cSLJveXjP8XBsqnLZTvc4Qp6Q1j972BoE9JJkE6pw
         StbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=aTi8st/0AsQV+cQly4Cll1hkvAykif/4cfU6PxtgpL0=;
        fh=GiufKQc2Mhwxy5dWvnEhk2nlt55w5RS0xVbGnqDmZ+A=;
        b=d1ltrlGQ39bQVo9xdpHkc2dGK0fvWiEzzutvFdF+9sb4koWf+hoBPnqqqUrYRfFWlG
         0//od3STOo8BvrKz/UvoEXLr96qkde3WjdXmPHRVP1bMhpaw2Cw5o4pFfvvXQY3FGW9n
         6oq/U+Vc3/gZpLnUfk0yWnZiRlHijgMLnLJ9AzhL0L4T6lZq8bKbmpKYb/Kv9abkWIzr
         tjIbUaHR3L5bfJQpCjYUt1CjdRPlrKXmYhRLYfViObV1Pi9acL01PJdCXPi/t1mnqAET
         rnM/slfP/nn/IyLjZ84m+bxHWN82k3Xs4fEXGGa6ZDWe3OFn4muXugRGl+097aYTpNhB
         2JOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ma/WDaBW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49452580f74si124561011cf.412.2025.05.14.01.19.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 May 2025 01:19:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Ma/WDaBW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uF7KY-000722-KH; Wed, 14 May 2025 04:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uF7KV-00071P-VQ
 for qemu-arm@nongnu.org; Wed, 14 May 2025 04:19:07 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uF7KU-0004lo-3l
 for qemu-arm@nongnu.org; Wed, 14 May 2025 04:19:07 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so48573735e9.1
 for <qemu-arm@nongnu.org>; Wed, 14 May 2025 01:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747210744; x=1747815544; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aTi8st/0AsQV+cQly4Cll1hkvAykif/4cfU6PxtgpL0=;
 b=Ma/WDaBWxyuYIfOX2cSStW7NdelhntMYL3bQ227GkzPrgbhPOBlITahzDO1iBdAOT6
 RSnQLjPsiSbAjdxhW0l3FhhmqviqeuP3oIjyRi7tZPHyBC7SMtw1PwBAg77ENhDxgaWO
 zmtQfV0LwAkeJZGG4FbjNA8y7lVuMK/8epMdDhxgPRb+kZADAHsWqfV7UyHpphKvhLlQ
 zDGA/fhi2UNJdabSDSOTGMD9gCLYUdgxc8zCKJxHrpJ0DUT9G/i80jNYdyoTcBW8CYH3
 TJ9iomYJ3BPlWV0rTcFvI4XAo01tQqwj0L8KQFWakRJLrU+6JKBVtcwwvYRtlM+vug/s
 3FKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747210744; x=1747815544;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aTi8st/0AsQV+cQly4Cll1hkvAykif/4cfU6PxtgpL0=;
 b=pbJQOYJnISYrvhHmRvpr4CTLWhhKDXw9E71tDWce0sk9i2kbJLCga0W1EfyHvlfayh
 54ZjjAn1V2Zup4YjzWl71H7qBwxRwk0ppFv4DqctAxyaX/EdzR2BeQp7TH1PVatqJAkn
 IdioDk4nV3lGPpt8PXo5He3n7z/7wVOQXOG6OWsG9gwSJaxI9w6NcMt/cDR92djTQOyS
 oIn0QOzKVyh+xTroFTu6mOH3qSA3zvfk+zLIz2CJTXtVqJLIsrXJzVGXiV7GkFmrgktC
 1ZTVBDoqMnpVAD7MTp0BJ3R6eaDL4/eqtHAOXtNxlqxo0oz2MY8QjCBv9i2l5/u3lNgH
 I6SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtaEJPe9Kf0HVozj5cT2/m+7ujPvMLVJef+6ZhDznVUh2BBlco9UyvcfieYoqU/WTHzeSM4bKNVw==@nongnu.org
X-Gm-Message-State: AOJu0YxRYjm3RFK2o45Cb4rVL6Rj/w2FRHcT+RIp9LSqfSgljDC2+fhI
 EQbEFtI8yxAz0bI3B4JaPWZ/ZJZq8BsC4EnvePUrXLhY1JPK4PlzscJaTR3TjBk=
X-Gm-Gg: ASbGncuLYoIgNhsXAtUM0VO0CMxCeCjIj3ybKdSzNg2xe0eFlq0mjikxzbuSKI7MUQ2
 V1wnebwD108+2qJvcKgE5P1wyJi/NgpliSB4iz6k3x8p8hYTMV5QcwxdJB1PXn0tvzcfzoSJvUh
 Yi2/2Ia87X/U6nrA5baRaRQhkmfqpL5Pq0eOfJaa09Obi1DnMFAdZR3EMxr29Wd8NXX9glFyeeF
 YVtCaTB/SVvOUQhhniN8xOT8uIPiyIrql+5aY6i/CVOxGsaJq+0OxQAdluBQOiqrl5qgNyy2tai
 RxfX2aTg4gEA2z3Do7EtthZECYoWZb5RFPEZG1NvCZCBidd61IQ2aM7lrdjZ+nmYGO5w2/UjJBA
 Wm51x1hbhnBsnskUaeioAXyFfXcs=
X-Received: by 2002:a05:600c:384e:b0:43d:fa58:700e with SMTP id
 5b1f17b1804b1-442f217a676mr17948285e9.33.1747210744076; 
 Wed, 14 May 2025 01:19:04 -0700 (PDT)
Received: from [10.61.1.204] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f39517f7sm19009185e9.20.2025.05.14.01.19.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 01:19:03 -0700 (PDT)
Message-ID: <8d7df77e-b8b8-46fb-b7b0-0ac51b4307b6@linaro.org>
Date: Wed, 14 May 2025 09:19:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/19] target/arm/hvf_arm: Avoid using poisoned CONFIG_HVF
 definition
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250513173928.77376-1-philmd@linaro.org>
 <20250513173928.77376-3-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250513173928.77376-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: RO1TM517eg6O

On 5/13/25 18:39, Philippe Mathieu-Daudé wrote:
> In order to allow non-target specific code to include
> "hvf_arm.h", define the stubs in hvf-stub.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   MAINTAINERS            |  1 +
>   target/arm/hvf_arm.h   | 16 ----------------
>   target/arm/hvf-stub.c  | 20 ++++++++++++++++++++
>   target/arm/meson.build |  1 +
>   4 files changed, 22 insertions(+), 16 deletions(-)
>   create mode 100644 target/arm/hvf-stub.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

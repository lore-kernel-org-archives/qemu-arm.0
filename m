Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp684066lfi;
        Tue, 3 Mar 2020 10:35:27 -0800 (PST)
X-Google-Smtp-Source: ADFU+vuW8i5YzQKxKoR4oIPESWfjT2wUIo71xNAi6m4iOFkxDIBbu02NzhlEjNCF+pimSj9p7812
X-Received: by 2002:a0c:db0d:: with SMTP id d13mr4952809qvk.117.1583260527302;
        Tue, 03 Mar 2020 10:35:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583260527; cv=none;
        d=google.com; s=arc-20160816;
        b=uYCdidPrThXGhRw9Pbnf2l+lN8xAtsIUg71BQ/dCarEKoSG79Qv+8trIYFjTaYRHRm
         2p1VyGyUFSGs0g1yAp6vjxeVcE0s9dizTsX9f9O1b3/143NIoAqOXnbWSP8X1JX1PXH4
         I8+2dIxaGPn0lLDuRranYNrES2kuG4CFpU0pZEi2CryMMm+dYUKw7ddKn6Pwucs7Od+r
         LIywO6KX0RhiYBPI1/h7808JvJ2l38+byoLVYDZMiG7jWPOB4W/gLaMjVe7bjYmuY+1y
         CXJJL0cy53LLKOMm4o6Q0EuqWWZMEZO2IS7V/CHIxU7FbLOV+wfaohWWvI4gTwDnejoF
         8jNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=tjdhg21vP0vgGCqLpfWkn2K2kwGuzk68EyvAYxecz5c=;
        b=e98pfZAc60EuWAfvIMd/X5oUdZ4IHMKL/HV1YtLXDOAiDgbfKmIHEJxRTUXYr3lCX6
         SfpC3pg2Q5FlBl1JxKS86Rt3YKH/tF3ElAZ0hlsnhnflII4pH6DI2pw5eHIEFkKHMYGi
         407jUeY85tRXp5/kdq1Rojp5aPITAgV53q3qPW+22QCUHEIqxx0CE1Sk7evr1vauJLbH
         AZL9K4GEQkWo1RTgkvHy0m6F+n+jCBhBAUJqzyPddgXfOrRSnpA6dgxUn0h74J0+C4Mr
         BWmcj7u8sLCqe8l7nxdN9hxEkLe3NZ5uNY/bcHuD1f2DgLvtSUlPnkUlrzceOyS/Cz8v
         k0+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qttP9Saw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k6si4690522qki.31.2020.03.03.10.35.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Mar 2020 10:35:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qttP9Saw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9CO6-0005pi-Oo
	for alex.bennee@linaro.org; Tue, 03 Mar 2020 13:35:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49454)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j9CNy-0005pD-HB
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 13:35:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j9CNx-0000uG-FF
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 13:35:18 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:39575)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j9CNx-0000t5-6O
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 13:35:17 -0500
Received: by mail-pl1-x643.google.com with SMTP id g6so1710617plp.6
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2020 10:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=tjdhg21vP0vgGCqLpfWkn2K2kwGuzk68EyvAYxecz5c=;
 b=qttP9Saw2f/EQwUEyblduccLGXhoyLSvHrdJrHjsrdqge81uxzWgSIfHBLwmXraAFC
 uw+ndnAB64ChK76pj5dm7TfeJnSfUh4uWOtHk3md4Nx4LcQuAdH/DjJSZ5i6xldkwWbq
 Am5Elr8EAO+C4oip3vP8+RgDh+PlMcHNudPZwL9Bx95bpPZX/D6o5AqUorxV0GoE1l0J
 WtztSjUaiBenZ5wjCK04vmA2QiFe8VqhwsX/R6SHdOjb3sqBDKv+tGPbXS2Z4i5Xgwsb
 BIn3WO2NAhRMqQVfiQuUZvfgoHJyxbDOoQq7FcNOPUJtvHnZqEtsCdBf6LC3I9Qi3Min
 7WIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tjdhg21vP0vgGCqLpfWkn2K2kwGuzk68EyvAYxecz5c=;
 b=cHNKkWiTsRZvIC9iF0W0MxIFKCHXq6IHt8rArnjFZAzLzEHSe2k2i65omkg3tDveGI
 4ZEh8kT/P4ZqDnDCASd0SkJLg+Brl84YLjClccbETq4O3E2kkJh/HXKf745v9OKhp7KA
 +4iWuKHx2QRU1t53iUdbPUuxfNFoO6YX5JQ+gUeJcpl4A/5yqomSeadq4aCX67Gksp3T
 EGBlqbVY5JpLXkxl9jNLFijClGiTWLTw2nRSE39+9GVZwmSVDu2vbA5OVYdPCOBnFGdW
 8C7zXUU1f6JAiZJaON9H9ziqpHrPuE2BwSu1fvJPoYO7PJj3mHlEyD7bspBWElhUBjVq
 qjSA==
X-Gm-Message-State: ANhLgQ3VrTRfE8DpgcyJ3X31lNblMXJXk3h71iMKR2FMqM0II9vX8fZr
 XxLIXkcLVYRx/7a1H8VinXK1rQ==
X-Received: by 2002:a17:90a:ec0f:: with SMTP id
 l15mr5313538pjy.133.1583260515569; 
 Tue, 03 Mar 2020 10:35:15 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 a5sm3378671pjh.7.2020.03.03.10.35.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2020 10:35:14 -0800 (PST)
Subject: Re: [PATCH 1/4] hw/intc/armv7m_nvic: Rebuild hflags on reset
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200303174950.3298-1-peter.maydell@linaro.org>
 <20200303174950.3298-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <026d835d-1c87-f479-1bf2-c606d7d47df6@linaro.org>
Date: Tue, 3 Mar 2020 10:35:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200303174950.3298-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K/vbNzBTARIn

On 3/3/20 9:49 AM, Peter Maydell wrote:
> Some of an M-profile CPU's cached hflags state depends on state that's
> in our NVIC object. We already do an hflags rebuild when the NVIC
> registers are written, but we also need to do this on NVIC reset,
> because there's no guarantee that this will happen before the
> CPU reset.
> 
> This fixes an assertion due to mismatched hflags which happens if
> the CPU is reset from inside a HardFault handler.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

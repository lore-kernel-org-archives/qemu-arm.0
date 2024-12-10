Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3532007njb;
        Tue, 10 Dec 2024 10:21:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU41MKbsL0RUvEoZR5chUsLByOvrxNvcIRiEX+3KKBKOveA3F++WzO9i+XeeDh6fe+viD2AHTnVXwCLxQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHR9HFuCPPK6b7XGp2XE8PjZIkMyX5FPlSiSuDD+ugOxsyWB6y1r+hsMVS8W9X/6jl8+eGD
X-Received: by 2002:a05:6102:5124:b0:4af:cba8:ad28 with SMTP id ada2fe7eead31-4b128f0d633mr456062137.6.1733854908297;
        Tue, 10 Dec 2024 10:21:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733854908; cv=none;
        d=google.com; s=arc-20240605;
        b=dy7SyaY7qXFhGN++CremynjGVQuqvQqZkrc/u7hbxDxMy8P0BdHeZub1xp3/ptY/hF
         x8MCwSrSbPB58jTbABNKXvgAWakBelQM3kcVr/myPxSzfbcIYtI7iNSikUVjXPZxmcLc
         tYjUER35AG40ppszHeZ6mJW/vxFcRlQ+PY9F1qFXfxBftudM5fuWrOPaimI70yV4Iqyu
         O7vEZ+mp3eqT2vdoV04LBo0YvGgqbUO2liWRvTLrYnvKkRkw/uhoVjTGIXkk+0+ylQCR
         QTK4DKy/9Uiyse2eCucCwXLHJbH0MpTa41s0ikdUhSDzuYMBAfXeAJ0Oa0TGV4rzuGsw
         mX2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=D8BO4niUECEoH5WPdxlc1ur6BBRfI0H08YvWbGqNnrs=;
        fh=6KrmPDSzYFaS9RfhK+Cry9PzimvklZkLnypwnuMlOGA=;
        b=hgX8t06ORnFeLXG/3HvSanjGWeKM5EQhPJodVEC+uCl3ZMCwu4/TQDmv/4Itf231Pt
         Zqi3j5lQjHe9FBhdagOQx3AZ1XCiA9F/QJZKHEcUA2ZobGzPgu38u1ZigXzNzo+22Vw5
         HjLZoUc9mgxStn8tWvZ6TRA1IACplnnBVXK3LF/WQKKLxFBURRqitlldEp5QaJDYnf9o
         pQUr/N7hp7ck5moIhhTsKFfAb5lIBbpOv1mTUrhwldak5xrdTwvFV6iUdMUB7A7nZMUa
         JQ9vb4UkXLYOcYUfnEwDB7cSXStefkq+mDZAYbDam0f7nGol3dHCyOt1U7il6KeKfKuQ
         0gAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JRL0zsuL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-85c2b9cd113si3217399241.5.2024.12.10.10.21.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 10:21:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JRL0zsuL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL4rD-0003gl-LH; Tue, 10 Dec 2024 13:21:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL4r8-0003gU-Nv
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 13:21:11 -0500
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL4r7-0003jS-28
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 13:21:10 -0500
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-6d8e773ad77so32835716d6.2
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 10:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733854868; x=1734459668; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=D8BO4niUECEoH5WPdxlc1ur6BBRfI0H08YvWbGqNnrs=;
 b=JRL0zsuL23LlBdJAsYi/whTQeu/SEJx3xchD3x5o+0RC8atI3JuZG0Ijv7ou7XgEfK
 UO1hu1t5v7za8QSWfuiZpByCgzc4zrbVCymp8tYd7V8V2k6ZPPIgZfYYTn9Hr+O6a5j5
 xMmYKYC726SKbDcPJRSF6YvtUGHrAYCUdsX3TWTzH6wv3vQHL5Mm/ELyuXnQQrR1dexZ
 xc3+XFrYwYio0J15A4/wPcV9iPBYEJNoBAuNJg16/u1K+AoS0sOB1xDjlR7eYhjQyzbs
 1TvjlQm/8s6fXQaAaFS6ylaYdn/H3Ost4E/rbHREB5ezn73K5YyYBc2r4aM7jJdYdK+1
 PAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733854868; x=1734459668;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D8BO4niUECEoH5WPdxlc1ur6BBRfI0H08YvWbGqNnrs=;
 b=uDZBmqQRpUUVF/OGxt2Y5LykRv88dLD1JoKUXUklN7o6DvetYOUpV9yIcuQT5T3Fl5
 zMgplhzBtmSBG+na8QniiAUpY7OySM1znYeMqBrWkzS6Ym/xY7Dql9BpEd3EDgoFgBHb
 XLryo4Q3DQXTejP8OY7s6Ovwg8HM1k+KtkhtZDh6xcgw4YnJQHNAMZJbxYzyRfK8km5i
 J+fKcFG3Q6gzEgpSxPhTfkmCEVjjJw2trOZCscebwgG9LINWfcYYhN0AN7vwz3XZ9pPr
 kvRsHWWEKA22yIBu+Ugc974ameY8bgbc0qMQmfgcPmj33yJ0kMDsFWn9pRuLyzZFGIJB
 D8hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUmcraxGW348i1QZRN2JpvCm0XyVXVldNGmnMfFKzDqt1uSjP+KGYqWNs5GpJDQzFQc5Y7GpBkRg==@nongnu.org
X-Gm-Message-State: AOJu0YxudB9gMCZlNJExK+maSnRSW6KyX/ez2MPVWRbKGvFWZ1y7kiO/
 LX1/ELcSfUthD7yiS12IUR+6po9RDNIL35DBQoBb74JiLf44zzC5UEiFPPUyxRY=
X-Gm-Gg: ASbGncsmFdGADMSWmSgjhsXi3M568+kYUD+dum9Aa0BwaddvLirBiEnFJw4YX634nsZ
 7i2Zblw+UjOPCnT9FfTK+tl6pqTucJ1mE1dOCE6j/s8F2nGwVc6BsZbWnGv7F02QA9CNwk1ufhg
 fC5We/PM5lPcXKQcOXFXvgH5YHmSjHOj+OGg3Yo9zN3qxId1M7HVEPT96Bux8XXflONA2JL9yK6
 WdUccBnUucmYcvpZ8gI0UdvrgnAf3Su1oKqdJijXi+UuerQX4vo8ZScxKZuFWgSi9MiCqM=
X-Received: by 2002:ad4:4eac:0:b0:6d8:8aa6:ef27 with SMTP id
 6a1803df08f44-6d91e418852mr97203866d6.38.1733854867876; 
 Tue, 10 Dec 2024 10:21:07 -0800 (PST)
Received: from [172.20.4.119] ([187.217.227.247])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d9162133aasm20592736d6.129.2024.12.10.10.21.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 10:21:07 -0800 (PST)
Message-ID: <f98e8422-9ba1-427e-83d4-a6d93526a449@linaro.org>
Date: Tue, 10 Dec 2024 12:21:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] target/arm: Move small helper functions to
 tlb-insns.c
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20241210160452.2427965-1-peter.maydell@linaro.org>
 <20241210160452.2427965-9-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241210160452.2427965-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2a.google.com
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
X-TUID: MN2sfvqi4Oq3

On 12/10/24 10:04, Peter Maydell wrote:
> The remaining functions that we temporarily made global are now
> used only from callsits in tlb-insns.c; move them across and
> make them file-local again.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpregs.h        |  34 ------
>   target/arm/helper.c        | 220 -------------------------------------
>   target/arm/tcg/tlb-insns.c | 220 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 220 insertions(+), 254 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2436228ejc;
        Mon, 9 Jan 2023 09:11:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsvkTuLKGMUPXQpmBEdtQiNNS3nFhAKtOBjKOKgQOfuuyKSlFBYm3lHvhfc3Hm7YRFG3Gd/
X-Received: by 2002:a81:ac22:0:b0:39b:4b2e:1c9f with SMTP id k34-20020a81ac22000000b0039b4b2e1c9fmr15017991ywh.36.1673284316728;
        Mon, 09 Jan 2023 09:11:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673284316; cv=none;
        d=google.com; s=arc-20160816;
        b=wvf0P0PPyfJJ1IG5K4aKRHi8zfBwtzZCaofjKncC+dl3zzpv36ndyFMhJQoZwQJdUr
         J2FzJnPIxO7Frv9sy+Z7tw3i1VMkQ6AWyrwGECwbOduCMyXbDwzbbjtwn2qOAPuJAH0Q
         q/fkQJk8RKBMHZoPznisOB4ikSGS3l2G016WqHIhPT5C3wK4A63oZekFe5WADD9I3GoB
         3Vtx0rxqWuTq7SBGJBGGxA57Xf1oM4gdk2ITFkZ+CEVIdBwFxcGyYXq4axvTB/Lg6W35
         LDEaFsid2EksTL59rVDmdiaO3mg/x39JgV7omCX5NmGPhWseKgdlZvqlMUSuYogXwEl1
         YHGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zVQfHa/45xQqxu7dAEmChKwIEyULLSIY67L0WS7I3oM=;
        b=TaSuS0DL6YUsp6onHQ9Sya9M/YlxA+b+AQaKyMhn+nKWbPtlTBBCzzBmuOTyxbux32
         lsaSeAJQbTj4odt3pOvoVsEzwwp2l2KEwixwt87YMnI8xyf0EDEc1QFPzJLpti76znDD
         2iP6k6putzimuxzrYK+csEJImxMw0khdrNaKDQM0PYYLZcLnnMNFNa/FLQfha2Y5lkQq
         gkvNYgGY4+E9iB4eyFnoQQMuqUkV992xX2f5xF7IDfKnt6s4Y9V/7uFx6LoSyBtn/6Xb
         L+v/xSZ17WY5d9FUOBdjgm1nx11TNjgrUQG5sUq9fUoR0icOVS5Mf0PvlHP4/4eykGqu
         O/3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E0T30XnR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i4-20020a05620a404400b006eecf6a0862si5279858qko.547.2023.01.09.09.11.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 09:11:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E0T30XnR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEvgU-0004X9-Op; Mon, 09 Jan 2023 12:11:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEvgT-0004Wu-67
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 12:11:41 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEvgQ-0002OO-Uo
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 12:11:40 -0500
Received: by mail-pl1-x634.google.com with SMTP id b17so2708409pld.7
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 09:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zVQfHa/45xQqxu7dAEmChKwIEyULLSIY67L0WS7I3oM=;
 b=E0T30XnRmjWOIaSvcOEzyX/kgX/t9mVGYOKx2vlwNx05xPG/Gd5mAoYDmobezl+Eqo
 J9wOODNmeUPSCqamZYKtkNkzekQ+oG3wP9wNOzygeZvGwQ2CRc2FqeKHWNZNu+OYFCl+
 Y16OLHzgNa/wDqFymKgDQScW3yIe+futA5MU2zK9CEdbEbNJfE6NsUGhOyzrDILg0pDw
 hR5hzaLl3e5NWbSf4c9bq8hO7PC8d467y/gsD7wTfwp71YZ+83S8PAdevVtDr3+SMYmI
 rb/W+i6fQvngpoviMzpBFLIq4GzJfXSym6+rcZslPH51c0G7ap03ZBj6+ud6onAgMoTi
 TWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zVQfHa/45xQqxu7dAEmChKwIEyULLSIY67L0WS7I3oM=;
 b=hLsx7MVxFSZip2OEv18DsgLMTjeHoJpPf9tQuCkx0K9fp/b+2SucZMThA0rb1spN2P
 bE564Ybn1ggJu3DtjCyqpYcF+v2QsXWzER9Sw+nVRv2F2U0RSeyPnke978f5dX1GaR5D
 dM7YvOKuCiUQEoUpTPN9c9mmi3djdsJwiaihPzz1+XzZcmZCqEm/Xa8xWgvQpHiqzTj8
 Uhh0UywhpNdcTbIKVvvrm2sPCoYxBUjaN//OzXRuVf4TE2ugxJxRmLuH8xRHM3CGk0+2
 +N54XnwhXg8LJDRbbw+P3vxLZgGWd1ZRxvSH3zMOHKQqFzBYFPCGHzMem6B2dEC7PFpV
 N8Ag==
X-Gm-Message-State: AFqh2kpRvAFgtfC2/Ueb/RjrCWiNOASQEGtbANneKB6LuPPLBiN2Bhy2
 U8qWTbZOYBcn+4lv7pjhKiM+Lg==
X-Received: by 2002:a17:902:978f:b0:193:3989:b62 with SMTP id
 q15-20020a170902978f00b0019339890b62mr2541561plp.67.1673284297568; 
 Mon, 09 Jan 2023 09:11:37 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a170902b94600b0018f6e4e425dsm6319542pls.198.2023.01.09.09.11.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 09:11:37 -0800 (PST)
Message-ID: <cba77fef-e846-958c-6684-1ddb8bac4d7b@linaro.org>
Date: Mon, 9 Jan 2023 09:11:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/5] hw/i2c/versatile_i2c: Use ARM_SBCON_I2C() macro
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230109091754.79499-1-philmd@linaro.org>
 <20230109091754.79499-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109091754.79499-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: 8tPzY9+6WGU+

On 1/9/23 01:17, Philippe Mathieu-Daudé wrote:
> ARM_SBCON_I2C() macro and ArmSbconI2CState typedef are
> already declared via the QOM DECLARE_INSTANCE_CHECKER()
> macro in "hw/i2c/arm_sbcon_i2c.h". Drop the VERSATILE_I2C
> declarations from versatile_i2c.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/i2c/versatile_i2c.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

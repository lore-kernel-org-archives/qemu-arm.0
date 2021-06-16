Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp606034lff;
        Wed, 16 Jun 2021 11:41:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSOitChssA4+KwlUHdsN2RkkyRUFIJTrX8NVb8U5sYBHAUvFydrU9CQe/NGTBBDFG+Cm2w
X-Received: by 2002:a5d:42ca:: with SMTP id t10mr585570wrr.162.1623868897569;
        Wed, 16 Jun 2021 11:41:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623868897; cv=none;
        d=google.com; s=arc-20160816;
        b=fFjlcpPeLRdfMSROkZJiKjylawm5F1Z0bxJM15W2ynvP2aOgmPduNvNxKxORHcBBW/
         fyG+u1mQgGdBtRFMNcym+JA4XiNU24wE4fwd2MBc7/kKWPv4B6kbCmHo1qILhWSn5pvZ
         2eyLqBjXZiHwtOViFGA7r1w6LzBzXPPsXgbdqWLk4DBAFLrDvjSQD9vZrk3VzpNvtZWs
         lg4xsD1dYilbODMCIBmrkoxc7C41sggAUtfHdKtCN12hbIBUD6J70LCi+ux+ImG0Vvrw
         QdY61aFmp2E+5hQfr+lXW7/GoIxx+G7Y3CLJXd01mksMfu1/FxKcuqCFNPoeK/TyRsSO
         FcRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=wnARhIGc/0qm84c3ucb4LILfDgeSPHL11j4qKdo3bQ4=;
        b=R0aY5oZH9s50TNuvj4jGPJAP5WxVGAYVDG+gmQG83FcUzxjhg5u5OaSB5snYWFBTFa
         CvsBIfmii3Xr6tnjl1R8l7eX3Ww7ZvVVdJGIitiMDQQy1vkmKeqWm2DLi5Xiks169QyS
         I4MJbReUv8z6WpVlicngu9hemjyive+sVbj7O703Z6Lel/ifDrkEz9jeHV6YozbvO+GC
         hL0olBCHYOA055XQEUY0hCidqZxnC+IHDvBOUdxwOmBArEUn4YRMs1eLTpoYWw4if07N
         g6kOCGvzn+7Xo2rjuWLu5bbOJbq71NVoINmRCEUegF4zilyGpT1mfHlDCbQzo9qF7HSy
         0ePw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K2pMndFP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b8si2948484wrd.336.2021.06.16.11.41.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 11:41:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K2pMndFP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltaTo-00025O-Le
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 14:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaTY-000241-5P
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 14:41:21 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:35590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaTV-0003Mg-0Q
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 14:41:19 -0400
Received: by mail-pl1-x631.google.com with SMTP id x19so1577946pln.2
 for <qemu-arm@nongnu.org>; Wed, 16 Jun 2021 11:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wnARhIGc/0qm84c3ucb4LILfDgeSPHL11j4qKdo3bQ4=;
 b=K2pMndFPV+RU2BNp0DwUdQwCfIn5/Sdkb/naDrktepwrXNlF6d8zMLOm3bHCLKsb4n
 Gii0UVE2YfxpfDfa6DZz4PQq9lDScnzu2mi6hkmvALs5Y8yvzlpXKCZgC8N/oc2U52s0
 IbJYagWuY+sKG2TrNPiGaJsKJaLox4odTE0iGDYKh0CqBbjKIbPuKsatpvEB3FDinens
 KldmnKTnL8P883IDJ3Px8Ptygw+YhQge8i+0G20Kc5f9wO7Z8kK0ATZEHlCFE+SJEpOR
 oNJ4/hwBsBoz6lxiFvYdiYH429Rn1BxS+5A7wKW8abD7QCXl5gzZZyGlT2wJhPJuqbRl
 cYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wnARhIGc/0qm84c3ucb4LILfDgeSPHL11j4qKdo3bQ4=;
 b=Lpq9txWNzXAAbe+pmlXX/jsxpx6ayjQFU3IdP+ShSJP13vGK5XBbj/U3gi44Uiup+b
 BlgLvGG2srdf553CZwj158X9v8HjslBrmyerh4AAwMExUWrIKcTBmOXcdKYGw2Tz8Z5Y
 79C6D8GDZo77lP8WmxLS3Tuz8E8g3pqYZsid9Ga2kdjmu/fYTlh/mdm0kWOAi5BmxueB
 pksXzq4OzC/10cbIWwLIzgw1soGR47xejPO0AXtVrzEpqtdXxDY+i4twqVZnGQBDwuML
 dTTNjYRtNDs9EcCeaAy1uhGiXRCBAT6+UxL/l1yM5drxjGzk2oxDjKy1twcNFzUwhGog
 USmA==
X-Gm-Message-State: AOAM533Oa27omiug8n6AJjYnsRzgKVBu1NiO13SWEECG2IcysjX3nvg2
 9YEqGjdURvg4Kkn9XwUkhQDR4g==
X-Received: by 2002:a17:90a:e2d4:: with SMTP id
 fr20mr12399359pjb.92.1623868875606; 
 Wed, 16 Jun 2021 11:41:15 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 z15sm3246114pgu.71.2021.06.16.11.41.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 11:41:15 -0700 (PDT)
Subject: Re: [PATCH v3 06/13] hw/i2c/ppc4xx_i2c: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c0fd17f4-2c39-463e-f8eb-a8f5305cb327@linaro.org>
Date: Wed, 16 Jun 2021 11:41:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616161418.2514095-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Corey Minyard <cminyard@mvista.com>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p587mI/zGLhz

On 6/16/21 9:14 AM, Philippe Mathieu-Daudé wrote:
> Instead of using the confuse i2c_send_recv(), rewrite to directly
> call i2c_recv() & i2c_send(), resulting in code easire to review.

easier.

> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/i2c/ppc4xx_i2c.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

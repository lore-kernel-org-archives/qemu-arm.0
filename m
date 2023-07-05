Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp3662382ejy;
        Wed, 5 Jul 2023 08:38:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6rdvcFbX6TrkOtwB7AcXwLC/jIYeC4hybIf5EjX/lZRJ9cmN5b6QtziDkGoBMkKkI/EaU+
X-Received: by 2002:a05:622a:1115:b0:402:9cff:4573 with SMTP id e21-20020a05622a111500b004029cff4573mr19366918qty.39.1688571481567;
        Wed, 05 Jul 2023 08:38:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688571481; cv=none;
        d=google.com; s=arc-20160816;
        b=C5nmzs+jd4uDwcDn4dhhUu/pvKhbpnxzcg8L8uZ1wiAtED+CbwehaAX90hI3DSsv+Q
         fjSiUwDA0I/JqXUGg4CRzvL5GGyngtXIXhUPllLNpNjSPKuu27uK8cPIHguQ2aPioeMV
         CNDamtsmSORwyaqQjmZcSUGbQUUZdm2EGS/Vgk0g32frAO29BCZ82hLoeqs+u0l7iZhE
         K0Z66RXxh6226NKVwtRvDnIIXeZusM1Wvn3A0Tp9tjThS+Qp6h7kATrBo/23k/q3cYcg
         y2/g49du+tmZkvyyRIJ1sqoO9huTAynddDnymLA9xtOu+n+8/qtUtIC28+oSSLzEO9tU
         mcyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QGHy7FMXXJn566nQ8DVkTBJYquiPZWI8dwZTvVmhlPU=;
        fh=5V6lsO/XbMWucEL95hDLnujkZS50lEqXaY3oFHinqBs=;
        b=r+CjYZAEWTqJit3y2ka6izEZ8nT4swKM08EH2xg3qIpfggyM1woWCeb2/+9U8QaqG8
         SkdB/JouVExOx3ptaM4sWA7e7Em8DzYTuYxNy/1QmzErc/80gtJQ4GVQN8/PcK6jmhqw
         R7NojDNuglEtg4tamyzroEFKAtg0lyO8UNzw+iWEZHVGZPW7SMlYSlRpFeLn48cgwhYd
         alQUbA9m5cai1LyAacNIi0ZnrM91svELkB9UD03iJWTeTAfcsSyeW9D14DAHB+GQlke3
         k8dwCyUvhC/Unhu2Nn97brOTnS8hFv4LOMNBE7GGLpTtOSsbNeHGJJLZlhU2DiJLuWnG
         C+Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FxTnvDk2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v29-20020a05622a189d00b00400a696ce21si13899200qtc.412.2023.07.05.08.38.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jul 2023 08:38:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FxTnvDk2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qH4ZY-0006Ds-Uz; Wed, 05 Jul 2023 11:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4ZX-0006Cx-9B
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 11:37:39 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4ZV-00088K-On
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 11:37:39 -0400
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b6ff1a637bso14090501fa.3
 for <qemu-arm@nongnu.org>; Wed, 05 Jul 2023 08:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688571456; x=1691163456;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QGHy7FMXXJn566nQ8DVkTBJYquiPZWI8dwZTvVmhlPU=;
 b=FxTnvDk2Z3BpKOID6/Elwz/ubFbAo7VOcGolU9q4Lb5SEZ4ctVy6xCQ6oDS2LiUVom
 cfX1ywDZ1IIeZYLp7x26wKjWxlfI95i/W41ZKBjslWjaZOlF5+6nMdE+bivqpQJm9f1M
 JWsJ09iTtvN47LMZmdwa8R9rY44vk075J8zs1VDR3+Jq5qaf+0RvqNVg2grPCTX1Zgog
 3jdj/r0BTLJrLiju4If0l7BuCbUfsVyP8YymtSc6T6OWT7guOFodSBOpAfEzU9VvVNM6
 p7RmRVdB/GnUiu07hBCiForiJzGniY/we4OnndGFgRtyUu+d3VvouSC90yeOvWzNYSOg
 4wOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688571456; x=1691163456;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QGHy7FMXXJn566nQ8DVkTBJYquiPZWI8dwZTvVmhlPU=;
 b=I4qnp7rNAKeXrL3/urQg3gGBSg5mWlon8mDCKajMazuXrXPprpsI8hoAxjr5mIJ6cZ
 oU+loBqtnXlFDz0YQP/yt+JbPW29DGwLwFfa6mLss+dwEeoHDBA7O6AmCdVp5A0SVrOa
 GFQmXNg3r+B7FXckfY3A+F93rYh7h4MqzLkt8cHuBO/0n7IZmRlVLSGLjkaFpAQXxiRj
 q65SgEENi6RpZ3Yd6Sn+cG5iFkBlWzU1uwU5hxux5VF3wJKZOon15GvXHjO1w6nVsX9D
 2J5CuudzqRFd3J4jYGizR4Q/gMnbPnCySbbdc1Oj+gcbW4drQXz/Broy+Yp+bZRj9hZT
 hgAg==
X-Gm-Message-State: ABy/qLZ6LURJaU2bjyLWv+VBwhhxowQXLECG6MHMPoS6COXqIFcsNyy+
 JpiZ3BLFAEFnQX8rY3/IvFH7uQ==
X-Received: by 2002:a2e:9d45:0:b0:2b6:c394:91dd with SMTP id
 y5-20020a2e9d45000000b002b6c39491ddmr10585556ljj.10.1688571455909; 
 Wed, 05 Jul 2023 08:37:35 -0700 (PDT)
Received: from [192.168.82.227] ([91.223.100.51])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a2eb164000000b002b6d5395732sm3403585ljm.1.2023.07.05.08.37.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 08:37:35 -0700 (PDT)
Message-ID: <d7d27404-fd00-e3eb-77b5-75735b590496@linaro.org>
Date: Wed, 5 Jul 2023 17:37:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 13/19] hw/timer/arm_timer: Iterate on timers using
 for() loop statement
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sergey Kambalin <serg.oker@gmail.com>
References: <20230704145012.49870-1-philmd@linaro.org>
 <20230704145012.49870-14-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230704145012.49870-14-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x233.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: VI35CJ/wlbJs

On 7/4/23 16:50, Philippe Mathieu-Daudé wrote:
> The same pattern is used for each timer, 2 or 3 times. To avoid
> too much code churn in the next commits, iterate on the number
> of timers using a for() loop statement.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/timer/arm_timer.c | 27 ++++++++++++++-------------
>   1 file changed, 14 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

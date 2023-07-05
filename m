Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp3655885ejy;
        Wed, 5 Jul 2023 08:27:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4m36e+99rR2i3ey0b90oO89TQCMvyNQRZbFshu+yrg+h9EsjCsNn5YP7ThiW5hR4tqqXhz
X-Received: by 2002:a05:622a:203:b0:403:16c6:72f1 with SMTP id b3-20020a05622a020300b0040316c672f1mr20158536qtx.39.1688570863777;
        Wed, 05 Jul 2023 08:27:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688570863; cv=none;
        d=google.com; s=arc-20160816;
        b=iK2YY8qU793DWT9reU8ii6RFD9Aaxvy4CHRgXzxr39hS8frBXKxsvXe/BhiAmvX7aZ
         s/Ia40fWZGgnhyYqV/8KHLG+zuJOp6pdPRxrH0+TpwGHJHSG0RQJVWmpyc2zM1pwO3oi
         iLjEhJDh3ji62SAb1+d9pLVeF4TgME05mbNuSoTMYStPUzNW9VSYE0cCRW8oLz1bAlpD
         tzozE9VT69AEyQbBNzn/2n5mRELrYbGQHYjy/D0/c6YzvCK7rm+dsM0MECEouNY14YMO
         dcIfUstW0X7gw4bkTBvTbI2vd+r9l+i1J4+OoX1aUO24vUQOIxZTyGM4gRP5qxt47wtP
         a5vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Qwnkgetev1KB0rzWA9NREXqYVq6GTHJnqsshlco6sxA=;
        fh=5V6lsO/XbMWucEL95hDLnujkZS50lEqXaY3oFHinqBs=;
        b=RRS2Mf0P1zxFawYv7yzLobdYAaRq1cF2uY297l22kK+iVFVVDqRGZ6ryBX6c7m3y62
         fW0uUYFK/ErLaDWp10uGubzMOM+stisq5tWpQGXBgAI35JtrkONXQVE7MC9dmZg/uAIl
         kB76vuM5lb9Bm9Ot8yhuz2uGn+7CH8cAVueQuIm/Mz37HGJm45KNzReNH78kyuVx35XE
         HI6MEWBlNYi4sy1aK88AuMKuZKw/ZqL8JYlt8XYsXgFatZ21Lfnd/eBXpTBKyfPtU8yE
         gcTC7BBz6/Lzkj0f6MGRKp5OIbd/qSD6dHExkn9Ybb4z7VZHunuqJtMuUIhTEj7aGePz
         cezw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pfpNCMfC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b3-20020ac87fc3000000b004034b7077d7si6466945qtk.399.2023.07.05.08.27.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jul 2023 08:27:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pfpNCMfC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qH4Pu-0005jU-FJ; Wed, 05 Jul 2023 11:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4Pt-0005gH-2L
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 11:27:41 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4Pr-0004ye-CL
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 11:27:40 -0400
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b6c5ede714so11074531fa.1
 for <qemu-arm@nongnu.org>; Wed, 05 Jul 2023 08:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688570857; x=1691162857;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qwnkgetev1KB0rzWA9NREXqYVq6GTHJnqsshlco6sxA=;
 b=pfpNCMfCpybgObI63lxGKWkKa1LHj/GN+9+TsMZPII0Fu+C6Slvcs5gLmnhM7leIIL
 VRVL7xAtHyFkmqfQWDt2RclVlIVNrqZdGVpNxdCO1IFa0PLJZz3EW1ohsjivGel258os
 E2lrMDycDU9A027O7kipWTmlSwTbOPvO2VdkdySjukbJod9lZU2wtt+wrx5m0BGLfbm9
 o7k+QpwPraYs1xpcsZJPyuBN7q0fEblYIkP5DqnlpV410jGRuR3EwECKVwUmeeaSJie9
 n7gaqag9ampO1GVohPpSTrfXS+I1H0Zx3IWv2mMdivRbT33omg6wXXcHkbOha2PlQX1Y
 b2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688570857; x=1691162857;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qwnkgetev1KB0rzWA9NREXqYVq6GTHJnqsshlco6sxA=;
 b=A4VyIoXPREitaG6kkoOxOO1tN6B7AODgIjxXOdhHxutFcoC0k484WyBKjDl7L07Cq3
 goXr1WTPo+aDIgrxfXNZUHV+YFtSEcOSyoAb4z5iziXRUmqlZrcCqD1LrgtGihq/hLT9
 HpHokPm2L/L8Gq4yxppT5oGkExBexGAEEZBUTKjMsbT/fs3XyGlA7hS5DLxqdmFW3Tir
 4f0YGBsPVqpMCpoxwmm3xH6KStd4/LUNYh1dJGh5/+97jOLc856jViA1bt1qFRSbItKo
 L5drvBajD4LMRzRX3TbeoLDyjbzLFqIhK4zTOOLUEY7kJrrDqwRxcGzB4wRrPhw+rqg4
 MJ9g==
X-Gm-Message-State: ABy/qLYp4h34c6D3kiM3v56+30RdCFLPLXZrrCqX9SoktEccsAhTuaTy
 /qQhIJcWwY+keMgadhXdqrxouw==
X-Received: by 2002:a2e:8613:0:b0:2b6:da61:d5b9 with SMTP id
 a19-20020a2e8613000000b002b6da61d5b9mr1041568lji.14.1688570857579; 
 Wed, 05 Jul 2023 08:27:37 -0700 (PDT)
Received: from [192.168.82.227] ([91.223.100.51])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a2e9989000000b002b6ea4ed1f0sm1737015lji.14.2023.07.05.08.27.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 08:27:37 -0700 (PDT)
Message-ID: <1a834dc8-88f0-ecb0-c0b5-b3dbe2b9bc38@linaro.org>
Date: Wed, 5 Jul 2023 17:27:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 04/19] hw/timer/arm_timer: CamelCase rename
 icp_pit_state -> IntegratorPIT
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sergey Kambalin <serg.oker@gmail.com>
References: <20230704145012.49870-1-philmd@linaro.org>
 <20230704145012.49870-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230704145012.49870-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x235.google.com
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
X-TUID: VMMCbBrurE+n

On 7/4/23 16:49, Philippe Mathieu-Daudé wrote:
> Following docs/devel/style.rst guidelines, rename icp_pit_state
> using CamelCase as IntegratorPIT (PIT is an acronym).
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/timer/arm_timer.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

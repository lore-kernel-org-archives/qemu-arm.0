Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp2844234ejb;
        Sun, 26 May 2024 14:07:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV/6qHohXCMV1iMww1CYRXhoZQcU9h4kTK839YDeefZ1Xu6jiNzzOA2oTom/s5q0Yn/utZbwZpeYHNL/EZzGIQOFC/u+VUf
X-Google-Smtp-Source: AGHT+IFrc2aHKQ6qfxI1ygrJyjUrMP0I9wuAldAaZ39G/D0tkv+EwfEuZzAOcfxd6YIKw6zbEiM4
X-Received: by 2002:a05:6214:4586:b0:6ab:9607:2237 with SMTP id 6a1803df08f44-6abbbcac73emr82220386d6.18.1716757630361;
        Sun, 26 May 2024 14:07:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716757630; cv=none;
        d=google.com; s=arc-20160816;
        b=O4NO4PuKjQWoe2ftHpLV5b5gp5HRGbqss3unegL00BBohQ70jyaqgPlUr4ClLc0LqI
         oaobYwKlgqv0LF7gfDuuXD4e2C9tjPps6w83kJPEcDVyjSP2YzGckQlqGnzcCIr22cFI
         WZtwDAJdZym5Lj2ZOr4604WM69OkvcQnJtErlTm9Xsj3JuXzqj/Oqo2QD5ahenZ5l4ri
         I4tMzO06aSu8rRg2XasM+uT+pW2s6dcz8qeOUlQR0P+18vQkC5g4I4P7rqAFJSsjGfRU
         nHfONgoEVfmBSBI7TOASzyDEBZYcraFVGTdb2ev92BgWrZl4ltUs/9rAzITZX4RMTRjz
         5YIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:content-language:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=g2aQCQwfrtawqB9moo8kRrwj5sfAZylhYQmBOCSoINs=;
        fh=prcxYYbx+RM02aNBYXa1Zw568hdCKvxWihZ3BRWh01Q=;
        b=JIKaFbsk7g6TjuA6SReQF661b3GXg7xRxbW9uKxgixYvkuHv+Idib2Vc63xLd83W3z
         cxq37NJCEo8YJ4AgxNcqZ0/MqoccOXLRb23G0oobIHUoCoYQTHn2e8rlyfoGxhT352sU
         C/Sz5+cXRWpZ3EF9/jMTmU6igFNGNm1Eh4wxeJ5xmec/4LKrFOWxjgednReSwqE7N9Yy
         3HswdMQRDVrqlbe1RNVURjgpmnpijEfJ6khgE+OsUUA9PI7IS88ptLPp8LXCJ2kgFe9Y
         K/6WiWn+EGobPSQeoLfQrZ90QyW0tnBJlz3/+oCT8ssbrQV4zXVhstnesHAiepJO8HR8
         l5BA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PA8WsOSN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18b6a95si67920201cf.522.2024.05.26.14.07.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 May 2024 14:07:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PA8WsOSN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBL4l-0001hu-BR; Sun, 26 May 2024 17:06:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sBL4j-0001gx-8I
 for qemu-arm@nongnu.org; Sun, 26 May 2024 17:06:41 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sBL4h-0007Q5-2K
 for qemu-arm@nongnu.org; Sun, 26 May 2024 17:06:41 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a6269ad7db2so300186966b.2
 for <qemu-arm@nongnu.org>; Sun, 26 May 2024 14:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716757596; x=1717362396; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=g2aQCQwfrtawqB9moo8kRrwj5sfAZylhYQmBOCSoINs=;
 b=PA8WsOSNxSg4KbUPA1gawRbC61AEEzzdBokpdtaKDerL6FNH5Ve/wld+vpuorNohUZ
 wNGRf5dn5FXpnxwe0q44JzkD9srT+LnLbvWjekgsjxZGbduSnV2kc8SqmWpgCqMDVJox
 QQ611VSR+N/aat9woMsYE8O/kDbuaJHdEMHA2/KeAScYlqOx2/WR+FKVqGIMXpVmXuWF
 Y6bCn7Nm7pdgxxzUMhkxpASq/SMJKOMURgnl2dlKVydmCcloAojvFhRh3tmhgAjo4tDx
 Xf+Kjqa4BWux887lnFVBnWDmjfNKKJqPRZ4VjxRxj0MYXllBkXqWoy5mE5rSdfTuVFgM
 33HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716757596; x=1717362396;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g2aQCQwfrtawqB9moo8kRrwj5sfAZylhYQmBOCSoINs=;
 b=tZtkMAvhJqW3KE0OmJRMusXd0w75dpX/aC8MNhE3RhLgelJAT9OLMzGzExpediMs/d
 +O4uIngqiWT0MJtLs8KKdJv403Pi6HVzN5vp2Q+1cyvyXwD65nyIFG5dtGglhYaj/kyL
 zR7jZYwfB3pCHa4sGKC9JfHa1JkVbaN92KwZTjvX1lrHJ+m2VstmM3xzOu+hvi1PN6gS
 N+8bOaU8hqwY6vWziVGiRiFSJtCJtQ4uhS0E+dNznhJJS7wR9BxvZUWncf67xCUksmwE
 a6B6hR1kIkf5gXJIl6Io5c1P1c24mY+PtIryu20b+DTJDupFXD+gSPZ+W0g2AyA+RUz4
 DMVA==
X-Gm-Message-State: AOJu0YwuZ2kTOvebQCZMPS1lV32NQKwtSjH6dSrwS5mnyYDzz3y4aByo
 Z6TeQwxoxea+XYzJpoMoZeovSHzs+heXN4kOj1cMBzqP67aEAlcCqh5e1nuqN0Y=
X-Received: by 2002:a17:906:f85b:b0:a62:821d:5df0 with SMTP id
 a640c23a62f3a-a62821d5f60mr460106866b.26.1716757596410; 
 Sun, 26 May 2024 14:06:36 -0700 (PDT)
Received: from [192.168.200.106] (83.11.37.15.ipv4.supernova.orange.pl.
 [83.11.37.15]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a62b5d80ff0sm220452466b.95.2024.05.26.14.06.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 May 2024 14:06:36 -0700 (PDT)
Message-ID: <63ff94b6-98df-4e5e-9c53-7a03c7309cd3@linaro.org>
Date: Sun, 26 May 2024 23:06:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Disable SVE extensions when SVE is disabled
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-stable@nongnu.org
References: <20240526204551.553282-1-richard.henderson@linaro.org>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Language: pl-PL, en-GB, en-HK
Organization: Linaro
In-Reply-To: <20240526204551.553282-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Rson2eL7Zslz

W dniu 26.05.2024 o 22:45, Richard Henderson pisze:
> From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> 
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2304
> Reported-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

> ---
> 
> Marcin added the correct patch to the issue 3 weeks ago, so I'm giving
> him authorship here.  I only updated the comment a bit.

I am not fully sure is it everything needed to be honest.

Value 0x0000 in [3:0] means "The SVE instructions are implemented".

The way why it works is probably because QEMU keeps "there is no SVE" 
information separately and do not emulate them.

> Marcin, if you'd reply to this with your s-o-b, that would be helpful.

done


> r~
> 
> ---
>   target/arm/cpu64.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index c15d086049..862d2b92fa 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -109,7 +109,11 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
>            * No explicit bits enabled, and no implicit bits from sve-max-vq.
>            */
>           if (!cpu_isar_feature(aa64_sve, cpu)) {
> -            /* SVE is disabled and so are all vector lengths.  Good. */
> +            /*
> +             * SVE is disabled and so are all vector lengths.  Good.
> +             * Disable all SVE extensions as well.
> +             */
> +            cpu->isar.id_aa64zfr0 = 0;
>               return;
>           }
>   


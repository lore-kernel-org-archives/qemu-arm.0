Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp3660072ejy;
        Wed, 5 Jul 2023 08:34:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Fvvi5vyYpyK9MCKdaK7RdlHfqOG5EN/p0JEN0p1deifZW2+m7Z9PicbReuXw+y26f8x9O
X-Received: by 2002:ac8:7d14:0:b0:401:e0b4:a93f with SMTP id g20-20020ac87d14000000b00401e0b4a93fmr19019957qtb.41.1688571247998;
        Wed, 05 Jul 2023 08:34:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688571247; cv=none;
        d=google.com; s=arc-20160816;
        b=B8t8tXyVT+3Ubj/xSM8VvB2FFyM4VnAC5OY7fviMHjfnOoPiawf7/rYJhR5Lyx/cnO
         Xcqj9+EZucdEO3v98Oh6D0gf1+0Vvyfw0FxVkzKWi4fOk9yNYwJgx0mg9V/FToa8/Dgz
         Ewzwe6S/i2SWEM3UPPxDySCKf3LCTnM7a6BK85+dRGO/do9qInPDEW3tqhPMEKj6wcyo
         HVn+Od757+0r4IHFpKmVIFahn+LtoY2VTWTFcJexBvmNWSPX+912R3wknWPVz74BDd8J
         nSd75VaU/HPxoTLBGoDpe9FG3Xqnz3U8g9mCnGfcWKT6jeOMvmKc3gAqLgBqLb6dH64P
         T3Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=5Y1KsBqnihIP5maK7G9rJTqSvtj7Gzi7rL7r9S6vciw=;
        fh=5V6lsO/XbMWucEL95hDLnujkZS50lEqXaY3oFHinqBs=;
        b=qP5PKIDAjQo7Dc0AzoumvuGfyIUYZCcwwMLAlK0qAe88688MNV8Uk3iq5soIJwoBPc
         32qvf28o9335Q8kiZxy84cXlvBwavJdSSb4kncx7f/kqcDENbtGmC4ZMH5Gmn7/DE6OS
         4djN4CuHgjlzd6W3Gny4cLOGFT3PuQik39XipoA81VG9tAJNl7Xdbuewg75hCeFU9mzj
         GXxwfe0VmEQbUcj8ELszIvU5KG5b5MLhbULAHR2LtVDWeVWdITOsPCTWB50DuVcNkhZy
         sGCfMsQe2uwL6xLiMEFwraAXJf4SVm0Y0l1dh1OfNYQxLK9DQGva3keZdCSajqmP3vcO
         Edxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kejo1v0B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q13-20020a05622a030d00b004035c1727a9si4392177qtw.277.2023.07.05.08.34.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jul 2023 08:34:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kejo1v0B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qH4Vp-00010L-V0; Wed, 05 Jul 2023 11:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4Vo-0000zz-EI
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 11:33:48 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH4Vl-00075f-D8
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 11:33:48 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fba8f2197bso7766065e87.3
 for <qemu-arm@nongnu.org>; Wed, 05 Jul 2023 08:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688571223; x=1691163223;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5Y1KsBqnihIP5maK7G9rJTqSvtj7Gzi7rL7r9S6vciw=;
 b=kejo1v0BZInk5LneCx65/36/IUqrbGMKNnILnQHDM0eOG6m9jGNkIVsjcXpL7yFhbv
 mTo/PXySUNVRXI5y+LRgKmAfJuIRH2Dd4s9YFGWdlnedOLiUxaL8+mn0Bnxbj9s8kT3L
 rV4j3WcHHgPLohxZzEkXnNiwQiYl2R2SSiHG0rkvztvpGfIiEqJp5BhkeV5Nk9DZUpfk
 vcBpzH8V4nIvw4wqnapVgas/1412HJl9tJTUqqO/eT4XblEgs6lOx9lcIxPajetGirf4
 MHN1ooisrhtvlTl0hWMEqAoMPRQJ5lx7WkYPBwz+38wGT1rLTAo9c7DS37YFejRz9fos
 kkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688571223; x=1691163223;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5Y1KsBqnihIP5maK7G9rJTqSvtj7Gzi7rL7r9S6vciw=;
 b=Xddc4EbR447nsBx0oT+ZAcNRd+D7id4BgQERbl9aw1mNoFbIneSXVCJg//YvprJz2N
 99SMg1J80BQt5GQlYBPR8tciQJJvAx/rTiUkCGB5R6DYwWfrVBXUG8KxXIu8fWsjjtsJ
 /BYJuOq+8vXd7TJDUv+4iFA+WxNWBTffOzlwn+a/LzTwUO+Z4Mr7sQ2o2tYwJWJIKX1j
 o+RQSaPG+i1+ICAdZQrKNxgslrO+FBePqsRt31RDj8z9xZQFaoGsUYaRT0v/cERJ+nlF
 nxdLXw5H15TIeRj3oSmxFQD0X5/44DF9vs3/LTXfju/U31Ehq43H8hw3spzDvCwljodL
 AIeg==
X-Gm-Message-State: ABy/qLZ1m4hT7hkvB5CWxOjdVm8KGsByrpiLWOvK4xa7HmIfXpB0/F20
 03wXohuGm5O5pbigS1i1EKM4cA==
X-Received: by 2002:a05:6512:3703:b0:4f8:7551:7485 with SMTP id
 z3-20020a056512370300b004f875517485mr9265758lfr.5.1688571223111; 
 Wed, 05 Jul 2023 08:33:43 -0700 (PDT)
Received: from [192.168.82.227] ([91.223.100.51])
 by smtp.gmail.com with ESMTPSA id
 o4-20020ac24344000000b004fb8118a1aasm4407267lfl.274.2023.07.05.08.33.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 08:33:42 -0700 (PDT)
Message-ID: <c341e2e7-c84f-fcc6-eec2-37730d4badd3@linaro.org>
Date: Wed, 5 Jul 2023 17:33:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 06/19] hw/timer/arm_timer: Rename SP804State ->
 SP804Timer
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sergey Kambalin <serg.oker@gmail.com>
References: <20230704145012.49870-1-philmd@linaro.org>
 <20230704145012.49870-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230704145012.49870-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x129.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
X-TUID: Y6W52mAPUhs5

On 7/4/23 16:49, Philippe Mathieu-Daudé wrote:
> Following docs/devel/style.rst guidelines, rename SP804State
> as SP804Timer.
> 
> Suggested-by: Peter Maydell<peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/timer/arm_timer.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

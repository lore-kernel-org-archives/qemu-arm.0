Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp1712996lff;
        Fri, 18 Jun 2021 09:21:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5MDXdEDP2k0pYamHZzRsAMjCpo91pvOyxUrCJ+9g+5+gKJYcgXo8ZLdFa58wBO9spfsA7
X-Received: by 2002:a05:6402:1801:: with SMTP id g1mr6171374edy.305.1624033303776;
        Fri, 18 Jun 2021 09:21:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624033303; cv=none;
        d=google.com; s=arc-20160816;
        b=ZdlNGanmPJglmiRGjp5yIv5zgEzj31D346Do/FdW2OSOQtgKHaysNnKitbZV2NJbzs
         qQ/O2sJri+aFHjszFgmJQqOxt+odp6FS+29E6kcIu0siYJaJFfhh+V5Qt74XlqRswhhX
         QzucXn+/9utHYB3Ese/wCOWDTcSuYzp9z50T42vlYTUeGaF3roDKszu9CvQaX4VKSxLr
         TgO/b8DFW+QuDj3A2wYKTdSK0flVKZbIZkjXVuQx00kNPM+SJ/YT/AqRpLyIRLpA+lsA
         M6dilnwXbyIAg8FT6Ji/7AZ7dBkBInAk42rcmYe4UxFqkccwgLK37ZwuTxVYMnq5g9ng
         yOlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=svoMLiGKWp5rLH9Qw6GfqztKMlwN5C4ZTwh1gzhkRJ0=;
        b=yV5XrEzBxmV74u+JpgVfqMklcyo4z/erEFb2kuAsDg2pj3QYEQqhrR9XC8ReDIU8mV
         HOqxdehcwo5Kz1uoF8KoKuXYJC2ZcvFDsAtRIt9LFIOKYLdMVcmZbjzas2pIOw7LgF5C
         DdUqI/QZmKTYoWiU/M4aa8t31YM/uB3FHW6oSqzBVJAZ1ojQesiWS4jw+Rlt2iFfCaVZ
         MQXDMr3GcdLcP+7l5aM5CuL+tbPEn2IyQ4Sm6L2jCUW2hQwj1veH9xyrbMOjoG12b8Gl
         Qz3rzXL/g2dKVRUobBMNpwc8LHC7AhPGpguyKle1XR9Dvg8VDSHQRW1wW8CC0EvdG2R0
         GP8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KW8gd4I8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6si2969854ejf.324.2021.06.18.09.21.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Jun 2021 09:21:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KW8gd4I8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1luHFW-0002Ae-U7
	for alex.bennee@linaro.org; Fri, 18 Jun 2021 12:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luHEj-0001Jv-K9
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 12:20:53 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:34434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luHEY-0000HQ-KN
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 12:20:53 -0400
Received: by mail-pf1-x435.google.com with SMTP id g6so8064921pfq.1
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 09:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=svoMLiGKWp5rLH9Qw6GfqztKMlwN5C4ZTwh1gzhkRJ0=;
 b=KW8gd4I8LLWZbO1+UzS4IlyDI5JpEhMUORpaN61hblygFo9sp33jS9QH6eXrZlM3gM
 7wNsiS6Yxsd18JC0/LvldCvHng5T+aiboCy9LX4LrL5mEbHzQXrfNKJm6L4Wo9AXC8t5
 JSxiBmWDn/otYWQnG7E+dSJKSdNYpgtJBkHv3klAXAcj/pNte4eROmf+O4jpZioX3DEW
 Spgi/n+RtRDk25jU25HulOacRtyxkRcNUX0LdBU0moMEnrxJdwiyjsqkvYVbCFSQKe0E
 JcJf4JYa1y9mUe8H0dTCcKg3EA6Tt+sjyjo2l5v5avkEM4bVBtdad4YWfVVqg83xchsf
 Znmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=svoMLiGKWp5rLH9Qw6GfqztKMlwN5C4ZTwh1gzhkRJ0=;
 b=G7cDHq6B9/ImbpaAUExyv1uLiTkK1pW66SDLD6lUhODsDzfrD6b8w3E+cXsmgbgHxV
 JmIoDrxi/wifSax5Id+xTBPmTYTd74e4K9PyW8lTFnbhxUozTYMZZatOVp/tIkD2eaLh
 t9+umf4ZDR0zACXa+Aerfd70IEwHb76IMO8OvoDzx2qEeoz6RHHzAZJi/0pa5ot9UapR
 RDGk8/YJdPWCQhHBPqkxMzJUxZehYx1uzmscjxqYRfPj0RQgoP0irU+FZDOOFe1VjCXj
 a6jYfF0NKV77TdrYC0l99yVmfmpIl3XgOXkBUdt5BL2Hep8x2fmf4QWX2xBaBnPVbs4D
 Fhsg==
X-Gm-Message-State: AOAM531VfOBKwKYfKP9U/TzGhAvW58aGDGlxaMD5kDwgYb12MOZ12KiW
 QiF/brvBuWohf7DriGfsNb9cC+EoW9kcGg==
X-Received: by 2002:a63:2a06:: with SMTP id q6mr10662734pgq.131.1624033240401; 
 Fri, 18 Jun 2021 09:20:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id ip7sm8252871pjb.39.2021.06.18.09.20.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 09:20:40 -0700 (PDT)
Subject: Re: [PATCH 5/7] target/arm: Factor FP context update code out into
 helper function
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210618141019.10671-1-peter.maydell@linaro.org>
 <20210618141019.10671-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <76b2f65f-9144-5d78-1ea2-d8b1edee2568@linaro.org>
Date: Fri, 18 Jun 2021 09:20:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210618141019.10671-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YOkHtleozgK9

On 6/18/21 7:10 AM, Peter Maydell wrote:
> Factor the code in full_vfp_access_check() which updates the
> ownership of the FP context and creates a new FP context
> out into its own function.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-vfp.c | 104 +++++++++++++++++++++----------------
>   1 file changed, 58 insertions(+), 46 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

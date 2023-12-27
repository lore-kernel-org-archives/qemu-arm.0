Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1188748ejc;
        Wed, 27 Dec 2023 14:02:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGi1JuQ35vZ4PgZH7dF+9M/IGsJPhoZrEko0Z2qU4YYdNDvbg72odP+d/2f/dGebZW07Mn+
X-Received: by 2002:ad4:5c6f:0:b0:67a:cdb1:d0f3 with SMTP id i15-20020ad45c6f000000b0067acdb1d0f3mr14044289qvh.35.1703714542179;
        Wed, 27 Dec 2023 14:02:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703714542; cv=none;
        d=google.com; s=arc-20160816;
        b=ecVJU4ltVZ+zH7fSDDhQ7YeT7PbjTSeQ7b2hJAZGmPDIGmUAxNDattK48lcuvVqMKP
         nTdsQC4lgLyOJCz5hzSfhzE/Ode6Wr+LlBJRABlCab1Hj2SThECP/XdFBrDTSuxXMdEW
         xpzXz87ZkqNJb2g/FU9JaJRSxaXoCyePbsCGf4YV6obx4BT1necghOpifwlTqS3/Spnr
         Ae9VMSWfHGTODPSvc6b+WkKJq/ARZqUSsEraADL1Unq+TAvQ4m1t0I2FuTz7/Yo09QF3
         HZdjkttemc8zuaGPxwPDQfdYb+vz4GqM1Ppeync+DWnfG+sM/g+dr6xORc9JecTMCMSC
         vohA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Yscp4jcaTD6tmP/0JCbdjVsrp6AOQnxr2GwE6hAn3A0=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=Y8Vy81Ja40GIu1hVsBHV5Begq7rlDYZYLAVwqBfy4t1bteWq0RfwbtvyCF4Km1DjD3
         FZD4rcNfyxDQPflQJNKHR32OqcsJqN7J7evHHfCfCq13H1KrbV+GyVKSoLJT40vIc+Df
         jAmZCJ3yvieY1RxA4uQLAEXEquWuZpJSXUwZRfS5FOwXK4uCxHHgWHtOorWIDxvfAlcP
         DmJqY3bynYnATpj7Oe7oBySoYtPqoJYH9Z2gW2hF4+ar/AkTZDxtZvmhPKNvnFXTeMxL
         epMM+mwQWCnsRmcV16VAx9N83PL67H60T/S3dxQzS5+dQzRpHxIjR9U0oRvgn0mrfmRG
         OSfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eU3vmya5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k24-20020a0cb258000000b0067f9f28533asi12230319qve.505.2023.12.27.14.02.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 14:02:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eU3vmya5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rIbyb-0002ki-7H; Wed, 27 Dec 2023 17:02:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIbya-0002kG-9H
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 17:02:08 -0500
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIbyY-0000s5-N5
 for qemu-arm@nongnu.org; Wed, 27 Dec 2023 17:02:08 -0500
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-5943a178d57so2637970eaf.1
 for <qemu-arm@nongnu.org>; Wed, 27 Dec 2023 14:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703714525; x=1704319325; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yscp4jcaTD6tmP/0JCbdjVsrp6AOQnxr2GwE6hAn3A0=;
 b=eU3vmya5YxB46q8qJxEvi1CBZbVe85Yu/1mqrDmLhbFsZ5YvuDSyTg7tm1JCAAbdxj
 o+wqbD9NhoWxsghi5CwCgWi04AoNn3/LN3VaUDFOWEm7zcj7RrXsQVwiGXsjrgK3m0Sy
 +GrpISbi7xRmVCktY+XK0w0I3DlkgRA6IS5c0z9tzBfWPMxn967rr8AX5KxjAH5msCwu
 MmzyY5tq01PHDlfpS78qoPBmJNLCp6unGu+SxbuMp84dXH1pbFxZU+2oOzPIf+d/DD1Y
 KsbGAXzafx0IO6tu+Xrd3GrsFhyBvSsTkKPzfSvRx/DhdWqqEFhdzFJG9cRLolfuZTbw
 MMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703714525; x=1704319325;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yscp4jcaTD6tmP/0JCbdjVsrp6AOQnxr2GwE6hAn3A0=;
 b=PI8Ge5O1ta8XUM62qnA7LkMhK+gJdoIQaZZTclY0karl+khgTUwcn9ydBWVhqNmB9u
 LvOtJKzunONO2ithsddHAjLjEKzVLBvGE7RG4WIsbCFEiqy8bIoS4RWJjBDm6DYU2L+m
 +Lfb5KLjXOkAP8I0qcu2/nnk+cRkaI5nMkHxgA1TWDBh70V/ol8VbgQIIYlNx499sNU+
 0K0uiuMk5U8CyejV02XNj80kC4AHnBvhNrUUpEtjRG28xNLdrEQJ+xG20voLr/BeGdNI
 N/M5r+PUPNu20InzykqaWHb+uUP55I+cADnrL+ELczKtYv8eVZU/sSmcvUE+GLobapXC
 eMiQ==
X-Gm-Message-State: AOJu0Yy7P/tZ2mW8bCVwo1YMRI7abVP80mAjBxd6RBK2hsHrsuYQ1Vcn
 h2IQveTY2E0H5D7iRvlroxMTO/Anu/ZR1g==
X-Received: by 2002:a05:6359:6207:b0:170:17ea:f4d4 with SMTP id
 sc7-20020a056359620700b0017017eaf4d4mr4959341rwb.33.1703714525223; 
 Wed, 27 Dec 2023 14:02:05 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a63510e000000b005cdb499acd0sm11770874pgb.42.2023.12.27.14.02.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 14:02:04 -0800 (PST)
Message-ID: <7982b2af-cb6e-4e88-ac9b-6939d2bbce3b@linaro.org>
Date: Thu, 28 Dec 2023 09:01:59 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/35] target/arm: Implement HCR_EL2.AT handling
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: X62ncKhZIavJ

On 12/18/23 22:32, Peter Maydell wrote:
> The FEAT_NV HCR_EL2.AT bit enables trapping of some address
> translation instructions from EL1 to EL2.  Implement this behaviour.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 21 +++++++++++++++------
>   1 file changed, 15 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

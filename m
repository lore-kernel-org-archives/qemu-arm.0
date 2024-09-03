Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1581049njf;
        Tue, 3 Sep 2024 13:32:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUTZ+XbwgMdZrGlib7OjhQCMmR6s3Xvp8eMCL7AqkNAXPRPmk7A2rY9Z43t487/YDUevSc0lOTas0p34w==@linaro.org
X-Google-Smtp-Source: AGHT+IGBC5YKEvwUHp6S26uMc55nteRWMgUUfdf4zYNr3Azs5U2OylxyZYLbtiy+qBjon5qYr1us
X-Received: by 2002:a05:622a:5109:b0:456:6f5f:f211 with SMTP id d75a77b69052e-4575661d025mr125557091cf.21.1725395570070;
        Tue, 03 Sep 2024 13:32:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725395570; cv=none;
        d=google.com; s=arc-20160816;
        b=V/eMgNMTDkL5kPRgc1GRQ5dw3USTZAjC3S7a1cS3tPneFR5LBpndLAXvdKkZoSkK+s
         1i5qC9xH3shotUdw9gZOfxBiKCtrgK8rHsLA3bOeJeJuQsJO8gx7vPZGJxvRn6Bfzb+Y
         GP3biQ+4PTl9/Gp41MX1fLvpojpiNqOsuA2RaLLGYF23B2EaGtzPc2Bf0/nL3n8VmypV
         PwOQseWEuOCU8uvjCooDlLm66rldwrLwMhShGNwcUtauln5oyL+yIHycryso1vL34YuQ
         r74xH4g8qPfavVqHTuW3ynaeNdi6XtiscjsTtXYt9aOBBrWpRcG2yhjbO434/uNhsKNq
         1YrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=k9ZZDqkXRrBX3cIiEQ5oaFl+1xbjoRaGz/6+rV3zlFc=;
        fh=OYa16dMj57zNUaWA1+HZE9HpmDtfIu5eCcItUj9pGmw=;
        b=hykZfMwabmAKtUUiDMaUXCQPwF+AnUqojLm6eEsGL9eVhiLRY5GE2WIXzgRakro8ve
         eIm41JaWGeBcj9P1CkY4tF/eFWLDG3Smc/XnRgwfnFqCITRP4/lsZ2gXWrrUtWo/LqfG
         ZsO7qaXeOfTAtp98s/ksjc8mSVrjHS++q3LHh+xCv9unD1EGpMJw4G843kyt/C/qgJD/
         M6Z7pCi6DMplLViHwsm486X6scl/LsrEmHEBSliY0F+bnsgH4PCXjb3L0+cvBbXuxfMN
         nCEVfL7ZpU9Z266Am3wh3KHCEVGkAbsDdaOSizKtmEl6JsJ5P9LK21myZBM3oYrkcNWf
         daFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EW9t5NSQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45682e27f02si26742141cf.724.2024.09.03.13.32.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 13:32:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EW9t5NSQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1slaCm-0007X6-1D; Tue, 03 Sep 2024 16:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slaCk-0007T6-O8
 for qemu-devel@nongnu.org; Tue, 03 Sep 2024 16:32:46 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slaCj-0006Mu-0a
 for qemu-devel@nongnu.org; Tue, 03 Sep 2024 16:32:46 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5334a8a1af7so6233073e87.2
 for <qemu-devel@nongnu.org>; Tue, 03 Sep 2024 13:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725395563; x=1726000363; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=k9ZZDqkXRrBX3cIiEQ5oaFl+1xbjoRaGz/6+rV3zlFc=;
 b=EW9t5NSQQUonfNbE1KIF8rPPdm2Sp6tLD3pC9LWU21XYQ4RWyvZ61ECujvAgGM/4oG
 1tgmmEImwWHDrAB4cxOIH67lBtQWHJGdzPpGD/6gdYOS9GSMxXZUGKZr22jyi1rkuCNG
 S5CLFe35CEUjEI0mk1NSZKqnWIc7i+94FSZO4Dp6DqPzYN6VcaFgjBoqs/Qg1pSRqJcG
 5Xkujy7G+bLnclv7IdxFs47Ex0z4ZW91u+nl9TG2JZpOpQje2T+p+iyp9Eop9fE2W4mm
 fQq/JP/E/MCbfXZtVbXNCvXcna5MCoYoE9V/fsSDhYFZ5BCdHDBY0bwg3OdhdAG7V5g/
 MheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725395563; x=1726000363;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k9ZZDqkXRrBX3cIiEQ5oaFl+1xbjoRaGz/6+rV3zlFc=;
 b=hYRXzDg3yT1r5YydzaWorOnIMKpLF3DwrRM08Mn1s2kIKu8BMkvd5ijpDWYtqo0L/E
 AMoh/3G1oYGVMERWQT9Tknupmxa2hGoGfg0xB01vvi07U5h7aYMt6Bd1m4kV6D6sT2D6
 7z9wlcS9CwaSXzZHsYrcEt9FnXx38wUwRiokxXdUwgDstrOBy1mQZiE5YlfEdfzquhJT
 yO9kleCeCvDQll9fCMSZzUqrBvp+19JLsXMeoH0jQimuqD3a60pL3XK+24Fx2E26F12M
 Ot1xMdzdm8Wq8j6PXXUVToEBwv/mzoONODkoFAhWDmWUmcSKf3iswvbbL3Gaw8cBPBPd
 V4Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTnWdFvzpk7Mk8jiBokKuJdKEs7d1Ga+X3tGjqh3JSk12k8KbOyfQtzK3CPNwOi6KSjMHZfrnFW2aW@nongnu.org
X-Gm-Message-State: AOJu0Yx0ZPvSZVdHjwtp5iHduqebKjkrzVSuxkOrnY2J66zRbVtBbb3+
 VR4RPIATHFYCnl57n46fzChKZha9Hi08597tLU8f+h4jDbCs0hcywDexyH74pOI=
X-Received: by 2002:a05:6512:3f11:b0:52e:fa6b:e54a with SMTP id
 2adb3069b0e04-53546b335a8mr10941985e87.30.1725395563002; 
 Tue, 03 Sep 2024 13:32:43 -0700 (PDT)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6e33f5esm179460215e9.39.2024.09.03.13.32.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 13:32:42 -0700 (PDT)
Message-ID: <c53ff339-ee90-4e87-92ac-1bad5b68889e@linaro.org>
Date: Tue, 3 Sep 2024 22:32:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 16/53] hw/sd: Remove pxa2xx_mmci.c
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-17-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240903160751.4100218-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6iDQ8bhdZluu

On 3/9/24 18:07, Peter Maydell wrote:
> Remove the pxa2xx-specific pxa2xx_mmci device.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/arm/pxa.h |  10 -
>   hw/sd/pxa2xx_mmci.c  | 594 -------------------------------------------
>   hw/sd/meson.build    |   1 -
>   hw/sd/trace-events   |   4 -
>   4 files changed, 609 deletions(-)
>   delete mode 100644 hw/sd/pxa2xx_mmci.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


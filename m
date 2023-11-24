Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp1089312ejj;
        Fri, 24 Nov 2023 03:34:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9VaRfGwCOZpzhDCZ+5KrOUBxCHg8KICHorurnOpc1knHKcohN0kkrklSttqpEOHDYp5Yf
X-Received: by 2002:ac8:7d51:0:b0:41c:e99b:4119 with SMTP id h17-20020ac87d51000000b0041ce99b4119mr2673066qtb.44.1700825690508;
        Fri, 24 Nov 2023 03:34:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700825690; cv=none;
        d=google.com; s=arc-20160816;
        b=OGvgFx/DyfXwM2D2VKEKZeMRAVX1OYealD+nf92BhebpAmtnwgKHVhbBVPoMTM9ySq
         Sp79zDqtoIDwpA7PO4wqFD8cE1rHQ874xB6G11tF4hNU6IQIManmbcdPZ4HUgI1fT24u
         jDJ7I7MWUePccKoeE2LvvAlBBobLP/lvYPv3yyhbZPXYMy9C0y/idOwnYnkBnSvDMujL
         VUBDnijt24jWF2jLQxkvTBR0Ot+U1mU+uIKq8a/V/K3gtUNvbVS+EZLJgKWgovV/mPK8
         Li4+HI8yZzkfyOuwCcTjjBKFySWfDYCfQ4vocvDOnH5uiQyvcNpbcmGVjeKeDoqkyIU+
         cfcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=VqtibrAOQibndLf6C2EZ9ZrkwOkiHEPpjtCAXoyJQNE=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=wCnmu5hltV6WRYc9MzGyRU7rRt7BkpNpEPBcdTdtGkVkQm9iggHLCOVugGU6u/iAxa
         2xm2gWEVhLnRzozAcU6EGX8oe+dEzJ/73n6vuAbMh/+7P1ezJRBPIhROrh5d+cBNrL6R
         WUL1rupn/qR+82a0XkkZUD6knpgVs01yi4uCF1/ILnUimahfCbu32bNfY7hJYZJdfvQX
         Xz3vSWA0tsSmqdH6E7eNJ5EgcsAftH1j89ZC/vbLO6vghCi8BgPl1t2lrY27LPwVLrIL
         VsSoZFCktTHlYcW/bJx3sFqGnvW5c4aJ3Ps8/pGj3/HZYdgL77G1gLZbnj131RhuulwA
         Q9Dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ez9LLpu8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fv11-20020a05622a4a0b00b004239270ab06si2321827qtb.124.2023.11.24.03.34.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Nov 2023 03:34:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ez9LLpu8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r6USG-0007DI-RJ; Fri, 24 Nov 2023 06:34:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6USF-0007Cz-6T
 for qemu-arm@nongnu.org; Fri, 24 Nov 2023 06:34:39 -0500
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6USA-0007Ij-2o
 for qemu-arm@nongnu.org; Fri, 24 Nov 2023 06:34:38 -0500
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c8880f14eeso22911731fa.3
 for <qemu-arm@nongnu.org>; Fri, 24 Nov 2023 03:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700825672; x=1701430472; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VqtibrAOQibndLf6C2EZ9ZrkwOkiHEPpjtCAXoyJQNE=;
 b=Ez9LLpu8Nnb3RPrXGNGw6J1N0QgORbWzpOHrnCGEHPojCkhshMcZ6eV9wdPP/RyLax
 NlaIuyUNbvmWtGakHQqgm3k2b3QeTH1u/w25sawavFJ+nKkAXBTBTFXb0e9AQs+I7p1h
 Nbyb9Npxgbceru/UgI622CKRb7oGdIdq577Z4AWkS3eMh1y8ulzwKnFC9hQonrETOPky
 pf2aZuLEa1+TifRZeHwOwZDMov0jHnw9tSzQoKr6Y0zaCrxC9asGr50uRaAkuySsmPwp
 KEpguL3hJIogFtFQpwMakEotdUTmNllZR1Kg0ISVD5TY2s4SG//r/kdC4fWdx2aAr24F
 roWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700825672; x=1701430472;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VqtibrAOQibndLf6C2EZ9ZrkwOkiHEPpjtCAXoyJQNE=;
 b=rYcIt9Z+ti6EKnbhl/Lz7nMsXOdqZ8S+3L9CuGUSQ5XKaaLzlixt2/XWYLbV82YIL1
 UgliOmz1IfGhJO/RCRXqn5a5BX4k/FAXTbmvXbSPOjswCbFIUikmin53Gj93ZEMO9KJ/
 XeA9KU9Hi4nQocLOpkdNvrOPPIc9QqN0mxgH2WgOTzZYVUbbhlZSJsO6va4teVP12Kly
 Oca/g4/SkTJ7Di/lYersq0t/J0mRHEGFMngHLkTvc6hEn1fTQYY4d9ohfcRS1IN0wlIm
 v/QkAryMdwb5dZ3n4O2QiCtwiQReRK4E2x6eP9keoN+ZCB3JhM8YUohdKroqRaQK8IBx
 Mhlg==
X-Gm-Message-State: AOJu0YznxSbZxltT5eS0hiBNrnUDSXJo+9W7gFMLCtNt0NNz5Tg86xvk
 oLXV7mo4mno0jjWNiWx65ByL7A==
X-Received: by 2002:a2e:874f:0:b0:2c5:22c0:582c with SMTP id
 q15-20020a2e874f000000b002c522c0582cmr1683983ljj.11.1700825672326; 
 Fri, 24 Nov 2023 03:34:32 -0800 (PST)
Received: from [192.168.69.100] ([176.187.218.17])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a5d504b000000b0032d96dd703bsm4076728wrt.70.2023.11.24.03.34.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 03:34:31 -0800 (PST)
Message-ID: <e917bb45-e463-4ff4-8d5f-3333d95fa871@linaro.org>
Date: Fri, 24 Nov 2023 12:34:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/21] target/arm/kvm: Move kvm_arm_cpreg_level and
 unexport
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-13-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231123044219.896776-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: XR8r9yUsqoR2

On 23/11/23 05:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm_arm.h |  9 ---------
>   target/arm/kvm.c     | 22 ++++++++++++++++++++++
>   target/arm/kvm64.c   | 15 ---------------
>   3 files changed, 22 insertions(+), 24 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


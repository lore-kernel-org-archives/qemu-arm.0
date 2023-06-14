Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp972683ejb;
        Tue, 13 Jun 2023 21:53:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6LhyKJaRkGiz9fLyzQDENm+ok+G1Nnnhf5Q4ccvp2Rx6mah9FJcYWHsnGIOQPZbHKYSmmS
X-Received: by 2002:a05:6214:1c45:b0:621:331b:f575 with SMTP id if5-20020a0562141c4500b00621331bf575mr18871709qvb.25.1686718391300;
        Tue, 13 Jun 2023 21:53:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686718391; cv=none;
        d=google.com; s=arc-20160816;
        b=XDkieA5Dwonx77mAMxGFry5w0wODMz+gplWsMjOe8gOSn6I/0SEW/PqP/PeGOIA+YW
         maE0LcXfzTuf9/tZrkGNbJlGGIf/Zlcv6hzQENfps4Dw08whv7swemFsV4/qhDUhiNR5
         gyjTiOJVB0dIntSCHoHu+HGLeD4xVq8P/jyV6a6c/8b3QVKsh+AJ4l+FonKEznCupNgn
         Mq4W5L5X/kw8xsA328lLdOKqm4qrGRnHANX00J6q9YCU7DO6yWUsnFpDck8s9I9o6Nbw
         uWVywVw9IIAR4lRUmAajSBpNYu8ni8RkZedmqratuyqVcmPoJg0gQTBO5LlWiDk3SdfI
         dsLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=MtrpCegBwZK90b7OkPnODh2IkxezOYP4vr9cegDFRxs=;
        b=LUdHK4pwZz1z+2chMBaAAdCrui1dvasJ5f8wC65YedYi3UpRp6M5cJ5/u00j+hpJKE
         2D92VpeyJfcxv/69Go0O3AfIOXevGpVCQYxrLm/kPKuMcirATcjPXZ1+IJmZ+w0KFo4i
         THcWx2v8rEf37CxjG6tWApT4dPwcEUWSphTqrsraAeKb/EH1UCMLIcKn+tmGX6GMnL/e
         fROv/GWJiE2d4H1yrFxqItpGUbAqsugP+JaNhLUxyLLQr5tG3jMuI26j0SeqUTprhZHv
         cNle3sdI1MGUMn+9GEx4j/rkSDsXOsp4iMwIvF4lb0ee3M7sLTKBPBuIuOwH+njxW7cS
         je8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GYfxWp9f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gi12-20020a056214248c00b005c27e2772dfsi8626799qvb.41.2023.06.13.21.53.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jun 2023 21:53:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GYfxWp9f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9IUy-0004aE-3m; Wed, 14 Jun 2023 00:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9IUw-0004Zd-PG
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 00:52:46 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9IUv-00055F-6d
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 00:52:46 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f8cc04c278so2140525e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 Jun 2023 21:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686718363; x=1689310363;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MtrpCegBwZK90b7OkPnODh2IkxezOYP4vr9cegDFRxs=;
 b=GYfxWp9fMWgEPI196ws9hVF9lxSXz/zKFanM1kU65gY3GSIuT99EDzxh+4dhdhmhXA
 y9fQ5M6NPPtxaao0Dc7J4/WzFkNKYlSY1IEwF/36xCo9cjEtQzL7FzQ1erEcYJl4lA5Z
 KIaZhU4eg+8rVjld2EcRIaAVwOs2xA9RYRP3dOxuDhUUlq+AVg56iIjy3MUOQc7PO8tJ
 cHDFw+TsBdxIk0b86SWw9zVVLySqkcTjoB3BNOYKseKMdOyP8b34znzNnez5p0zKGofI
 cJ0rxYduASRdxW3uFoR9bAK91E/OuQwx32ntrucGnwx9xis5Gb/fOWZFz6BxzuUUAS57
 /pWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686718363; x=1689310363;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MtrpCegBwZK90b7OkPnODh2IkxezOYP4vr9cegDFRxs=;
 b=irv1/C6iKpAcanr6cKu8WH5zyWai0Z9EwVHTp0Kzs4dT+L+vP6eGctH2G+Fv0V53Ep
 eX34piGYdAOTVf8+Lc3IyHppOJ5vnGCgBJxSltk4W8quL8CjndMk5Hj5yTpPqdINLAvr
 V24xjXZRvHN3xpc6+MBM8L4bxg83OQU9FYwTnmNQ+6wz+nMTSupVDEy4v0HOUMMp0g01
 /3Zk4HsV3ZddZSvbG1mZ1i6nC5qlC3PtNXWJ7xpsIhwpUxakjyzgPJzwo6TAXGD+t3TR
 d6BuI9M0H8yGJB11djPxaTmWFskJ3ArCNyxXEijqq/uwYQOvIhbFy6ISszjkWpaKReBJ
 X3RQ==
X-Gm-Message-State: AC+VfDwHzghRHp3JeYev9JDLDrBQT+XXC2LDdbpsLnCHmVLBRE/fExg2
 QOofgtmUJIhmoRtR7hjlcSILNQ==
X-Received: by 2002:a05:600c:228d:b0:3f7:8fbf:a21d with SMTP id
 13-20020a05600c228d00b003f78fbfa21dmr9705027wmf.32.1686718363603; 
 Tue, 13 Jun 2023 21:52:43 -0700 (PDT)
Received: from [192.168.4.112] (90-182-62-66.rcp.o2.cz. [90.182.62.66])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a056000136b00b002f9e04459desm16843788wrz.109.2023.06.13.21.52.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 21:52:43 -0700 (PDT)
Message-ID: <60f532b5-a6f5-21a6-93b2-d063d1a9b663@linaro.org>
Date: Wed, 14 Jun 2023 06:52:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 19/26] target/arm/tcg: Reduce 'helper-a64.h.inc'
 inclusion
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230611085846.21415-1-philmd@linaro.org>
 <20230611085846.21415-20-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230611085846.21415-20-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
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
X-TUID: qNi3ScxSCDIR

On 6/11/23 10:58, Philippe Mathieu-Daudé wrote:
> Instead of including helper-a64.h.inc via helper.h which
> is included by all TCG files, restrict it to the few files
> that require it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/helper.h            | 4 ----
>   target/arm/tcg/helper-a64.c    | 4 ++++
>   target/arm/tcg/mte_helper.c    | 4 +++-
>   target/arm/tcg/pauth_helper.c  | 4 +++-
>   target/arm/tcg/sve_helper.c    | 5 ++++-
>   target/arm/tcg/translate-a64.c | 6 ++++++
>   target/arm/tcg/vec_helper.c    | 4 ++++
>   7 files changed, 24 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

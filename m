Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4461790lfb;
        Tue, 7 Sep 2021 00:24:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqwXtzvNEQLeOvxFAZpsj1dQw58r+J1vL+FjLr2Qqxjg73Hk5lnQCuhfCiclrGlpAFqk3j
X-Received: by 2002:a0c:c490:: with SMTP id u16mr15745456qvi.26.1630999495872;
        Tue, 07 Sep 2021 00:24:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630999495; cv=none;
        d=google.com; s=arc-20160816;
        b=Adp/IpbC+eE5iiqVqmfYr3UMMoWP6dCB1u04C6oed279a+u7Ol0wpY2keJIO0u95Ek
         axJUwkgMkxx7mpPKgFPmro2+LN2fVjDQCuw8sRHmjLSKwA2n/9HHjfX5Nqd739Cbbttp
         lZ4fFkhQ/SeKws82QetvaGi2wEO8ogLH44QvFRRLGjFKKk/vguVKFaMYjch1odui80lt
         /VeGztmznN7rbANyfbu8IdQHxENcE1Ai74NXqsjr0Zcs93zW32x3lGzLJsttCyAZ+gWQ
         Tf1rceNwy3mSoPpFUzv2S1Nz8LOzR3pOHFBdoFWWwSO3/r565E5AKt5oyUsGbAPP4NwI
         NT+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=QZL+aCALsc5cEvTEAkz17o29cl6CAqA8AbLDfTIG77s=;
        b=IC1cudSv1QS8tXoJ4DnRN7wrpPUqt3sD9i0TAVBmTvQU7XZk1QitcoTynQhtz2EClw
         Z5Z5wmezewHwJxa9V/6MzKiwA6xZdAJRGprrSy7fypI0B0H0EjklFL9+UmbqqFXP7xAg
         WnMhB+3UFCkIvYl9u9bFDL7rcTq87Yg63hH36EdXBotRSi1cLEphjOHjBLAEbKexPiD1
         WrsXAaPjr9NJ//5axLdSpBLP5J1sBs1tee1IBVNt23Cv0Py7tH5bY6a17IHYtCxPQ0VU
         Q7LUuE04i17dZ8W/uozvxnNSZ1x6nDCYtZPRelKYVurhBtLyWuiNU4+nZZEMMyBsSB2+
         HOKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=jDVpZ5I4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p25si5773730qkj.2.2021.09.07.00.24.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 00:24:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=jDVpZ5I4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNVTT-0000aI-8L
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 03:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mNVT3-0000WH-H6; Tue, 07 Sep 2021 03:24:29 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mNVT1-0005nE-U6; Tue, 07 Sep 2021 03:24:29 -0400
Received: by mail-wr1-x42c.google.com with SMTP id t18so2193116wrb.0;
 Tue, 07 Sep 2021 00:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QZL+aCALsc5cEvTEAkz17o29cl6CAqA8AbLDfTIG77s=;
 b=jDVpZ5I4jMoNA9kiaf8lhvO+i4g35W+xYGXSlExVXT7HyKdSXTApXZL9RDDA40nT8G
 8DHRseKIByFbsLgdBLmeqxfTZwX+1N1+u8HqGXDpGHfDZbR12WIKE769ulMii9J3+Gfw
 HOC2pG7PSL40oykFE99TUjeOSI+RHBFjytRByCH//5kIabRfdqDxwMi4N7JIkDmzCIXZ
 FlcFLMqUHi9ahrnnwkH8YPDN9auDexu8/0ptXUcxyJhyKd/K/F+Hh8huRWApqGVWYxNB
 5ltT+kRacKiVcw62+Ymqsy/b+1cLSBGYBOkeBRMTW/0DopY+hIh+jeJQ2EGLXruThOWC
 agjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QZL+aCALsc5cEvTEAkz17o29cl6CAqA8AbLDfTIG77s=;
 b=m89iqL7hJSy2Wgrnms0Mk7p+Ub/1hMX45ohqexSe4Q7SeKVuknr9ZzUatMCvNkBVR5
 4Eqtsx0sbZbJSr83Xr7F6t8HwjWTLgyoBqBlT0eDZ+dCuAxoZlkgR75R3riftJ1zQsQf
 3nHL+SlE3Y1QIcXY2dyFpd7Z6W0VNR6DI+yjkYiaPStE7lRUAHeGwIOJKK7nKOirmPZm
 pUDKhRRah2LUMpTqbMh2ynjrRLiNtOXsVs2IoeHGKbm6UOPSJfcWj0vEFt4yyA50EywV
 tgMpuC6QT7LRrS6pocpJm7KSqr+PXIF6lMH3Z6ascHdkZqL2Z/2zTPEkIkOO/9BFlD8J
 428A==
X-Gm-Message-State: AOAM530N3w88kEcv9aXqfJB/m9d3KY+ylAEHkcqKlzePDU/LlrOyprl1
 12+M5gTP1Z0+UQsT5GjjmHHa2OnB990=
X-Received: by 2002:adf:c451:: with SMTP id a17mr17257207wrg.254.1630999465931; 
 Tue, 07 Sep 2021 00:24:25 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id t14sm10141832wrw.59.2021.09.07.00.24.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 00:24:25 -0700 (PDT)
Subject: Re: [PATCH 08/10] aspeed/smc: QOMify AspeedSMCFlash
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>
References: <20210907065822.1152443-1-clg@kaod.org>
 <20210907065822.1152443-9-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fc653b54-20b3-cb81-d57d-70f0e3f3e566@amsat.org>
Date: Tue, 7 Sep 2021 09:24:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210907065822.1152443-9-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.332,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EomVK/0XYdCt

On 9/7/21 8:58 AM, Cédric Le Goater wrote:
> AspeedSMCFlash is a little object representing the AHB memory window
> through which the contents of a flash device can be accessed with
> MMIOs.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  include/hw/ssi/aspeed_smc.h | 13 +++++--
>  hw/ssi/aspeed_smc.c         | 78 +++++++++++++++++++++++++++++++++----
>  2 files changed, 79 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

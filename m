Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1895802ejb;
        Mon, 12 Jun 2023 02:38:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5SloxZqBO+Ql3B/I8X8H5rTz9IQEq4tkVJWYxbkHmv+4IC5L42+k6he8q/ANYdAK8+3hi5
X-Received: by 2002:a05:622a:58d:b0:3f6:af73:3c59 with SMTP id c13-20020a05622a058d00b003f6af733c59mr11509397qtb.58.1686562701611;
        Mon, 12 Jun 2023 02:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686562701; cv=none;
        d=google.com; s=arc-20160816;
        b=FW2gPOcrx8Y102eTaTxOGkAgUmFcyrgnbEp20Bv8Wyf4/6/dRO20rj0PQBWigG+0zn
         bvZdcPWpavvi8k57kIJCjDuqtOMnQySOJEPB6bRckn4oCUfqI+tNSgb8R5a7BJJ+bZdq
         uh9kUz7awT0PFibl0OYKAdJQSNYb6Pv3spKEQw7+sxfsxff+as5f/7sGP4ZlD0f8cL16
         E3ObWNWl7VT2Han+mBQyHTH/nTd6RBah3/yPY8//AZlQg4NHqjruqW7In72gPbiOZCAU
         7qQBz+jxZKpHk+LYR4TXlci/fPOOUp4OXZU3rBy6cxdHuKpycQSbYtyXlnXEaBBCFpMu
         Mgnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=hkArH+ZpwrHcdflHjSZPYlTdjwXL00PW4I/jIGQYQEA=;
        b=l4clPhadRZAlRl+kwHuv+6SlilnsWLtaGW2L8HzwMU6+Ue3An9GAkoow7hXQ3BhL4n
         pLRyiSTHOwZooOLOlaJybHJEpvhnSdBIpW6urZFwj3GI5syKGSDAwrDz9G6o7JoXQHED
         xWugnQCSzb2ra+3L5fm9AjYDT4kvfW/OdDesQDJVJkF2Nr2OxJMp2Zkr3YP+2aHS9E6X
         Utbe7sBXUiAFXhUwZPYL+5HpEBDns9qWK7k8fSyIOIrJTE8RnSS+cFYT6fPwzsj6aHfG
         SKeA+tVaNxI08Z5MzOSSjs/L02rB6naOxqSgg3tR3SAxHIU08AfMzm82Av4YlFOETj4n
         xS7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S53wWW6i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b7-20020ac85bc7000000b003f6b1853c9asi5585316qtb.276.2023.06.12.02.38.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Jun 2023 02:38:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S53wWW6i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q8e02-00078A-TJ; Mon, 12 Jun 2023 05:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8dzr-00074t-Vi
 for qemu-arm@nongnu.org; Mon, 12 Jun 2023 05:38:03 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8dzp-00029r-Ie
 for qemu-arm@nongnu.org; Mon, 12 Jun 2023 05:37:59 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f6d7abe9a4so29426245e9.2
 for <qemu-arm@nongnu.org>; Mon, 12 Jun 2023 02:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686562674; x=1689154674;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hkArH+ZpwrHcdflHjSZPYlTdjwXL00PW4I/jIGQYQEA=;
 b=S53wWW6i0F6bNGKMaIXPGzOR7sXvhkrd/wmi5eU2edI0sN885Lr9oyeIxlo77ynikl
 ppZ7CIpQA2dnN8BvuAYOulNaJ6oAsZ78F2wJGgVP4VxFBsHFJuQW8QKXIEIYzUtIJ6PI
 3x1+BEBkebRsvaj6VFUuxvEmzhzb2mY40nLR5AfxjJh3Wdfn2I7VYASwEszB+u29CeSr
 XVN58UtGIAYUjRgzbMi6M5dPV5sQPEHPCBou8usl4uDbrTzcJgWV4FkGlxEe5cv3PtgW
 ckLrvc9bDBWXAPTURr4DwS5g0T9VBPe1pYOkRpCTlRyGtIXq0KHc048dEjUGTxfAPoIe
 s6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686562674; x=1689154674;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hkArH+ZpwrHcdflHjSZPYlTdjwXL00PW4I/jIGQYQEA=;
 b=CmR+k8d1MaDMXvUJFJ/QaMK7X525GVt6in8UZBne/dMxmORJeolWEH6X7/oz6pQGT3
 EBKdauy5HQc4brFWiz6V4YqTcMhX3nScwL3uIG3VOJJiL3lDPE7V7HtnLqAzAX3BQuC8
 qIeim8KSkOgjEKRUawzM20F86bsVwirsgVjVdvYxZqQNeYDSzp2BLLZYGJElhdcoeG0c
 iPzcK3+U8n+xya0hXx7utATH5RpAGeAZgi4NXD02dLiDlwyGl7mJH3o2Sh2dzKmIvN11
 RiR73CFscq7hGBMITexdc0ufKTp/R7gPRfiYxoGtnEmkfl7yOse6nxNiCrqhw0iComLi
 C4PA==
X-Gm-Message-State: AC+VfDwkwj1fH+rI8nOLFlPD0AFReWG4UKSPrZ4ma2E+3KDwffFeoZtb
 Fi1PxZNe/Yw0lphLDEZOapiRXQ==
X-Received: by 2002:a1c:7203:0:b0:3f7:f584:579b with SMTP id
 n3-20020a1c7203000000b003f7f584579bmr5449564wmc.9.1686562674398; 
 Mon, 12 Jun 2023 02:37:54 -0700 (PDT)
Received: from [192.168.143.175] (17.red-88-29-166.dynamicip.rima-tde.net.
 [88.29.166.17]) by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c220a00b003f735d6fa74sm10835831wml.9.2023.06.12.02.37.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 02:37:54 -0700 (PDT)
Message-ID: <036a353b-b9ae-8791-0ef4-1c0ae0732d14@linaro.org>
Date: Mon, 12 Jun 2023 11:37:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH v2 06/23] target/arm: Convert barrier insns to decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230611160032.274823-1-peter.maydell@linaro.org>
 <20230611160032.274823-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230611160032.274823-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
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
X-TUID: 34z1nx+qPDU8

On 11/6/23 18:00, Peter Maydell wrote:
> Convert the insns in the "Barriers" instruction class to
> decodetree: CLREX, DSB, DMB, ISB and SB.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-id: 20230602155223.2040685-4-peter.maydell@linaro.org
> ---
>   target/arm/tcg/a64.decode      |  7 +++
>   target/arm/tcg/translate-a64.c | 92 ++++++++++++++--------------------
>   2 files changed, 46 insertions(+), 53 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


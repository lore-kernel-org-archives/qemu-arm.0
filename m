Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1012854njb;
        Mon, 9 Sep 2024 10:54:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWLObWJdi2xFkTEXmreKkUJxEoimWSF5l1IrIhy+ZWCKH++QjtkUucx3kvazo/PY5LP/oNAH/RJa5l+WQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG48m9Yj1JPAKYAIabvpUpuM4i5Mh08XoV8wKZZBsIDdZ0GZNrA0VETTKGgQH6kJLBXXH7u
X-Received: by 2002:a05:6214:3987:b0:6c1:6b5d:8cd with SMTP id 6a1803df08f44-6c532b4475emr119446366d6.49.1725904464461;
        Mon, 09 Sep 2024 10:54:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725904464; cv=none;
        d=google.com; s=arc-20240605;
        b=jk/KOml4vjvaqpJHBugh9BKQqAG1iiJ3yOPqyDJp7eVNizgrE+XY2AlkikmHgrNz4m
         Q8usqj5x6aAca66NmfRbLtwqflFZ+7XyUM+WMHawTsxZDDmUVJ5UEltQbLeghVWf16pQ
         70r/ss09mnwRa78gAeyezmHHVPIgNcVzxIzBNxsPwvQaHExrKZNwIBIQeuSgihNGlndy
         cqUBrM+dpNIEUsfDmWhIkXeAY8ePZoUzwluypRsApS04BPA99RIX7VvJWRsrruc3q4ja
         Q0y8PNKgDLKi8lx/aPCod0rzq++8h186TE1gQ7BdpFf/gKOL7eikkPNl/2FCGMuF7tep
         bvEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=IgttfWwyHsrLhV8Bk1VadSvyVR9BDE041SzLU+ej6yg=;
        fh=HKhXK77c4KCPio1sVcbJKPWr4Q4rmyZ2uEP7Vl5eke0=;
        b=kcHn29p5OiLUCcIw0CB7K355poucne0OUENYOKRrNsSaZmRXVt/9hAE6vCQ+vYMM1W
         KJNEHuks7OUA1d8/PnccJCT6iGw5Spi1vTHg5GJgeJO+EA6mwgSlNKnIazcJ+cs9eY82
         mom1phciOq3b6g9ZPxPgBcxw5lBSjY1B0kBgNjvn0BMOlUxwle1LgwgSXYlOQfxddmW6
         7g4z5A/8jIBbNbV3/1BIjckEAr2yjsl0Uo6fCpQYjaE4ciQY4XTyaWxVXPlUXIqMW4oh
         BCR6LZfI8QefPkpaOXGM5iHEMhMjHczq94uofSrC7668cwcn2XJ2b5VDR/Y/k8u1Eh1p
         O0QA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FoXYerHQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c534330557si59406376d6.71.2024.09.09.10.54.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 10:54:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FoXYerHQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sniaj-00080h-Bx; Mon, 09 Sep 2024 13:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sniaf-0007UT-CE
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 13:54:19 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sniaZ-000077-B8
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 13:54:16 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c26815e174so4849326a12.0
 for <qemu-arm@nongnu.org>; Mon, 09 Sep 2024 10:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725904448; x=1726509248; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IgttfWwyHsrLhV8Bk1VadSvyVR9BDE041SzLU+ej6yg=;
 b=FoXYerHQjxoGsM+Krab19htU8AKs3lo5gDVEiJhAfJ28lRIUslU4r0ZGp6KgTq0k+A
 8XpdcN5xkzOy5cZczHObbtodmfRVBulIGjkWCAhuZrlWQgwJfyofU8RHKxZhFwqqySZR
 1o/R0uuQxWHOePZRO9yhS4zM1vqGb1WUEVYol9isz0/afC1S5LYGIw1ka06uw6T/iC8q
 NgyPqUcAEkvbrkVpL3+CIICDAI+0TtpdkhrMn/aqKgpkZbnQrpq4fCoPfiXD3dJfDxyf
 YcJv7Z41WQQvdhUucsmWlemdNoqVqaC+5dPCDIkLnBzEnoB0QfEIbw/PGKFc29DYSz2F
 lY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725904448; x=1726509248;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IgttfWwyHsrLhV8Bk1VadSvyVR9BDE041SzLU+ej6yg=;
 b=S2+yvyiuRoNbIcuqRuXeD9vPQdY4ia+JDPYQLIUq3MfAmyXu0/JpW5bcpxyYqL8pwV
 MPvfgMe8jXH/4kpLjOX+eModKxyjxyZ7qrninhdZRZ2kuBEfEmsORyODymD75+qrOFYi
 ROw3pWaMLWYg9BbfgFbXxuTGokQfbg9nkZmHorkH+j+nCiK90fcWwtsEhD064vFH3SDt
 2s2LTU2uyenpkFBHld710kgxKPgoqkS3rxCM4nUh2UT3W1FgqKeF1uNNfw45rP6O/Et8
 mLPBu4ykYkqQ2/n9FqCbV3BCO5u4r6gdzNEtF35DnFw72AWqtc0aljfWqCqEUv1HBqjD
 8kdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEi0Wtw37gY9VIhUOPKu929H1YJ/oMNfHHxFSjZHP5G7M9uCoW87HjnnCyJdct7w2LfrN9d+Dx2Q==@nongnu.org
X-Gm-Message-State: AOJu0Yx9a3a2CIuHGvHYoL/O/gPTZ8usDTuumtViarj/kwQCLc1COzPI
 FOkYFxpT8li9v3lLly+1N7/x7BLnhpQxcKtID9Aj0/0JDO/mFvmP0pw6k3Gkj1E=
X-Received: by 2002:a17:907:3da1:b0:a8d:3338:a48c with SMTP id
 a640c23a62f3a-a8d3338b6f2mr581275066b.7.1725904448058; 
 Mon, 09 Sep 2024 10:54:08 -0700 (PDT)
Received: from [192.168.69.100] (nsg93-h02-176-184-54-166.dsl.sta.abo.bbox.fr.
 [176.184.54.166]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25831827sm368292066b.20.2024.09.09.10.54.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 10:54:07 -0700 (PDT)
Message-ID: <42b4489c-61df-4fb1-a7a5-4a0a00398b24@linaro.org>
Date: Mon, 9 Sep 2024 19:54:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 43/53] hw/misc: Remove omap_gpmc
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-44-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240903160751.4100218-44-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: KFaJCEmX0t66

On 3/9/24 18:07, Peter Maydell wrote:
> The omap_gpmc device is only in OMAP2, which we are removing.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/arm/omap.h |  11 -
>   hw/misc/omap_gpmc.c   | 898 ------------------------------------------
>   hw/misc/meson.build   |   1 -
>   3 files changed, 910 deletions(-)
>   delete mode 100644 hw/misc/omap_gpmc.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp192206lfb;
        Thu, 21 Jan 2021 11:56:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwanDKjq9O9ZNu9QXcJBRVtQhbx8BHEQFYQwEPUZAsJwWq0lrJfP08vpVE+KphbNefh8XEW
X-Received: by 2002:a25:2606:: with SMTP id m6mr1445508ybm.213.1611259006916;
        Thu, 21 Jan 2021 11:56:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611259006; cv=none;
        d=google.com; s=arc-20160816;
        b=dhFDboyLbbY83wiTOBiTiW8oTkE24XzAI1q1LhgCOLkjlO9vKIichMaaHHwVmtQJE8
         n4d0VwMyU2HEPF88JOUIla9nvY2EeO66+hPsy4Ad8RFoupxFX2pHfEBN5qeD8NkwisDI
         ye58eDHcNM7O5xfmKyxwt0rNC5Xh3z8pfQyxTNIXqqCuCngySpFsqT48IsniwlOWB0pg
         uGe1KgNp3wu5ZHENPjPWx3rMTlfkJ8hQp1ZtbxWyQ7q2t/ccmarFNd0Oa5WLvFppJBMq
         lOfoF3de43MGo3bsTaEGwtJM0fwQl7R9Vk6tH8GXXmBfjs8AfyT03tAqLMZ+lbu/qGXJ
         Fn4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=cvn36IjyNWynqnj0NTdBbXAB8BctJx158QAFYSxox8w=;
        b=med3zxUStKOq7J5JiCR5FuZvIrrXVK/xpFfcYe7LWFKkfD75rdL9BOGIqxWLtNmq7q
         P1yJRAkbPH0jg+zlVNRe0/aQJ3M/qxvTpV2lLfzBoJDaRrOTQN5nl9YF2L5xUnQZEc9B
         NxXFRdIG7URzQ/d9h/SkgLRmx5mWb5V4OffdiOiPllw8dqbKKYST4TIHRXsneIGco+Am
         cM5lFJZxcREJUBGOfp6PbvaXaswBLNZ5HjS+eqCaIPtpn/O1UcVI61hISkSrjJKGpBRc
         TosZ4NuPitxelhp67hhnPZzjSsMlcFAVKXpcsVSGm+LH3mLDedzVGcxhPMreaN/LAfDp
         pCmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cnQ2tVJp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15si7249776ybi.77.2021.01.21.11.56.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jan 2021 11:56:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cnQ2tVJp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:58110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2g4U-0001eR-8u
	for alex.bennee@linaro.org; Thu, 21 Jan 2021 14:56:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2g4J-0001Zx-UQ; Thu, 21 Jan 2021 14:56:35 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:46033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2g4I-0001jm-BD; Thu, 21 Jan 2021 14:56:35 -0500
Received: by mail-ej1-x630.google.com with SMTP id ke15so4335205ejc.12;
 Thu, 21 Jan 2021 11:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cvn36IjyNWynqnj0NTdBbXAB8BctJx158QAFYSxox8w=;
 b=cnQ2tVJpIMV/JFxmlxB7co281zlyeF9I2o9cWiKDoMIKqDg7mZOacjr9MN2c/4PuNv
 Vc3+Z5X4BLm7kYgw7L6DtFhhgAKMBd8YPK91gwPAhanXsQ3/J8DJmpZAdCT+bGeS5sAc
 UdzKUcDhYahC9JToVa4SjOUeGUS4HPAZHjpeSHK+Jw+ldWx5YzP/CUnT3SBq32s9GeXq
 cpEdlJ6WNH0a6DK526mffFfgp2pCRnP9qUp3MGItefRbpzno3QNji5gu5hKMQUN2iw3x
 jMu5PZUGVwi4qwnk6HbVMJ2dZYxvbk28gr2swocTZM7qLMYPyPpHlPe1dybd7vJCLYwf
 EJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cvn36IjyNWynqnj0NTdBbXAB8BctJx158QAFYSxox8w=;
 b=aKh5NTPaP6PiKipFKWGlW0AZ7M7V68dtcZqoV6C4cDV12yYuNvJHRdp6hDjrk3og/2
 xDzpZDzVEz5ygDi0iJ/HhRoDbN4x0qdsBDXaDwLu8HwSz4zklSwHKuej76qRV/37dKBB
 rYyvREfK8rwkyo0WeS9IY47LiqRywqbFPn0GXJcsRygkf1RH462sHIuzbRyzjl/+X4js
 KGQAVmET13bf6dVVU0YXpVAUX5fm4oScLRufVlrUPAc+PIq+8ugPonrrF08qeFgdaBGm
 zQC4CF0dzTRInATQtcwQw9V8sN3vxKL2oBQiiZlv3J0E3SDI0s8xAPt0jNTUz0EJebBK
 EmIw==
X-Gm-Message-State: AOAM533rxnfT8fVCjr0t5KslYogTqAjeCeyS1/RIJijO9KWcLrlHu4cW
 k+/h/4jlhFSsSRS/khebXOs=
X-Received: by 2002:a17:906:3a55:: with SMTP id
 a21mr754578ejf.516.1611258992212; 
 Thu, 21 Jan 2021 11:56:32 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id ke7sm2684276ejc.7.2021.01.21.11.56.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 11:56:31 -0800 (PST)
Subject: Re: [PATCH 03/25] tests: Add a simple test of the CMSDK APB timer
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <962827b1-af36-b15b-2b2f-1db8459a6d25@amsat.org>
Date: Thu, 21 Jan 2021 20:56:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121190622.22000-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uk+anCCvGlEl

On 1/21/21 8:06 PM, Peter Maydell wrote:
> Add a simple test of the CMSDK APB timer, since we're about to do
> some refactoring of how it is clocked.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  tests/qtest/cmsdk-apb-timer-test.c | 76 ++++++++++++++++++++++++++++++
>  MAINTAINERS                        |  1 +
>  tests/qtest/meson.build            |  1 +
>  3 files changed, 78 insertions(+)
>  create mode 100644 tests/qtest/cmsdk-apb-timer-test.c

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


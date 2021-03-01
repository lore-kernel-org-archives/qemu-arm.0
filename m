Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3199313lfg;
        Sun, 28 Feb 2021 18:51:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqYpPJpUsyALMi3rqOups5R0c3gt8W5F5bNDOsGkRbtDcsK9hF5e0VQ7E0ldV2A8sr7kwa
X-Received: by 2002:a05:6e02:1c82:: with SMTP id w2mr11323823ill.245.1614567107921;
        Sun, 28 Feb 2021 18:51:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614567107; cv=none;
        d=google.com; s=arc-20160816;
        b=FReRcw1rMSPu7ZLp9/4MmE7ZT15Hce7K9OF3QZWM5z6P/qb4UGlm9JIj/zqdBVqx02
         8+kpFshpO4OdBv+n+IXN5ccT/X2UGKvtCescZGf7N6JGeAiTlidZL2x5P2E1ORlOXv3J
         dGmI2H7FkRJcjeyp+VL34qggtMSlX+7woqzJm9wVspEvahkgC2sCL03ZTha2XToA5sTs
         YL5cjgkUPuBEm5qfEFl1DnxL5vLlBoBtV4RNngF3+xOE7G+bJ8FfA5uMwWCkHRU2uU+i
         AFMqbrfXdj4VgL3RAgteYhFJQY/KmVU/rdJV8oBiwrmZVTpdcwCHK/JbXrH88ImQqw98
         AanQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=T+bWCqBT0yEZKsT1fQmx9shdI6w7CNT+CBhJJn+xYPc=;
        b=AMlDklPEYOToQNHAyWaaUsDsoidSD9Y5w8GJzRfGTuD7QBKtEHrxEjKh2uxNewWajM
         ZdB/OO5vjRz5vSnY2HC5JeHbV49J1FOHQ1qwXYgyVlwiL6hyV3dJoi9Q6slXNL8xLxnk
         2nEDqVhukfjL5jIL3rh9EePhaK17OrWu7yd/Ry7JxIIkNzjaULQo8gBHGDpckzf6qWFR
         K79tPXd6MRDW2OAXMLnWegJdsgxApxXvI7yh16E+X0jvUUcR4kIa+m9ckfzDyHIl/2lT
         Vr53b4ksCwpH5eeQ4gTXNmSJlXCPncPOTfzNAAKeY2BYwodPdLLB9F+syZg7WUYu+Ope
         9Q8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e0gOdF5w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12si968475jaq.69.2021.02.28.18.51.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Feb 2021 18:51:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e0gOdF5w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGYex-0004oJ-8E
	for alex.bennee@linaro.org; Sun, 28 Feb 2021 21:51:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGYeo-0004mn-QD
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 21:51:38 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:36868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGYel-0005vG-SZ
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 21:51:38 -0500
Received: by mail-pg1-x52e.google.com with SMTP id o10so10584644pgg.4
 for <qemu-arm@nongnu.org>; Sun, 28 Feb 2021 18:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T+bWCqBT0yEZKsT1fQmx9shdI6w7CNT+CBhJJn+xYPc=;
 b=e0gOdF5wMige0oscjURLZRmvbMqnk0UEb8x+X70Uep3GGmsFyCn/waDF5nf/f7T+gc
 90UZAMCOsKRoVpM/VkpmF8pBikKcqzuZxAi8LkawL6eanbkoUtv2pKM8MbnvT6TdVee0
 573p+BJSyvhzH7fuyHZ6c1Bj9EzN8/uD1TiXRyNFasW2phbyJAnl9kodrg/qbgRDBqKz
 a9hzTIFzW/keIXa6ybZSjMKDOJlKRG2mNoLyn40YW6wkk2/rdILjMhMHQOL7Uvw3zmwj
 QcEr3w+WnNeN80E8Vy8ZVJ1WxQ47DkplJtCFG+tbIdjdyz79sXwU1AKrj6VLSOfw6Mc3
 pSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T+bWCqBT0yEZKsT1fQmx9shdI6w7CNT+CBhJJn+xYPc=;
 b=tYNLeVG42c9ekLe9VOiM9pkuunbXKLZ5/XVO7QNGZGk2faKhWtegCjKknVMQkPYhW4
 tuUMUe7YtagWsglnfRpSXsbYVqroalE1Vu5XW2NE7DIn/ghG3HVr1XJtY+fL6T69otvi
 Dlbctwq8dAnKwqmnnHIs0S1BQWJEMJpuv0PAGn7vVXxCz5gB/BM6+kp2g7eP8ZdSAACJ
 6VOlu5ntHZwtMm54FaafHG53a7dAoopl1xIpsZIrFsTaFDC0ft9WbYmqC2pTxB/2JC61
 QipH5yzETsEL3/k5h6ikI992vyDFNAy8gDsVPiR+b5Zno+QC/+SemupSoi0RuR8QZJDu
 kuvA==
X-Gm-Message-State: AOAM532HuEwN8jWEd+LJnLJYwb2EUBDu6CvG95OdHLxNPd3aMEUfXAhf
 dkaaJZPDQMIWDxenLK/D09JrwQ==
X-Received: by 2002:a63:d057:: with SMTP id s23mr2539571pgi.171.1614567094171; 
 Sun, 28 Feb 2021 18:51:34 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id o5sm15083879pjq.57.2021.02.28.18.51.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 18:51:33 -0800 (PST)
Subject: Re: [PATCH v2 02/24] hw/misc/mps2-scc: Support configurable number of
 OSCCLK values
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <38a7fee9-4f75-b3f6-a1b7-0260cd67d176@linaro.org>
Date: Sun, 28 Feb 2021 18:51:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2jpl2j3evOzu

On 2/15/21 3:51 AM, Peter Maydell wrote:
> Currently the MPS2 SCC device implements a fixed number of OSCCLK
> values (3).  The variant of this device in the MPS3 AN524 board has 6
> OSCCLK values.  Switch to using a PROP_ARRAY, which allows board code
> to specify how large the OSCCLK array should be as well as its
> values.
> 
> With a variable-length property array, the SCC no longer specifies
> default values for the OSCCLKs, so we must set them explicitly in the
> board code.  This defaults are actually incorrect for the an521 and
> an505; we will correct this bug in a following patch.
> 
> This is a migration compatibility break for all the mps boards.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> It would be possible to avoid the compat break, but we've already
> broken compat for the mps boards this release cycle (eg in commit
> eeae0b2bf4e69de2) when we added Clock support to the armsse code, so
> there's no point in trying to keep compat for this change.
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/misc/mps2-scc.h |  7 +++----
>   hw/arm/mps2-tz.c           |  5 +++++
>   hw/arm/mps2.c              |  5 +++++
>   hw/misc/mps2-scc.c         | 24 +++++++++++++-----------
>   4 files changed, 26 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


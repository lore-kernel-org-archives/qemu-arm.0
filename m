Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp2042407lfb;
        Sat, 4 Sep 2021 01:53:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzo9R266vJdIZ2cfWlQ7I/T06d6HgHc970SPM0oQSy1ZTZoXHavcgTJjaHo9CfZWguLt2ve
X-Received: by 2002:a25:6117:: with SMTP id v23mr3893983ybb.103.1630745629703;
        Sat, 04 Sep 2021 01:53:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630745629; cv=none;
        d=google.com; s=arc-20160816;
        b=yje8+a5NzWQAJRApqIb0/s6cu965XCmsW3/UD58z+xaNlOe81847HMh5hz4Gh73kXD
         8j2nWuvWXWPNcyddqtMiYq3donSMYpNUeE43Jab4LJkQuikisFvR+5RIi1oHtBDbF9ks
         MTMDeNr+eopOE2XpK/9PLwqFLlPYvK5CmTiGD9wNeSZaD13urVaOOo7sfYwRDXAFgAes
         cVhfuRzIIcrkqq5COmMqQal9FUU7tVRn9RwzMGUq3Xvt+1iEVfKo/IrOePmCi4X8jkXy
         BTlJh8WM3m2JTgAaChwJ9N6nT3r9zl7o3SmUc80/oTbA7+Fx/Et67zs34k6TGF96m9ZJ
         vVvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=r3wM/V/mwPg4VAc1o8IgpGbuuAEFKB1mV+yYS1SJS5o=;
        b=zKZiZZzKm5oQ+on+uqkK3cJSvRunQOpii0OOPGgjwBegfZbLUqSI3kyhkne5VBPavh
         jrgAWkKYi/+LRFvgQzADzFlmpyjgYUmalJ7fpUQ82pN0Ih1DhrnzFrfK4jma3D4iO8bY
         v4FMmpmm8UBUedWgEBeNJZvk2OMqWdRcXCzhunmibUBNBUBLYdMI6dRreFiM1YMn6LhG
         e0Mh6D+GsZZj9p+BZCPdIrY9r70L447LetyQFSmBx+Re2BLQ0TvSO7iHnK+r40k8rBBu
         4XwcBS3Uci34WjJExISGUKCYXKhlyOb0INHHPWFQXdMoM0Z9ldqcgx1r/qIJVwVg8o01
         zmvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UbpeWH7i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3si1874621ybb.421.2021.09.04.01.53.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Sep 2021 01:53:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UbpeWH7i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMRQr-00005X-44
	for alex.bennee@linaro.org; Sat, 04 Sep 2021 04:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMRQg-0008Vi-Cr
 for qemu-arm@nongnu.org; Sat, 04 Sep 2021 04:53:38 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:44882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMRQe-0000Q9-O0
 for qemu-arm@nongnu.org; Sat, 04 Sep 2021 04:53:38 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so1001337wml.3
 for <qemu-arm@nongnu.org>; Sat, 04 Sep 2021 01:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r3wM/V/mwPg4VAc1o8IgpGbuuAEFKB1mV+yYS1SJS5o=;
 b=UbpeWH7iEE+KOT2WZTmPQ5CXkQf+mYJRY7H3ao5IB9vxXndB+gWZNrQ4Dl1g8LXsmU
 WEDTdNSrHUyqhe/Oiy2kKwPf+8JWfbiSaIcDwoEPeg9GxpcWDc/Rqv0eChW2edSWi91w
 521X2CtvVl1DZd7H3pWMRhVRAzNzXmywwVTh9pg6lOlKw7Rlby0vHxO3W8JIF0w88Pf4
 4yS8Vtm2ZK9Wv1FvwHKVHyZYdePLH49Z4cP2P7HhFwCx4GNr7OUq590d3VFdSaPB0+xC
 nFaNAqTbXhrkaXMOE/fv6omMpexg+XZ2fCPyyIxLaWf7Zc7FAZ8F2v9RWvcNeUHwteDG
 uQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r3wM/V/mwPg4VAc1o8IgpGbuuAEFKB1mV+yYS1SJS5o=;
 b=tG34JmeKFRZHhnm7xE3CQ/y+QTLGRTUgafn0uhogxFKkL7wPCvfjBm4145zms3WN3w
 AipnVm9JWaAlegvJwkBuxD8M7zN+cW2PPf4uXQD9rIwFkdeN9HAUlDyoKtQcgRiRRWGV
 9xqffxDF8ATrhT42mX7RGVSrHsd7g0YZLbepteyEr/5YXVYtEV9qU4hfIqp3jegiQAHs
 ZC4X93L/NK8i7J//CAFsr+sB24klb/l8GYsGK/hqSet79uuh2lU4AeTMZFgKE7RuGtEC
 4mTVW1VH0XenBqqaMgpYp4Xp3LUzzTZjbVzaiUyiqyup7ClDRr9KYgozw/qWngW0lQmr
 yxeQ==
X-Gm-Message-State: AOAM531ag4wZsu/L3kP9PvPmKRdffM7djwzaAeoN1kPQjrE9nTAiP0t8
 APZ/6HK/M5Kbroulj5NyEH3FQA==
X-Received: by 2002:a7b:c38a:: with SMTP id s10mr2354135wmj.109.1630745615340; 
 Sat, 04 Sep 2021 01:53:35 -0700 (PDT)
Received: from [192.168.8.107] (246.red-2-142-218.dynamicip.rima-tde.net.
 [2.142.218.246])
 by smtp.gmail.com with ESMTPSA id y1sm1539453wmq.43.2021.09.04.01.53.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 01:53:35 -0700 (PDT)
Subject: Re: [PATCH 3/4] hw/arm/mps2-tz.c: Mark internal-only I2C buses as
 'full'
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210903151435.22379-1-peter.maydell@linaro.org>
 <20210903151435.22379-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <84432ca3-aeed-b8fc-5cda-fac311ae23d3@linaro.org>
Date: Sat, 4 Sep 2021 10:53:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903151435.22379-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +qMPA9n3DcW7

On 9/3/21 5:14 PM, Peter Maydell wrote:
> The various MPS2 boards have multiple I2C buses: typically a bus
> dedicated to the audio configuration, one for the LCD touchscreen
> controller, one for a DDR4 EEPROM, and two which are connected to the
> external Shield expansion connector.  Mark the buses which are used
> only for board-internal devices as 'full' so that if the user creates
> i2c devices on the commandline without specifying a bus name then
> they will be connected to the I2C controller used for the Shield
> connector, where guest software will expect them.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/mps2-tz.c | 57 ++++++++++++++++++++++++++++++++++++------------
>   1 file changed, 43 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

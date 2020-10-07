Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp277055lfq;
        Wed, 7 Oct 2020 03:24:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySW25kJr5vF6tZAUwdUVJa8NSvZc11jTmIkjo8H0PFZFSECBP+BzvtdR+d/jsnRg47vF6N
X-Received: by 2002:a5b:dd2:: with SMTP id t18mr3188035ybr.163.1602066293282;
        Wed, 07 Oct 2020 03:24:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602066293; cv=none;
        d=google.com; s=arc-20160816;
        b=loaRUPoztE5yBzF+Z/FKpJwBV2GYNoHyoAa+APkdLndyAQldtUrQq4ANtnF1orBLOI
         JBQIIhYDc9Q8w/M/0N2Gj1jwBskChYVXD7JqSm+uioorAc142ZFQrfulj8a40cz4GiaF
         fGvOxopepVsEa9RglEnkgYxvav1GZwaKRNdc1nwmUATrBSc14++gfMuEkagWHkBles+T
         4lGeNGb8+GwkEzhGtTvhSbtJ8eP1n6YyILGbF5k8f47WaoYcmoNPTUS2Cj6WtBM0THEJ
         VgNtirOQTuuAGTT1To6GwwgHpaCbrccjnVc3D9M+aiEhGj3rrLOKx4kqSRxPODLp1eeI
         S2UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=VMe00AEnioIN172xW//yHdndielbzMtEqeRMn+WNZx8=;
        b=RxR3BR916eTlPGSlYBp8lafsw90AQrUPFN0eQzyv/rpaMVfMUQeRw6dub/v7QgNqX6
         BR6H4YVqZqIRUf7pCSnwk1S+oYUiv0EJwABVL5YMScjBP1KAg+UpgE+yCWN2R3fqY0jg
         W3x8OJ/zjCYiXz1pfyy7zcpjrJeUWRo7Ya/Evv1r3HARZL3CTua7EwPus8FST6ULln78
         5jdnctPjK6B/kyTOSJzrJd8XH4T7Uc4kot146ezFE4EKICdyEwh8ts+ixQo2ewCvsyFK
         kpLD9ODrEO8V3JGAJs9rjmxItDUDdTFABn4rQK5aGgQDbKmcUA6jfyBg4xEUJw03Lrfy
         /B3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lOubDKuI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1si1521575ybh.4.2020.10.07.03.24.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Oct 2020 03:24:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lOubDKuI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:57202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQ6cu-0004GM-Gz
	for alex.bennee@linaro.org; Wed, 07 Oct 2020 06:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kQ6cg-0004FF-BU; Wed, 07 Oct 2020 06:24:38 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:44068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kQ6ce-0006Zs-Il; Wed, 07 Oct 2020 06:24:38 -0400
Received: by mail-wr1-x444.google.com with SMTP id t9so1493087wrq.11;
 Wed, 07 Oct 2020 03:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VMe00AEnioIN172xW//yHdndielbzMtEqeRMn+WNZx8=;
 b=lOubDKuIaBaLInw8J7frrp+KCSP4BK72Eyz+gjKJEgK+chR3dsNmbhXRJSVBo1w+a3
 CbqvOk7eTLrJHkQzpRmo4HAlcy2gHqRxqEPmRR3IEWu6l+CKbByxvgs0M1FTjWrv4jBo
 BBF6Rn6PguGwBHZk9C5gGPrBshIWLTJFv5epsgW7JBeUVpOYG1VDbUlN5Bnufb3gTVn3
 Or1chf6eG+bO1Amq104Wm42hyhW2Ih2+IG5/ZE1D67Yvg7T+Zi7rLsiK02Qi10chvOwF
 XRL7Omp05xyjHUz9eOzbdnKXWGhFKV4R6WXZOhI3xXqYPJpma5aBgrt9uvxK8H2gy5pD
 4wLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VMe00AEnioIN172xW//yHdndielbzMtEqeRMn+WNZx8=;
 b=Cwo5twIoGmuZeg1wS/kOHU8SebTq8m+Z5vc+ZgNOiEu2gG0PL5WOC+6iGJ8uQQV++g
 LsYv5jQLjeDO0I9ao7JiN7rkzR9ye/JFoM4gtNzOi5mGFgo+BNk3n5MbfoL3cbayqldF
 HVAB9X3dNWfu38ZN2j5y5LreStV5SJVWKBk4TBXsGw8kHt3loqOypPOFBTg4KAyA4Bm0
 zEjfrQZUfy+UyFGxSATUM3koWtc3ldh4QgsX46Rb6tsdHekjEKrSVs1kFV+9PjG9pqzM
 wRi+8wZj5zca9K6ryIwtIPFfvJY1CrjqsejXD9ps7X4G9cYqukf6H+kOc/E25Qrh6KGn
 0SEg==
X-Gm-Message-State: AOAM531XLO848sk0zPWFYamF8UnKRnQi6nWBBM26LqOlQJYItfksI8TR
 jmj4/eFo6NxqmaFw0K8hvlQ=
X-Received: by 2002:a5d:640d:: with SMTP id z13mr2645580wru.28.1602066274697; 
 Wed, 07 Oct 2020 03:24:34 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id d7sm924280wmd.48.2020.10.07.03.24.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2020 03:24:34 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] hw/arm/sbsa-ref : Fix SMMUv3 Initialisation
To: Graeme Gregory <graeme@nuviainc.com>, qemu-arm@nongnu.org
References: <20201007100732.4103790-1-graeme@nuviainc.com>
 <20201007100732.4103790-2-graeme@nuviainc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c518a446-94ca-f21a-2e49-e2cd8171e581@amsat.org>
Date: Wed, 7 Oct 2020 12:24:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201007100732.4103790-2-graeme@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bDewE+Lg+FyW

On 10/7/20 12:07 PM, Graeme Gregory wrote:
> SMMUv3 has an error in a previous patch where an i was transposed to a 1
> meaning interrupts would not have been correctly assigned to the SMMUv3
> instance.
> 
> Fixes: 48ba18e6d3f3 ("hw/arm/sbsa-ref: Simplify by moving the gic in the machine state")
> Signed-off-by: Graeme Gregory <graeme@nuviainc.com>

Again, this fix is already in Peter's queue:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg732819.html

But if you repost, please collect the reviewer tags,
so we don't have to review it again. This one has:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks,

Phil.

> ---
>  hw/arm/sbsa-ref.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 9c3a893bed..65e64883b5 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -525,7 +525,7 @@ static void create_smmu(const SBSAMachineState *sms, PCIBus *bus)
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
>      for (i = 0; i < NUM_SMMU_IRQS; i++) {
>          sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,
> -                           qdev_get_gpio_in(sms->gic, irq + 1));
> +                           qdev_get_gpio_in(sms->gic, irq + i));
>      }
>  }
>  
> 

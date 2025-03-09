Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp609056njc;
        Sun, 9 Mar 2025 06:59:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXz1LZnui5vbxHhRBXAO9qkaR70GKwsiEnSnr7cnzxXZjXmY/6Our557JJh+FXccpC5nibVkQgENMr0gw==@linaro.org
X-Google-Smtp-Source: AGHT+IFXSJ54Z96wO+SMnWbVaSwAGnPdHDJRFiIJFelTz8je0OmdpK1gfdsdwFUr2ZUnDKysgEDZ
X-Received: by 2002:a05:6214:76c:b0:6e8:f3ed:3f21 with SMTP id 6a1803df08f44-6e90066b436mr152039846d6.31.1741528792126;
        Sun, 09 Mar 2025 06:59:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741528792; cv=none;
        d=google.com; s=arc-20240605;
        b=Pl+fi/ooAIvfvPq3Ir2D9Y7tW6XKnXnNroSrLpS7HvP8cEg/XyRHJtTbOVIkgzWe8N
         fDPPXThVjT1z5Pfju5TGcwRzT3NguGoBK+z68dXSDQ8a27q9S15F3ZAsVAb8i80waiQJ
         AhM1iX9e3i3wXbWy9b8KcjUI0CqKMBHEP0qmSNkEAC8sO9ali431tEiRjiUiOxsk6A23
         BrgLi4vbqizwra9UHkRx7iwAoGTd1klvDeuFUGTx+aQ6hW6f6h5oNA2zL8IVEwq+S2xW
         2bVycd7GtKwpI6Q4TF1DAvBnR0SISwvPTA6HeE9TUxpDgTtE/xlnc3ITiIzhs5/6ggDB
         Em5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=eEye8vaZimNT5jRX+iC386YXLN7uRDLdkTdEWySggws=;
        fh=+AkYB64K0OnPoNVAW2vCqcqVGSfixBVbSwwM5jk5qdA=;
        b=aPVZXlizFQvA3eX/s/f55QdnN0YtxaB8qrr4Ccm/ru+rkbXlM5DsbwF5mZLKfzzx21
         3nNlCS7wPjnf1GAVc696rrgeaMAEUENdtzJjOrQlccovXxM2HJ6tBU+TRvQoj06mp37V
         B13HJIZvfjKVx88kbggatw1W1Btd4k6wtLG/otSQx1S/KFRuCsv5X0pnFrVynu5JZZPL
         pmm4JnOlVP/hIgBYAWIwyXQHUbAiveqHG7EG/v9HJvM12xRe+uBG5wHse8HGS+ppMV2k
         7xRCgRV/Y63w/B3oFuWTRZyA3C6Y2z4cT6MBgLP4P45IVuMQgP4lZRrSNd9PJOBFL1rH
         DT1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="csXMd/pU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e904634c67si46214396d6.404.2025.03.09.06.59.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 06:59:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="csXMd/pU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trHBn-0005NX-5O; Sun, 09 Mar 2025 09:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trHBd-0005KG-Gr
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 09:59:26 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trHBZ-0004n3-Cg
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 09:59:24 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3913fdd003bso277649f8f.1
 for <qemu-arm@nongnu.org>; Sun, 09 Mar 2025 06:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741528759; x=1742133559; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eEye8vaZimNT5jRX+iC386YXLN7uRDLdkTdEWySggws=;
 b=csXMd/pUWRptVqnM6kGWh5kz1KsEp8cYSRoNajWL4mQtLDCr2utAqH8ohi4E7tJ5dZ
 AehF0dRniA/oUKXsIG3NWR989mGa7RrX5Ts7nbqnL4KrB9UgVthxVk9ZOo5Sq+TsHZFA
 AScB/chz0NMyLMvp5ChhcKBN28HdsWO66+qHCr9FHc1Cp+jdzgonOSq938Lu6X8n6Tm4
 DKq2OFpfRstPbDWyc31C5H6garWDYza4gIdeCnezcbuZ/G3F70Vo7YLRc6OARzK+tBET
 Wbf0lHLojsw9p1uhSP3Ui5ggwZ5m4yCpD/3a0uBesxpdubfqXS+35SathU6uLssCAuDx
 LegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741528759; x=1742133559;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eEye8vaZimNT5jRX+iC386YXLN7uRDLdkTdEWySggws=;
 b=gE2FM77CU/N08+Eflz1DvW7R4my+6IxUCrLdSh3jFHQlTnQfV4Gyr73POGlSxVzKnH
 a5p+1IJPoDs5LHTIclKuDP/HPpGF39mEIYh71+fKEv5ppjHLdvrlYzfVdcUr6eY9Pbzo
 I8gpxQ1o1+n0ynHlRCtgsB6fErzQWjoLRrr8be80THVn/JPyjPoqUy6d6juTS6Qsy4KW
 7SP5lvWoN0SUYkOX7ptMiYkr/vmmCJJf4xwvhFqykGGfwzSd0DFQQW+1e5DhSlO1wJsS
 /wwLvyFZfqddS0DCBnRm+qLAAO5Cf0IdR8wa5/hxVRWDtJJ0Eve9JhL2IImJM++TJ81f
 cXBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8KPblZsCeDxnYneoW35Gj5RQEoXHQzr/2WNnzAxisXkLnxu/eGJS/RUmT/dWe4Rr5ARh3HEv4bw==@nongnu.org
X-Gm-Message-State: AOJu0YxqC9QhzByHhSPP/W1KAJtobcUbeGUD3Bak0+rJqj9xVj4hA3PI
 wcmWevGaHisS8zPjAI4hvX7L9PzYzZn2xHQXG9ZS4NEpJ/BGcKkmuCPp4QtSwLcXh0cJ/wPwlyJ
 TgxY=
X-Gm-Gg: ASbGncvPxwaLLLm3kik93Xm2+BeMnflxGS0b1pG9+/QIjvhY/sO5msZ40CyBWDXOFx6
 akHf2WbabxErwqVwBLpYIDBNhibcvwMYoC70EU4EDEQjA4IKxUhLVvAOrghZkRPk+RgfKIOI9Km
 lB5fJfjnQPZ5hCBmEO08MHiUZNoL+2v9UUnPC3jv9m2BDxjW21i96Llm9c7DfLlPnkvxeNjpXDB
 WBlmXnc8gIUBA7ADO5dV/kv/+85CWJeN/YDVBjPCsorLePHR8kaDyXNXqmhIE1sGv0d6M+GDpYj
 lAv5Q86wrx+Zd/KD4VUJyz2AvLs17SBVuxzWAMwd8MUbmYzlWoMaGC+lwcw/VlUjzEhZj67Iv+g
 aPbbGykqSNiXhQCYgvUzVHAU=
X-Received: by 2002:a05:6000:1567:b0:391:1199:22b5 with SMTP id
 ffacd0b85a97d-3913aeeee27mr3360514f8f.10.1741528759090; 
 Sun, 09 Mar 2025 06:59:19 -0700 (PDT)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfbb4sm12143142f8f.30.2025.03.09.06.59.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Mar 2025 06:59:18 -0700 (PDT)
Message-ID: <72466d9b-7395-4253-b4e9-de551afb05ac@linaro.org>
Date: Sun, 9 Mar 2025 14:59:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/14] hw/ppc/e500: Replace generic SDHCI by Freescale
 eSDHC
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Guenter Roeck <linux@roeck-us.net>, qemu-block@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org
References: <20250308213640.13138-1-philmd@linaro.org>
 <20250308213640.13138-15-philmd@linaro.org>
 <6C65764B-E579-4361-94B5-5D217363AC05@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <6C65764B-E579-4361-94B5-5D217363AC05@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: j1TvaozPmvVO

On 9/3/25 09:31, Bernhard Beschow wrote:
> 
> 
> Am 8. März 2025 21:36:40 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>> As Zoltan reported, some U-Boot versions seem to expect
>> correctly initialized registers before expecting interrupts.
>>
>> Now than we have a proper Freescale eSDHC implementation,
>> use it.
>>
>> Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> hw/ppc/e500.c | 10 +---------
>> 1 file changed, 1 insertion(+), 9 deletions(-)
>>
>> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
>> index e85e000f054..7d15c926887 100644
>> --- a/hw/ppc/e500.c
>> +++ b/hw/ppc/e500.c
>> @@ -1027,20 +1027,12 @@ void ppce500_init(MachineState *machine)
>>
>>      /* eSDHC */
>>      if (pmc->has_esdhc) {
>> -        dev = qdev_new(TYPE_UNIMPLEMENTED_DEVICE);
> 
> "hw/misc/unimp.h" include is now unused and should therefore be removed.

Good catch.

> 
> With that fixed:
> Reviewed-by: Bernhard Beschow <shentey@gmail.com>

Thanks!

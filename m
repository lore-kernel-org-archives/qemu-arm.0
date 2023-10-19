Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp618919ejb;
        Thu, 19 Oct 2023 09:02:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHP8bP/XKVZXHSUvUKyHWMOYx8GUIH3ca70/1OSNXin5DuKeMyPOnuz7HF4hPCVmZWQTip
X-Received: by 2002:a67:e1cc:0:b0:452:9356:ab4e with SMTP id p12-20020a67e1cc000000b004529356ab4emr1839273vsl.25.1697731342382;
        Thu, 19 Oct 2023 09:02:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697731342; cv=none;
        d=google.com; s=arc-20160816;
        b=QyFske7MwpYX1OZaIIPSRZmUiiIbd8sMRuoZfBTFh1EUrI3UDeXDTPSjl2lzLvVLG0
         kqrgU8oP51fgqsmOv1FwH7rpyKljPxrzomssKSku4bt+Dwxhqga3axq5Jg4OlK+lDguu
         OtyTlT4D/0K8zTfscI30ORRLrwBH0UOd0DA6ElD/nOdstKPW8QBWPcel8le2ZvMMlJtJ
         8bPnFzihAmEcBIqY+ywOiesXOGP3TD9kdbyQ34hAfPNLQeJjp/tgc46cqcJmVTOblBn4
         ehEEXtCkBDf3q6vQRHXZeLKs1eyN3F+zXhKf7UJ8oj+9d+9e+CghHlazSWNP70tO+Q6/
         gIbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:references:cc:to:from
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=4ZESWvR311D17ovm2EazPNaYzHaKs9IhFUFNrBA8qaE=;
        fh=DpkbP7dEedV4PMQm4eXqOJbSESG+s5DDiq4o/Hms8vM=;
        b=EPxWagzjEwVinq00c4fQS2BvLnFaiGqlAcuj95ZLTWzyVg2tkMVG1xg2zc6xyR5Q+G
         Sqjks8nKtGFvEbVMgWpgesgfFgOP/fxjm7Ot6SkvgNPHtW5/Ukf7gQzbLW35B7Mmd1/n
         lcOHhdb9WjMMZVJ30XS7oihNu+JoYsIGIAyi9+l5OS6jTJ7PJSxk+Q/VVQTaP7FyJDHc
         s8x3bayFTv3nwuqxQEn17Kv0rv78jE4dLybU90VCi+zJk7FDXKKmoBlN2fiVTUjlRNI6
         z9PgZaOq9YJs0OGwgqbWtms8BamVFDMNPyulyN9lLQEU66XcFAsVzBLWc7uy2nS8tZVL
         8kyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HwIoIqoL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y16-20020a05610207d000b0045282d6db51si604917vsg.521.2023.10.19.09.02.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 09:02:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HwIoIqoL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtVSw-0007SQ-OZ; Thu, 19 Oct 2023 12:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtVSc-0007Js-1J
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 12:01:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtVSa-0002b1-Bx
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 12:01:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697731279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=4ZESWvR311D17ovm2EazPNaYzHaKs9IhFUFNrBA8qaE=;
 b=HwIoIqoL5gkTwaHi1k4kln8R+BhDW2x3y5yZrTS8Plv+OdXZ3EeV01VSi+cpli9BqTL4I0
 gzFZ3JrT9cJmW797MPUEikziexSAlzoRNDwZSwOHShjXcOhOSiCAF70h5wDtGOR89tVqqS
 zm9hE08TwNlkcEPq4oJtKR11jOcJBx8=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-kRVZTXTrP5Gj5i5T_CY_BQ-1; Thu, 19 Oct 2023 12:01:18 -0400
X-MC-Unique: kRVZTXTrP5Gj5i5T_CY_BQ-1
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-581d8975bafso4375449eaf.1
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 09:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697731277; x=1698336077;
 h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4ZESWvR311D17ovm2EazPNaYzHaKs9IhFUFNrBA8qaE=;
 b=ZpIoebIoUbR/zCzu+s9jgnnfCybU4VdFrU4MgSL8I6WDdQMKTaQgAtjnpUAIp01+b1
 pHno+REhcryWv0ZokjHnlC/VAA+44OJtdein6XqbWFzCgedakHOYmVhuNHdvlGbwWNJu
 lSh218mcBAHqY8FJ1g9Q3Ks0DaLndFu3xA2jEFRDGVQ5BvwmiTw5vAD1RMkuqU/s6Ihf
 QQ3D6RyX4eY8iXp5iOx6Fvsr+Wb+YYAztPPoF9LRjo8xAx6zHroqeKGTWRzK6zqXvT8b
 go2rZ03NtbhaVBjzzP9nsQwbIwRxc9Q3PNAw7TIyQWb5xrHHM3cdlD65GXPJs4T33Ezn
 EI9Q==
X-Gm-Message-State: AOJu0Yy1SOXlOkXdqkHrXEoSABUlGa5lmD4kLsZxWuz+U+jiV8vOXb55
 ZL/Bb78p/8GtCPizLp6MduhkkHlcTeVlTLaxyUFjVRik67OdlpSYMs66zzWy/JTGVO74aT6LL9e
 JQapPak6FiK4W
X-Received: by 2002:a05:6358:1812:b0:143:82e0:8cbc with SMTP id
 u18-20020a056358181200b0014382e08cbcmr2836108rwm.1.1697731276941; 
 Thu, 19 Oct 2023 09:01:16 -0700 (PDT)
X-Received: by 2002:a05:6358:1812:b0:143:82e0:8cbc with SMTP id
 u18-20020a056358181200b0014382e08cbcmr2836013rwm.1.1697731275849; 
 Thu, 19 Oct 2023 09:01:15 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-141.web.vodafone.de.
 [109.43.176.141]) by smtp.gmail.com with ESMTPSA id
 l4-20020ac84584000000b0041b9b6eb309sm812116qtn.93.2023.10.19.09.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 09:01:15 -0700 (PDT)
Message-ID: <d226027c-7566-4df7-9b94-a2affe754c05@redhat.com>
Date: Thu, 19 Oct 2023 18:01:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] hw/sd/pxa2xx: Realize sysbus device before
 accessing it
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20231019130925.18744-1-philmd@linaro.org>
 <20231019130925.18744-2-philmd@linaro.org>
 <f72271dc-ea1c-46b7-9609-1917e6567b3a@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <f72271dc-ea1c-46b7-9609-1917e6567b3a@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Opk61jv5sMBx

On 19/10/2023 18.00, Thomas Huth wrote:
> On 19/10/2023 15.09, Philippe Mathieu-Daudé wrote:
>> sysbus_mmio_map() and sysbus_connect_irq() should not be
>> called on unrealized device.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/sd/pxa2xx_mmci.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
>> index 124fbf8bbd..9f7a880bac 100644
>> --- a/hw/sd/pxa2xx_mmci.c
>> +++ b/hw/sd/pxa2xx_mmci.c
>> @@ -483,11 +483,11 @@ PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
>>       dev = qdev_new(TYPE_PXA2XX_MMCI);
>>       sbd = SYS_BUS_DEVICE(dev);
>> +    sysbus_realize_and_unref(sbd, &error_fatal);
>>       sysbus_mmio_map(sbd, 0, base);
>>       sysbus_connect_irq(sbd, 0, irq);
>>       qdev_connect_gpio_out_named(dev, "rx-dma", 0, rx_dma);
>>       qdev_connect_gpio_out_named(dev, "tx-dma", 0, tx_dma);
>> -    sysbus_realize_and_unref(sbd, &error_fatal);
>>       return PXA2XX_MMCI(dev);
>>   }
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Drat, copy-n-paste failure. That should be:

Reviewed-by: Thomas Huth <thuth@redhat.com>


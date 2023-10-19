Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp620477ejb;
        Thu, 19 Oct 2023 09:03:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFs8UqAHlv4voPSVOHs9Z9CmTT/hXknxZQJEK6DmvxZ9KRjnRjFZNCGc1cURiw34HUDjeKZ
X-Received: by 2002:a05:6122:2222:b0:496:3906:33e3 with SMTP id bb34-20020a056122222200b00496390633e3mr2380158vkb.15.1697731432218;
        Thu, 19 Oct 2023 09:03:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697731432; cv=none;
        d=google.com; s=arc-20160816;
        b=LbWJC/GwQ6jmJuQr9GKVQ/8D+NBmZlVaOI/sPo/YrpcvrHXd+Xx7I+dtnrtmwdEe38
         /e2wS/oDg4YEp5PQSocqJ1CjVprBcl+jx2SIeVORIWyVXebRLAyILuEiNA5MsY+nP9lQ
         dGUTJtHCtajl6Ml32xqI2P/V2IP1DzTIDK4wQ1aKCoJtrLwbub/TNubd5t/msNihwbor
         5VHY3JlEhp0Xa/1oZGRakyHvRbMMuypwRKo4FfbGQQhYGbebVjj0X4QFGo6N4mllqBdV
         BgAk+b1eHMJt+4m7t4CH/5wLDww5icofGaC4LxWOf9M/Y7NzCzz7qIp1tv0VK1kgkhRF
         OGvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=/XnzNo1H4sJBs7xVFclRp/S6i35hzOQKRILc59mZJuY=;
        fh=DpkbP7dEedV4PMQm4eXqOJbSESG+s5DDiq4o/Hms8vM=;
        b=kDDCSnbYKrfw2vMNXSr5MF32++K6TZcwb4xXKjk/GApvOT8gYiJ1K9NzbyMEft/Ozv
         64oOnlocEXzTdaKEeZV45MSSC12h/lJqWNxPHcUi3ZwdTB37rKq2o9qLLo7kD9R9u7Fj
         Uo03Gp5NbYmWWvysHKbQxif2QvzRcAFvCZya8N85RxAV/7omje5B+e32Pjwl6Z14QLvi
         MTSl6LolGGj+BHYuao6tGLQFd0q8FHxedQ8AWLhOX+i355X40XVc5HfSTROo/qHR4pLH
         2dCbnXAnuDpUThMWtLd1GS+flKv65JoLI4H7LUTaoGhMsdGJj0qmGbOxQNfNRucFDxo7
         08cA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S3wqE7vu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h194-20020a1f9ecb000000b0048fd0f10a38si671841vke.23.2023.10.19.09.03.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 09:03:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S3wqE7vu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtVRn-0006yZ-Pu; Thu, 19 Oct 2023 12:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtVRm-0006xL-NJ
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 12:00:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtVRl-0002QD-0i
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 12:00:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697731227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/XnzNo1H4sJBs7xVFclRp/S6i35hzOQKRILc59mZJuY=;
 b=S3wqE7vufNMpfbfKpykMOU9lMspdPj8IQdQT2aFGYIA7cdPJGzgM0p57kMKWowqioZNriE
 TMLbHxtNZoPEHJ2xR/aVwwkd1q+PxZUXm+8QKhU1TpCVMGmqBX4h8Hqm2IdtGLly8ASDTR
 a6QmWfOblJr+b3U0mRi/ZCRNkoN6saE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-UbBUhbPNNVWi9604-zE4JQ-1; Thu, 19 Oct 2023 12:00:25 -0400
X-MC-Unique: UbBUhbPNNVWi9604-zE4JQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-41cca2532b8so7620731cf.1
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 09:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697731225; x=1698336025;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/XnzNo1H4sJBs7xVFclRp/S6i35hzOQKRILc59mZJuY=;
 b=gmEeMFsIh9X0uqQYORDaHdkdZJJCLX0CDiLv5twPhVuTHbvfIQ8p8cG78UusQquGqD
 hZsJY+Xn3S3qitRRbTm2e8UyLYfzUodrJSI7G5SQLs/CnfMSDVTr8fHwwuS1GQdiGbcX
 wIth/iVfkQpdx8hxcOu+puYIDoiSl3cX/Xl7xgbDl53bblJ0f0vA/sC0DIa4Hu0/9S2N
 /DmOiG4PEOPmulBRKRFCeDcIMwenM7slN2qV5UV2x5+EgtGMs9z2k/Om01/XTWwYVkBm
 s6FHJVUD3x4U+J4DEeECUrW7xbSUPz/jSlq/HXWE+dbOpunDZkl0QZysqevxGxtBpTVs
 5Y7A==
X-Gm-Message-State: AOJu0YzpN53i53ws+xT8XlNpJRTtmyoTSrGetw5hsAuhI9qHsQLwWAe+
 RDKxhLQ6Ac7iefeZazHIbTr1KNAY/uiCJmYTv4TauTeRVqU9s/4EqWQakwiT7EC2XytIMqv+srZ
 +0xxZlrPDm3j2
X-Received: by 2002:a05:622a:291:b0:41c:bac1:6ad with SMTP id
 z17-20020a05622a029100b0041cbac106admr3053783qtw.18.1697731224738; 
 Thu, 19 Oct 2023 09:00:24 -0700 (PDT)
X-Received: by 2002:a05:622a:291:b0:41c:bac1:6ad with SMTP id
 z17-20020a05622a029100b0041cbac106admr3053754qtw.18.1697731224384; 
 Thu, 19 Oct 2023 09:00:24 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-141.web.vodafone.de.
 [109.43.176.141]) by smtp.gmail.com with ESMTPSA id
 l4-20020ac84584000000b0041b9b6eb309sm812116qtn.93.2023.10.19.09.00.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 09:00:24 -0700 (PDT)
Message-ID: <f72271dc-ea1c-46b7-9609-1917e6567b3a@redhat.com>
Date: Thu, 19 Oct 2023 18:00:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] hw/sd/pxa2xx: Realize sysbus device before
 accessing it
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20231019130925.18744-1-philmd@linaro.org>
 <20231019130925.18744-2-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231019130925.18744-2-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: yGiwZdgnCXP2

On 19/10/2023 15.09, Philippe Mathieu-Daudé wrote:
> sysbus_mmio_map() and sysbus_connect_irq() should not be
> called on unrealized device.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/sd/pxa2xx_mmci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
> index 124fbf8bbd..9f7a880bac 100644
> --- a/hw/sd/pxa2xx_mmci.c
> +++ b/hw/sd/pxa2xx_mmci.c
> @@ -483,11 +483,11 @@ PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
>   
>       dev = qdev_new(TYPE_PXA2XX_MMCI);
>       sbd = SYS_BUS_DEVICE(dev);
> +    sysbus_realize_and_unref(sbd, &error_fatal);
>       sysbus_mmio_map(sbd, 0, base);
>       sysbus_connect_irq(sbd, 0, irq);
>       qdev_connect_gpio_out_named(dev, "rx-dma", 0, rx_dma);
>       qdev_connect_gpio_out_named(dev, "tx-dma", 0, tx_dma);
> -    sysbus_realize_and_unref(sbd, &error_fatal);
>   
>       return PXA2XX_MMCI(dev);
>   }

Signed-off-by: Thomas Huth <thuth@redhat.com>


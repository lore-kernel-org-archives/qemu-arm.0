Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp621913ejb;
        Thu, 19 Oct 2023 09:05:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSfmQ9N8sbvMAldtWe1zJXfGAbTX7gX/mxikcxDso0J0Oz3q03sMDXkKbtg4dXXl0X1Tqq
X-Received: by 2002:a67:b20c:0:b0:44e:98d8:c62e with SMTP id b12-20020a67b20c000000b0044e98d8c62emr2439655vsf.33.1697731529085;
        Thu, 19 Oct 2023 09:05:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697731529; cv=none;
        d=google.com; s=arc-20160816;
        b=HY2nroH8KT0YcVAHH5Af0QH29uvreNrFdqNuHLhH2B0+z3g29Suge2lwitTIdU9tgn
         oWmp4k/pX1Gw8pi366jtCSQKeUbjh85YA/NhmJPpQQo/K9ijD8SaTvq5Gp7uL3c2Go/6
         3jB43H6mgaOgLhdHsfFw+zLGoqI+1EiOJuldeSNeHKS6joHLyh4QDA9ZkDSjNcabNIbR
         elJSJ//KWIAIroAphtl0A6FC2JjfIlO2JxQYuZ3zFvcYC9EKeEOuiEOi/xG8jGDDzG+1
         9m5rkb91f6dBaKx8XqeCchJYqciiF21C4yTy7TePB9J1Fqe8TUtD2ti+pOv2b/cbmzpF
         0KNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=lcc7KSLAl8R+GEmJaINwyz4rtiTnxiafEDIKKi+uzV8=;
        fh=DpkbP7dEedV4PMQm4eXqOJbSESG+s5DDiq4o/Hms8vM=;
        b=FWQo2psemcb7nLrs0rNBuuux1/oc4LiA2VIrmcjltTeEwckKR8yIq0HLbGVPEUIZu8
         BjC6GMQsFzV4CRu1esVLOZYQEVOlT7sD9e0pCjE2jzcmVFGSYtEwGmXWfkgODj+D6LpK
         BWupvBD158haAhJEUnKWundHVQWY0i2vB3mVDtzZQsMXS52JjUt8CbedpYHU6/Zghmpl
         eeDfhm5hj4OD5S6hwdYQ2BQAG1xJWh+NU32KVAT3JzIXOQfmdC7PYKnLqRmfyhg2nVxF
         pvJtFXLfiiKm4ZYjmFVghduGQPRro5wq1iijnfyfascGRVrSS6hKE/DH48McCjSfaVB+
         mEjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B2hUvu+g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f23-20020a05610209b700b00452a1d56239si536436vsb.616.2023.10.19.09.05.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 09:05:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B2hUvu+g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtVWJ-0000kK-Kz; Thu, 19 Oct 2023 12:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtVWH-0000XR-43
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 12:05:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qtVWF-0003Rk-7y
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 12:05:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697731506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lcc7KSLAl8R+GEmJaINwyz4rtiTnxiafEDIKKi+uzV8=;
 b=B2hUvu+gzMcAi5w4uBNLU4NsoeDsB6xvHKwxL8N0+nddnJlgVgeTCj/qrReJjeGMd4skBR
 z4aKkKr2MppehbkSsKu8umD+AaAqWP3JeW1fvalU6roF1dlumsnUK20u/wb6TX/fDQ8TyQ
 yEDVoYHHJHS+o3zcxiYMNndqjl2mTwA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-KF3gNFfzPmyBi1GX1VXE7g-1; Thu, 19 Oct 2023 12:05:04 -0400
X-MC-Unique: KF3gNFfzPmyBi1GX1VXE7g-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-417fd6a8575so94061511cf.2
 for <qemu-devel@nongnu.org>; Thu, 19 Oct 2023 09:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697731504; x=1698336304;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lcc7KSLAl8R+GEmJaINwyz4rtiTnxiafEDIKKi+uzV8=;
 b=AM8qEdEoS4Hu8c0ZYAGz3NH7paFbpSnasaqtB5pbvXmHADm5Mk3Fa9uJ29TrlVgZzT
 8cv7Z6KkFHCifZ1+0N7rqllGV6TtO6s1sDh8I0goHPbfry6NunGKswj+/+kv+WbSMgrs
 B10JHcw7xZsnYTQ5+OTvHb98gHaFaxfbNvQyleUD9T2WIcgOfUvNGyykdDieqCNJOh0U
 8iboBGOB/04HP0NEcPg3d4eVU2Rpwex9GmlepUcI5kMmem2BclTlo/j97U2LVOvL3wPN
 Q+K09lMf6+eGodXXwfP04nNdFq8MWNC7ZiSbO3ytKPEevaY6VNNegGDl8tKNXBM8OhVw
 8NVw==
X-Gm-Message-State: AOJu0YzD1dFCLB5XINoe0gXvUTwXXiGh/V+vu6HptHPWXz+nYQBJKfY+
 aPafpcQjlKMSE3lOv82VnAdWD4jfsRzg6Z7Q+QYRUbAIS5iI33ANchZ1uCi5Xg/Lmde8g66KW3A
 q8OTan8C5goPXJTh3KczQIHk=
X-Received: by 2002:ac8:57c2:0:b0:418:c8e9:45e5 with SMTP id
 w2-20020ac857c2000000b00418c8e945e5mr2806073qta.24.1697731503744; 
 Thu, 19 Oct 2023 09:05:03 -0700 (PDT)
X-Received: by 2002:ac8:57c2:0:b0:418:c8e9:45e5 with SMTP id
 w2-20020ac857c2000000b00418c8e945e5mr2806043qta.24.1697731503363; 
 Thu, 19 Oct 2023 09:05:03 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-141.web.vodafone.de.
 [109.43.176.141]) by smtp.gmail.com with ESMTPSA id
 y12-20020ac8128c000000b004196d75d79csm828688qti.46.2023.10.19.09.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 09:05:03 -0700 (PDT)
Message-ID: <9191fbc3-47e7-4e6e-87a5-2598435c584d@redhat.com>
Date: Thu, 19 Oct 2023 18:05:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] hw/pcmcia/pxa2xx: Realize sysbus device before
 accessing it
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20231019130925.18744-1-philmd@linaro.org>
 <20231019130925.18744-4-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231019130925.18744-4-philmd@linaro.org>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YaVKJ3cjqmMI

On 19/10/2023 15.09, Philippe Mathieu-Daudé wrote:
> sysbus_mmio_map() should not be called on unrealized device.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/pcmcia/pxa2xx.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/pcmcia/pxa2xx.c b/hw/pcmcia/pxa2xx.c
> index fcca7e571b..e7264feb45 100644
> --- a/hw/pcmcia/pxa2xx.c
> +++ b/hw/pcmcia/pxa2xx.c
> @@ -142,15 +142,12 @@ PXA2xxPCMCIAState *pxa2xx_pcmcia_init(MemoryRegion *sysmem,
>                                         hwaddr base)
>   {
>       DeviceState *dev;
> -    PXA2xxPCMCIAState *s;
>   
>       dev = qdev_new(TYPE_PXA2XX_PCMCIA);
> -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
> -    s = PXA2XX_PCMCIA(dev);
> -
>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
>   
> -    return s;
> +    return PXA2XX_PCMCIA(dev);
>   }
>   
>   static void pxa2xx_pcmcia_initfn(Object *obj)

Reviewed-by: Thomas Huth <thuth@redhat.com>


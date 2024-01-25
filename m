Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp674294ejq;
        Wed, 24 Jan 2024 18:27:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9fkNMmL/44x9rlVSoyAIX5Z8/khq37+Y5qj0aXwpJyM/byKVFuLHyqgwm1v0H2w+JZz7X
X-Received: by 2002:a05:620a:5614:b0:783:48a3:c0c7 with SMTP id vu20-20020a05620a561400b0078348a3c0c7mr402371qkn.44.1706149666064;
        Wed, 24 Jan 2024 18:27:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706149666; cv=none;
        d=google.com; s=arc-20160816;
        b=Lalgm4mCGuGYUl/LxpErWnxcoi8b8IkbilEHw0qV9fIJw7FF2rfjYEMjIiKuAyh6Rk
         tcZFtF+LwYs11ixqHEKwHk2MU6IeFvipHLQcyREsBvZM+dibEmUCgsWJYJT5pZaav8y6
         7ofB45Roq5G5EH1obXq8kdLykX1qqNeTisJus3VkpvvAdSQHW5ujdq9+sMkShjNQA7Np
         7YW0Pj1nLKXdHV0g17RcsL0q0wbcPIjI15d6lGVYHT44rD5Euv/7aqBr/2tO4RqWc6xN
         n6kRBnCTLWFbBql0y+TeSdk6JTp2O4mM10bfqXXkeZZaWi8w+rgWmQKCLn/jrzcIHVvP
         Tqjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=tGSvalmy3OOuq6kmTYY8j96vTanO2aEuHW1+v0wfOAg=;
        fh=tvSoKfKG0C5+rZg70buX4YLSasjjtzKPCVsIOCyBYc8=;
        b=J6Tfqq/Fe52XJ9VIQ3c5JSBlZIOt0GIgaQUS3NKnVCGi8xqTbEDdhZJt6lUUuOhu47
         NZ0PiZMSAyIsIp8jCXgbnc+RVJCtk+EjjkbYksHp8PrJAQKvH/62xOhtnWiVp0ZK4vDU
         Ch4Sp7nYCywjy1MkzdLV/w2GooxkhrNOiUxLGh/mHQeinr/WPZuIs7L1nsh5ihArt+Xg
         bqpVFe0Ptd9XY0MQee0DlHPMfBdKPxUzIakQyQihNxRT3lauIIcBViQXAGqwDpOsdm45
         oGZYtOjAW3+OUr9GcJtEXDadGI7cfbvGtlhUifbU0RPes0HeT405Iixq6glFg43eLNxJ
         hqsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="H65w6z+/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pa16-20020a05620a831000b00783525554c5si11437127qkn.330.2024.01.24.18.27.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 18:27:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="H65w6z+/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSpSk-0000L4-3b; Wed, 24 Jan 2024 21:27:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rSpSi-0000Ih-Vz
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 21:27:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rSpSh-00026I-Er
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 21:27:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706149646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tGSvalmy3OOuq6kmTYY8j96vTanO2aEuHW1+v0wfOAg=;
 b=H65w6z+/JOtB2K1m1rapoZfZBkv2QWWAXNTCP5oFMhTkc+neqObUivCVm9d6h+Gy5uptC5
 nMfa+TJmtrEXvuFJ2CpkqN3PcZtH+BgJoyqE2q+z0Rxc7GmhZmKFcT7Dajy/UBs0HbWb8g
 OTX1WsER1Gty8sDMPetBykwuCJ9zZrg=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-v1dKaUQIOd6dFeNuOBombA-1; Wed, 24 Jan 2024 21:27:24 -0500
X-MC-Unique: v1dKaUQIOd6dFeNuOBombA-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1d7251589b3so30763385ad.0
 for <qemu-arm@nongnu.org>; Wed, 24 Jan 2024 18:27:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706149644; x=1706754444;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tGSvalmy3OOuq6kmTYY8j96vTanO2aEuHW1+v0wfOAg=;
 b=JDhSkFq6jgtfLpRubDmUNCNt0QgA44bLhaHYav3tayX/ksOD3KYTolYUSZtUdzCVu0
 K0KZIZcpvWG0zSU0BH3eE1oxvAi8rAgWb4nahqiKPRKa8lD1r4mCAqFq8nXj19Xf7Ytg
 pM/nMyBgODqPMZlFUbX1BrZqkBp3qSAlHoXHCwtB46XFlUXu53gpZFZbXRLlMMYOPDvz
 vp6Z4ihwFkuNgORaW/A2zUcpbuSiv01W7r4DBQBvh3Njk7PqQL+yuebGSqCkEOL2AIE2
 ecxzTji11sznZxEOUjlKgwemXOBt/r63wqJC6DDTvcyjJOR1LGA5oLjSbkNzAfEUwRcc
 cqrA==
X-Gm-Message-State: AOJu0YxKLP7y9QvpnSd2jZtC+CvQ8eVBCCn7/lNOjGREwv2vLASIBUTh
 2pwuBsUFx8AryWAFlA+lv+MyttKNW5+/qa8MvStUBFGMV3l0Yb5o4b9/fLyzU78mbuRtQrJxEfI
 PZvNRlUgyAHrWXyghB5fm7AIx+9h8jxayHVSGrQFQ7OVkCbRtNA==
X-Received: by 2002:a17:903:32cd:b0:1d7:1c67:3f7c with SMTP id
 i13-20020a17090332cd00b001d71c673f7cmr211093plr.92.1706149643889; 
 Wed, 24 Jan 2024 18:27:23 -0800 (PST)
X-Received: by 2002:a17:903:32cd:b0:1d7:1c67:3f7c with SMTP id
 i13-20020a17090332cd00b001d71c673f7cmr211085plr.92.1706149643638; 
 Wed, 24 Jan 2024 18:27:23 -0800 (PST)
Received: from [10.72.112.202] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a170902b7c100b001d75db0ae21sm4696611plz.170.2024.01.24.18.27.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 18:27:23 -0800 (PST)
Message-ID: <a7f9105f-5375-45de-b25a-f47df582d30e@redhat.com>
Date: Thu, 25 Jan 2024 12:27:20 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] hw/arm/aspeed: Introduce aspeed_soc_cpu_type()
 helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
References: <20240123224842.18485-1-philmd@linaro.org>
 <20240123224842.18485-5-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240123224842.18485-5-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.5,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: b4WBpZ/IkTAG


On 1/24/24 08:48, Philippe Mathieu-Daudé wrote:
> In order to alter AspeedSoCClass::cpu_type in the next
> commit, introduce the aspeed_soc_cpu_type() helper to
> retrieve the per-SoC CPU type from AspeedSoCClass.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/arm/aspeed_soc.h | 1 +
>   hw/arm/aspeed_ast10x0.c     | 2 +-
>   hw/arm/aspeed_ast2400.c     | 3 ++-
>   hw/arm/aspeed_ast2600.c     | 3 ++-
>   hw/arm/aspeed_soc_common.c  | 5 +++++
>   5 files changed, 11 insertions(+), 3 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


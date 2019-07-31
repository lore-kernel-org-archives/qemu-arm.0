Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5609133wrv;
        Wed, 31 Jul 2019 05:33:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwgWlqoV6fvn2ou4YULce+m78pTtAIDZxjGKPg7LmSDQd2HCL/6CnlOag4ZhUOqZB5/UXE9
X-Received: by 2002:a05:620a:64c:: with SMTP id a12mr80770890qka.391.1564576407586;
        Wed, 31 Jul 2019 05:33:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564576407; cv=none;
        d=google.com; s=arc-20160816;
        b=wiP5FXJzRm8mNFhByPG9dbp8+Pe2uRqT98hSg1bIpUhga64VkOQAuKM1ipIbX95YZa
         vXud3xug30h1orFEkt6WLNdTp+z4EGS3pFF4s8VGC0N3UiiETfQ0jC1HWLQWO/wOTOqV
         yyK0AREBIGoA3aVoH4xR4jnnaQ97sYIzyU6wUC/Bo+YKHe/3NjLhvPLNthzn9p0B9UHn
         vXen8Ht18v6oZP0vlH5OjdaqdEvAYdZtaJE8WC1tNK3PFUj/tcmDS5WsN6g0RGD12kU2
         eK+Y4y/OcRzN5gXp2fK11wmyUF1Hi0XNJnM6ubL8AacAaIlabUwOxURBo8KyAJWL2Iz+
         0g1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=0T9lTxOLDFBEseRDcg90PQpjuDzOlXyjEFc5keDzUUc=;
        b=uGqIg4lTtQw5awxj1en2CoZIhhi1CENa8uNYTznK3bkChWBW6lKglhrr4rrdhL/rqx
         EFxAUyrpLzF1Yhhi2JdqaDnjk13LCvEtWais/d6vZQgzeZXUp2mOqsHDoTXjqaMkXG7N
         6s8BTFaFppT1zoB5X8upGutSefEguBq/e48LiV7LENZ7tOBvDmdFDjuwywWv690vJ+g/
         6kffBs+TZ0ToVv2rCy0ATl30jsAZ+aAJvEmdITSt1kyk3IHiZfPziTAleRlIU6pLEdB8
         k4rZ012vrFmPhHnyBSR/C165LpdVUMCoqGJekrWMWdKUoXuncEYE2VLgx/8TyQt87Rki
         uCDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 36si42883242qvx.32.2019.07.31.05.33.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2019 05:33:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsnnL-0007Id-2P
	for alex.bennee@linaro.org; Wed, 31 Jul 2019 08:33:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34680)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hsnnD-0007I2-Fd
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 08:33:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hsnnC-0008Ew-JL
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 08:33:19 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38255)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hsnnC-0008EX-DG
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 08:33:18 -0400
Received: by mail-wm1-f65.google.com with SMTP id s15so38306515wmj.3
 for <qemu-arm@nongnu.org>; Wed, 31 Jul 2019 05:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0T9lTxOLDFBEseRDcg90PQpjuDzOlXyjEFc5keDzUUc=;
 b=F51P5p4XolEa9fcg5KN489HGvMfGg1lBHsVKqC3+F/Khh4Ny4Av/TrGkwfKB+cXrMW
 W7d+Hg6Euu6pNNA5EskR30aIy8poeXR84SIUfAWuQOVb6zlrBaekOa3QbmSwob756JYH
 0lp4cMZ2UqsQK1k2qyWvE57Hvh1ji/v1Yk/ZpV9df9IeQx1TF/SZyr5ulXUBsvLNVlac
 o5eJu+RnkwADzg0SrHLMORFkwL9w+Y2BDy3AKLWK3qOJ5A4jtU68+vhoX7YcODOJNm+y
 p9GXlWEzWAT9tr31UBTKF45yeqIX4effUR+wjBiuTVACWkZHeMtGPngYtTlGnBCCeY4q
 SStA==
X-Gm-Message-State: APjAAAWupYEwWnKpL9NXRQpOUgBFkVOMnUmoCAtTJ7RsuFSsn95jSar9
 MTfVSpH8/gfMPMX54eTqLL4Wjw==
X-Received: by 2002:a1c:968c:: with SMTP id
 y134mr104737672wmd.122.1564576397171; 
 Wed, 31 Jul 2019 05:33:17 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:91e7:65e:d8cd:fdb3?
 ([2001:b07:6468:f312:91e7:65e:d8cd:fdb3])
 by smtp.gmail.com with ESMTPSA id b5sm58014119wru.69.2019.07.31.05.33.16
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 05:33:16 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 qemu-devel@nongnu.org
References: <20190731075652.17053-1-thuth@redhat.com>
 <20190731075652.17053-5-thuth@redhat.com>
 <b3696656-201d-9777-0b73-b6903949d61f@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <533ca6da-a3ae-1c6b-a75d-f20bf97d8115@redhat.com>
Date: Wed, 31 Jul 2019 14:33:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b3696656-201d-9777-0b73-b6903949d61f@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-arm] [PATCH v2 4/8] hw/core: Add a config switch for the
 "register" device
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pgmTB+sX4D8s

On 31/07/19 13:44, Philippe Mathieu-Daudé wrote:
> What about naming it REGISTER_ARRAY or REGISTER_BLOCK?
> 
> The API is:
> 
>     RegisterInfoArray *register_init_block32(...);
> 
> Cc'ing Alistair for better name ideas :)
> 

I think REGISTER is okay. :)

Paolo

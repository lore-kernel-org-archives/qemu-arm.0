Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1913634ejx;
        Wed, 28 Jun 2023 04:17:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6b95IoRuKGCftv1LPFP/8wAxjF+nVTg0YFnIgeS7dWbadVN4fET2UmZisVlwcjow5xLhhq
X-Received: by 2002:ac8:59c9:0:b0:402:cc2c:d982 with SMTP id f9-20020ac859c9000000b00402cc2cd982mr4666157qtf.10.1687951022167;
        Wed, 28 Jun 2023 04:17:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687951022; cv=none;
        d=google.com; s=arc-20160816;
        b=xd6n+J84GT8y8FEpJOC3xDB2zlqLEs8eyC35MHNFCRICUZAR6zx7ijm0nFm2siWqkK
         6us8+wAG9sZyDOn8DAqiIEMATDgPHtHfCg9n0mxUC4KvY0PTsm5q8Y09gE2DsWIZ1lPZ
         lILsEN1JvgD8AFXTeBQgKpYuakU+pKwfNumwBjdlM+4nyJkungOqR2LKvd6QUod10ffH
         HWyOgT1wegRFUP61tKE63TlHeXyEfKpr8KEka+Z6ya/EizBS6Gh7DSclyiT+yTg4f56u
         vq2C2tWL25smUpZJwA5E/dOEYqLgaJ5JDNJeI11tRnpxdpK2+2mLfOOWkigu8pRMdBm8
         iDfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=MtGurHEeYBwGEy635q3RYNveqNhidMZBB2vN3AYV2ik=;
        fh=Ux/8UjtaKBZpmuaS6EvmYYkd/L3Zw8EtnDpU0DqpJZY=;
        b=DeGGp840e7EZwRfMJOq6sarndm9LCiRjaEQ/Y64jC0AC/fsVIyZwO807xaQ/CPPFiC
         XaWwmwFeajMOR4ypjYlmSQnFAeISZQ6CAQHR0nBb4q7tZhGUYoEuJxuPP6iIZsQbpnbh
         Tw7QxR51+eLmMaY5Xi1LVkwReQYbiKDm9bZAic6q0jlfL4mNY7GQzr/C+0/aYW0ns/SV
         SyCth2MWsA6GwJuuTQbvRCCJ42WBENWl/jN+rnAGBScLTZ6tDuU1fcw8if98r9tCxLXF
         YP27oByWjwUgzalk+WbceXKUwGV/kVoTBF8EVzEymQSXNVDheMAJqkIvesMdUg7LTVvY
         XhCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ygcGZ8G1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16-20020ac87d90000000b0040106b21856si2675441qtd.646.2023.06.28.04.17.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Jun 2023 04:17:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ygcGZ8G1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qETAF-0007Hw-Sj; Wed, 28 Jun 2023 07:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qETA9-000793-2e
 for qemu-arm@nongnu.org; Wed, 28 Jun 2023 07:16:41 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qETA6-00017S-Se
 for qemu-arm@nongnu.org; Wed, 28 Jun 2023 07:16:40 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-311367a3e12so6988030f8f.2
 for <qemu-arm@nongnu.org>; Wed, 28 Jun 2023 04:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687950997; x=1690542997;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MtGurHEeYBwGEy635q3RYNveqNhidMZBB2vN3AYV2ik=;
 b=ygcGZ8G1gTV8jacsvTo5zgsPTLggntorSw6OrgtIkJzeOH3T/gAhWs8DbHUV+Y+FPk
 hGYMvNxBX8wx96TiFdiz6ZexU1fjBdJkURkGAv/sFf9Ixs2lz8C4IqSQWF1FXfQ7vtju
 ixsl9hHsVMQnNFCgtRGPJwQzzcqmVZGzcGkhNuYClQGR5rwofWJaSdCmSTYQuHJd/ekk
 dSgGHXpkJEDeBEGxAJ5QKRnQRsLVBAgRehnoi6tX91wPMYNQ1Npx4tOqv40Midw8YpcK
 0VXWfS/pSYPpsRIlA7TqYu6dkYad+PJQtt3ClQnq9t0+ry2t4J4tSYgi08c6y/jkhbHE
 Bc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687950997; x=1690542997;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MtGurHEeYBwGEy635q3RYNveqNhidMZBB2vN3AYV2ik=;
 b=Xa9LDmoHHbYySZb50m3ytDcH6ym9m/vL2vKNDUhdOPPSj6Qr39oT7tyyoFJoJMmXtY
 IV5+qSjS6vJBUIw1VKrsDqo1seP8nRxEB3RKT9/+D0awCv3DR8ncg42Wk8Yt7Af6QwLn
 ej22XAzHkCaD8MZb3QqC13s4ORIiOy6J5dqYIG5FuMa3+XRJ6HnE5PDfwINf03IlwhZA
 17l6rxAfaQfiaixKKA5Dzu0G5JU7TWmT8Rz0oaEb8Sth3eDvhzFLMDUaghmz2M+ivluk
 3W0pycx75woaNZ3udYv7PVY0SWHM908+vSWA8Jtxq/ab/PCYq3z3r56iQsaSxi6iFJJv
 9+HA==
X-Gm-Message-State: AC+VfDztYMQ3ZGmNcHgMpzwCzsZrTRU/GJQa0tByMSMUp9wsTPtX4Yzi
 NM82PpD9Ba6GAZwkcsfMOSW5gA==
X-Received: by 2002:adf:ed88:0:b0:313:ebb0:ca5d with SMTP id
 c8-20020adfed88000000b00313ebb0ca5dmr10102410wro.44.1687950996786; 
 Wed, 28 Jun 2023 04:16:36 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.207.229])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm6423383wrx.59.2023.06.28.04.16.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jun 2023 04:16:36 -0700 (PDT)
Message-ID: <8e8a4714-84d7-8be7-c9ca-f6ed2a70db68@linaro.org>
Date: Wed, 28 Jun 2023 13:16:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] hw: arm: allwinner-sramc: Set class_size
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>
References: <20230628110905.38125-1-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230628110905.38125-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: que9gr2afH8J

On 28/6/23 13:09, Akihiko Odaki wrote:
> AwSRAMCClass is larger than SysBusDeviceClass so the class size must be
> advertised accordingly.
> 
> Fixes: 05def917e1 ("hw: arm: allwinner-sramc: Add SRAM Controller support for R40")
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/misc/allwinner-sramc.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



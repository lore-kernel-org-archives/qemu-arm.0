Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp1008178njb;
        Thu, 4 Jul 2024 22:37:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW4pSXdNgunL/wfSM8rKKeb4COCNTYrCc5HPh8FEO4/B5yRn1b3JcexxtKQ38f0tcOwfsh1kmj0iAdC3gZ4917HAJJeW1b4
X-Google-Smtp-Source: AGHT+IFbBz6jr38pWxnauTW3iw7gKjJtQGRjhZeCxoQ0iqLxriKnkgRa2fmJU/BMIDtuYxGODkuN
X-Received: by 2002:a05:622a:649:b0:441:6021:df43 with SMTP id d75a77b69052e-447cbf93294mr40568371cf.62.1720157832596;
        Thu, 04 Jul 2024 22:37:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720157832; cv=none;
        d=google.com; s=arc-20160816;
        b=GDE3F4L53ChCKJvTnbVAbnWNd40V5KlMC+5lEV8fsH3GmSjZoGkbpKy5gVUEK90WpG
         xMdo3ATrmjIRNr36uwnLZuvkZsZALTdjuBKEE+HxKUS4Ckp8xNbdMT86XVgKJCd/iZGs
         JjWqnQOCLiFZVkpTExITxV6WUhbzbz9xgyrJpGmZBGWKcLbmfe1rCAoZsC5WgjNmbW+3
         9cHM112qZmiJH3nNl6Ew7ZtYC1oi7JPO48HxQoGUmPyIFgWVynk//f9srwzpf9Aq8kqk
         Rs/kLKtTOt/UoozWbJEC8YSwi1pj6CTEnk6szUTy4q/TSPY56V0W7dBfanPWcnpNiR1U
         yMqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=PRl2ojit9NvtghK0Bj/fvvr0pzZm3U6iOSQWZZBTNn8=;
        fh=Ad2+Ni6AslLeoKhb7wESVVyClELmaf9bvsl75pRhgGc=;
        b=H5u05716HEBPK88B30WM5XpoMuobj0etxkTYVlPhOmvpoduF0fenDmtBZWSWBLqsN9
         6yn/EplpXGf7JR72CsUfo8f1L+Z3/unpKtEMjCT4Jj0PzHiwT6BBDdM9i2aLzAM3zAKX
         gaoFKzN4AXvX7ns89MuwESaV/9IuItcQI514i/8G05ZZjDh2HX33E7EIgn+j0YvOZS5Y
         cF29Mk55XCmWGiydFgRu7pXAKYAhCuKcQ6g9rlCVJR5uKRII8A2NrJvYgBS1ypJb0EEm
         WBs66AiBHqMu7fdsfRvxVx9eIt2njCtE4NGKD0xoAnKLBGt+TJOPGlXSffWuG83cMr5r
         sIEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WkZctCRn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-446513c1334si159293311cf.58.2024.07.04.22.37.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2024 22:37:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WkZctCRn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPbcy-0007FL-QZ; Fri, 05 Jul 2024 01:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sPbcx-0007Ep-2Z
 for qemu-arm@nongnu.org; Fri, 05 Jul 2024 01:36:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sPbcv-0004Tx-Jx
 for qemu-arm@nongnu.org; Fri, 05 Jul 2024 01:36:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720157816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PRl2ojit9NvtghK0Bj/fvvr0pzZm3U6iOSQWZZBTNn8=;
 b=WkZctCRnJNwh0JBzdDBzp9bqR6zpIoU2fQLMXGL9r6nHXwdV+wcyFX/cWT/EaUkLwEGrwq
 ie0bEgP9uq8kDi9TZApEbV1El1RlmoohTu8AAAVBjMXd74dIdl/HPjTI0hVbctVHdYBcSn
 nQkZmAL9LfS336Dsb9s2OwW/xb2twQ4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-r8oetlKpP-SkkJ8PbvS5Tg-1; Fri, 05 Jul 2024 01:36:53 -0400
X-MC-Unique: r8oetlKpP-SkkJ8PbvS5Tg-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-79d5509f112so174532385a.3
 for <qemu-arm@nongnu.org>; Thu, 04 Jul 2024 22:36:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720157812; x=1720762612;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PRl2ojit9NvtghK0Bj/fvvr0pzZm3U6iOSQWZZBTNn8=;
 b=YpWSlbtHaMbM37q7YwLYrg4xrB49P+FBIqP5UqyM4YxsCeOa1UlcwulUqkh7KBooiT
 frg/PeM+aZ7bxabtPDx043+FPKYtU1wfrYlYHts0+MuM1zqfP2i1CfinEaxF9u9zM2/2
 2pPSUdQ9AxCsYDXTaQ/+YArAF/cqYVmqaFmz6cgWrXY7YKfGipffdsOkt5vwzuxbNmuD
 6Y8bG9rMQzOT0+cmIY/yngy8eT6IhwWn+lwajIWyMTyKHL2KmRlE/I72kwcQxaVXGr+X
 jHNVkh++d3tlhKYO+4z1tX//c8iOHZfBBqrOZvVzXkwepnhFC2outkP2tKxDMrcKUr6s
 M9AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxGBKiz7Wl046nH0+cpny69LNoiKIMP8Y7s+R0FVC1AyJR6vJePjbSLMQ9CE+3Jir6l4ExaznyMa9qdqvUTjyMOMBN
X-Gm-Message-State: AOJu0YyUhyDyM9+NEyZ9m9OBAk7H0OxHUWKwZ2WniABr2NcavqInBbT4
 EQ+u4AijtsdIs91vfuFxnhpunO7JX8zgBaim6HRkrlC00A8Op1Njdvtrdap89h9i2VxTq22b+45
 4DQky+kcir2/G4viCJ7EJtMiikCZ0XM1RqKw4yvKLXZJLQA2Ggg==
X-Received: by 2002:a05:620a:4627:b0:79d:582b:95b7 with SMTP id
 af79cd13be357-79eee273f8emr415181085a.52.1720157812620; 
 Thu, 04 Jul 2024 22:36:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4627:b0:79d:582b:95b7 with SMTP id
 af79cd13be357-79eee273f8emr415180085a.52.1720157812322; 
 Thu, 04 Jul 2024 22:36:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79d692f255esm740911785a.87.2024.07.04.22.36.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jul 2024 22:36:51 -0700 (PDT)
Message-ID: <9d8e87ec-3f9b-48c8-8378-8102dacbc133@redhat.com>
Date: Fri, 5 Jul 2024 07:36:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] aspeed/scu: Add boot-from-eMMC HW strapping bit for
 AST2600 SoC
To: Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
References: <20240704053651.1100732-1-clg@redhat.com>
 <20240704053651.1100732-4-clg@redhat.com>
 <ba8b451ff51446c114fac96daa6e81abddf952a8.camel@codeconstruct.com.au>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <ba8b451ff51446c114fac96daa6e81abddf952a8.camel@codeconstruct.com.au>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
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
X-TUID: tv5Dwz3qFXjB

On 7/5/24 5:36 AM, Andrew Jeffery wrote:
> On Thu, 2024-07-04 at 07:36 +0200, Cédric Le Goater wrote:
>> From: Cédric Le Goater <clg@kaod.org>
>>
>> Bit SCU500[2] of the AST2600 controls the boot device of the SoC.
>>
>> Future changes will configure this bit to boot from eMMC disk images
>> specially built for this purpose.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   include/hw/misc/aspeed_scu.h | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
>> index 58db28db45aa..c9f98c20ffd9 100644
>> --- a/include/hw/misc/aspeed_scu.h
>> +++ b/include/hw/misc/aspeed_scu.h
>> @@ -349,6 +349,10 @@ uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s);
>>   #define SCU_AST2600_H_PLL_BYPASS_EN                        (0x1 << 24)
>>   #define SCU_AST2600_H_PLL_OFF                              (0x1 << 23)
>>   
>> +/* STRAP1 SCU500 */
>> +#define AST2600_HW_STRAP_BOOT_SRC_EMMC            (0x1 << 2)
>> +#define AST2600_HW_STRAP_BOOT_SRC_SPI             (0x0 << 2)
> 
> Maybe these should have a `SCU_` prefix for consistency?

Yep. I agree.  
> Anyway:
> 
> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> 


Thanks,

C.



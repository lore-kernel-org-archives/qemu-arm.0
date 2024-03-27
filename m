Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp494558ejv;
        Wed, 27 Mar 2024 07:18:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUSBJxWNwGQ3cSkZk5KZFyLvhLRkHh2iH8VaY54ENd+5EwbbM2gx8csbnsNLt7SXV/Dy6FeqFrYDmUpvwsKg72qJwE/LP/K
X-Google-Smtp-Source: AGHT+IHi3mw6QbJbGI0arWIcLM4ap9cE8WEv9RGd4eGNgHpT88OsfQ3QSgWtbKrvB2GuaM8sAVUC
X-Received: by 2002:a05:600c:3c95:b0:414:5e9d:ad31 with SMTP id bg21-20020a05600c3c9500b004145e9dad31mr44143wmb.13.1711549082148;
        Wed, 27 Mar 2024 07:18:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711549082; cv=none;
        d=google.com; s=arc-20160816;
        b=wPzdHfMRMUVw4HcEMD5ym79mT42+A5kfEYb0xGA21vvdfrgetZUS4i8gqXr+jg9yYc
         wJpvd91S3MRx5kMhikuAnWQZipshGMEj+iDwgDqRG/zyJ+1Pf8+159dh5jbDyyztsZFq
         NV+YFO/Jdo/LsDN9tHGC5EYp9BvO8q3+CdBXbnVE4R2x2MrVjZEUhgWAOtmJnt/ADtfY
         dG31hjRTDW9b59ABazTW2CJRGZ8nmTvEW8MLC6px6dPhySZuckm8qFOQM4Ic4W5UzY6q
         FEYdlrB9ulp1x4NajpAIoZsMen0aFArlIppA2npy7Ks/NtZh4hclkwrN5BgELU3xVDAK
         m+3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YrN2TiabhmRyI9HcWwqOzKKM88od4U5ulMzv3IN7/WY=;
        fh=L4bOSGh0ZDFl+pFvLlSK3JtT0yZj9IXqRRsSlsXXbKY=;
        b=a8PLx+KBk6m1mo88URMk6H3QyG5LsgyXJJUUMpAL5Br++2+i6v+9yPTV1Q7Jq3zFD1
         ZFxU5YatMqtq1HND+ElG5bM21ztIHIX/IrKJiDO/lOW6Xo9QT/LETHjwoFaFvE//kbQv
         RiXeYo3lSBd2K7Sn1R932htSrFhkvPs+IXCITT1a5wFN+sAO885Tg7FsTsERB1D2K/9V
         xIBb4261GhBQoPDw8taOEXGwAMrLSS78+rSJPN05t6Cia6j/ivbz+J7wjBDPDxLiRpcG
         MDyHv62sa1YDHQDpi65UBKiYlWH9LdB/sPXfJLYR1gpPpxzw8A84Dpo/23oDQvxW9PKb
         +GuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=er4fynFH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jh4-20020a05600ca08400b00412efefccb0si888677wmb.221.2024.03.27.07.18.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Mar 2024 07:18:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=er4fynFH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rpU64-0003S5-Fa; Wed, 27 Mar 2024 10:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rpU62-0003RI-Cg
 for qemu-arm@nongnu.org; Wed, 27 Mar 2024 10:17:42 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rpU60-0000Oi-6J
 for qemu-arm@nongnu.org; Wed, 27 Mar 2024 10:17:42 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56c147205b9so1718874a12.0
 for <qemu-arm@nongnu.org>; Wed, 27 Mar 2024 07:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711549058; x=1712153858; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YrN2TiabhmRyI9HcWwqOzKKM88od4U5ulMzv3IN7/WY=;
 b=er4fynFHfTwvUAhypodsiWGYIS8Ohziv65LzxJZbviCGUL8PW4lAYj/hFMtYk4sTg7
 Ea2n0YQjE1pfkA6CFw9v5UicsafXsF1dtCckoKucYyur3thvb21Ahb4akKJ1j4TAIgRC
 ArZBKDIMUy5GtpaBqKovzthKyr9x9+Tc63sLyZEhRuCvTi6cdtxgX4n+JuE8VPA4FFGB
 qXf5jvichL3FXQXdQJLD5BIPczMmazOi+RfkXljnzWeq1wH3VeA/djubQIOmr/Oeds5v
 HXMQu28xF1jl2HRqbIiutAHb2F9AsLsuKc1uaEIjZllIY3AN762QKdRdqt8sWp9RE696
 HAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711549058; x=1712153858;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YrN2TiabhmRyI9HcWwqOzKKM88od4U5ulMzv3IN7/WY=;
 b=E2X1KLd6xJc0tUyS+F62m70JmlKRgNyCnAmktyFeezoCGIFB7CaAKsoAtbIFWl2qvg
 8tg8OCIckVAcQWxdUNm6opXYjj2ODsmm21RQj/oUHvDHG4g8MR+NHeV7xvIxrXkRKgQi
 PBBglUiME9tz1GuJcmrD5jd4sGNlgL8YN6XkjQsJOOTKXYpoopYs3Sqs5tN1S9D1lRIW
 mHsjHI08dehHW6kmxlft9dlm21bMLZeOmVJLETyWgbxZdWLjMvqF/pXMEC14V1BkfsUy
 PibCBj94TaFoYl7PaWw+9TTbZpmawlbGr9GxB/nOYCJyiE43Fkh7f4hG9FrwNAL0LxLD
 gtsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1eZpbjn6hzoqYaRESj2uz9krKiZX5mL5w6AHOb2g0S6qh/mnBY5sjCDJnvm+fvqVaH09qXEOHumGp3WnB8TF4e2CM
X-Gm-Message-State: AOJu0YxzW0E9/ZzhnxUXHhjoh7KNpCGvCwOlXBvXTegHy/4EdoSSHK+0
 6r5aAkssvDXV1dLo046DNdT8gBXmsranBDpP0gEQs67NdB4XVNJwVGAviJHFKm0=
X-Received: by 2002:a50:8a8a:0:b0:567:e0e:dda5 with SMTP id
 j10-20020a508a8a000000b005670e0edda5mr38598edj.17.1711549058213; 
 Wed, 27 Mar 2024 07:17:38 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.205.175])
 by smtp.gmail.com with ESMTPSA id
 j26-20020aa7de9a000000b0056c08268768sm4171537edv.10.2024.03.27.07.17.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 07:17:37 -0700 (PDT)
Message-ID: <c7af214f-c446-4092-aaad-017a4d3ea2a8@linaro.org>
Date: Wed, 27 Mar 2024 15:17:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.1 v2 10/21] hw/smbios: Remove 'uuid_encoded'
 argument from smbios_set_defaults()
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 devel@lists.libvirt.org, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
References: <20240327095124.73639-1-philmd@linaro.org>
 <20240327095124.73639-11-philmd@linaro.org> <ZgQoTF3FUOpIZAix@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <ZgQoTF3FUOpIZAix@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: RJ+mT8Y535jR

On 27/3/24 15:08, Zhao Liu wrote:
> On Wed, Mar 27, 2024 at 10:51:12AM +0100, Philippe Mathieu-Daudé wrote:
>> Date: Wed, 27 Mar 2024 10:51:12 +0100
>> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Subject: [PATCH-for-9.1 v2 10/21] hw/smbios: Remove 'uuid_encoded' argument
>>   from smbios_set_defaults()
>> X-Mailer: git-send-email 2.41.0
>>
>> 'uuid_encoded' is always NULL, remove it.
> 
> It's a boolean, so,
> 
> s/NULL/true/.

Oops, thanks ;)

> 
> 
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/hw/firmware/smbios.h | 3 +--
>>   hw/arm/virt.c                | 3 +--
>>   hw/i386/fw_cfg.c             | 2 +-
>>   hw/loongarch/virt.c          | 2 +-
>>   hw/riscv/virt.c              | 2 +-
>>   hw/smbios/smbios.c           | 6 ++----
>>   6 files changed, 7 insertions(+), 11 deletions(-)
> 
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
> 


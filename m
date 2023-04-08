Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp678227ejb;
        Fri, 7 Apr 2023 21:25:49 -0700 (PDT)
X-Received: by 2002:a17:903:846:b0:1a1:d5fd:1e9a with SMTP id ks6-20020a170903084600b001a1d5fd1e9amr4708493plb.40.1680927949230;
        Fri, 07 Apr 2023 21:25:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680927949; cv=none;
        d=google.com; s=arc-20160816;
        b=vuWnEmlawhE5mSw3FUtlEoGASh2DX3L192+2LUR3x9YiSf+lRzIDtBX0myw6AYnddM
         j2eVwXgzAlFe3ZyqYkWY4FvkR7zkDmCf/JfFskMimFtsy+C3Zr1Kw5h68BxffJ06KH+T
         8T/cPuAD+yr+0/jD+6UMSr3ZjQIeKR3QSfnqcZ5uYdnkKH+4PBW3/CskgFSE3XaHhRAH
         txEI9xAoE7MahrPbLDS25m9rO71k7VkGOuWsaFvI/sKwASG3pB0Mexeonr0zOYd0zcrT
         Rwx1mfcNV/huuKYQawJmU2zJbgShm2XKBH0aoyWyN4z0r0OAboyBjhymMBT/YkSJ1qUF
         96WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=PXCwDtr2uHzOCiDI6gx9ciDRk0+XSVPCl10fYBMrOZU=;
        b=BoOT37RarQ8PeOdMygI2cohsfE/7SL1+SDSj5EeayrFdZivsV16kntmZEI+kHEymir
         Udy99kUDObhU/x+WOZFGjG5tecESQYwyJAKYpt0bse4/AGdiKqCF3GgnZN+Qw7QcJyfl
         20y0sS22ulwUb6rE3ccP9UyLq8rNI2tvBWrWa9S7KaHeT55PVYVu2n1uj8d0LGxPXSx/
         mied6uaKeRKni8dPK59VFhhCOAnIXSDUS+5dGj6Kw3bTcf8FSSYImpMarSOi0BmmLMUE
         GWHkktOuvKQG90soJRJoi4yMLYmtCpocgHqA+x1Zgjqpi3oi+8n6imT/SZJmmBc84ZLb
         RvRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ajc5KDjy;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z12-20020a170902834c00b0019ac86db5a9sor2416285pln.58.2023.04.07.21.25.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 07 Apr 2023 21:25:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ajc5KDjy;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680927949;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PXCwDtr2uHzOCiDI6gx9ciDRk0+XSVPCl10fYBMrOZU=;
        b=ajc5KDjyqXmm3NUhwaTQfNt74Vh03C8A4QjJBsHhqpatOEHjIwrsnnsJeIV1mR4Q//
         IH0YOeZ/wRmreO2AyYzmeyJuhK4a6Ljm4vkvshnwFkSu++QDSSNkcr1mYou8eymOKNTK
         w786J7PWGGOOgTqhO2r20p26oOpmjkka4g434lWGOkcRHf0lWcSAZ4Ucf+lH5lPKTUC1
         6/h8tPD5w6rtPylQwXgYWq8OwBkeRZWmcZK8oSylz77qxoRqauLmZnakWNVN//mmkUBs
         PgAZXndCQqApDyeml0rj84fIz0mO/XpJ+yqvRosXHibT0pibUfgwKQSPUhd4KFp4CWUG
         uqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680927949;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PXCwDtr2uHzOCiDI6gx9ciDRk0+XSVPCl10fYBMrOZU=;
        b=JpojQv6R959aW/ScS4AlzzEKRW+tAt9TctVfoy/GS4KMwOQUqXRcXQMQtO4lu71xuN
         DmgfzsAK6Cuo/xL/Q/8IDtOEGxpJ4kSh0ri/EkiMTEmFnkv7ynXctGQTK9ydTxndSVUU
         qRvwmTmqYbSRh2RCXM4M0uoU3nKFQlBGOFqxLdPbJsoa3ewGDxhQzDplrHpRpy+leUM1
         /My5JKUinKkHsIWFvZP7Uesnkhbaj6ex+p1OFJb+sKR0zUmiVmJb5bBAvjwamdl5NKBT
         t2hzXReWsMt02InrP1LNJ2fC6taBffBSgIhdvmhiZ+BH1k+Kb/Tn4Jl1PtQMNx3aIs92
         tdmg==
X-Gm-Message-State: AAQBX9cOJ0aS6vGlAO/hUbVQ9ywaA2KelB1agwnFnClCVEfxNa52GKy4
	2TryQfh+i4UcEbnAMWR9sJgUcuM/
X-Google-Smtp-Source: AKy350bDO0xahEhFC+PBYeLvGOB3qgL/GrI8UhnYhnHZrwNfuMLU6DzeTNpPUrbd5lsuyvBPxO8WQQ==
X-Received: by 2002:a17:903:2452:b0:19d:1fce:c9ec with SMTP id l18-20020a170903245200b0019d1fcec9ecmr6359202pls.37.1680927948795;
        Fri, 07 Apr 2023 21:25:48 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8? ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
        by smtp.gmail.com with ESMTPSA id a18-20020a170902b59200b0019f1264c7d7sm3631549pls.103.2023.04.07.21.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 21:25:48 -0700 (PDT)
Message-ID: <c7be234f-331f-0dfe-3fd4-04896c094680@linaro.org>
Date: Fri, 7 Apr 2023 21:25:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 07/10] target/arm: Restrict KVM-specific fields from
 ArchCPU
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405160454.97436-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: dBXIqwFstkJ8

On 4/5/23 09:04, Philippe Mathieu-Daudé wrote:
> These fields shouldn't be accessed when KVM is not available.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/cpu.h | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

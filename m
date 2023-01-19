Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp625064ejc;
        Thu, 19 Jan 2023 13:13:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuYcdZJn6nX16qKU8+JipvkE/LdTqQPCl8qi7ryhV/Rr5L1Jrxm5hYREhClUorQAoKZFbyy
X-Received: by 2002:a0d:e2c9:0:b0:4f2:48db:a8a9 with SMTP id l192-20020a0de2c9000000b004f248dba8a9mr8294574ywe.21.1674162830551;
        Thu, 19 Jan 2023 13:13:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674162830; cv=none;
        d=google.com; s=arc-20160816;
        b=Jt+Rpcqr1+R/WlQeQ095qPH++b28Hw/WUXRC+NYrgvbfzLgyFguzzRAU3rfj6/Tapi
         iPusdmgBTLXDs8OXxNqX/HrvedBdkUstXyZEpp0BLaj0hJnfMcfVHnfxw3X6bBh4+1pY
         Fiy/gx3oFOk8BTmRUA0flBs7UjGsU6RxOAjlujIT1b4jvMSMZjodWFA/MIvqy/Vyik8q
         BamCwO3r5Tv7pa03wAFB9uwjd5PbMw98ldaeTgB1H1Nlu5naAb3FA9uJSsoduyO3tXsL
         xir4b/YVnHdDTvBuZHbP0sf2ECicSPvbzs0l6O6ovmKYNnn5cPop4itOtlLYvIFM7NEt
         Le6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=gYOAKdUc34+oyv1St+sQblHP3QxPEQcRA+T28x4WVLw=;
        b=sfjTDT05iUFCsErwM6/V7PHSXjcxSTRrZkDsZutX9uQ7CZVH/VqD7sBmj2o8W0x8qc
         FVzEfisD4fqIKAlPUpDXCQTODWDcHvc0rsXxUIbe9lViyc5hLYZIJUOVB/IS+Z/n4cmK
         wbEnIMXXl6QTKa/18nsjFB6KwflNNvj83+wqNpk6VeXGgCXxsNhmCgX/erC3Vs2gAbTj
         qcZ+j3E5SV14lmXVhsRTQ4ZKwKF4fl4FSJtYrpk8mj46fknXLTgobTmwXTGSoEQDnKhF
         gGXJd09uFEPuH3r3AxG5hr6yQEje32NkSmDiteex7wdXlBoghXTdNm3qHKM73RH0h4a1
         GltA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Rs3H/l8s";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w1-20020a05620a444100b006f9493cca55si8493941qkp.152.2023.01.19.13.13.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 13:13:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Rs3H/l8s";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIcE1-0006s4-Bb; Thu, 19 Jan 2023 16:13:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIcDx-0006rj-Of
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 16:13:29 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIcDv-0005vp-BJ
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 16:13:29 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 y3-20020a17090a390300b00229add7bb36so2990787pjb.4
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 13:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gYOAKdUc34+oyv1St+sQblHP3QxPEQcRA+T28x4WVLw=;
 b=Rs3H/l8sxF2SDaMYlWA+jMVa8RF7hK/R2KafGz09v0w9ciHCZiy9jGacuOZpGDbjJn
 BOTITn9zU70BiYVbUoPnVMwwOR47VBDzFXlstisBu+HqrcaoXru+uYXqxDs9agF7hz94
 YygcxPmU+g91IlRha7Agga4IxeEEYCSXpKtM+LeNnFwvfDAviHQIvzfeNxNJK06npmDB
 Pek4URB00THM8tMhVUbD9DUiBDjRO4ES7PGiKLGmRXgareL2sNaEs3Fkx4jvANeFdXNK
 p//bjoPEfbdtB+Wafs5jlZou4eFTqur62L8ukBgS/l+84FMCPCtqt6KeF3GGCa8svYVb
 9cyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gYOAKdUc34+oyv1St+sQblHP3QxPEQcRA+T28x4WVLw=;
 b=y0yKDUUG+oClk7/9s+UZxaPxIIj4JtJKvGXBg4xgDZpXg3JEQSt2SgjiHBrXslkdXl
 mvvyip4f2uONOJZqIDam9iPaTSdZjZqOOEYEMBZCePy5eBhuuctackvQT0uqBb1ez/hT
 rPxkm2n+p1Hc5j3wQzO+Lf7JblyKVAX00TU/JW/kgg6/hTMy8WXUWNza6ffWe//jab1F
 JCmvdzL5tltcSi96WDcal+kL600qr3Zib0bvYcmS8OCHwNeVbxzTCRi0STPL8qymoKS2
 sfb6LjIlZjXkFP5GLCRPUVMtwpfPIa+fy7EnEV0AsBEvK65pg5Xpjw3Do8aDjkSFkBoe
 5SJw==
X-Gm-Message-State: AFqh2kqzLmT6GUsYtPKM34gv2C9fNZfAIB4n1an91SsrtqfMS6uDuIjq
 LVkkMhILxJ7mMRXo3o66riyLKA==
X-Received: by 2002:a17:902:e892:b0:194:d2c7:ea46 with SMTP id
 w18-20020a170902e89200b00194d2c7ea46mr3825286plg.68.1674162805257; 
 Thu, 19 Jan 2023 13:13:25 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 c19-20020a170902c1d300b00186b138706fsm25701360plc.13.2023.01.19.13.13.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 13:13:24 -0800 (PST)
Message-ID: <597b7d7c-7a45-2f66-7bcf-bfc2dcdbb3fb@linaro.org>
Date: Thu, 19 Jan 2023 11:13:21 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 08/11] tests/qtest/migration-test: Build command line
 using GString API (2/4)
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-9-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119145838.41835-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 9wXC8+KzxXrU

On 1/19/23 04:58, Philippe Mathieu-Daudé wrote:
> Part 2/4: Convert shmem option.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tests/qtest/migration-test.c | 16 +++++-----------
>   1 file changed, 5 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp840590njb;
        Tue, 13 May 2025 16:01:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWgXtXKjCXxpmVHFEkmXRnoCvDXShbKNPOeerf8UjYaRpXjeqccAs5N9Co1kDgn4t4d7zB43uNHKfn7mQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHtRrVHXHgysXYEaizSwatMXCstbJ/FM3TggCtl5xE2rCp+AQmiHNCOw/tkmWzB2jTKhzoE
X-Received: by 2002:a05:6102:8082:b0:4c1:93df:e838 with SMTP id ada2fe7eead31-4df7ddef336mr1447825137.23.1747177270460;
        Tue, 13 May 2025 16:01:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747177270; cv=none;
        d=google.com; s=arc-20240605;
        b=fi02GRIqRL2M1a6igogS1JdbwkUJNWTK1sR126Il40HZD1/Hvd49H29SD+esHZfiQa
         mft8sPAhvmcR9uQJ4/NzE/JxsLuKDTvPLfO/tloWNdrpq6YxwCxiVXeoVH+exwW+jzht
         qDsqEEFwCc63groiXJ7w08ChiUdmN6IX3Dk3m58H76Ojh6BzmQV7oq0O9a4He2ofCpXW
         oHaFyddg7qef5+1v53Mqb463SiVJ4oRd9VBzLdK11eHdcrUpsfH5Ecsue88+dSfZ08Sd
         wtOMulqcoJFLv9z2Wa1kQkIeA/IIyvyUdzb9U+PvwsHTy0iZI12Igc+/lTPbtV3sZ2Ls
         Qv4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Ir/1/tsToGqifehU7CVjcVeSXnS6KPaYprIQaDhJFKc=;
        fh=to8g3JTaP/PDT3M85vvYYumDMgw07E1VYi/SOVtW7jo=;
        b=jDv+Od75NksicXs1FLgUW9orv/nN7LDlZ0FaPwl30f3rzbYAcJKO8aMxD5SiF64C4/
         91SAMb0JMFrtniMfXNmc26QjisB3SU5j+OmYZEYwS6asIytwdb0lpN9K/YWK1pSy87xQ
         8HEmLcOoZOQu9ZuDJiFayrnPp1Ol2l9fR5aCYOy20IjLAJbddPPzS+j9VBZTRX756XR/
         wsFlE0I5QDjA0bgRfjlRYygKB+7iKQ+vogUZQmE43XRTJh0tF3vwQ9/fSqRbZCUJ1JfR
         s1+Bzyms8kluwvPItuSelTF4sp+Ttaf3AtAv/9wy4ykUB0oAnXyoWzwQKnnyjFLKl9E9
         HTfA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fvgXj35P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4deb202ce9asi4730344137.555.2025.05.13.16.01.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 16:01:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fvgXj35P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uEycE-0001aF-3U; Tue, 13 May 2025 19:00:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uEycC-0001Qd-AM
 for qemu-devel@nongnu.org; Tue, 13 May 2025 19:00:48 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uEycA-0004Aq-0i
 for qemu-devel@nongnu.org; Tue, 13 May 2025 19:00:47 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-73712952e1cso6226580b3a.1
 for <qemu-devel@nongnu.org>; Tue, 13 May 2025 16:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747177244; x=1747782044; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ir/1/tsToGqifehU7CVjcVeSXnS6KPaYprIQaDhJFKc=;
 b=fvgXj35PWWiCirIHY/+HajZOj4wr2OpxbAbdcmke1CMNA4VLIABuXtlaqja4v3kZ+e
 qlcw+bZVVysvmYjcIRgplZEJsqp5OX2zOX7l7VtAKZHRoFjfXXAQX5SW3eYoaL2LeldB
 d7acntt+VNzT751CipgqwD4/3wMVKqVK/T+01iE6I2Fukmg1OQ6Wt2CcXvzpVCLAgLB/
 VviHtQa9OWna/pBMK+QWkAbk4Rr94b4mBXdAKOLll8UV4RZ4ho8Vodb+KGSuxWga8U43
 Di+KxGgvfUcuHKLq/dsWwC+1agi9P//+hdY5Pnad2GZAUwyzXYwKyrBeN1twSXahgF3w
 7x8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747177244; x=1747782044;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ir/1/tsToGqifehU7CVjcVeSXnS6KPaYprIQaDhJFKc=;
 b=gIIEpD8GEuJ2Jl/a4Nnzq3rlIZkhtMujEV48NsmQoFKIjAi6AR+dKDv5HeECKiwP6W
 /wvlMpDl8PHQoVrFxxnYxMBOPCMuPnwKkUAe04AYYFrHPiuvTTnX00g1Ju+iOgrFF9Kg
 4TdqaCO+iakj+e1snmExb04YPGyzNLtYI2OQ0ukVBxg8K4j+RjA+msSPIoqskm3P5tSU
 ofHokjpe/kECevSDfKSWADjYujvyj0Nxll5lp4q61+oIfE2zwI0w4Tm3o5CSQy3qpjRF
 owdPlahdPAyGvoAye/FMt6mhWp99yAcCi6OIOWrSq4Tt2/StQzWHWy3kuajG6s01f5Q9
 Pssw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT4bZMKRW4YBNEc9CBDKBVlYcOtzxJIgXM7cHo3NwodsYCj4lgE0GHMhzCzM3IHMzgUygVc6omhgIJ@nongnu.org
X-Gm-Message-State: AOJu0YwgXmNiSlLkK7r4mvr92XeHyrGNSec2Fb8t/b2zShk+rOVfOdPB
 3QG3mKLeYZtmeXZnIlOxFgXspygkqCYarzY51183rV1TKoJXvg6Qk931QHbfknM=
X-Gm-Gg: ASbGncuOEwIXpPptPLImiYXXOBEih/DjgBcENGKi0YnP0v+Pbg8vhF/IiOxbSp9imRi
 y2GY4+6snJ1qUn8csD70VCXYmxZ+3Asbxo85PKqP5zjjB/AI5Ay3NlZmRjUe4pUz75+3etPx2Hl
 hRWgyqjSFMIety2E/EwYu42PXwobEaYojyBbd8O9ZEixiM/ReWz6hwDErn+OwTCMszhDlWEmWHf
 F2kbYPkKAPa+MIF0XvO28UbXwpx1vtgq8oViDePaHQnEkgHO9KOpVM/A3FErcfcecY/o3LLVCBD
 mgBZKk8AZ1Ziu5hRJt+Ab51c2VDZRKbobRrLAfH8/cWqWyePRQH22z4yn4OqwXsmWTyfYj5USjE
 =
X-Received: by 2002:a05:6a00:194f:b0:734:b136:9c39 with SMTP id
 d2e1a72fcca58-74289346a5fmr1607132b3a.19.1747177244526; 
 Tue, 13 May 2025 16:00:44 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74237a3d1e7sm8131395b3a.126.2025.05.13.16.00.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 16:00:44 -0700 (PDT)
Message-ID: <1af32893-0f49-4a0e-9ed1-80c0592eaa58@linaro.org>
Date: Tue, 13 May 2025 16:00:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] target/arm: More header rework around arm_feature()
 & multiprocessing.h
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250513173928.77376-1-philmd@linaro.org>
 <d05792d0-3164-4504-91b9-1570d668653d@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <d05792d0-3164-4504-91b9-1570d668653d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: mRQJ2yO35wdc

On 5/13/25 10:42 AM, Philippe Mathieu-Daudé wrote:
> On 13/5/25 19:39, Philippe Mathieu-Daudé wrote:
> 
>> Philippe Mathieu-Daudé (19):
>>     target/arm/tcg-stubs: compile file once (system)
>>     target/arm/hvf_arm: Avoid using poisoned CONFIG_HVF definition
>>     target/arm: Only link with zlib when TCG is enabled
> 
>>     target/arm: Always include full path to 'cpu.h'
> 
> Missing review: 1-3 & 19

Thanks Philippe,
hopefully it can be pulled at the same than its base series.

Pierrick

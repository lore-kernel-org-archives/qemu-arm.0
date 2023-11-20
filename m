Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp2354695ejb;
        Mon, 20 Nov 2023 09:34:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzuWWe5SWUx+j6LAZZhSUHLaKnQqG1pX/VBZgAJp++S+plsk5Aq0K3uIz8AVLbI+BA9XEL
X-Received: by 2002:a05:6214:48f:b0:671:7955:606e with SMTP id pt15-20020a056214048f00b006717955606emr12347965qvb.49.1700501686140;
        Mon, 20 Nov 2023 09:34:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700501686; cv=none;
        d=google.com; s=arc-20160816;
        b=MWHqxOU5F0EyQZc8jblPWltBAxJl/Zo9i47lvtTBxj7GrHhSbibFE2Xb7pY4qT0Cn2
         w5cbomW3B/GxSfyppQHsTYQnnz6hnNVS8XyTsw/OYRCcSAWTwFZz7BH0HCOZrwZeiSOe
         gn3pg8Xm7jXFUHQ9oZYV1u1ZxrHxakKT+BQjRpWDGFad+msuIEwpC6suA0zzrl6xnzdy
         qfk0D4UeKCIeDL293GMFWeRAiXgpCwYvoLi/+lOU+9E5eeVbHZ33pUHayZXYiDGsXYNk
         /pqlYJUQG/Jmcso/flv2bOdVFoCXdBYUR7E9snMkY51tSZhDxV1cpJxvT8rB3cwdYGYe
         kAgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=LYfoGZi+/RC6+fhMYN5dUtpaIC0R/6sQGvfFsEn2Yt0=;
        fh=zs+ipePwhQMFyU3dScwemU1aHMKCTkabwOfmqNw7wHE=;
        b=m+LnI6X66XvkhvAICo+cKX3f9ZNXIyEXaJ6UQQezXuLwO2EITzvGoE8s6e4HaBOCwP
         Z9LD/Y/BrmJ7WLKh2vpgN4XvjJeUJRXBiTkZWQuBwH6d5cVxpk2aCvlwza3sbvsdfjZp
         jL4UtKGkG1nOy3ejUe3dc1uE8qUNx5OeNIDyqTKpmzo0mQwH4xbjMfJQFU1Lw/Zbl0BX
         ZgL+fnlZanYo3qXsj31S14VLRhZbin6bDkFX3gF7iXKmbriAqF4OwuCs4HyFI622qUpl
         ZDkTmStwy6efuipuMQQJ5lRmbe1Xt6oigmKDhiD2Rn0zhDHqBq9E/mRzYfQmNPkR4Ht4
         9BkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VdyX5Aac;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3-20020a0cbec3000000b0065d0358ebc5si7313790qvj.394.2023.11.20.09.34.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 09:34:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VdyX5Aac;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r58AS-0005V0-VJ; Mon, 20 Nov 2023 12:34:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r58AQ-0005UN-BM
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 12:34:38 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r58AO-0002BL-FG
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 12:34:38 -0500
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a00191363c1so106060966b.0
 for <qemu-arm@nongnu.org>; Mon, 20 Nov 2023 09:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700501674; x=1701106474; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LYfoGZi+/RC6+fhMYN5dUtpaIC0R/6sQGvfFsEn2Yt0=;
 b=VdyX5AacmCNU3QCQuv4K4afZTK6zhtmA17kfFSwa0Qg7qOoDAIoh/S8WvUBGIciYGA
 oPGJ76Wty5RUuMQQGlG3+KlFA7guCkol4PYBRnVXUC4fNyMJsFzrQe5aNmI6SgnOIbID
 ILsoBwpZXSKPBo15PuwASsmZti649gW9bQwEs2f/XBHfLzMZ1EWAtHSyDg9ssKrZRBqT
 zUdZ4ogJdX7Cro9ihkWQH8+RD73e31fzJpfT8IPcigzdATMTj4HYv5gabt3J8Twnyj2Y
 UAs1VM37alv38SIUqgp71nad4QfAX1LbnDoqAQcZ2RZRFN8Gp1NA4stb4pgbnsgqzM10
 5T3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700501674; x=1701106474;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LYfoGZi+/RC6+fhMYN5dUtpaIC0R/6sQGvfFsEn2Yt0=;
 b=Q21gZehrC9z9uziT0323Zio4lV3qqqJrS3peufAn2vV+IDdx8UNwqPUXcJFYnRiUEI
 1BR7Lydv4KDwtpsi4aNM5kEyn9p6HVHf8IVRh8PmToWTCOkMPag+qoxennyQP6AHoOHa
 9TmtS/ztuk1ts9OvfGUP3U2z8j2NQDBLsWV1+vr0vvSb6LLdQVZcTHgAhzSLv0ysTp8z
 qoj9bYqJkv+mb7bi2BjU4Ux9zm7r3QHCGXBRrYIsOktSsDha9Kf/OQScW2MLqkTpKbJP
 XA50ERGQQ+MdbDFKhWsgalkgkuTsYkYMUJDChjAWTBXfk58VHGsL1lPgcX4nPo9Gia4W
 oNAg==
X-Gm-Message-State: AOJu0YwxZni3WxbpUZPmad2nofp4bUyq0UCp41O0bVk/kv39mqbzTNws
 PZPlsLqI24D7W6cFQPEfs9pFPA==
X-Received: by 2002:a17:906:3986:b0:9d5:ecf9:e6b5 with SMTP id
 h6-20020a170906398600b009d5ecf9e6b5mr5579908eje.59.1700501674562; 
 Mon, 20 Nov 2023 09:34:34 -0800 (PST)
Received: from [192.168.69.100] ([176.176.181.190])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a170906a11200b009e50ea0a05asm4128410ejy.99.2023.11.20.09.34.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Nov 2023 09:34:34 -0800 (PST)
Message-ID: <650a781f-0649-4195-9dc9-5fbaa5ad5ee4@linaro.org>
Date: Mon, 20 Nov 2023 18:34:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 0/2] hw/arm: Add minimal support for the
 B-L475E-IOT01A board
Content-Language: en-US
To: ~inesvarhol <inesvarhol@proton.me>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alistair@alistair23.me, peter.maydell@linaro.org,
 ines.varhol@telecom-paris.fr, arnaud.minier@telecom-paris.fr
References: <170049810484.22920.612074576971878323-0@git.sr.ht>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <170049810484.22920.612074576971878323-0@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: qVFb4trOAqnJ

On 20/11/23 17:35, ~inesvarhol wrote:
> This patch allows to emulate the B-L475E-IOT01A ARM Cortex-M4 board.
> This is RFC since the implementation isn't complete yet, there are no
> implemented
> peripherals, and it's a first contribution to QEMU.
> The changes from v1 follow the reviews from Philippe Mathieu-Daudé.
> We additionally changed the parent of the stm32l4x5 SoC from Device to
> SysBusDevice.
> 
> Details of v2 to v3 changes :
> - moved the initialization of armv7m from the SoC initfn method to the
> SoC realize method
> - embedded the flash sizes of different SoC types in the class_init
> methods (removing macros)
> 
> Details of v1 to v2 changes :
> - replaced 'stm32l475vg' by 'stm32l4x5'

Thanks Inès for the requested changes. This patch set LGTM now!

Looking forward to see device added and firmware running as test :)

Regards,

Phil.

> Inès Varhol (2):
>    hw/arm: Add minimal support for the STM32L4x5 SoC
>    hw/arm: Add minimal support for the B-L475E-IOT01A board



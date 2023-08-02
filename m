Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp634948ejb;
        Wed, 2 Aug 2023 14:34:28 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGNZcJbas3KzCGnHlxdeaaqfYeUrb3FiQLbJEOVGSLOYIM5fHlx3Iy5SPaqYq+oszsRwbCf
X-Received: by 2002:a05:622a:1447:b0:406:d6f7:79c4 with SMTP id v7-20020a05622a144700b00406d6f779c4mr21037564qtx.44.1691012067971;
        Wed, 02 Aug 2023 14:34:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691012067; cv=none;
        d=google.com; s=arc-20160816;
        b=sUZCvjNCLqy6TO4sAVKRHoDWIYKDIIOxiRbKlAVq2I1IvfnaeX9285b2/HMCoX7QUu
         fz+parq781vHSYkXnJt8j1WEuJOrmBAEX+R2YHFN79KgfL+0yzu1klvMA6Nahzmwn+zT
         UW30TbITtUOdN5eHxQjVS95vXq4KU4NXZCHjpu2Xw3eZujECs6KxJY3PEzx140owu7ST
         MUF0HEJGoHa4VRSMJh7xba62JzeX/gD2hcJDGX+o/6HydqCsuDpgvgaSxeJXloxQ5lGU
         qCvC61/u8eoDoWl3Xbi5ycLTe9vBVKemJLsJIOMwovWRlwkUILWlcXm5A8k3NvikApVG
         h5iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=decvR65ziSo+OGNTH4UzjJMI/kry72eEPwfviYY82P4=;
        fh=yiPsqyf7KBOryhDtE6f2DyvFmbOCnAEEkILwtbwiaqg=;
        b=rnKhyZRiUN8rPhX12prSv6KHsJy8V5JsldVljebeY5YpCapV+NMPnO94fcOTIf/i6G
         TStprWm7wVmRct7cxl8MIrj0oyOX44wIo/Nzx28NWjj2udZOCMzJzd2YM8qJg9rLWkSR
         ePg5xsdsEC5M35sZRgi+cJJFiJwc57+A5oZXPOeTkEIv1TjSxumEBAWaaD08tiBaR4D9
         hUEbVssLOWJ+RZoLwyWLhfkttqdQJBs55XR3rNlF/KlZnt4WntT2gh99jotTHLP0H2Jg
         xSzjQrP6LrmOTmR+Y3JkmDRTzrMoPngS8aVkX1axqc3O6o1//XWsSdzi8eNVg0bG9TeP
         wAMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YPk3uVQS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8-20020a05622a030800b0040349c011cfsi9128675qtw.259.2023.08.02.14.34.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Aug 2023 14:34:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YPk3uVQS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRJU9-0005YH-Do; Wed, 02 Aug 2023 17:34:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qRJU4-0005Qu-Ef
 for qemu-arm@nongnu.org; Wed, 02 Aug 2023 17:34:20 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qRJU2-0006CC-R6
 for qemu-arm@nongnu.org; Wed, 02 Aug 2023 17:34:20 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fe2bc2702cso3416035e9.1
 for <qemu-arm@nongnu.org>; Wed, 02 Aug 2023 14:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691012057; x=1691616857;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=decvR65ziSo+OGNTH4UzjJMI/kry72eEPwfviYY82P4=;
 b=YPk3uVQSBcySmPEZ1Pa4cBzudN3jtCxVDCZpbHvbs6czaHINnmK7axthc/DeYObeh3
 f0JcwloTokmIP2m3N+iok0fcJsXgWAQnhd9CCFhbJyW5IeaDSHpSOCtNtnzvBCwg1h0J
 rdqHbMzcOtZtAp3Nyi5ZNFMO5gEgaMu7tkZ3KSoTXavj4Kl9waPWfItGRk8FHnniLP4v
 noysx8iVblrZLky1DZQACeP3VjWrcymiYA79s6sZzZ/QyNQvki1oW53iOqGoH7DjD0Ue
 WqF6CInQP56M04C4MKy33O3YBzlBgxG4KMrb2gBr9SDKOQ/mguWYz0C/KOrYFemF0ug0
 YaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691012057; x=1691616857;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=decvR65ziSo+OGNTH4UzjJMI/kry72eEPwfviYY82P4=;
 b=FfrOF03Fusc8szsalnUQJZtkX0vhI0l5O6xF1cWYKfVmU7tWgU0atLAfuFaMjSuIRr
 Q23ONqWm3yr6H7gOSexDth//2bpNuhNqdglwuB7Uqap7iS/GSb+NwLkA6cjXLvMi+6d1
 BJdPpOnoYH3voqq/QFhoE39Ts6s6Ish22/To2FIX3wYBrfMazFDBXcK8Y699hNPg6STG
 YKup1TktQj/wZiNKwwpQ2b+Ny1Y+38bQh/iXAWQAxb830PfI3SMw74ENsL0NUFZOVO5K
 VDoREwODCP29vOBilErBUhxeSPowV7yhakz/TDAqOl5sE95bFy12vvgTaaH7CO8go/hj
 gOvw==
X-Gm-Message-State: ABy/qLY7gnSY72HQSsfDRcfu7DQCsR603Pn/mCRXDeI1gwq02I1FePeM
 mZAs5dvtOhAcJOkU2qAmXW9eWyTi/hFD11P9KCg=
X-Received: by 2002:a05:600c:b54:b0:3fc:9f:e75c with SMTP id
 k20-20020a05600c0b5400b003fc009fe75cmr6048623wmr.11.1691012057311; 
 Wed, 02 Aug 2023 14:34:17 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.158.229])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a5d46c6000000b00317a29af4b2sm10703865wrs.68.2023.08.02.14.34.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 14:34:16 -0700 (PDT)
Message-ID: <3d793690-f3e1-fe65-c0ce-00dd233b9a68@linaro.org>
Date: Wed, 2 Aug 2023 23:34:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v3 4/5] Add i.MX7 missing TZ devices and memory regions
Content-Language: en-US
To: Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
References: <cover.1691010283.git.jcd@tribudubois.net>
 <5ee0e4c1fde379d1865e45ba38a3ff7fbb4741f4.1691010283.git.jcd@tribudubois.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <5ee0e4c1fde379d1865e45ba38a3ff7fbb4741f4.1691010283.git.jcd@tribudubois.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: t/OSDkxcxfGN

On 2/8/23 23:08, Jean-Christophe Dubois wrote:
> * Add TZASC as unimplemented device.
>    - Allow bare metal application to access this (unimplemented) device
> * Add CSU as unimplemented device.
>    - Allow bare metal application to access this (unimplemented) device
> * Add various memory segments
>    - OCRAM
>    - OCRAM EPDC
>    - OCRAM PXP
>    - OCRAM S
>    - ROM
>    - CAAM
> 
> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
> ---
>   hw/arm/fsl-imx7.c         | 63 +++++++++++++++++++++++++++++++++++++++
>   include/hw/arm/fsl-imx7.h |  7 +++++
>   2 files changed, 70 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


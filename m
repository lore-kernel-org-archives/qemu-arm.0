Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1741994njc;
        Sun, 21 Jul 2024 23:55:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW7dzeViPFz3UM4UMwxhB796Rj7yPv2vysDOHv8q1Qc7U56Qop4skwiA/fY3ccIQJC3uRILLoYCiBU504g/Rcl/5vsQHOQZ
X-Google-Smtp-Source: AGHT+IGUGc/KuqpKSw0UbzsN9UJtetgPMWlpQ1wemBA6qGih2afqL4aLywWmXD+WdwRZA57VSq7c
X-Received: by 2002:a05:6102:578f:b0:48f:9608:ac37 with SMTP id ada2fe7eead31-49283f341d3mr8306078137.21.1721631332281;
        Sun, 21 Jul 2024 23:55:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721631332; cv=none;
        d=google.com; s=arc-20160816;
        b=YFYkF7VgVzc9zjY0+Qfb+C82EZKyAe/jI+72k4IhhgrLZDC+Hmz8mZ7JsKfsbNgBAd
         Ha3vsShDCLzfyeKRpZtukaBIsbQOa7zlLjiWiakQzfhZ9h9pKZHfU5BQmlhZ7g+qjroh
         lC6GeGTfjLcQ3/Fs90wZTPpvRhCSGvf3Hq3baSfIU2pZ3lpiWopAMdrVcMoce9bBErYa
         f3W043LwknSJMSY2Un21z5uDY9hK0QHQCIQqGD6caOFCqcPQRhVDcGxYM+DHxv1u4bsZ
         tiKPEs+bfNfTYtzQz+qYHEwPnSPHJ9AQ1Ai3txHWeNQ8JnhxeUcUyUsdGh+/C7lFGBSv
         QFIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=suY8gqgezLbAE9TOVB83qdEPUeM3qcUTVHktutxGJAg=;
        fh=of4ZQBUAAn6tajyYZySCvpTDCyg2B6b+S0s+0qYHw5w=;
        b=CBzTKJbXDwwwp2vFS5jgugm4RQ5xoR4DAIUoh5r+bufC2AO3g3DbnxS+ya7piQRaPH
         1R6e4IOzWJ4nE33ZXV5PPtZKzGip0wJpkARjF2Lg8d+RnfoguUOU3HRQxOvGVg6zUHdR
         Ak3yMUE9IlJXNNgG/aVKJXeHat6AYQEEBdRZN87kykt+h1t244vq4gGzi3md/25nOLPO
         eoASL3nnFp/GIqeh76gHNmo0PgHK50TDnhEqi/T3NgQcvdaQ5VVhanaR7ebyPkkw/xuS
         zGXEjhmyYCVxhM7ZTFiJXm38n764Ut8HVRnPYqtG5YzxzNnvUa6eelE1KfjcvJdavS5G
         WJow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dHD6rEFP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a1990943c9si712524385a.658.2024.07.21.23.55.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jul 2024 23:55:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dHD6rEFP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVmwn-0004PV-Hr; Mon, 22 Jul 2024 02:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sVmwm-0004IQ-9H
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 02:55:00 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sVmwk-000592-KE
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 02:55:00 -0400
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ef2c56d9dcso9480081fa.2
 for <qemu-arm@nongnu.org>; Sun, 21 Jul 2024 23:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721631297; x=1722236097; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=suY8gqgezLbAE9TOVB83qdEPUeM3qcUTVHktutxGJAg=;
 b=dHD6rEFPhgZOlLY8SPvKjZxkr9HJJg48ZxDxJVFAfsz8fS1Br4+IX0wbntmI+D5o9c
 JLYOM2l90Bomaj82+41yU9GKn1hq84fyheFKwP4OtrZgZe+/gk8stXkeqEpoM9Kj55hL
 nqAt+sfE1Ze5BJBIOUGqNVytl4lmcJouHVkl2VaBGxq3Mb9vuzQwVQSVQCfdqJFvSJhC
 CSRQdRVcWXN02REdthslsbxenjBB2ALrUbZgIMfS2GwNjC5MrK6havyenYpYQFFnpWCW
 X7T5hwmD51WCF5rBfIza1d9bkEErnCGhXXkzcJrFBx9oBYMn5FHhfwgR2qk+EPxtkmdp
 hLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721631297; x=1722236097;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=suY8gqgezLbAE9TOVB83qdEPUeM3qcUTVHktutxGJAg=;
 b=KQe1PsaPZipMqIOyK8Zwy356CdgZG9KKSUeRfQ7UwgkAMOtPZujveeVUcghb2aMtUn
 vSBv+Hjv5B3/fNzWi49wuahLbbSwe66KLl4CXbWo2uRWLqF+Xnp4RqefAaFszOR4a74W
 ZIc+FabLtIESY/kg0k6pKfnQ9DoQLvCWarT2aD8Y4oBAhWvYveLKav4Yj/owMMjrVZUb
 z1RHkZLCkseelDg4D9YiUIdw0xzm8XHA2wonL+e+Nt7IMSqf5GJYrKrHH099od680/Pm
 Xf3GI8bk3bjPGBci55jFYWe2z8b7WgVs2QIgPjaMnMBkv26gIwXGUKEWvfXI8mgcF2jD
 GryQ==
X-Gm-Message-State: AOJu0YzH4fEQ257IBRQtxyf2+9nJyL/bdJmg304ISahgkr2n24/Zl4kA
 TRXWPxHFT0qqw7vihOl1Mlj1gg5azlgaCpV2tHQ29N8U4yuVAQrgZGekL44M5wM=
X-Received: by 2002:a2e:9e02:0:b0:2ef:2580:c0c6 with SMTP id
 38308e7fff4ca-2ef2580c2d4mr32061231fa.14.1721631296664; 
 Sun, 21 Jul 2024 23:54:56 -0700 (PDT)
Received: from [192.168.69.100] (gen92-h02-176-184-20-254.dsl.sta.abo.bbox.fr.
 [176.184.20.254]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d6936d62sm112532305e9.42.2024.07.21.23.54.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Jul 2024 23:54:56 -0700 (PDT)
Message-ID: <42f92293-2c7e-4ab0-920d-f81da79f550c@linaro.org>
Date: Mon, 22 Jul 2024 08:54:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] arm/boot: make range overlap check more readable
To: Yao Xingtao <yaoxt.fnst@fujitsu.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
References: <20240722040742.11513-1-yaoxt.fnst@fujitsu.com>
 <20240722040742.11513-3-yaoxt.fnst@fujitsu.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240722040742.11513-3-yaoxt.fnst@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: gGV6dx31j/68

On 22/7/24 06:07, Yao Xingtao via wrote:
> use ranges_overlap() instead of open-coding the overlap check to improve
> the readability of the code.
> 
> Signed-off-by: Yao Xingtao <yaoxt.fnst@fujitsu.com>
> ---
>   hw/arm/boot.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index d480a7da02cf..a004a90e87be 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -26,6 +26,7 @@
>   #include "qemu/config-file.h"
>   #include "qemu/option.h"
>   #include "qemu/units.h"
> +#include "qemu/range.h"
>   
>   /* Kernel boot protocol is specified in the kernel docs
>    * Documentation/arm/Booting and Documentation/arm64/booting.txt
> @@ -238,8 +239,8 @@ void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
>       assert((mvbar_addr & 0x1f) == 0 && (mvbar_addr >> 4) < 0x100);
>   
>       /* check that these blobs don't overlap */
> -    assert((mvbar_addr + sizeof(mvbar_blob) <= info->board_setup_addr)
> -          || (info->board_setup_addr + sizeof(board_setup_blob) <= mvbar_addr));
> +    assert(!ranges_overlap(mvbar_addr, sizeof(mvbar_blob),
> +           info->board_setup_addr, sizeof(board_setup_blob)));

Indentation is of, otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


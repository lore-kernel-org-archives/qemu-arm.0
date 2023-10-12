Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp646112ejc;
        Thu, 12 Oct 2023 01:23:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELdqONOj0Bl3YNaZUuHeMtauzKW/ZO29Xgw/gau5HmqZXEAKgNCyaLVv6xC2QiWeZyIsXq
X-Received: by 2002:ac8:5d46:0:b0:40d:7ffd:fc61 with SMTP id g6-20020ac85d46000000b0040d7ffdfc61mr34066587qtx.23.1697099006660;
        Thu, 12 Oct 2023 01:23:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697099006; cv=none;
        d=google.com; s=arc-20160816;
        b=WCH/nJ28h83wXx6zB4oQJVSINAl9TSny8t1KfvPXB59M5fziF26RPBL81ZOQl3wRV6
         g+dSRObeSf2EDPY/7QAUxjRiljPy7ZtHdYtDxBj1Xvb+sqjlkVbBQ5tfs1bvO74gSlmZ
         pDeICa7TemCWd8tUrPoL1c9yHc3Y2+Di+W05wRDB9s0S44SoV6pwLYRRzzwAXL/S17KL
         j3Ad9cjuE3rzV6+XY8Lf2xYUwu9tawM5FfQbMTlt214ZRcR2rUq4yDkB5qI68dxhwAwr
         DJJ9QQsZbjtV4ulU0GYMn5L2brwHG8IuPacERJibeBnYXHh23Ll8EAvKaom2q2aJxo7N
         Stbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vEbAvL6rJkK+tyI4avRZquI8VfniJZBrHrPnRLsaBJI=;
        fh=5mIMCup1X8usJg51UsqLWjoUpCI+Up/qsJy+8+Zz6/k=;
        b=dge+QgFJmuIytPEGtQeb2KqOrM+H0rdsstgeBf6IjVwE9OhzM3vJvwWktpNz/Hw/it
         sd0yja0TAec6PayT1Uup+h1yIWdpCSjIoOwQqP1lh511jpQhF6oC+Wf0sXdY4UrgpULy
         nsfeHQQ1z1uRpSDEZt9Ug/JGo34fNkLBRB4q2nK4peM5E9GzXzQZ18j9TRC8S0TXIEb+
         iuu3nvXWxTUXsKgaq1ygwjBkyjh1yDbcWTxpyj0YqOSHSsW0L2MHrR+M96awBTG/CZQ7
         yOwKKBazh0ji70X1W5FB5QftZzpkqUoyGM0trj1NsNpRlZyXPx1WTWr8AV55E3rlkAoa
         Dpkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oxNpjaYI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j18-20020ac85f92000000b0041986eba0absi10304445qta.475.2023.10.12.01.23.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Oct 2023 01:23:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oxNpjaYI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qqqyF-0004Tb-Nu; Thu, 12 Oct 2023 04:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqqyD-0004T5-SC
 for qemu-arm@nongnu.org; Thu, 12 Oct 2023 04:23:02 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqqyA-0007OR-Jz
 for qemu-arm@nongnu.org; Thu, 12 Oct 2023 04:23:01 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-505748580ceso956828e87.3
 for <qemu-arm@nongnu.org>; Thu, 12 Oct 2023 01:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697098975; x=1697703775; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vEbAvL6rJkK+tyI4avRZquI8VfniJZBrHrPnRLsaBJI=;
 b=oxNpjaYIJj4WwVZTGgDvPU6NPKfPQbQE9+yi3MeZnBNk2mKieZdfZ5cBoE1bF8E5q8
 Z01NmxkoAw2IFWo5/4OjaoSYkfeKN26TDupFUJtxGIub9lDMIJ/5bgMlBwhjO/RqsPLY
 MO0l1zukY4AfSLCok0YiLBUpGVCbNDiwcW2c9RwYtx78NRpMDAdohCLHH1xgxuDJBfcF
 uEBXUBP1E6F0SiSFw0WhZljI0iajIxUjasykzsI3z7QObnz+Dp+jqjGpuS0kVoF9KO1J
 mQnyDoeuXwse5lEMxURqq/6fWFnXihoNpXtGH+l79M/m00US8A7s7tmYE52jcwVLVM6n
 fuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697098975; x=1697703775;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vEbAvL6rJkK+tyI4avRZquI8VfniJZBrHrPnRLsaBJI=;
 b=lh9Whtc5WGG0GUSJqi2xgNKWWwMbNq56leWIprH32ZwztBBcBWAaA3m3L+X147aR9p
 tfMH7YgelUoEP5KKD5yT45VqCywfni86p1CM6KUVuDRzo1FDlzBAgCPJO3vMUr6MvuVR
 VnTySx8PAgYwd7sf9zcc/VjK4jMR0BXRLltpTnlPIhvMU/O9tr1ACnjAGaguRgo4zTUz
 9k6Jlpn6sNMRCpvMdo+1vjf+qupVtbGdC5BBDuH9YMwXJubNeeb0vZ3TZo5hYEcOxgun
 QL+onusiYeqWgDW3uYQyaLn5E2l7piTF9zQQJoUK1bqYMvoc+WNdM7BAhl15yM/fl2n5
 6juQ==
X-Gm-Message-State: AOJu0YzILL0zujF13+TDWW1EhMXJg1ZXyLAkYL3hdd2tPBqAMZGnENFC
 24ZoR9iP7wyLBeJnWPYsUl1h/A==
X-Received: by 2002:a05:6512:3450:b0:501:c3ee:62ec with SMTP id
 j16-20020a056512345000b00501c3ee62ecmr15747273lfr.12.1697098975501; 
 Thu, 12 Oct 2023 01:22:55 -0700 (PDT)
Received: from [192.168.26.175] (192.red-88-28-24.dynamicip.rima-tde.net.
 [88.28.24.192]) by smtp.gmail.com with ESMTPSA id
 v5-20020a05600c214500b003fbe791a0e8sm18973251wml.0.2023.10.12.01.22.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 01:22:54 -0700 (PDT)
Message-ID: <788f54e1-3f2f-f24d-63cf-172efc605823@linaro.org>
Date: Thu, 12 Oct 2023 10:22:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] hw/arm: Move raspberrypi-fw-defs.h to the include/hw/arm/
 folder
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-trivial@nongnu.org
References: <20231012073458.860187-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231012073458.860187-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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
X-TUID: kwFWhPDfcUaC

On 12/10/23 09:34, Thomas Huth wrote:
> The file is obviously related to the raspberrypi machine, so
> it should reside in hw/arm/ instead of hw/misc/.

Not quite. These are the VideoCore DSP definitions. Firmware
running on SoC including a VC can use this syscall-like interface.

FWIW there are a pair of QEMU VC implementations on GitHub.

Anyhow, preferably rewording the description,
Acked-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> And while we're
> at it, also adjust the wildcard in MAINTAINERS so that it covers
> this file, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS                                    | 2 +-
>   include/hw/{misc => arm}/raspberrypi-fw-defs.h | 0
>   hw/misc/bcm2835_property.c                     | 2 +-
>   3 files changed, 2 insertions(+), 2 deletions(-)
>   rename include/hw/{misc => arm}/raspberrypi-fw-defs.h (100%)


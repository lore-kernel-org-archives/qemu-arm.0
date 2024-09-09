Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1013143njb;
        Mon, 9 Sep 2024 10:55:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWn93vw3bTPmo8YgqG91IWPmysTlsRX4SLav+cvOtH43QDDjrF/abgqFolqS8teF+uredM8Pzwqkms4NQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHlpJE+Gkcmcszxs/zwOjK2rltGksDGrCanDy/835NQ5s8jHqld6KMd7F0uEpTGK3KfkDhO
X-Received: by 2002:a05:620a:4152:b0:79f:af4:66f1 with SMTP id af79cd13be357-7a9a38ebae8mr1421699685a.50.1725904531034;
        Mon, 09 Sep 2024 10:55:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725904531; cv=none;
        d=google.com; s=arc-20240605;
        b=N7lAjUA0F+XlmuQPaSNMg0A4BrjAKHWLYMnbCCfUZzLW/032gx6pCiElm85e7y7fFC
         0lvD95kIZI7Ud8FIMXKxdKcmzBazYsCy7YgIlLTZQoyusIWhdXP3rouHh9NhCjhelL9M
         exLklvLAUuW/OGe1WJ7NN4QL/3bjZ9gJKBwuvz4vfiLfYhMDsOz8tLLMZtApBNo9x6Tv
         Rjub2sU0hPGqgVA9MXShEevzn19s0cHkmcr8BMqk1H7D26XCVyH0g3ovLGG0h1XY3DZq
         BZ3y4gcKR1U+FjgIkhOeL8tgFYr+dP+pqWxoB+jXeKdM8GL8zu2fOmHYiOcXBpSur1r6
         KZhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ScVwQTsTwyqmTUNO5KCubBganFb8MMc0lzuzdGsr4bQ=;
        fh=a8wgThPsl9vm3NRngquk/WAfzkxo8tNVk1K293hmeSA=;
        b=Cps0wQM1x6XBdfZ1EU7CKqW6RbYNRXp46n6Aedlsrh22F/Uum7V32IviCfbl3FUsMh
         /l/lT6d4hITOlAxvZNhm54Wh3hL0Juk348F2s9K/QRgtm+tl9sg7j5OEWj+D7qz5xGGi
         5DZgNXMCtGcyKPAm1lLAThuGmTr8wTzO/yWkNKWwxw+Xwb5W0+n1Qn4lQVJ969Ie+42Z
         hZdeqgLDQmEjg7p9pGhz0wupeSTwuQYz1UOTRYrX+ATu6wfhyrDPP15LsFRr1JmcvTBP
         fWtEbH5ktdQQL2d9esmQsFocFTj8NWNH4b6P991wQ3Y4CiEKeh8jWZybqz8uS+YyIyeJ
         uOUg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Vk3/djac";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a9a7a5474fsi591081985a.569.2024.09.09.10.55.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 10:55:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Vk3/djac";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1snibh-0004gE-HT; Mon, 09 Sep 2024 13:55:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snibe-0004Mw-48
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 13:55:18 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snibc-0000Rp-GS
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 13:55:17 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a8d64b27c45so119654666b.3
 for <qemu-arm@nongnu.org>; Mon, 09 Sep 2024 10:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725904515; x=1726509315; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ScVwQTsTwyqmTUNO5KCubBganFb8MMc0lzuzdGsr4bQ=;
 b=Vk3/djacP1vJLjzF3NG2RR48Yp/4Kjj5LcI/uNj3RTfW3cMFVbLSONBubyyR5bulGU
 3FBBOs6H5qfXewIbvX/GStXfMVjaC4DA2wjkD95cYV89F1jiu2tX//Qg4Q1sU8DJCF8i
 5yM6neJbM2IF31jUoJt1mOfvmMMw1PDFCk1yqzTvGzDSplfw9Dk0TVRETt2xTKTFoEiR
 2pHuV2DsdZKAZDhsOVD0gYJXg+6bzC410uQ4OVVvzCoDJo74QpqdblJHD9HuCKf4QDAA
 dKsrwnjcHOOBIkX6jIEqB0MV1mk0ubhhhynYor33fXFs1v27oDN6aSABruf8CS3iPSjp
 fykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725904515; x=1726509315;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ScVwQTsTwyqmTUNO5KCubBganFb8MMc0lzuzdGsr4bQ=;
 b=ZlQVFtKyzI46Ge1jrP8lQZXG3F8cvEF25Z7CZ8EL4bLIVmOBNeZB8YPC0NJeQYPVC2
 0eWwvdggl48F6szeshYnI9ftLksplSZt45+Z6pRBnNPayZmAdApWwMAcs6/eHpBLaQW4
 Qc/l/rtPbVniQJMsUBg9tBfE2Lf2K9V2DTMRtsYmW6zo7CAa4SkBfXAChWNawwXuRtqE
 7v/GTGB7bGETvQtA92OFL4jZNG8ti1FmoSI/i8miN/vEm6lDZfJF0lIOuSTiOs1XqMrQ
 EJK12NqEvvJlTRpPjH0Ggx5OH0YZc4Nfswhj0ZFGcc1m0/aABCgpWwvRv3k1jaCjehjz
 oetQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlSbijXNTHMfPhfu5te2U3uxmKz9ZftrDjJzfvlFG3ivC6NsZRkBlx20ciAVlsPbPnyKNoNWRSgg==@nongnu.org
X-Gm-Message-State: AOJu0YzzcreEDoj7uF4bjw1e1ogzXikjqk/A/sreC7S/GKykM8pxt22F
 b8oWNHNxd9yCz3MBORav8Y2pt9fnBNhkEZY13XiS/RSxnlJ7Q3rSqmKeF+VVzVw=
X-Received: by 2002:a17:907:3e94:b0:a86:7199:af37 with SMTP id
 a640c23a62f3a-a8a888d98c3mr885900666b.58.1725904514958; 
 Mon, 09 Sep 2024 10:55:14 -0700 (PDT)
Received: from [192.168.69.100] (nsg93-h02-176-184-54-166.dsl.sta.abo.bbox.fr.
 [176.184.54.166]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c726f8sm371173766b.121.2024.09.09.10.55.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 10:55:14 -0700 (PDT)
Message-ID: <fb6a9994-fab5-4045-90f0-d08815743458@linaro.org>
Date: Mon, 9 Sep 2024 19:55:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 45/53] hw/timer: Remove omap_synctimer
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-46-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240903160751.4100218-46-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
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
X-TUID: 1L+rD9PdQKgR

On 3/9/24 18:07, Peter Maydell wrote:
> Remove the omap_synctimer device, which is only in the OMAP2 SoC.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/arm/omap.h     |   8 ---
>   hw/timer/omap_synctimer.c | 110 --------------------------------------
>   hw/timer/meson.build      |   1 -
>   3 files changed, 119 deletions(-)
>   delete mode 100644 hw/timer/omap_synctimer.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1012819njb;
        Mon, 9 Sep 2024 10:54:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVfr7QV2kL4IrzN8GAR4E+oMGFN5OLH0o0oqxsVxzVCO8TWGfl1YFwxAVCTSymshQx8mrtujLMWW81gsg==@linaro.org
X-Google-Smtp-Source: AGHT+IGbUWN/xADbyzB3hH58fqMF+oNOQI5W6w8k8Fm7zY+pte+VNZsJHN23S1KNq7+E3Rr+nxWF
X-Received: by 2002:a05:6102:c0e:b0:498:d39d:9b7c with SMTP id ada2fe7eead31-49bde0f9e7fmr8896843137.2.1725904457254;
        Mon, 09 Sep 2024 10:54:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725904457; cv=none;
        d=google.com; s=arc-20240605;
        b=c19zOtTOWdFXgWsokEYHKeP4e9qiQDa/LAf7qDksmivT0RBB7Q+QjrbXfsJnlNa9o2
         pZ5kYhS27vieQuqWmBPxx6xxLVFHWbHux/fthEvinOewiA3oHh/tYE+ll1UYG76BYU2X
         tGgNp23QUlAJNgvDsc+c0c8xebfYNyIlrKTjyXbKt7kBsGTOxQiVhMXkfQ0KJ8OHJ04L
         xQJSKtpeeH6/2WpVof5/fg4F8Sf9s5x8MMY/LA3xdK+spowuB2Obyum+Uwz+rZhf7gQb
         q4oYiQh4+XzDkHw7qTv8fnlrUDgQRX1XgKsMX5B4bcPa9R6yxry1PBFgim3jIeespvUx
         xsWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Rk/B+o8bM64LQ2zN6Olk4GR5w1rhve390NIJauPKXfI=;
        fh=J3F0FOMQGs3DWD2BRPWcYMAcj3DnuiSvDsw+ZVxFelg=;
        b=XCrhJ/9keKHeEXDtfWfXnyejMFTcen5UyE1nUgANJZOmy/0hCfO3v77/d3gATeNkXo
         puTPQQ9gMd3tngR8odzB+QAqDmC0iCm8dqjbRGLTsdBsaPlBi6Sq/IWeN1JjkrfJHTbT
         7OHU1OfcVZ0kJIFA6wophpdNdwNbIGookZDdvnSuVcqbdE4VDFm7j/jHVwjnArTRgpP1
         FE2AEbkppsGOKU+gVfqGfWxiw4I2vPueH3S419WoxcKFoEq1KAozfCjK7ZqcYWcwfufo
         RqJ1LJC2KE8MQQge1j8oH+Q2ieir/g4AzyKHDhYC2e3ljg+sIfbWRmi8M2Dm43yYquT9
         uZSw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LQBvQ6i1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c53478495asi58101536d6.398.2024.09.09.10.54.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 10:54:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LQBvQ6i1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1snia8-00049w-92; Mon, 09 Sep 2024 13:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snia5-0003xA-Qa
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 13:53:42 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snia4-000055-9W
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 13:53:41 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8d56155f51so151154666b.2
 for <qemu-arm@nongnu.org>; Mon, 09 Sep 2024 10:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725904419; x=1726509219; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Rk/B+o8bM64LQ2zN6Olk4GR5w1rhve390NIJauPKXfI=;
 b=LQBvQ6i1D0WbhQLjvs3uvuR2sq2vNCA3fJ5kz160jysGFAVGpABqLu0yzSWbmFtO1h
 uXY79OfuPIRkq3b3TcjqrrF4H2vacD0UPWEO/5i089jmfpVaEPY7wGKTsiZns2b2GZ9J
 a6L5PUnhn91Pkxns72l2fkel0/P7s4c05XqhY1pfXMWCHsrsxC4geo5ckXTk6dZMIlVQ
 FQw31Mm5QlBpvYx+8myFxwtgXlzwuSW15gviOMb323NuqWxCIIax8+FWFEk8ZB44MWg+
 GPBjARFYrVxKyHHLnfT0W47WZewBB1ir2Y1/Eb5M5fOrbD9e087oags38/9oYJuXzo6s
 cxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725904419; x=1726509219;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rk/B+o8bM64LQ2zN6Olk4GR5w1rhve390NIJauPKXfI=;
 b=ShkwOq/ASUnvFeJ1SAn3Nsgigjw+8zsVNdPjndJRGac7ea2E1Jr07gaccoBkeMywxf
 iqJYOJv0hKBe2JqLi5Cx3EHhm9713lcgdO4UihdT/6tw+uHFbzxaJFosZWxgLhoJDsT3
 FNTb6maPxj81jeFLknZQBwBo/17fjbkwT08UFdL5VDXiOXQGU5vLEVqHUVNKPommuLST
 FB+ZDf7w0xbwQLS1oXEYwQ3P0VhUPAN75iIEw+OC9JBqo2YnsHLqu+5IinpLXQEBoiAy
 jzj2RdsoOkjXhQeo9zonLSuO8Gc9N5MFOyNEqF9gLTwh9sxv+3MWces3KeywxiAvrXeg
 kUSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdKxQ/MahSc9nSDVquLiH2BImtM8w6ybp7xIukhZ9H17Sd2DKQOraQ4g1Bc+YgRCV4E5e61xcUUQ==@nongnu.org
X-Gm-Message-State: AOJu0YxABXBEt0utr+zewx+Y6VBIpA1P43Dt7Q/Jfu4m8r1hk1IZxpsh
 mZKyV0MuXaAWKw9FZygFbSYPLJfWKQ3xiIJRMlopABPVIpAelfXwCEIZpwSPiu8=
X-Received: by 2002:a17:907:60c9:b0:a8d:6921:e181 with SMTP id
 a640c23a62f3a-a8d6921e32dmr142794066b.16.1725904418529; 
 Mon, 09 Sep 2024 10:53:38 -0700 (PDT)
Received: from [192.168.69.100] (nsg93-h02-176-184-54-166.dsl.sta.abo.bbox.fr.
 [176.184.54.166]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d5dc8csm369435766b.206.2024.09.09.10.53.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 10:53:38 -0700 (PDT)
Message-ID: <b2c80cdb-f2e8-460b-8e34-19bf7a7790ad@linaro.org>
Date: Mon, 9 Sep 2024 19:53:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 42/53] hw/misc: Remove omap_sdrc device
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-43-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240903160751.4100218-43-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
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
X-TUID: nR7JYLs4HH4h

On 3/9/24 18:07, Peter Maydell wrote:
> The omap_sdrc device is only in OMAP2, which we are removing.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/arm/omap.h |   7 --
>   hw/misc/omap_sdrc.c   | 167 ------------------------------------------
>   hw/misc/meson.build   |   1 -
>   3 files changed, 175 deletions(-)
>   delete mode 100644 hw/misc/omap_sdrc.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

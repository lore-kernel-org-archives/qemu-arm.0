Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1013332njb;
        Mon, 9 Sep 2024 10:56:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUeuO49qlo9p7LeWEsiOA1q61JWuJzQ8KnBiu/0tDCildvldeXOLurrHstU5dLBFrYXGqGKo2XdWQ1iDA==@linaro.org
X-Google-Smtp-Source: AGHT+IFsZ+BR2OaFFEkScq0T1/egEbDsEpAxuYLhWSTST+ALtVsKXH3QRPbOKvf99qQoquG+zRf3
X-Received: by 2002:a05:620a:171e:b0:7a9:b82e:723a with SMTP id af79cd13be357-7a9bf9a8100mr84469685a.31.1725904578201;
        Mon, 09 Sep 2024 10:56:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725904578; cv=none;
        d=google.com; s=arc-20240605;
        b=OioktGAHA4unsZfEvkwAN8+KhEzVYMu6N1WSQxUb4224/3ZNpuYOQ7HggPdYvxhEXR
         gC9LVAgh10hhBdzKCIt9X5W84O2veE/OcZNIOj5pKhafTi4aKGzw4C2I6cJY1QqauYki
         9UWUpfOrUYRBZmROD7TlZdJI0VgqmaFEV7FWGuQ1jTjy8pynCBANTVPsiqXkmjPcIrfT
         7dX6rwf6tywzDuIWKv8yJcrVTpAEVHTLzdquKCnGCTBw4dv2LjeEvCbzQgXIMmjISzV8
         nQIk9J5LLjvv6vFaz8oR+PCooY6OZb/ad6CRP14bskjnE3zQaxaYrFJ8tSfwGb0UInM/
         fzQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=xf9geojBmL53D8UazZrGQqiR2/ncGPdJC/IXvO9uEzQ=;
        fh=HcA5zregnEzFXtF0qYi81UQVrZxH/wwBEiGC5a6u7HI=;
        b=eWxqWj8iPmtOisx4iWlI+8eAIRLJMi+7GQlc19tXQgPHcOEeg6ZYeQuzs2EczJULBN
         xrjtIq3N+Z/5kfkXuODrnGtaxnMo1Y29umiL6ERpNCD3PJLCMiAgBcfZsX1495m/EXE/
         dSRuMRDD5M1t5mn99x0byh2O4JoGtIaJu/OmG9ZczhHkN8bDHKVOV6yUH1hqJIS4iMV/
         5oFT1qIQ2V6cXN+XI0X3u5a6BtEuFYu8B8bRia9FSTZ+D8vjSo6QqLZ8Wgs04C4y593q
         T+hHEy+nFXKB3YFXxggRTOis/LANf4yF1mCcrJfZAZvQvXpR2heITXUoi/qKu9GPVofj
         relQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mV9o+E4M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a9a79ee5adsi594353585a.163.2024.09.09.10.56.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 10:56:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mV9o+E4M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1snicY-0000xk-R2; Mon, 09 Sep 2024 13:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snicT-0000FL-1X
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 13:56:10 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snicQ-0000VV-FS
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 13:56:08 -0400
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2f763e9e759so20624221fa.3
 for <qemu-arm@nongnu.org>; Mon, 09 Sep 2024 10:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725904563; x=1726509363; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xf9geojBmL53D8UazZrGQqiR2/ncGPdJC/IXvO9uEzQ=;
 b=mV9o+E4M3S111Kpz5C3EQhyyyGy70J38I9LWLIjHDgjVr+y8DfVy9qiuo+yaK0CIGb
 +E4pmiaQ8Mix1JkhJ+E8g4SaQYS9fQBWe9o0lbLNrwB48Zk7SEwWtJjX7khzTfGzo/HP
 NUt9aEij4v1xeSA9HvAJ5vP+J5Ht3QlRgwDWKM4azyVRP5xEH9jqtV603J/1Kvu1BK33
 nEycs6NiZV7JSlIJkZATFEkscejNKumATB1+jnWdgUe89bmpEmAlWWJaRftdIUudXuJ9
 E2NRukR3+G8/P57pPjCjnV9thoJHAjZvZlidN/4mBE3FmW/j27mJGtw8ccwkdimHeHWp
 lCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725904563; x=1726509363;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xf9geojBmL53D8UazZrGQqiR2/ncGPdJC/IXvO9uEzQ=;
 b=LFrfLm/7GyYw3FQSw8C5J435evgkFycH+uFvC2FBRahQkynt5H7nA2Z8IPa8+QZmv8
 LaZPDZsWHEeG/7zfkePueiX4qvDM66UWSKw88Ajpjcx5v3bgI3Vd9rBE1kMwPb0fWNhb
 ZB6Cna9dHAISN5FnxCFxEO7x6xR444nv2hrmIXuEdZi+pPdj3bYl2bOjl0l4FKNCBTLO
 pp83JED0mxdbLYooISXvIPRprTayf6gcWGI6A/TfApmTg8eS9ueYqpy2o2Z5SZCYlwBQ
 O65TX1C3LoUFYPTq/ga12iXvCyoentRvST/wEPpZsmkKVvGgf73tw4gIuJLVoIn+2I8W
 DNNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUb6noQA6q3Wy9Z8mSQMPTFgNQWEUTYEWmhGt+G46xiMxbLzjxmGpg1OaZIuJE/GShFcUB2DHuHsQ==@nongnu.org
X-Gm-Message-State: AOJu0YxaNtoKlln2H2rfT5UIINffQYiBScALj5emwClVAe4qNUf4bGj5
 pDRMnNcNzYiRp8N7VkWgokfs8cIO3WLl2vQBgqxNmm7Ssl2wyqlcPgXmd/4Zkmg=
X-Received: by 2002:a2e:859:0:b0:2f3:d8dd:a1f6 with SMTP id
 38308e7fff4ca-2f751f865c5mr71644781fa.40.1725904562998; 
 Mon, 09 Sep 2024 10:56:02 -0700 (PDT)
Received: from [192.168.69.100] (nsg93-h02-176-184-54-166.dsl.sta.abo.bbox.fr.
 [176.184.54.166]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f75c09a247sm8540791fa.124.2024.09.09.10.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 10:56:02 -0700 (PDT)
Message-ID: <137c4496-0837-44c8-a85a-6829ddbfc82e@linaro.org>
Date: Mon, 9 Sep 2024 19:56:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 48/53] hw/misc: Remove omap_tap device
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-49-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240903160751.4100218-49-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22d.google.com
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
X-TUID: X9kWoUcynSxC

On 3/9/24 18:07, Peter Maydell wrote:
> The omap_tap device is OMAP2 only, and we are removing it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/arm/omap.h |   3 --
>   hw/misc/omap_tap.c    | 117 ------------------------------------------
>   hw/misc/meson.build   |   1 -
>   3 files changed, 121 deletions(-)
>   delete mode 100644 hw/misc/omap_tap.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

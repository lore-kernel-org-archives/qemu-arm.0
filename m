Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1594279njf;
        Tue, 3 Sep 2024 14:27:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJws1Rc6j9WRSr/UsRxoun9pHWqJMkyc5Yx/COX9WbivrhTfg0Dbi7Yob/PeaSS4FwLJR+O1+Sa049Rg==@linaro.org
X-Google-Smtp-Source: AGHT+IFPO+OqFLWG8/9WM1WUw2ecL4HS++H6i3sll6i46t1ypmSoojzOCOgy+eggw7DRSA9Ov10Z
X-Received: by 2002:a05:620a:4145:b0:79f:1e1:faa7 with SMTP id af79cd13be357-7a89325f5b8mr1386270585a.17.1725398843536;
        Tue, 03 Sep 2024 14:27:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725398843; cv=none;
        d=google.com; s=arc-20160816;
        b=1KhF4+nf5x037VHdGsSqCsAG1JhQchgIUBZYM1uVIcJflb3mTMCywyZZqjvnBn5Gz1
         R2h+e8fBOyLCd4IAhurMi/G6bXidZ69xpemjIfu84jB1v6EPL8QNjm/9+tvM5EeIQmyC
         VFke9NObQIEDQ9TGfXIR1rNvdTeLa/EcxVYe170M60xq+M2CxKfxUwLwgBmUACraAP2p
         OWyukRF6pfyUy/HIl/g0X6fdLEYIbVJNVvS9BciE1u4F8Ej0O544+Nkf3aVzyf5P6yjV
         jrZVIoIGX7LpZMoHYTFt3FAPXXF8r0/aZD6WLCD8bY1d7z8dnvWOlWQQ9g56FIz1VCns
         8jmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ZPFZREp4XuyHs/dUTvnynF7PvffAISud2Kxq5p2U0EY=;
        fh=cifr8pba1UFxxmrCAxsNOmuAP008dPE8RAn28wjMyMk=;
        b=s3GMol/8zjj6tC9VM030LO9mWsDhxNu6s5L8xzUpzvQU9uzKhECiQj6YwJiIbsrH+V
         5GA0Z9pabh8ImHPDf6fWwzbZpn/rbgtfxqI1E2CIRHg1w22DagR3KQ3Y61hFYqT7aXha
         K3Ochj2WGLRTF+gUhi7oy8bu9uVB0Ii5aLhKV7iBJhPIDqhhYpJfGlB6R02NXHnl40cY
         jA+lM3Sm/31Z/TJkZRLIKwBOA4a0EIkdmBkESiKIpFXPTamojRhd5OwLgcWyyE+Cm8pl
         yMr7OhOwPVjkm03JFjJ1xjYDOnmNiv3YdNtqT7HDMz9HlXvBQzu4ML5g9Jj8ajIAbhyA
         nn/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tkK3E4DO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45682d8f2dasi136270951cf.493.2024.09.03.14.27.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 14:27:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tkK3E4DO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slb3X-00015m-EY; Tue, 03 Sep 2024 17:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slb3W-00015D-3O
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 17:27:18 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slb3U-0007H8-G2
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 17:27:17 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42bb9d719d4so43506195e9.3
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 14:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725398834; x=1726003634; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZPFZREp4XuyHs/dUTvnynF7PvffAISud2Kxq5p2U0EY=;
 b=tkK3E4DOBWj3w4gMQPhdOIAI+wXFo5hZ8UHC1u6G2bWE/46jiPBxxMA7AufZTimZ7A
 Rzvefa6xVSjWeYhuQ5tGSnIF+XHe3PBWEpKLHvO+f1bfv6lBY1qfyFx55yPaS1NGOBR/
 yeuIUuv5/NcdjChuprjYq8X1NYAkcNh3ytuiyy8EDm4PUcUdhvTf22Vix7CoXx3HH7i1
 jKCUvZ5jwYIANqUyyxldXXVU7BE7P0/tZbtqAxvNVEBm1a5o3isBPFgjCkHIW1EuqNQU
 dliswUipKJbSFFAU3wXKSNk8vq4NdEZ64+ajEfCru6TVJPKSt+sneQaNJReezOtwl5mk
 3v9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725398834; x=1726003634;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZPFZREp4XuyHs/dUTvnynF7PvffAISud2Kxq5p2U0EY=;
 b=TlFZ/+yi7m+by8Gm56cTMzDmf6ks9sz0wqlVbwkk40Nn7MflRVbfyHiILDOs5boUIg
 N16kRUjf83KRyFO4r1SFDGV8A6IrjXU4h781Tk1NauLD3ZDoPjo152KuF3T45nm/RkaD
 Bn5xGwQUuI+VJvI09iQyf+QE0FF8GF3dWkjPP7H/U8Cg8XrnJK2NUi8+WmC/NNu57u2A
 /AMhxHk/XT7UoTZ2c1AR/O6lvf4S3ZKTV6N60Jnp9a6Pzxmv46qqogOeQu26rpOXNMQ1
 Jf0iljyvynVdnFUbIk461uenDHoy1uXkv2ckvQREohNaGbWX2Ox9ZJt2oT9HuKcmF40Q
 X0Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEw6SXme4JguptCkAkukl+zivfMEXvaGHOmxsPz1Xqh4nmpO6Y8ZnQR6ELCdnYb15MGPFIylivIw==@nongnu.org
X-Gm-Message-State: AOJu0YwnY6BK6P6f+BDojePKRnTrJHbxiCRYW4uY5R7e8R0O5su7DpJx
 9CpLMu0yX43MSa9hNy5WYS2jBMBi2UvwUcJyiEeIXd1U5gbnHd1HBcyRXMRyl7nVny6/7hVWcvd
 P
X-Received: by 2002:a05:600c:1c06:b0:42b:b594:4a8c with SMTP id
 5b1f17b1804b1-42c881030dcmr36889475e9.27.1725398833870; 
 Tue, 03 Sep 2024 14:27:13 -0700 (PDT)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6deb303sm186119555e9.9.2024.09.03.14.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 14:27:13 -0700 (PDT)
Message-ID: <de5f691f-ef22-47eb-a6d3-7342c0b4e008@linaro.org>
Date: Tue, 3 Sep 2024 23:27:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 09/53] hw/arm: Remove 'connex' and 'verdex'
 machines
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-10-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240903160751.4100218-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 3EoxHWJOz1/E

On 3/9/24 18:07, Peter Maydell wrote:
> The connex and verdex machines have been deprecated since
> 9.0 and so can be removed for the 9.2 release.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   MAINTAINERS                             |   8 --
>   docs/system/arm/gumstix.rst             |  21 ----
>   docs/system/target-arm.rst              |   1 -
>   configs/devices/arm-softmmu/default.mak |   1 -
>   hw/arm/gumstix.c                        | 141 ------------------------
>   hw/arm/Kconfig                          |   8 --
>   hw/arm/meson.build                      |   1 -
>   7 files changed, 181 deletions(-)
>   delete mode 100644 docs/system/arm/gumstix.rst
>   delete mode 100644 hw/arm/gumstix.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


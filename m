Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp60972njb;
        Thu, 30 Jan 2025 14:11:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW9Ghhd2L03jLzzUqQPxb8GQXKjflpciCMvGq2VqbksTt+HIpJgUxRoPNBhS6wdH90nDbcXNm2feABTVg==@linaro.org
X-Google-Smtp-Source: AGHT+IFumSTfTFNHf5Hy5dxkOiOOFscZf09FawYwPLZn0usxkDLkSjzS+uHTPxy2v/tpBVcmb0wb
X-Received: by 2002:a05:622a:55:b0:466:9938:91f6 with SMTP id d75a77b69052e-46fd0ba3bf2mr109498431cf.51.1738275095747;
        Thu, 30 Jan 2025 14:11:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738275095; cv=none;
        d=google.com; s=arc-20240605;
        b=Of5q2g09z2LlUb22uqtNgeSCSho9P5H2AUgg5UvZNK6iiLMvICLVPgao1k36qgBEw0
         a6p2OlM/JhV2gZejpAn9JbJtxc3Pmg+gZk0Qf5ozBrSdLo8/55IhECE+NU8oJ4KY7grx
         gBNmOl8LlNOTNd+MAAI5UlhSi2kw+InPsLAImO7qLIDjGF1xjAP83fWvTjcmV5OV3J8V
         7ObmS6nFlDcsftqbiv/m51zRCSAsE4/3PhFti5LUQZ2NslmkxU0tUn5qJfdsMAvyQHhf
         h3h5twU72n4UUVjgaP5Z9zXBt+5k1lMtRGMBzhX0L5uy07eYl1LkZR4fuPWw2oZfCu2f
         hgTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=L0tx4pUH+PghU+NCi8StXWqsKto4DjFi9YNkvFHPRco=;
        fh=2BveqyO0iVQB4gTWv1VMJR+G9ddP2hsSGNhzFAL55gc=;
        b=LSwvnhrA4hMTJ2klbrxrxf8U8o6ghTNXm7YfZzzWBYSxsx9dw7grQYxNQINFIkA1GS
         XiUfcaKYEcuZy3ay5C11NQKV/MlMHW1C6KvQzzJ1pB7XEJQ8pMTdfWvSbQXCjsUzhVDJ
         L/t31bwAIibGdHQktKUQbc6a1cpHuwiXc4Djqu358fjpqFzOWaq67D489zH4y66guG79
         /9+IUkCzrxayY2QBYjiMI8UZIx4SIx9YeMVlA9iaEMZRearbkCb+6qdJiOQtRKf0HVq0
         BvpUR1snq74kXyB3MN54SATVGwaPLUt7NJL4I/QubLzKQ7qhYPKIZ+pso6Fp9P6DJ2Af
         X0jQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z0iTae0d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1e22a9si24413281cf.542.2025.01.30.14.11.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2025 14:11:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z0iTae0d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdckk-0001E0-Bv; Thu, 30 Jan 2025 17:11:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdckj-0001DE-09
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 17:11:13 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdckh-00070V-Ei
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 17:11:12 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3862b40a6e0so889487f8f.0
 for <qemu-arm@nongnu.org>; Thu, 30 Jan 2025 14:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738275070; x=1738879870; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L0tx4pUH+PghU+NCi8StXWqsKto4DjFi9YNkvFHPRco=;
 b=z0iTae0ds3KsNcfRnK8OzKARYJE32m0k50LJ78YqrKFO5sJMt7+1+ltQqnNDB4vwEV
 IwOe5/qNz/H2ErKbs4ELIReJDijaHOWwrsX5VlcxrPCgpn70vwbhd3UR5LdgIwe5eB2k
 SkgwibctSsuCsd4dIbVX6wm6guZvhd9VKPdsp3eZRALDX7+yE2Xgs4Fq4aMv8+AM70/u
 Y+fxQHra3m1OJq59b3G+xapOHbequdySrsGuERuEapGDuJULAUqO5ZESosXyzewwJX2/
 AYjEq8s0/WBltxrOIRVYB7M+4M56KaP8kIrfWqSlZ9BydCzpRl1E12MwZlAY7XQg8OMI
 v9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738275070; x=1738879870;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L0tx4pUH+PghU+NCi8StXWqsKto4DjFi9YNkvFHPRco=;
 b=VN1PCHVV6Uex0Qt9oLOET6Pb42NwirjVBbMd248IZ261EjyzrZPaLofyrowpyS/nzi
 Eye9hUjWOi8RelcLO9AMk928KIq8s1K2viUSQJPC6KKIDDYSx/M2QXVhpO1ZlVr7d/p4
 jwTPD9KLREkmV7RnQfk2TuuvpvmAV77vWE9C5NeGcvkp6vDoHj+jEJPEoa/p+GtHKbD3
 XfigT6xdFHg+eDsMBS2y//GuVFQXjXdPGqevK2geMoc7gW4XVtIZiUg7JhrxwWDcqZhL
 CQPOU9u0Ja4LhKn/BR0B7cqCJI18GdJ/+fAUSRfdQFZ4uqaNKCnbuor3wL/pJ00f/3rt
 gwmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM1m60BjPv4jQAlLgrHU+HbcIAVTUaEJySFLyn/XtV4tAE1sDuYbcx67b4ic3VRMAgQIJdT0onHA==@nongnu.org
X-Gm-Message-State: AOJu0YygMIkkbAFRlBA3cd90hv6UPOKrvVT5SGYnI7FT2NHvE/TZ8NLm
 bDab4MUKixkjlC1yZr05ZjPDq8zAFggeHxfj7T5VMJJfFzrUswcQYzFxDg89MGw=
X-Gm-Gg: ASbGncsYPTqnii8phv1Gs3FP3cz9BCvN7OpI2TJ8zt6CJ8/ihwot54VeYcoBikgmvkt
 u44jtZTEwKVzMGgZOSy3G2v3U22R7nfHgdS9H21BYYrLTruQO6RKXjJVllngXVmPnvLlwUVVP5J
 Y0FP9whEarZnNJOirRWOrYQpzImtpuKx6Ne7G/0htkilGVvVlHHV2O1183ih7fJKYmWcOKANFnH
 T0VwWrDFBwsXjeNEiVFBbJongyDoa23gDaswdwZgTNiruiBge2gZQMSuMAAzY6Lw9gB4NQNJ8O9
 jJS9E1sv9SAQZfL8+al7rQZxXiTCOgjsoGgUw2EWShdwb51AgigaUOpP6vY=
X-Received: by 2002:a05:6000:1f86:b0:38c:5b62:9fdf with SMTP id
 ffacd0b85a97d-38c5b62a3b2mr3652455f8f.31.1738275070069; 
 Thu, 30 Jan 2025 14:11:10 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c0ec35asm3137123f8f.15.2025.01.30.14.11.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 14:11:09 -0800 (PST)
Message-ID: <e2359748-f251-4830-ac1c-e4fff397c1b1@linaro.org>
Date: Thu, 30 Jan 2025 23:11:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] hw/arm/omap1: Inline creation of MMC
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Bin Meng <bmeng.cn@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
References: <20250128104519.3981448-1-peter.maydell@linaro.org>
 <20250128104519.3981448-7-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250128104519.3981448-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: L56Ylv0UbYPE

On 28/1/25 11:45, Peter Maydell wrote:
> Our style for other conversions of OMAP devices to qdev has been to
> inline the creation and wiring into omap310_mpu_init() -- see for
> instance the handling of omap-intc, omap-gpio and omap_i2c. Do
> the same for omap-mmc.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/omap1.c   | 15 +++++++++++----
>   hw/sd/omap_mmc.c | 22 ----------------------
>   2 files changed, 11 insertions(+), 26 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


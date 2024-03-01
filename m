Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp743744eja;
        Thu, 29 Feb 2024 16:22:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVsRkbeJWUaCiZ+RhbWTmK5fjdVosiR5Y8tjHSP+pmQ9hHxMKSbRauOZveYKo8WP5s+aGC1xVQ2343/Y/60myzatUkKKBQf
X-Google-Smtp-Source: AGHT+IH5ovP7fHCm+CkTuecSRU67dxHy6lYSei1Jim+sUkICirZqSfKyVX8ZaHIdXFYeQiLPiDvQ
X-Received: by 2002:a05:6358:2909:b0:17b:ef17:cb39 with SMTP id y9-20020a056358290900b0017bef17cb39mr62490rwb.4.1709252557755;
        Thu, 29 Feb 2024 16:22:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709252557; cv=none;
        d=google.com; s=arc-20160816;
        b=aNwNf02A/6pcsQtKnCKlRKYvLwILpxfPulGSvmwBBXUYTG63tS7uco9ThYKHPveY/Y
         bjB+LE/h1wmzpye9maFj8cDpiVYfbaUgb8KG1A2TQ6DWoI8dT1X89ZaLFCsunJFw2wyO
         d3kTJxHJIdiXXQ9dIudREfMptKrJCLIS/hEeuQlg8u7AvUy2wF+6X3uNiOcMwjrW34dH
         O/Vfd1FleEsOTHJAh+7+Bw92jLJI68chMThVmxvPJryfjISiqgiUg6dMN2urZ/971zB5
         YeCoS2IIyGk5HdlPP5YvIGhNYmjOcuYHKXpTXkEZbnyaKzkiy/Ra3ONiD8/tP4lGQsqx
         +0tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Qz4r3dXCMksTCt4HIh2SSUhoXbYDl44npX8gMtiNOjo=;
        fh=Ok8z4LBN4eUSe5q9P2lEHu8lCat9U9ICkXX1AUKCUAs=;
        b=joa9mz4NrvCKCKhYm1DtgCQ2vBV9ptc8J5iiVaY7DSpiY4ntXtL07O+28eUTLmqkgo
         Qy/3PjT65O+UD7KKOxxv/fre1Qw1051l4+zPr4kf7Vb/r1H57gfbzRTb39ujAcn8KPEN
         8DwzpTTkHhrJhKTFo8wlkvuFSdgJBt1e89RsXQkMTyewQrzaMGSMhBLluyowJpkgJCRx
         9vTCWNDi04NwIBOOxuio1ShgmDI3+2pjF0ResJcCS+Mrhr4zdLvBRlGSKDtbKYbUX/ag
         D83FdfHnIwdtQdcxl/mPgMcq67FIrnA09gAj4ytFG7o4235bX3rP1u9L6vDAywi6XOXg
         vjEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eHUkpj3/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6-20020ad45c46000000b0068f2b1d42d6si2748335qva.92.2024.02.29.16.22.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 16:22:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eHUkpj3/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfqfU-0007xp-OU; Thu, 29 Feb 2024 19:22:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rfqfS-0007vZ-V1
 for qemu-arm@nongnu.org; Thu, 29 Feb 2024 19:22:26 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rfqfQ-0006Cw-1f
 for qemu-arm@nongnu.org; Thu, 29 Feb 2024 19:22:25 -0500
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6da9c834646so1281638b3a.3
 for <qemu-arm@nongnu.org>; Thu, 29 Feb 2024 16:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709252542; x=1709857342; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qz4r3dXCMksTCt4HIh2SSUhoXbYDl44npX8gMtiNOjo=;
 b=eHUkpj3/FuK49b8TtTTKlQj7dg/xdLkUjsiOoclnTBNYbb2uyg+o14Ysgfp4ojeSHg
 0vq9kWt+DE0EQ0VXMQSiNbbpGDfcUAYySii/MTfgRgZam/u/XSZPs5ocJ1ADl/f/7cRo
 KhCxs7hmFqkiNuxcQtWUKZJtivB59JHFyZi16pdewMKQt8jLIJsqahTQ6mLYqJ7kd+ab
 RAFmFlMxmkt5i2oGfl7vOoG0oELkVOVJ71OMkvE4CGKJ4YZ+ogBgf0I6uGqkpKgpmEYt
 V7pkXR3ZtAzlN6WpyRtHNAl4z2mN5k5VvRS2Nu0hDUmZRKIRHOEvL8cdB1omXyV93Jd3
 ELTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709252542; x=1709857342;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qz4r3dXCMksTCt4HIh2SSUhoXbYDl44npX8gMtiNOjo=;
 b=BU5zKOlm/NwuCSiLVj7dVhR0yytD3QNaziLPidp/qw6irZqeLVQl/mk/9CrkPRzcoC
 X3vwSc64pdNcxhXi8VF5SU2BqRnXLT7fhs/ERRI5rkEcoZWoIRPQmvIW/M1KnH+iPpGA
 LR1HlSWawxSic8G0rnelK6fYwv09NoyLetqF0L1sK4IckyZ2Z0OYYb7bM0ZU31KW5fJC
 THfyZ4pn3d3oV758QXMRTsJpT6QCSD8yChsv22G2Z3zHWtr1EK+VsjFjf0b4Rp1ABERq
 ghzsDxIsVS/hP1GxYbryM6jsa8Hy3Qh9oFXn8cgWOUrr9z9QD40BVFscCuGEeOOjv2nW
 70QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU67uKHVrLZcsKwFJjXFsPingkVBGV2qc53yeSYynSPC4iWjrQXoUOmoRGovfkHO8WsrUvECJfESXMdoBqV9q1zCJVs
X-Gm-Message-State: AOJu0YxhGxhVfaLteRGoxw72yE5Ws5lh4rbtiTTgFvE5PJTbn8vHw29t
 LJ+oRtG4FuxFsDkeT2UyJQg/weN3xbP2Jp0lL10Wy7yjlPBXwkYEyfMnOnwWfog=
X-Received: by 2002:a05:6a00:841:b0:6e4:f678:f694 with SMTP id
 q1-20020a056a00084100b006e4f678f694mr330209pfk.19.1709252542405; 
 Thu, 29 Feb 2024 16:22:22 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 i13-20020aa787cd000000b006e4762b5f3bsm1891523pfo.172.2024.02.29.16.22.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 16:22:21 -0800 (PST)
Message-ID: <657b22f4-c717-4288-86f3-a5226c926664@linaro.org>
Date: Thu, 29 Feb 2024 14:22:17 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 19/22] hw/intc/arm_gicv3: Report the NMI interrupt
 in gicv3_cpuif_update()
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240229131039.1868904-1-ruanjinjie@huawei.com>
 <20240229131039.1868904-20-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240229131039.1868904-20-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
X-TUID: gRcf20C+NPwu

On 2/29/24 03:10, Jinjie Ruan via wrote:
> In CPU Interface, if the IRQ has the superpriority property, report
> NMI to the corresponding PE.
> 
> Signed-off-by: Jinjie Ruan<ruanjinjie@huawei.com>
> ---
> v4:
> - Swap the ordering of the IFs.
> v3:
> - Remove handling nmi_is_irq flag.
> ---
>   hw/intc/arm_gicv3_cpuif.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

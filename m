Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp478385ejb;
        Thu, 14 Sep 2023 05:27:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaybMnw9P5A5YROenBKDNNl0ArauUP1GH7BRFKo1nmZTfg3Dm//Il9OV60NGjTJjZFFDUZ
X-Received: by 2002:a67:b40b:0:b0:44d:3ba7:b617 with SMTP id x11-20020a67b40b000000b0044d3ba7b617mr4680885vsl.32.1694694443769;
        Thu, 14 Sep 2023 05:27:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694694443; cv=none;
        d=google.com; s=arc-20160816;
        b=C8LoceEXcTjIvn5CZIUoh97AHfccQI/QCrZ7GCEI2Fb5YgAbbrKd5x/mD/wGaJbbKv
         FLVGZlYYEy4VVHXkIY6dKIJXjScMd5AGw/Io8EHyhihW9XoCfsDF8/QlwSBvmoi2mCMB
         k0XPG6zuAXpOK91/6QqmdC9mdCeVi0sjASDjKXqGw/A9kvm0+HtzXq5caJYQ7VhzD4Uk
         9yL/qIex1gEBFLm15jlXvAGdMM1lUzYxc61gVSacofvh9+YrWIlZkTW1YGN3U1brW1Bs
         jDR/iWYJLO+MAFwsnqCHGIF6ZVagrUCQrP8/Ain/3KrUp4KofXXtn/BLglqrXRfz/bLm
         xrvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=WTp3yPb2PACwEQCpaz1Ap8Hl5eu3Tm4ocL5DYXQYnrM=;
        fh=2w5/DxcMtQ8eO0DkxfZY7SlIKNr/zKAkC5EjTb1R1+c=;
        b=ke7HOFipF916jUEuuRKRpiJhxkF1A7f48lYfErLob9toz1AUODygtbOTo2YN2IhTeq
         dSNRk+7sJ1vvemlkMpxT+Lcxjm3xdNDtWubXDtipBptyVctpUAHovP1UFYVXAPNOWNK+
         UuS8hkMxTlvyTqPFvIAyadxaGrJAvhIC18dozDtnEoplSLBp6aUDScK0YCN8dgpwLgsd
         lu+AR7cimjou9wlAHGu7gQuoppTyfA2COUUCNHgTT3HoTcePzRXaVjlpJl11nh72a+1W
         LzxLdOhYAVx0M8T109n4wHTQ84vqKS7cK177okDNG6uQxmKN9M+Qf141kTll0z3OEBKC
         WZug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XF49jk97;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4-20020a0cb244000000b0063f95c38ed4si786581qve.205.2023.09.14.05.27.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Sep 2023 05:27:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XF49jk97;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qglQo-0007uG-7i; Thu, 14 Sep 2023 08:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qglQg-0007sU-7U
 for qemu-arm@nongnu.org; Thu, 14 Sep 2023 08:26:42 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qglQd-0006X4-F1
 for qemu-arm@nongnu.org; Thu, 14 Sep 2023 08:26:41 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9a9d6b98845so451211266b.0
 for <qemu-arm@nongnu.org>; Thu, 14 Sep 2023 05:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694694397; x=1695299197; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WTp3yPb2PACwEQCpaz1Ap8Hl5eu3Tm4ocL5DYXQYnrM=;
 b=XF49jk97lzCgMw4XesWphnfS6QJvnqFYSep6JhI9+0w39pUI/mFyi6RrJaWejPPlKc
 /vHKc9vEtB/7RLL3pnjmJy9oiwz9l0NzbDfDTGsT9iZOU1Xvo/shO8oi5MNUXCUM5sYj
 l5DHQq7IbPI2LRFJ7neiLk4oF635F0iA1ry8ApEs+yV8Grs0J9hbZHPJluzVOV7+Xz35
 IMXdzARgo3ZrTKji0nuCmaT3whzbbFrFfbQr2Ig6GXPoSLOIFfsmqLC0UJSFs9K91Ffg
 bnM3RK4oKLemdJ491KEtFyQyky7G/ACNG3QtxpL6INcfYKjWZN7tvCCbN41ocSU+wQWw
 cWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694694397; x=1695299197;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WTp3yPb2PACwEQCpaz1Ap8Hl5eu3Tm4ocL5DYXQYnrM=;
 b=ieOyXeTkk7OThtNhcLqVV78CZBydHdwBLVSrEA6ySGEGWACnUz+HWxypnblQZ7AGQA
 /FqHfwp86CTpqUPrv+cBDjmjqpxdfg1HkU10onY0NJAdwmrCrdV4ALGB5rhHTSEha5mw
 m2Yk942RTPha3YJXS9bOF/uFlQEKi5ZNHXoh0TGm3hPzdnFWYdXublobA2PMsqhj+NzU
 WWM/6L43t8ZRwmr8luSaB9IyYzUe8FH3e8ImXxbxNt8oKLzEn+dQLcCwp1jewVTspy52
 nq/lzI8b9YTGGUQqqbkv1pBB6PmvJC+SjUQGSBopHJHipaxriYZO321OTEoF991K7CQC
 wM+w==
X-Gm-Message-State: AOJu0YwQMbsG7YOismr9e1PvaJT6mVqIWtDLv42Au2nvPxgcnZnQ2MgZ
 TRn5yHEHkXOy2LGs7cftSJJ1jQ==
X-Received: by 2002:a17:907:96a5:b0:9a9:fa4a:5a4e with SMTP id
 hd37-20020a17090796a500b009a9fa4a5a4emr2345914ejc.13.1694694397008; 
 Thu, 14 Sep 2023 05:26:37 -0700 (PDT)
Received: from [192.168.69.115] (176-131-223-129.abo.bbox.fr.
 [176.131.223.129]) by smtp.gmail.com with ESMTPSA id
 x8-20020a170906298800b0099bcb44493fsm947897eje.147.2023.09.14.05.26.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 05:26:36 -0700 (PDT)
Message-ID: <09413ec3-965d-8588-e0df-e8c4a6fa55b8@linaro.org>
Date: Thu, 14 Sep 2023 14:26:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [RFC PATCH 2/3] {include/}hw/arm: refactor BSA/virt PPI logic
Content-Language: en-US
To: Leif Lindholm <quic_llindhol@quicinc.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
References: <20230914120124.55410-1-quic_llindhol@quicinc.com>
 <20230914120124.55410-3-quic_llindhol@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230914120124.55410-3-quic_llindhol@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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
X-TUID: twJAlaL5hZi9

On 14/9/23 14:01, Leif Lindholm wrote:
> GIC Private Peripheral Interrupts (PPI) are defined as GIC INTID 16-31.
> As in, PPI0 is INTID16 .. PPI15 is INTID31.
> Arm's Base System Architecture specification (BSA) lists the mandated and
> recommended private interrupt IDs by INTID, not by PPI index. But current
> definitions in qemu define them by PPI index, complicating cross
> referencing.
> 
> Meanwhile, the PPI(x) macro counterintuitively adds 16 to the input value,
> converting a PPI index to an INTID.
> 
> Resolve this by redefining the BSA-allocated PPIs by their INTIDs,
> inverting the logic of the PPI(x) macro and flipping where it is used.
> 
> Signed-off-by: Leif Lindholm <quic_llindhol@quicinc.com>
> ---
>   hw/arm/virt-acpi-build.c |  4 ++--
>   hw/arm/virt.c            |  9 +++++----
>   include/hw/arm/bsa.h     | 14 +++++++-------
>   3 files changed, 14 insertions(+), 13 deletions(-)

Isn't it simpler to reorder patches 1 <-> 2?
(First fix PPI macro use within virt.c, then expose header)


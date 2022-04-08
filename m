Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp162643lfq;
        Fri, 8 Apr 2022 16:45:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxo2mJ6K3qYbmiAcsMNap0aFcE7SRLZoF3kCVQxPulKO0K+/SynaRS6fYP0S3SoLzw3Zo4W
X-Received: by 2002:a05:6214:21ae:b0:444:1993:6db9 with SMTP id t14-20020a05621421ae00b0044419936db9mr7195715qvc.117.1649461541443;
        Fri, 08 Apr 2022 16:45:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649461541; cv=none;
        d=google.com; s=arc-20160816;
        b=ITbB270vIY2/sPWHbaa0sFBSZ8JJOHrH+hpg3bbAuj1mZw124h+imzdR92vHJYD8T8
         cFUPw42Rvm22Js95Zsgq+Hw8csXMfb7G3iAjA7kIcUrjVNATEG1lyzUzwvz4KRbjOPMi
         SekYHAM+CdaK7X7b1VTHhVgr01siUv1CffJgdsmfWKenOTmTrTNjJ6fG374cdPODW4A+
         jqlOoTDCd9bz0Ji40XPURRm/nvXdgpuiIk6jysb0k6zlTRE26DYvjo81LnswiQ7ZKMye
         JeJEyZB8GHS1Yog6+KDwIXxev/1emRW/nrnGCm92o+Dk70D+SCrQKdbuNXYOPOuw+COJ
         xrdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=1ydNvS9zmRs9Yj1qePuBxPZg2FBsoA/uUOe+zJQ2BPc=;
        b=F73oW0pgO19f9sju97xMDk0x3M6oimWVOET3VmwQODmd2TbYBg2Qryj7QJtjljDvy+
         S4AdKicNwq5LcMVom8wVXOh/Wmn8koRSKq3H8nQBEVnGUi2rxr3IdKtSzlTbr8KduYPk
         nxBfuZGt+vup7AdnXYXTFL2lo7qSyTnY1JniUDzKJXYErUabWUsGeYQR/Mj5/r4otR7+
         hLMbQY4GKa9tQXTHa2tMoa6OFvvh+N89Y9BYuay+bPyVRKz4/WxH0Dh4JYyYoDFvJ5tm
         bwwF/ZJ6wkECEvXZL/mqMJtMVyLEEKfhMariBSRvGoQh6OMk5NFiimYESOoP1CV3an2J
         Jzhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IHboVxCZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iw6-20020a0562140f2600b00443d2bc758asi1071520qvb.504.2022.04.08.16.45.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 16:45:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IHboVxCZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncyIO-00055J-UY
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 19:45:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncyHp-00054m-Es
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 19:45:05 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:38787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncyHn-00007q-OA
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 19:45:05 -0400
Received: by mail-pf1-x42b.google.com with SMTP id b15so9749772pfm.5
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 16:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1ydNvS9zmRs9Yj1qePuBxPZg2FBsoA/uUOe+zJQ2BPc=;
 b=IHboVxCZW14F3LouY393xMKHTxaIRssncQDjWxwxEiyBDcH/3YNm1Cs2g+inmp1Ota
 OZxiUgnVtfCYUDqQ5lLIKpHpBQQxAbaS5E73QkrV2XfdoRUn6arUvtSsi8Cn7NBwr4Ry
 7kw6CnIp3qjKqTVOSiAQE+Gqpbh4zlOEjQalELTIIrqLc4u4qfyUDXYMglBdWBq3W/x5
 8yqjotnGpA6M0IG43cZuBYxBhgGSf8SW+ae22gH2O6qycbqprjH6nLociQidbxwo910t
 gCZ31Eb4hsoIfP7IK0GQaVoRoHubZUW6G22ZCuBJGSsWU7pU88pmi+/BWKNEkFHGkk/S
 kCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1ydNvS9zmRs9Yj1qePuBxPZg2FBsoA/uUOe+zJQ2BPc=;
 b=LPlUfw9RLrgQshEIR+PP+Bea3hC47+g6C9r5eWl6STJxOjGCXkIVUdLHzVFoc7w48r
 lBv95zySRDc9L8Q2BZwW1QqVKRJ+pAQG1AuRO5zh4LoS1CisBQpqdTi3nxIhOp4xU49I
 gDLbOLEErcifsx31PfFOHFjKJS7p5FnhIinAQb7CoNq0aP5qXE2AmeFp/sT5dVfCfiF7
 XMYoyxreNjdy5mAcQkRCbanRgemnjNpq2m2yRnTii7dgncDHtdrSY4PgYkaAH90qRbe7
 F7pKczT1UQODbIaU0E6XHyLhOFKHzvf10xpoHXKNLA691d3EvwJZv6crus16GP7eMSVB
 u+DA==
X-Gm-Message-State: AOAM533EGwCnDQ7yZYLnRhoV07QrFUIiGUKBunjBsa4vabWsKt4JYQXa
 MPo8iQr+EO7hpvjzSdltSAoRMw==
X-Received: by 2002:a63:dc42:0:b0:382:6aff:3f17 with SMTP id
 f2-20020a63dc42000000b003826aff3f17mr17495177pgj.5.1649461502276; 
 Fri, 08 Apr 2022 16:45:02 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a6541c2000000b0039d1280084asm1009117pgq.26.2022.04.08.16.45.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 16:45:01 -0700 (PDT)
Message-ID: <dc2089c2-470c-7ccc-99c4-c4b82b61c94a@linaro.org>
Date: Fri, 8 Apr 2022 16:45:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 06/41] hw/intc/arm_gicv3_its: Factor out "is intid a valid
 LPI ID?"
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7vHzpyPuGd9O

On 4/8/22 07:15, Peter Maydell wrote:
> In process_mapti() we check interrupt IDs to see whether they are
> in the valid LPI range. Factor this out into its own utility
> function, as we're going to want it elsewhere too for GICv4.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index f8467b61ec5..400cdf83794 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -79,6 +79,12 @@ typedef enum ItsCmdResult {
>       CMD_CONTINUE = 1,
>   } ItsCmdResult;
>   
> +static inline bool intid_in_lpi_range(uint32_t id)
> +{
> +    return id >= GICV3_LPI_INTID_START &&
> +        id < (1ULL << (GICD_TYPER_IDBITS + 1));
> +}

Ok, I guess.  Though there's no need for ULL, and a 64-bit comparison.

> -    uint32_t num_intids;

You didn't have one here, and GICD_TYPER_IDBITS is 15.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

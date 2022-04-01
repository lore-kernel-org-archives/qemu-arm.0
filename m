Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp876227lfb;
        Fri, 1 Apr 2022 06:20:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhXveCzmsnSTmpKVTvoeqtmrB2S6gwrUOWDLT2Q6cKje+v2LclE9M3FMvFeHTV51+5oxrA
X-Received: by 2002:ad4:5de4:0:b0:441:5fdf:ddae with SMTP id jn4-20020ad45de4000000b004415fdfddaemr40524807qvb.100.1648819245783;
        Fri, 01 Apr 2022 06:20:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648819245; cv=none;
        d=google.com; s=arc-20160816;
        b=gsl5UtczlFJMFFLEqhl07M3gsYt/hztc9x6GS66rRICxJ8o1J4++6Fx5rqyhhEyYlk
         sngyS6MQ+eYuJDs3w6iUxu9JZdX+xJpN2OfgQvroSsspDafUPXADxJZM7PQNZaDx/xJt
         zJ4sjyIgtdLLCtu3FpOM/uRRfaU2IJm0W94Zrr62jfzg+kO+/jiKAGkowtP9r9FJ66sD
         oeDhtq68DwgUag6+mkprHawiysNL7HH2JY/l/Nm5EY4x0hy8kZqrMnTfSjr7ytHazqsw
         3m3n0SVDi7aP5ZtncT6jOS+4dxqcRRsP7FQ3IBNRJ5Xe05gfKI7tgVy5DgfHWMU/Pkbm
         PmLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=WwXuC1smwhhROcpwAgQUnJnlG+qR4By2v5jfnqOjKOM=;
        b=BVQVrX1T2XybuKjP4oboYUq2ZsEgXdKztzcV8xk3ageUoP/A78hjXZAczwz5t4hBUm
         5msPUYctqQLJXjWbDQ8S8eF9fqrjm2T6bsnaSLkld2cqKH7pd9f4sV3A/s3ht+HF7wur
         5hphafpLH9N8whqG4wjRozpkMoy6dQ0HWre3ICAtw/CRpAd7xJFeSbL4grJ7tL7OXxXx
         JXMbhaoeHP+nbSM+MNxdgxeRr4clzPmChKxDywE99rNPhiOwPcLdsO7/dNvwkgLw9kCf
         FgyEpFkR0AAX2lUakOoK7tF394Zj6H71mF3V5tJsLRWZgkvWN3JkA+mbBDNFfrfoArxL
         yvUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=jMURKNX4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s3-20020a05620a29c300b0067e4be23962si709956qkp.423.2022.04.01.06.20.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Apr 2022 06:20:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=jMURKNX4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1naHCn-0003uB-4I
	for alex.bennee@linaro.org; Fri, 01 Apr 2022 09:20:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1naH9Z-0000Rw-40; Fri, 01 Apr 2022 09:17:26 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:37582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1naH9U-0006Dq-Gu; Fri, 01 Apr 2022 09:17:24 -0400
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 2760C20777;
 Fri,  1 Apr 2022 13:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1648819037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WwXuC1smwhhROcpwAgQUnJnlG+qR4By2v5jfnqOjKOM=;
 b=jMURKNX43E6tp9vEYCjG2Vta2rLQr9+MwJmpighT5Z6NnDn3C4CkodHyglxj9xH1WrOpey
 NiA1sZrnShC4fSI3qJnh7jobBLVteN52cXb043BE71Q3EiPleOsQdFH7ahnSyUwc+llYx+
 eUyuCcHBwwWsDe24eifj5WWr2TBZ0vc=
Message-ID: <77de88b4-9fb7-d1c6-4f2a-55b7b5cbc9b4@greensocs.com>
Date: Fri, 1 Apr 2022 15:17:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 3/4] hw/intc/exynos4210: replace 'qemu_split_irq' in
 combiner and gic
Content-Language: en-US-large
To: Zongyuan Li <zongyuan.li@smartx.com>, qemu-devel@nongnu.org
References: <20220324181557.203805-1-zongyuan.li@smartx.com>
 <20220324181557.203805-4-zongyuan.li@smartx.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20220324181557.203805-4-zongyuan.li@smartx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:Exynos" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6tVMACjZWd5F



On 3/24/22 19:15, Zongyuan Li wrote:
> Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
> ---
>   hw/arm/exynos4210.c           | 26 +++++++++++
>   hw/intc/exynos4210_combiner.c | 81 +++++++++++++++++++++++++++--------
>   hw/intc/exynos4210_gic.c      | 36 +++++++++++++---
>   include/hw/arm/exynos4210.h   | 11 ++---
>   include/hw/core/split-irq.h   |  5 +--
>   5 files changed, 126 insertions(+), 33 deletions(-)
> 
> diff --git a/include/hw/core/split-irq.h b/include/hw/core/split-irq.h
> index ff8852f407..eb485dd7a6 100644
> --- a/include/hw/core/split-irq.h
> +++ b/include/hw/core/split-irq.h
> @@ -42,9 +42,6 @@
>   
>   #define MAX_SPLIT_LINES 16
>   
> -
> -OBJECT_DECLARE_SIMPLE_TYPE(SplitIRQ, SPLIT_IRQ)
> -
>   struct SplitIRQ {
>       DeviceState parent_obj;
>   
> @@ -52,4 +49,6 @@ struct SplitIRQ {
>       uint16_t num_lines;
>   };
>   
> +OBJECT_DECLARE_SIMPLE_TYPE(SplitIRQ, SPLIT_IRQ)
> +
>   #endif

Is there a reason to move the OBJECT_DECLARE_SIMPLE_TYPE line ?

--
Damien

Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2769569ejc;
        Tue, 17 Jan 2023 13:40:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtZ3vT9SoeDMetCgUL59gdl6sDKp5oGLltHf+NiScQ5s62kRmeTXOawN93/jkQxZtuUxlGi
X-Received: by 2002:a05:6214:188e:b0:4c6:eca0:4870 with SMTP id cx14-20020a056214188e00b004c6eca04870mr33853005qvb.30.1673991643401;
        Tue, 17 Jan 2023 13:40:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673991643; cv=none;
        d=google.com; s=arc-20160816;
        b=c9b6U/HrRe/9cneHYm39wM/yjg5AQX9MVH7GACNcQjwqtT8LJvyls/iWhOVT40cH7R
         i2MtyRiQeQq2FMK415shQjuJyNXyWqc2M133aFAEmGHWUB919jAbMeOFI3PeKPUg9njm
         WDFkIYJaDC/P/v1PqoUNZT6H0e4JW//GOEhYwLJi7GuKk3DM6Z0jv04sr1wjqzIz9TJ8
         b+zMGLti0kAy/QJrqj50Z3qjdfzjtaVS9iEb95s77JSWFwvpmtaPYorUUOoEFIANwqtv
         E1/Kowoc2u/Hql0N/zK/eK6wX56AfrbBUW6CnHuoBLanLAitZDHOLzFFE2UIc8w3gTmS
         kyTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=AcVEPWClRI94g9v5KSp3wSvgePAX02EC69sY1cg8Ei4=;
        b=ZpjRg6cndMtRxgVlvOOCZGnhuOR0zVPXCReLZ+504H5J3JVOShMR/0RASd+TxyxUl9
         Tkg+kHTwpjfieqtzNAJYFnoBz4FVLmZeW8zMScUR8RxpKfLRnfDCDK9kSZA4SFy8K0gt
         t+bRUhHs31s6q0vUSJypu5khjO0sOlgIX5YnOr0Os7sfQOVMJgPnsZsUWFOyGlhb0Ah5
         v8M884XzLtcaDxIvmkB9e1Cu2wv0O6qGNQldhHPdN/8jeKrAU9dK0IJY7jV6xvGn9W8X
         W1F2+PRyPsF0Yd3bdPWB1FbH17nSu8IkrgCHS7l3A7TE5cpYmhyHq86Vzv1lLv9MikG9
         TeVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y3NrN4Qu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q7-20020a05620a0d8700b006fc9629b552si19609675qkl.232.2023.01.17.13.40.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 13:40:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y3NrN4Qu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHtgy-0005eK-A0; Tue, 17 Jan 2023 16:40:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHtgw-0005cG-0u
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 16:40:26 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHtgu-0003GF-5e
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 16:40:25 -0500
Received: by mail-pg1-x52f.google.com with SMTP id 78so23040803pgb.8
 for <qemu-arm@nongnu.org>; Tue, 17 Jan 2023 13:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AcVEPWClRI94g9v5KSp3wSvgePAX02EC69sY1cg8Ei4=;
 b=y3NrN4Quhl38XnkVyfYFikfMGXuzUdOe86QeHc3ich9WveIqGYWPk5HPehBRmwxf6H
 CjxERbsV7hXXf1u1KTQZDoqZtTX1IoZodSrd1kTyXIb6dyMKoVMeeAUo+mwEcC9mp/2m
 BNexm0zJUZPNlbdhtEHh15Erpz0b26SnGDHA6SP7lAYFkfQ5NzWWjYurSwB1NnREKM04
 DarVSe0lglQ+qAtFuBPk/lt2ySdXvHIjAYyE8GCSkMrX/6ow6LPxLBPL9hNkgEdyBLne
 ippIwjfBdN8uYC0nIRqXsJLU3St9AcBZfjR6ppm0D+snmwdQ3hBhrFoH7DjBqMgfsNlJ
 ic3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AcVEPWClRI94g9v5KSp3wSvgePAX02EC69sY1cg8Ei4=;
 b=RNUJSyg1vjifL7Jy7naJEB3rHIPjHgoShUNiLj82V/CfCZRoFsxBrfVACHoU3Y5ntv
 Iq0QOQVk8BnNdu7lPVuwwFxRZVUFHTpk8wZSVIimPdViYQ4qzyamrzkLeTRuAOKZUNW+
 qJwX97+TEknRIrbTkMPJia6Q0LD7a5xnSFbH57MOcRXHEc56JHvDG6FCxb33kLDzJSNT
 GfGK4DPngnRN/O95azuUggYT6kuwRxnAOfIsJbwzRoqKO2QJ3MF3tQU4HhX1cp7ew80X
 IAAO+Izc9KtzVzQoSGrzDIckjoL+1aPnA0AnLUkks9lWb8HIrGLuVPiwmotEIgj5FmNO
 UU0A==
X-Gm-Message-State: AFqh2krLbtYvM0Yj6tHQb0G4gYIQoMRINV3Pr0/KYQ+8EkP+H2WxntA9
 BaXjYc6iuVS0Rmo6CBO+PkxAJw==
X-Received: by 2002:a62:1851:0:b0:581:95a7:d2f4 with SMTP id
 78-20020a621851000000b0058195a7d2f4mr24761696pfy.9.1673991622365; 
 Tue, 17 Jan 2023 13:40:22 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 f129-20020a623887000000b0058bf2ae9694sm6177716pfa.156.2023.01.17.13.40.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 13:40:21 -0800 (PST)
Message-ID: <cb9cdb62-5c5a-c7de-9fa7-99f5438af332@linaro.org>
Date: Tue, 17 Jan 2023 11:40:18 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH qemu v2 2/3] target/arm/gdbstub: Support reading M system
 registers from GDB
Content-Language: en-US
To: ~dreiss-meta <dreiss@meta.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <167398464577.10345.18365355650640365165-2@git.sr.ht>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <167398464577.10345.18365355650640365165-2@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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
X-TUID: SdKgD9B2/hhw

On 1/9/23 13:05, ~dreiss-meta wrote:
> From: David Reiss <dreiss@meta.com>
> 
> Follows a fairly similar pattern to the existing special register debug
> support.  Only reading is implemented, but it should be possible to
> implement writes.
> 
> `v7m_mrs_control` was renamed `arm_v7m_mrs_control` and made
> non-static so this logic could be shared between the MRS instruction and
> the GDB stub.
> 
> Signed-off-by: David Reiss <dreiss@meta.com>
> ---
>   target/arm/cpu.h      |  12 +++-
>   target/arm/gdbstub.c  | 125 ++++++++++++++++++++++++++++++++++++++++++
>   target/arm/m_helper.c |   6 +-
>   3 files changed, 138 insertions(+), 5 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index bf2bce046d..fdbb0d9107 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -856,6 +856,7 @@ struct ArchCPU {
>   
>       DynamicGDBXMLInfo dyn_sysreg_xml;
>       DynamicGDBXMLInfo dyn_svereg_xml;
> +    DynamicGDBXMLInfo dyn_m_systemreg_xml;

You don't need a new variable here, because a given cpu cannot be both a-profile and 
m-profile -- dyn_sysreg_xml can hold the xml for the current set of system registers.


> +    g_autoptr(GArray) regs = g_array_new(false, true, sizeof(const char *));
> +    /* 0 */ g_array_append_str_literal(regs, "msp");
> +    /* 1 */ g_array_append_str_literal(regs, "psp");
> +    /* 2 */ g_array_append_str_literal(regs, "primask");
> +    /* 3 */ g_array_append_str_literal(regs, is_main ? "basepri" : "");
> +    /* 4 */ g_array_append_str_literal(regs, is_main ? "faultmask" : "");
> +    /* 5 */ g_array_append_str_literal(regs, "control");
> +    /* 6 */ g_array_append_str_literal(regs, is_v8 ? "msplim" : "");
> +    /* 7 */ g_array_append_str_literal(regs, is_v8 ? "psplim" : "");

Can use NULL instead of ""?

Otherwise it looks plausible.


r~

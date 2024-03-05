Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp133135ejb;
        Tue, 5 Mar 2024 13:41:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUluHNEwo/oAVScGJwB0r8qwIcxZ3YcUAGOGcuzaalqbY2WQOi01QhGICNsUE9Q3nEPIFMPfprVLcn0Aqse1nfeOTwCaBgD
X-Google-Smtp-Source: AGHT+IHTSzM+mKfehUtP8HhUEbUW6s+MpSwDLhjyn6fl7LNI34eLIL7914OB6aAIki8rCBbgz/en
X-Received: by 2002:a81:8396:0:b0:607:910c:9cb3 with SMTP id t144-20020a818396000000b00607910c9cb3mr10900510ywf.36.1709674888667;
        Tue, 05 Mar 2024 13:41:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709674888; cv=none;
        d=google.com; s=arc-20160816;
        b=WYNf8RU7/xh4QHPryv1lxuJzHvzd8s0HNp8mVp37N354GbdKbTixXvOYG0klleEvV2
         iRHfnnOX6wEVeJdnXIrf9JAhQ17mlvAJBAgAWnOFbFkGZm7dd2RHOZF7j5ewFYR8clBn
         DUug8f2+NWfOCwCb0Uid7pB9SdQbxpYxaQWM4T/Mgu24pMBNOnKJyHvxvawy6i1KxjG+
         ObvicrMCNICQHxr8JAIFOE9UgHzJV6SHWlFKfzgHh1/JsXKhcbKsLM1YD6j+g1nNbWc3
         chvH9ADGXFprWBw7RpUEzwjWPUi2UIJejy6A8hkPATk7GfAJctKnJAIh3AC4qAH4zuEl
         gOWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ihNVgW41v527yiX4XLXfYOFmPJQT2nrCVR5N/Whf8M0=;
        fh=ocBJH9dXl5KFmHsaY99CTkTxAnG8VmtVHD76FVjFC6c=;
        b=DOrnR30rDIXe2YRxYCFI/e1GWdJWwkoySPNvHnb4arhV/K8eJLNV2FoPps7lurg4mh
         EOP6qTvM9eA9ifEXsfZrr013/AoEKK9Yd9BUotZpeDpL42i+2ZFF86lnqZoWWnm77Jwb
         4Om4m+cZmEdFIW+ClxBTieMa1aM+MifQRgmG9UPIGsDdfzNc3YHceiDMXD5wLfKFj+7k
         mholeISal+Azd5OuNfk99NJcxY1wHksm/VL+ZXgjmWi9Yca9ueR2ObhxHRN1f4HZtjeB
         VkuAiY06fwLnSzhP64txbELHo90sy6hqir5YFtEaDVkkKcVQn8M7bfbmyZVYjFTJUVYV
         aoKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Jd229FK/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t27-20020a05620a0b1b00b00788279159dasi5469519qkg.129.2024.03.05.13.41.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 13:41:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Jd229FK/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhcXD-0005yw-Uf; Tue, 05 Mar 2024 16:41:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rhcXD-0005xk-1h
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 16:41:15 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rhcXB-0004ZO-Bo
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 16:41:14 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1dc0e5b223eso53165205ad.1
 for <qemu-arm@nongnu.org>; Tue, 05 Mar 2024 13:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709674871; x=1710279671; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ihNVgW41v527yiX4XLXfYOFmPJQT2nrCVR5N/Whf8M0=;
 b=Jd229FK/UDUMKLijM/s1wpCRM6QV2iwNDIQQTsBomE5mE9Pacw55CzFzxNYDvP7gGl
 Nda5qTdeLhVqiHDK7NBp+kmpOR9whPUS7Iv6ehEH88xQAQbyoZZMcs/KaQWgienfE3Zk
 RHAL0A9y5v8nZZ0rlVJNvxnc/Fp3KorxtOz1xtbghAopq1pkEvAV+Z5WD9+M7+WR4r7b
 QCqubrC6unVUfXBSUthpdkKs6VT8J21zMH7MTIcnA50y9Si8Qd9F9PTmGjHMcAjTe+Ye
 a1othpiALsYxpLZ83oUObpciPN2epUgEZIfJkwvL4UpzMqW3Tq1VE0eNvxusO6q7TyfT
 QS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709674871; x=1710279671;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ihNVgW41v527yiX4XLXfYOFmPJQT2nrCVR5N/Whf8M0=;
 b=wsIGHhEa0mssBaCQpIugNIHHNdD8nnWESJujVEDzn81FKQckG2l7/7C4rOAxr/lPvi
 DZ35IRjEgDC2WoAOEbZgI5lRKUuUBs2tVGGYA2HC+bG4a9Oj/N6lUVnNrEQr3U1OE40z
 iRpzZj76K2k1oe6sXEEry1r9UL08IvzOgT75r265E0OMAkyWzSt/EjK84ANriaA5GieW
 XAz0JYnxw8CEWooyTkf3ySbMVREC9dnhAeBd83K4N/xIBEoJZdXLcfSwV8qZmT1C+ND+
 7VUhmLoLbMjlMQf/+dCqr04tys3zhGvPYZVb0B7RsWfskgh8RkGN2weQStbvracoTHBs
 hnqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMwcQBb9vcBkLb+i/94uWzUqKlVJgHdVtNmsBarleKZu/6Q6xwajhe6WwcZZsZ7Qr+6cxevuNbK2ZLAb9bhe5/LUoc
X-Gm-Message-State: AOJu0YylV9Rh0h5jdAjfv+cUIRRmmHDuFZ4vUA1HtxB6WN40Qjqaplfd
 10IHY3RjeIGBbxOhRySmhlV288dStrJ4NyDQqOp7lN9UXd/hxq28GRNENNSrrls=
X-Received: by 2002:a17:902:d58c:b0:1dc:d116:1a3a with SMTP id
 k12-20020a170902d58c00b001dcd1161a3amr3644720plh.62.1709674871560; 
 Tue, 05 Mar 2024 13:41:11 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 n4-20020a170902968400b001db8145a1a2sm11074557plp.274.2024.03.05.13.41.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 13:41:10 -0800 (PST)
Message-ID: <2f181e8a-2dc4-48cf-b304-2a961512897b@linaro.org>
Date: Tue, 5 Mar 2024 11:41:07 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 06/23] target/arm: Add support for Non-maskable
 Interrupt
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240305070331.2151131-1-ruanjinjie@huawei.com>
 <20240305070331.2151131-7-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240305070331.2151131-7-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
X-TUID: UbYjYU7eRKR8

On 3/4/24 21:03, Jinjie Ruan via wrote:
> This only implements the external delivery method via the GICv3.
> 
> Signed-off-by: Jinjie Ruan<ruanjinjie@huawei.com>
> ---
> v6:
> - env->cp15.hcr_el2 -> arm_hcr_el2_eff().
> - env->cp15.hcrx_el2 -> arm_hcrx_el2_eff().
> - Not include VF && VFNMI in CPU_INTERRUPT_VNMI.
> v4:
> - Accept NMI unconditionally for arm_cpu_has_work() but add comment.
> - Change from & to && for EXCP_IRQ or EXCP_FIQ.
> - Refator nmi mask in arm_excp_unmasked().
> - Also handle VNMI in arm_cpu_exec_interrupt() and arm_cpu_set_irq().
> - Rename virtual to Virtual.
> v3:
> - Not include CPU_INTERRUPT_NMI when FEAT_NMI not enabled
> - Add ARM_CPU_VNMI.
> - Refator nmi mask in arm_excp_unmasked().
> - Test SCTLR_ELx.NMI for ALLINT mask for NMI.
> ---
>   target/arm/cpu-qom.h   |  4 +-
>   target/arm/cpu.c       | 85 +++++++++++++++++++++++++++++++++++++++---
>   target/arm/cpu.h       |  4 ++
>   target/arm/helper.c    |  2 +
>   target/arm/internals.h |  9 +++++
>   5 files changed, 97 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

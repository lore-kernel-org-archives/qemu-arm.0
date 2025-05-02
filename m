Received: by 2002:a05:7022:6999:b0:9b:2b00:a62d with SMTP id cj25csp850402dlb;
        Fri, 2 May 2025 07:58:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUFKZk/gyIjeITW8I/PbIJAOW3iNtyk1KKyDsFHF56MsYsIlAdVy9CInzImwJRfUttFTuqmmVyRXM93tA==@linaro.org
X-Google-Smtp-Source: AGHT+IEOEUvHb16P5JuV5rOLWhdudWgVM/wY1232UY3BJhX5PHgTMo55If2ynBACJrT2FApqJ0Em
X-Received: by 2002:a05:6214:dcf:b0:6f4:cfb3:9df9 with SMTP id 6a1803df08f44-6f5155e8a98mr53719386d6.33.1746197925588;
        Fri, 02 May 2025 07:58:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746197925; cv=none;
        d=google.com; s=arc-20240605;
        b=YCS8qdfVrfC0ghOhaj+sSWsr+PFwQdQ90p+FWmhphLLw8QizT1N62T6XUpn1A/jK0Q
         RRkwytKtMuJEE1xhMN7M1FXBLUSfSVCzhZbwIZW7QJ6Q0JKVbP+2w/ZA1r1ZAMm+XT0a
         NgAvpff8Kqk3vnfVfXP3UAMD9MPZEeWnhKahguuNH6kthzrsyfjdpRM0XVyml2m76Ugq
         rNEG37cAUw79gizVzJkh+mCJ305AjkVW1RjqpbEig3EL+KFcIH+iaL4gLnh3LLMcTLJS
         UQu5wZ6HQiVxACaNUBd6S4ioOgxvzRyB70/YcpcG1rsJTnxmtC9w55RzggmExiZvjMTz
         k9ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=J8YzoanIk5Tc3h7ufmslO4S+l5crv4KBw80pyEGyvdo=;
        fh=H4WxTg3O9cfZ75huaDXy0iWwGoDFJxmjrvclBRAws5Q=;
        b=WTIEUmUtaYlRp3DWHqfkjXK7xpD1ahEizUSv2X1iAxrA7y3Ao3HtDAbj9Tofkg/FP8
         a/02dvdlMNbF8j7pRaTpmaPVisa1QpovilFo6gn2JgySyn1tfDA2leiUpv3SaK+SEQxv
         1mnBMqvw3g/d0PcPquMngwfupHkJuI4E+/eVj7fcUk+25SRJZO2j34FH6iSK0gEhKSHw
         6rcnO0J9GMc/9mW48akb1RlZYwCrodgUafysz9iKJiCrqhVgYNZcHnBzD/apqGnN60g3
         3xjyiK2BzuqTgW/AE7qeGkHGFBjT9fzjPIqjoqSiKpLcEjgMf1u5n4pnMTRpuNCLeo4u
         lV1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o831xw2e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f50f3a90f5si33441486d6.2.2025.05.02.07.58.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 May 2025 07:58:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o831xw2e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uArqQ-0003PK-VV; Fri, 02 May 2025 10:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uArqO-0003Od-Qp
 for qemu-arm@nongnu.org; Fri, 02 May 2025 10:58:28 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uArqM-0002ro-IT
 for qemu-arm@nongnu.org; Fri, 02 May 2025 10:58:28 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ac289147833so377027166b.2
 for <qemu-arm@nongnu.org>; Fri, 02 May 2025 07:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746197903; x=1746802703; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J8YzoanIk5Tc3h7ufmslO4S+l5crv4KBw80pyEGyvdo=;
 b=o831xw2e6pPYej0ygl1BmFFjbgIzKSuU5tENzQIDiCVOjCf50egyiXqno47QpKgj/t
 WExthDr4TGZp5Fh87otuiOqQfPFO278n7QUyUIXrHJfhAg2sFcPn/OiP+WW49zRUFwex
 PocRDHs30fBotErmrij+9B1nzxwNR4wCkM8IPqAiCfvtfvAA9AN9hyybAmyoe2ykffZv
 SqwiNZcEazWtzF4Om3Pn9mdydybxZoTJq4woo5UMUUSJD0m+LfDntk5IW8GJsNuqJOIG
 5CZ46ceNvrFBtzuKA+B3YUBrCbcshQP6Au25CYcvhSud1FYus3m0qPjjISgIMJJ0mYCX
 52MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746197903; x=1746802703;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J8YzoanIk5Tc3h7ufmslO4S+l5crv4KBw80pyEGyvdo=;
 b=Vbb8q/FNE94qFq1pgv3NSju3TT+NM0kVD+koT6s4WnXhqffgSjRJij2ivDxL37CXJ6
 rasJhZRxXrRRRIuUmuvfaBVm1YVIvGGepTBpIubx702523VQq3H9lqkjeTPXfZfw/xdZ
 gP5SVE2XaBT6cxUiKyKjWWnQWfVqzWJf+mwhHpbudsQOUDWLeJkaGFKh9PkGO/1d9F3w
 AufkVlYg7YPnElUhCknxyfZdXypS1298AUtsxnHxAauSTtvPwYmDTyAew5baIgKpocTu
 9v239CLEbveGryeEiWR/aEcrtq+SNz+vwQlS1mIa5n/QniA6WoPptdikyiLvfy5OecGf
 SXmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/alKEK0s51HM6qoiVExFLgZki17nLeko+ZTljWJfiizkxTWD7W6q3hfdUdLP8ullmf3ykx8TFcQ==@nongnu.org
X-Gm-Message-State: AOJu0YwNbYRKazGYg46ZnYtFD9dpaSHDyHNZYMyjlq9La1UA31mZWGh0
 scjPzQdc75GpdivdUnAF86yKkwoNg+NLkRBuKogVPc3Ua10Wlq+dqMQLDm/xYFo=
X-Gm-Gg: ASbGncvgdGoeC2G7P4zdJPl+ygtD7rNHJOI0Q1Ltq7BrRRZKGf5ls7ZfLWrjED+NK//
 jrGz0UYNAIGZIgH6v5gaMDv2EXeIRwES7wNJ0y7bdp0Ex0wffTUKuj+4FPmhVWTEjyrQDvR4y0W
 6a11YMi9eA6QzePiQ0McNRghFLQmWY3mir3eR2GJWzFsLE0PTIN6eZ5nEhfQQQ0R3ZNzXghRRYA
 ywBYQa74sLKguVlwrp8yGA59cBlnDrFG7JaZTcaTxDw5srIm/tF+n94JBweScGzg/WLyRpVzz7K
 pOitZ3kzsHaKh6N6U2w73MRgtWSSm5YLupYW6QNYwBW13OJ2RL1x0O6IgXUNlN2huubSHS0JYRm
 genMmYPLU
X-Received: by 2002:a17:907:9998:b0:acf:8d:bf9a with SMTP id
 a640c23a62f3a-ad17aefcb1fmr303274666b.47.1746197903199; 
 Fri, 02 May 2025 07:58:23 -0700 (PDT)
Received: from [192.168.69.244] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1895087f4sm59030966b.134.2025.05.02.07.58.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 May 2025 07:58:22 -0700 (PDT)
Message-ID: <c25fad27-df4b-4eba-9dff-217b0ca18941@linaro.org>
Date: Fri, 2 May 2025 16:58:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v2 00/13] hw/arm: Remove virt-2.6 up to virt-2.12
 machines
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>, Thomas Huth <thuth@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, qemu-arm@nongnu.org
References: <20250116145944.38028-1-philmd@linaro.org>
 <CAFEAcA_7KfbhMj4c=HD4m+xivTK4NZcYc0O4NXt6MtVJ6bSitA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_7KfbhMj4c=HD4m+xivTK4NZcYc0O4NXt6MtVJ6bSitA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
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
X-TUID: ZPp6XEfV9zKx

On 2/5/25 15:37, Peter Maydell wrote:
> On Thu, 16 Jan 2025 at 14:59, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> The versioned 'virt' machines up to 2.12 been marked as deprecated
>> two releases ago, and are older than 6 years, so according to our
>> support policy we can remove them. Remove associated dead code.
>>
>> Since v1:
>> - Corrected disallow_affinity_adjustment removal (Thomas)
>> - Do not modify docs/about/removed-features.rst (Thomas & Daniel)
>>
>> Philippe Mathieu-Daudé (13):
>>    hw/arm/virt: Remove deprecated virt-2.6 machine
>>    hw/arm/virt: Remove VirtMachineClass::no_pmu field
>>    hw/arm/virt: Remove VirtMachineClass::disallow_affinity_adjustment
>>    hw/arm/virt: Remove deprecated virt-2.7 machine
>>    hw/arm/virt: Remove VirtMachineClass::no_its field
>>    hw/arm/virt: Remove deprecated virt-2.8 machine
>>    hw/arm/virt: Remove VirtMachineClass::claim_edge_triggered_timers
>>      field
>>    hw/arm/virt: Remove deprecated virt-2.9 machine
>>    hw/arm/virt: Remove deprecated virt-2.10 machine
>>    hw/arm/virt: Remove deprecated virt-2.11 machine
>>    hw/arm/virt: Remove VirtMachineClass::smbios_old_sys_ver field
>>    hw/arm/virt: Remove deprecated virt-2.12 machine
>>    hw/arm/virt: Remove VirtMachineClass::no_highmem_ecam field
> 
> Applied to target-arm.next, thanks (with the tweak RTH points
> out to avoid a compilation failure in patch 3).

Thank you for tweaking :)

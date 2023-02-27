Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4959991ejc;
        Mon, 27 Feb 2023 11:27:22 -0800 (PST)
X-Google-Smtp-Source: AK7set/VcqBuk9QPqQ5/ewQyMPQi01rSEVmq5gz4KsDemGHIxH67grmqRA8hKG3ZjVQ8Uk/3IGCv
X-Received: by 2002:ad4:5f46:0:b0:572:636d:626a with SMTP id p6-20020ad45f46000000b00572636d626amr755590qvg.25.1677526042174;
        Mon, 27 Feb 2023 11:27:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677526042; cv=none;
        d=google.com; s=arc-20160816;
        b=r2C0OfmadS/UsHQTl0726g5wWEbYh0/0lKgKkZdX233kkzMvAm92Ddtq9Jfls0jzuN
         vFjlDlIHdOTkZ0UUlncKxq0r0+AxdWiD8qD2Zpf4OOOVrr4rTqWvFGGc+7LV+XN60yHC
         hEKICEX1bI20QgHIgEtzYblQ5fK7olM4LwiQrYOtt9Nq10IMCWu+562j5H0Bl2wRPmUn
         zN+0TA1gwlHwT/W6WydSjnZyCAFnHaT8iSZO2HMf0i5jnj0JV+YJKHl/W9Gth37xRF2+
         kEeBp//VpOXcSLVGPhLmy5PNPNIr/r5aUytDPG7e3zW9p+QJeFgbDI4Vm5kQX35Qdmdr
         Mi0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=qdFh2V6HSC2EckFK431m1XA1WOm4ejtC6mH3D4Snyzo=;
        b=greDyyduF/xIWFI/zmzd2Tbr5/+iclhpxbxqfhjTbhlbZdt/muHMccWGzkz+s78vjB
         717vd6z1CdBFk/z6wpCl3e1RCDIVJmj1IvRxNz5Ba1BGb1lIxlIlTf0K14aCjoh2IDY/
         zPaw/QNogg6HCVE2ODhf/rYDskIcfTfy8HQBqhBHyoIh5bWBOFwQIjNQVOEGyZrlIT1s
         TbU6cVO9A6hZ2cvZvrvK7NmKXsbrcfROKMpj8QxhknkaBvHxGXKdGN00KNeYKGZ+oIju
         Kx1NRhviRNQ0gcFit+aVOTs69XiWkXbgjCtslbi4xqrTizDyTWG5ehq8/TiBEJdjn60s
         cT5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O+Hl6IjA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l2-20020a0c9782000000b0056bf9633d57si7003405qvd.7.2023.02.27.11.27.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 11:27:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O+Hl6IjA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWj9B-0003Rn-Pw; Mon, 27 Feb 2023 14:26:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWj99-0003PX-9Q
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 14:26:52 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWj97-0002MO-EI
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 14:26:50 -0500
Received: by mail-pl1-x629.google.com with SMTP id i5so6191825pla.2
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 11:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qdFh2V6HSC2EckFK431m1XA1WOm4ejtC6mH3D4Snyzo=;
 b=O+Hl6IjA4/4z+AcwtfMVJ7ZC1wPBr/8pPs2eIzu9rp60w0hCPBFu8kOgAND7FhLEQP
 zX80nZge1jK2jgpw2Mqv5sJNLRRi+09Qdvn651hDX6S8Ofv3Z7Cq3OO9qnIwCjCNGWI8
 QskV7DmPU8eI3lI8mWrE5+lU6CdqE2ttKY7Iv49TICTinwmd3xJK1oKb+lWrWcZblwM1
 DllXHntxIabb+D4ltb0gfc2/WSpRgT4mmiVJlSiAdt1IPEnSfwAxFIAJTxN3anjrOrI2
 eUidT8MqyaMoIweEWl1MriA63D5NwmMB4o2kLiYZUUFABv9T/mYshIL1gTfD/alTKy69
 0pMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qdFh2V6HSC2EckFK431m1XA1WOm4ejtC6mH3D4Snyzo=;
 b=od1uydAZNL/42deCx1vsoTDWFdKMWbgZLwHQW75+3Fhfv1cMnAYBGFpb62gLkQgWu7
 R68DDQJcggFdXtcWCXx+J9Or512W4BJILjYccOGwu6psuXcNWKfh3JlU89h26w8sRe/n
 tAG3nJRN38HNwLbHDAwopgypBY6nu+5ir0AqxNS0lafx9e27FXe2Xf8DMg6q7tF678lx
 U++CktghzOscAGKiwPFGQESEvKlGA9GA78X1HigJ2D+fLJuSy8Cv4B4Qh5w8cMtwPEwr
 VFX5zRFoEbpExW6T03gP3jLNLm5Z4nrGPUq31I05jp3TyVE02sB5Uw+jq2eNUuddLAUz
 0kkA==
X-Gm-Message-State: AO0yUKVfwj8PFOxaxonNDb/cSppjh3TuB313QOXSnzUnNN0rrkt2S8eX
 Q6Iv4gibTfcFdGt/ZDKSJwbBfQ==
X-Received: by 2002:a17:902:d2cb:b0:19c:df25:53cc with SMTP id
 n11-20020a170902d2cb00b0019cdf2553ccmr513714plc.22.1677526007721; 
 Mon, 27 Feb 2023 11:26:47 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 y9-20020a1709027c8900b00186a2274382sm4943673pll.76.2023.02.27.11.26.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 11:26:47 -0800 (PST)
Message-ID: <dd842c9d-4e01-d256-70d2-892818cb133a@linaro.org>
Date: Mon, 27 Feb 2023 09:26:43 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 5/5] arm/virt: provide virtualization extensions to
 the guest
Content-Language: en-US
To: Miguel Luis <miguel.luis@oracle.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>,
 Andrew Jones <drjones@redhat.com>, Marc Zyngier <maz@kernel.org>
References: <20230227163718.62003-1-miguel.luis@oracle.com>
 <20230227163718.62003-6-miguel.luis@oracle.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230227163718.62003-6-miguel.luis@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
X-TUID: MB57Mwsw6Y8h

On 2/27/23 06:37, Miguel Luis wrote:
> -    if (vms->virt && (kvm_enabled() || hvf_enabled())) {
> +    if (vms->virt && (kvm_enabled() || hvf_enabled())
> +        && !kvm_arm_el2_supported()) {

The ordering of the tests isn't right -- shouldn't test kvm_arm_* for hvf.

     virt && ((kvm && !kvm_el2) || hvf)


r~

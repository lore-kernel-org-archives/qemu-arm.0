Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2465039ejc;
        Tue, 17 Jan 2023 07:21:36 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvPh0nH2ORjAGM0olkCszc1+GN2VZT758hyo3EirqlwWwSA4BhtzASE1hRtcaKndZ4DFGXA
X-Received: by 2002:a05:622a:50a5:b0:3a7:e467:b39e with SMTP id fp37-20020a05622a50a500b003a7e467b39emr34128002qtb.65.1673968896504;
        Tue, 17 Jan 2023 07:21:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673968896; cv=none;
        d=google.com; s=arc-20160816;
        b=QHxHjdBzzTMIgzXZdzzciB5vSm+UTs7PbYQF54KV1t3qZqh1izB28TITInZVE52ul6
         RZ9Ns5+6qn06m/VT9X/ULuL2GBHFyF0nswc77PWgW6ds5fXofW/BwYN6kD3rghnQBfJQ
         SI+WsNHi+8//fVjri7fJv3YZsBqkUHHVkKVpDrbcUrvKcFsNEIySbpPOBJ+MGkP58Bwp
         b+FYiNeUq6EFAMu4MOGSz54obf2KgxhVMEkPz/vjWx0gw+YsU+PRlhWbpFZOr6ERpQeh
         5i8MVmhx4NpD7y4k/b+GSTIro+W5i1EWoISWjwqzvSscvqOBqGZBVlt7WWZHuzS5UAAw
         mz1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=badnb5btSkc08gD2NjJ/S/AfZNygbSTl3aGz4IrLDGs=;
        b=WK3UyPo9t7RXSCbRLREfWBnUs63Sl4uzG4aCHJvVcXexsoC82/WbYZ0t8NwWMr9mWs
         Xn5b+qWV8lwrfvYaYkBndLLikStgDNK2/sJC/c8oxbrt3leG8FADWqDj1XSr/ep1BWa+
         jHwrZInJR6RNzoEpa8B/fiaAMBN1hlxxeWx9Fsg9SZPiPcOMPUUbJN5B1Dr1VuGbtUQx
         xDRnkko8c87xwE6lffJ/q/cDcdcMSRe6zvJCmLVwjHiWJsZ4FqTAiB9NDATPndy3i0CU
         tAHPHJjhO1cSsCVKVs5PUvZVrmFBeOxUc8IrmgHQasrl0jpmkL73YDbTPS4CGmMz1hCF
         K8Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PiS0yf7a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z23-20020ac81017000000b003a7e5493305si18165254qti.356.2023.01.17.07.21.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 07:21:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PiS0yf7a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHnlj-0006mE-Iv; Tue, 17 Jan 2023 10:20:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHnli-0006ll-FQ
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 10:20:58 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHnlg-0003Qz-JT
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 10:20:57 -0500
Received: by mail-pf1-x42e.google.com with SMTP id 20so18309829pfu.13
 for <qemu-arm@nongnu.org>; Tue, 17 Jan 2023 07:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=badnb5btSkc08gD2NjJ/S/AfZNygbSTl3aGz4IrLDGs=;
 b=PiS0yf7akIlF3oRcD2QlNHGXVgITVmkCwnKX/tWLkbX8Vb1w07KNm98zp3B5ezsw9+
 wWM7qdtWWRVQU+NgvSPXCm7so0rUJZGhVJsTT3CaWuV5x8TrCdf23ThUJsezwgacbKXA
 bTv8gfqFFDwLc6G6UISCPOw65b89MAQ1PhknjF27HZIj9/AXGAzfCK05aCjV+0MVEL8i
 9np5Opekl6sCNL9udb648TIh25w3QbqD6F55Q6yurCJrWn1CoztY5pJAe2z+ZdTOCV8H
 R9P5WYYaecyIT8JZaC2wPWXgPbEbb+3jCSdHpgvvQ5YVS0DDR3KFbVhQ4dW3vDlFbLJT
 kRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=badnb5btSkc08gD2NjJ/S/AfZNygbSTl3aGz4IrLDGs=;
 b=aYhYLgc/qx/Eh2HJFz2otL1ctDNv/QWYHzr/orYHfNc676ZuLlEnlaVsgqf79xiPnT
 THkUSb2R1GSFMO+5CEBfhRI6BNsUv+sRdCxoVkTEdyxDDxghpPKOjRcWFleFAB+wyF9D
 2e6+2PsYdfO8S9kuZJPV9WGHbXL8SWHjrp05ZGfdgUKVyIxecSegeasUAyUDLSTgRka9
 ITsyySCf0u7/PVrd7htAD7ZwXxq73JhfxOEbuiw4QP0QTXil5JSEjuOf2Gz/5dWrbH+1
 0/dNrrHaFYX0aWDavRa2S/rAWB9urOr1FsIw7B2XeGXLLN+4UQoQzERnx/OEVaBJfk4X
 0ziQ==
X-Gm-Message-State: AFqh2ko1kg7aSZooc51IFCdnBwmB+RBEJ82zJgNUQGqFVvDgbC33wRy9
 TFIq4LeljMF5Z7jtuTe/D+AChg==
X-Received: by 2002:aa7:8f89:0:b0:58b:bce2:7eb7 with SMTP id
 t9-20020aa78f89000000b0058bbce27eb7mr15760652pfs.10.1673968854709; 
 Tue, 17 Jan 2023 07:20:54 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 132-20020a62198a000000b00575caf8478dsm20232033pfz.41.2023.01.17.07.20.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 07:20:54 -0800 (PST)
Message-ID: <d81b10b3-e5b7-9026-ee42-d3564180f0ca@linaro.org>
Date: Tue, 17 Jan 2023 05:20:49 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/2] target/arm: Look up ARMCPRegInfo at runtime
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230106194451.1213153-1-richard.henderson@linaro.org>
 <4db4ccba-1985-f1b2-6c5a-615b865ba749@linaro.org>
 <CAFEAcA-4dUF8MySqFxFdrHFF+Jjw+wZo9mp6uNuHqumssKX_Aw@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-4dUF8MySqFxFdrHFF+Jjw+wZo9mp6uNuHqumssKX_Aw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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
X-TUID: L+uwQrsvT2qI

On 1/17/23 00:28, Peter Maydell wrote:
> On Mon, 16 Jan 2023 at 20:16, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Ping.
> 
> What did you think of my suggestion in the other thread of hashing
> the info we need to determine the cpreg set (ID regs, feature flags,
> etc) and using that to look up whether we've already created a
> cpreg hashtable for this config? If we did that, we could refcount
> the cpreg hashtable and only free it when all CPUs are done with
> it, which would mean we don't need this indirection.

I thought it a decent idea, but not small.

While we currently have a struct for some isar regs, we'd want a larger struct containing 
every bit of info that wants hashing.  I think it would take 40-50 patches to get all of 
the properties etc moved out of ARMCPU and CPUARMState.

Anyway, I didn't want to leave the user-only thread leak blocked in the meantime.


r~


Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp613615ejj;
        Thu, 23 Nov 2023 11:15:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvq1FR2+r21KjwDUBfIW4a6FnrwO0tu/q05XZx8l8WLzG7pAMntMgDLs6BVApvjoCY48jn
X-Received: by 2002:ad4:4d86:0:b0:67a:fde:271a with SMTP id cv6-20020ad44d86000000b0067a0fde271amr503573qvb.40.1700766913752;
        Thu, 23 Nov 2023 11:15:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700766913; cv=none;
        d=google.com; s=arc-20160816;
        b=zlsixMOfQi+ks9854hkuesddmASX7LYAiY7kcmmvfRiicjDhgCe02HIsuWCogv63eU
         G0wcRG8lhXedhXMKdn6G9ZWTmC0bt6DrXM1aoVlIdaPOtQ6ZjFFpb0rvuJsJb20GIFle
         fEj0SvYOFM6VjmEfR6CyhcBrTg1evcI4YGnS3NJu4ZNq1kmG8KOcvR/3Dxem/NUlvt0p
         MQr6fqmONPcEE7ynSuuWBAcPQo7vKzgB+gXNrebpUvkVRe7h3q34ZAL1nJ4XWFL7Yg5s
         3efQ3Uz9mIxxIj3RzAYhtPZ+SVaRyoynh9dXMNSOZoIGa8d7qYbrUdvFejUxxaKr3cr+
         6AIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=yAnPvEHxfnwIrQ4YjZXX0tgE5jPkVwCpov/iR2R1Eg0=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=sOIGtKeIe/hDh+ajgEZpdgQvLEIm6E3ixbQmrHH+OgkCTQkR/DwBFoxJa60xTEbOqZ
         Q36BmM/EFG7RC1/DL4pVw7YQcMDkTM4dJlu3uGHhXwNyK3PvDQvti9wNEmvT3IXzwpxI
         Bk1fuMmrM7u3MLtPltt4prhnaQHxnrzI2BR2prlP7bykz4mNT/aDHlUcsF80Fd9IiBjk
         yB8h0B8RppSQXivR/kELwm+jpIXBePfoIWKuc2J+kSzOLnpXR387MUFTGQfP85hqU1G8
         qg/Ga1UQPCHLD5P4rSvMH4QrQDK5vHDDwLJhQkqG+jl2TV/aajnkM6oFzRjJXwzxM+PS
         LOww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FNlH4TkC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j7-20020a0cc347000000b006582d848419si1720911qvi.246.2023.11.23.11.15.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Nov 2023 11:15:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FNlH4TkC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r6FAF-00081o-P6; Thu, 23 Nov 2023 14:15:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6FAD-000819-Ds
 for qemu-arm@nongnu.org; Thu, 23 Nov 2023 14:15:01 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6FAB-0002kI-CB
 for qemu-arm@nongnu.org; Thu, 23 Nov 2023 14:15:00 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4079ed65582so7818375e9.1
 for <qemu-arm@nongnu.org>; Thu, 23 Nov 2023 11:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700766896; x=1701371696; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yAnPvEHxfnwIrQ4YjZXX0tgE5jPkVwCpov/iR2R1Eg0=;
 b=FNlH4TkCH/g7DlATiNIjuBQDYiYkDGiwibXCJysfUANbHXtQxdj0/YeF7LOOsveSs6
 acuNXQ4/RcKxE+d6CK2Y9WuFO0RM28XXH94TG90dLJI3sHEtJnT+Uy26mgKB9mY6T0gY
 cv1+bCxzC7W0EQFZrAMmX/nA9U1wh1B7oACsrKr2cwWMLmadmIfPOk1jIpvO8wwgytJo
 8PKzb9C/Kq/beJRorlZkzBPrOYWUjVVkAND6tLSFQwPYY5oN8d9QZ8R+a02hDcTK6z+s
 xXKG0/VUAtfMJ9DhmZEz1aog9n+VT9zyxVoQbLcw5Iaew1o0zgpGd4CQc79N1rnBn3JH
 sKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700766896; x=1701371696;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yAnPvEHxfnwIrQ4YjZXX0tgE5jPkVwCpov/iR2R1Eg0=;
 b=hjZ0ppZNWKkqX/xS7WHvsN5sSzNhpMjAOy0g5GMeOKv12Yel7Xh37vSL0d6HZ5bW8M
 jTMeQ63O0dVDchtihLXqhnCaHkQdj+aAz8RDexisU8hc5LHgcATRlJ9TbY2aeQxs2rB1
 oGMphQ0zuOTR1+Pw9EtzG3MiXIdcMBhojCVQMkfCkAEa8urnmX/WP5rA72X+OcHvCtsv
 NhF8GZRrjRWkgbD0N1WrubsZ6F4yv/auEEWeNCX9OrFwDDA2xewr8msFEJlfLoto2e/I
 /zMgOjNAo+2gVQLS4cp/7XdPnPFIPbB+QxRH26THOHYoFdJrFwmkTwQ/MdQePaR5e8vM
 H7sw==
X-Gm-Message-State: AOJu0Yz8sOAmBrNuLt29SKEi6/5zgYdVkWuTMkAzBz2Mybpn3B8iqV/B
 9mQuOkmR1UqnP3/OBH4lO97EyVqZzZUn9i+kUH8=
X-Received: by 2002:a05:600c:4690:b0:406:872d:7725 with SMTP id
 p16-20020a05600c469000b00406872d7725mr427029wmo.1.1700766896336; 
 Thu, 23 Nov 2023 11:14:56 -0800 (PST)
Received: from [192.168.69.100] ([176.176.165.237])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c3b8800b0040b398f0585sm330965wms.9.2023.11.23.11.14.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 11:14:55 -0800 (PST)
Message-ID: <00133b79-fd3b-4b5c-96a5-55e94de0bf46@linaro.org>
Date: Thu, 23 Nov 2023 20:14:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.0 00/21] target/arm: kvm cleanups
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <cb8808dd-00bd-4569-be15-9d8f2e20b1f1@linaro.org>
In-Reply-To: <cb8808dd-00bd-4569-be15-9d8f2e20b1f1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6mCX5Wea/2Vv

On 23/11/23 18:40, Philippe Mathieu-Daudé wrote:
> On 23/11/23 05:41, Richard Henderson wrote:
>> This is primarily concerned with merging kvm64.c with kvm.c
>> and then unexporting everything that is not required outside.
> 
> 
>>   target/arm/kvm_arm.h   |  203 ------
> 
> Unrelated to this series goal, but I notice half of the API takes
> CPUState, the other ARMCPU...
> 
> $ git grep -F 'CPUState *' target/arm/kvm_arm.h | wc -l
>        16
> $ git grep -F 'ARMCPU *' target/arm/kvm_arm.h | wc -l
>        14
> 
> Since this is ARM specific, I'd expect it always take ARMCPU, and
> call the generic KVM API casting with the CPU() macro.

API clarification done here:
https://lore.kernel.org/qemu-devel/20231123183518.64569-1-philmd@linaro.org/

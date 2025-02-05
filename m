Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1151828njb;
        Wed, 5 Feb 2025 12:59:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV4Sk6HqZ+p+RZRFcJklw15D+41ucYR31dTMXoLBm9TBkxqhJlol9quDTqe01xVvVjGsyUYldTcNhsWjQ==@linaro.org
X-Google-Smtp-Source: AGHT+IELSNkQLVWSv2mEakxSbh4SDPJgZu+5ysc/iVl66N90oIjKOwqyNo/beWFK6Q4oRugTj4BU
X-Received: by 2002:a05:620a:2944:b0:7b6:6e7c:8efc with SMTP id af79cd13be357-7c03a02f102mr511777085a.44.1738789149626;
        Wed, 05 Feb 2025 12:59:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738789149; cv=none;
        d=google.com; s=arc-20240605;
        b=Fga8iZck+Kg8Wx/AOalT0Xa3cZs+fc34pH9YGOJ//9pzfCqxJz6NZm/hATy0Hj0nny
         ySuks27OUM8gJ0ofsV7MiHHTKFWRUUuYZYEcL5j3x2QvbEGd19vXANF5ZvJjuX3ckOqC
         OVeWQreUWkq01xDDaYIdB2+hr9TgmZb/ZPHUaAkblWEYYgfp8K8QgLbt78En5V8m4T7D
         qWLazuaEtJfF+5Y7YQq9PLr50aVRvJc+vKjLnyC8vOrtK51iZI6/iEWEdEF3sJeR9fwO
         LBRV3Fnsas66DTRFEbJDbegDn5spRw86k1eIA3JyO/O4NWZx10XvNw4VIqdxVaTtpwWc
         N7Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TLm2ppVsFo2/1libVsce/JP0/uSNGilp75aSCiyo5hM=;
        fh=YZ2k344dMlciZMlqI/PoXAGsrjTxh13+7mNnxt2zsLI=;
        b=kFWbRJAHm1Xu8E6AYv/88i+t2+qgPWyKtJNmL/j2tVKA+TDY4NDGjV5Jh6Y/azdQrD
         3KDSSI4u0HbI3ca5tZYhwNa28g0zM1pbnC85a9jKFbmju0OxmYuJgjLrFPyF5uq0OxDe
         0CSY+0CTmOwOoUdfbWkwIkKqmDrp89AkG3et27kEsHcCQVaTNnUqwMpSH8Q1D1JoU6Rq
         EqrcKDr/7x5cC28BxBfxiLC/yBDTc/ILK8m630dK8nSZG3ULknNwFjL7EXTfMRPKo+iV
         hzAAiCYYbMyMoF/Kx5eZ4hv+BrYY57gYOmmUlEmG9s9RawFoXm5RkuP2aw0LCAZJIgv2
         ndFA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fYLwN854;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47016bd074asi62113741cf.482.2025.02.05.12.59.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2025 12:59:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fYLwN854;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tfmTt-0003xC-Vk; Wed, 05 Feb 2025 15:58:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfmTp-0003wg-Md
 for qemu-devel@nongnu.org; Wed, 05 Feb 2025 15:58:42 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfmTm-0001zX-S2
 for qemu-devel@nongnu.org; Wed, 05 Feb 2025 15:58:40 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso1243135e9.2
 for <qemu-devel@nongnu.org>; Wed, 05 Feb 2025 12:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738789117; x=1739393917; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TLm2ppVsFo2/1libVsce/JP0/uSNGilp75aSCiyo5hM=;
 b=fYLwN8544i/NKf3hamPZXVZElUAbF7eUTB3ZSzkbHhHRtc0FBcfegN3AvEoNdGRgsB
 3jaUoF/rio21ealGJUyycXn8FZiniGfL19NsxheHwL/Ulj9PfiB4/oHUfepba9BOhXQP
 j3wFZK9AuWNkEhun/puO7YrpFeWz4qRb2cIWMAfWVc8pUQUtFdyxEw1iANuFH0y7zYOr
 9rcnfNC7L9pE7YHfYK2mLZE1X8qNoHzT7RtrYMDxIFTbY4omR+/FlN/WTcfMesMoIlyz
 tAdD3iPo6+NxBkT1XmIlT3H4QpkCAZK6ibV5L7Z6GaLzA7AloHw8hlNi/YqoppJNAci1
 ohsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738789117; x=1739393917;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TLm2ppVsFo2/1libVsce/JP0/uSNGilp75aSCiyo5hM=;
 b=uBds8/WdZNSl9qN0NTYFdjo7UJ6ztrwPuN9tqEcRZ2OOJNFXbZKUwHPv9DBoAe82iI
 iEQeizBfunOUkLzoheOclWhpd45q49CIpp6ow/XoWInZYmZQA/Tz3BQBiEjrPIxFEUk7
 1dULkvP2cbNhyYl13EIt/YFv9vXUx6Oh5eYA3p/Q9a72TcGpn7A/6FBjjzwyjB8TgPiU
 Cxp3caYSwQExHDDJvqlr7GTZPJ/QOwmHlVmR1H9qXRdqt/Ia/3WJ08/MTxRKp7tYf50V
 5SQSopG8HZzl6JhP1azV7Tf6UXfalNFiNvpXKozMViU4v+QOmCTB6BPH7hiQlWgoE4xQ
 K8sQ==
X-Gm-Message-State: AOJu0YyTvm+g9WpgPBE3GoiUyk9H8yJnwqpYw7kxDRBt4XjByIypMt8w
 5y6hQCNR3sbEbSjX8lzpN2bkM0vRC2xWwQBJ+9PlBvNnicHh/d2cn++Y+N4uotU=
X-Gm-Gg: ASbGnctD09hKSYhRmIpeaNFNnsAPeuhCa4APo0TGC/CaQixiTVZUs4u/b2PIzA4Mjf3
 Azl+RaCozL5Pgz7D5LsauKUcAXybs5Pc3CJgnf5jVhte4DG5USX7XscAcvkWTwQXGyNJ8lFn6io
 Vc9mVcSVjrHl7AmoObusTcd4QLFqv3C/8R8ZaGr6zpTFuG1B06emARgT1HYa8NLE7BPemwmgZmN
 qTUFsa+eR8T+zruSR4ynMXCPWZPynkI1aC3qVJF90s3Ncd9zPVxbBaXTiitnFV1z7ng5kuawWPz
 +4SqY66AzaMArgkLGWMVQlVrzF7I5VVZLGcJnQ7p7xFAljaJviK5PT05OCM=
X-Received: by 2002:a05:6000:1a8b:b0:38c:5d42:1529 with SMTP id
 ffacd0b85a97d-38db491fa85mr2879708f8f.36.1738789116601; 
 Wed, 05 Feb 2025 12:58:36 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dae1a1e4bsm5556090f8f.55.2025.02.05.12.58.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 12:58:36 -0800 (PST)
Message-ID: <efbf797d-b426-4c33-aba6-e463880ae667@linaro.org>
Date: Wed, 5 Feb 2025 21:58:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] i386/hvf: Don't send signal to thread when kicking
To: Phil Dennis-Jordan <phil@philjordan.eu>,
 Roman Bolshakov <rbolshakov@ddn.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Cameron Esfahani <dirty@apple.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20241209203629.74436-1-phil@philjordan.eu>
 <20241209203629.74436-4-phil@philjordan.eu>
 <c401b320-b382-4887-82bc-0252dd9f8c98@linaro.org>
 <0aa33648-5a30-4302-bf7a-f31cab0b327e@ddn.com>
 <CAAibmn0zwbsniR2bLcvhqTuTdPZTRkQPDv9v9==gyMpPNELLLA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAAibmn0zwbsniR2bLcvhqTuTdPZTRkQPDv9v9==gyMpPNELLLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cXeFcTJ8PXRx

On 10/12/24 10:52, Phil Dennis-Jordan wrote:
> 
> 
> On Tue 10. Dec 2024 at 10:21, Roman Bolshakov <rbolshakov@ddn.com 
> <mailto:rbolshakov@ddn.com>> wrote:
> 
>     On 10.12.2024 04:22, Philippe Mathieu-Daudé wrote:
>      > On 9/12/24 21:36, phil@philjordan.eu <mailto:phil@philjordan.eu>
>     wrote:
>      >> From: Phil Dennis-Jordan <phil@philjordan.eu
>     <mailto:phil@philjordan.eu>>
>      >>
>      >> This seems to be entirely superfluous and is costly enough to
>     show up in
>      >
>      > So the pthread_kill(cpu->thread, SIG_IPI) is entirely superfluous?
>      >
>      >> profiling. hv_vcpu_interrupt() has been demonstrated to very
>     reliably
>      >> cause VM exits - even if the target vCPU isn't even running, it will
>      >> immediately exit on entry.
>      >>
>      >> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu
>     <mailto:phil@philjordan.eu>>
>      >> ---
>      >>   target/i386/hvf/hvf.c | 2 +-
>      >>   1 file changed, 1 insertion(+), 1 deletion(-)
>      >>
>      >> diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
>      >> index 3b6ee79fb2..936c31dbdd 100644
>      >> --- a/target/i386/hvf/hvf.c
>      >> +++ b/target/i386/hvf/hvf.c
>      >> @@ -214,7 +214,7 @@ static inline bool
>      >> apic_bus_freq_is_known(CPUX86State *env)
>      >>     void hvf_kick_vcpu_thread(CPUState *cpu)
>      >>   {
>      >> -    cpus_kick_thread(cpu);
>      >> +    cpu->thread_kicked = true;
>      >>       hv_vcpu_interrupt(&cpu->accel->fd, 1);
>      >>   }
>      >
>     SIG_IPI is macOS crutch handled in XNU kernel that was essential until
>     Phil submitted proper kick support with hv_vcpu_interrupt().
> 
> Ah yes, perhaps it allowed exit from hv_vcpu_run(). hv_vcpu_run_until() 
> definitely does not exit early upon receiving SIG_IPI (USR1).

Maybe worth explaining and mentioning commit bf9bf2306cc ("i386/hvf:
In kick_vcpu use hv_vcpu_interrupt to force exit") in this patch
description?

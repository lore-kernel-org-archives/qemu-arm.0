Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2019723lfb;
        Thu, 26 Nov 2020 20:41:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKWx6+lQqHlTF1Fhu1U1kWuuhi3S8qgRkqN2Mvgj1UgAwHQV8PljiaythRwi74lIYh/ovj
X-Received: by 2002:a25:c74b:: with SMTP id w72mr10139200ybe.117.1606452108788;
        Thu, 26 Nov 2020 20:41:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606452108; cv=none;
        d=google.com; s=arc-20160816;
        b=eg5O7Nr48TMB8DqmygDgrA8IDtIrBqwChcGoypQhfm8j6oaOE9/aUi4+Pg37+lWgHZ
         ea8Stb+1l2lA9G2QjWKxAtOHk0B+uuu43Xu4YQbbj5N1kRRDBoKtS+tzKMQTIYN7C3tM
         0sM0VrU1bnjC8jqje2fQKr4AFzUm45i48UNiSsxEJcdVgis5KIhXt7Oj4JAyQAidFDpE
         ND6uNbwnPQRh9IhmtM9qilHN5FNYlLfngBsbB529LZDJkBhCQK6srNrSfvCbTCeF9ELm
         2whS8UQfB1Dqke98Fm9NiThval9Hf8YV2nkpmmC7MnM+QZAklbLWXGfdGQrqlRHr175A
         9vgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ZWCVFj85jqTfSDrscs3XCmi2JSwu/JGyt5L41/MZHOU=;
        b=E+KuB5Ie/j3cPgVXNEAXUgBFCNfqXup9Wk0/LMtuHeCnAlSN/QrgyBYog5qPrPWGe2
         awrcy8OSdtn+VN8HAfa8mJzdAsaTCCHkRYnOEZly4mnG7ItF7TCODn9BxEWtlUJkfcny
         Hrx7efi7HH0Zg2kLAwX+QQaZ/MfCB8kJ7TcYZFs5dKrJaCooolS4b3ujVffN/ZH2LOjV
         NPdOby3jN+2sAYOepJrGTcD47tP8y5CqSvPOkw1z4N/LU/mvDysyB72aDUfYesJFC/1Q
         UY6aQUY2iNjOlwg1OYtvb0u1CHOMsd8kXbe+j44ASUfbwKkxQ2jH7Ac0ZEL2UNVF4LhQ
         x5cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GYwf91wW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i205si7140464ybi.17.2020.11.26.20.41.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Nov 2020 20:41:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GYwf91wW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiVZs-0003rx-56
	for alex.bennee@linaro.org; Thu, 26 Nov 2020 23:41:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiVZk-0003rY-AH
 for qemu-arm@nongnu.org; Thu, 26 Nov 2020 23:41:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiVZi-0001C5-NL
 for qemu-arm@nongnu.org; Thu, 26 Nov 2020 23:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606452097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZWCVFj85jqTfSDrscs3XCmi2JSwu/JGyt5L41/MZHOU=;
 b=GYwf91wWUNzaMbaaqq73D45xcnUkyjljDYcjX+DZ5Qvxb7inRPMspcUdkZY/8CCAvivLyh
 ZgRTOB3mNNHlNK+15V5p0xf9o+lTX6wQFhewj/BUQnVRsCICllIYv4dMnzdaburxm7BMDD
 rBn/nWiTjP8+NUzWngeOKIdFMmZnTyU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-mfUTkemVM7OotXbKRtTEwA-1; Thu, 26 Nov 2020 23:41:36 -0500
X-MC-Unique: mfUTkemVM7OotXbKRtTEwA-1
Received: by mail-ed1-f70.google.com with SMTP id i89so1964087edd.15
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2020 20:41:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZWCVFj85jqTfSDrscs3XCmi2JSwu/JGyt5L41/MZHOU=;
 b=lKqbr95JYutMoEhLyu6u+fvtt+vY0J8Gb/jtyqChUt1rVJ+H9IQmu76YqY0RswtsGF
 Qk2enxrxg0WwIyZw4MdvDIIogKoHMEWpkY4X0OqRBxRYBdaKbs95mu1J2naKZjXWD8Ni
 ubdiBtK7DUZUBrjG+Say6Jjr4iA3T/1X6SaW6v5mUmPDlI0fRb4kZgvzhdO6jL7A3yRY
 vXDkMg9rpK7pWNY7y2cIJMXPCA5FY7wz9dRLwABst/UQtqg52ay9HKkIIlR3ITu0zgQ+
 Du7fRfoIeHbsuMFBpE2NuJ/gO9AfSr2QvICFg86uHRd6CoE6ghAYMFJwEjjVDUAq2Utm
 8crA==
X-Gm-Message-State: AOAM533+uD44m/zh/qZ8mdyNzFpKux701o/oqR+DgFRDfSMkHG7TJGI+
 EWtSWEV5vreJbQS28fUlx63NVudNv0Xp0OFsJi33RMYqARn980oOvSdTXg6h+l3wMq7A9eoyYGv
 DlJDr/62lC6aq
X-Received: by 2002:aa7:c058:: with SMTP id k24mr5694976edo.263.1606452094799; 
 Thu, 26 Nov 2020 20:41:34 -0800 (PST)
X-Received: by 2002:aa7:c058:: with SMTP id k24mr5694961edo.263.1606452094517; 
 Thu, 26 Nov 2020 20:41:34 -0800 (PST)
Received: from [192.168.10.118] ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id h22sm4213231ejt.21.2020.11.26.20.41.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2020 20:41:33 -0800 (PST)
Subject: Re: [PATCH 4/8] arm: Synchronize CPU on PSCI on
To: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>
References: <20201126213600.40654-1-agraf@csgraf.de>
 <20201126213600.40654-5-agraf@csgraf.de>
 <CAFEAcA_XZu07Fg3G05VWYDYTJfMSAzOH5yyd=rFLJVa73juDtw@mail.gmail.com>
 <785c216b-d4b5-b65f-1ddf-4c6374b72ece@csgraf.de>
 <CAFEAcA9QUfBQpmH=8_A+xDm53GkkOgFEDnkTDXOX_1A-bFg0Ng@mail.gmail.com>
 <284d0cd2-268b-b937-3a6e-d074ce28baee@csgraf.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3594db71-c72f-2946-ffa5-47da737900c6@redhat.com>
Date: Fri, 27 Nov 2020 05:41:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <284d0cd2-268b-b937-3a6e-d074ce28baee@csgraf.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tHqy9msYQDIo

On 27/11/20 00:32, Alexander Graf wrote:
> 
> On 26.11.20 23:26, Peter Maydell wrote:
>> On Thu, 26 Nov 2020 at 22:16, Alexander Graf <agraf@csgraf.de> wrote:
>>> cpu_synchronize_state() sets the CPU registers into "dirty" state which
>>> means that env now holds the current copy. On the next entry, we then
>>> sync them back into HVF.
>>>
>>> Without the cpu_synchronize_state() call, HVF never knows that the CPU
>>> state is actually dirty. I guess it could as well live in cpu_reset()
>>> somewhere, but we have to get the state switched over to dirty one way
>>> or another.
>>>
>>> One interesting thing to note here is that the CPU actually comes up in
>>> "dirty" after init. But init is done on realization already. I'm not
>>> sure why we lose the dirty state in between that and the reset.
>> Yeah, it sounds like you need to figure out where the dirty
>> to not-dirty transitions ought to be happening rather than
>> just fudging things here...
> 
> 
> When init is complete (system is ready to launch), the CPU state is 
> pushed to HVF and dirty is set to false. So by design, a normal 
> cpu_reset doesn't have vcpu_dirty set.
> 
> How about this patch instead?
> 
> Alex
> 
> 
> 
> commit 8c61bc4d613b01e251b6b2f892d1a55a333c6e37
> Author: Alexander Graf <agraf@csgraf.de>
> Date:   Thu Nov 26 02:47:09 2020 +0100
> 
>      hvf: arm: Mark CPU as dirty on reset
> 
>      When clearing internal state of a CPU, we should also make sure 
> that HVF
>      knows about it and can push the new values down to vcpu state.
> 
>      Make sure that with HVF enabled, we tell it that it should synchronize
>      CPU state on next entry after a reset.
> 
>      This fixes PSCI handling, because now newly pushed state such as X0 
> and
>      PC on remote CPU enablement also get pushed into HVF.
> 
>      Signed-off-by: Alexander Graf <agraf@csgraf.de>
> 
> diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
> index b75f813b40..a49a5b32e6 100644
> --- a/target/arm/arm-powerctl.c
> +++ b/target/arm/arm-powerctl.c
> @@ -15,6 +15,7 @@
>   #include "arm-powerctl.h"
>   #include "qemu/log.h"
>   #include "qemu/main-loop.h"
> +#include "sysemu/hw_accel.h"
> 
>   #ifndef DEBUG_ARM_POWERCTL
>   #define DEBUG_ARM_POWERCTL 0
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index db6f7c34ed..9a501ea4bd 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -411,6 +411,8 @@ static void arm_cpu_reset(DeviceState *dev)
>   #ifndef CONFIG_USER_ONLY
>       if (kvm_enabled()) {
>           kvm_arm_reset_vcpu(cpu);
> +    } else if (hvf_enabled()) {
> +        s->vcpu_dirty = true;
>       }
>   #endif
> 

Why only for HVF and only for ARM?  For example hax_init_vcpu and 
whpx_init_vcpu both set s->vcpu_dirty; should you just set it 
unconditionally in cpu_common_reset?

Thanks,

Paolo


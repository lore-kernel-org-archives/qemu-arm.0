Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1210643lfp;
        Thu, 16 Sep 2021 08:07:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpCg8M9w7qoRQuTIch1QCaU39PeHQmma60I8Xq7L7KOWPKpNwwoJmE8bRPvS9qzM+BFt9p
X-Received: by 2002:a2e:a785:: with SMTP id c5mr5468910ljf.434.1631804849946;
        Thu, 16 Sep 2021 08:07:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631804849; cv=none;
        d=google.com; s=arc-20160816;
        b=mlKY+b4yFwE3OFKCXrUalJuLAfS3dQSt4f2ckOdlDgNqoog7npSHedsg/dgQV6TF8L
         IW5+Vt63hHSqbDksH2hOueDljCfMtcVjiPQF0GihbsJ7C3Ge5gkHHZMxyoYCGywu+52l
         85roImM1oTrT0/wHanSt3ZkBryRuejZJxWb0GcWP5u1x7yh1Q94LO40rZxIJ2ie8Mw2B
         leC+n6u9HDFv4PTmvgwBK4gWVgdE6Cv9J8ipqsOK/W/F8riYFZQbTiRxkAEHCdUL2lyO
         ScUbkMqA6U2LSc3MSGZx9RK3EMQV/mj23Hd9pjEDJAFr/19tOg80bfBGQTdS73LLkQlf
         V7Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=dwTIJSckeJ3J6gG621dxV45MoWLu1cUPbDeMhVTf674=;
        b=rUZ74zlk0rrA0FrTNFCBhxgo+KGVDf813OvkJbdMh4tmVxHIWQUwOwgWyt29VAYRGD
         aPuuGocWgYVq1SzQawe64Wa7DJfyBXhF+X73qjyHdUSwecZGkk7Uk0SkBfBE1cNojquQ
         VJ7QhZXb84mjkayk8ruf+ovRnEG0sSxYW8wCFdIEcimVaMe1++yGASNCB4vbCx0BrDaM
         hfiqrFgCM9xgUpBUhXmX4m4I5PEe4kTSI/k2Hlxth8ISx49E1hHIbrPx4ydIggLH0vrx
         ohg/YOx4U1qhZxEVKuEM7zsTaXv3hYcYpsr5hyqaz35rDEhrY8uPUvoj6tS2wZQmHxce
         fcng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3si3822322ljr.509.2021.09.16.08.07.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 08:07:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQsz2-0003zR-Sx
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 11:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mQsuU-0007Zj-IO; Thu, 16 Sep 2021 11:02:46 -0400
Received: from mail.csgraf.de ([85.25.223.15]:51254 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mQsuS-00044G-3S; Thu, 16 Sep 2021 11:02:46 -0400
Received: from MacBook-Air.alex.local
 (dynamic-077-009-016-098.77.9.pool.telefonica.de [77.9.16.98])
 by csgraf.de (Postfix) with ESMTPSA id A91D36080098;
 Thu, 16 Sep 2021 17:02:40 +0200 (CEST)
Subject: Re: [PATCH v11 05/10] arm/hvf: Add a WFI handler
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Collingbourne <pcc@google.com>
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-6-agraf@csgraf.de>
 <8d255a90-7d7c-fcb6-2d9f-8febe182c286@amsat.org>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <2de02003-8355-8022-835d-5fcdf2dddbff@csgraf.de>
Date: Thu, 16 Sep 2021 17:02:39 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <8d255a90-7d7c-fcb6-2d9f-8febe182c286@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.488,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S//FCNMrJBxq


On 16.09.21 06:49, Philippe Mathieu-Daudé wrote:
> On 9/15/21 8:10 PM, Alexander Graf wrote:
>> From: Peter Collingbourne <pcc@google.com>
>>
>> Sleep on WFI until the VTIMER is due but allow ourselves to be woken
>> up on IPI.
>>
>> In this implementation IPI is blocked on the CPU thread at startup and
>> pselect() is used to atomically unblock the signal and begin sleeping.
>> The signal is sent unconditionally so there's no need to worry about
>> races between actually sleeping and the "we think we're sleeping"
>> state. It may lead to an extra wakeup but that's better than missing
>> it entirely.
>>
>> Signed-off-by: Peter Collingbourne <pcc@google.com>
>> [agraf: Remove unused 'set' variable, always advance PC on WFX trap,
>>         support vm stop / continue operations and cntv offsets]
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>> Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
>> Reviewed-by: Sergio Lopez <slp@redhat.com>
>>
>> ---
>> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
>> index 8fe008dab5..49f265cc08 100644
>> --- a/target/arm/hvf/hvf.c
>> +++ b/target/arm/hvf/hvf.c
>> @@ -2,6 +2,7 @@
>>   * QEMU Hypervisor.framework support for Apple Silicon
>>  
>>   * Copyright 2020 Alexander Graf <agraf@csgraf.de>
>> + * Copyright 2020 Google LLC
>>   *
>>   * This work is licensed under the terms of the GNU GPL, version 2 or later.
>>   * See the COPYING file in the top-level directory.
>> @@ -490,6 +491,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
>>  
>>  void hvf_kick_vcpu_thread(CPUState *cpu)
>>  {
>> +    cpus_kick_thread(cpu);
> Doesn't this belong to the previous patch?


Until this patch, we're never running outside guest context on the vCPU
thread, so hv_vcpus_exit() is enough to kick us out :).


Thanks a lot for the review!

Alex


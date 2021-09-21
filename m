Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3227923lfp;
        Tue, 21 Sep 2021 10:05:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvFXMKatw/92CsNcG/RPVzmmndnuDwZ2T+RaUkayc6w3Xtd2Cgt8HV1b3XC6CMPjJhsNt8
X-Received: by 2002:ac8:6112:: with SMTP id a18mr29137980qtm.120.1632243949476;
        Tue, 21 Sep 2021 10:05:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632243949; cv=none;
        d=google.com; s=arc-20160816;
        b=jCdy+rlZvWhbQ/GGpGSIYRpbTJpqxI32JZ6PADrYVPLJnjS+vWZVYOWLlRESatbFMp
         76vKNUXSO+V7vGd23hxG8MznNVjzIvBbQ2Wtr8i1NUtrgVKxfQYNf4xbdKZcLwlU6jfF
         gD0NWIn4Lji3E5UGjvxcDFXJ6r0xdBTNEGm2v3EwCzriLyn2yPJm4ka5wZImM/W8sffT
         yidoGCICxnqhiZ+6JpDJdDbkMt8EJDx0XVD/YRXtWRkx4E+SqH/7TJeD67cxHdNU3dr6
         W3yGKvSosXI+C5oYNoicf372O66RHkpyOG1xkGA+qxrXl82Ydy/yPKTkWK5kFnrxjVfM
         8fsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=5bYfQFyc5GcmTZXASF1Q+2YzdNGBzb8lEUVhrzFDIqo=;
        b=gjD3q2Ftt8oWmOS1yO2q8Dx8fLBIokB+GScmNDjl/ZpL0jpRvi7/npalbVmb22nqSa
         CPobJecMJEMB0NBlddv+OTrOT0/+sCtlQWy9RAtvrAOPbLll3zocluc9JMvWqZp3JzFc
         hNEFbdpAoz6N3fgscuK1WRiR7sQ3qP4D7wESu7L8M5PONGSVC+wWpD5+IDmhtTubHah2
         uDuD/4btjrJEdSHm5G6LGw7OcpFz8FchkWCK+cAX3w+Vv1EcYq/ZGKu1BOlKzT7TYPCw
         MHI9zO1RtojrLamAcD/yn+WRSj9k/e4VfBlVFSUQ0cDoqZOjy15D1luo3QN26BKtcxtd
         fnlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m22si6985086qkn.389.2021.09.21.10.05.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Sep 2021 10:05:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSjDI-0004Kk-UV
	for alex.bennee@linaro.org; Tue, 21 Sep 2021 13:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mSjCj-0004HF-G5; Tue, 21 Sep 2021 13:05:14 -0400
Received: from mail.csgraf.de ([85.25.223.15]:54180 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mSjCh-00038f-Ek; Tue, 21 Sep 2021 13:05:13 -0400
Received: from MacBook-Air.alex.local
 (dynamic-077-007-123-111.77.7.pool.telefonica.de [77.7.123.111])
 by csgraf.de (Postfix) with ESMTPSA id 2EB3B60800D4;
 Tue, 21 Sep 2021 19:05:08 +0200 (CEST)
Subject: Re: [PATCH v12 04/10] hvf: Add Apple Silicon support
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210916155404.86958-1-agraf@csgraf.de>
 <20210916155404.86958-5-agraf@csgraf.de>
 <CAFEAcA-Us-4H8FTFCY38s3=65imNGJ6WP_WYup_EoAxPyDghKQ@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <d0456d36-1ac0-56cd-0f84-ed80cae2361f@csgraf.de>
Date: Tue, 21 Sep 2021 19:05:09 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Us-4H8FTFCY38s3=65imNGJ6WP_WYup_EoAxPyDghKQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oGfjJpljMQTW


On 21.09.21 17:30, Peter Maydell wrote:
> On Thu, 16 Sept 2021 at 16:54, Alexander Graf <agraf@csgraf.de> wrote:
>> With Apple Silicon available to the masses, it's a good time to add support
>> for driving its virtualization extensions from QEMU.
>>
>> This patch adds all necessary architecture specific code to get basic VMs
>> working, including save/restore.
>>
>> Known limitations:
>>
>>   - WFI handling is missing (follows in later patch)
>>   - No watchpoint/breakpoint support
>>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
>> Reviewed-by: Sergio Lopez <slp@redhat.com>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> This broke compilation on x86 osx:
>
>> --- a/target/i386/hvf/hvf.c
>> +++ b/target/i386/hvf/hvf.c
>> @@ -206,6 +206,11 @@ static inline bool apic_bus_freq_is_known(CPUX86State *env)
>>      return env->apic_bus_freq != 0;
>>  }
>>
>> +void hvf_kick_vcpu_thread(CPUState *cpu)
>> +{
>> +    cpus_kick_thread(cpu);
>> +}
> This won't build without an extra #include "sysemu/cpus.h".
> I've folded in the fix.


Thanks a lot! I test compiled all the earlier versions of the patch set
on x86 as well, but no longer have easy access to an x86 macOS system
:(. They're just so insanely slow in comparison!


Alex


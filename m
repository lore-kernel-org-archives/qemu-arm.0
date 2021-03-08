Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1850458lfg;
        Mon, 8 Mar 2021 05:48:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPH32gQroOvEF1g1USn3gxGcePiHMeyM1+pbdG1X7CmviCrL91xvfqRqJAsvnPtKdic7D8
X-Received: by 2002:a92:d7c7:: with SMTP id g7mr19615439ilq.305.1615211303414;
        Mon, 08 Mar 2021 05:48:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615211303; cv=none;
        d=google.com; s=arc-20160816;
        b=jng/okzW/8UlPrDFVqcWUTHHgkp1/1wA58xBswzOQSjFpjczd63t+DPphaGvMGstud
         /2Xm0a+Y84Y240AuosAa0P6y+FEXrpifQw0lQP//TDBdck+6c8yJeRAIxtp/JhoKNXo1
         PvxdNtY1y/YzGUPFeijPmVGcq56Gt00akm0qeo/8xXKeAF5IaC8Weh6ADTVdTSzqMsD8
         uA7GRxfsOV2gzRFGL+voDNVjJ38UJ39heWXK7jZ7KGHErlgVMC0bZqAskllct/1mZ9pa
         pOL1d+T4pxY4+9egURxzVDVTO5rW+wAPCxXEg+YOOhjDB4di9a2On7H/4gcvf4xk62Du
         yhgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=OTi4b6eTRDjIWHCjqDBWuf2TkNA+kfsP7A1m0+F3rcU=;
        b=BN8tc6eh1VGoQEW6/nNGecUf5v//HpKGIjeocNRRsCF957knDLUhB6OwJb868IW6sB
         q+81Ay3JXDyWrOYvpHhIKidlkKolHwSED8EezaKRUKKo3bS0kCk2WpiG+0KCj/aCyvbE
         k29XWYh9SYwQ9pRmSE+1JYfVaS62I4uQFhXAqk7YQbft/BdJVJ50Lu9Su9lW9X1soT3d
         ytNzpFQwnuUhK9TYmQ4jbknl6lNl6J7agMLiFR1wxMTL/9FgwCYuHqC80OwLwBn3YoJl
         rFNP9/XspzbXDQd2rfQEn+7AxKfZcPfza4Q6DpmBZW3o258+Wc5xEKdMu3Zi1ZVF3j4S
         4Zkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TlmA4ON3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1si11074845iog.2.2021.03.08.05.48.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Mar 2021 05:48:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TlmA4ON3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:60318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJGFB-00042D-Ny
	for alex.bennee@linaro.org; Mon, 08 Mar 2021 08:48:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJG4f-0002Uv-6m; Mon, 08 Mar 2021 08:37:29 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:35949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJG4a-00039u-7j; Mon, 08 Mar 2021 08:37:28 -0500
Received: by mail-ed1-x52e.google.com with SMTP id l12so14816872edt.3;
 Mon, 08 Mar 2021 05:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OTi4b6eTRDjIWHCjqDBWuf2TkNA+kfsP7A1m0+F3rcU=;
 b=TlmA4ON3Par5ZvzSArI+v/k4t0Gq/THUqAVl0nXWae4H8i3wgCfYbRp1bkKTil7jsL
 Rtpbi8BVjbKDpmdb6gtL7aOfa/qb8rsRWEIgaDD0kMFdCCJluYx7ExXwfmtsYTbMuX2q
 UfThrlCShAKllQ41rajwf1+ozL8OySdGfPEV89ZQn7lfT4NfgpDj47DzN1CbZ/ddbnn2
 dFaDBiJFU+UkV05mQPuxb3sGN6d9cGAg/vhBB3HAiNfqiwwliMU8auIme+fFU6SFTgsk
 LrRr9xk9LpZAeIeGx+NqiF3UB+uoryBXBBWkSR9siGiSiCMKxojt1EXWW1UCK96sVO2s
 hEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OTi4b6eTRDjIWHCjqDBWuf2TkNA+kfsP7A1m0+F3rcU=;
 b=TwD+Sy8iaZDjShFpdKepV0M2tdAm8/ZngWAt59mhW/SN3neNE+r7ofecG+E+pxGeRn
 BVbvjUt1a2KCxbB6yReJTFg2qMWh2smM7MZFOetoSlkDF9UN1nFLoWXo8XwxtrityRkW
 ptrIm3hDVxmwAW3j6SUezVgp23bmF60YE5sWBqaK2ERpOa0XICVRAKcYBMt9Z6rY92UE
 gkPyJ7StXBHnt4u+9bZ8QMVfjpMvKgQW8Q5Oxa+GYkTXEYCiuE9ABx8OSU9rP8jmLDRu
 1msE2FyEVnKegW2rwWWfGiLTDVeMPagGUpmJ1c2zyvM0q4I3HHsiFp39V9Q/13XAwZ5/
 H4RA==
X-Gm-Message-State: AOAM530Cp2Y5gKWqNaR9VZ83pNQKxEIQa4dCZcLpmtXCSG/S1rX18TBX
 1mF2VT/T23c30dEseoRDmK0=
X-Received: by 2002:aa7:c1d5:: with SMTP id d21mr21610875edp.167.1615210641536; 
 Mon, 08 Mar 2021 05:37:21 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x25sm6984832edv.65.2021.03.08.05.37.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 05:37:21 -0800 (PST)
Subject: Re: [RFC PATCH v2 6/8] cpu: Declare cpu_has_work() in 'sysemu/tcg.h'
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
References: <20210304222323.1954755-1-f4bug@amsat.org>
 <20210304222323.1954755-7-f4bug@amsat.org>
 <ddd0572a-bba2-62ac-27b8-4a7d04257695@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a034fce7-57bb-09fb-fda6-058b14e1b3c1@amsat.org>
Date: Mon, 8 Mar 2021 14:37:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <ddd0572a-bba2-62ac-27b8-4a7d04257695@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-riscv@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lZ+l/zup09If

On 3/8/21 1:17 PM, Claudio Fontana wrote:
> On 3/4/21 11:23 PM, Philippe Mathieu-Daudé wrote:
>> We can only check if a vCPU has work with TCG.
>> Move the cpu_has_work() prototype to "sysemu/tcg.h".
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> RFC: could another accelerator do that?
>>      can we rename this tcg_vcpu_has_work()?
>> ---
>>  include/hw/core/cpu.h | 16 ----------------
>>  include/sysemu/tcg.h  | 11 +++++++++++
>>  accel/tcg/cpu-exec.c  |  7 +++++++
>>  softmmu/cpus.c        |  1 +
>>  4 files changed, 19 insertions(+), 16 deletions(-)
>>
>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>> index 1376e496a3f..66109bcca35 100644
>> --- a/include/hw/core/cpu.h
>> +++ b/include/hw/core/cpu.h
>> @@ -670,22 +670,6 @@ CPUState *cpu_create(const char *typename);
>>   */
>>  const char *parse_cpu_option(const char *cpu_option);
>>  
>> -/**
>> - * cpu_has_work:
>> - * @cpu: The vCPU to check.
>> - *
>> - * Checks whether the CPU has work to do.
>> - *
>> - * Returns: %true if the CPU has work, %false otherwise.
>> - */
>> -static inline bool cpu_has_work(CPUState *cpu)
>> -{
>> -    CPUClass *cc = CPU_GET_CLASS(cpu);
>> -
>> -    g_assert(cc->has_work);
>> -    return cc->has_work(cpu);
>> -}
>> -
>>  /**
>>   * qemu_cpu_is_self:
>>   * @cpu: The vCPU to check against.
>> diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
>> index c16c13c3c69..3d46b0a7a93 100644
>> --- a/include/sysemu/tcg.h
>> +++ b/include/sysemu/tcg.h
>> @@ -10,6 +10,7 @@
>>  
>>  #ifndef CONFIG_TCG
>>  #define tcg_enabled() 0
>> +#define cpu_has_work(cpu) false
> 
> email errors, so not sure if my previous message went off.

Yes, got it.

> 
> I am not convinced by this approach of _hiding_ the fact that cpu_has_work is TCG-only from the context where it is used.
> 
> When reading the actual code using this, how to get an immediate clue that this is TCG-only?
> 
> I think cpu_has_work should either be renamed to tcg_cpu_has_work(), thus providing the context in the name,
> or it should not be visible/called for non-TCG at all, its call protected in some way (if (tcg_enabled() or ifdef or such..)

If no other accelerator can do that, then I agree. I don't know enough
all accelerators to be sure.

> 
> Ciao,
> 
> Claudio
> 
> 
>>  #else
>>  
>>  void tcg_exec_init(unsigned long tb_size, int splitwx);
>> @@ -26,6 +27,16 @@ extern bool tcg_allowed;
>>  extern bool mttcg_enabled;
>>  #define qemu_tcg_mttcg_enabled() (mttcg_enabled)
>>  
>> +/**
>> + * cpu_has_work:
>> + * @cpu: The vCPU to check.
>> + *
>> + * Checks whether the CPU has work to do.
>> + *
>> + * Returns: %true if the CPU has work, %false otherwise.
>> + */
>> +bool cpu_has_work(CPUState *cpu);
>> +
>>  #endif /* CONFIG_TCG */
>>  
>>  #endif
>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>> index 7e67ade35b9..b9ce36e59e2 100644
>> --- a/accel/tcg/cpu-exec.c
>> +++ b/accel/tcg/cpu-exec.c
>> @@ -447,6 +447,13 @@ static inline TranslationBlock *tb_find(CPUState *cpu,
>>      return tb;
>>  }
>>  
>> +bool cpu_has_work(CPUState *cpu)
>> +{
>> +    CPUClass *cc = CPU_GET_CLASS(cpu);
>> +
>> +    return cc->has_work(cpu);
>> +}
>> +
>>  static inline bool cpu_handle_halt(CPUState *cpu)
>>  {
>>      if (cpu->halted) {
>> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
>> index a7ee431187a..548ab9236f1 100644
>> --- a/softmmu/cpus.c
>> +++ b/softmmu/cpus.c
>> @@ -42,6 +42,7 @@
>>  #include "sysemu/runstate.h"
>>  #include "sysemu/cpu-timers.h"
>>  #include "sysemu/whpx.h"
>> +#include "sysemu/tcg.h"
>>  #include "hw/boards.h"
>>  #include "hw/hw.h"
>>  
>>
> 
> 

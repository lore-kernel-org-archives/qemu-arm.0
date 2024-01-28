Received: by 2002:a17:906:3554:b0:a35:2c0b:b7b4 with SMTP id s20csp790375eja;
        Sun, 28 Jan 2024 08:17:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHp9/JrOwL0rQtVx+Vvp8/tQaoWsDcWtWgdxOVCpub14GD8hPDcxfkWzOxswG3NHJ3fImtK
X-Received: by 2002:a05:622a:1a22:b0:42a:853e:e91f with SMTP id f34-20020a05622a1a2200b0042a853ee91fmr4034208qtb.77.1706458641867;
        Sun, 28 Jan 2024 08:17:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706458641; cv=none;
        d=google.com; s=arc-20160816;
        b=iYb/ak6Jrx+Q7JAVNrv7LC5hMHgiAs7JCaPMwzAt2ahI5wlysrOFIj3qpN4w2si40M
         4ozHEVm1bHOTFzyp9d2QUsDVVN9U+OcFuiJFwiLiZ4rfUakleUTS7+LqUdui9Hle67pE
         BNLDDTKyOV3slswv+F9OUO1e8goHOOhaDoBfqfYzpbtuFItvOljjPYDzfol8aN8rLMqH
         LQWXtBIAITolXEifq+slqymvF/52cmkEclY8jUo9t7/lm20MN+lCQOinUEj1JeXG7aWE
         FATQirT2YzJ3VFMiqqNUqNC1WygezTmky/R3PQm4T6vj8ddflrYytj/ODrxozBRu8y/N
         0hkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=nNQ1mZG/MGqiJb02NhZJ31w2Qw5Q82nN33CYLr2cWWo=;
        fh=nhDKiCN3+NSDE0ZTnzeWuA353BsrDhR9HRae4U9IES8=;
        b=Q5JI/4QzlaZ9ai2MDiYnmB4kdAebvMEJvP8yXUmJhhU81eylVjc1kHP/qZT52rtjxb
         WdY+pBZFzu3H0KEzExyOiNqWU+QQQALoW6pRp84RiOvcbM91HrQ5MVw2NHP4yoFkc5zm
         EOFx8/YQQDb+APt3oHOYwNqH+cIq0QFbWybFPJMPBHMi9Q00zf+ce6CxN7hiix6Ws1q1
         fKs3kxCtk2rvbuXUPlslqqFYQq2FEQSCjTrIr2i78mwpYVSPe7BdEw09BLpdN7joEUKm
         7LORQUv0l7PQTN2xrI2rHcMdnhKDvr3QPsxmekN3gK57k0KZfZXvSNh58PNCyW89YpSP
         Ks6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=njBaFUI9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 20-20020ac84e94000000b0042a8a3ec50bsi3795597qtp.636.2024.01.28.08.17.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Jan 2024 08:17:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=njBaFUI9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rU7pj-0000UE-Iu; Sun, 28 Jan 2024 11:16:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rU7pg-0000T1-6y
 for qemu-arm@nongnu.org; Sun, 28 Jan 2024 11:16:33 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rU7pc-0000wq-8D
 for qemu-arm@nongnu.org; Sun, 28 Jan 2024 11:16:31 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33ae5e7d787so920070f8f.1
 for <qemu-arm@nongnu.org>; Sun, 28 Jan 2024 08:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706458583; x=1707063383; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nNQ1mZG/MGqiJb02NhZJ31w2Qw5Q82nN33CYLr2cWWo=;
 b=njBaFUI93VnNXzvsR6it6qggFRGKnH6UuwJKumCOaFTinmVetiQfwSUX8ki9fB/Hvz
 /xka1q6B4cahMXLzTC4S18RTWRLOi0bVmVGe4xpy9sc4CDIVbf234Sh767rEM682Lx74
 qhalorx0q1ol59ZHSLVO5K+C4+4mup5FysSZ0rbliuvBShpSHGgl9QNkESAPqqOmyh8X
 Klr0u+4TGFWn5R6axUT9LjHCEGBIarcFNa2d1BssFBkUKzACfoweyuhjd88NwKLwyPpV
 MTHffvsZlYD7m60elcebWlAAQky905Z8HUlWFGoyAOIIFhVg8Jt+AV6+TspuHfAyN3rO
 bUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706458583; x=1707063383;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nNQ1mZG/MGqiJb02NhZJ31w2Qw5Q82nN33CYLr2cWWo=;
 b=M+WUumHtB40onVpDp5P5GoOrCNVUYxQufekHSX+ADRksJotsSBtkpoYMnqPVufeJRG
 yADqWKmqS/nxPEGhwyY6QH8bc6kXvxzyWWr3pjklVEV0srbAm02ZyRvOrmdscKKrGSjU
 5gZNkoj4E9deBcsqkPEPSdSpk/NtfwgiP7uEcuJ5O3ZnQaE6g0vFdnEvygDhZqrZSdhd
 hQ48flGCskIxI0bPe89NvaF0bxItKh58vYh1oLRz6eMNynG8l1tEi6yGVP/bw3bUQ1mE
 9uGdwavvEJaXLtO4Vc4Hd+fZ8teicBgmD+biOgbHvhi7la1xCHPoIJOBURsISde8tRJ2
 5cBg==
X-Gm-Message-State: AOJu0YxQNQUdmyj8DS/AdI3RplH+zPICPmaPadZGJVEL/zhbHca1Lud2
 3zdalwladaIs/V2BVR6VVGAeF7l2gjWJMg+ZFLtdFVkN6pQbreMwhZE1txlu0V8=
X-Received: by 2002:a5d:604c:0:b0:33a:e5e5:163c with SMTP id
 j12-20020a5d604c000000b0033ae5e5163cmr1763182wrt.71.1706458583105; 
 Sun, 28 Jan 2024 08:16:23 -0800 (PST)
Received: from [192.168.69.100] (sev93-h02-176-184-17-196.dsl.sta.abo.bbox.fr.
 [176.184.17.196]) by smtp.gmail.com with ESMTPSA id
 ch19-20020a5d5d13000000b00337b47ae539sm5942414wrb.42.2024.01.28.08.16.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Jan 2024 08:16:22 -0800 (PST)
Message-ID: <d7c11962-07c0-4c26-83e1-8b0a3d1e43d0@linaro.org>
Date: Sun, 28 Jan 2024 17:16:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/23] target/i386: Prefer fast cpu_env() over slower
 CPU QOM cast macro
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, David Woodhouse
 <dwmw2@infradead.org>, xen-devel@lists.xenproject.org
References: <20240126220407.95022-1-philmd@linaro.org>
 <20240126220407.95022-11-philmd@linaro.org> <ZbT1R7impEw4whqP@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <ZbT1R7impEw4whqP@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: HEBGdr1yODdF

On 27/1/24 13:21, Zhao Liu wrote:
> Hi Philippe,
> 
> On Fri, Jan 26, 2024 at 11:03:52PM +0100, Philippe Mathieu-Daudé wrote:
>> Date: Fri, 26 Jan 2024 23:03:52 +0100
>> From: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Subject: [PATCH v2 10/23] target/i386: Prefer fast cpu_env() over slower
>>   CPU QOM cast macro
>> X-Mailer: git-send-email 2.41.0
>>
>> Mechanical patch produced running the command documented
>> in scripts/coccinelle/cpu_env.cocci_template header.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   target/i386/hvf/vmx.h               | 13 +++-------
>>   hw/i386/vmmouse.c                   |  6 ++---
>>   hw/i386/xen/xen-hvm.c               |  3 +--
>>   target/i386/arch_memory_mapping.c   |  3 +--
>>   target/i386/cpu-dump.c              |  3 +--
>>   target/i386/cpu.c                   | 37 +++++++++------------------
>>   target/i386/helper.c                | 39 ++++++++---------------------
>>   target/i386/hvf/hvf.c               |  8 ++----
>>   target/i386/hvf/x86.c               |  4 +--
>>   target/i386/hvf/x86_emu.c           |  6 ++---
>>   target/i386/hvf/x86_task.c          | 10 +++-----
>>   target/i386/hvf/x86hvf.c            |  6 ++---
>>   target/i386/kvm/kvm.c               |  6 ++---
>>   target/i386/kvm/xen-emu.c           | 32 ++++++++---------------
>>   target/i386/tcg/sysemu/bpt_helper.c |  3 +--
>>   target/i386/tcg/tcg-cpu.c           | 14 +++--------
>>   target/i386/tcg/user/excp_helper.c  |  3 +--
>>   target/i386/tcg/user/seg_helper.c   |  3 +--
>>   18 files changed, 59 insertions(+), 140 deletions(-)
>>
> 
> [snip]
> 
>> diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
>> index 3b1ef5f49a..1e7fd587fe 100644
>> --- a/target/i386/hvf/x86hvf.c
>> +++ b/target/i386/hvf/x86hvf.c
>> @@ -238,8 +238,7 @@ void hvf_get_msrs(CPUState *cs)
>>   
>>   int hvf_put_registers(CPUState *cs)
>>   {
>> -    X86CPU *x86cpu = X86_CPU(cs);
>> -    CPUX86State *env = &x86cpu->env;
>> +    CPUX86State *env = cpu_env(cs);
>>   
>>       wreg(cs->accel->fd, HV_X86_RAX, env->regs[R_EAX]);
>>       wreg(cs->accel->fd, HV_X86_RBX, env->regs[R_EBX]);
>> @@ -282,8 +281,7 @@ int hvf_put_registers(CPUState *cs)
>>   
>>   int hvf_get_registers(CPUState *cs)
>>   {
>> -    X86CPU *x86cpu = X86_CPU(cs);
>> -    CPUX86State *env = &x86cpu->env;
>> +    CPUX86State *env = cpu_env(cs);
>>   
>>       env->regs[R_EAX] = rreg(cs->accel->fd, HV_X86_RAX);
>>       env->regs[R_EBX] = rreg(cs->accel->fd, HV_X86_RBX);
> 
> In this file, there's another corner case:
> 
> diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
> index 3b1ef5f49a8a..9a145aa5aa4f 100644
> --- a/target/i386/hvf/x86hvf.c
> +++ b/target/i386/hvf/x86hvf.c
> @@ -342,8 +342,7 @@ void vmx_clear_int_window_exiting(CPUState *cs)
> 
>   bool hvf_inject_interrupts(CPUState *cs)
>   {
> -    X86CPU *x86cpu = X86_CPU(cs);
> -    CPUX86State *env = &x86cpu->env;
> +    CPUX86State *env = cpu_env(cs);
> 
>       uint8_t vector;
>       uint64_t intr_type;
> @@ -408,7 +407,7 @@ bool hvf_inject_interrupts(CPUState *cs)
>       if (!(env->hflags & HF_INHIBIT_IRQ_MASK) &&
>           (cs->interrupt_request & CPU_INTERRUPT_HARD) &&
>           (env->eflags & IF_MASK) && !(info & VMCS_INTR_VALID)) {
> -        int line = cpu_get_pic_interrupt(&x86cpu->env);
> +        int line = cpu_get_pic_interrupt(env);
>           cs->interrupt_request &= ~CPU_INTERRUPT_HARD;
>           if (line >= 0) {
>               wvmcs(cs->accel->fd, VMCS_ENTRY_INTR_INFO, line |
> 
> 
> For this special case, I'm not sure if the script can cover it as well,
> otherwise maybe it's OK to be cleaned up manually ;-).

BTW I forgot to mention I had to skip target/i386/tcg/translate.c
(7100 LoC) because it is too complex for Coccinelle.

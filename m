Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1903366lfg;
        Mon, 8 Mar 2021 06:54:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNAFStMbwxmf+o3+RL19nlL62QD6wLMb9CJTR9NSAS/ix8QrjckqXWspmuEp3+l7D3djIl
X-Received: by 2002:a05:6e02:1aa9:: with SMTP id l9mr20516530ilv.108.1615215240070;
        Mon, 08 Mar 2021 06:54:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615215240; cv=none;
        d=google.com; s=arc-20160816;
        b=GjjcJjw7OfBYB0Kffss7IYRLDTWabboLdHKilFUwaXDlE3Lxq2v/Yydil6QFr/AeMM
         roVz9kODTVpkBWULCxOstLJYbS425HuAWrrYb7OvAsqa77bySaaLZIY21FoBJjNWULLW
         YfZ0VfVaqQN+XqTQ0zrtdimV96GAyTNuyzhnChroUNPH8B0NUroP8NmU9qrJqBtV5keK
         aGX9jnCKYEoOQBdszaLbji3B8gf7hUuzkDWf2fS/p/Y7B8y2cC+G7cJt4UoB2s4DJDji
         noA2du2EELXFs2uHbGrXX7pVr4gU4XScOy0na7HkCZ7Da4dXbzrc2B/zcV04Mvvu00M5
         JhIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=KMLx7cpPb7gKl8mC1t88mml60/pl6e2vNknp2okeIsM=;
        b=ukEBOob/epT1IOcR+vAW1YzQp+/Tg5LExiU5Y8rnvS9JfO+pBigVo317PsNEbTA/z8
         jBDfaT4AVFBmvqEkoAh1wo8HCrsvvEIUmpACeWGynIjwBZmCe7/Xk/PnYGf+fU6Ha99X
         Je/ECmNaYtPzmrLapLhkrDpOyWL48lDevhC20b52u6PPOYfMtzzb0rNSpPuI8deb/Uc6
         FPAxCG5rQ33oqWt5FSPJYk1QqEXX32upC3bT1tVSdWtfnviIp/SbwFLqMLt3KJepLxzr
         2qESlk0ST3y2m1VZHpWUEOtfD16u1WiJb0FKfg3JT+s6YZar7nPn6U3/KWpiR6YSAqs1
         IiPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s16si10962945ilq.21.2021.03.08.06.53.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Mar 2021 06:54:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJHGh-0004jy-D7
	for alex.bennee@linaro.org; Mon, 08 Mar 2021 09:53:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lJHGY-0004je-KW; Mon, 08 Mar 2021 09:53:50 -0500
Received: from mx2.suse.de ([195.135.220.15]:47622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lJHGW-0003gw-Ce; Mon, 08 Mar 2021 09:53:50 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 135ADAB8C;
 Mon,  8 Mar 2021 14:53:46 +0000 (UTC)
Subject: Re: [RFC PATCH v2 3/8] target/arm: Directly use arm_cpu_has_work
 instead of CPUClass::has_work
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210304222323.1954755-1-f4bug@amsat.org>
 <20210304222323.1954755-4-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <b67724ae-f43a-f71e-c2ce-1c4dd8d904f2@suse.de>
Date: Mon, 8 Mar 2021 15:53:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210304222323.1954755-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-riscv@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rd85dbm6Wsuc

On 3/4/21 11:23 PM, Philippe Mathieu-Daudé wrote:
> There is only one CPUClass::has_work() ARM handler: arm_cpu_has_work().
> 
> Avoid a dereference by declaring it in "internals.h" and call it
> directly  in the WFI helper.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/arm/internals.h | 1 +
>  target/arm/cpu.c       | 2 +-
>  target/arm/op_helper.c | 2 +-
>  3 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 05cebc8597c..1930be08828 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -172,6 +172,7 @@ static inline int r14_bank_number(int mode)
>  void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
>  void arm_translate_init(void);
>  
> +bool arm_cpu_has_work(CPUState *cs);
>  #ifdef CONFIG_TCG
>  void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
>  #endif /* CONFIG_TCG */
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 5e018b2a732..6d2d9f2100f 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -76,7 +76,7 @@ void arm_cpu_synchronize_from_tb(CPUState *cs,
>  }
>  #endif /* CONFIG_TCG */
>  
> -static bool arm_cpu_has_work(CPUState *cs)
> +bool arm_cpu_has_work(CPUState *cs)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
>  
> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
> index 65cb37d088f..a4da6f4fde8 100644
> --- a/target/arm/op_helper.c
> +++ b/target/arm/op_helper.c
> @@ -289,7 +289,7 @@ void HELPER(wfi)(CPUARMState *env, uint32_t insn_len)
>      CPUState *cs = env_cpu(env);
>      int target_el = check_wfx_trap(env, false);
>  
> -    if (cpu_has_work(cs)) {
> +    if (arm_cpu_has_work(cs)) {
>          /* Don't bother to go into our "low power state" if
>           * we would just wake up immediately.
>           */
> 


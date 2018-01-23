Received: by 10.28.71.27 with SMTP id u27csp3841801wma;
        Tue, 23 Jan 2018 01:45:33 -0800 (PST)
X-Google-Smtp-Source: AH8x227LBowOdO+u2Q6BpYcFkEdjix8jdtp9MTN8WONdeXFjf8CK9Mc5gmPDAA1ZJboRrLJZYZtJ
X-Received: by 10.37.175.194 with SMTP id d2mr1893235ybj.408.1516700733598;
        Tue, 23 Jan 2018 01:45:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516700733; cv=none;
        d=google.com; s=arc-20160816;
        b=DlBbzdPHdEwrvKcyC3cv0Y7X5cLQqno08fgaqJre0afDzxd2Dqw4RNXwhYBKt9kDug
         lbV82kXjuNdKClEslckZaDkL7XBAYSFLxKHvX/+SZychd8n1Rh+18vOCVWOn/P65W9HF
         2QNfMh+FandtrV7H+grA85dM5iGUeYYQ1mC2wKQZ8T7nKVeHBHpM3cuzI+Fs/TpeiLkx
         8V+j+pgVcbkqEecwL4xWQVArKYKtvQi6eSsbOvPTmxjW1TTWe9oKvB0u8E5hW8d8yIgj
         srFl9gwoTW4dcuttlbXhhXMRhuJlPc5NTMNJu2hMYuPQo1wduGxqLgGYvhAUI7xEqL0L
         c5hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=ggG1NqCbPDA1/B8+cZ7sXw/6bIux5rJsugAU/FHzqNY=;
        b=sxvDv5LKGohDDtV/LjBVYJdmgD4HHwOZwGhb4YOODpN2alrS5v94yYm/A/X4ZxPxeV
         PoddDPWPVMaNNGj6B6DS9ryJTAjSymArvSTaU5K1HyjeoLJpI/U7siYDU++7QRQbYC47
         cydFcO9QQQpgoAuA9HQC+FDJ84/fS5RVGRcYE8UxEXE2+1Nf73BedjFHAmWzEvEUUoU/
         mngjyugG2m84aVPO71XeaboezMKvAaDKFk/9xdc3q5ccoqiHvUIQXag96iJPImhbkkax
         UsrjUwHvcUEfvjCOxl5KXN1i41FaMQZ6v8cF0f/ZxU15vSpT40FWTslV8bOwniYK38Xl
         bwBA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g7si1055302ywd.748.2018.01.23.01.45.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 01:45:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48118 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edv93-0002li-2r
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 04:45:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54226)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1edv8r-0002l0-KI
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 04:45:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1edv8o-0004X0-FV
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 04:45:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38278)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1edv8o-0004UF-6q; Tue, 23 Jan 2018 04:45:18 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4B3B176552;
	Tue, 23 Jan 2018 09:45:16 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59A096A96C;
	Tue, 23 Jan 2018 09:45:14 +0000 (UTC)
Date: Tue, 23 Jan 2018 10:45:11 +0100
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20180123094511.5m4uuocpgzlfldf3@kamzik.brq.redhat.com>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
	<1516694904-64879-4-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1516694904-64879-4-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 23 Jan 2018 09:45:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 03/25] arm: cpu: add
 CPU_RESOLVING_TYPE macro
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mU7PDTgRuDZd

On Tue, Jan 23, 2018 at 09:08:02AM +0100, Igor Mammedov wrote:
> it will be used for providing to cpu name resolving class for
> parsing cpu model for system and user emulation code.
> 
> Along with change add target to null-machine test, so
> that when switch to CPU_RESOLVING_TYPE happens,
> thest would ensure that null-mchine usecase still works.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: qemu-arm@nongnu.org
> CC: Peter Maydell <peter.maydell@linaro.org>
> CC: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/cpu.h          | 1 +
>  linux-user/main.c         | 2 --
>  tests/machine-none-test.c | 2 ++
>  3 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 9631670..f9fb141 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2171,6 +2171,7 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
>  
>  #define ARM_CPU_TYPE_SUFFIX "-" TYPE_ARM_CPU
>  #define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
> +#define CPU_RESOLVING_TYPE TYPE_ARM_CPU
>  
>  #define cpu_signal_handler cpu_arm_signal_handler
>  #define cpu_list arm_cpu_list
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 450eb3c..a35477e 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -4325,8 +4325,6 @@ int main(int argc, char **argv, char **envp)
>  #else
>          cpu_model = "qemu32";
>  #endif
> -#elif defined(TARGET_ARM)
> -        cpu_model = "any";
>  #elif defined(TARGET_UNICORE32)
>          cpu_model = "any";
>  #elif defined(TARGET_M68K)
> diff --git a/tests/machine-none-test.c b/tests/machine-none-test.c
> index 2eb13e8..1b213ff 100644
> --- a/tests/machine-none-test.c
> +++ b/tests/machine-none-test.c
> @@ -24,6 +24,8 @@ struct arch2cpu {
>  
>  static struct arch2cpu cpus_map[] = {
>      /* tested targets list */
> +    { "arm", "cortex-a15" },
> +    { "aarch64", "cortex-a15" },

I understand that this doesn't matter for your purposes, but can we change
the aarch64 mapping to point to an aarch64 processor, e.g. cortex-a57,
instead?

Thanks,
drew

>  };
>  
>  static const char *get_cpu_model_by_arch(const char *arch)
> -- 
> 2.7.4
> 
> 

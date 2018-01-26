Received: by 10.28.71.27 with SMTP id u27csp858917wma;
        Fri, 26 Jan 2018 07:59:01 -0800 (PST)
X-Google-Smtp-Source: AH8x2272Q3vWJzdbBPneS0Xfktj9BnC1wPreq4ebFg+vJ2/qG9aAqoLrxQaOgx5HRlKxhVepRV+N
X-Received: by 10.37.165.35 with SMTP id h32mr11770590ybi.297.1516982341004;
        Fri, 26 Jan 2018 07:59:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516982341; cv=none;
        d=google.com; s=arc-20160816;
        b=uBmkMLjNKmaXXjYDl9OuQJ7AkqcumuCrZ0qzl3ac+YpBM7YrAeX8wLjq+utFfXHadi
         2/mla6U65c4JCeQs4/PAzR3MguPWkdSjCcaQmJPGZ/kTWoL42pCxTqzAts6HkMIhSlL9
         gjTCv9wzYgMrfFYFT2F/YWG6lCtfOr2Rh94d5u0HdHwpVahJQg5NlycA/VklRBe5B21D
         QEaiK5Q4tki6apbt3ispXawQ07i/SumnG2lYxIBqbrFKBe5T52JukOS5CA8TzdA405lE
         8GmdbH9LznJqGERGqGP/y7XDb4PDth9m+iH+TNTmbbNvnjp1ngDVSh0b0C4tQT12h33k
         W2AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=Tt5QWbc699BE3F+nrrv2m5/3xUxC3NUiSOsD9AsvqOA=;
        b=V77Qll3fhTg6neoIdEZtsKlH8vQjfvej8AJzi2oNNSdkoTIkFFbWvw7tyD9qmCsnd6
         nyvO4zTx8GCy8rtg1HigyJakJlRnYhGE9PaZE7eqGatwV5C3TcoJUFyGUuWwSEGlc1BP
         no+qfostCkveGE8m8PgmmM/6jxY5XS31NyVWxP4LjgB2I9cLG7IIqKhZ3IgQOqSZwmb1
         mG2K2E8Sjmxw4CRuD3nymQ0BLTqjJD75+QbFRqGPPGvTVRPrxFHqTABZewXp2TYahzwv
         SQkV52nXgvd/SRnL8S6rQ373EpvzH7vVQ+Nsi9MSg10g27gK+MApGNJxPkVSushNodmp
         WxrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=T6WQ+3Ut;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i29si3705950ybj.701.2018.01.26.07.59.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Jan 2018 07:59:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=T6WQ+3Ut;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35252 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ef6P6-0008MU-CX
	for alex.bennee@linaro.org; Fri, 26 Jan 2018 10:59:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ef6N1-0007Gi-FG
	for qemu-devel@nongnu.org; Fri, 26 Jan 2018 10:56:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ef6Mx-0004qW-F1
	for qemu-devel@nongnu.org; Fri, 26 Jan 2018 10:56:51 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:43646)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ef6Mx-0004pz-62; Fri, 26 Jan 2018 10:56:47 -0500
Received: by mail-qt0-x244.google.com with SMTP id s3so2340738qtb.10;
	Fri, 26 Jan 2018 07:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Tt5QWbc699BE3F+nrrv2m5/3xUxC3NUiSOsD9AsvqOA=;
	b=T6WQ+3UtJmHRphW6AZiMjNpD1YdauOBmaxGkI0wJryiaPFNBtGsXrCxoVTKJevWNOk
	rc9jDkYJWcBavKKQHL0OAq2j0k0ouhMwyRtsQ2gbgshG5UAnejrdtvbxAnIA3LvddxjD
	LYJOACii09joASBDv6aewAV8K8E1Mv7L0kCg8GwOqm3ylVxwxc2bDpRrUZGfo/p9y39v
	sCxDVDsLVca3fAat7QkgKuivTWECrE2O915NvjBVXkZivnXXQzyG2tno9xX8d7U6fseZ
	iNKKcwgpz44Lt6aYbQveM8fhpyFKuhc5/UfYmKB4che/9Vc3+qAUhj6RGomo9S0ame1X
	8yBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Tt5QWbc699BE3F+nrrv2m5/3xUxC3NUiSOsD9AsvqOA=;
	b=su69FTAj0MB/PYB0kG8PSuimVRl2G1xMxMCo0F/hbQJy9406oz3Wbr3HnubO0TnrP/
	Rvc3paItfMmGuVf5v8OsIQLXIN0rP9Htvl/DsS3TYeaPxjq0UA/BXXRS76EuSCNgu3SD
	CCKQsHP6YVXjAQKzNcgIcDWfZPBGF3lKLhzA2yDA7kFB7mX+y7NbOYfI7vm9NI11bI4H
	s4Ag5e2Nj0Baxok5zNzDvUhsRyBEHHPOPT7mpHROm/w2CJMblU9Gx2RWdGrSFok0VdeE
	p+ES8W+BRsfCeGI03wso7wTtSCzajheRf2I3zJ6/EVMrEYb640jIHmCbe+nO6T9o6JWN
	D76Q==
X-Gm-Message-State: AKwxytdcJxJu5ifYFycltg9YQmU+IxS9v6c9oP56SwM2jqZNH0JTJ4hp
	O4CNOMqZqhdKKYnjpAPyhFuyJxRS
X-Received: by 10.55.150.6 with SMTP id y6mr19927888qkd.155.1516976976832;
	Fri, 26 Jan 2018 06:29:36 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id m1sm3396307qkf.8.2018.01.26.06.29.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Jan 2018 06:29:36 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
	<1512670493-18114-5-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <d8c2c2ca-5046-f19b-9514-d3cbef3b7c3a@amsat.org>
Date: Fri, 26 Jan 2018 11:29:33 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1512670493-18114-5-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-devel] [PATCH 4/6] target/arm: Add "-cpu max" support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QyHyBgMbhjzd

Hi Peter,

On 12/07/2017 03:14 PM, Peter Maydell wrote:
> Add support for "-cpu max" for ARM guests. This CPU type behaves
> like "-cpu host" when KVM is enabled, and like a system CPU with
> the maximum possible feature set otherwise. (Note that this means
> it won't be migratable across versions, as we will likely add
> features to it in future.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu-qom.h |  2 ++
>  target/arm/cpu.c     | 24 ++++++++++++++++++++++++
>  target/arm/cpu64.c   | 21 +++++++++++++++++++++
>  3 files changed, 47 insertions(+)
> 
> diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
> index a42495b..d135ff8 100644
> --- a/target/arm/cpu-qom.h
> +++ b/target/arm/cpu-qom.h
> @@ -33,6 +33,8 @@ struct arm_boot_info;
>  #define ARM_CPU_GET_CLASS(obj) \
>      OBJECT_GET_CLASS(ARMCPUClass, (obj), TYPE_ARM_CPU)
>  
> +#define TYPE_ARM_MAX_CPU "max-" TYPE_ARM_CPU
> +
>  /**
>   * ARMCPUClass:
>   * @parent_realize: The parent class' realize handler.
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 9304277..190da97 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1628,6 +1628,27 @@ static void pxa270c5_initfn(Object *obj)
>      cpu->reset_sctlr = 0x00000078;
>  }
>  
> +#ifndef TARGET_AARCH64
> +/* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
> + * otherwise, a CPU with as many features enabled as our emulation supports.
> + * The version of '-cpu max' for qemu-system-aarch64 is defined in cpu64.c;
> + * this only needs to handle 32 bits.
> + */
> +static void arm_max_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    if (kvm_enabled()) {
> +        kvm_arm_set_cpu_features_from_host(cpu);
> +    } else {
> +        cortex_a15_initfn(obj);> +        /* In future we might add feature bits here even if the
> +         * real-world A15 doesn't implement them.
> +         */

Why not use arm_any_initfn() here?

Actually what seems cleaner is to move "any" features here, and kill the
"any" cpu, using "max" for this purpose.

> +    }
> +}
> +#endif
> +
>  #ifdef CONFIG_USER_ONLY
>  static void arm_any_initfn(Object *obj)
>  {
> @@ -1691,6 +1712,9 @@ static const ARMCPUInfo arm_cpus[] = {
>      { .name = "pxa270-b1",   .initfn = pxa270b1_initfn },
>      { .name = "pxa270-c0",   .initfn = pxa270c0_initfn },
>      { .name = "pxa270-c5",   .initfn = pxa270c5_initfn },
> +#ifndef TARGET_AARCH64
> +    { .name = "max",         .initfn = arm_max_initfn },
> +#endif

>  #ifdef CONFIG_USER_ONLY
>      { .name = "any",         .initfn = arm_any_initfn },
>  #endif

and we can remove the last 3 lines.

> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 670c07a..38dcf32 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -28,6 +28,7 @@
>  #include "hw/arm/arm.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/kvm.h"
> +#include "kvm_arm.h"
>  
>  static inline void set_feature(CPUARMState *env, int feature)
>  {
> @@ -212,6 +213,25 @@ static void aarch64_a53_initfn(Object *obj)
>      define_arm_cp_regs(cpu, cortex_a57_a53_cp_reginfo);
>  }
>  
> +/* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
> + * otherwise, a CPU with as many features enabled as our emulation supports.
> + * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
> + * this only needs to handle 64 bits.
> + */
> +static void aarch64_max_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    if (kvm_enabled()) {
> +        kvm_arm_set_cpu_features_from_host(cpu);
> +    } else {
> +        aarch64_a57_initfn(obj);
> +        /* In future we might add feature bits here even if the
> +         * real-world A57 doesn't implement them.
> +         */
> +    }
> +}
> +
>  #ifdef CONFIG_USER_ONLY
>  static void aarch64_any_initfn(Object *obj)
>  {
> @@ -240,6 +260,7 @@ typedef struct ARMCPUInfo {
>  static const ARMCPUInfo aarch64_cpus[] = {
>      { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
>      { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
> +    { .name = "max",                .initfn = aarch64_max_initfn },
>  #ifdef CONFIG_USER_ONLY
>      { .name = "any",         .initfn = aarch64_any_initfn },
>  #endif
> 

Received: by 10.28.71.27 with SMTP id u27csp724284wma;
        Fri, 26 Jan 2018 05:48:21 -0800 (PST)
X-Google-Smtp-Source: AH8x2244DhEsKpE9W9xGvLraUiTgQGJyc1hFA6B2vlT2CsRgzp0sr0rt8o8hS/uEhaL5psohh4zK
X-Received: by 10.37.18.193 with SMTP id 184mr11324988ybs.127.1516974501905;
        Fri, 26 Jan 2018 05:48:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516974501; cv=none;
        d=google.com; s=arc-20160816;
        b=rFIEK86f6qO6gVyklw+M/LuUfAX0fDfEuIY6LqhR6mFLfyr3NCed+NWLcGjrFR58jW
         cVSzlXjXRdQMTyA28HPYbwCN61XO7xqTqcpkPT2+G6RY2VY9aeOPHIPRgXNUhpUHZhK9
         9Dm2SzMx9eOhLG13HzOaMde4BUlVnQx+ON/iATHbTE1m7AdwJMaZmMlYVxQ3R+jUVx5Z
         HZMnvVJDK9czu9HHl7PjV6dMpp9l5XIcEYTzIkX2YZx3p13V9KjAC8kzViSEPKYpLlSM
         BLI2RUXDiixwFE7PSd1lFQeWoIxrQo+PKNeh5mXeddZvpthEty4cr/blLFa9/9iopsWv
         WJOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=eE83eEsuoJlF8vI9TxIRybjoS1DbvsrxcegCkGX2QLQ=;
        b=EyAuo9bWSU8TY2PRc8PAdvzVaHGWvlmSDbyRHF4J/3w9QwkQr1GgDnSuoTrnR9U06j
         pZZ91xpot0zFM9m6oiQOgkAEpKDlSg1lvouFBOB6dP/AE5P+m5+HpQG6Y0lgiFEOg3JT
         yTZv4zPYQW79fuGmN6tpJQT8eDGsguSAbPNju9HEITSrwaHhrJ0uOZbmoKfXhLEwDuKp
         7dJjI+OU8tdkr6ZRQE6MhPT6a7b66ZA8g+jtCPPjw7YLa/F5iDGtqIHXZ0B+Co74KsB5
         FByxcq6qy9+MPTqBfQOK1N3nkXyGRCIt3p6fRrnhUFSyLBkJSZ29vc6VevIJ2QV9PQlA
         SmVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pZPPW2Uk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o2si899450ywc.795.2018.01.26.05.48.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Jan 2018 05:48:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pZPPW2Uk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56719 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ef4Mf-0003BQ-Be
	for alex.bennee@linaro.org; Fri, 26 Jan 2018 08:48:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ef4MB-0003B1-Dz
	for qemu-devel@nongnu.org; Fri, 26 Jan 2018 08:47:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ef4M8-0005cJ-9T
	for qemu-devel@nongnu.org; Fri, 26 Jan 2018 08:47:51 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:42275)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ef4M8-0005by-5G; Fri, 26 Jan 2018 08:47:48 -0500
Received: by mail-qt0-x243.google.com with SMTP id c2so1323192qtn.9;
	Fri, 26 Jan 2018 05:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=eE83eEsuoJlF8vI9TxIRybjoS1DbvsrxcegCkGX2QLQ=;
	b=pZPPW2UkQFPx2mI/lIQZcgWEAua1KKkeaeYDm/HLO8YRiR/6el19YJ71SKOvxmIpPJ
	tkyrnjko96tMWzQSXffdxZalt2vVyH0CVRwbErt7IrouVYfs4plselb7GDHNmOXZRLR4
	y8Pas9skb6UzDHO2e+mMhE61O8diudJt3EoeB5M19cyEqI015F65vwROXmZmu9IV6c/T
	5Fe/O1cMkmUGMqsBGCZV4LaQ0htBFMAyDvJb3GWBPplXuJ8TNvT167dKc6VouDPThVPB
	JOFc2d4yq6sJ1Fbnc4I+JX0y6nP36N3iOHKWjD5S7XJvXz+SVPxYtqKMkoimj0eznFCP
	3H7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=eE83eEsuoJlF8vI9TxIRybjoS1DbvsrxcegCkGX2QLQ=;
	b=Lk2msovMd2ldDMUEjk+os7O/Rco9NAj/r1pM+fUYgRjNWmu7wFN5rtCmnhgyYF+qVz
	nvZG7anLH/zl19fd4f7UidMGjOlhtlvlZyI4bOtaIJwYKoQhZs7mTWDZt41+ZmVyAhtw
	VOmJSj4mX8lCH/D9EkrIC4iGgElYXjxST9LlZfoYsb38TJzZvcJ0+AZM2IGsekx8jUDX
	cPfRNT/rTOT3lj/TCBpAcjCE/5TB5WbNzB6E54EyIbuduGOMooCLH0KqKsWXufT19D/w
	DJ7W6vM4dCz+FFenmiYjGWME2kh4UjPSHMEUpkYyPSYTCvuZsoVH023jvWPyhzDYv4Hf
	52Hw==
X-Gm-Message-State: AKwxyte/uIpFNHUorl8Eq6nNbZsCSK9JJvuLd0HJ4ZvAZyw90DilNGY/
	S67sib8vcRsDbVHeILf83wk=
X-Received: by 10.200.27.232 with SMTP id m37mr23211975qtk.171.1516974467614; 
	Fri, 26 Jan 2018 05:47:47 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id w8sm3385827qka.2.2018.01.26.05.47.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Jan 2018 05:47:46 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
	<1512670493-18114-4-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <6f0c5a48-561d-6bc6-1c05-1b773fbba65a@amsat.org>
Date: Fri, 26 Jan 2018 10:47:43 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1512670493-18114-4-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-devel] [PATCH 3/6] target/arm: Move definition of 'host'
 cpu type into cpu.c
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
X-TUID: NG41J2jSwf+r

On 12/07/2017 03:14 PM, Peter Maydell wrote:
> Move the definition of the 'host' cpu type into cpu.c, where all the
> other CPU types are defined.  We can do this now we've decoupled it
> from the KVM-specific host feature probing.  This means we now create
> the type unconditionally (assuming we were built with KVM support at
> all), but if you try to use it without -enable-kvm this will end
> up in the "host cpu probe failed and KVM not enabled" path in
> arm_cpu_realizefn(), for an appropriate error message.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/cpu.c | 24 ++++++++++++++++++++++++
>  target/arm/kvm.c | 19 -------------------
>  2 files changed, 24 insertions(+), 19 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index a7deb10..9304277 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1785,6 +1785,26 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>  #endif
>  }
>  
> +#ifdef CONFIG_KVM
> +static void arm_host_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    kvm_arm_set_cpu_features_from_host(cpu);
> +}
> +
> +static const TypeInfo host_arm_cpu_type_info = {
> +    .name = TYPE_ARM_HOST_CPU,
> +#ifdef TARGET_AARCH64
> +    .parent = TYPE_AARCH64_CPU,
> +#else
> +    .parent = TYPE_ARM_CPU,
> +#endif
> +    .instance_init = arm_host_initfn,
> +};
> +
> +#endif
> +
>  static void cpu_register(const ARMCPUInfo *info)
>  {
>      TypeInfo type_info = {
> @@ -1822,6 +1842,10 @@ static void arm_cpu_register_types(void)
>          cpu_register(info);
>          info++;
>      }
> +
> +#ifdef CONFIG_KVM
> +    type_register_static(&host_arm_cpu_type_info);
> +#endif
>  }
>  
>  type_init(arm_cpu_register_types)
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 945696c..6bdc027 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -152,23 +152,6 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
>      env->features = arm_host_cpu_features.features;
>  }
>  
> -static void kvm_arm_host_cpu_initfn(Object *obj)
> -{
> -    ARMCPU *cpu = ARM_CPU(obj);
> -
> -    kvm_arm_set_cpu_features_from_host(cpu);
> -}
> -
> -static const TypeInfo host_arm_cpu_type_info = {
> -    .name = TYPE_ARM_HOST_CPU,
> -#ifdef TARGET_AARCH64
> -    .parent = TYPE_AARCH64_CPU,
> -#else
> -    .parent = TYPE_ARM_CPU,
> -#endif
> -    .instance_init = kvm_arm_host_cpu_initfn,
> -};
> -
>  int kvm_arch_init(MachineState *ms, KVMState *s)
>  {
>      /* For ARM interrupt delivery is always asynchronous,
> @@ -184,8 +167,6 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>  
>      cap_has_mp_state = kvm_check_extension(s, KVM_CAP_MP_STATE);
>  
> -    type_register_static(&host_arm_cpu_type_info);
> -
>      return 0;
>  }
>  
> 

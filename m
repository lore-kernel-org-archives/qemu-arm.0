Received: by 10.28.91.67 with SMTP id p64csp3848283wmb;
        Tue, 6 Mar 2018 07:16:34 -0800 (PST)
X-Google-Smtp-Source: AG47ELt6IXzEfGsc4gcY4vgl9l6QrWqJx58SR3Kgqs5v6VEOMQR+aet18tX4FG6YoOgvDfMZ8A7A
X-Received: by 10.129.160.20 with SMTP id x20mr11953701ywg.473.1520349393948;
        Tue, 06 Mar 2018 07:16:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520349393; cv=none;
        d=google.com; s=arc-20160816;
        b=soz2qPFJhT5NRwewG7e7W5/hqREj+R/WH8PtQU0hU1sR8oB8G3ewxjjiegqx/rsB2d
         cYA+PM9aPcEngmpcUJ0vGVnuf1Y9oaLfat2dGg4ggZEmGIs1QcDVpaOxItH0bAv/LkdI
         7sqxzW5Wq7JYAINyu1Yuog/YsdSv0F1t6Jg5kZ7L+KxRzUfG7+A7cRivKdckjL7a9BT+
         LH3kM+3vyjc/xnE0yR3uzM3pi7g+fOv3i8EJhxTaeRuHXY8cTgBPPLTDYoLzbO/sEI6n
         qQ/7kz60tbwhpx7vG1UVGR601YtK9+csUOl9nxbaQAsab1aT4clkm7tGT5PFixRyZfx2
         cuRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=bafBbayONmD8drxNVaCAfvRxLGXMjGeA45ocx5Pbtcc=;
        b=CcC0TO/NXYysHa5BwAXn+J8/yBs7BHgfal8WR1imwCDbm8EM2xm7Lx6lxrRFZcHKXO
         Yfn12c4XgHej3sE5mkDOBsD3piORWxrknOeSgXTTL0pGsb8GgNX+xEVVRNMmNXjnQM9h
         KMfIBm8n7Rp1zLKqTViCJir805EVKAp6cd4qUP8kTWjZB29ZEscmGQDtj2ws8RPIH0wW
         wtn8QiWCW/FWlwdZOcPnNQPPnEY29tMFTd6aLdRYsvNvPCEgcv6jLIB52I8jl30e+uuJ
         nFHcLl9PwAHy4iswgnZfdFwwYGuz+nZZ0MEKBP9yt/5H+v8ZUL1S2FUf0GGA6Q2aODDE
         MI+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p6-v6si2025839ybo.769.2018.03.06.07.16.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Mar 2018 07:16:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56392 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1etEKP-0000HP-Du
	for alex.bennee@linaro.org; Tue, 06 Mar 2018 10:16:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1etEKF-0000GW-5K
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 10:16:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1etEKB-0003ID-Pp
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 10:16:23 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41886 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1etEKB-0003Hv-Ke; Tue, 06 Mar 2018 10:16:19 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F8D080AD23B;
	Tue,  6 Mar 2018 15:16:19 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 58A15213AEF8;
	Tue,  6 Mar 2018 15:16:18 +0000 (UTC)
Date: Tue, 6 Mar 2018 16:16:17 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180306161617.07459ef6@redhat.com>
In-Reply-To: <20180306125526.27838-5-peter.maydell@linaro.org>
References: <20180306125526.27838-1-peter.maydell@linaro.org>
	<20180306125526.27838-5-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Tue, 06 Mar 2018 15:16:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Tue, 06 Mar 2018 15:16:19 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 4/6] target/arm: Make 'any'
 CPU just an alias for 'max'
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org,
	Philippe =?UTF-8?B?TWF0?= =?UTF-8?B?aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uJeH5FwNoySw

On Tue,  6 Mar 2018 12:55:24 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> Now we have a working '-cpu max', the linux-user-only
> 'any' CPU is pretty much the same thing, so implement it
> that way.
> 
> For the moment we don't add any of the extra feature bits
> to the system-emulation "max", because we don't set the
> ID register bits we would need to to advertise those
> features as present.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.c   | 50 +++++++++++++++++++++++----------------------
>  target/arm/cpu64.c | 59 ++++++++++++++++++++++++++----------------------------
>  2 files changed, 54 insertions(+), 55 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index e46ddcc613..c8d3da2140 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -965,9 +965,17 @@ static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
>      ObjectClass *oc;
>      char *typename;
>      char **cpuname;
> +    const char *cpunamestr;
>  
>      cpuname = g_strsplit(cpu_model, ",", 1);
> -    typename = g_strdup_printf(ARM_CPU_TYPE_NAME("%s"), cpuname[0]);
> +    cpunamestr = cpuname[0];
> +#ifdef CONFIG_USER_ONLY
> +    /* For backwards compatibility usermode emulation allows "-cpu any",
> +     * which has the same semantics as "-cpu max".
> +     */
> +    cpunamestr = "max";
shouldn't it be
 if (!strcmp(cpuname[0], "any")) {
     cpunamestr = "max";
 }


> +#endif
> +    typename = g_strdup_printf(ARM_CPU_TYPE_NAME("%s"), cpunamestr);
>      oc = object_class_by_name(typename);
>      g_strfreev(cpuname);
>      g_free(typename);
> @@ -1711,29 +1719,23 @@ static void arm_max_initfn(Object *obj)
>          kvm_arm_set_cpu_features_from_host(cpu);
>      } else {
>          cortex_a15_initfn(obj);
> -        /* In future we might add feature bits here even if the
> -         * real-world A15 doesn't implement them.
> -         */
> -    }
> -}
> -#endif
> -
>  #ifdef CONFIG_USER_ONLY
> -static void arm_any_initfn(Object *obj)
> -{
> -    ARMCPU *cpu = ARM_CPU(obj);
> -    set_feature(&cpu->env, ARM_FEATURE_V8);
> -    set_feature(&cpu->env, ARM_FEATURE_VFP4);
> -    set_feature(&cpu->env, ARM_FEATURE_NEON);
> -    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_AES);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_SHA1);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
> -    set_feature(&cpu->env, ARM_FEATURE_CRC);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_RDM);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
> -    cpu->midr = 0xffffffff;
> +        /* We don't set these in system emulation mode for the moment,
> +         * since we don't correctly set the ID registers to advertise them,
> +         */
> +        set_feature(&cpu->env, ARM_FEATURE_V8);
> +        set_feature(&cpu->env, ARM_FEATURE_VFP4);
> +        set_feature(&cpu->env, ARM_FEATURE_NEON);
> +        set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_AES);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_SHA1);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
> +        set_feature(&cpu->env, ARM_FEATURE_CRC);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_RDM);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
> +#endif
> +    }
>  }
>  #endif
>  
> @@ -1789,7 +1791,7 @@ static const ARMCPUInfo arm_cpus[] = {
>      { .name = "max",         .initfn = arm_max_initfn },
>  #endif
>  #ifdef CONFIG_USER_ONLY
> -    { .name = "any",         .initfn = arm_any_initfn },
> +    { .name = "any",         .initfn = arm_max_initfn },
Note,
 'any' will disappear from "-cpu help"
but that's probably fine, old users would still be able to use alias
and new ones won't even suspect about its existence and use 'max'.

[...]


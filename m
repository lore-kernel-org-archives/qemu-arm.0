Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2731586wrp;
        Mon, 23 Sep 2019 07:29:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyHsQbRJX0y4oQHA/Kjw4/gY7GN06BhPzbmuOFTsBusDKlLISo6w97nLPVNLmQfSY0MDy9j
X-Received: by 2002:aa7:df14:: with SMTP id c20mr318845edy.133.1569248952339;
        Mon, 23 Sep 2019 07:29:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569248952; cv=none;
        d=google.com; s=arc-20160816;
        b=CWBWDCQZwHMAWnPmbErGz3BI/l+s0S+bMvdfVtHplwGttCI5hJpTNqMs31MVNJfhHE
         qKzd8CIi2SztlTtO1U+gy1DRDpe5jhhb0GLYumaa0pJfJeddf6ne9+YjEzMEx1XVHm/F
         vaHOIHQ4u82Lnhb7VYba5FupC5FQQpPpXgyY9QGphdTXNBYH0TtKjhc1r7PnP1LaPDiT
         IPst0w4Eam0M3UoXu7lcUeoY68/hCBTFr/82525J8CsIuWJF0CNr/fxSQ5XrwypVz0/2
         Df8Nstcpib1yELzHzUwyGwnnNWxuPOYdOEwasHW//FGM79qoeMbxZNX2L8cSGS4bVt6X
         fMIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=wBw+tPwYV0+fHlQxOQSBapMGO2VIRKKFawfMNELx15Y=;
        b=QPHjm4kCPEW4G0f8J7F8CkLWwlzJL13tHIpRJWZVZ2rZOGtEcs0xnpPLs/gReipPCz
         sEVqdYIf188nppgrB5FsdCEg2dImKVGe0ur3t0ccB0Ce5F0hWkd7Vto5iEW97c4CrO/9
         VTrZuSYCxa2nr23qPFT+oLwllhWfS5ujqgASALxjyPt9Y/LheYBV2oTpzCOD4USGkODX
         i+iUR7oajFGih62RxKb7uzNV25/508/qzWAUeR0+skdKx/uDDHF46r5/i2AsXt65HeuI
         a8OQ6ivgwEnDfaK0vAmgB59yUNXOGEYFs1KXQOvjfLiuLjHo8XUp7m+OK/9L/qSK6IjQ
         CzQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f17si8279282edf.328.2019.09.23.07.29.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 07:29:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCPKx-0007Cr-9N
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 10:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38753)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iCPKp-0007Cl-2G
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 10:29:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iCPKm-0006dt-8x
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 10:29:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52601)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iCPKm-0006dU-1G; Mon, 23 Sep 2019 10:29:00 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4F6B730ADBAA;
 Mon, 23 Sep 2019 14:28:59 +0000 (UTC)
Received: from [10.36.116.30] (ovpn-116-30.ams2.redhat.com [10.36.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D8E7260FB6;
 Mon, 23 Sep 2019 14:28:43 +0000 (UTC)
Subject: Re: [PATCH 1/4] target/arm: Make cpu_register() and set_feature()
 available for other files
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20190921150420.30743-1-thuth@redhat.com>
 <20190921150420.30743-2-thuth@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <9457e42b-8550-561a-d2d0-7dce076af200@redhat.com>
Date: Mon, 23 Sep 2019 16:28:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190921150420.30743-2-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Mon, 23 Sep 2019 14:28:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZiNjPrnfrNuE

Hi Thomas,

On 9/21/19 5:04 PM, Thomas Huth wrote:
> Move the common set_feature() and unset_feature() functions from cpu.c and
> cpu64.c to internals.h, and make cpu_register() (renamed to arm_cpu_register())
> available from there, too, so we can register CPUs also from other files
> in the future.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  target/arm/cpu.c       | 20 ++------------------
>  target/arm/cpu64.c     | 17 +----------------
>  target/arm/internals.h | 18 ++++++++++++++++++
>  3 files changed, 21 insertions(+), 34 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 2399c14471..f1f9eecdc8 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -614,16 +614,6 @@ static bool arm_cpu_virtio_is_big_endian(CPUState *cs)
>  
>  #endif
>  
> -static inline void set_feature(CPUARMState *env, int feature)
> -{
> -    env->features |= 1ULL << feature;
> -}
> -
> -static inline void unset_feature(CPUARMState *env, int feature)
> -{
> -    env->features &= ~(1ULL << feature);
> -}
> -
>  static int
>  print_insn_thumb1(bfd_vma pc, disassemble_info *info)
>  {
> @@ -2515,12 +2505,6 @@ static void arm_max_initfn(Object *obj)
>  
>  #endif /* !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64) */
>  
> -struct ARMCPUInfo {
> -    const char *name;
> -    void (*initfn)(Object *obj);
> -    void (*class_init)(ObjectClass *oc, void *data);
> -};
> -
>  static const ARMCPUInfo arm_cpus[] = {
>  #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
>      { .name = "arm926",      .initfn = arm926_initfn },
> @@ -2681,7 +2665,7 @@ static void cpu_register_class_init(ObjectClass *oc, void *data)
>      acc->info = data;
>  }
>  
> -static void cpu_register(const ARMCPUInfo *info)
> +void arm_cpu_register(const ARMCPUInfo *info)
>  {
>      TypeInfo type_info = {
>          .parent = TYPE_ARM_CPU,
> @@ -2722,7 +2706,7 @@ static void arm_cpu_register_types(void)
>      type_register_static(&idau_interface_type_info);
>  
>      while (info->name) {
> -        cpu_register(info);
> +        arm_cpu_register(info);
>          info++;
>      }
>  
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index d7f5bf610a..5239ba5529 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -21,6 +21,7 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "cpu.h"
> +#include "internals.h"
>  #include "qemu/module.h"
>  #if !defined(CONFIG_USER_ONLY)
>  #include "hw/loader.h"
> @@ -29,16 +30,6 @@
>  #include "kvm_arm.h"
>  #include "qapi/visitor.h"
>  
> -static inline void set_feature(CPUARMState *env, int feature)
> -{
> -    env->features |= 1ULL << feature;
> -}
> -
> -static inline void unset_feature(CPUARMState *env, int feature)
> -{
> -    env->features &= ~(1ULL << feature);
> -}
> -
>  #ifndef CONFIG_USER_ONLY
>  static uint64_t a57_a53_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
>  {
> @@ -396,12 +387,6 @@ static void aarch64_max_initfn(Object *obj)
>      }
>  }
>  
> -struct ARMCPUInfo {
> -    const char *name;
> -    void (*initfn)(Object *obj);
> -    void (*class_init)(ObjectClass *oc, void *data);
> -};
> -
>  static const ARMCPUInfo aarch64_cpus[] = {
>      { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
>      { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 232d963875..e71196ed5f 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1046,4 +1046,22 @@ void arm_log_exception(int idx);
>  
>  #endif /* !CONFIG_USER_ONLY */
>  
> +static inline void set_feature(CPUARMState *env, int feature)
> +{
> +    env->features |= 1ULL << feature;
> +}
> +
> +static inline void unset_feature(CPUARMState *env, int feature)
> +{
> +    env->features &= ~(1ULL << feature);
> +}
> +
> +struct ARMCPUInfo {
> +    const char *name;
> +    void (*initfn)(Object *obj);
> +    void (*class_init)(ObjectClass *oc, void *data);
> +};
> +
> +void arm_cpu_register(const ARMCPUInfo *info);
> +
>  #endif
> 

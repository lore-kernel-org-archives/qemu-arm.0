Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp742368wrx;
        Thu, 28 Feb 2019 08:03:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqyjDVhd4QonF8QgJbBUppezt2WNW1NAqrPN4YwhLNHbUoZ/bslGS09o/sKIb+D3PgKXtKIz
X-Received: by 2002:a25:44d:: with SMTP id 74mr86030ybe.222.1551369793656;
        Thu, 28 Feb 2019 08:03:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551369793; cv=none;
        d=google.com; s=arc-20160816;
        b=WTeymHrVvlopWqu/qyuJpMD8+2eSrynwn8qaTZUm2KSgLMdRUTj/T2JlKlNfWm6i86
         MZ90ar+oRg8ZHNlCswxLqHbpNBa7Ph57qupHgZ0rL3rswnVv/vDXDZK4AGiJgi0XB9+A
         ChTTXUgV+OJp/Y6+x33XGC3IKsvAiDFfEz/yfDJ5NA41mCtu+Qp4I3Gq5RTH6AtyNjau
         eAdGHLDIECX+mRLRtypvDd7EIvr58vaKwENS5OTVSYQQDUABfqewYdzPS+cNhFK7mH2u
         77C9PvLhDf9U6Jsvy9ztEvLvuPuMQGI97I+sacG/K6D6xkz+bQ6kov82sK+iluUdGUXF
         lUew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=nZECdmKHLsLJHaHuZG9DpLKFw0nFKPkjXpZZHT2fefw=;
        b=lNnDUPqfAYKy15ZesgUh5YAYMqDxjSCSMzP5/L5XbyeRNUK29/sh3r7OhS8QOHSrkq
         BL/BnkPt612qkycitT6DY8H6y7t+YnSIsiWSxVcsy5Ai6jzYkyBVgEPA4IjQmj06166T
         hSdO7sCZ0qUsMwjWfOlNTRfuTbGASPqxSbN9Yn/bo2P46i6cnM4OyUfVOJc+ohhSGZjA
         BYUszV4e/8a7D9Q29Cq+5ZYlfPTanfXHvSaOnCPagih2U+PZRf7/WrXPyKn2agNwoRD1
         3D2t2oNRRgeFwyMy9wrPvh09iYs/B6gDmwHgRZECGlch9sWrjFjJR8WCZ7agnfoUeVk/
         +2Sg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18si7532398ywa.234.2019.02.28.08.03.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Feb 2019 08:03:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41287 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzO9R-00086D-35
	for alex.bennee@linaro.org; Thu, 28 Feb 2019 11:03:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzO92-00081D-IU
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 11:03:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzO8y-0004Bs-ND
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 11:02:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33758)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gzO8y-00045K-8S; Thu, 28 Feb 2019 11:02:44 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E1FDB300743A;
	Thu, 28 Feb 2019 16:02:31 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AF72C1001938;
	Thu, 28 Feb 2019 16:02:23 +0000 (UTC)
Date: Thu, 28 Feb 2019 17:02:22 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190228170222.018c917f@redhat.com>
In-Reply-To: <20190228150324.25973-6-eric.auger@redhat.com>
References: <20190228150324.25973-1-eric.auger@redhat.com>
	<20190228150324.25973-6-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 28 Feb 2019 16:02:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v10 05/10] kvm: add
 kvm_arm_get_max_vm_ipa_size
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	dgilbert@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p7xNYeBThB6U

On Thu, 28 Feb 2019 16:03:19 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> Add the kvm_arm_get_max_vm_ipa_size() helper that returns the
> number of bits in the IPA address space supported by KVM.
> 
> This capability needs to be known to create the VM with a
> specific IPA max size (kvm_type passed along KVM_CREATE_VM ioctl.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> ---
> v6 -> v7:
> - s/kvm_arm_get_max_vm_phys_shift/kvm_arm_get_max_vm_ipa_size
> - reword the comment
> 
> v4 -> v5:
> - return 40 if the host does not support the capability
> 
> v3 -> v4:
> - s/s/ms in kvm_arm_get_max_vm_phys_shift function comment
> - check KVM_CAP_ARM_VM_IPA_SIZE extension
> 
> v1 -> v2:
> - put this in ARM specific code
> ---
>  target/arm/kvm.c     | 10 ++++++++++
>  target/arm/kvm_arm.h | 13 +++++++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index e00ccf9c98..79a79f0190 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -18,6 +18,7 @@
>  #include "qemu/error-report.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/kvm.h"
> +#include "sysemu/kvm_int.h"
>  #include "kvm_arm.h"
>  #include "cpu.h"
>  #include "trace.h"
> @@ -162,6 +163,15 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
>      env->features = arm_host_cpu_features.features;
>  }
>  
> +int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
> +{
> +    KVMState *s = KVM_STATE(ms->accelerator);
> +    int ret;
> +
> +    ret = kvm_check_extension(s, KVM_CAP_ARM_VM_IPA_SIZE);
> +    return ret > 0 ? ret : 40;
> +}
> +
>  int kvm_arch_init(MachineState *ms, KVMState *s)
>  {
>      /* For ARM interrupt delivery is always asynchronous,
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 6393455b1d..2a07333c61 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -207,6 +207,14 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf);
>   */
>  void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
>  
> +/**
> + * kvm_arm_get_max_vm_ipa_size - Returns the number of bits in the
> + * IPA address space supported by KVM
> + *
> + * @ms: Machine state handle
> + */
> +int kvm_arm_get_max_vm_ipa_size(MachineState *ms);
> +
>  /**
>   * kvm_arm_sync_mpstate_to_kvm
>   * @cpu: ARMCPU
> @@ -239,6 +247,11 @@ static inline void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
>      cpu->host_cpu_probe_failed = true;
>  }
>  
> +static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
> +{
> +    return -ENOENT;
> +}
> +
>  static inline int kvm_arm_vgic_probe(void)
>  {
>      return 0;


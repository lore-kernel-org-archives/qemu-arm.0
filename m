Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp804864lfg;
        Thu, 11 Mar 2021 17:50:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDHEYjFGZkL42t3Obwsv3QL91CA0NrBgpRd8aJhnC2Bmv4fRTPoA0gOdy6hXtE4EMCKvd9
X-Received: by 2002:a6b:8b0e:: with SMTP id n14mr8659929iod.199.1615513854556;
        Thu, 11 Mar 2021 17:50:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615513854; cv=none;
        d=google.com; s=arc-20160816;
        b=Xh1bbeHxEiiFYsBdQVmEHJ0NEXUMfCou3nVdgHEdygS7T8m0lb4wu9DazIsG0R5OTk
         qld2oO36nYaIGO9K5fwLIhlxm1OaYdYcQxU+EpOFOIuU06/FeqhLJVcuFEdESs17tFsl
         4kU6wzcFccFhHPQ8O65l7pqoPMrned/FQecDU4ppldMdz1nWCfqhg/IpmHD5B810Mc6w
         /C8duxRMXYL0E1AtcJsqrjaveQfpFpmuswjrdiipeWMV0a/L8IWMiwZMq6DlBvAeg6G+
         UpIVPnSMsCpZjljoP/glW3QXEuj5JclvgPQs9DKmxjXeHgOA30rtvS33gJYKifEEtzc/
         v9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+YRj+cxIElRtl6fDeyEAcmUdMlT/WVSlVeQ9CyukZXk=;
        b=pVSGSbzkzyXNd0iXdzp3mlethIF+QUD8VLeGrrItW4fFxznKsuRxDjvPzx8dwkGAGq
         WBdKIHwZfS7mx46O+nTabVI/HEhh0PJZX5kVFWhxJayyVgzxTMwTkpiF4qyO4xOeuLAR
         BON/6zc7dx3k2ShK2rk/+gQRZGtaqJWA02Jg4o3MHKsFrQXyvPT0w2bmfRNQ/uv1hlI/
         3fIO+JdvCswzjMK7LO+dZP35jrst49s3V/H0dk2BVq+0ivnE6uE2tuyvHc9Wf85o7RNA
         G9mQHJ5hMzPdfG81U2WElg2RjeYwHz3m7g+yAkLwnNynv+JVso1KNJEgQMr7KQg1OKnI
         qkrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fESqtAUT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10si4497033jat.118.2021.03.11.17.50.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 17:50:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fESqtAUT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKWx3-0005OC-P4
	for alex.bennee@linaro.org; Thu, 11 Mar 2021 20:50:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lKWwB-0005JF-VN
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 20:49:59 -0500
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:43038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lKWwA-0004SS-90
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 20:49:59 -0500
Received: by mail-il1-x129.google.com with SMTP id b5so1152092ilq.10
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 17:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+YRj+cxIElRtl6fDeyEAcmUdMlT/WVSlVeQ9CyukZXk=;
 b=fESqtAUToPKP/WG9fx6CJmOVKKfnHWX+RB5+c8fbGuh410bRwnw9bDfGNw+XhhB/6A
 fr3/+Aos1J2a3jCFeqB0XedgFJoLIm/QLO51xSal59oh6dQaeeq1cHNn04f7yIk59L9x
 zEy8X/Wv+i4nTWyyjLXmAEjBSEaXkCF9ljH2ONSM0uG0HQfvSors7GuyZP41mJjn0MNy
 xPiS5WadQn/U/ZrpXfL86jLevJrqGOvPkSjP0o7tZ31qWm3P+D9EgBbFZhe9Rq451PxW
 pnqVwAhqnrJ/qzrGh8xaYuCOsGoWcb8Md4Jk8DZBDMSsWAS5UYowmuCzgbRgzwAC1oez
 ANkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+YRj+cxIElRtl6fDeyEAcmUdMlT/WVSlVeQ9CyukZXk=;
 b=Z/9NScQ+4aqbuGBWfJa8ppvnnJCsxRcKFdKVw1LK8M3K/HhP364lrFx6ICL3VFI2By
 EehSmYQuKpmdCDPncrzaGCImQlO2/rX1GIEfooSi3zweosmjg8+DbTQ1qoHn1bVNKtrF
 3D5FUQbz7C3bRvMsBWGVg58pSW7p3e4dpWdltmeowqYj07SQ/i6Ip6RY5Nm3qZ5+0IGe
 tSaMAxGdtScsgfTLe1Wmp7qQYvPxMrpX3nEUySqagB7SF/3BO3pyXPZ2SKPdN6e4PM3u
 WayT5s/CzhmO88QPdhvdKFe90rRyQOeFFraEUnFe9RUUheIL0/rSz05db3JF24pkmiAB
 mdiA==
X-Gm-Message-State: AOAM5305R10x+Zqu+ROcwCi/Gvt90daqxJ/fUUyXBUBCqC4F+4cqzAcL
 aQhNzmBzy5r6/1v0PJfCAcmCqP1CZVOMqx6Gqd2g
X-Received: by 2002:a92:130a:: with SMTP id 10mr1028276ilt.71.1615513797123;
 Thu, 11 Mar 2021 17:49:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1612747873.git.haibo.xu@linaro.org>
 <9c4507258ffe9cea4aeb5e19ef8475cb65230c3d.1612747873.git.haibo.xu@linaro.org>
In-Reply-To: <9c4507258ffe9cea4aeb5e19ef8475cb65230c3d.1612747873.git.haibo.xu@linaro.org>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Fri, 12 Mar 2021 09:49:45 +0800
Message-ID: <CAJc+Z1EJiv-t4Wf4Kjho=P+VfW0+9SZuWcHtBS9-oevhT-odVg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/5] Add basic MTE support to KVM guest
To: Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=haibo.xu@linaro.org; helo=mail-il1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V8KvuKxPg/nK

++ more migration experts!

On Mon, 8 Feb 2021 at 11:20, Haibo Xu <haibo.xu@linaro.org> wrote:
>
> Enable the virt machine feature "mte" to work with
> KVM guest. This feature is still hiden from the user
> in this patch, and will be available in a later patch.
>
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  hw/arm/virt.c      | 22 +++++++++++-----------
>  target/arm/cpu.c   |  2 +-
>  target/arm/kvm.c   |  9 +++++++++
>  target/arm/kvm64.c |  7 +++++++
>  4 files changed, 28 insertions(+), 12 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 399da73454..623d5e9397 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1974,18 +1974,18 @@ static void machvirt_init(MachineState *machine)
>          }
>
>          if (vms->mte) {
> +            /*
> +             * The property exists only if MemTag is supported.
> +             * If it is, we must allocate the ram to back that up.
> +             */
> +            if (!object_property_find(cpuobj, "tag-memory")) {
> +                error_report("MTE requested, but not supported "
> +                             "by the guest CPU");
> +                exit(1);
> +            }
> +
>              /* Create the memory region only once, but link to all cpus. */
> -            if (!tag_sysmem) {
> -                /*
> -                 * The property exists only if MemTag is supported.
> -                 * If it is, we must allocate the ram to back that up.
> -                 */
> -                if (!object_property_find(cpuobj, "tag-memory")) {
> -                    error_report("MTE requested, but not supported "
> -                                 "by the guest CPU");
> -                    exit(1);
> -                }
> -
> +            if (!tag_sysmem && !kvm_enabled()) {
>                  tag_sysmem = g_new(MemoryRegion, 1);
>                  memory_region_init(tag_sysmem, OBJECT(machine),
>                                     "tag-memory", UINT64_MAX / 32);
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 40142ac141..50f3223944 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1831,7 +1831,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>                                 cpu->secure_memory);
>      }
>
> -    if (cpu->tag_memory != NULL) {
> +    if (cpu->tag_memory != NULL && !kvm_enabled()) {
>          cpu_address_space_init(cs, ARMASIdx_TagNS, "cpu-tag-memory",
>                                 cpu->tag_memory);
>          if (has_secure) {
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index ffe186de8d..33630b2b70 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -32,6 +32,7 @@
>  #include "hw/boards.h"
>  #include "hw/irq.h"
>  #include "qemu/log.h"
> +#include "hw/arm/virt.h"
>
>  const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>      KVM_CAP_LAST_INFO
> @@ -272,6 +273,14 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>          }
>      }
>
> +    if (kvm_check_extension(s, KVM_CAP_ARM_MTE) &&
> +        object_dynamic_cast(OBJECT(ms), TYPE_VIRT_MACHINE) &&
> +        VIRT_MACHINE(ms)->mte) {
> +            if (kvm_vm_enable_cap(s, KVM_CAP_ARM_MTE, 0)) {
> +                error_report("Failed to enable KVM_CAP_ARM_MTE cap");
> +            }
> +    }
> +
>      return ret;
>  }
>
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 3c37fc4fb6..23f34034db 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -500,6 +500,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>       */
>      int fdarray[3];
>      bool sve_supported;
> +    bool mte_supported;
>      uint64_t features = 0;
>      uint64_t t;
>      int err;
> @@ -646,6 +647,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>      }
>
>      sve_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE) > 0;
> +    mte_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_MTE) > 0;
>
>      kvm_arm_destroy_scratch_host_vcpu(fdarray);
>
> @@ -659,6 +661,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>          t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
>          ahcf->isar.id_aa64pfr0 = t;
>      }
> +    if (mte_supported) {
> +        t = ahcf->isar.id_aa64pfr1;
> +        t = FIELD_DP64(t, ID_AA64PFR1, MTE, 2);
> +        ahcf->isar.id_aa64pfr1 = t;
> +    }
>
>      /*
>       * We can assume any KVM supporting CPU is at least a v8
> --
> 2.17.1
>

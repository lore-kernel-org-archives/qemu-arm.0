Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1360160lfp;
        Thu, 6 Feb 2020 04:10:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqzbzJCukgMq1xBDJ1jREUgEyMLjtG4iAOI2A98Ypo/gRR3aY38hR2eXJodvnqNZr2wWidxN
X-Received: by 2002:ac8:6f5b:: with SMTP id n27mr2158276qtv.96.1580991015250;
        Thu, 06 Feb 2020 04:10:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580991015; cv=none;
        d=google.com; s=arc-20160816;
        b=vcPbiuCksfZy2qXeIxQz24NAXFu1Jse0dhYZ6w9Vb9Vig4r/plLLjuyGzOixQNYXB1
         u73ujLnyyJ0Utfb/yhFhsfQqB1+wYeHuM+myv9BeppV+8nnRUIdlxtBB1ngxN1NUXl9u
         ZqQONv3QUNcL0O8Jbo4JoG7gLiO7b7yjdn9PBbsZg+mkkvaYdNTw8+8qLOfNUEWLl7aY
         hTNMkO2bQC+YyvEFmz5rlbilnnRZpGTQhfT+LCj5l62BsQaaEiqS6i4xhAVEw1lkAu2i
         HToCd38hsd8IQ9vYZoU4JuZmCu779Tn3NHDbNorisnU/Pgppodu/5SOsXlFkMiLL+EFp
         d7Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=LWlfvFY4xRhF+qWxBlsQcKyBZisPGZz72spey4VRmnA=;
        b=vY6FQkRYeOSdeMmBBO8wseIO0koV5wi640MboRSXnAT/qsRRRUSZT+oIUvJNeXb70K
         ROUyxra/yU/8SipDFvefc+kobhFl9Upcbr2WSbossO+81+NtUaZ+fluZBJXms6A21g4V
         gEa1PgIaqGK6VmGzjrJSFBnOwsEGKSQLwI3M4JpqP4NiAAIsT80rQ58opGS+TH4iVD/v
         mt3KZ1QOSaNs0qEQmWFVgLQgz6A0HKwBzYaUhfER60TQ+ZKYor55wKOFkkD03z/6BDxO
         v+mJxKUdyOVSxWJnQ/bFG0zDzz2r9pqL2qlulw+I9//D5IClLGQUCyC1rZZVnrbtybRU
         zr1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JxH17LjX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17si1357011qvw.172.2020.02.06.04.10.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 04:10:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JxH17LjX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izfz4-0001CH-II
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 07:10:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59622)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pmathieu@redhat.com>) id 1izfy4-0000Lf-IY
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 07:09:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pmathieu@redhat.com>) id 1izfy2-0001WH-18
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 07:09:11 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:32471
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pmathieu@redhat.com>) id 1izfy1-0001V0-T8
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 07:09:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580990949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LWlfvFY4xRhF+qWxBlsQcKyBZisPGZz72spey4VRmnA=;
 b=JxH17LjXVcW5GdAS2N3H/QOqcPhfvsEJszFk+0spkNcyH8PNIFzEfrP2v93D0nfEWr3RJW
 9LQWpStxz2q4N9W8ghp73rEEyDyKV3HILLQh68ZbqehsRBFq2QXAPoPjQAZ7qKG0Lg6PXA
 vLqTHpdOQ7VaeZakMyKrknkzBa4D1Ls=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-jtG5ANmUMnCCP8VTGf7gmQ-1; Thu, 06 Feb 2020 07:09:07 -0500
Received: by mail-wr1-f69.google.com with SMTP id t3so3242943wrm.23
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2020 04:09:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4R5VEi7Eux/3b8TYzDdRrjrRIoKfwPspvyKCE7QZHEA=;
 b=MloQMA+AyXFAI+/C5q7R5g9dIsNg9+kB4sBN97sLy3fYaIlSVpguqiML8MM3Zm5T3Y
 4ZNuhze5oUprpfvdPIkV+FUhUb/+1ROG+xmmO1/jAAnR/5NjvHfNnxbC4fQ+gHPuVmzK
 cDngH0ishaM/cqLFgKrSFV6eGKXeOpXEZQtF46h9BL4b/pto9O3fVOkcY6q/7L0A4iNE
 2b2636JDtSj/unI+hSILwk5GULXYL1IyMCdMlzr2L3JruAVnry/au9PTqF42c3L7PuiN
 a5RLFd2gD5O9IVE+RbCv/jLNzxagqlkkq3If+eDcAyCkOjEW2QxLFTTGT3Pin9GELrNF
 Y6jg==
X-Gm-Message-State: APjAAAWC3kwVJ8NsA1penByBLOg7g9nGzYqC9I9SdgoBe7eTkfEQ2dbe
 u51tcyWH4VMD4rdlHbeLtP4Gh/oJ/hdKhHPOzEraRYMC1yRykJATGTnmV9xir/vwrERhVOj2iDW
 yE6EM/csfMkvLzfpKg2Q2VLz7kAvQ+58=
X-Received: by 2002:a7b:c459:: with SMTP id l25mr4155205wmi.17.1580990944667; 
 Thu, 06 Feb 2020 04:09:04 -0800 (PST)
X-Received: by 2002:a7b:c459:: with SMTP id l25mr4155179wmi.17.1580990944341; 
 Thu, 06 Feb 2020 04:09:04 -0800 (PST)
MIME-Version: 1.0
References: <20191212173320.11610-1-drjones@redhat.com>
 <20191212173320.11610-6-drjones@redhat.com>
In-Reply-To: <20191212173320.11610-6-drjones@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Thu, 6 Feb 2020 13:08:53 +0100
Message-ID: <CAP+75-Vt3apV8i64oFTC6pAATXkrE1g+tVskr_3ohBHtZ1LNdQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 5/5] target/arm/cpu: Add the kvm-no-adjvtime CPU
 property
To: Andrew Jones <drjones@redhat.com>
X-MC-Unique: jtG5ANmUMnCCP8VTGf7gmQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>, bijan.mottahedeh@oracle.com,
 Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 guoheyi@huawei.com, msys.mizuma@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KlyirjmMx6UQ

Hi Drew,

On Thu, Dec 12, 2019 at 7:27 PM Andrew Jones <drjones@redhat.com> wrote:
> kvm-no-adjvtime is a KVM specific CPU property and a first of its kind.
> To accommodate it we also add kvm_arm_add_vcpu_properties() and a
> KVM specific CPU properties description to the CPU features document.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  docs/arm-cpu-features.rst | 31 ++++++++++++++++++++++++++++++-
>  hw/arm/virt.c             |  8 ++++++++
>  include/hw/arm/virt.h     |  1 +
>  target/arm/cpu.c          |  2 ++
>  target/arm/cpu64.c        |  1 +
>  target/arm/kvm.c          | 28 ++++++++++++++++++++++++++++
>  target/arm/kvm_arm.h      | 11 +++++++++++
>  target/arm/monitor.c      |  1 +
>  tests/arm-cpu-features.c  |  4 ++++
>  9 files changed, 86 insertions(+), 1 deletion(-)
>
[...]
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index cb7041e9677a..e9a08eb883bf 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1664,6 +1664,11 @@ static void machvirt_init(MachineState *machine)
>              }
>          }
>
> +        if (vmc->kvm_no_adjvtime &&
> +            object_property_find(cpuobj, "kvm-no-adjvtime", NULL)) {
> +            object_property_set_bool(cpuobj, true, "kvm-no-adjvtime", NU=
LL);
> +        }
> +
>          if (vmc->no_pmu && object_property_find(cpuobj, "pmu", NULL)) {
>              object_property_set_bool(cpuobj, false, "pmu", NULL);
>          }
> @@ -2154,8 +2159,11 @@ DEFINE_VIRT_MACHINE_AS_LATEST(5, 0)
>
>  static void virt_machine_4_2_options(MachineClass *mc)
>  {
> +    VirtMachineClass *vmc =3D VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> +
>      virt_machine_5_0_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_4_2, hw_compat_4_2_len)=
;
> +    vmc->kvm_no_adjvtime =3D true;
>  }
>  DEFINE_VIRT_MACHINE(4, 2)
>
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 0b41083e9d5c..80e00161b8f2 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -109,6 +109,7 @@ typedef struct {
>      bool smbios_old_sys_ver;
>      bool no_highmem_ecam;
>      bool no_ged;   /* Machines < 4.2 has no support for ACPI GED device =
*/
> +    bool kvm_no_adjvtime;
>  } VirtMachineClass;
>
>  typedef struct {
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 7a4ac9339bf9..53c73c25a67f 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2482,6 +2482,7 @@ static void arm_max_initfn(Object *obj)
>
>      if (kvm_enabled()) {
>          kvm_arm_set_cpu_features_from_host(cpu);
> +        kvm_arm_add_vcpu_properties(obj);
>      } else {
>          cortex_a15_initfn(obj);
>
> @@ -2673,6 +2674,7 @@ static void arm_host_initfn(Object *obj)
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>          aarch64_add_sve_properties(obj);
>      }
> +    kvm_arm_add_vcpu_properties(obj);
>      arm_cpu_post_init(obj);
>  }
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index a39d6fcea34f..3cd416db8089 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -605,6 +605,7 @@ static void aarch64_max_initfn(Object *obj)
>
>      if (kvm_enabled()) {
>          kvm_arm_set_cpu_features_from_host(cpu);
> +        kvm_arm_add_vcpu_properties(obj);
>      } else {
>          uint64_t t;
>          uint32_t u;
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index a55fe7d7aefd..7666b250ab96 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -17,6 +17,8 @@
>  #include "qemu/timer.h"
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
> +#include "qom/object.h"
> +#include "qapi/error.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/kvm_int.h"
> @@ -179,6 +181,32 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
>      env->features =3D arm_host_cpu_features.features;
>  }
>
> +static bool kvm_no_adjvtime_get(Object *obj, Error **errp)
> +{
> +    return !ARM_CPU(obj)->kvm_adjvtime;
> +}
> +
> +static void kvm_no_adjvtime_set(Object *obj, bool value, Error **errp)
> +{
> +    ARM_CPU(obj)->kvm_adjvtime =3D !value;
> +}
> +
> +/* KVM VCPU properties should be prefixed with "kvm-". */
> +void kvm_arm_add_vcpu_properties(Object *obj)
> +{
> +    if (!kvm_enabled()) {

This can't happen, right? Can we turn that into an assertion, or
remove the check?

> +        return;
> +    }
> +
> +    ARM_CPU(obj)->kvm_adjvtime =3D true;
> +    object_property_add_bool(obj, "kvm-no-adjvtime", kvm_no_adjvtime_get=
,
> +                             kvm_no_adjvtime_set, &error_abort);
> +    object_property_set_description(obj, "kvm-no-adjvtime",
> +                                    "Set on to disable the adjustment of=
 "
> +                                    "the virtual counter. VM stopped tim=
e "
> +                                    "will be counted.", &error_abort);
> +}
> +
>  bool kvm_arm_pmu_supported(CPUState *cpu)
>  {
>      KVMState *s =3D KVM_STATE(current_machine->accelerator);
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 16b53e45377d..7d76f26beaca 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -232,6 +232,15 @@ void kvm_arm_sve_get_vls(CPUState *cs, unsigned long=
 *map);
>   */
>  void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
>
> +/**
> + * void kvm_arm_add_vcpu_properties:
> + * @obj: The CPU object to add the properties to
> + *
> + * Add all KVM specific CPU properties to the CPU object. These
> + * are the CPU properties with "kvm-" prefixed names.
> + */
> +void kvm_arm_add_vcpu_properties(Object *obj);
> +
>  /**
>   * void kvm_arm_get_virtual_time:
>   * @cs: CPUState
> @@ -319,6 +328,8 @@ static inline void kvm_arm_set_cpu_features_from_host=
(ARMCPU *cpu)
>      cpu->host_cpu_probe_failed =3D true;
>  }
>
> +static inline void kvm_arm_add_vcpu_properties(Object *obj) {}
> +
>  static inline bool kvm_arm_aarch32_supported(CPUState *cs)
>  {
>      return false;
> diff --git a/target/arm/monitor.c b/target/arm/monitor.c
> index fa054f8a369c..9725dfff16d4 100644
> --- a/target/arm/monitor.c
> +++ b/target/arm/monitor.c
> @@ -103,6 +103,7 @@ static const char *cpu_model_advertised_features[] =
=3D {
>      "sve128", "sve256", "sve384", "sve512",
>      "sve640", "sve768", "sve896", "sve1024", "sve1152", "sve1280",
>      "sve1408", "sve1536", "sve1664", "sve1792", "sve1920", "sve2048",
> +    "kvm-no-adjvtime",
>      NULL
>  };
>
> diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
> index 06ed05e934e6..738e49447377 100644
> --- a/tests/arm-cpu-features.c
> +++ b/tests/arm-cpu-features.c
> @@ -435,6 +435,8 @@ static void test_query_cpu_model_expansion(const void=
 *data)
>      assert_has_feature_enabled(qts, "cortex-a15", "pmu");
>      assert_has_not_feature(qts, "cortex-a15", "aarch64");
>
> +    assert_has_not_feature(qts, "max", "kvm-no-adjvtime");
> +
>      if (g_str_equal(qtest_get_arch(), "aarch64")) {
>          assert_has_feature_enabled(qts, "max", "aarch64");
>          assert_has_feature_enabled(qts, "max", "sve");
> @@ -469,6 +471,8 @@ static void test_query_cpu_model_expansion_kvm(const =
void *data)
>          return;
>      }
>
> +    assert_has_feature_disabled(qts, "host", "kvm-no-adjvtime");
> +
>      if (g_str_equal(qtest_get_arch(), "aarch64")) {
>          bool kvm_supports_sve;
>          char max_name[8], name[8];
> --
> 2.21.0
>
>


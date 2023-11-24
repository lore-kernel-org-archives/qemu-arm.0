Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp1434151ejj;
        Fri, 24 Nov 2023 10:24:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdWw4YrRxXAprZOMLO1WM0jbhQzw/kVHOfYlaSFqUAtVa8qArxxifrltyGAdeiJ9MuTxKE
X-Received: by 2002:a05:6871:54a:b0:1fa:170f:5277 with SMTP id t10-20020a056871054a00b001fa170f5277mr878034oal.50.1700850289648;
        Fri, 24 Nov 2023 10:24:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700850289; cv=none;
        d=google.com; s=arc-20160816;
        b=eOm1duLs1f5BsNO4kGfVZGSn2fIBDJRkTTqb1WqaxK5SNdDoy0sJPdBAp7PGxKIF5S
         XyLme5Ri8Tt3uUMYzZwBMneil6AqZyAFHB2JyrV70N6RRhP39UZ/N3w4s7g7qb2KvPyr
         DA1Os1gxm73545IyZCTFfZIWhRViUBwUyMOUOAHDpliQz6Vg1PQ/25KZxSyrSXWVvGpK
         oJXF21gBlexK+0+8st+h1V652H4lZEGOjgGFjqjzOlHq4PNlvYT0DFdjw3hoIXA14UXN
         7jqZOGG6Du2AyRlfA2GtM6USUvaqX0+IhQ7+KVmyTTz21JzEAr8dmoETUDMVSOyh511O
         LlmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sQNKNBWeod2+64J8ErFDWPzg6uRfL5WI32OFBNWO8sg=;
        fh=+3IlVeQbp/7rLNMJo//VwghB1XgM/rw4vsWjdeqG6wg=;
        b=qR+YMTJogGh1ifxJALH+CSaebmjw/FluAO5vBL2bLqcFUgYNkMj3fPMsnwFm6uUoFP
         y9B1qSOTfQUZLA2GXQhBkOZrPK12K/9ZdJjJXuVTL4rttGhq0Ok9zF+xfpMLWWKNC1FU
         phHoaX68mqh+fgX2ehvWiWQqFHrLtKR4S7ZbBe3o/ncYI9RHTZb3f9YfxlyMbWBG8VMe
         cYQeNeBOvJm2q+33WK/PejfZo4EGbFDg+78rrTiO8klbdkHB5xVOne/e+CLVS4Qd1xvU
         1fz8oruBV+thaWTttwQOeimNrB5KelVDFAaKD/NR2IBfQkODAvQFKA2xuWi39cO1ir2s
         fWGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eFD5qpEI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fc17-20020a05622a489100b0042393e026basi2713472qtb.478.2023.11.24.10.24.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Nov 2023 10:24:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eFD5qpEI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r6aqk-0005wP-Mx; Fri, 24 Nov 2023 13:24:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1r6aqj-0005ub-2R
 for qemu-arm@nongnu.org; Fri, 24 Nov 2023 13:24:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1r6aqg-0001Cz-Ou
 for qemu-arm@nongnu.org; Fri, 24 Nov 2023 13:24:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700850257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sQNKNBWeod2+64J8ErFDWPzg6uRfL5WI32OFBNWO8sg=;
 b=eFD5qpEIkGxqfcjlVW3t2Z6NANZQfG4K+a7IBJb8MhCS0AeTAVolMctl6mMZZixbFCjIk2
 rtrC2J0VjYOPQRA01kITRrBOE5PzYAkoqpSW1vbRxJvJbN98SdybQeHpB8LaEPvwEi2Zrg
 8r+dcpgklV1JPc1lN1FAJy45uXj/S0Y=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-bHrbTBmZOCaKnnJEaOt5UQ-1; Fri, 24 Nov 2023 13:24:15 -0500
X-MC-Unique: bHrbTBmZOCaKnnJEaOt5UQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-77d6bade8d4so257466785a.1
 for <qemu-arm@nongnu.org>; Fri, 24 Nov 2023 10:24:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700850255; x=1701455055;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sQNKNBWeod2+64J8ErFDWPzg6uRfL5WI32OFBNWO8sg=;
 b=lfYDRjoE2fbDJ77wscpgW8byqRojqxpT6xbD2RWMoep7Xvfbo4iR9WuAmO8upEOiMw
 hWMQzAPwuC424kpWiz6qN2JHMAggNrXoXPXkK7RJj3M01rWM0H1ES/1UIg891HtSqZQC
 ALcTpPRwVtdriyOWYabBCMiYOQrevG9atFdy1czu4smis1G5mjuIycbyno2a9FlMtQKq
 1zWt1QNI642iLklC7SB+FBTzIFi3KnY8XuE17BgKalYOVk9DWmR4hnUUXf6xBxsXI1iK
 XWGWtdeuz04l+AabL38F31J8GeJQoJlxqsoBRZAPef3vjpguLHu99tlve98LJcvpM/ZD
 v3OQ==
X-Gm-Message-State: AOJu0Yy9GqBFnUVbCWpHou+o11ttKVw0wMD9iH8zhXcjmuZ+NMEGZr6g
 KcAfMT0RPg1JCoR6PYjDTnCvyCT3vIqv1oEBlt1D61Ge2RgqX5Iw8DO7fSPsdHJMkHhDeBODzwP
 LY6DVG/pB+7l8
X-Received: by 2002:a05:620a:8b0a:b0:77d:72b8:cc32 with SMTP id
 qw10-20020a05620a8b0a00b0077d72b8cc32mr3099365qkn.14.1700850255075; 
 Fri, 24 Nov 2023 10:24:15 -0800 (PST)
X-Received: by 2002:a05:620a:8b0a:b0:77d:72b8:cc32 with SMTP id
 qw10-20020a05620a8b0a00b0077d72b8cc32mr3099349qkn.14.1700850254706; 
 Fri, 24 Nov 2023 10:24:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 py18-20020a05620a879200b007671678e325sm1398466qkn.88.2023.11.24.10.24.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 10:24:14 -0800 (PST)
Message-ID: <d9e83b7a-0fca-406f-b58e-9014a5e14870@redhat.com>
Date: Fri, 24 Nov 2023 19:24:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm/kvm: Enable support for KVM_ARM_VCPU_PMU_V3_FILTER
To: Shaoqin Huang <shahuang@redhat.com>, qemu-arm@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org
References: <20231117060838.39723-1-shahuang@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20231117060838.39723-1-shahuang@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: cQnq3upmWwMo

Hi,

On 11/17/23 07:08, Shaoqin Huang wrote:
> The KVM_ARM_VCPU_PMU_V3_FILTER provide the ability to let the VMM decide
> which PMU events are provided to the guest. Add a new option
> `pmu-filter` as -accel sub-option to set the PMU Event Filtering.
> 
> The `pmu-filter` has such format:
> 
>   pmu-filter="{A,D}:start-end[;{A,D}:start-end...]"
> 
> The A means "allow" and D means "deny", start is the first event of the
> range and the end is the last one. The first filter action defines if the whole
> event list is an allow or deny list, if the first filter action is "allow", all
> other events are denied except start-end; if the first filter action is "deny",
> all other events are allowed except start-end. For example:
> 
>   pmu-filter="A:0x11-0x11;A:0x23-0x3a,D:0x30-0x30"
> 
> This will allow event 0x11 (The cycle counter), events 0x23 to 0x3a is
> also allowed except the event 0x30 is denied, and all the other events
> are disallowed.
> 
> Here is an real example shows how to use the PMU Event Filtering, when
> we launch a guest by use kvm, add such command line:
> 
>   # qemu-system-aarch64 \
> 	-accel kvm,pmu-filter="D:0x11-0x11"
> 
> And then in guest, use the perf to count the cycle:
> 
>   # perf stat sleep 1
> 
>    Performance counter stats for 'sleep 1':
> 
>               1.22 msec task-clock                       #    0.001 CPUs utilized
>                  1      context-switches                 #  820.695 /sec
>                  0      cpu-migrations                   #    0.000 /sec
>                 55      page-faults                      #   45.138 K/sec
>    <not supported>      cycles
>            1128954      instructions
>             227031      branches                         #  186.323 M/sec
>               8686      branch-misses                    #    3.83% of all branches
> 
>        1.002492480 seconds time elapsed
> 
>        0.001752000 seconds user
>        0.000000000 seconds sys
> 
> As we can see, the cycle counter has been disabled in the guest, but
> other pmu events are still work.
> 
> Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
> ---
> v1->v2:
>   - Add more description for allow and deny meaning in 
>     commit message.                                     [Sebastian]
>   - Small improvement.                                  [Sebastian]
> 
> v1: https://lore.kernel.org/all/20231113081713.153615-1-shahuang@redhat.com/
> ---
>  include/sysemu/kvm_int.h |  1 +
>  qemu-options.hx          | 16 +++++++++++++
>  target/arm/kvm.c         | 22 +++++++++++++++++
>  target/arm/kvm64.c       | 51 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 90 insertions(+)
> 
> diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
> index fd846394be..8f4601474f 100644
> --- a/include/sysemu/kvm_int.h
> +++ b/include/sysemu/kvm_int.h
> @@ -120,6 +120,7 @@ struct KVMState
>      uint32_t xen_caps;
>      uint16_t xen_gnttab_max_frames;
>      uint16_t xen_evtchn_max_pirq;
> +    char *kvm_pmu_filter;
>  };
>  
>  void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 42fd09e4de..dd3518092c 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -187,6 +187,7 @@ DEF("accel", HAS_ARG, QEMU_OPTION_accel,
>      "                tb-size=n (TCG translation block cache size)\n"
>      "                dirty-ring-size=n (KVM dirty ring GFN count, default 0)\n"
>      "                eager-split-size=n (KVM Eager Page Split chunk size, default 0, disabled. ARM only)\n"
> +    "                pmu-filter={A,D}:start-end[;...] (KVM PMU Event Filter, default no filter. ARM only)\n"
>      "                notify-vmexit=run|internal-error|disable,notify-window=n (enable notify VM exit and set notify window, x86 only)\n"
>      "                thread=single|multi (enable multi-threaded TCG)\n", QEMU_ARCH_ALL)
>  SRST
> @@ -259,6 +260,21 @@ SRST
>          impact on the memory. By default, this feature is disabled
>          (eager-split-size=0).
>  
> +    ``pmu-filter={A,D}:start-end[;...]``
> +        KVM implements pmu event filtering to prevent a guest from being able to
> +	sample certain events. It has the following format:
> +
> +	pmu-filter="{A,D}:start-end[;{A,D}:start-end...]"
> +
> +	The A means "allow" and D means "deny", start if the first event of the
> +	range and the end is the last one. For example:
> +
> +	pmu-filter="A:0x11-0x11;A:0x23-0x3a,D:0x30-0x30"
> +
> +	This will allow event 0x11 (The cycle counter), events 0x23 to 0x3a is
> +	also allowed except the event 0x30 is denied, and all the other events
> +	are disallowed.
> +
>      ``notify-vmexit=run|internal-error|disable,notify-window=n``
>          Enables or disables notify VM exit support on x86 host and specify
>          the corresponding notify window to trigger the VM exit if enabled.
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 7903e2ddde..74796de055 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -1108,6 +1108,21 @@ static void kvm_arch_set_eager_split_size(Object *obj, Visitor *v,
>      s->kvm_eager_split_size = value;
>  }
>  
> +static char *kvm_arch_get_pmu_filter(Object *obj, Error **errp)
> +{
> +    KVMState *s = KVM_STATE(obj);
> +
> +    return g_strdup(s->kvm_pmu_filter);
> +}
> +
> +static void kvm_arch_set_pmu_filter(Object *obj, const char *pmu_filter,
> +                                    Error **errp)
> +{
> +    KVMState *s = KVM_STATE(obj);
> +
> +    s->kvm_pmu_filter = g_strdup(pmu_filter);
> +}
> +
>  void kvm_arch_accel_class_init(ObjectClass *oc)
>  {
>      object_class_property_add(oc, "eager-split-size", "size",
> @@ -1116,4 +1131,11 @@ void kvm_arch_accel_class_init(ObjectClass *oc)
>  
>      object_class_property_set_description(oc, "eager-split-size",
>          "Eager Page Split chunk size for hugepages. (default: 0, disabled)");
> +
> +    object_class_property_add_str(oc, "pmu-filter",
> +                                  kvm_arch_get_pmu_filter,
> +                                  kvm_arch_set_pmu_filter);
> +
> +    object_class_property_set_description(oc, "pmu-filter",
> +        "PMU Event Filtering description for guest pmu. (default: NULL, disabled)");
>  }
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 3c175c93a7..6eac328b48 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -10,6 +10,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include <asm-arm64/kvm.h>
>  #include <sys/ioctl.h>
>  #include <sys/ptrace.h>
>  
> @@ -131,6 +132,53 @@ static bool kvm_arm_set_device_attr(CPUState *cs, struct kvm_device_attr *attr,
>      return true;
>  }
>  
> +static void kvm_arm_pmu_filter_init(CPUState *cs)
> +{
> +    static bool pmu_filter_init = false;
> +    struct kvm_pmu_event_filter filter;
> +    struct kvm_device_attr attr = {
> +        .group      = KVM_ARM_VCPU_PMU_V3_CTRL,
> +        .attr       = KVM_ARM_VCPU_PMU_V3_FILTER,
> +        .addr       = (uint64_t)&filter,
> +    };
> +    KVMState *kvm_state = cs->kvm_state;
> +    char *tmp;
> +    char *str, act;
> +
> +    if (!kvm_state->kvm_pmu_filter)
> +        return;
> +
usually we check the kernel capability (here KVM_CAP_ARM_PMU_V3) before
doing further actions. It allows you to give an inidication to the user
that the kernel does not allow it. Also you should precise in the doc
that this accel option requires host kernel caps I think.
> +    /* This only needs to be called for 1 vcpu. */
> +    if (!pmu_filter_init)
> +        pmu_filter_init = true;
> +
> +    tmp = g_strdup(kvm_state->kvm_pmu_filter);
> +
> +    for (str = strtok(tmp, ";"); str != NULL; str = strtok(NULL, ";")) {
> +        unsigned short start = 0, end = 0;
> +
> +        sscanf(str, "%c:%hx-%hx", &act, &start, &end);
> +        if ((act != 'A' && act != 'D') || (!start && !end)) {
> +            error_report("skipping invalid filter %s\n", str);
> +            continue;
> +        }
> +
> +        filter = (struct kvm_pmu_event_filter) {
> +            .base_event     = start,
> +            .nevents        = end - start + 1,
> +            .action         = act == 'A' ? KVM_PMU_EVENT_ALLOW :
> +                                           KVM_PMU_EVENT_DENY,
> +        };
> +
> +        if (!kvm_arm_set_device_attr(cs, &attr, "PMU Event Filter")) {
> +            error_report("Failed to init PMU Event Filter\n");
if you do the above, here you know that the host allows to set filters
but that the user input is incorrect.

Thanks

Eric
> +            abort();
> +        }
> +    }
> +
> +    g_free(tmp);
> +}
> +
>  void kvm_arm_pmu_init(CPUState *cs)
>  {
>      struct kvm_device_attr attr = {
> @@ -141,6 +189,9 @@ void kvm_arm_pmu_init(CPUState *cs)
>      if (!ARM_CPU(cs)->has_pmu) {
>          return;
>      }
> +
> +    kvm_arm_pmu_filter_init(cs);
> +
>      if (!kvm_arm_set_device_attr(cs, &attr, "PMU")) {
>          error_report("failed to init PMU");
>          abort();


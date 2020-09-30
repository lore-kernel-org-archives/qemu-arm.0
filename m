Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5314089lfq;
        Wed, 30 Sep 2020 01:40:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtOC+g4K6MP0yt1NlJX0w2m2rx2NQ7bHunhGpVFM3z38Cl0IAwe66GAVS9OQiv8s4u9A6m
X-Received: by 2002:a25:33c4:: with SMTP id z187mr1713583ybz.27.1601455206953;
        Wed, 30 Sep 2020 01:40:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601455206; cv=none;
        d=google.com; s=arc-20160816;
        b=yhRVg/liMu85QqggJIqv6Z3zEOKBW0aeG9iCCxc4MvA692ehXLHafvpSgh25nfBDR7
         YKbmqxlGq1C3PpOve70FKtuBt4o7U1FoEpIcQSdvz+Tq3FfEDV90Un3BQi0LmRrl1r3l
         fCqDawQOVbQQAKWWifjN90hBT/2YW2N/wcmO6QArwSCTCcYwxLgCWpf7dEuR7jeWR1kM
         KuZ+D6a0cCEoZeF8u4Zo7ndxbJrfBgzSmmo4cJOmNWgzqhtkknjrGgbBTzotvweDtQPm
         xaYdHMMYGhx2DVdZUmOlO7D5dGNMTMMyJOJFNavQlM5xMn0cnnKMt7NtdL2B7O0utbVL
         HAhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=hT16yEm/XJJBR5dcNHMvxBxWnX83JyTH5ezRhnmbZ1g=;
        b=JA8PV9vQuWG17ebOP3hoGkiRhRBXGM7uY0pbAl3D/9QP0BFqr8BiyHffDE36uB6Ax4
         1TzcfPXnjQhj0hGLBHFfFmVweD5HJu6oG5jaIY3iIWB+lpcXQk9WVbdkTu+euQ50MbGU
         ES5RQaDgemVNL+E3up0QE4+pKYMsK40WbWCpTW8WjZ45BelpwVH+CUWeiDq3wnRYcDXu
         qOy74U7r8naF5+QBOSxApSI6WlPht2akGS4boEs+MWxndqAmAouICNDvFS0j8NhK/4px
         In7o5AtA4d/T8VY07F3M/b0Q9KCqUw1388Cfb+38sFHojRq8bxPFwTVvb8HbjYNXKGz5
         KR6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FN4fV5BU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7si906922ybo.426.2020.09.30.01.40.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 01:40:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FN4fV5BU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNXeg-0000FW-AM
	for alex.bennee@linaro.org; Wed, 30 Sep 2020 04:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kNXeA-0000E7-RO
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 04:39:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kNXe9-0007fO-5X
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 04:39:34 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601455172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hT16yEm/XJJBR5dcNHMvxBxWnX83JyTH5ezRhnmbZ1g=;
 b=FN4fV5BUXvVHHLcVJ1Ma2ZOtZoi7wcgWLqsy3d1uaPP6LZsl0XhwYLiYMXVt5YCJPE8YAw
 cRzJzT6CFwSQ+5NIK2qVjG0oMNqp21uXfGdnD7aBmPL+ED9yaFSDYWzrjorhdyqsO+tsNT
 4dZi7M6YK2dGgg96zejSHZyfYt3qz48=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-wu501G9hOH64Knj9pz18tQ-1; Wed, 30 Sep 2020 04:39:30 -0400
X-MC-Unique: wu501G9hOH64Knj9pz18tQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8ED0B1868421;
 Wed, 30 Sep 2020 08:39:29 +0000 (UTC)
Received: from [10.36.113.210] (ovpn-113-210.ams2.redhat.com [10.36.113.210])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FEA610013BD;
 Wed, 30 Sep 2020 08:39:28 +0000 (UTC)
Subject: Re: [PATCH v3 3/5] hw/arm/virt: Move kvm pmu setup to
 virt_cpu_post_init
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20200916092620.19161-1-drjones@redhat.com>
 <20200916092620.19161-4-drjones@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <b2170ffe-ce3f-10c7-37ab-fb0a6b7d0e0a@redhat.com>
Date: Wed, 30 Sep 2020 10:39:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200916092620.19161-4-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:26:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +FtnTAxs6I7z

Hi Drew,

On 9/16/20 11:26 AM, Andrew Jones wrote:
> Move the KVM PMU setup part of fdt_add_pmu_nodes() to
> virt_cpu_post_init(), which is a more appropriate location. Now
> fdt_add_pmu_nodes() is also named more appropriately, because it
> no longer does anything but fdt node creation.
> 
> No functional change intended.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/virt.c | 34 ++++++++++++++++++----------------
>  1 file changed, 18 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 2cba21fe3ad9..6797eb397a7a 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -521,21 +521,12 @@ static void fdt_add_gic_node(VirtMachineState *vms)
>  
>  static void fdt_add_pmu_nodes(const VirtMachineState *vms)
>  {
> -    CPUState *cpu;
> -    ARMCPU *armcpu;
> +    ARMCPU *armcpu = ARM_CPU(first_cpu);
>      uint32_t irqflags = GIC_FDT_IRQ_FLAGS_LEVEL_HI;
>  
> -    CPU_FOREACH(cpu) {
> -        armcpu = ARM_CPU(cpu);
> -        if (!arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
> -            return;
> -        }
> -        if (kvm_enabled()) {
> -            if (kvm_irqchip_in_kernel()) {
> -                kvm_arm_pmu_set_irq(cpu, PPI(VIRTUAL_PMU_IRQ));
> -            }
> -            kvm_arm_pmu_init(cpu);
> -        }
> +    if (!arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
> +        assert(!object_property_get_bool(OBJECT(armcpu), "pmu", NULL));
> +        return;
>      }
>  
>      if (vms->gic_version == VIRT_GIC_VERSION_2) {
> @@ -544,7 +535,6 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
>                               (1 << vms->smp_cpus) - 1);
>      }
>  
> -    armcpu = ARM_CPU(qemu_get_cpu(0));
>      qemu_fdt_add_subnode(vms->fdt, "/pmu");
>      if (arm_feature(&armcpu->env, ARM_FEATURE_V8)) {
>          const char compat[] = "arm,armv8-pmuv3";
> @@ -1678,11 +1668,23 @@ static void finalize_gic_version(VirtMachineState *vms)
>   */
>  static void virt_cpu_post_init(VirtMachineState *vms)
>  {
> -    bool aarch64;
> +    bool aarch64, pmu;
> +    CPUState *cpu;
>  
>      aarch64 = object_property_get_bool(OBJECT(first_cpu), "aarch64", NULL);
> +    pmu = object_property_get_bool(OBJECT(first_cpu), "pmu", NULL);
>  
> -    if (!kvm_enabled()) {
> +    if (kvm_enabled()) {
> +        CPU_FOREACH(cpu) {
> +            if (pmu) {
> +                assert(arm_feature(&ARM_CPU(cpu)->env, ARM_FEATURE_PMU));
> +                if (kvm_irqchip_in_kernel()) {
> +                    kvm_arm_pmu_set_irq(cpu, PPI(VIRTUAL_PMU_IRQ));
> +                }
> +                kvm_arm_pmu_init(cpu);
> +            }
> +        }
> +    } else {
>          if (aarch64 && vms->highmem) {
>              int requested_pa_size = 64 - clz64(vms->highest_gpa);
>              int pamax = arm_pamax(ARM_CPU(first_cpu));
> 


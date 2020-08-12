Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1285967lfy;
        Wed, 12 Aug 2020 03:16:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyh0QohZbxcYIMqvBrIzn6c+HAT8QcGPpTWSNRNbDAe2HytB0yPPAwsnaR3rNDC/St1E99M
X-Received: by 2002:a25:f309:: with SMTP id c9mr53425672ybs.485.1597227416929;
        Wed, 12 Aug 2020 03:16:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597227416; cv=none;
        d=google.com; s=arc-20160816;
        b=crc7CjYAZ7T7puA6SyFqXjx8NIijw6fb7VIa1k2x+Ko590IxLJjg4GjP37jLUJHEOw
         oVlzLs6vCSrNqoqDbHfvCR1Le1gHYISrQ5LSespu5r4ElRJwZoXU+GytKsDjOAMvY0ks
         MrCvpYh+mEv76kOLKi4A9iUj6BidrQO2Cyi0Q59b+tLWiRIEwD+dfW/mxChUT8+4Eek5
         X6NjfV1baoX140m3R14s/PTsnCE7vlOjhO4gBTF3YAgnahEsVhuUBIHPPgWgcNs9OU9m
         L7qvTlkMfL/mblwv+IEQ0ttlTCJKrAWR4tTuMZDodLqUOXJhXxke5VoQCwzVyx3A7yQH
         X3CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=DGyRt+gAwo1k7ppeHoo9tW19gqB1qjl1A7Ke+eXAkMo=;
        b=YAsjCkjqG5PQS8TQq6JQyR28QjEK78hEdYSpyhmEXch3/KgGUFhYPhS3jeP2BfHF8K
         e2a01U+ac95eRvu5vtRwQ/qeuGQxM+wzlBQytn9g/SLxVdDncIlsDndzahmWVQUlkGT7
         nSqYZat6gCifA/U0rPXCz171YYbeDVFw0PQrK3wGKhuR76R8B3se62vWnHg1iEL+VbgT
         p7/kIyTVsz7B7E7q8bwKSw0y3FAZEfSqM4zP1rn+ByBMKhKSM0oJ58ngSPCTs5/n5DvX
         HmQAbwhIHBfYZNe7RpIcIJawxWARy/O5n/S8O7m+z90epCRUUoM8CiI1ywXYsPQ27aUL
         07bA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=haK5uZoy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 190si1910906ybf.2.2020.08.12.03.16.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Aug 2020 03:16:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=haK5uZoy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k5noV-0007no-9z
	for alex.bennee@linaro.org; Wed, 12 Aug 2020 06:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1k5noJ-0007nK-PC
 for qemu-arm@nongnu.org; Wed, 12 Aug 2020 06:16:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39113
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1k5noG-00030W-TK
 for qemu-arm@nongnu.org; Wed, 12 Aug 2020 06:16:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597227398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DGyRt+gAwo1k7ppeHoo9tW19gqB1qjl1A7Ke+eXAkMo=;
 b=haK5uZoy7IvEtgRyTHPD7EavSupEvn0erkb25+ApgMq11XENgMfdTB89Rj6lPUxILv8ntv
 Q0MWc4LqqWAt9G+z4zideziJDe7C444xKw9iQHeYSTPkSJttjpNjO7YTQuKse7NwBzuvfc
 JGsml22tKtHj2jUMIMlFWIWDCYhoOgg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-1RaQ40qLOeGvJhLqNeDXkw-1; Wed, 12 Aug 2020 06:16:35 -0400
X-MC-Unique: 1RaQ40qLOeGvJhLqNeDXkw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17C1B871803;
 Wed, 12 Aug 2020 10:16:34 +0000 (UTC)
Received: from [10.36.113.93] (ovpn-113-93.ams2.redhat.com [10.36.113.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EDAA56111F;
 Wed, 12 Aug 2020 10:16:32 +0000 (UTC)
Subject: Re: [PATCH v2 4/5] hw/arm/virt: Move kvm pmu setup to
 virt_cpu_post_init
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20200805091640.11134-1-drjones@redhat.com>
 <20200805091640.11134-5-drjones@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <d6eda3c9-54cb-58fc-46b0-7fcc3409b0d5@redhat.com>
Date: Wed, 12 Aug 2020 12:16:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200805091640.11134-5-drjones@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/12 06:16:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 4mjH/eNWXbOY

Hi Drew,
On 8/5/20 11:16 AM, Andrew Jones wrote:
> Move the KVM PMU setup part of fdt_add_pmu_nodes() to
> virt_cpu_post_init(), which is a more appropriate location. Now
> fdt_add_pmu_nodes() is also named more appropriately, because it
> no longer does anything but fdt node creation.
> 
> No functional change intended.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
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
I don't rget the relevance of the assert. If the PMU is set, isn't is
the consequence of arm_set_pmu?
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
same here?
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
Thanks

Eric


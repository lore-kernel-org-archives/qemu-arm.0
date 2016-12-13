Received: by 10.25.205.13 with SMTP id d13csp2279489lfg;
        Tue, 13 Dec 2016 08:14:22 -0800 (PST)
X-Received: by 10.200.37.52 with SMTP id 49mr81622802qtm.240.1481645662766;
        Tue, 13 Dec 2016 08:14:22 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id l40si28327075qtf.193.2016.12.13.08.14.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Dec 2016 08:14:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39218 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGpid-0005Aw-W1
	for alex.bennee@linaro.org; Tue, 13 Dec 2016 11:14:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57287)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cGphL-0004Jb-Fp
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 11:13:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cGphI-0007bP-49
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 11:12:59 -0500
Received: from mail-lf0-f67.google.com ([209.85.215.67]:34339)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1cGphH-0007at-Os; Tue, 13 Dec 2016 11:12:56 -0500
Received: by mail-lf0-f67.google.com with SMTP id 96so394865lfs.1;
	Tue, 13 Dec 2016 08:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=PmJomLpA01K6sUfiLE9/UrOh13ow3+GerXCJPSYBkGg=;
	b=hjq8t9tpOi5iaoFbK+9zN2n6Hh9HJrM1pDAJTnFd4HKpwSpwmsfePXFE8xedo8koUI
	XSXJFQ67vh5lnbWT68Hrflh55VwP2hlsAn5jcIeBZSFsZvX0mY6d1aSmgl6T68yFTrO1
	kc8kknYepBDxfoE3sN/1ZmJus149vpBn4SDf1BJXk4Z0idX/iNvwQkiZc68Zg2nv8WcU
	KW+u62Idi1PCg148r9hM47L3HiWpSGecsvF5hSPwyMYiDFbiZs2/D87hNXsE+BUHmt/Q
	2Yv0MJzLg+nBIjUU8uWaQExGqaBs7UwPwX6V0SGPWDBLgcYodhDb8AbUn7HdpnnJN9fF
	2YeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=PmJomLpA01K6sUfiLE9/UrOh13ow3+GerXCJPSYBkGg=;
	b=hph7Oxp1Om1PgAytLrFxbt0Jf/EtzhgTzkCI2bpOKWMPwXZru32h+pykQhM5qQfaKk
	sZKKQ0RDX6bmdnGRZGHfREpeysTps2wIqyGPER/9o5a63ZX/iRZLNTDRB7R3GYMxE3Ds
	Qi7QoGwQK9qEdPRDUNKICgLvXRIStXz2LBRlu/04IcNclZWlLQDFOuywKKq06/ghcw/J
	QHV65zurg9Hb2FtczhVEYfiE7ecDCGIAEEalcNBHmIROAWASVv8gYCriPQqi8FVG9XMh
	0IrhEFfmcAJqfmEfjLZBHgpuOSg0KVvINAVQ/AffwW6p8O/bSLwKRsvW+uQRCyNzLdUc
	VnQw==
X-Gm-Message-State: AKaTC010zMeQuLLZkOvK+1fVGm5wpAQO12ndOZ+l4hDEH3+9wcIdpKYRLMjH02bxEvu4bw==
X-Received: by 10.25.215.102 with SMTP id o99mr26128279lfg.57.1481645514238;
	Tue, 13 Dec 2016 08:11:54 -0800 (PST)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	f25sm9888864lji.47.2016.12.13.08.11.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Dec 2016 08:11:53 -0800 (PST)
Date: Tue, 13 Dec 2016 17:11:52 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161213161152.GN9606@toto>
References: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
	<1481625384-15077-23-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481625384-15077-23-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.67
Subject: Re: [Qemu-arm] [PATCH 22/23] target-arm: Enable EL2 feature bit on
 A53 and A57
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Christoffer Dall <christoffer.dall@linaro.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0iVPBSvj0TW6

On Tue, Dec 13, 2016 at 10:36:23AM +0000, Peter Maydell wrote:
> Enable the ARM_FEATURE_EL2 bit on Cortex-A52 and
> Cortex-A57, since this is all now sufficiently implemented
> to work with the GICv3. We provide the usual CPU property
> to disable it for backwards compatibility with the older
> virt boards.
> 
> In this commit, we disable the EL2 feature on the
> virt and ZynpMP boards, so there is no overall effect.
> Another commit will expose a board-level property to
> allow the user to enable EL2.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/cpu.h     |  2 ++
>  hw/arm/virt.c        |  4 ++++
>  hw/arm/xlnx-zynqmp.c |  2 ++
>  target-arm/cpu.c     | 12 ++++++++++++
>  target-arm/cpu64.c   |  2 ++
>  5 files changed, 22 insertions(+)
> 
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index be42ffb..51165fa 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -574,6 +574,8 @@ struct ARMCPU {
>      bool start_powered_off;
>      /* CPU currently in PSCI powered-off state */
>      bool powered_off;
> +    /* CPU has virtualization extension */
> +    bool has_el2;
>      /* CPU has security extension */
>      bool has_el3;
>      /* CPU has PMU (Performance Monitor Unit) */
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index cce8d2e..5bde68c 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1368,6 +1368,10 @@ static void machvirt_init(MachineState *machine)
>              object_property_set_bool(cpuobj, false, "has_el3", NULL);
>          }
>  
> +        if (object_property_find(cpuobj, "has_el2", NULL)) {
> +            object_property_set_bool(cpuobj, false, "has_el2", NULL);
> +        }
> +
>          if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED) {
>              object_property_set_int(cpuobj, vms->psci_conduit,
>                                      "psci-conduit", NULL);
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 0d86ba3..bc4e66b 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -258,6 +258,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>  
>          object_property_set_bool(OBJECT(&s->apu_cpu[i]),
>                                   s->secure, "has_el3", NULL);
> +        object_property_set_bool(OBJECT(&s->apu_cpu[i]),
> +                                 false, "has_el2", NULL);
>          object_property_set_int(OBJECT(&s->apu_cpu[i]), GIC_BASE_ADDR,
>                                  "reset-cbar", &error_abort);
>          object_property_set_bool(OBJECT(&s->apu_cpu[i]), true, "realized",
> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> index 5e0d21d..d721cd4 100644
> --- a/target-arm/cpu.c
> +++ b/target-arm/cpu.c
> @@ -497,6 +497,9 @@ static Property arm_cpu_reset_hivecs_property =
>  static Property arm_cpu_rvbar_property =
>              DEFINE_PROP_UINT64("rvbar", ARMCPU, rvbar, 0);
>  
> +static Property arm_cpu_has_el2_property =
> +            DEFINE_PROP_BOOL("has_el2", ARMCPU, has_el2, true);
> +
>  static Property arm_cpu_has_el3_property =
>              DEFINE_PROP_BOOL("has_el3", ARMCPU, has_el3, true);
>  
> @@ -547,6 +550,11 @@ static void arm_cpu_post_init(Object *obj)
>  #endif
>      }
>  
> +    if (arm_feature(&cpu->env, ARM_FEATURE_EL2)) {
> +        qdev_property_add_static(DEVICE(obj), &arm_cpu_has_el2_property,
> +                                 &error_abort);
> +    }
> +
>      if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
>          qdev_property_add_static(DEVICE(obj), &arm_cpu_has_pmu_property,
>                                   &error_abort);
> @@ -690,6 +698,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          cpu->id_aa64pfr0 &= ~0xf000;
>      }
>  
> +    if (!cpu->has_el2) {
> +        unset_feature(env, ARM_FEATURE_EL2);
> +    }
> +
>      if (!cpu->has_pmu || !kvm_enabled()) {
>          cpu->has_pmu = false;
>          unset_feature(env, ARM_FEATURE_PMU);
> diff --git a/target-arm/cpu64.c b/target-arm/cpu64.c
> index 73c7f31..670c07a 100644
> --- a/target-arm/cpu64.c
> +++ b/target-arm/cpu64.c
> @@ -110,6 +110,7 @@ static void aarch64_a57_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
>      set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
>      set_feature(&cpu->env, ARM_FEATURE_CRC);
> +    set_feature(&cpu->env, ARM_FEATURE_EL2);
>      set_feature(&cpu->env, ARM_FEATURE_EL3);
>      set_feature(&cpu->env, ARM_FEATURE_PMU);
>      cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A57;
> @@ -169,6 +170,7 @@ static void aarch64_a53_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
>      set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
>      set_feature(&cpu->env, ARM_FEATURE_CRC);
> +    set_feature(&cpu->env, ARM_FEATURE_EL2);
>      set_feature(&cpu->env, ARM_FEATURE_EL3);
>      set_feature(&cpu->env, ARM_FEATURE_PMU);
>      cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A53;
> -- 
> 2.7.4
> 

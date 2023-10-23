Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1374912ejb;
        Mon, 23 Oct 2023 06:48:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvBjL2kh4Q+CqumD5G2/VaqbaGz5sFfqrjRx2JqH46GECiPE4+/CoiUYydgHgME4L2WzU6
X-Received: by 2002:a5d:4407:0:b0:32d:570b:c0a4 with SMTP id z7-20020a5d4407000000b0032d570bc0a4mr6158956wrq.27.1698068889657;
        Mon, 23 Oct 2023 06:48:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698068889; cv=none;
        d=google.com; s=arc-20160816;
        b=TNcku3RPNiGCilydXqFVCPhAiI8LqRl8kVr+T7ldYUVCehbgriyIvGFl39kMeRDynn
         RzlAbuPu8hYfp2Waf1dgUvirbX+Bek55gLjeFwxHDGUFZ2ey+McsFcQROmNsuvR9mbB5
         BBnoJcB+E9icoBEgYrnJXg4kefboPdN+nDAkYbohGHMVdjNyVPr3ElwqczZzI9oBFj5X
         GJgfn9wZz7Xz42gpuAkX9E0kYqNH99QMN5i4VwOWhf1GPCrLsDtz8G5vI0GL4XXRROsI
         OsG8SJoqzT/RJoIswAgnVjwvk/n6/+D57Vc+ho0ATWRvo3030ED/2acwhJzfUDlj+yn1
         5JpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=ySsJgH4v57WdPcap1/Uwf0N6cEmkJUUclirSocrHDII=;
        fh=V11ovx6Y1sDk+Y8QjL1/IBGklietVOva3jdtwIWQiYY=;
        b=sR1t04TKGa+AbB8uSpHRCurrrCPkClpeh80hvuLJ13fwAsF8/QUEVMUOZZuU8Sd4OR
         iwd0+HjAstnfOGClKx+YfhkHiDaga7/fY9kKHBNamZD1lu8hXhcDRf2c20A0w0f00Wdn
         +oW9071uZSY4WVtLXUz+5GZaUX4S0zITw6AuOX3awGq7UmnO/f3PQYKnpeUxIQp0FIkW
         +g2+xKkkgdzSU4JB+HDliQSqWU+y1WTfxm0ZRL5S95TXchN76copORXwQdwSk5WkPK7y
         6TwNpk8fTdG5oikcN9sjACWm15ui3+qa/nCYMM85jJmQuLMOqeDfHZRXPZxGXHcSoCaz
         r8aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=IGXPnwz+;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.55.52.136 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.136])
        by mx.google.com with ESMTPS id f13-20020adff58d000000b0032da87e32e1si4442084wro.711.2023.10.23.06.48.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Oct 2023 06:48:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.55.52.136 as permitted sender) client-ip=192.55.52.136;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=IGXPnwz+;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.55.52.136 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698068889; x=1729604889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+gCEJuL8BOrhmc3PlOunDBDDz/6AkMm392ljDivKGoQ=;
  b=IGXPnwz+0lVbFM2O5Chgl/NdPMPYntPcoAiHOT+6/PdB2LSeqhO+2q4G
   666rDl7UzozztPYKEMO/bDtil8BGg9tfbuVpGMw7B9wi7mNm2FXEL4Z8S
   fClER7cmwJ1MN+d+LYS4OB5mLXUGb1xgifZNENSdm/xpMViaBSo0FsU7/
   TQPpGFiJASfq5ID0KPpHLJ1B5B20TrO72BiKiEtjqDSL7s349kCcLT1ed
   jLRd0y29b9WLVppGrIMjhK4KOaf6ZOC6Pzeh73tx0HJYLvWTcR84q2TZ2
   cgyVHcd0KIAFnPNLBDpcXXlklGfi9gHl4wvG5eLIdWU06d3GE9xd7eLA1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="366188199"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="366188199"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 06:48:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="881765645"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="881765645"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orsmga004.jf.intel.com with ESMTP; 23 Oct 2023 06:48:01 -0700
Date: Mon, 23 Oct 2023 21:59:40 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH 00/19] cpus: Step toward removing global 'first_cpu'
Message-ID: <ZTZ8TEGmc4WXGRnp@intel.com>
References: <20231020163643.86105-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
X-TUID: ZvgHys4PigLk

Hi Philippe,

On Fri, Oct 20, 2023 at 06:36:22PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Fri, 20 Oct 2023 18:36:22 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH 00/19] cpus: Step toward removing global 'first_cpu'
> X-Mailer: git-send-email 2.41.0
> 
> Heterogeneous machines have different type of CPU.
> In that context, both 'first_cpu' and qemu_get_cpu(index)
> don't make much sense.

Could you talk more about what the issue that heterogeneous machines
will meet on these 2 things?

This question relates to when one should need to pay attention to CPU
type.

> 
> This series first add a 'filter CPU type' argument to
> qemu_get_cpu(), so the behavior respects what we currently
> expect, then replace 'first_cpu' by a qemu_get_cpu(0) call.

Considering that the current uses of first_cpu and qemu_get_cpu(index)
are CPU type-agnostic, would it be more straightforward to convert most
of the current uses to qemu_get_cpu(index, NULL)?

Regards,
Zhao

> 
> Testing pass, but I'm still unsure about performance impact.
> 
> With this series applied, what is left is:
> 
> [OK]
> 
>  -  hw/core/generic-loader.c:127:        s->cpu = qemu_get_cpu(s->cpu_num, NULL);
>  -  linux-user/syscall.c:8990:        if (CPU_NEXT(first_cpu)) {
>  -  monitor/hmp-cmds-target.c:106:        cs = vcpu >= 0 ? qemu_get_cpu(vcpu, NULL) : mon_get_cpu(mon);
>  -  stats/stats-hmp-cmds.c:150:        CPUState *cpu = qemu_get_cpu(cpu_index, NULL);
>  -  system/cpus.c:754:    cpu = qemu_get_cpu(cpu_index, NULL);
> 
> [likely OK, we don't support heterogeneous accelerators]
> 
>  -  accel/kvm/kvm-all.c:3581:    kvm_arch_on_sigbus_vcpu(first_cpu, code, addr);
>  -  accel/kvm/kvm-all.c:4255:    if (first_cpu) {
>  -  accel/kvm/kvm-all.c:4258:        query_stats_schema_vcpu(first_cpu, &stats_args);
> 
> [need some toughts...]
> 
>  -  accel/tcg/tcg-accel-ops-rr.c:114:        qemu_cond_wait_iothread(first_cpu->halt_cond);
>  -  accel/tcg/tcg-accel-ops-rr.c:200:    while (first_cpu->stopped) {
>  -  accel/tcg/tcg-accel-ops-rr.c:201:        qemu_cond_wait_iothread(first_cpu->halt_cond);
>  -  accel/tcg/tcg-accel-ops-rr.c:212:    cpu = first_cpu;
>  -  accel/tcg/tcg-accel-ops-rr.c:242:            cpu = first_cpu;
>  -  accel/tcg/tcg-accel-ops-rr.c:336:        cpu->thread_id = first_cpu->thread_id;
>  -  accel/tcg/tcg-accel-ops-rr.c:92:    if (!rr_kick_vcpu_timer && CPU_NEXT(first_cpu)) {
>  -  dump/win_dump.c:115:    if (cpu_memory_rw_debug(first_cpu,
>  -  dump/win_dump.c:128:    if (cpu_read_ptr(x64, first_cpu,
>  -  dump/win_dump.c:135:    if (cpu_memory_rw_debug(first_cpu, KiBugcheckData,
>  -  dump/win_dump.c:210:    if (cpu_memory_rw_debug(first_cpu,
>  -  dump/win_dump.c:258:    if (cpu_read_ptr(x64, first_cpu,
>  -  dump/win_dump.c:265:    if (cpu_memory_rw_debug(first_cpu,
>  -  dump/win_dump.c:286:        if (cpu_read_ptr(x64, first_cpu,
>  -  dump/win_dump.c:294:        if (cpu_read_ptr(x64, first_cpu,
>  -  dump/win_dump.c:378:        if (cpu_memory_rw_debug(first_cpu, Context,
>  -  dump/win_dump.c:384:        if (cpu_memory_rw_debug(first_cpu, Context,
>  -  dump/win_dump.c:400:        if (cpu_memory_rw_debug(first_cpu, saved_ctx[i].addr,
>  -  dump/win_dump.c:410:    X86CPU *first_x86_cpu = X86_CPU(first_cpu);
>  -  gdbstub/gdbstub.c:1521:    cc = CPU_GET_CLASS(first_cpu);
>  -  gdbstub/gdbstub.c:298:    CPUState *cpu = first_cpu;
>  -  gdbstub/system.c:338:    if (!first_cpu) {
>  -  hw/acpi/cpu.c:138:            if (!cdev->cpu || cdev->cpu == first_cpu) {
>  -  hw/acpi/cpu.c:150:            if (!cdev->cpu || cdev->cpu == first_cpu) {
>  -  hw/acpi/cpu.c:671:            if (CPU(arch_ids->cpus[i].cpu) != first_cpu) {
>  -  hw/core/generic-loader.c:134:        s->cpu = first_cpu;
>  -  monitor/hmp-cmds-target.c:39:    cpu = qemu_get_cpu(cpu_index, NULL);
>  -  monitor/hmp-cmds-target.c:62:        if (!first_cpu) {
>  -  monitor/hmp-cmds-target.c:65:        monitor_set_cpu(mon, first_cpu->cpu_index);
>  -  monitor/hmp-cmds-target.c:66:        cpu = first_cpu;
>  -  replay/replay-events.c:130:    qemu_cpu_kick(first_cpu);
>  -  system/cpu-timers.c:254:    } else if (first_cpu) {
>  -  system/cpu-timers.c:263:        async_run_on_cpu(first_cpu, do_nothing, RUN_ON_CPU_NULL);
>  -  system/memory_mapping.c:315:    first_paging_enabled_cpu = find_paging_enabled_cpu(first_cpu);
>  -  system/qtest.c:548:            address_space_write(first_cpu->as, ...
>  -  system/qtest.c:553:            address_space_write(first_cpu->as, ...
>  -  system/qtest.c:558:            address_space_write(first_cpu->as, ...
>  -  system/qtest.c:563:            address_space_write(first_cpu->as, ...
>  -  system/qtest.c:582:            address_space_read(first_cpu->as, ...
>  -  system/qtest.c:587:            address_space_read(first_cpu->as, ...
>  -  system/qtest.c:592:            address_space_read(first_cpu->as, ...
>  -  system/qtest.c:596:            address_space_read(first_cpu->as, ...
>  -  system/qtest.c:617:        address_space_read(first_cpu->as, ...
>  -  system/qtest.c:643:        address_space_read(first_cpu->as, ...
>  -  system/qtest.c:678:        address_space_write(first_cpu->as, ...
>  -  system/qtest.c:701:            address_space_write(first_cpu->as, ...
>  -  system/qtest.c:735:        address_space_write(first_cpu->as, ...
>  -  tests/qtest/fuzz/generic_fuzz.c:241:        mr1 = address_space_translate(first_cpu->as,
>  -  tests/qtest/fuzz/qtest_wrappers.c:110:        address_space_read(first_cpu->as, ...
>  -  tests/qtest/fuzz/qtest_wrappers.c:122:        address_space_read(first_cpu->as, ...
>  -  tests/qtest/fuzz/qtest_wrappers.c:134:        address_space_read(first_cpu->as, ...
>  -  tests/qtest/fuzz/qtest_wrappers.c:146:        address_space_read(first_cpu->as, ...
>  -  tests/qtest/fuzz/qtest_wrappers.c:157:        address_space_write(first_cpu->as, ...
>  -  tests/qtest/fuzz/qtest_wrappers.c:167:        address_space_write(first_cpu->as, ...
>  -  tests/qtest/fuzz/qtest_wrappers.c:177:        address_space_write(first_cpu->as, ...
>  -  tests/qtest/fuzz/qtest_wrappers.c:187:        address_space_write(first_cpu->as, ...
>  -  tests/qtest/fuzz/qtest_wrappers.c:197:        address_space_read(first_cpu->as, ...
>  -  tests/qtest/fuzz/qtest_wrappers.c:207:        address_space_read(first_cpu->as, ...
>  -  tests/qtest/fuzz/qtest_wrappers.c:218:        address_space_write(first_cpu->as, ...
>  -  tests/qtest/fuzz/qtest_wrappers.c:229:        address_space_write(first_cpu->as, ...
>  -  tests/qtest/fuzz/qtest_wrappers.c:242:        address_space_write(first_cpu->as, ...
> 
> Regards,
> 
> Phil.
> 
> Based-on: <20231013140116.255-1-philmd@linaro.org>
>           "target: Make 'cpu-qom.h' really target agnostic" v2
> 
> Philippe Mathieu-Daudé (19):
>   cpus: Add argument to qemu_get_cpu() to filter CPUs by QOM type
>   cpus: Filter for target specific CPU (generic)
>   cpus: Filter for target specific CPU (arm)
>   cpus: Filter for target specific CPU (loongarch)
>   cpus: Filter for target specific CPU (mips)
>   cpus: Filter for target specific CPU (s390x)
>   cpus: Filter for target specific CPU (riscv)
>   cpus: Filter for target specific CPU (ppc)
>   cpus: Filter for target specific CPU (x86)
>   cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_ARM_CPU)
>   cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_POWERPC_CPU)
>   cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_MIPS_CPU)
>   cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_M68K_CPU)
>   cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_S390X_CPU)
>   cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_RISCV_CPU)
>   cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_TRICORE_CPU)
>   cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_SUPERH_CPU)
>   cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_RX_CPU)
>   cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_X86_CPU)
> 
>  include/hw/core/cpu.h               |  3 ++-
>  target/mips/internal.h              |  2 +-
>  cpu-common.c                        |  5 ++++-
>  hw/arm/aspeed.c                     |  5 +++--
>  hw/arm/bananapi_m2u.c               |  3 ++-
>  hw/arm/boot.c                       | 14 +++++++-------
>  hw/arm/exynos4_boards.c             |  6 ++++--
>  hw/arm/fsl-imx7.c                   |  2 +-
>  hw/arm/highbank.c                   |  3 ++-
>  hw/arm/microbit.c                   |  3 ++-
>  hw/arm/mps2-tz.c                    |  3 ++-
>  hw/arm/mps2.c                       |  3 ++-
>  hw/arm/msf2-som.c                   |  3 ++-
>  hw/arm/musca.c                      |  3 ++-
>  hw/arm/netduino2.c                  |  3 ++-
>  hw/arm/netduinoplus2.c              |  2 +-
>  hw/arm/olimex-stm32-h405.c          |  2 +-
>  hw/arm/orangepi.c                   |  3 ++-
>  hw/arm/pxa2xx_gpio.c                |  2 +-
>  hw/arm/realview.c                   |  5 +++--
>  hw/arm/sbsa-ref.c                   |  7 ++++---
>  hw/arm/stellaris.c                  |  3 ++-
>  hw/arm/stm32vldiscovery.c           |  2 +-
>  hw/arm/vexpress.c                   |  5 +++--
>  hw/arm/virt-acpi-build.c            |  2 +-
>  hw/arm/virt.c                       | 25 ++++++++++++++-----------
>  hw/arm/xilinx_zynq.c                |  3 ++-
>  hw/arm/xlnx-versal-virt.c           |  2 +-
>  hw/core/generic-loader.c            |  2 +-
>  hw/cpu/a15mpcore.c                  |  4 ++--
>  hw/cpu/a9mpcore.c                   |  2 +-
>  hw/hyperv/hyperv.c                  |  2 +-
>  hw/i386/kvm/clock.c                 |  4 ++--
>  hw/i386/kvm/xen_evtchn.c            |  8 ++++----
>  hw/i386/kvmvapic.c                  |  3 ++-
>  hw/i386/microvm.c                   |  2 +-
>  hw/i386/pc.c                        |  7 ++++---
>  hw/i386/pc_piix.c                   |  3 ++-
>  hw/i386/x86.c                       |  2 +-
>  hw/intc/arm_gicv3_common.c          |  3 ++-
>  hw/intc/arm_gicv3_cpuif.c           |  2 +-
>  hw/intc/arm_gicv3_kvm.c             |  2 +-
>  hw/intc/m68k_irqc.c                 |  2 +-
>  hw/intc/mips_gic.c                  |  2 +-
>  hw/intc/riscv_aclint.c              |  2 +-
>  hw/intc/sh_intc.c                   |  6 ++++--
>  hw/intc/sifive_plic.c               |  4 ++--
>  hw/isa/lpc_ich9.c                   |  2 +-
>  hw/loongarch/virt.c                 | 10 +++++-----
>  hw/m68k/mcf5206.c                   |  2 +-
>  hw/mips/bootloader.c                |  3 ++-
>  hw/mips/cps.c                       |  5 +++--
>  hw/mips/loongson3_bootp.c           |  2 +-
>  hw/mips/loongson3_virt.c            |  7 ++++---
>  hw/mips/malta.c                     |  2 +-
>  hw/misc/mips_cpc.c                  |  4 ++--
>  hw/ppc/e500.c                       |  4 ++--
>  hw/ppc/ppc.c                        |  4 ++--
>  hw/ppc/ppce500_spin.c               |  2 +-
>  hw/ppc/prep_systemio.c              |  2 +-
>  hw/ppc/spapr.c                      | 11 ++++++-----
>  hw/ppc/spapr_caps.c                 | 10 +++++-----
>  hw/ppc/spapr_rtas.c                 |  2 +-
>  hw/ppc/spapr_vof.c                  |  2 +-
>  hw/ppc/vof.c                        |  3 ++-
>  hw/riscv/boot.c                     |  4 ++--
>  hw/riscv/opentitan.c                |  4 ++--
>  hw/rx/rx-gdbsim.c                   |  4 ++--
>  hw/s390x/ipl.c                      |  4 ++--
>  hw/s390x/s390-virtio-ccw.c          |  2 +-
>  hw/tricore/triboard.c               |  2 +-
>  monitor/hmp-cmds-target.c           |  4 ++--
>  stats/stats-hmp-cmds.c              |  2 +-
>  system/cpus.c                       |  2 +-
>  target/arm/arch_dump.c              |  6 +++---
>  target/i386/arch_dump.c             |  6 +++---
>  target/i386/kvm/kvm.c               |  6 +++---
>  target/i386/kvm/xen-emu.c           | 15 ++++++++-------
>  target/i386/monitor.c               |  2 +-
>  target/i386/tcg/sysemu/fpu_helper.c |  4 ++--
>  target/mips/cpu.c                   |  2 +-
>  target/mips/tcg/sysemu/cp0_helper.c | 10 +++++-----
>  target/mips/tcg/sysemu/tlb_helper.c |  2 +-
>  target/ppc/arch_dump.c              |  4 ++--
>  target/riscv/arch_dump.c            |  4 ++--
>  target/s390x/cpu_models.c           | 10 +++++-----
>  86 files changed, 199 insertions(+), 163 deletions(-)
> 
> -- 
> 2.41.0
> 

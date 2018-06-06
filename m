Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp833622wrq;
        Wed, 6 Jun 2018 06:37:26 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJRY+QIh7XtVNA8GSE+AoSZq49N73BQpjG0Wo5DW4fuLfCeugQlmsR9Z2ZW15+UE8vbDCbb
X-Received: by 2002:a37:db09:: with SMTP id e9-v6mr2470290qki.63.1528292246237;
        Wed, 06 Jun 2018 06:37:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528292246; cv=none;
        d=google.com; s=arc-20160816;
        b=O6pkcPlHnP+3CccJBOPE30+IIOKhFi2eqc4IKNQXbKHqoPHxBIn3aaKG7u1eiUQdT1
         h0LodfQAKL47iex9qABd6aLZ707urOBplZRBmp9T53JI+n4ad4jTSsIViwIDuYUfs90+
         4l3dC/LGO4lyU04oG0dntJoO0DdfmjerWG99BgkELH4abg2jDKdD8pB5tXQ+XVMck9PD
         70TCj2YyKYnD/f+u/7Z+TFnnyKlua7MbiHF7U3EHOGGLdIHCoDJ+Ze6N/XG7WQXBMNka
         kzOLMDXcVpIwe8JxXwTupVKwK5aeGpQTkf1I3jog3N+Bama1DNZFwc44YrUB/fRURERW
         QArg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=U3V663x4+8GeA9jN04nyDqUGaEndEOu5cK0H0UISVJs=;
        b=suJpHzAaYTIsdlyAC19UhPZJZw16oP1JaKWmLp7yBUrIpxi9t1sJJktAIA2C0SGefC
         2rCZSFm7Ftn04lgCjPH1Aha7XbCwYJvMAd9Rm55zU/rQejuhQ7HqE+yQ4iu8Sr4EauaR
         HZostXNnusZ7418MIWtLuV9MU7TnoPUvi4IG8ddHzKDY3XY1fBQm1X8gdBL3t5rqHSGg
         aVMEV7inqrudWAa3am/Sq79tf1Wss0ED9cdbCTz+oQ4KMflGpU5qkd5kzI09TbZcb87F
         cqBbRCHQjhsMBjpAVYXmezuAGeMfDyKG9Dd9kSYy5cxhKjlDTsSVI2pHaO9zFWGNUaF2
         WpmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O9hzsWsi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h13-v6si3382165qka.27.2018.06.06.06.37.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jun 2018 06:37:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O9hzsWsi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52494 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQYcv-00042D-Og
	for alex.bennee@linaro.org; Wed, 06 Jun 2018 09:37:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQYbx-0003Mx-7A
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 09:36:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQYbs-0005DU-7c
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 09:36:25 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:34344)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQYbs-0005DF-0I; Wed, 06 Jun 2018 09:36:20 -0400
Received: by mail-qt0-x243.google.com with SMTP id d3-v6so6343463qto.1;
	Wed, 06 Jun 2018 06:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=U3V663x4+8GeA9jN04nyDqUGaEndEOu5cK0H0UISVJs=;
	b=O9hzsWsiLRTq+a8vOb0oOEtXs+iORWS7EQprizHWrhtLSmziIe+r98ainORhle3dEJ
	DrpC3iIaqwckVgmeLVdaftp1Av3o+Daj9i0NPZHTw32Kdo0IHaa8yMvEYxSxGp/Mzv63
	cT2kjsolwho+QXdGXJPekkqyVMUz8Ivj+r85EEyuA7LXCNAqXvYrqYSoGVytGLM2WGak
	5hL2dZ11072monpyvQOopUL/NavMFRWuIS+0idDYdn/Kg2Kd3EOzMG0K/3Q04c40Wure
	kY/3I4X1vMYS3187aLtbkSbF5QCCLBkfJPFcj64Rnnx/n5OKveDYNES8djE0Gn3ZFsth
	JZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=U3V663x4+8GeA9jN04nyDqUGaEndEOu5cK0H0UISVJs=;
	b=G89ngE0j0wFYclfYGZWnBYgIIxxMcYV7OOAsLUVjz6DcwHve3ebhSgU8QLm0XyVHfR
	HsxOgnsAfH/6++m+NbOYH2KG4FPvrrqqN5mS0dmv4yqPxExyLxlYWAb/x3xJVoeupUpI
	YgliNM6jZax2pUUfOUMov9hlP/fXowgF1WuE8QY22a8AsAP6pMkS1thjNgzVRJyzytzO
	Ny90uy1psWxurLG3is32brM+sK9QohzFP2w74dmUaReHti7DP5y2yHRpRKL9AGVM+duY
	UD95zCGzr4cLTWSYsIiPbEp9K2Iy5dT2XOJrLuwyERxh9Znhw6HtFHVVcjN0UtldIHxo
	Cggw==
X-Gm-Message-State: APt69E05/xBOISMGriqd4SY6PghzmUGW9zLFlIYX5OgJyBbywBep13lS
	EVpAcabZ7LYBOt0o+0BGwOE=
X-Received: by 2002:ac8:2947:: with SMTP id
	z7-v6mr2590001qtz.251.1528292179251; 
	Wed, 06 Jun 2018 06:36:19 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	h10-v6sm3012341qtp.53.2018.06.06.06.36.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 06:36:18 -0700 (PDT)
To: luc.michel@greensocs.com, qemu-devel@nongnu.org
References: <20180606093101.30518-1-luc.michel@greensocs.com>
	<20180606093101.30518-6-luc.michel@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <a49fd0e8-7865-7a05-c093-5bb9a14bdf43@amsat.org>
Date: Wed, 6 Jun 2018 10:36:13 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180606093101.30518-6-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-arm] [PATCH 5/6] intc/arm_gic: Improve traces
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mark.burton@greensocs.com,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aXy5mF/fE7m0

On 06/06/2018 06:31 AM, luc.michel@greensocs.com wrote:
> From: Luc MICHEL <luc.michel@greensocs.com>
> 
> Add some traces to the ARM GIC to catch register accesses (distributor,
> (v)cpu interface and virtual interface), and to take into account
> virtualization extensions (print `vcpu` instead of `cpu` when needed).
> 
> Also add some virtualization extensions specific traces: LR updating
> and maintenance IRQ generation.
> 
> Signed-off-by: Luc MICHEL <luc.michel@greensocs.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/intc/arm_gic.c    | 31 +++++++++++++++++++++++++------
>  hw/intc/trace-events | 12 ++++++++++--
>  2 files changed, 35 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 6105f930c4..a0ffd85fdf 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -179,8 +179,10 @@ static inline void gic_update_internal(GICState *s, bool virt)
>          }
>  
>          if (best_irq != 1023) {
> -            trace_gic_update_bestirq(cpu, best_irq, best_prio,
> -                s->priority_mask[cpu_iface], s->running_priority[cpu_iface]);
> +            trace_gic_update_bestirq(virt ? "vcpu" : "cpu", cpu,
> +                                     best_irq, best_prio,
> +                                     s->priority_mask[cpu_iface],
> +                                     s->running_priority[cpu_iface]);
>          }
>  
>          irq_level = fiq_level = 0;
> @@ -268,6 +270,7 @@ static void gic_update_maintenance(GICState *s)
>          gic_compute_misr(s, cpu);
>          maint_level = (s->h_hcr[cpu] & GICH_HCR_EN) && s->h_misr[cpu];
>  
> +        trace_gic_update_maintenance_irq(cpu, maint_level);
>          qemu_set_irq(s->maintenance_irq[cpu], maint_level);
>      }
>  }
> @@ -524,7 +527,8 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
>       * is in the wrong group.
>       */
>      irq = gic_get_current_pending_irq(s, cpu, attrs);
> -    trace_gic_acknowledge_irq(gic_get_vcpu_real_id(cpu), irq);
> +    trace_gic_acknowledge_irq(gic_is_vcpu(cpu) ? "vcpu" : "cpu",
> +                              gic_get_vcpu_real_id(cpu), irq);
>  
>      if (irq >= GIC_MAXIRQ) {
>          DPRINTF("ACK, no pending interrupt or it is hidden: %d\n", irq);
> @@ -1002,20 +1006,23 @@ static MemTxResult gic_dist_read(void *opaque, hwaddr offset, uint64_t *data,
>      switch (size) {
>      case 1:
>          *data = gic_dist_readb(opaque, offset, attrs);
> -        return MEMTX_OK;
> +        break;
>      case 2:
>          *data = gic_dist_readb(opaque, offset, attrs);
>          *data |= gic_dist_readb(opaque, offset + 1, attrs) << 8;
> -        return MEMTX_OK;
> +        break;
>      case 4:
>          *data = gic_dist_readb(opaque, offset, attrs);
>          *data |= gic_dist_readb(opaque, offset + 1, attrs) << 8;
>          *data |= gic_dist_readb(opaque, offset + 2, attrs) << 16;
>          *data |= gic_dist_readb(opaque, offset + 3, attrs) << 24;
> -        return MEMTX_OK;
> +        break;
>      default:
>          return MEMTX_ERROR;
>      }
> +
> +    trace_gic_dist_read(offset, size, *data);
> +    return MEMTX_OK;
>  }
>  
>  static void gic_dist_writeb(void *opaque, hwaddr offset,
> @@ -1309,6 +1316,8 @@ static void gic_dist_writel(void *opaque, hwaddr offset,
>  static MemTxResult gic_dist_write(void *opaque, hwaddr offset, uint64_t data,
>                                    unsigned size, MemTxAttrs attrs)
>  {
> +    trace_gic_dist_write(offset, size, data);
> +
>      switch (size) {
>      case 1:
>          gic_dist_writeb(opaque, offset, data, attrs);
> @@ -1463,12 +1472,18 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
>          *data = 0;
>          break;
>      }
> +
> +    trace_gic_cpu_read(gic_is_vcpu(cpu) ? "vcpu" : "cpu",
> +                       gic_get_vcpu_real_id(cpu), offset, *data);
>      return MEMTX_OK;
>  }
>  
>  static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
>                                   uint32_t value, MemTxAttrs attrs)
>  {
> +    trace_gic_cpu_write(gic_is_vcpu(cpu) ? "vcpu" : "cpu",
> +                        gic_get_vcpu_real_id(cpu), offset, value);
> +
>      switch (offset) {
>      case 0x00: /* Control */
>          gic_set_cpu_control(s, cpu, value, attrs);
> @@ -1679,6 +1694,7 @@ static void gic_set_lr_entry(GICState *s, int cpu, int lr_num, uint32_t entry)
>      }
>  
>      s->h_lr[lr_num][cpu] = entry;
> +    trace_gic_lr_entry(cpu, lr_num, entry);
>      is_free = gic_lr_update(s, lr_num, cpu);
>  
>      if (!is_free) {
> @@ -1749,6 +1765,7 @@ static MemTxResult gic_hyp_read(void *opaque, hwaddr addr, uint64_t *data,
>          return MEMTX_OK;
>      }
>  
> +    trace_gic_hyp_read(addr, *data);
>      return MEMTX_OK;
>  }
>  
> @@ -1759,6 +1776,8 @@ static MemTxResult gic_hyp_write(void *opaque, hwaddr addr, uint64_t value,
>      int cpu = gic_get_current_cpu(s);
>      int vcpu = gic_get_current_vcpu(s);
>  
> +    trace_gic_hyp_write(addr, value);
> +
>      switch (addr) {
>      case 0x0: /* Hypervisor Control */
>          s->h_hcr[cpu] = value & 0xf80000ff;
> diff --git a/hw/intc/trace-events b/hw/intc/trace-events
> index 55e8c2570c..16d02fa8cf 100644
> --- a/hw/intc/trace-events
> +++ b/hw/intc/trace-events
> @@ -92,9 +92,17 @@ aspeed_vic_write(uint64_t offset, unsigned size, uint32_t data) "To 0x%" PRIx64
>  gic_enable_irq(int irq) "irq %d enabled"
>  gic_disable_irq(int irq) "irq %d disabled"
>  gic_set_irq(int irq, int level, int cpumask, int target) "irq %d level %d cpumask 0x%x target 0x%x"
> -gic_update_bestirq(int cpu, int irq, int prio, int priority_mask, int running_priority) "cpu %d irq %d priority %d cpu priority mask %d cpu running priority %d"
> +gic_update_bestirq(const char *s, int cpu, int irq, int prio, int priority_mask, int running_priority) "%s %d irq %d priority %d cpu priority mask %d cpu running priority %d"
>  gic_update_set_irq(int cpu, const char *name, int level) "cpu[%d]: %s = %d"
> -gic_acknowledge_irq(int cpu, int irq) "cpu %d acknowledged irq %d"
> +gic_acknowledge_irq(const char *s, int cpu, int irq) "%s %d acknowledged irq %d"
> +gic_cpu_write(const char *s, int cpu, int addr, uint32_t val) "%s %d iface write at 0x%08x 0x%08" PRIx32
> +gic_cpu_read(const char *s, int cpu, int addr, uint32_t val) "%s %d iface write at 0x%08x: 0x%08" PRIx32
> +gic_hyp_read(int addr, uint32_t val) "hyp read at 0x%08x: 0x%08" PRIx32
> +gic_hyp_write(int addr, uint32_t val) "hyp write at 0x%08x: 0x%08" PRIx32
> +gic_dist_read(int addr, unsigned int size, uint32_t val) "dist read at 0x%08x size %u: 0x%08" PRIx32
> +gic_dist_write(int addr, unsigned int size, uint32_t val) "dist write at 0x%08x size %u: 0x%08" PRIx32
> +gic_lr_entry(int cpu, int entry, uint32_t val) "cpu %d: new lr entry %d: 0x%08" PRIx32
> +gic_update_maintenance_irq(int cpu, int val) "cpu %d: maintenance = %d"
>  
>  # hw/intc/arm_gicv3_cpuif.c
>  gicv3_icc_pmr_read(uint32_t cpu, uint64_t val) "GICv3 ICC_PMR read cpu 0x%x value 0x%" PRIx64
> 

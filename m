Received: by 10.223.183.22 with SMTP id l22csp219339wre;
        Mon, 14 Aug 2017 01:59:25 -0700 (PDT)
X-Received: by 10.55.190.2 with SMTP id o2mr2061691qkf.132.1502701165783;
        Mon, 14 Aug 2017 01:59:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502701165; cv=none;
        d=google.com; s=arc-20160816;
        b=NtGz5rz6g9bIfHxdeLTKEFv21VoNodDXmX7b9PjdnipjDDFH9ljZV3RpFeaEiN4zyh
         gaUqQofD3SRNuDDvEROnLmot4/faysPs6f9ZLCxyypsYqwramZXfZEPUhHy8a4V+ZY+e
         UDYDF+QK9eY506OMYmWZ06v+J+TEwReG2KzmRo8QWSD8J2cyI7fwdcjKwxw7WVprut+p
         C5HQuwC9X15ukv41CEK/3HvHLftUyzock8PDxIOELJp/mmWtseo3biGscB0Pdl74sj+m
         W/KotYhvbep/B2aVfEHJXDsdKmWunjwVDd19Rw0uzJqocL4OXzPKTHA2XOQTp+/xrP0F
         Vg6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=ktYnxWV0/5KXHX9Jw9zuGEkNK2GfPAVrLd8uXn5zNn8=;
        b=W06qyKwZkHwVqdh6rwWT8PM/k3kHw6fuqbPrmlbMvPsV9J59etdWNx2sav5n1GC6WF
         RvlzrEbzjG/7Y2f17YnddK90X4yUF/8keb3D1kSdrYnXKII6dqyKVMZMrnAKtRgDR00L
         ZvK8qtq6e/2fULiivYMn7hEjOLrUKUIFMnftyArhVVNef8uK32c4dtn5AzFA/H76Toz2
         mGYbb/uUStUtANpW4isgnqvvHTX6qCZ/G7m++pODyDWtOzN9PYul4tMtA5ej7/B6RudJ
         /fdE37tKVXOZltt+f7KEXY0N9zHZZuk/YiLedwVOec9mw4ACr13En+jlPEf47yMQmXa1
         0e4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d41si3858784qkh.173.2017.08.14.01.59.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 14 Aug 2017 01:59:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58951 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dhBDX-0001z6-6u
	for alex.bennee@linaro.org; Mon, 14 Aug 2017 04:59:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dhBDT-0001yv-IZ
	for qemu-arm@nongnu.org; Mon, 14 Aug 2017 04:59:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dhBDQ-0005RZ-DR
	for qemu-arm@nongnu.org; Mon, 14 Aug 2017 04:59:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46834)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1dhBDQ-0005Or-4B; Mon, 14 Aug 2017 04:59:16 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A1B7395F27;
	Mon, 14 Aug 2017 08:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A1B7395F27
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=drjones@redhat.com
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C69B26047B;
	Mon, 14 Aug 2017 08:53:25 +0000 (UTC)
Date: Mon, 14 Aug 2017 10:53:23 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170814085323.ethzsjtx3xse2muj@kamzik.brq.redhat.com>
References: <1500040339-119465-1-git-send-email-imammedo@redhat.com>
	<1500040339-119465-22-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1500040339-119465-22-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 14 Aug 2017 08:53:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 21/28] arm: replace
 cpu_arm_init() with cpu_generic_init()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qEHuRIPVayqj

On Fri, Jul 14, 2017 at 03:52:12PM +0200, Igor Mammedov wrote:
> it's just a wrapper, drop it and use cpu_generic_init() directly
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: Jan Kiszka <jan.kiszka@web.de>
> CC: Peter Maydell <peter.maydell@linaro.org>
> CC: Andrzej Zaborowski <balrogg@gmail.com>
> CC: qemu-arm@nongnu.org
> ---
>  target/arm/cpu.h    | 3 +--
>  hw/arm/musicpal.c   | 2 +-
>  hw/arm/omap1.c      | 2 +-
>  hw/arm/omap2.c      | 2 +-
>  hw/arm/pxa2xx.c     | 4 ++--
>  hw/arm/strongarm.c  | 2 +-
>  target/arm/helper.c | 5 -----
>  7 files changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 16a1e59..c9be0ac 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -746,7 +746,6 @@ int aarch64_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
>  int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  #endif
>  
> -ARMCPU *cpu_arm_init(const char *cpu_model);
>  target_ulong do_arm_semihosting(CPUARMState *env);
>  void aarch64_sync_32_to_64(CPUARMState *env);
>  void aarch64_sync_64_to_32(CPUARMState *env);
> @@ -1999,7 +1998,7 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
>      return unmasked || pstate_unmasked;
>  }
>  
> -#define cpu_init(cpu_model) CPU(cpu_arm_init(cpu_model))
> +#define cpu_init(cpu_model) cpu_generic_init(TYPE_ARM_CPU, cpu_model)
>  
>  #define cpu_signal_handler cpu_arm_signal_handler
>  #define cpu_list arm_cpu_list
> diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
> index 9c710f7..0d519f9 100644
> --- a/hw/arm/musicpal.c
> +++ b/hw/arm/musicpal.c
> @@ -1593,7 +1593,7 @@ static void musicpal_init(MachineState *machine)
>      if (!cpu_model) {
>          cpu_model = "arm926";
>      }
> -    cpu = cpu_arm_init(cpu_model);
> +    cpu = ARM_CPU(cpu_generic_init(TYPE_ARM_CPU, cpu_model));
>      if (!cpu) {
>          fprintf(stderr, "Unable to find CPU definition\n");
>          exit(1);
> diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
> index 54582bd..391eb28 100644
> --- a/hw/arm/omap1.c
> +++ b/hw/arm/omap1.c
> @@ -3863,7 +3863,7 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryRegion *system_memory,
>  
>      /* Core */
>      s->mpu_model = omap310;
> -    s->cpu = cpu_arm_init(core);
> +    s->cpu = ARM_CPU(cpu_generic_init(TYPE_ARM_CPU, core));
>      if (s->cpu == NULL) {
>          fprintf(stderr, "Unable to find CPU definition\n");
>          exit(1);
> diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
> index 91f5733..a20bb1f 100644
> --- a/hw/arm/omap2.c
> +++ b/hw/arm/omap2.c
> @@ -2261,7 +2261,7 @@ struct omap_mpu_state_s *omap2420_mpu_init(MemoryRegion *sysmem,
>  
>      /* Core */
>      s->mpu_model = omap2420;
> -    s->cpu = cpu_arm_init(core ?: "arm1136-r2");
> +    s->cpu = ARM_CPU(cpu_generic_init(TYPE_ARM_CPU, core ?: "arm1136-r2"));
>      if (s->cpu == NULL) {
>          fprintf(stderr, "Unable to find CPU definition\n");
>          exit(1);
> diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
> index 629e6c6..2f1c141 100644
> --- a/hw/arm/pxa2xx.c
> +++ b/hw/arm/pxa2xx.c
> @@ -2065,7 +2065,7 @@ PXA2xxState *pxa270_init(MemoryRegion *address_space,
>      if (!revision)
>          revision = "pxa270";
>  
> -    s->cpu = cpu_arm_init(revision);
> +    s->cpu = ARM_CPU(cpu_generic_init(TYPE_ARM_CPU, revision));
>      if (s->cpu == NULL) {
>          fprintf(stderr, "Unable to find CPU definition\n");
>          exit(1);
> @@ -2197,7 +2197,7 @@ PXA2xxState *pxa255_init(MemoryRegion *address_space, unsigned int sdram_size)
>  
>      s = g_new0(PXA2xxState, 1);
>  
> -    s->cpu = cpu_arm_init("pxa255");
> +    s->cpu = ARM_CPU(cpu_generic_init(TYPE_ARM_CPU, "pxa255"));
>      if (s->cpu == NULL) {
>          fprintf(stderr, "Unable to find CPU definition\n");
>          exit(1);
> diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
> index 7683edc..a27d7c8 100644
> --- a/hw/arm/strongarm.c
> +++ b/hw/arm/strongarm.c
> @@ -1597,7 +1597,7 @@ StrongARMState *sa1110_init(MemoryRegion *sysmem,
>          exit(1);
>      }
>  
> -    s->cpu = cpu_arm_init(rev);
> +    s->cpu = ARM_CPU(cpu_generic_init(TYPE_ARM_CPU, rev));
>  
>      if (!s->cpu) {
>          error_report("Unable to find CPU definition");
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 2594faa..86e69a6 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5237,11 +5237,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>      }
>  }
>  
> -ARMCPU *cpu_arm_init(const char *cpu_model)
> -{
> -    return ARM_CPU(cpu_generic_init(TYPE_ARM_CPU, cpu_model));
> -}
> -
>  void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
>  {
>      CPUState *cs = CPU(cpu);
> -- 
> 2.7.4
> 
>

I agree with the motivation described in the cover letter and the changes
(which are even mostly verified by the compiler) look good to me.

Reviewed-by: Andrew Jones <drjones@redhat.com>

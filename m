Received: by 10.25.150.194 with SMTP id y185csp193277lfd;
        Wed, 9 Nov 2016 03:11:29 -0800 (PST)
X-Received: by 10.194.175.163 with SMTP id cb3mr14835398wjc.174.1478689889694;
        Wed, 09 Nov 2016 03:11:29 -0800 (PST)
Return-Path: <andre.przywara@arm.com>
Received: from cam-admin0.cambridge.arm.com (cam-admin0.cambridge.arm.com. [217.140.96.50])
        by mx.google.com with ESMTP id k18si40623287wjq.214.2016.11.09.03.11.29;
        Wed, 09 Nov 2016 03:11:29 -0800 (PST)
Received-SPF: pass (google.com: domain of andre.przywara@arm.com designates 217.140.96.50 as permitted sender) client-ip=217.140.96.50;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of andre.przywara@arm.com designates 217.140.96.50 as permitted sender) smtp.mailfrom=andre.przywara@arm.com
Received: from [192.168.67.35] ([10.1.207.46])
	by cam-admin0.cambridge.arm.com (8.12.6/8.12.6) with ESMTP id uA9BBSWr024941;
	Wed, 9 Nov 2016 11:11:28 GMT
Subject: Re: [kvm-unit-tests PATCH v4 03/11] arm/arm64: smp: support more than
 8 cpus
To: Andrew Jones <drjones@redhat.com>, kvm@vger.kernel.org,
   kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <1478636499-14339-1-git-send-email-drjones@redhat.com>
 <1478636499-14339-4-git-send-email-drjones@redhat.com>
Cc: pbonzini@redhat.com, peter.maydell@linaro.org, alex.bennee@linaro.org,
   marc.zyngier@arm.com, eric.auger@redhat.com, christoffer.dall@linaro.org
From: Andre Przywara <andre.przywara@arm.com>
Organization: ARM Ltd.
Message-ID: <f5509dd7-594b-04c8-20b0-2986fe1bcc41@arm.com>
Date: Wed, 9 Nov 2016 11:12:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1478636499-14339-4-git-send-email-drjones@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-TUID: g27XF3ihHbVS

Hi,

On 08/11/16 20:21, Andrew Jones wrote:
> By adding support for launching with gicv3 we can break the 8 vcpu
> limit. This patch adds support to smp code and also selects the
> vgic model corresponding to the host. The vgic model may also be
> manually selected by adding e.g. -machine gic-version=3 to
> extra_params.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> 
> ---
> v4: improved commit message
> ---
>  arm/run                   | 19 ++++++++++++-------
>  arm/selftest.c            |  5 ++++-
>  lib/arm/asm/processor.h   |  9 +++++++--
>  lib/arm/asm/setup.h       |  4 ++--
>  lib/arm/setup.c           | 12 +++++++++++-
>  lib/arm64/asm/processor.h |  9 +++++++--
>  6 files changed, 43 insertions(+), 15 deletions(-)
> 
> diff --git a/arm/run b/arm/run
> index a2f35ef6a7e6..2d0698619606 100755
> --- a/arm/run
> +++ b/arm/run
> @@ -31,13 +31,6 @@ if [ -z "$ACCEL" ]; then
>  	fi
>  fi
>  
> -if [ "$HOST" = "aarch64" ] && [ "$ACCEL" = "kvm" ]; then
> -	processor="host"
> -	if [ "$ARCH" = "arm" ]; then
> -		processor+=",aarch64=off"
> -	fi
> -fi
> -
>  qemu="${QEMU:-qemu-system-$ARCH_NAME}"
>  qpath=$(which $qemu 2>/dev/null)
>  
> @@ -53,6 +46,18 @@ fi
>  
>  M='-machine virt'
>  
> +if [ "$ACCEL" = "kvm" ]; then
> +	if $qemu $M,\? 2>&1 | grep gic-version > /dev/null; then
> +		M+=',gic-version=host'
> +	fi
> +	if [ "$HOST" = "aarch64" ]; then
> +		processor="host"
> +		if [ "$ARCH" = "arm" ]; then
> +			processor+=",aarch64=off"
> +		fi
> +	fi
> +fi
> +
>  if ! $qemu $M -device '?' 2>&1 | grep virtconsole > /dev/null; then
>  	echo "$qpath doesn't support virtio-console for chr-testdev. Exiting."
>  	exit 2
> diff --git a/arm/selftest.c b/arm/selftest.c
> index 196164f5313d..2f117f795d2d 100644
> --- a/arm/selftest.c
> +++ b/arm/selftest.c
> @@ -312,9 +312,10 @@ static bool psci_check(void)
>  static cpumask_t smp_reported;
>  static void cpu_report(void)
>  {
> +	unsigned long mpidr = get_mpidr();
>  	int cpu = smp_processor_id();
>  
> -	report("CPU%d online", true, cpu);
> +	report("CPU(%3d) mpidr=%lx", mpidr_to_cpu(mpidr) == cpu, cpu, mpidr);
>  	cpumask_set_cpu(cpu, &smp_reported);
>  	halt();
>  }
> @@ -343,6 +344,7 @@ int main(int argc, char **argv)
>  
>  	} else if (strcmp(argv[1], "smp") == 0) {
>  
> +		unsigned long mpidr = get_mpidr();
>  		int cpu;
>  
>  		report("PSCI version", psci_check());
> @@ -353,6 +355,7 @@ int main(int argc, char **argv)
>  			smp_boot_secondary(cpu, cpu_report);
>  		}
>  
> +		report("CPU(%3d) mpidr=%lx", mpidr_to_cpu(mpidr) == 0, 0, mpidr);
>  		cpumask_set_cpu(0, &smp_reported);
>  		while (!cpumask_full(&smp_reported))
>  			cpu_relax();
> diff --git a/lib/arm/asm/processor.h b/lib/arm/asm/processor.h
> index f25e7eee3666..d2048f5f5f7e 100644
> --- a/lib/arm/asm/processor.h
> +++ b/lib/arm/asm/processor.h
> @@ -40,8 +40,13 @@ static inline unsigned int get_mpidr(void)
>  	return mpidr;
>  }
>  
> -/* Only support Aff0 for now, up to 4 cpus */
> -#define mpidr_to_cpu(mpidr) ((int)((mpidr) & 0xff))
> +#define MPIDR_HWID_BITMASK 0xffffff
> +extern int mpidr_to_cpu(unsigned long mpidr);
> +
> +#define MPIDR_LEVEL_SHIFT(level) \
> +	(((1 << level) >> 1) << 3)
> +#define MPIDR_AFFINITY_LEVEL(mpidr, level) \
> +	((mpidr >> MPIDR_LEVEL_SHIFT(level)) & 0xff)
>  
>  extern void start_usr(void (*func)(void *arg), void *arg, unsigned long sp_usr);
>  extern bool is_user(void);
> diff --git a/lib/arm/asm/setup.h b/lib/arm/asm/setup.h
> index cb8fdbd38dd5..b0d51f5f0721 100644
> --- a/lib/arm/asm/setup.h
> +++ b/lib/arm/asm/setup.h
> @@ -10,8 +10,8 @@
>  #include <asm/page.h>
>  #include <asm/pgtable-hwdef.h>
>  
> -#define NR_CPUS			8
> -extern u32 cpus[NR_CPUS];
> +#define NR_CPUS			255
> +extern u64 cpus[NR_CPUS];	/* per-cpu IDs (MPIDRs) */
>  extern int nr_cpus;
>  
>  #define NR_MEM_REGIONS		8
> diff --git a/lib/arm/setup.c b/lib/arm/setup.c
> index 7e7b39f11dde..b6e2d5815e72 100644
> --- a/lib/arm/setup.c
> +++ b/lib/arm/setup.c
> @@ -24,12 +24,22 @@ extern unsigned long stacktop;
>  extern void io_init(void);
>  extern void setup_args_progname(const char *args);
>  
> -u32 cpus[NR_CPUS] = { [0 ... NR_CPUS-1] = (~0U) };
> +u64 cpus[NR_CPUS] = { [0 ... NR_CPUS-1] = (~0U) };

This should be ~0UL.
Also I think the type should be unsigned long to match the types used
everywhere else.

>  int nr_cpus;
>  
>  struct mem_region mem_regions[NR_MEM_REGIONS];
>  phys_addr_t __phys_offset, __phys_end;
>  
> +int mpidr_to_cpu(unsigned long mpidr)
> +{
> +	int i;
> +
> +	for (i = 0; i < nr_cpus; ++i)
> +		if (cpus[i] == (mpidr & MPIDR_HWID_BITMASK))
> +			return i;
> +	return -1;
> +}
> +
>  static void cpu_set(int fdtnode __unused, u32 regval, void *info __unused)

I guess this needs to be extended as well, including
dt_for_each_cpu_node() to cope with 64-bit reg properties in the CPU
node (where the upper word is not 0).
But this is not really crucial atm, so can be fixed in a follow-up patch.

Cheers,
Andre.

>  {
>  	int cpu = nr_cpus++;
> diff --git a/lib/arm64/asm/processor.h b/lib/arm64/asm/processor.h
> index 9a208ff729b7..7e448dc81a6a 100644
> --- a/lib/arm64/asm/processor.h
> +++ b/lib/arm64/asm/processor.h
> @@ -78,8 +78,13 @@ static inline type get_##reg(void)				\
>  
>  DEFINE_GET_SYSREG64(mpidr)
>  
> -/* Only support Aff0 for now, gicv2 only */
> -#define mpidr_to_cpu(mpidr) ((int)((mpidr) & 0xff))
> +#define MPIDR_HWID_BITMASK 0xff00ffffff
> +extern int mpidr_to_cpu(unsigned long mpidr);
> +
> +#define MPIDR_LEVEL_SHIFT(level) \
> +	(((1 << level) >> 1) << 3)
> +#define MPIDR_AFFINITY_LEVEL(mpidr, level) \
> +	((mpidr >> MPIDR_LEVEL_SHIFT(level)) & 0xff)
>  
>  extern void start_usr(void (*func)(void *arg), void *arg, unsigned long sp_usr);
>  extern bool is_user(void);
> 

Received: by 10.25.27.66 with SMTP id b63csp799055lfb;
        Sat, 4 Jun 2016 11:16:23 -0700 (PDT)
X-Received: by 10.55.123.130 with SMTP id w124mr9309138qkc.164.1465064181032;
        Sat, 04 Jun 2016 11:16:21 -0700 (PDT)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id k91si7153786qtd.22.2016.06.04.11.16.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 Jun 2016 11:16:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx11.intmail.prod.int.phx2.redhat.com (int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1BFA7326BB;
	Sat,  4 Jun 2016 18:16:20 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-205.brq.redhat.com [10.34.1.205])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u54IG9nt008070;
	Sat, 4 Jun 2016 14:16:17 -0400
From: Andrew Jones <drjones@redhat.com>
To: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, pbonzini@redhat.com,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, andre.przywara@arm.com,
        peter.maydell@linaro.org, alex.bennee@linaro.org
Cc: christoffer.dall@linaro.org, marc.zyngier@arm.com
Subject: [kvm-unit-tests PATCH v2 03/10] arm/arm64: smp: support more than 8 cpus
Date: Sat,  4 Jun 2016 20:15:58 +0200
Message-Id: <1465064165-14885-4-git-send-email-drjones@redhat.com>
In-Reply-To: <1465064165-14885-1-git-send-email-drjones@redhat.com>
References: <1465064165-14885-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Sat, 04 Jun 2016 18:16:20 +0000 (UTC)
X-TUID: zkeHl0oTEWmH

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 arm/run                   | 19 ++++++++++++-------
 arm/selftest.c            |  5 ++++-
 lib/arm/asm/processor.h   |  9 +++++++--
 lib/arm/asm/setup.h       |  4 ++--
 lib/arm/setup.c           | 12 +++++++++++-
 lib/arm64/asm/processor.h |  9 +++++++--
 6 files changed, 43 insertions(+), 15 deletions(-)

diff --git a/arm/run b/arm/run
index a2f35ef6a7e63..2d0698619606e 100755
--- a/arm/run
+++ b/arm/run
@@ -31,13 +31,6 @@ if [ -z "$ACCEL" ]; then
 	fi
 fi
 
-if [ "$HOST" = "aarch64" ] && [ "$ACCEL" = "kvm" ]; then
-	processor="host"
-	if [ "$ARCH" = "arm" ]; then
-		processor+=",aarch64=off"
-	fi
-fi
-
 qemu="${QEMU:-qemu-system-$ARCH_NAME}"
 qpath=$(which $qemu 2>/dev/null)
 
@@ -53,6 +46,18 @@ fi
 
 M='-machine virt'
 
+if [ "$ACCEL" = "kvm" ]; then
+	if $qemu $M,\? 2>&1 | grep gic-version > /dev/null; then
+		M+=',gic-version=host'
+	fi
+	if [ "$HOST" = "aarch64" ]; then
+		processor="host"
+		if [ "$ARCH" = "arm" ]; then
+			processor+=",aarch64=off"
+		fi
+	fi
+fi
+
 if ! $qemu $M -device '?' 2>&1 | grep virtconsole > /dev/null; then
 	echo "$qpath doesn't support virtio-console for chr-testdev. Exiting."
 	exit 2
diff --git a/arm/selftest.c b/arm/selftest.c
index 5656f2bb1cc88..ad1f452f8ebfa 100644
--- a/arm/selftest.c
+++ b/arm/selftest.c
@@ -313,9 +313,10 @@ static bool psci_check(void)
 static cpumask_t smp_reported;
 static void cpu_report(void)
 {
+	unsigned long mpidr = get_mpidr();
 	int cpu = smp_processor_id();
 
-	report("CPU%d online", true, cpu);
+	report("CPU(%3d) mpidr=%lx", mpidr_to_cpu(mpidr) == cpu, cpu, mpidr);
 	cpumask_set_cpu(cpu, &smp_reported);
 	halt();
 }
@@ -344,6 +345,7 @@ int main(int argc, char **argv)
 
 	} else if (strcmp(argv[1], "smp") == 0) {
 
+		unsigned long mpidr = get_mpidr();
 		int cpu;
 
 		report("PSCI version", psci_check());
@@ -354,6 +356,7 @@ int main(int argc, char **argv)
 			smp_boot_secondary(cpu, cpu_report);
 		}
 
+		report("CPU(%3d) mpidr=%lx", mpidr_to_cpu(mpidr) == 0, 0, mpidr);
 		cpumask_set_cpu(0, &smp_reported);
 		while (!cpumask_full(&smp_reported))
 			cpu_relax();
diff --git a/lib/arm/asm/processor.h b/lib/arm/asm/processor.h
index f25e7eee3666c..d2048f5f5f7e6 100644
--- a/lib/arm/asm/processor.h
+++ b/lib/arm/asm/processor.h
@@ -40,8 +40,13 @@ static inline unsigned int get_mpidr(void)
 	return mpidr;
 }
 
-/* Only support Aff0 for now, up to 4 cpus */
-#define mpidr_to_cpu(mpidr) ((int)((mpidr) & 0xff))
+#define MPIDR_HWID_BITMASK 0xffffff
+extern int mpidr_to_cpu(unsigned long mpidr);
+
+#define MPIDR_LEVEL_SHIFT(level) \
+	(((1 << level) >> 1) << 3)
+#define MPIDR_AFFINITY_LEVEL(mpidr, level) \
+	((mpidr >> MPIDR_LEVEL_SHIFT(level)) & 0xff)
 
 extern void start_usr(void (*func)(void *arg), void *arg, unsigned long sp_usr);
 extern bool is_user(void);
diff --git a/lib/arm/asm/setup.h b/lib/arm/asm/setup.h
index cb8fdbd38dd5d..c501c6ddd8657 100644
--- a/lib/arm/asm/setup.h
+++ b/lib/arm/asm/setup.h
@@ -10,8 +10,8 @@
 #include <asm/page.h>
 #include <asm/pgtable-hwdef.h>
 
-#define NR_CPUS			8
-extern u32 cpus[NR_CPUS];
+#define NR_CPUS			255
+extern u64 cpus[NR_CPUS];
 extern int nr_cpus;
 
 #define NR_MEM_REGIONS		8
diff --git a/lib/arm/setup.c b/lib/arm/setup.c
index 8c6172ff94106..1d6b6949c920e 100644
--- a/lib/arm/setup.c
+++ b/lib/arm/setup.c
@@ -24,12 +24,22 @@ extern unsigned long stacktop;
 extern void io_init(void);
 extern void setup_args(const char *args);
 
-u32 cpus[NR_CPUS] = { [0 ... NR_CPUS-1] = (~0U) };
+u64 cpus[NR_CPUS] = { [0 ... NR_CPUS-1] = (~0U) };
 int nr_cpus;
 
 struct mem_region mem_regions[NR_MEM_REGIONS];
 phys_addr_t __phys_offset, __phys_end;
 
+int mpidr_to_cpu(unsigned long mpidr)
+{
+	int i;
+
+	for (i = 0; i < nr_cpus; ++i)
+		if (cpus[i] == (mpidr & MPIDR_HWID_BITMASK))
+			return i;
+	return -1;
+}
+
 static void cpu_set(int fdtnode __unused, u32 regval, void *info __unused)
 {
 	int cpu = nr_cpus++;
diff --git a/lib/arm64/asm/processor.h b/lib/arm64/asm/processor.h
index 9a208ff729b7e..7e448dc81a6aa 100644
--- a/lib/arm64/asm/processor.h
+++ b/lib/arm64/asm/processor.h
@@ -78,8 +78,13 @@ static inline type get_##reg(void)				\
 
 DEFINE_GET_SYSREG64(mpidr)
 
-/* Only support Aff0 for now, gicv2 only */
-#define mpidr_to_cpu(mpidr) ((int)((mpidr) & 0xff))
+#define MPIDR_HWID_BITMASK 0xff00ffffff
+extern int mpidr_to_cpu(unsigned long mpidr);
+
+#define MPIDR_LEVEL_SHIFT(level) \
+	(((1 << level) >> 1) << 3)
+#define MPIDR_AFFINITY_LEVEL(mpidr, level) \
+	((mpidr >> MPIDR_LEVEL_SHIFT(level)) & 0xff)
 
 extern void start_usr(void (*func)(void *arg), void *arg, unsigned long sp_usr);
 extern bool is_user(void);
-- 
2.4.11

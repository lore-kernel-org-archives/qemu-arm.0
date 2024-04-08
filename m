Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1293927ejh;
        Mon, 8 Apr 2024 07:09:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWj8B95+4ddG2KKWM//WPJhvlaGZ+uqaqufCfrtr7O7OFTFijldIWtFBN0/L44gJtwpxQBWeW+RlTxQO/mmJSJLNBuZEAcJ
X-Received: by 2002:a81:6f02:0:b0:615:16d9:4bf with SMTP id k2-20020a816f02000000b0061516d904bfmr7987655ywc.29.1712585370143;
        Mon, 08 Apr 2024 07:09:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712585370; cv=none;
        d=google.com; s=arc-20160816;
        b=E6G3wlCKDvWP1WyD1zRAyOSpfX4oYbEM8Qa3Ku/RAjmPxJOwNA+86cdXO9zsE9m7S2
         IEnpAr7YMsCID/AnqYPWxRvuv4KwMRFwAH6jy+DmoxvKCE2Lj64tS6WjbA5nt30pJVTk
         D2nl5OUFMl/q1T/fr/A+LJbp6eQv2/j5fsXzxuu67qAZ52brOGSg7TOve5Bl3gtmMxaO
         zX7iWPcfiR/WERwfX7um7GQgjsknNzNW5O3xO8GlW/8X3fPPD4wTCGcMCf8lY3NwqFaz
         GtQXmtAVWJPZB63xrrvRGsVmZfd6Ze2KvcgGN+UwH7t+off8wUAWokQu7K1E66RzjlRz
         7lWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=AMd8YNfC7PIDLuxaX4315ka/K6CHfBg/CUvv3sbGflM=;
        fh=t+wKR2RdfcD4uTeySVo3bhIEtc95IIeqH5+pXFg9Z1I=;
        b=l7DWfGMXJfPfVm/2j87Ez4dcwlgoiUhfUfbRyj9vFaD6TTeZbmybGEKrGENvs2EPmV
         GOM/TPQFLlREI8Z3O4LY5agFxfXdXuafUBHEjazHNm+0nPNi7QAYkZjLhD0Dkd7GnaY6
         XUP6ycps79RYiHyvZpgLVgKV99BIWMLGKo/5k77pmDCHzlgeixCHRIDrnQu5Zc+U596Q
         JSkirUxsZw8M0X3YEOQwjD3b6772X1KszHfMw5wMnFNXEHf5UtjPPhwRB3lIZDm2spzq
         2mAlt7nf/5TLe76A3zyi0A8kCV9kAytuNWMoMxxv9OfTyOgigD7qT0a7KomaMl3ZSamU
         DNgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="Xt3o5l/2";
       spf=pass (google.com: domain of 3mfotzggkcxye8aefw1w2aa270.ya8w70j.x09900749wda.ad2@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3mfoTZggKCxYE8AEFw1w2AA270.yA8w70J.x09900749wDA.AD2@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3mfoTZggKCxYE8AEFw1w2AA270.yA8w70J.x09900749wDA.AD2@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id r186-20020a0de8c3000000b006154912d77csor4305176ywe.1.2024.04.08.07.09.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 08 Apr 2024 07:09:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3mfotzggkcxye8aefw1w2aa270.ya8w70j.x09900749wda.ad2@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="Xt3o5l/2";
       spf=pass (google.com: domain of 3mfotzggkcxye8aefw1w2aa270.ya8w70j.x09900749wda.ad2@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3mfoTZggKCxYE8AEFw1w2AA270.yA8w70J.x09900749wDA.AD2@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712585369; x=1713190169; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AMd8YNfC7PIDLuxaX4315ka/K6CHfBg/CUvv3sbGflM=;
        b=Xt3o5l/2s0wafWre7Kw7eRF/IlHIhJzSCS1c+R4EF9ndsauu9YzVC57ryDCY/quexE
         /s8mPhM8iMHoIDfLSue47ci0RQS4s5nMUYfJ11PoyCsVGY6RyrUBOglIbiUtzcSBo+uQ
         Is2E3obbvgm54a6Qj9YDJXO90hbrnj1vHKS2P04/+wGsW0qzx4aHoC+qA/QUxn8U2eaK
         jg/7Zu03FgJaInMjQdH2gp/pemHd8elTdfgPeY7sS/OVp6JUZDqAJo/2GZxpU5+nVvy8
         9mIsG54MzLLsaFz3vgzzYSBsEOcFNGT+arxV01TiU9MV8bAl8EHI1JouAVfLhKfn17+p
         ovtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712585369; x=1713190169;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AMd8YNfC7PIDLuxaX4315ka/K6CHfBg/CUvv3sbGflM=;
        b=tMOZoLYC5Tmpl+89qvyMTZe50fImqp+Ar97gLF0drndY7Qmnt+dd7BEUTmiemW5fNC
         UkcNCnuVhyQe4D0dRBqrwnz/pW9Ip8A6K70uZxXQTT74RHBad25Gtdsf5BAnkA026V0B
         +tKpRgTYlE7j5VGCONknsJSNNuSQhxHhTxTkQgvjREQeXj4E05I7+U4sI1xF7nb7JED8
         wQwMWI+qsCP9aUbhJ8C6p+l8C3j0tguEtojjVoQHoLi9ijuoZ+FTgigDJRihe2vcMuk/
         Q9J1WTcB4eh+/idhOggg8aeO+X+v2Cpo4AHeOGi+r0rPEtAJCb3c68MiPDhi0xRNTMsp
         KN3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVuIkWOmWpJ/jIyWBckuIJANHf76XosiB/ymx43GPjLAjlcOoO5IqhnpaV0uXH9LzKmbOSjxViACLM3PCNEiQylKl46Wz34
X-Gm-Message-State: AOJu0YzhPB2LzhV4VsPYbfGFL0BV5NLNbEHpL6DqczrIhcO+yiFf++hK
	yWrDzMjlMG+9VCrgCn1bATDkuadfGukc3950Qsy3pMAhAJPUWyaqM2qkzNxGT0/sb35odmkfJbI
	a8l/SlxLJuA==
X-Google-Smtp-Source: AGHT+IGluNUcEdGNO/MW02ClIEjM8uOtannDp473rPxeJGa/ejn0j6js4csqJlN5iWXZrJXEDWT/oAQWrex+Lw==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a0d:d54a:0:b0:615:165b:8dde with SMTP id
 x71-20020a0dd54a000000b00615165b8ddemr2605640ywd.10.1712585369753; Mon, 08
 Apr 2024 07:09:29 -0700 (PDT)
Date: Mon,  8 Apr 2024 14:08:18 +0000
In-Reply-To: <20240408140818.3799590-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240408140818.3799590-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240408140818.3799590-14-smostafa@google.com>
Subject: [RFC PATCH v2 13/13] hw/arm/virt: Set SMMU OAS based on CPU PARANGE
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 8A2IhZm/I8Wk

Use the new SMMU property to make the SMMU OAS match the CPU PARANGE.
That's according to SMMU manual ARM IHI 0070F.b:
    6.3.6 SMMU_IDR5, OAS must match the system physical address size.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/virt.c      | 14 ++++++++++++--
 target/arm/cpu.h   |  2 ++
 target/arm/cpu64.c |  5 +++++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0af1943697..599c0f752b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -235,6 +235,13 @@ static bool ns_el2_virt_timer_present(void)
         arm_feature(env, ARM_FEATURE_EL2) && cpu_isar_feature(aa64_vh, cpu);
 }
 
+/* We rely on CPU to define system OAS. */
+static int32_t get_system_oas(void)
+{
+    ARMCPU *cpu = ARM_CPU(qemu_get_cpu(0));
+    return cpu_arm_get_oas(cpu);
+}
+
 static void create_fdt(VirtMachineState *vms)
 {
     MachineState *ms = MACHINE(vms);
@@ -1340,7 +1347,7 @@ static void create_pcie_irq_map(const MachineState *ms,
 }
 
 static void create_smmu(const VirtMachineState *vms,
-                        PCIBus *bus)
+                        PCIBus *bus, int32_t oas)
 {
     char *node;
     const char compat[] = "arm,smmu-v3";
@@ -1360,6 +1367,9 @@ static void create_smmu(const VirtMachineState *vms,
 
     object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
                              &error_abort);
+
+    qdev_prop_set_uint64(dev, "oas", oas);
+
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
     for (i = 0; i < NUM_SMMU_IRQS; i++) {
@@ -1534,7 +1544,7 @@ static void create_pcie(VirtMachineState *vms)
 
         switch (vms->iommu) {
         case VIRT_IOMMU_SMMUV3:
-            create_smmu(vms, vms->bus);
+            create_smmu(vms, vms->bus, get_system_oas());
             qemu_fdt_setprop_cells(ms->fdt, nodename, "iommu-map",
                                    0x0, vms->iommu_phandle, 0x0, 0x10000);
             break;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a5b3d8f7da..14ef1a9d37 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3408,4 +3408,6 @@ static inline target_ulong cpu_untagged_addr(CPUState *cs, target_ulong x)
 }
 #endif
 
+int32_t cpu_arm_get_oas(ARMCPU *cpu);
+
 #endif
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 985b1efe16..08da83c082 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -787,6 +787,11 @@ static const gchar *aarch64_gdb_arch_name(CPUState *cs)
     return "aarch64";
 }
 
+int32_t cpu_arm_get_oas(ARMCPU *cpu)
+{
+    return FIELD_EX64(cpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
+}
+
 static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
 {
     CPUClass *cc = CPU_CLASS(oc);
-- 
2.44.0.478.gd926399ef9-goog

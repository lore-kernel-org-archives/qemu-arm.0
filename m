Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp1931919ejb;
        Sun, 28 Apr 2024 20:25:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVAwN4jcta4guuFfMtn5aM4b3gsUqfJl4DIG/VvF69uvKXeRh7sEEkzzf2ljDpjxUliE4tF2wZG5SBME4UQAmcWMToGeq73
X-Received: by 2002:a5d:40cb:0:b0:349:9b7f:8df3 with SMTP id b11-20020a5d40cb000000b003499b7f8df3mr5191734wrq.40.1714361115135;
        Sun, 28 Apr 2024 20:25:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714361115; cv=none;
        d=google.com; s=arc-20160816;
        b=bV/fLdbAvtRZhgqgHOnJ7xClAPgib3c3gQHl5T40U+ab8UYmfEeoVJ6RKz1Vvwv9cD
         iUBU6AEjBZFnqsN1hs4IiKXj/eoRJdBoVIHEc3/3izeFuP7C7aMLcXXO6mIUrlgDMdnN
         tT+riUbubsKqg11XLQF46l3IOW5ycD1RHPJuCPQI0CBhG0gTmLkQ5gqChb5swNoPE06f
         rZmVTeZx/h4dzX8JM00f5vdzONkQSiALcmwjwy3m0Mm9U//d0u+17YIm3nZJ7BV6qeio
         jp/UG+dA7eUYEo8FN92fiPYvNlLIdVT204b+2/cajD1EXbZ00KHF30BZ6l+K5S+iqxEl
         GJtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=mSI5Y10hDHs+a73zrNudbgCqM/hO+BV89BxjmLOp0r4=;
        fh=NdgnCRZDRv106V0EoU3OiSRtWXRRxjQz3oobmNgf+bQ=;
        b=Ckb4hWvFL/BLLdHEq+IWoXSQpXjqjJPHoRCam/hzb4LHXuAfkVvOJ/7DFko3l3iilb
         mKDmKrPxBQwA2vngNfPygN105v/cEtUec/Aaz2q4bbHGQuVqNJXt481Mw48Wpzc0kvpx
         QJoxZdTUaSL5frvNa2LbQJwYO7hzqlxgYtj8N6ydQka9euvx9yr8t/LPUSbFDz6T95Fj
         qDpzTOLsXcyEX3V4IQcSDrlpdScCdgec4g6sIAqrb13tNVT70ROlmFBRJh2hFTOLHemX
         SONoNre0NALXhvBLFhCRGEogEiXwoWrbqivY4nPgsdc10jzHQIfUMKDGb9efqjC5shx5
         mxRw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=JtemGGBB;
       spf=pass (google.com: domain of 3ghmvzggkczujdfjkrwrxffxcv.tfdrcvo.sveevvczerif.fix@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3GhMvZggKCzUjdfjkRWRXffXcV.TfdRcVo.SVeeVVcZeRif.fiX@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3GhMvZggKCzUjdfjkRWRXffXcV.TfdRcVo.SVeeVVcZeRif.fiX@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id y2-20020adfc7c2000000b003466c7bca7csor5352924wrg.1.2024.04.28.20.25.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 28 Apr 2024 20:25:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3ghmvzggkczujdfjkrwrxffxcv.tfdrcvo.sveevvczerif.fix@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=JtemGGBB;
       spf=pass (google.com: domain of 3ghmvzggkczujdfjkrwrxffxcv.tfdrcvo.sveevvczerif.fix@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3GhMvZggKCzUjdfjkRWRXffXcV.TfdRcVo.SVeeVVcZeRif.fiX@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714361115; x=1714965915; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mSI5Y10hDHs+a73zrNudbgCqM/hO+BV89BxjmLOp0r4=;
        b=JtemGGBBLi/UW9qHxSpyOffqB6HmU9O5OPnzFPo87ZmPyWKlPVEQprmZ5CmH9hTprc
         iRBxqPnupCK4xByn9tMb4jDgMbrZ/XEGQEUQkEz0PM11Gv8S8QstsnkmFdo6MHUeNq/7
         OQe0+wthLP52f9PNib8qLI2X1WYWE635vffv0Tg042HE+KJMFV3GDWgCDbbvLC52IHFr
         KAZk66B2yxseuzM3mST0c+oG7u/QoswI75PYMzcfJOKYhQFZis5MbiRW7fp50j0heEyw
         ubJ+zJG4xjHvcKg2m3CeaNC9F5DQjMnmyDtg2nLpE1hx26P9ikzKJuw/+VM6a5aqb6z2
         F+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714361115; x=1714965915;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mSI5Y10hDHs+a73zrNudbgCqM/hO+BV89BxjmLOp0r4=;
        b=W3TvefMPPehL5gl7ShDyA4pYtt6Yts2c72+lfSLh1Pto6R/7VKCWT2Cf5tc5in45X9
         Q8LRF932IXWoVZsAG7GKgIYXt8fC4HRU3yvlFuWXwnVgmKOSif3zPafVxHfipU8hcreW
         BtlxUk0MHJTzhLH4a+z908ph/O2IqWtUCJw2Nzc5Uk9EpDc7/WUEH+e4YajvVMdfLRVm
         Iq95g2PKTmIai7UXih5wTd7ENDxBIMDPIf+BXGQlUIvg79RW6GdM3kQq8D0qEOKcOOhL
         l+wgsEy/pJ+MnkcsJhSlz1CBUZonhEKSDciXQWxKkvfYlOiQMUA6rj5upP7vgT/GhWJ3
         R6DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUs+Ivmu58xSNpoZUQLy/HaxVW33pyNIV9xf7n/qzPQLNAHhWXMv4Ifo1FnnN/QM46N9IMAlsGd6M1wvjkn6XzLPuHjhpun
X-Gm-Message-State: AOJu0YxHpTqcZmSu6NKO0XFlON0lOK0XewGHZ5H0b1hGlrRNrwWEognA
	pM5eaJ7gAtdO4heVZyKRIXXDU/OPYCRiKfDY421gLzgQb96vt2/lzH1w7J7Mz1rGKfwyM6yAw/B
	9ZUf1ufzKdA==
X-Google-Smtp-Source: AGHT+IExBhRwz10DGXfUQGJFfnfxKNB9h91NRBBof8jWz4h5F6LHkq8/pmh/Hlht3yc3mRETmvyDUPo7tbxz9Q==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:adf:f64f:0:b0:34b:c3e:5e03 with SMTP id
 x15-20020adff64f000000b0034b0c3e5e03mr16372wrp.0.1714361114848; Sun, 28 Apr
 2024 20:25:14 -0700 (PDT)
Date: Mon, 29 Apr 2024 03:24:02 +0000
In-Reply-To: <20240429032403.74910-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240429032403.74910-1-smostafa@google.com>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240429032403.74910-19-smostafa@google.com>
Subject: [RFC PATCH v3 18/18] hw/arm/virt: Set SMMU OAS based on CPU PARANGE
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: FswoCZ56L0TB

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
index 3c93c0c0a6..f203b1f8e1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -252,6 +252,13 @@ static bool ns_el2_virt_timer_present(void)
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
@@ -1384,7 +1391,7 @@ static void create_pcie_irq_map(const MachineState *ms,
 }
 
 static void create_smmu(const VirtMachineState *vms,
-                        PCIBus *bus)
+                        PCIBus *bus, int32_t oas)
 {
     char *node;
     const char compat[] = "arm,smmu-v3";
@@ -1404,6 +1411,9 @@ static void create_smmu(const VirtMachineState *vms,
 
     object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
                              &error_abort);
+
+    qdev_prop_set_uint64(dev, "oas", oas);
+
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
     for (i = 0; i < NUM_SMMU_IRQS; i++) {
@@ -1578,7 +1588,7 @@ static void create_pcie(VirtMachineState *vms)
 
         switch (vms->iommu) {
         case VIRT_IOMMU_SMMUV3:
-            create_smmu(vms, vms->bus);
+            create_smmu(vms, vms->bus, get_system_oas());
             qemu_fdt_setprop_cells(ms->fdt, nodename, "iommu-map",
                                    0x0, vms->iommu_phandle, 0x0, 0x10000);
             break;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 17efc5d565..68261ffbf9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3287,4 +3287,6 @@ static inline target_ulong cpu_untagged_addr(CPUState *cs, target_ulong x)
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
2.44.0.769.g3c40516874-goog

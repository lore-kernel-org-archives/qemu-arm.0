Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp572308ejd;
        Tue, 16 Apr 2024 12:01:15 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCX70qaPevjslSDeHETGqcmT2fWeR5nTMwsz3M1V21OtupWxPZUOfYypfI/SYFQFACBUcgOtOuejPA9KXrQrNW8OAyKu4pCo
X-Google-Smtp-Source: AGHT+IHRAgq+rkUzvM4a4UnM8dx9avHA1ARcCeutQRQXOl2640wvv2SE82neeggv4Wj84euaevwb
X-Received: by 2002:a17:902:e98d:b0:1e2:a7bf:516f with SMTP id f13-20020a170902e98d00b001e2a7bf516fmr12372990plb.64.1713294074818;
        Tue, 16 Apr 2024 12:01:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1713294074; cv=pass;
        d=google.com; s=arc-20160816;
        b=R7unmMi4VyMKd8yLmuPK3G9BDO+G0JwzyOtynL6S1DQ3gCDTYq96x2gRKEfMOJKVma
         4X6J6WDYjf6J88veBdSN0AEdQe1c7Emk9s8lQsv4J54gq3vwuj/ScfwUEq5PZq+E4GTz
         oI/1F13RIEGoS07Y5L7h+ul1lni4Rym0wvs4Iv4r2938cX++VkKOUYx+GHzQhG6Jf1eu
         aYO2+ap9zRWWUZ6NoF38XozaoK3QS9K6kZ5FfHfvJNNI2lEH+GD12QqP9C/LxAUHhZB6
         07QqqCjFhrYW1osXORteF34kU2g474PdeKSKR5cVp4Y7uEfATAl/BRG+iUolXbHCu3cG
         0KgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=oke/YPM4C6ufallz55sQ7YyPAmP6LUvQ2Lhm6MsGGjM=;
        fh=jHWj5oYgvikqSLqlgd73J4vKoWDdv9B8zQwYPA2pfUY=;
        b=mDcsvqaEs2SMyAXyDNYurHwfP/Pxqs6gMhXs1HEIPUo1ECqI/zIxhIYLKjP4Zx7FSF
         IqpLL7zOk8geTtEh69GQ2WFIZAOTUxFRH3Bj+g4O0wFgPVq9OuBvfU6NN2gfvmRR3UHX
         sloHhgirzhIZxb8Mz2r4ro1Y6nJ8WXN1552k76PN58tf5PZQoIhptxmSu3NuXGdiHmHq
         AYJJ6SXitfNsMsBmLODA+0YGcgCXbyazDQEULoROh0qR7OFmnj/uEU2h3u0CA5xfGwkd
         t+ZARRtsc+m97S+Z3cJvkWfVgJrSv4DskIdILCUtOmSlgkXx2cM7tzt19p3oOlNUQjsn
         1rbA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SoPK43xQ;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-14862-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-14862-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-14862-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d7-20020a170903230700b001e5c6404356si7789533plh.139.2024.04.16.12.01.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 12:01:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-14862-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SoPK43xQ;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-14862-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-14862-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 363C2282E10
	for <alex.bennee@linaro.org>; Tue, 16 Apr 2024 19:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A86E0137753;
	Tue, 16 Apr 2024 19:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SoPK43xQ"
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BD813473F
	for <kvm@vger.kernel.org>; Tue, 16 Apr 2024 19:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713294072; cv=none; b=eofhYmP6TgyzzT0wKJ3/jhY3R2JLNByqn87MbelG9YGiqWb4ehBfto8KZgpY7ud4RXuw92x8OZ4/g/WkFSSzCCaS2atmdwxyLh4GAfb4AHCGjKlMyYUt/k4FKUxErQ+WSVWA0MwYuSEQh/3FcTRDVTtzutaWiQ7BiLfbO3z70Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713294072; c=relaxed/simple;
	bh=4mIyC5aObfw+Fyk/PzsMCHoSjhSnC5HeEL3F+lT0pj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h1BYOlS2OJNoE3cxfZ8ZeKvv7nLciypSkayxVDfnl1TUMAg7BBu/U1hYsacBrBUEiMn75PlHwWMGmg9u8en+8V6PyBEBiKniu28foMQ/6eZ0/iKWWgJZOJAE2L9oLyMJ/YNHcsMJYqlavF/+XXVVHRcS7lFC4ZSHzHnvOqf5Wo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SoPK43xQ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a52223e004dso544064366b.2
        for <kvm@vger.kernel.org>; Tue, 16 Apr 2024 12:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713294069; x=1713898869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oke/YPM4C6ufallz55sQ7YyPAmP6LUvQ2Lhm6MsGGjM=;
        b=SoPK43xQd9Jr4YgwQguHrOx7GQz6LlSTqhLMBCNv4vrIcFwPnIvR/gP/TLP4g7HZON
         p7Oo2JSeci6sJxclCyAbu0qNqUuRy97MnsamPdRJAciFX9Zj+wvg5G2Qvp5gCAf4DnHI
         Jw4Uv5F9B03Sv7vGeXt7Q7pI4UPWRgPcAy7tXfSbrkJ+8E0l5ku4J+lwWiUyylmlyNi1
         v11AKeolsl8R0wNcYKxQ9Ap3+7dPzWT81PisXMH1k+hS2clDE/9SDJ9wxGDWbdz8bJmU
         ZU+8i3R2Sijjsfn8PQluZTLsk2BJN+0PS8Irfh+0/WUYNd8H1k0MgFGbPXzZuaQS1cwO
         jpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713294069; x=1713898869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oke/YPM4C6ufallz55sQ7YyPAmP6LUvQ2Lhm6MsGGjM=;
        b=ObXGU6mozc4EHLsD+wgLqgTfFu7UWItQuNv77tw1lWz7kO5jgp/8qorMt5qcH8mROL
         Mf3YiXD+bPrS913FXUBXYDo92kGJjInQl0Fuz98w7g+b8VqicK+06DnUKtipa03FWI/6
         gUnig3FlCHmpiM1uDh6GQ3+P8ScGCOJWiOkaB33unizeYEIn2b87Y8ODrmiJI118xqN0
         ZyBqT3MOxddn0dm4nVwgJNLGI30DwC0prLXJCTnlBe1KEshkOKIAyj8sEFu/4mH3IwPU
         I//ezPhLIWgSRBUfrYzCYTe01VIbpmukyJpC7Zi6Gu39d3K++ohgCnJOua0E/5Jsk2uo
         X17Q==
X-Forwarded-Encrypted: i=1; AJvYcCVXns7P2gvVwUol84FVLL+yNdDhoG4L+pTuox4SJCKynYV3aGfnWEyskXqDGm2PSFZCyBI+T1D9K/Ml4HiHQBYUdeIV
X-Gm-Message-State: AOJu0Yw12OTC63oU8+/Wnvc2zR1EEb56pUSneDv+cO4tze9d9yun7d1G
	BZxeGWAkjMcRUf2OOzbSmpfchhjvDmcJaOi4g5+DKPHWGdXpg5xDfA3mH890IUffoywzn07DZgl
	m
X-Received: by 2002:a17:906:ae8c:b0:a52:6fca:eb57 with SMTP id md12-20020a170906ae8c00b00a526fcaeb57mr4613401ejb.45.1713294069046;
        Tue, 16 Apr 2024 12:01:09 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.155.61])
        by smtp.gmail.com with ESMTPSA id jz1-20020a17090775e100b00a526457fc84sm3564186ejc.57.2024.04.16.12.01.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Apr 2024 12:01:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v4 13/22] hw/i386/pc: Remove PCMachineClass::enforce_aligned_dimm
Date: Tue, 16 Apr 2024 20:59:29 +0200
Message-ID: <20240416185939.37984-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240416185939.37984-1-philmd@linaro.org>
References: <20240416185939.37984-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5NG5WVu4ceVX

PCMachineClass::enforce_aligned_dimm was only used by the
pc-i440fx-2.1 machine, which got removed. It is now always
true. Remove it, simplifying pc_get_device_memory_range().
Update the comment in Avocado test_phybits_low_pse36().

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/i386/pc.h                  |  3 ---
 hw/i386/pc.c                          | 14 +++-----------
 tests/avocado/mem-addr-space-check.py |  9 ++++-----
 3 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index c2d9af36b2..231aae92ed 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -74,8 +74,6 @@ typedef struct PCMachineState {
  *
  * Compat fields:
  *
- * @enforce_aligned_dimm: check that DIMM's address/size is aligned by
- *                        backend's alignment value if provided
  * @acpi_data_size: Size of the chunk of memory at the top of RAM
  *                  for the BIOS ACPI tables and other BIOS
  *                  datastructures.
@@ -114,7 +112,6 @@ struct PCMachineClass {
     /* RAM / address space compat: */
     bool gigabyte_align;
     bool has_reserved_memory;
-    bool enforce_aligned_dimm;
     bool broken_reserved_end;
     bool enforce_amd_1tb_hole;
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 2bf1bfd5b2..c7bfdfc1e1 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -716,7 +716,6 @@ static void pc_get_device_memory_range(PCMachineState *pcms,
                                        hwaddr *base,
                                        ram_addr_t *device_mem_size)
 {
-    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     MachineState *machine = MACHINE(pcms);
     ram_addr_t size;
     hwaddr addr;
@@ -724,10 +723,8 @@ static void pc_get_device_memory_range(PCMachineState *pcms,
     size = machine->maxram_size - machine->ram_size;
     addr = ROUND_UP(pc_above_4g_end(pcms), 1 * GiB);
 
-    if (pcmc->enforce_aligned_dimm) {
-        /* size device region assuming 1G page max alignment per slot */
-        size += (1 * GiB) * machine->ram_slots;
-    }
+    /* size device region assuming 1G page max alignment per slot */
+    size += (1 * GiB) * machine->ram_slots;
 
     *base = addr;
     *device_mem_size = size;
@@ -1285,12 +1282,9 @@ void pc_i8259_create(ISABus *isa_bus, qemu_irq *i8259_irqs)
 static void pc_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
                                Error **errp)
 {
-    const PCMachineState *pcms = PC_MACHINE(hotplug_dev);
     const X86MachineState *x86ms = X86_MACHINE(hotplug_dev);
-    const PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     const MachineState *ms = MACHINE(hotplug_dev);
     const bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
-    const uint64_t legacy_align = TARGET_PAGE_SIZE;
     Error *local_err = NULL;
 
     /*
@@ -1315,8 +1309,7 @@ static void pc_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
         return;
     }
 
-    pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev),
-                     pcmc->enforce_aligned_dimm ? NULL : &legacy_align, errp);
+    pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), NULL, errp);
 }
 
 static void pc_memory_plug(HotplugHandler *hotplug_dev,
@@ -1780,7 +1773,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     pcmc->smbios_defaults = true;
     pcmc->gigabyte_align = true;
     pcmc->has_reserved_memory = true;
-    pcmc->enforce_aligned_dimm = true;
     pcmc->enforce_amd_1tb_hole = true;
     /* BIOS ACPI tables: 128K. Other BIOS datastructures: less than 4K reported
      * to be used at the moment, 32K should be enough for a while.  */
diff --git a/tests/avocado/mem-addr-space-check.py b/tests/avocado/mem-addr-space-check.py
index af019969c0..85541ea051 100644
--- a/tests/avocado/mem-addr-space-check.py
+++ b/tests/avocado/mem-addr-space-check.py
@@ -31,11 +31,10 @@ def test_phybits_low_pse36(self):
         at 4 GiB boundary when "above_4g_mem_size" is 0 (this would be true when
         we have 0.5 GiB of VM memory, see pc_q35_init()). This means total
         hotpluggable memory size is 60 GiB. Per slot, we reserve 1 GiB of memory
-        for dimm alignment for all newer machines (see enforce_aligned_dimm
-        property for pc machines and pc_get_device_memory_range()). That leaves
-        total hotpluggable actual memory size of 59 GiB. If the VM is started
-        with 0.5 GiB of memory, maxmem should be set to a maximum value of
-        59.5 GiB to ensure that the processor can address all memory directly.
+        for dimm alignment for all machines. That leaves total hotpluggable
+        actual memory size of 59 GiB. If the VM is started with 0.5 GiB of
+        memory, maxmem should be set to a maximum value of 59.5 GiB to ensure
+        that the processor can address all memory directly.
         Note that 64-bit pci hole size is 0 in this case. If maxmem is set to
         59.6G, QEMU should fail to start with a message "phy-bits are too low".
         If maxmem is set to 59.5G with all other QEMU parameters identical, QEMU
-- 
2.41.0


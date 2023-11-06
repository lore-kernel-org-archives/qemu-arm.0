Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2678972eja;
        Mon, 6 Nov 2023 03:09:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvj5WDzFLtjeU2Inh5GtWKnhfIumP0gyduEsncMSfRw3nS1b4xjqDOHjkD9IWv93GRNCy0
X-Received: by 2002:a05:6a20:3d20:b0:181:6afb:b814 with SMTP id y32-20020a056a203d2000b001816afbb814mr12714338pzi.6.1699268925701;
        Mon, 06 Nov 2023 03:08:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699268925; cv=none;
        d=google.com; s=arc-20160816;
        b=tUrufMHGp623nF53FTIVvhz1HnL7/dzJrbGHTuvgeNM0v5rIPas+7iuNEeyT0mNrXZ
         rQK4A6VTyRWcfsWSr0u276Gkkw6LYuMnZvTUAQev8GRd2vSLIkS0Ewm7TUlVT1upMls+
         NVfqeLKqCBIXnH7yHK1RlqPCUkLxV/d3UcOdSjWvIs6Efk9ZJBAlA9wW65upcQpXFLhA
         F5hT0Y3mthoWsS1Ig2mOUSC+8vzcFRbYTPIYl96iqsC3DiFBfcCXs2FsmPQ+jKDuncvm
         0R/T/6mH2/ohNCYxVdxtJesxvMc4PtRrAP25selTSVYUZ030/NYROCi8sdcvaL7jl4sV
         jl2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=pKMRzxqRYnKl/hVlIV0E2OCjWVD0Ib40S0FzpaLqDMw=;
        fh=L/qhuroVb3tR3NWg0+vDnGF1gMzkfjqMVSG/Df3vR+k=;
        b=RxelbVfJ8mfSRk0XouMycfaEmZDt4fmHrvUKRQeFXy1SH6fIKSj7xy/s5lUkVJssrP
         7Qxd78WE4y+xFs7aiE8FMYtQ7JN9m2fSNbSJ1G+iqUFY4fxwpbbQpcYtC26GrjJK+lf6
         J7fDIk/YrXSwSdi2vfRrWsRraeLm6Ylar/tjlgj4VvqCRPw8lzQDHZtRs5ZYdFY8iIH5
         qCo59psYy3M4rvYQABYcTnQfpf7VjDPGaT2DL38UEyNTEsgkhw2KWvmBxj0tFDFnUkTh
         AvvSxeYLt5EzE5cYU45P6TsIgZxSTfsS0laKN3l3SxMypcx9XZPF5PYy/xZ4XGqoo6Wj
         bwcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OisbtFhg;
       spf=pass (google.com: domain of kvm+bounces-712-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-712-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-712-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id q4-20020a170902c9c400b001cc23d2bb92si7090408pld.650.2023.11.06.03.08.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 03:08:45 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-712-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OisbtFhg;
       spf=pass (google.com: domain of kvm+bounces-712-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-712-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DA02B21B8B
	for <alex.bennee@linaro.org>; Mon,  6 Nov 2023 11:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A1CB18C27;
	Mon,  6 Nov 2023 11:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OisbtFhg"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F53718C07
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 11:08:37 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 377F6B0
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 03:08:35 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50939d39d0fso5615044e87.1
        for <kvm@vger.kernel.org>; Mon, 06 Nov 2023 03:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699268913; x=1699873713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKMRzxqRYnKl/hVlIV0E2OCjWVD0Ib40S0FzpaLqDMw=;
        b=OisbtFhgpMccEZi6GLYef7ecz1L3U/ERrOrIJJbeMlq06wL3dvDnSvnlencODy0+px
         Fhea6at7yz3YOefwp6ErKRQ0Oon7g3q12h04liCdt4hdMisV6U+z6tG1mxtH6qQGoB8j
         K3TL1A5IYCX8wvdMiU844ZjbhYMuEC/XYO24+DeYGf302f2ax3qWs7MUoc8iNoanfElu
         lYSo3gF0PN+Qzr6IuNypMR7bJQho9feiKE+n/JhLehz7gBshX0uBGJ9HcDTNCCSVR55n
         jWq/vBTx9B2l0FUmWYs7tv+A8ZDCnra7xo26b8akheyQJdBClq0PNBoPLAs+aFELVKzd
         25jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268913; x=1699873713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pKMRzxqRYnKl/hVlIV0E2OCjWVD0Ib40S0FzpaLqDMw=;
        b=gy4SUjjGSeHfaTyVnQHidDiKHmjN/2og+bow/4knw243Q1GobSLaeuJupGJpCIjyHm
         QduUxGtnw6NWq3vgXLoTZxZ4Hh1Kt7RPFKWhgMck2+ogTdapn5N9+SyFlyV1t3TNrFTX
         jq2Skzy1ZK1A1J899P8HGJ+Et5EdPxpNgBcoLWGNEzqFkJaiFuvFqt0+wn0xckQkDuHd
         GV9hn51GtT0Uyag2ArQUWDIas0BQ4NVKGQBFMgvfpEO2lzDD1LsDIAYkgA19heaNa3v8
         5Olm89gLn/oSHFTU6aDdE9qa968WE50fIW0i6R0/C0Ob/Ii/QvmW/JnkSyVR+yUdEZGX
         U3sw==
X-Gm-Message-State: AOJu0Yz2R1I6igw51djbxxNV41KO3Bfchlzv8OArrAHUdVFrofg87rxw
	wZIhKWYBDPAbSRfn2ofA9ObJ4g==
X-Received: by 2002:ac2:5e6d:0:b0:504:4165:54ab with SMTP id a13-20020ac25e6d000000b00504416554abmr19292506lfr.56.1699268913486;
        Mon, 06 Nov 2023 03:08:33 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
        by smtp.gmail.com with ESMTPSA id k8-20020a05600c1c8800b004081a011c0esm11883242wms.12.2023.11.06.03.08.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Nov 2023 03:08:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-s390x@nongnu.org,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Xiaoyao Li <xiaoyao.li@Intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Yongwei Ma <yongwei.ma@intel.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 43/60] hw/i386: Fix comment style in topology.h
Date: Mon,  6 Nov 2023 12:03:15 +0100
Message-ID: <20231106110336.358-44-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: tga5Gj6aZGvr

From: Zhao Liu <zhao1.liu@intel.com>

For function comments in this file, keep the comment style consistent
with other files in the directory.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@Intel.com>
Reviewed-by: Babu Moger <babu.moger@amd.com>
Tested-by: Babu Moger <babu.moger@amd.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-ID: <20231024090323.1859210-2-zhao1.liu@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/i386/topology.h | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/include/hw/i386/topology.h b/include/hw/i386/topology.h
index 380cb27ded..d4eeb7ab82 100644
--- a/include/hw/i386/topology.h
+++ b/include/hw/i386/topology.h
@@ -24,7 +24,8 @@
 #ifndef HW_I386_TOPOLOGY_H
 #define HW_I386_TOPOLOGY_H
 
-/* This file implements the APIC-ID-based CPU topology enumeration logic,
+/*
+ * This file implements the APIC-ID-based CPU topology enumeration logic,
  * documented at the following document:
  *   Intel® 64 Architecture Processor Topology Enumeration
  *   http://software.intel.com/en-us/articles/intel-64-architecture-processor-topology-enumeration/
@@ -41,7 +42,8 @@
 
 #include "qemu/bitops.h"
 
-/* APIC IDs can be 32-bit, but beware: APIC IDs > 255 require x2APIC support
+/*
+ * APIC IDs can be 32-bit, but beware: APIC IDs > 255 require x2APIC support
  */
 typedef uint32_t apic_id_t;
 
@@ -58,8 +60,7 @@ typedef struct X86CPUTopoInfo {
     unsigned threads_per_core;
 } X86CPUTopoInfo;
 
-/* Return the bit width needed for 'count' IDs
- */
+/* Return the bit width needed for 'count' IDs */
 static unsigned apicid_bitwidth_for_count(unsigned count)
 {
     g_assert(count >= 1);
@@ -67,15 +68,13 @@ static unsigned apicid_bitwidth_for_count(unsigned count)
     return count ? 32 - clz32(count) : 0;
 }
 
-/* Bit width of the SMT_ID (thread ID) field on the APIC ID
- */
+/* Bit width of the SMT_ID (thread ID) field on the APIC ID */
 static inline unsigned apicid_smt_width(X86CPUTopoInfo *topo_info)
 {
     return apicid_bitwidth_for_count(topo_info->threads_per_core);
 }
 
-/* Bit width of the Core_ID field
- */
+/* Bit width of the Core_ID field */
 static inline unsigned apicid_core_width(X86CPUTopoInfo *topo_info)
 {
     return apicid_bitwidth_for_count(topo_info->cores_per_die);
@@ -87,8 +86,7 @@ static inline unsigned apicid_die_width(X86CPUTopoInfo *topo_info)
     return apicid_bitwidth_for_count(topo_info->dies_per_pkg);
 }
 
-/* Bit offset of the Core_ID field
- */
+/* Bit offset of the Core_ID field */
 static inline unsigned apicid_core_offset(X86CPUTopoInfo *topo_info)
 {
     return apicid_smt_width(topo_info);
@@ -100,14 +98,14 @@ static inline unsigned apicid_die_offset(X86CPUTopoInfo *topo_info)
     return apicid_core_offset(topo_info) + apicid_core_width(topo_info);
 }
 
-/* Bit offset of the Pkg_ID (socket ID) field
- */
+/* Bit offset of the Pkg_ID (socket ID) field */
 static inline unsigned apicid_pkg_offset(X86CPUTopoInfo *topo_info)
 {
     return apicid_die_offset(topo_info) + apicid_die_width(topo_info);
 }
 
-/* Make APIC ID for the CPU based on Pkg_ID, Core_ID, SMT_ID
+/*
+ * Make APIC ID for the CPU based on Pkg_ID, Core_ID, SMT_ID
  *
  * The caller must make sure core_id < nr_cores and smt_id < nr_threads.
  */
@@ -120,7 +118,8 @@ static inline apic_id_t x86_apicid_from_topo_ids(X86CPUTopoInfo *topo_info,
            topo_ids->smt_id;
 }
 
-/* Calculate thread/core/package IDs for a specific topology,
+/*
+ * Calculate thread/core/package IDs for a specific topology,
  * based on (contiguous) CPU index
  */
 static inline void x86_topo_ids_from_idx(X86CPUTopoInfo *topo_info,
@@ -137,7 +136,8 @@ static inline void x86_topo_ids_from_idx(X86CPUTopoInfo *topo_info,
     topo_ids->smt_id = cpu_index % nr_threads;
 }
 
-/* Calculate thread/core/package IDs for a specific topology,
+/*
+ * Calculate thread/core/package IDs for a specific topology,
  * based on APIC ID
  */
 static inline void x86_topo_ids_from_apicid(apic_id_t apicid,
@@ -155,7 +155,8 @@ static inline void x86_topo_ids_from_apicid(apic_id_t apicid,
     topo_ids->pkg_id = apicid >> apicid_pkg_offset(topo_info);
 }
 
-/* Make APIC ID for the CPU 'cpu_index'
+/*
+ * Make APIC ID for the CPU 'cpu_index'
  *
  * 'cpu_index' is a sequential, contiguous ID for the CPU.
  */
-- 
2.41.0


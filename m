Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp3170284dlj;
        Wed, 15 Jan 2025 09:10:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWV2W+lMPtm0EAEYIdoCHRoD7cX0M0uqVfapZlmstIIYH2D9qoNfGILGyvRsWMTt1ASNOfm0iLKq22nDQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFGckwYliEPBeW+zihIyRuXPsVypBJZ+ynMuAI2tNNGhAKZ4zdLemKnXX0ZpVFpCsDHF3XZ
X-Received: by 2002:a05:6214:41a1:b0:6d8:b401:44a6 with SMTP id 6a1803df08f44-6df9b2e8241mr415119496d6.43.1736961041613;
        Wed, 15 Jan 2025 09:10:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736961041; cv=none;
        d=google.com; s=arc-20240605;
        b=IlwQNPO4OgRzBxRVRLcBjaYCLZVdcqt6SVykA6cOXciPhd1iSsahrJ/okP0TL2yyb0
         n1uxXMX/24ncNoVKp44e5NfgrY5V9Ew6Oxt3WwArNjyGUyc//s7JM+c7pbSWbefPCarg
         O08W/hzD8mCgdVCc130DkKigLU1KmDTejWWMX4NkqWsEbuv13f/i+YvMFmO/qJd/kk0o
         t4H8Ofprtc9ZH4+P0mrHy03CzQA5jAKAvfA2FR7RHiLEN4xV6f42y6CZVFolOwQZ8qWC
         nQICPeGCprJtRCECPAxvMGMENfZ1+u3vGJ128qV7RNK702J8g4KxRbSpflnC588mC4Mz
         LCyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KxP4KhsAoIrkijG1kO5uGQ16mZCFRr5vQmqFMkBbKho=;
        fh=Gho7kmtmDt5LF2oFMronvkLUkNvBVWpZTVicgaD6l2U=;
        b=ZGAywgUSZqDicbiY6OOoNQA8j8WSJ3l12woK7eGyzuKL4fiqYUqB6TMVQkD/P0pvnl
         CA8sCTC0DFbDPko9TVI31/d0c7qjhG+1rjHJc8EuypWiHxuAkQTY8GqdlJtDfOiw0KwP
         bvV8wD5k0vS4v8DsUHeqXH/0sG1SjbQP8dkcVRLC2sSvLzVskhU+WDTVnBCinggpEUwt
         R1fYi9FvS+j8r+MBo1/F6MTPBp9aqdQFvWVx/hwP5TlAd3RZF8/HikghILGE0LEFXIYQ
         LMoavU6w1g0ZpoceQL0qGSCxpMcA1p9RCcKV+/wHe2XoPh3j5g1Wdl3NlKcAlJLLt982
         C1vA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bUzX4RRf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dfadff92ebsi154330996d6.421.2025.01.15.09.10.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 09:10:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bUzX4RRf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tY6uX-0007L9-1J; Wed, 15 Jan 2025 12:10:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tY6uS-0007FE-Ch
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 12:10:29 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tY6uQ-0006XB-RW
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 12:10:28 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so71877105e9.3
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2025 09:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736961025; x=1737565825; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KxP4KhsAoIrkijG1kO5uGQ16mZCFRr5vQmqFMkBbKho=;
 b=bUzX4RRfcRFBpDxZOruj8TseBkNkL9m9X5j58p1HMr5yg7S5g4UeN8u9RqcdMF3hQJ
 p4xyqRer14BRBJ8WV/JJpnQlkZothot5pR4Ksfsz2dwbjRbi3b4Q53AGk2pwWB45cRIf
 /9ICOML6iIKKzzwFeOjxlju3//kJbLkeRQYpBE71NCMQLCOUNEsT0Lkz9BDc/RRQGWXM
 JE8mb8sE4XLq2lK2jcby4VvYDatWMLtOYdPOwWWNs0R1JAZkEJTRJTlCUV2kJ0cssGO/
 KGuF1J5Fr9p5ooK+dL+UG9mxQbUWQRv3pL2k+yvlKxh9yXkweMUImum9cL+wnTKkEHh/
 wtXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736961025; x=1737565825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KxP4KhsAoIrkijG1kO5uGQ16mZCFRr5vQmqFMkBbKho=;
 b=dv2s6sS2CTteyb5VwlguSEzMdrInQcPtzRaKBed72//E5zbBTQLTcNdPZgvzgI8gfH
 i9hRC8nHe/HTlQBm95V74HcROz0QbFBfaj4zW8JiK+IiZi/Syr1U6YP5IxAIMaMJDFDB
 t3VoxT91Ey4VEJt+lATgu7j+q/Bclv1/b4fdK1mVrN+07/5RCgkplMOZSyFnMeDYmMSX
 pS6rdOR6k3sk6l+z80Y9SNQ03Vfrkupr4BEWyBZjQHJO5BVhYtGI897tFt6VVKbMAVC0
 9wa7N8cP+Qg+ArzNvWdSlVuvAvOLR9I5BWdxwk1fnbcrzcIKWFpy1e0g60tCHTsC2rMB
 W3AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhLQch7gwQwDce28jnwPpjYWpDnzrKTzdoHZgrCaqavOJ6j6bVYUy283MY5O0I4LAXOgGAP0JDug==@nongnu.org
X-Gm-Message-State: AOJu0Yw0WiOSjLebNfzbS/Ac2ZugoI6WPNEvK8pTeZBdYhAQaHIMNdAo
 r70IonnUco0c4Xl6PF6Zn5VVvpe3YGIUGgfsRjIEiwXLJD58+iMYagSCQvlEiwc=
X-Gm-Gg: ASbGnctdktq2eSUXWDylHbDCn9G1sxfFMf150Cs5IXkdOWlSAR3Kelap6VTPA+oQrx4
 TzQNK6kmb+gFi4Xqcyd65nvCKnC+hfzOSDW7ix7MVYwViS3Fa8Mt6cVMeAKw0rzFVaNeY3owy1d
 eM+Q+zaTIEGXKczlXSLduutrkFJ1TQknGO2jzJUzoSth+390DPPL038hvtO443KYjfTDOGuCYGa
 Ict3zKfCdX4jAcBZjpk5u7FpGUsRMx4sPnaSE7aPAa9R5HAw5Fa0QZq7XJ6TnhptdDgsHQVMk3n
 urHir1Em+uQGYxZB/rUEFEz03nRtlI1MzEBa
X-Received: by 2002:a05:600c:4586:b0:434:edcf:7461 with SMTP id
 5b1f17b1804b1-436e26f135bmr299719435e9.30.1736961025128; 
 Wed, 15 Jan 2025 09:10:25 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74ace90sm30491535e9.16.2025.01.15.09.10.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Jan 2025 09:10:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>, qemu-arm@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 03/13] hw/arm/virt: Remove
 VirtMachineClass::disallow_affinity_adjustment
Date: Wed, 15 Jan 2025 18:09:59 +0100
Message-ID: <20250115171009.19302-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250115171009.19302-1-philmd@linaro.org>
References: <20250115171009.19302-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jOjPeS2Vr0E8

The VirtMachineClass::disallow_affinity_adjustment
field was only used by virt-2.6 machine, which got
removed. Remove it along with the GIC*_TARGETLIST_BITS
definitions, and simplify virt_cpu_mp_affinity().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/virt.h              |  1 -
 include/hw/intc/arm_gic.h          |  1 -
 include/hw/intc/arm_gicv3_common.h |  3 ---
 hw/arm/virt.c                      | 16 ----------------
 4 files changed, 21 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 27c5bb585cb..5d3b25509ff 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -117,7 +117,6 @@ typedef enum VirtGICType {
 
 struct VirtMachineClass {
     MachineClass parent;
-    bool disallow_affinity_adjustment;
     bool no_its;
     bool no_tcg_its;
     bool claim_edge_triggered_timers;
diff --git a/include/hw/intc/arm_gic.h b/include/hw/intc/arm_gic.h
index 48f6a51a70a..f5e6e5e70b4 100644
--- a/include/hw/intc/arm_gic.h
+++ b/include/hw/intc/arm_gic.h
@@ -68,7 +68,6 @@
 #include "qom/object.h"
 
 /* Number of SGI target-list bits */
-#define GIC_TARGETLIST_BITS 8
 #define GIC_MAX_PRIORITY_BITS 8
 #define GIC_MIN_PRIORITY_BITS 4
 
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index a3d6a0e5077..fff5e55a97d 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -45,9 +45,6 @@
 #define GICV3_REDIST_SIZE 0x20000
 #define GICV4_REDIST_SIZE 0x40000
 
-/* Number of SGI target-list bits */
-#define GICV3_TARGETLIST_BITS 16
-
 /* Maximum number of list registers (architectural limit) */
 #define GICV3_LR_MAX 16
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0080577e1a9..2a2a0bd9154 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1760,23 +1760,7 @@ void virt_machine_done(Notifier *notifier, void *data)
 static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
 {
     uint8_t clustersz = ARM_DEFAULT_CPUS_PER_CLUSTER;
-    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
 
-    if (!vmc->disallow_affinity_adjustment) {
-        /* Adjust MPIDR like 64-bit KVM hosts, which incorporate the
-         * GIC's target-list limitations. 32-bit KVM hosts currently
-         * always create clusters of 4 CPUs, but that is expected to
-         * change when they gain support for gicv3. When KVM is enabled
-         * it will override the changes we make here, therefore our
-         * purposes are to make TCG consistent (with 64-bit KVM hosts)
-         * and to improve SGI efficiency.
-         */
-        if (vms->gic_version == VIRT_GIC_VERSION_2) {
-            clustersz = GIC_TARGETLIST_BITS;
-        } else {
-            clustersz = GICV3_TARGETLIST_BITS;
-        }
-    }
     return arm_build_mp_affinity(idx, clustersz);
 }
 
-- 
2.47.1


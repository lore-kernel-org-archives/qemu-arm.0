Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp394139lfq;
        Tue, 8 Sep 2020 01:15:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNEb3puW8v61mrYyzusLi3lqLiYraHjHvig2Y8huoT1j42My5mxs6FHh5mHTS6yXLuFyDI
X-Received: by 2002:a25:dace:: with SMTP id n197mr12965367ybf.351.1599552924245;
        Tue, 08 Sep 2020 01:15:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599552924; cv=none;
        d=google.com; s=arc-20160816;
        b=TLjTuIkdhVTe4Is6gu9Z5w6aWQxSClmcN0OPgYQEwXOc3l79ltfVEoor4mMWX2hgiR
         MrvSlmEYUheWSFGHxHWi+BtQ1pj48eFIBVyIf0+kFq5sm0FTI00LsAxMt82oLm/wWJZy
         dpdlNHQbZnVpzJkFTv9bKem/hGjqAFnUNtty/ta6vRtHqYZu5ELJ2QI8kszXyGX4iYAs
         EDaH2TVGOIyp6wPAmaJk7+Zc8GzzCuRiTkvWNH2jsp2X9RLguSg61PlYS3kKGSq7IyuB
         dQOC75HozhkMsJFZubyJNjjMmDgGDWiS3+0OcTwyY9tao/xQIIHPMUAvA5OhSTDBrIIl
         BWbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hvtYY966srnK5wG0YbtFj+vFvT8ZWyaFHw3B2vowdgs=;
        b=KImLpjWthUIdXVO7jOubcNYHk/4LSK81lPwaJopPcAMeS1Y3S/SLVbn0PCCmqsB8Zn
         vDddTNSyzhKZ16+wINpYhajJan4OhAGAwJ+0ghORSaKgvZxZIrCtZjYICFffA1Uae1dk
         uJh0s1DN4Mz1zMG/odu/klFMgeM8tI6b51Z8lMVXq8v8IOliTqhuEWd5hxbApJRV7d6C
         ma4I1UeecOixBqU6gpaS7K0Njk34USCqr45jtnUe/h4PxlZ4edHn+5bj6/EICXG9Dm43
         PSI3O80ZYRIOREI/IhctTS6R4oGMX1e0+rir7o2867SvaYayjdi4bKDhaBnlr4aBuRFE
         9Ktw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UN562Vwk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l186si16569174ybl.251.2020.09.08.01.15.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 01:15:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UN562Vwk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFYmh-0008Bz-Hm
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 04:15:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFYlG-0005pe-9V
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 04:13:54 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:33471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFYlE-0000SG-8i
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 04:13:53 -0400
Received: by mail-pf1-x441.google.com with SMTP id c196so4851282pfc.0
 for <qemu-devel@nongnu.org>; Tue, 08 Sep 2020 01:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hvtYY966srnK5wG0YbtFj+vFvT8ZWyaFHw3B2vowdgs=;
 b=UN562VwkN4m/so7koho/gMRFletaKtsYpQDYr/Qs5O5VIF+hkVHSdTs9F48prIClND
 sqf8/ep/mt/JXaDfjzVN2Ma2/VLYxpuVKA/MM9poc3mBXgA0PE4vLIMAXp16L38J8Yjm
 bsfe8kXLAF0W3fgXrZ/lDYrJbdDWmskVc995fL1Lkp21hXLXAbVzKPp7al8HN201fUCT
 GiXZ2s6oU0ba+3OaKthBjfzJcvk2viX2FPGJ6V2MAnqBdhyS2s98ypgsFjm/4XXYCGly
 FChbXpw0rcdZwIoAFAliYoCjht4A8P9cOrcyJAJh+b7sFwqR+dsQJAd2MkVjyGVJJp7v
 IWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hvtYY966srnK5wG0YbtFj+vFvT8ZWyaFHw3B2vowdgs=;
 b=jKVzaYdP6w0H6aoTEhpZTOuFiBzlNRsruL86qaFG4y1ravViAlNJPknd+umIihSIS5
 VpUAKVXANB5ZlakrMjQXuYzfBJLWpkQQkBJfgxNFaXqdAmcXzd1IDagi9Pd5EbHfpx6h
 Ei3pdzqgI9SeodTSt/Xs8LQYbWP9Le8kPaAlZNkVI2ivAxq5+XJFbgZ5Uq77s2HgPeGR
 4uO/3sgfIJPTcqohlYgAkUjnx2Uvx4+aI9xGnwXwe16xnXcNk1mH1zbRlUNw8Mjpilrj
 RNXF/gJqrx0LsTGM8ad/7zm1tu5G9tBxzE2AvLXfu6h3K6hQkXdxA/kpbf4oDFZ6PpTG
 Y04g==
X-Gm-Message-State: AOAM531bmpx7cEXTdhL3U/LcjKPv8fQqRCjb1eCU3WwR/g58ptbakuvS
 GMe+SgR2k9FUhvR35SLbOLhf
X-Received: by 2002:a63:3841:: with SMTP id h1mr18425109pgn.38.1599552830846; 
 Tue, 08 Sep 2020 01:13:50 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id m190sm16934788pfm.184.2020.09.08.01.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 01:13:50 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: drjones@redhat.com,
	richard.henderson@linaro.org
Subject: [PATCH v2 07/12] hw/arm/virt: Move post cpu realize check into its
 own function
Date: Tue,  8 Sep 2020 08:13:25 +0000
Message-Id: <04a3f2e202d9e84cefa431101eaf4c7e0cbd1a0d.1599549462.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1599549462.git.haibo.xu@linaro.org>
References: <cover.1599549462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=haibo.xu@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +N6qJSNWignB

From: Andrew Jones <drjones@redhat.com>

We'll add more to this new function in coming patches so we also
state the gic must be created and call it below create_gic().

No functional change intended.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3f6d26c531..2ffcb073af 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1672,6 +1672,26 @@ static void finalize_gic_version(VirtMachineState *vms)
     }
 }
 
+static void virt_cpu_post_init(VirtMachineState *vms)
+{
+    bool aarch64;
+
+    aarch64 = object_property_get_bool(OBJECT(first_cpu), "aarch64", NULL);
+
+    if (!kvm_enabled()) {
+        if (aarch64 && vms->highmem) {
+            int requested_pa_size = 64 - clz64(vms->highest_gpa);
+            int pamax = arm_pamax(ARM_CPU(first_cpu));
+
+            if (pamax < requested_pa_size) {
+                error_report("VCPU supports less PA bits (%d) than requested "
+                            "by the memory map (%d)", pamax, requested_pa_size);
+                exit(1);
+            }
+        }
+     }
+}
+
 static void machvirt_init(MachineState *machine)
 {
     VirtMachineState *vms = VIRT_MACHINE(machine);
@@ -1890,22 +1910,6 @@ static void machvirt_init(MachineState *machine)
     fdt_add_timer_nodes(vms);
     fdt_add_cpu_nodes(vms);
 
-   if (!kvm_enabled()) {
-        ARMCPU *cpu = ARM_CPU(first_cpu);
-        bool aarch64 = object_property_get_bool(OBJECT(cpu), "aarch64", NULL);
-
-        if (aarch64 && vms->highmem) {
-            int requested_pa_size, pamax = arm_pamax(cpu);
-
-            requested_pa_size = 64 - clz64(vms->highest_gpa);
-            if (pamax < requested_pa_size) {
-                error_report("VCPU supports less PA bits (%d) than requested "
-                            "by the memory map (%d)", pamax, requested_pa_size);
-                exit(1);
-            }
-        }
-    }
-
     memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base,
                                 machine->ram);
     if (machine->device_memory) {
@@ -1917,6 +1921,8 @@ static void machvirt_init(MachineState *machine)
 
     create_gic(vms);
 
+    virt_cpu_post_init(vms);
+
     fdt_add_pmu_nodes(vms);
 
     create_uart(vms, VIRT_UART, sysmem, serial_hd(0));
-- 
2.17.1


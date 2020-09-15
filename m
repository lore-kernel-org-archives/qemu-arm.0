Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2798663lfq;
        Mon, 14 Sep 2020 20:17:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPSNgL9k0NQuX7gfH2H5NGgwpM5a+n8W5LIw0oz675Zu2fWLH1YNNaih4Gi0WO6wwoPgRJ
X-Received: by 2002:a05:620a:b1a:: with SMTP id t26mr15695388qkg.353.1600139878452;
        Mon, 14 Sep 2020 20:17:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600139878; cv=none;
        d=google.com; s=arc-20160816;
        b=YHUZg9utrJ7NQI1e/O1I/2B+a/ruYMRlruIOuTb+v5hc9AYasMj7He4jj05k7f5+qu
         WamIQXXs9iK54cCPGGN5jh3GrGmu86v568GiQsJCxl3aOuROPS7E/lNvyuW2YwLllasA
         qdNtxGmjShVmxbRrn7mXr65+4bCUHyC/ZGBZYEpxGCzOGFocLd1KVPyihmD5uVZWXRFE
         7WYHT0rsYn3HUGRoGUdxMmNUNMttHh+EfzCIq/GVGBelUt7jrf/VvpSJUJ0KXLvgchQk
         V9Q0p/siIjODhefYHqoRVpPvYuUexsLVyhKDXAs3sxfqEZdrEJAq8P2sii/uyQg15k6x
         nLgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qMrkJnwKfU2uQTjfoYTo9jsqV6eugUKH6001G6BMUT0=;
        b=xs+8caIqy7Fn7HAYJMoW24ux8TrglBHDz5GxmU/crNkCYGIYgcn2sSoXv2I0UURZDv
         AQtu1OooB+BkD1iXZY1FKgiWosIDJIJuTko/7Vzkj/OyZNVIdMe3Hrg8ABn3KcQrzux8
         7AhojE/lhVomfM6L1B5sHrO+6U5I2LTzL+/ZAE3BhOM5yuEN/AAFgIo1J77+H8IT9lgl
         fHLqDzljKkh2HXfh3WPEHGQovW08drsUihhrlRkqU1T225j6tKCLbZxh+bOjltkHCHq1
         3MAfHvZrvq1O2VOaCKxxysXx3+/dOMfoE0FnfUYuB51hhwxuJLtDl+hSS+xaWtv3EX9P
         Qkwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z86x1mBE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dc13si7515249qvb.202.2020.09.14.20.17.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Sep 2020 20:17:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z86x1mBE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kI1Th-0000wz-SN
	for alex.bennee@linaro.org; Mon, 14 Sep 2020 23:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kI1OC-0000Pv-5t
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 23:12:16 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:33741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kI1OA-0001iv-3q
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 23:12:15 -0400
Received: by mail-pg1-x544.google.com with SMTP id s65so1254123pgb.0
 for <qemu-devel@nongnu.org>; Mon, 14 Sep 2020 20:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qMrkJnwKfU2uQTjfoYTo9jsqV6eugUKH6001G6BMUT0=;
 b=Z86x1mBEd1QyTVmkGgMQxgY8rgskBzugwuTn9QhK3xvN5fmvB3jP3ijor8g/jUpPHF
 O3R/i+BQDMxx8SR8qg98v0O6QxBOo2fIO6R7vyQA3oEL4sG+GxvPK3bB+68ANfRD4mJh
 LZeCsZbJmomR9AGepDWnvgqkwQ7QSvuwmxlfTm3rogpWW2MXwAaJKyyhEgD23GE/G87U
 CgN8tKi90v+C04boS8t04jKeAczmcESqhE5K0a9EZRgcYRiTV+Kzxer3SuWZ7eo/yTKw
 rAxVtoAeFDTutIS8zNxaeZMbxfNl1Db8fKkHbm0cSrhwVVfUv6QCAYy1EX1yETxa8OGI
 NoMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qMrkJnwKfU2uQTjfoYTo9jsqV6eugUKH6001G6BMUT0=;
 b=lw6g9s4UJ433ULE9MWXYu7M/q2BjbK8Naut03nl/a9iSv6ajDe1hh48qmmb6CAPJLS
 WLL3+zMClYHjaFkcM5ShKDNqjVYA4u88FgPaBx669i3CfKMXlPJqPd+k35boEY7mXS6P
 8oMyGLy7SXVHmO2mUYbxrkUM5W03qTJH/5scZrYyeKv40FqwaSkMjznDl6fkojwzIWYQ
 ntTPCuQmVdi5OKbUA4nxxcuHxwUjrWXneEDtAu243IAZYEBUiRXCEqrUQ2dAypfg2xSg
 Ps78nj2YXa4zx6TBjzrQ+iVXd8kp0xZSb+Auo20K5xV2rIfdFGNxkFQAQmLfImVczXh8
 zpOQ==
X-Gm-Message-State: AOAM5327zQ2cVrcT7hmEFmoJ5hCRnM/c7E9JaTGNHkUiPcBNAD6cH6rR
 SP0eEio/pZT62w97AOq+w1vO
X-Received: by 2002:a62:7747:0:b029:13f:d779:5f95 with SMTP id
 s68-20020a6277470000b029013fd7795f95mr9629392pfc.2.1600139532781; 
 Mon, 14 Sep 2020 20:12:12 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id g23sm11551776pfh.133.2020.09.14.20.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 20:12:12 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: drjones@redhat.com,
	richard.henderson@linaro.org
Subject: [PATCH v3 07/12] hw/arm/virt: Move post cpu realize check into its
 own function
Date: Tue, 15 Sep 2020 03:11:43 +0000
Message-Id: <20eedb95441ecec7b23527cde78aa5b63c67b400.1600135462.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1600135462.git.haibo.xu@linaro.org>
References: <cover.1600135462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=haibo.xu@linaro.org; helo=mail-pg1-x544.google.com
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
X-TUID: jbPEiuNMjsbI

From: Andrew Jones <drjones@redhat.com>

We'll add more to this new function in coming patches so we also
state the gic must be created and call it below create_gic().

No functional change intended.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


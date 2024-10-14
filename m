Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp2050816njb;
        Mon, 14 Oct 2024 12:23:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXlJ9l+jVNUSdg5FJLUBv/lb6ePQQl4OpsnMf6iW7/UuslLRP0ygPm0wxgwkzU9KUcqUGnXHtP2e1VJuA==@linaro.org
X-Google-Smtp-Source: AGHT+IG2vZpDTeiWhW/buCLlo7D9mSLdEZaJjywKyG87YblwRdUkarhtJjDrh+zTqlZZGApNJUm9
X-Received: by 2002:adf:e7cf:0:b0:37d:47d8:5fff with SMTP id ffacd0b85a97d-37d5529ba18mr8159113f8f.37.1728933828606;
        Mon, 14 Oct 2024 12:23:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728933828; cv=none;
        d=google.com; s=arc-20240605;
        b=ixpMtbGrZ0rSV+HWkDI/kQX9jbWSfZHcdqokSyOzfaTghvH5TUtP1ZF9tcHoXhBUdJ
         HHycD2vJG2xFVJ9CqrJOPJgqsFM9hjtugmzV4JLu0B9BGnL3lbJVaZiXA+nzrZGM5C4x
         YCk+FcCPVxBV8/112Gt15F2lOkac+41LHdN9c0uYmoEARqHIzE8CE4+1AmS1Z/G1hDFA
         e3nC3ELN8LgzdKLRBolT1WftwLiHIExPN3K/wrtF5C9f8+WZ7hcAEnb+N4jkKY/uvcC0
         9E+H0vsDcHAs7P3s6nDR6CLKPjfP0Ahr1fCRxLRXGEkLRwLLodOMtF0CnqFmn7GwqrR9
         nx3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=gkLQZqkpb9gr9wIEYnH6mInbNHQVZ8ST6cjkUwRRahU=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=HXdSj2mFxkN/jrQ1WpRyWHAph+XadImvdVv4xCMrG9a29fJgtejEEbTjxUEar5EhVe
         BKFS0TM4JdN8SnFoMh5DCGjsSwYI7wxJ5Pkr34Zlujrf6Ac0ZQEXqmkdvRoSfwhyQlbK
         vQ50mrvvKYsAC05vu4AK/BG7U36NMi9ZlLag5HXraYJJ6xKZk0tyB26mk5kuKAISWMxW
         WB9zjtfxb32kVPl4aFdbIVbXJ8rTfMaPulilpw83JA0/2x/fRC3digXwDrZMRkzahEI7
         5104gMOnq0ysIe8S4ELvRl+Tv4wA4oEE+ot0OmVi+ISzE6Y3efXShWk/y/UnOvgbYE8p
         09eA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d4b95991bsi5084035f8f.423.2024.10.14.12.23.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2024 12:23:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XS6VJ1h0gz6L755;
	Tue, 15 Oct 2024 03:19:20 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id C0EE71400D9;
	Tue, 15 Oct 2024 03:23:47 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.146.149) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 21:23:28 +0200
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<gshan@redhat.com>, <rafael@kernel.org>, <borntraeger@linux.ibm.com>,
	<alex.bennee@linaro.org>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH V1 3/4] hw/acpi: Reflect ACPI vCPU {present,enabled} states in ACPI _STA.{PRES,ENA} Bits
Date: Mon, 14 Oct 2024 20:22:04 +0100
Message-ID: <20241014192205.253479-4-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014192205.253479-1-salil.mehta@huawei.com>
References: <20241014192205.253479-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.146.149]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: gplYK7BEwROg

Reflect the ACPI CPU hotplug `is_{present, enabled}` states in the `_STA.PRES`
(presence) and `_STA.ENA` (enabled) bits when the guest kernel evaluates the
ACPI `_STA` method during initialization, as well as when vCPUs are hot-plugged
or hot-unplugged. The presence of unplugged vCPUs may need to be deliberately
*simulated* at the ACPI level to maintain a *persistent* view of vCPUs for the
guest kernel.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/acpi/cpu.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 700aa855e9..23ea2b9c70 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -63,10 +63,11 @@ static uint64_t cpu_hotplug_rd(void *opaque, hwaddr addr, unsigned size)
     cdev = &cpu_st->devs[cpu_st->selector];
     switch (addr) {
     case ACPI_CPU_FLAGS_OFFSET_RW: /* pack and return is_* fields */
-        val |= cdev->cpu ? 1 : 0;
+        val |= cdev->is_enabled ? 1 : 0;
         val |= cdev->is_inserting ? 2 : 0;
         val |= cdev->is_removing  ? 4 : 0;
         val |= cdev->fw_remove  ? 16 : 0;
+        val |= cdev->is_present ? 32 : 0;
         trace_cpuhp_acpi_read_flags(cpu_st->selector, val);
         break;
     case ACPI_CPU_CMD_DATA_OFFSET_RW:
@@ -376,6 +377,7 @@ const VMStateDescription vmstate_cpu_hotplug = {
 #define CPU_REMOVE_EVENT  "CRMV"
 #define CPU_EJECT_EVENT   "CEJ0"
 #define CPU_FW_EJECT_EVENT "CEJF"
+#define CPU_PRESENT       "CPRS"
 
 void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
                     build_madt_cpu_fn build_madt_cpu, hwaddr base_addr,
@@ -436,7 +438,9 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
         aml_append(field, aml_named_field(CPU_EJECT_EVENT, 1));
         /* tell firmware to do device eject, write only */
         aml_append(field, aml_named_field(CPU_FW_EJECT_EVENT, 1));
-        aml_append(field, aml_reserved_field(3));
+        /* 1 if present, read only */
+        aml_append(field, aml_named_field(CPU_PRESENT, 1));
+        aml_append(field, aml_reserved_field(2));
         aml_append(field, aml_named_field(CPU_COMMAND, 8));
         aml_append(cpu_ctrl_dev, field);
 
@@ -466,6 +470,7 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
         Aml *ctrl_lock = aml_name("%s.%s", cphp_res_path, CPU_LOCK);
         Aml *cpu_selector = aml_name("%s.%s", cphp_res_path, CPU_SELECTOR);
         Aml *is_enabled = aml_name("%s.%s", cphp_res_path, CPU_ENABLED);
+        Aml *is_present = aml_name("%s.%s", cphp_res_path, CPU_PRESENT);
         Aml *cpu_cmd = aml_name("%s.%s", cphp_res_path, CPU_COMMAND);
         Aml *cpu_data = aml_name("%s.%s", cphp_res_path, CPU_DATA);
         Aml *ins_evt = aml_name("%s.%s", cphp_res_path, CPU_INSERT_EVENT);
@@ -494,13 +499,26 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
         {
             Aml *idx = aml_arg(0);
             Aml *sta = aml_local(0);
+            Aml *ifctx2;
+            Aml *else_ctx;
 
             aml_append(method, aml_acquire(ctrl_lock, 0xFFFF));
             aml_append(method, aml_store(idx, cpu_selector));
             aml_append(method, aml_store(zero, sta));
-            ifctx = aml_if(aml_equal(is_enabled, one));
+            ifctx = aml_if(aml_equal(is_present, one));
             {
-                aml_append(ifctx, aml_store(aml_int(0xF), sta));
+                ifctx2 = aml_if(aml_equal(is_enabled, one));
+                {
+                    /* cpu is present and enabled */
+                    aml_append(ifctx2, aml_store(aml_int(0xF), sta));
+                }
+                aml_append(ifctx, ifctx2);
+                else_ctx = aml_else();
+                {
+                    /* cpu is present but disabled */
+                    aml_append(else_ctx, aml_store(aml_int(0xD), sta));
+                }
+                aml_append(ifctx, else_ctx);
             }
             aml_append(method, ifctx);
             aml_append(method, aml_release(ctrl_lock));
-- 
2.34.1

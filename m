Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3713njc;
        Thu, 31 Oct 2024 13:07:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUDgV4soBTSpm9DCQ7kA7fBsZmRU0vtogMyxHrmeKH2sxDUxfLztJBsQxTO+0fnlzEz/4T+5A9Lf1GOBQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHCd1j4R8qKoN1dPcER6DjWMOlpaAocs9PY2LLD633vfT1t9Dfmw7thyUkYuWisOOhwwvLr
X-Received: by 2002:a5d:5a97:0:b0:37c:cd1f:1ee9 with SMTP id ffacd0b85a97d-381bea106c0mr3764985f8f.54.1730405228035;
        Thu, 31 Oct 2024 13:07:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730405228; cv=none;
        d=google.com; s=arc-20240605;
        b=JBsBX1OxGdEq8oOl6ogIofon1t2DvtYSC+KNV6w4/9K0GpkH1DNBkoZCLeNcuXeAfj
         Fi6c+yhp8lPfGUujMHr9H2ysoFf+P6H7Gqvw1UCuJOkN0tmmPq73iAKHcLGJOKsh6FpL
         qP9GBxilB5uCcANgCLn26PoBBrwQ2r0yjS+mMDCqCp3qrI/oGFBmsZ+7NurA+1pyuHKs
         W8o+u8+fzb1yRMp3TW+6O5pJdCysVktnlkLc7lzEh2RVLL0/8cXr9mUVeAmgK1yUbYzQ
         i7x6FvNKCupyrE9GiUoOuda/OkBj6BIccteDD+BaUWHOBw3mqytoVcVD2vWwbL9SjjI8
         BfAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=zX1tYM/7WeDtE9ydpsO/CEbXR62lTtOoNbaNQUBhGn0=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=lkqPWPyTHFYsGNHPx7yRH3NyfJNWVSRg4FPZOnLHgJmJ7JtYOB0yaN5Sl2UBcn4dbH
         pke16n0yrNRevGmzEsIRzv7yBGOEXgDxiaPB+aFnwkCJL9sR0yqpBOUXcetGL1e8UH3f
         p6NbRu/45TzLVupuIn6+OdVjkyWGpnMt0hm3inuyk7BjKSXOGQ9Rl+tW/LZg4k1njwXb
         uonByCHEH2EVpp1fe8e7apHBH+myqrNGoFsBU6rTjC2fVzkS/ndMjF6jokW+fqZMyR7U
         CE1JKXOodQGHAPRt+xpLp14UNRcAPPWdzIh30XRKnIXluOqEOlft30pk38jSjGLmxQx4
         ax/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-381c10d211fsi1471865f8f.153.2024.10.31.13.07.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2024 13:07:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XfZdy1Y0Wz6LDJl;
	Fri,  1 Nov 2024 04:02:14 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 39E5B14058E;
	Fri,  1 Nov 2024 04:07:07 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.152.207) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 31 Oct 2024 21:06:47 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <peterx@redhat.com>, <eric.auger@redhat.com>,
	<will@kernel.org>, <ardb@kernel.org>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>, <npiggin@gmail.com>,
	<harshpb@linux.ibm.com>, <linux@armlinux.org.uk>,
	<darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
	<vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
	<miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH V2 4/6] hw/acpi: Update CPUs AML's `is_enabled` state in ACPI _STA method
Date: Thu, 31 Oct 2024 20:05:00 +0000
Message-ID: <20241031200502.3869-5-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031200502.3869-1-salil.mehta@huawei.com>
References: <20241031200502.3869-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.152.207]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: YbZE23Vmnjn2

Update the CPUs AML code to reflect the ACPI CPU Hotplug `is_enabled`
state in the `_STA.Enabled` Bit when the ACPI `_STA` method is evaluated
by the Guest Kernel during initialization, as well as when vCPUs are
hot-plugged or hot-unplugged.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 hw/acpi/cpu.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 8940687f90..017b847815 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -63,7 +63,7 @@ static uint64_t cpu_hotplug_rd(void *opaque, hwaddr addr, unsigned size)
     cdev = &cpu_st->devs[cpu_st->selector];
     switch (addr) {
     case ACPI_CPU_FLAGS_OFFSET_RW: /* pack and return is_* fields */
-        val |= cdev->cpu ? 1 : 0;
+        val |= cdev->is_enabled ? 1 : 0;
         val |= cdev->is_inserting ? 2 : 0;
         val |= cdev->is_removing  ? 4 : 0;
         val |= cdev->fw_remove  ? 16 : 0;
@@ -463,15 +463,23 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
         {
             Aml *idx = aml_arg(0);
             Aml *sta = aml_local(0);
+            Aml *else_ctx;
 
             aml_append(method, aml_acquire(ctrl_lock, 0xFFFF));
             aml_append(method, aml_store(idx, cpu_selector));
             aml_append(method, aml_store(zero, sta));
             ifctx = aml_if(aml_equal(is_enabled, one));
             {
+                /* cpu is present and enabled */
                 aml_append(ifctx, aml_store(aml_int(0xF), sta));
             }
             aml_append(method, ifctx);
+            else_ctx = aml_else();
+            {
+                /* cpu is present but disabled */
+                aml_append(else_ctx, aml_store(aml_int(0xD), sta));
+            }
+            aml_append(method, else_ctx);
             aml_append(method, aml_release(ctrl_lock));
             aml_append(method, aml_return(sta));
         }
-- 
2.34.1

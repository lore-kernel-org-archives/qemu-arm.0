Received: by 2002:a17:906:564e:b0:a6f:1bf6:7fc1 with SMTP id v14csp97951ejr;
        Thu, 13 Jun 2024 16:42:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU4oPx7fm88Bex92Aa+tLeVq5RoYCXaqPwSnxFWIkYK9btAdODFffEv8OeUUJ5pgYXZc9ckL3gd5j3rZ5PaaSM8RDE+8884
X-Google-Smtp-Source: AGHT+IFpBxC0FbkobPz3Cu6Atv1CuLVM/3YxBuFXMdVeZvPteHan3YdMM067dqoZ3RsVb6rphlyk
X-Received: by 2002:a17:90a:6fa7:b0:2c2:dd1d:ce6b with SMTP id 98e67ed59e1d1-2c4db34da79mr1196561a91.24.1718322173839;
        Thu, 13 Jun 2024 16:42:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718322173; cv=none;
        d=google.com; s=arc-20160816;
        b=BcFH2OTQJnGE7mMqsdVXh6LEZH/Ida36G3lTvfunCJGI2M8KWV3yE9AehCpaaa/D/Y
         b3CKf89kPJjUsvxjOgH5DKiVcUwNGBBiTDHpWkn+UafMNe3813mDnHyTi3bh5TXwwBWP
         xLlTN0DDxIFEU7ImgteO0i0g37R5C2N+qVy8Qa4mpY5OF9/XOGHTVb9BVb8796toNNmj
         Ut6mxb1DOJ+fi4ROF2kni/CkH+CxAkLuxErubl02IuJl4HflJ1Mhsbz/f8I8jQ3tmkMZ
         wvNLTJVOJoSog84AnehxJzxUzFwvgatcUmG3kRSODBkwe0Jtl8b7DIpgNReV119+6Fec
         G7eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=+0KVE6y/18J9lK6KuLQsmigwJAN5jFZQNAjsdcsISBI=;
        fh=LTv9rZypFCL5Yl51dJY3ojnjwtjMOAtIYwj21UMTdvU=;
        b=051xuG0HRZb/r3v4Qdx9MRSqgTLYam0ByOvHIwIfmzYseqoJSyPoRyDeA3zIVzPD5X
         c2RN0bTHn5HGPxMFFbvACQo0twvhLPzkBwEvOEgEaQ2DQbTAPMrntSY1VUmajvSoAKAR
         rcpj6ERLwa6b6BzTHZvSobTMplcuoT4WLCv/o75Jdj2v/C2p7jV7dNeQQ9pRXNUVQHva
         WQKKDreoTFH+pij5QXDWUWGx1b6N0GHCXt4ebUoV6u3fCdBOVB8d34kwEzvJTHn1j2os
         chH6HtivBkqbejDcez2jaYWQ68W3mY0GeJcQH9O6RC0uv4BIzecOKNpmjipEB5OzCPkD
         P6uQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2c4a772ca46si4543470a91.164.2024.06.13.16.42.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2024 16:42:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W0f921SBRz6K62D;
	Fri, 14 Jun 2024 07:42:46 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 10EC3140594;
	Fri, 14 Jun 2024 07:42:49 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.245.24) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 00:42:26 +0100
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
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>
Subject: [PATCH RFC V3 13/29] arm/virt: Make ARM vCPU *present* status ACPI *persistent*
Date: Fri, 14 Jun 2024 00:36:23 +0100
Message-ID: <20240613233639.202896-14-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613233639.202896-1-salil.mehta@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.245.24]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: AjAdg33w94QQ

ARM arch does not allow CPUs presence to be changed [1] after kernel has booted.
Hence, firmware/ACPI/Qemu must ensure persistent view of the vCPUs to the Guest
kernel even when they are not present in the QoM i.e. are unplugged or are
yet-to-be-plugged

References:
[1] Check comment 5 in the bugzilla entry
   Link: https://bugzilla.tianocore.org/show_bug.cgi?id=4481#c5

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 cpu-common.c          |  6 ++++++
 hw/arm/virt.c         |  7 +++++++
 include/hw/core/cpu.h | 21 +++++++++++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/cpu-common.c b/cpu-common.c
index 49d2a50835..e4b4dee99a 100644
--- a/cpu-common.c
+++ b/cpu-common.c
@@ -128,6 +128,12 @@ bool qemu_enabled_cpu(CPUState *cpu)
     return cpu && !cpu->disabled;
 }
 
+bool qemu_persistent_cpu(CPUState *cpu)
+{
+    /* cpu state can be faked to the guest via acpi */
+    return cpu && cpu->acpi_persistent;
+}
+
 uint64_t qemu_get_cpu_archid(int cpu_index)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5f98162587..9d33f30a6a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3016,6 +3016,13 @@ static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
         return;
     }
     virt_cpu_set_properties(OBJECT(cs), cpu_slot, errp);
+
+    /*
+     * To give persistent presence view of vCPUs to the guest, ACPI might need
+     * to fake the presence of the vCPUs to the guest but keep them disabled.
+     * This shall be used during the init of ACPI Hotplug state and hot-unplug
+     */
+     cs->acpi_persistent = true;
 }
 
 static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 62e68611c0..e13e542177 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -540,6 +540,14 @@ struct CPUState {
      * every CPUState is enabled across all architectures.
      */
     bool disabled;
+    /*
+     * On certain architectures, to provide a persistent view of the 'presence'
+     * of vCPUs to the guest, ACPI might need to fake the 'presence' of the
+     * vCPUs but keep them ACPI-disabled for the guest. This is achieved by
+     * returning `_STA.PRES=True` and `_STA.Ena=False` for the unplugged vCPUs
+     * in QEMU QoM.
+     */
+    bool acpi_persistent;
 
     /* TODO Move common fields from CPUArchState here. */
     int cpu_index;
@@ -959,6 +967,19 @@ bool qemu_present_cpu(CPUState *cpu);
  */
 bool qemu_enabled_cpu(CPUState *cpu);
 
+/**
+ * qemu_persistent_cpu:
+ * @cpu: The vCPU to check
+ *
+ * Checks if the vCPU state should always be reflected as *present* via ACPI
+ * to the Guest. By default, this is False on all architectures and has to be
+ * explicity set during initialization.
+ *
+ * Returns: True if it is ACPI 'persistent' CPU
+ *
+ */
+bool qemu_persistent_cpu(CPUState *cpu);
+
 /**
  * qemu_get_cpu_archid:
  * @cpu_index: possible vCPU for which arch-id needs to be retreived
-- 
2.34.1

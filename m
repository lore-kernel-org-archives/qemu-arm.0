Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3252njc;
        Thu, 31 Oct 2024 13:06:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWIQ+1NLf4WU4wnC8GL3my4H3xjM9Ue8caePpxgCa6IUSP8jR6vNBl4ZVAXa27tbX57XPy6wV1zcOHBYA==@linaro.org
X-Google-Smtp-Source: AGHT+IEhnvEb7ZWU3HfcLqJywgGEVud4F++rvXR7Dc7cXtXlu2yCQfUoZGBIjXp2m5zqQXmDtT+B
X-Received: by 2002:a05:6000:1a85:b0:377:683f:617c with SMTP id ffacd0b85a97d-381be79b87amr3945956f8f.23.1730405188377;
        Thu, 31 Oct 2024 13:06:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730405188; cv=none;
        d=google.com; s=arc-20240605;
        b=Vaq7G3fe7o3Lyi0MtA0S+qUnYMHDnSviVoNa0IRRV/LO8TeZ7sKbyUxOhYno7wF8Br
         /iuNYQ5AxW4MI51M0ZhHs0PcVXzxvw/SPgRXXTz4MIV1zGrdqnufkovUawEpQO02PM3r
         M8VpzvpbXGqsD7MCr9zVNyXOnXbMkBkNOUNZKQF1gL/XAHTx2Tcbx/U1FReJ1NYA9eWp
         pwko1ZCQql36usIYpn36k6KWcez8XoMJh4tF2TAA+Nk2EUfcOCiZpiLkG3wfmLiR2CfC
         bJv4z6Vufcr+G4eXsrBlPUknyFl4hFGXn8Fau4HiWQ9oaeROq+QDzuNmGJykw6go28Wc
         dQmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=gZKr3pY3O3q/pdei4g/VPf+8LZX7y2VuUAvowshr+z8=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=YjCx5Qzp3xJe4mtsdVcNHo8/Cf3vO68lt4ZgceOiSiGaMRZ3GEqiPW3bzgwYH6edmn
         H2/eJxMNeYnFHwWHoXwM8a8rvNUwe9RIO3MGYP8OgrXDCr2Jkna5oVbmBhtkiaGxc73l
         Z77kruZ2MOPBlV5pC0HOKPGV4b9qqJLVEt8QPHqF/dcQ16R1Sy5Ys5+H9964y4joPgdI
         k3gYlSUZIUlm0ix9Og0hn+89u+u7XbDpDDeaN8b0NMVECV7zQ1D3J+AIWkvbTeyz9Yay
         Ij4kzsreuIJFySwRBgO1TW+g8GagKOM4359nZNh+eDkfOhU8vosn8t6OjlRoVCM3HYyb
         D9qg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-381c11740a2si1459186f8f.319.2024.10.31.13.06.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2024 13:06:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XfZjF54Ynz6JBc6;
	Fri,  1 Nov 2024 04:05:05 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 8617D140B35;
	Fri,  1 Nov 2024 04:06:27 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.152.207) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 31 Oct 2024 21:06:08 +0100
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
Subject: [PATCH V2 2/6] hw/acpi: Update ACPI CPU Hotplug state during vCPU hot(un)plug
Date: Thu, 31 Oct 2024 20:04:58 +0000
Message-ID: <20241031200502.3869-3-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031200502.3869-1-salil.mehta@huawei.com>
References: <20241031200502.3869-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.152.207]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: 3bBXDoaIKSXK

Update the `is_enabled` state in `AcpiCpuStatus` when vCPUs are
hot-plugged or hot-unplugged.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 hw/acpi/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 238a0edbc1..8940687f90 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -265,6 +265,7 @@ void acpi_cpu_plug_cb(HotplugHandler *hotplug_dev,
     }
 
     cdev->cpu = CPU(dev);
+    cdev->is_enabled = true;
     if (dev->hotplugged) {
         cdev->is_inserting = true;
         acpi_send_event(DEVICE(hotplug_dev), ACPI_CPU_HOTPLUG_STATUS);
@@ -296,6 +297,7 @@ void acpi_cpu_unplug_cb(CPUHotplugState *cpu_st,
         return;
     }
 
+    cdev->is_enabled = false;
     cdev->cpu = NULL;
 }
 
-- 
2.34.1

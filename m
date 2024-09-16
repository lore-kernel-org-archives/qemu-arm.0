Received: by 2002:a17:504:2a14:b0:1be9:327d:8ee3 with SMTP id p20csp1133408njl;
        Mon, 16 Sep 2024 08:09:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU0KyPYOQ+GYSOjmQXk5pgqezzPiPH64xEzj/fL3RC7stwHUPzbwmrfopJ79JO5rSNCyzicDTHQcZ6SnQ==@linaro.org
X-Received: by 2002:a05:6e02:505:b0:3a0:9c04:8047 with SMTP id e9e14a558f8ab-3a09c048195mr39173865ab.6.1726499350911;
        Mon, 16 Sep 2024 08:09:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726499350; cv=none;
        d=google.com; s=arc-20160816;
        b=sWeD+CbvSdaA/ffN4Sm6UKmyeyl8Mmjpnok3lsSq10fG/a4SE1lTzkxNrTXp+XV4OH
         DH/EF6R9q4+8Lz46tycOK+zWASYnNXlSAT74EqpEcDxTBhHELGKF6Hg9YoqoH4CPAuB/
         UAwIR40J3B7eG+1/nfyyweB4okp15Y1wzDXXq2qwrvRlVH2SKS6adOuqedh56EirCxBH
         Pc4ZWm8ikgtZHVUsHLwqHdeMuueODYbafXwudp/z04vFK6uFHGA9HK7eKYCKHfkc/D+t
         73IUas21/zzIDvHF7Gj/XIzIxCL44tF6O0hCRN51RdlA4J0DdRlRPWWSbBqaKffE9XEy
         nc4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tIDS2BgSDN2sYeAiwQv8u9Oegpn8pHfzCYrmX62ewXA=;
        fh=RQCIIiftyT+qK0MPj/DFv/AUXNnYsg/DFm0WTi9TGME=;
        b=RKJzdyhNG3wWAfPrzFmExuV9D0o4fwsoZcyu+FwMnuHjdx+aHQm/GeSpSGxu67kCOY
         HBiPnWK4AriUAVk+mtdkJLRahZN/LAFSYWH78dxNqrrCkzN+FbXB2M0DrmvIcMhcm1di
         ovkUPmsj8uKA5A4uXRGSMp9HE8K8yEKEcqxOpY2i8XJcCe4nNZrBguDs9vx8jIWRZd22
         TsQUmPMePxXC1V7pUevnMxTH2G+OmO3wMNMrqeBevqV9jJPVj4ZN1qadCajR7feH6ako
         a9dn9PLQTT9uDBR/0tFGeqmDktM7KJdq82qJvtisedwiJiDYM6Z3GyMKfvVeDMQFup1Z
         Lc4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=MRQyxDWY;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e9e14a558f8ab-3a09aecb459sor10508565ab.6.2024.09.16.08.09.09
        (Google Transport Security);
        Mon, 16 Sep 2024 08:09:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=MRQyxDWY;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726499349; x=1727104149; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIDS2BgSDN2sYeAiwQv8u9Oegpn8pHfzCYrmX62ewXA=;
        b=MRQyxDWYLZStSElzt3YKm3KN56DG6Ro9Q5fImZWIYnSDPQiWDCZX6rgt2nH14+qMKy
         zqoT32wPumlfk9DiA8cywP74ZBfenmFIT05kjrN3AUbISojsTKSM61SQKZ+QNY6xWRkZ
         Tf5ouMZl20wjw50lHL7vmuP/VJWU9CY+0TRn9FCCp+firwcor0hHFGolE21c1hDGvwuQ
         s6aIQ2SIxSAYMXNB+cfwUr/NODnlE53FRlVYDGL6EwN1WFtADJVpGNGcc2utWtN09x7M
         W/WY98bFlXfLUrQydkP/xwcx5vfT+mNgQ4eMwAoRGj7ZYcy0u620SZ4OOYIoK28Ymjge
         Qe6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726499349; x=1727104149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tIDS2BgSDN2sYeAiwQv8u9Oegpn8pHfzCYrmX62ewXA=;
        b=PQNBRD3Sx5VFT/s6Eeq7wIOILevyluCUYV5O/J29eIZGjiLlpIP0FDVMVeVQ4MXXls
         FA1IthpjdzxV6V5jaFHoPhkJPuQ9fPxruXeskmy+tfJVCapjpcAm0DH9AQsDvmoOtpJI
         sc+89oiV2yuE/ZR3GIa9ksA3Ul8YAkkdgQKv8Q28/h/SYQhh0uKoGyG6oBL7rBQlGe8A
         vtNCcuCxMQbJDTx6dg2irZFgOAvJ8Ph5Qwvjb26ohzXLhBsfr0M2Vdr1MMXdO1oOs6Ej
         Fx5mjesJV989+gXhi5JfsilmrUPYinjMF+Rw5tAZNz1XLI2Y0Fl9jucH7Bu9lqNUDg1k
         7/mg==
X-Forwarded-Encrypted: i=1; AJvYcCUOAmOmQNR9/+wZEEgHxbz0xu3SazsR85laGH4j6ksiY3yUKPasr5D7NfKkR6mIhTIWis3ht2eutq1cMqjMsQ==@linaro.org, AJvYcCWROt8w+dSaUbT8vGXhyXE+GgIN7IX0KMuwslex6YbQeUjTL/9/TmXv/S47/QOrh+bS7zeRObaXWWqctw==@linaro.org
X-Gm-Message-State: AOJu0Yz/qCk4kwHxDr91FFMZWGEUrXUnFIoH+qPOeeFVenuEufGDXSDG
	1fRlWu98H0wGBZmSCvr+ChYJjcmL7EOR6YeyORT7cvJP9xZLmBal
X-Google-Smtp-Source: AGHT+IE86ZuS/7NQzNvR5tLVOdqaKbQKcpupAoW/xUcVW9ix1XY+RyPuORlI+lKWYit0Zg+iCQOwZg==
X-Received: by 2002:a05:6e02:12c5:b0:39f:325f:78e6 with SMTP id e9e14a558f8ab-3a0845a0d55mr130717185ab.0.1726499349478;
        Mon, 16 Sep 2024 08:09:09 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (ip190-5-140-142.intercom.com.sv. [190.5.140.142])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a092e9005csm16897935ab.79.2024.09.16.08.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 08:09:08 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org
Subject: [PATCH v1 4/4] hw/arm: xenpvh: Enable PCI for ARM PVH
Date: Mon, 16 Sep 2024 17:08:52 +0200
Message-ID: <20240916150853.1216703-5-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240916150853.1216703-1-edgar.iglesias@gmail.com>
References: <20240916150853.1216703-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ejJeyOUtaLa8

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Enable PCI support for the ARM Xen PVH machine.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/arm/xen-pvh.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
index 28af3910ea..33f0dd5982 100644
--- a/hw/arm/xen-pvh.c
+++ b/hw/arm/xen-pvh.c
@@ -39,6 +39,16 @@ static void xen_arm_instance_init(Object *obj)
                                          VIRTIO_MMIO_DEV_SIZE };
 }
 
+static void xen_pvh_set_pci_intx_irq(void *opaque, int intx_irq, int level)
+{
+    XenPVHMachineState *s = XEN_PVH_MACHINE(opaque);
+    int irq = s->cfg.pci_intx_irq_base + intx_irq;
+
+    if (xendevicemodel_set_irq_level(xen_dmod, xen_domid, irq, level)) {
+        error_report("xendevicemodel_set_pci_intx_level failed");
+    }
+}
+
 static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
 {
     XenPVHMachineClass *xpc = XEN_PVH_MACHINE_CLASS(oc);
@@ -69,7 +79,11 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
     /* Xen/ARM does not use buffered IOREQs.  */
     xpc->handle_bufioreq = HVM_IOREQSRV_BUFIOREQ_OFF;
 
+    /* PCI INTX delivery.  */
+    xpc->set_pci_intx_irq = xen_pvh_set_pci_intx_irq;
+
     /* List of supported features known to work on PVH ARM.  */
+    xpc->has_pci = true;
     xpc->has_tpm = true;
     xpc->has_virtio_mmio = true;
 
-- 
2.43.0

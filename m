Received: by 2002:a17:505:42a7:b0:1be9:327d:8ee3 with SMTP id rt7csp2280122njb;
        Mon, 23 Sep 2024 07:55:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWRwDft0uW0J+FXHMQjN6I8SPl3gQVzPhtoQ1BFB0owJOnb2Nbog1mvXH4mQauaHIKoZCL/NiTy9AWIIg==@linaro.org
X-Received: by 2002:a05:6122:8c1:b0:4f5:26c6:bf31 with SMTP id 71dfb90a1353d-503e04ff6c2mr7039889e0c.12.1727103332980;
        Mon, 23 Sep 2024 07:55:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727103332; cv=none;
        d=google.com; s=arc-20160816;
        b=STIvf/Wso835/ZgCnPfeTBLVBpXz4194bI0SVzeW1gitDH7ifuJ/MWu89O39yVfggj
         fDcntO2oef0lDDlSjfXAH6Z5wi+17+ZiWfl8KA7Z6t3hp9cvkMIXr+CRE1xQtr/l0Xvk
         Uigu2HFe5eupw+jal1O891mbUwLiYQgsozjH62wbQcXJREFXcAg+ustlnHCS+LVRGiJV
         tCeJi8Xfc9JEd2/updhBJHquQmhr7zkaw3XUF0pqdeTEAIfPRqaKKXNgJ1YuBrafaQbv
         7qBdMD8FmBQKpBq84NYqgz1AnW2TN/N7CKryLF5yvQ8aznS0kZSEXeWzQvCHXi6YgvKP
         csJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7NqZgDSIdmym8k9v4wrElx9POiJdcsjS85l4BMSFw2Y=;
        fh=rwUQu8P37bhDOjnU2uzhVPCxzR7KVp8B2bfox9Q5hHk=;
        b=x8Yb4VCqY4GLLjmD1Iq0IWgxD3mikEHHmJqCJJVONAvIVA+4aKCqevj4B4gLakSfEU
         uNdtzZBv38u07NSnkPt7WhEmbJrz9iOQYOXf27wks+HvEYrt/3k4EhUN7cgFzzh/tPmt
         8R9BQsL++5mcU6Cn6aEokKfKh7Xyq7wGLFird/jEfuxj72k3eN/nRPMp94stccfQESeF
         d+WO4X4Xc3bWp2th4KxjZwxc+UhgNfAsKLuGcuy7XvNzu+rj1H0x/FeJ13k9mQifQsxF
         Et9bQOga4LhcQRb7GToNzpfiWw/d+kXXU011sXooWfIn2GOfhPMTa18F4NgxjZgHmj/A
         QimQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=PqkUYpIP;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 71dfb90a1353d-5035b95a32fsor3142500e0c.3.2024.09.23.07.55.32
        (Google Transport Security);
        Mon, 23 Sep 2024 07:55:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=PqkUYpIP;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727103332; x=1727708132; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NqZgDSIdmym8k9v4wrElx9POiJdcsjS85l4BMSFw2Y=;
        b=PqkUYpIPEs/KIPJQ/Pmqw4/pSJD7VFB/wuU++lFGGCJ9r+eGXKIffD7yKAJW09Jxy1
         Y9gx5gMQxNq91DHeapfqPeX9eSMxnoz16JCVGsw/aw5IBP3DrxVIpRyAksTXmFVNbd9W
         bw2MAv+bS3PgndEIbEAANOeIXLMJzqToG8ClBi/MELBB9VX9L+3kLQsyCVu0y29MHQzk
         z2VrUpQnG364PWZFlfsQ4IK39TvRM8GHRNmNpr3JXT0iQC562CzBXDvee3VRe1+Afhx6
         j6GVL7zp1LA0vz3yX2OoWN/i0UYwkNKrMB/kRCIMpx/kz95JOXr1HAKPBro0nt+anJ+q
         qNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727103332; x=1727708132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NqZgDSIdmym8k9v4wrElx9POiJdcsjS85l4BMSFw2Y=;
        b=eU7t50o+5ayIVn6vBA9+HH1wB4wPrB6mbri+TeCMSWoknBVzOgYG2ynMxcqQmbqDDq
         Fepvml3gQENxJUhlgQQH72x+5xFEJQ9ACEmqKNeoAXGDGRARJUdsHuuVL210Ag2wj/Qg
         Gdm66K8T4vNNkRRqeVHD26CSMJfTrYdHCIjaMzEKpMMSpng8Bx2IPQsIhE2gSFPA0j7n
         tRMvRURQWeErFqyXwjlwYJVJfrcdWeJJCVclpby5EWuTH88Xt4q40j3cRnAuY6B5Vj4x
         vWBbv2MIe/KqbWBqnQJifX5R9A+TEzxH7fXSXSlNi2D7M4AFFk7BTBBrxnR9b0CvpVpp
         1EUg==
X-Forwarded-Encrypted: i=1; AJvYcCWIsO8qizm8Vd37QTRBBU5Q0NkRi7zFlJsDNEAy86xCX9piCs/jgYm9FTolxCrYFmsoQoHWxPYIXOl4JHkVJg==@linaro.org, AJvYcCXHNQmrp+mWgRP/5q2L5xz70WUooH3/6xCQUaRvjtd7bty/3KTWvFGj/PHmBj6RavjgmspmCzVaOVVPww==@linaro.org
X-Gm-Message-State: AOJu0YyNwNyW7D0BRdMGaFaYGDCQ/Tfbks2wu8y7Mli08d62FT5bM0s9
	VzegHq6KT80dwepZ49C6gZeOnk6nBwVetBLN1JtubwBhpB5Jxb1A
X-Google-Smtp-Source: AGHT+IG6dbA1Qoykmc5DxVHIT6I9aGC0+8n371MVri28ok0pj3/lLGZ93yQkgFm3m0GB4zJqdCuIOQ==
X-Received: by 2002:a05:6122:3c91:b0:4f6:e87d:5160 with SMTP id 71dfb90a1353d-503e04cc2ffmr6905503e0c.9.1727103332294;
        Mon, 23 Sep 2024 07:55:32 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (ip190-5-140-142.intercom.com.sv. [190.5.140.142])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-503d7e9ea08sm1784841e0c.31.2024.09.23.07.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 07:55:31 -0700 (PDT)
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
Subject: [PATCH v2 4/4] hw/arm: xenpvh: Enable PCI for ARM PVH
Date: Mon, 23 Sep 2024 16:55:20 +0200
Message-ID: <20240923145520.1323504-5-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240923145520.1323504-1-edgar.iglesias@gmail.com>
References: <20240923145520.1323504-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: s30HcgOiW3RL

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Enable PCI support for the ARM Xen PVH machine.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
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

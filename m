Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp1479080njl;
        Thu, 3 Oct 2024 07:32:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2m4QpoGTh6e4nUDraVMvuH7HW4VOBiE7mJBedZsxOS24haSUYKhK47rp3DxNkO4YjZdNMtHZ6D1jhPg==@linaro.org
X-Google-Smtp-Source: AGHT+IF5+3Av+vcOOob+QO6N2IOJlkseovcBcDnd60AyBV2kbJgWBUOSbQbZSP6OUdmVQ8px082/
X-Received: by 2002:a05:6902:e0c:b0:e26:29cd:c1e9 with SMTP id 3f1490d57ef6-e26383ddf1dmr5749191276.34.1727965931269;
        Thu, 03 Oct 2024 07:32:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727965931; cv=none;
        d=google.com; s=arc-20240605;
        b=FfwPI5YWq4qc1hzwQgt6OfbXvJvqJwOpVcy5cAr8gDcCJZ7ZgxeEc23GqhfG9C72fN
         0J9PkthE9Lc9XndLVlr5mMrGs/1wsaxEV8ki6fmDIh+3iB3HcG07lDslegftxWZvZI6j
         q67rtwQ+JEGEn11vITkzvjVWvxUkzEUs0oW7JESUcaq9Z3zu1Ki++RgmrOVvW0+oBJnm
         H1n9iS2S1ORqh4K+/6yccuOMgS/MLiRMd9pVgYkjy2LQ9Z30jrd+UI5PiwTr5PO7QNsT
         ofOUWa7d24frOkmm289dBu7jrdE7Cwpn+DUwHSHPPB7PipfljbWij6cd5HnGCZRRkTSW
         7CkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:sender:precedence
         :errors-to:list-subscribe:list-help:list-post:list-unsubscribe
         :list-id;
        bh=7NqZgDSIdmym8k9v4wrElx9POiJdcsjS85l4BMSFw2Y=;
        fh=x07N3uJ4cwFmUarGcQLSm3dnevCz2wW4CkF4MsDVSfY=;
        b=MFqoIQc/7qzbhxZEgQWq8mgnebskqZ/1asH1gukmTtPu+AhsgMy5kv+5Z3dPectFhS
         HhNuaDnpgos109t1iJXe1RDR0juAdVExDmgYZdd4aLgM5fhQoLuUnVsHgTSL/vcfZUsA
         xGllLRoUHdpZ0wFKZz1szGqDnYrRTMZOtUNHXhzjEPs3atdZDRxnwp28DHw7IwiJXWLA
         Ni9Uaa7dZLWG0FV9ypbg/mQUIdMq3HnUUupihkhtvpSIuDEvMusXT186LpqsUJLyW3Dp
         Ooz3EIrDP5y5EfSZ0c/8gOTRSFZW+TKnPIQKDF7yUWtwEOyNrBMPfqCMXW4ejID2I0Tc
         HOhg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oib+6qKV;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e2885f4fc1bsi804994276.713.2024.10.03.07.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 07:32:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oib+6qKV;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from list by lists.xenproject.org with outflank-mailman.809517.1221924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swMrQ-0001Dc-TE; Thu, 03 Oct 2024 14:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809517.1221924; Thu, 03 Oct 2024 14:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swMrQ-0001DV-PQ; Thu, 03 Oct 2024 14:31:20 +0000
Received: by outflank-mailman (input) for mailman id 809517;
 Thu, 03 Oct 2024 14:31:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wyt=Q7=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1swMrP-0008IT-Rc
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 14:31:19 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 271af55b-8194-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 16:31:18 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5398e33155fso1320156e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 07:31:18 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539a82570b4sm190849e87.91.2024.10.03.07.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 07:31:16 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 271af55b-8194-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727965878; x=1728570678; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NqZgDSIdmym8k9v4wrElx9POiJdcsjS85l4BMSFw2Y=;
        b=Oib+6qKVXssGS/34dQCIZgsuM+ApUmF2KD8TKhjyw0cw1a/Sguf3c7vnm/cHwQIYLB
         T9nkv2eTYi3BpUOJ+0ei3JH7dw81cZbWlSigrqD84Dc/XBpRN+twaxDOgbF0p6NfEUKW
         kFV4cPtL3VdvpA0t1srR8n7ZynNt7NHBqmn0OC4aWeezwXLk/3nawEphKMyLpv1qh+Tx
         LfbMltpd2tB4Pyy7xKaIuZjxyuiD0nJB8blM0bQriVInDzvedlRI8wV8gPmUgweIQBlb
         SdvR64L6smD6ezB1QNpoJ+1vAZNRyNdYs2xuXZQSt6SMgn1w69TWQVX8z3ILWiZ2/F+R
         yjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727965878; x=1728570678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NqZgDSIdmym8k9v4wrElx9POiJdcsjS85l4BMSFw2Y=;
        b=qI1NupL4SF0+b7VwgBHE/Agh0C7FchnCjlDfYHFmYqLl1kYq8wJ9VinMI/P+LUB9wp
         AowFsK53auT1Z5uLgzMJIe0bwt5oIDqyBlf3Fjt6nObEHBeS/yDudJA0K37B8+f9D9DG
         v6w0EtJzVUZ7ZJttSzk8eRq3sFUspAH1hePxf0LpKXOdIy1J+wHijuSz964noLgCBvcE
         zopYLGKhbCZUyUw9q2zAkuJ/QtdLA8P8gE8JbgJM9A+B0XzXGPz6TPcNpaYsHgFPebNC
         iq9vNlZ9nkol8SYJeboLkkTUyIoTRG2NaNBeNuTsJehfOtje68rUkwK1tKn+P3jV6+WI
         cf9A==
X-Forwarded-Encrypted: i=1; AJvYcCVz4VFIR+r+CnM/hRpKv+u7a9naB9e4eF2+gFl0piADQTAgjThTY+1L7//IonzRJgLf66DUzLH4rM0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOx7SOi2rfqUw7UVZzxJnJDpQoLvYlZuqsBz+QiTUc9wyiiQRW
	Dc8gtkNk7D/QZdcguFk4b7O2TD7TbUK9JbQQHqh8KpPUM56vejCh
X-Received: by 2002:a05:6512:3da1:b0:539:93b2:1383 with SMTP id 2adb3069b0e04-539a07a1d8emr4381480e87.46.1727965877639;
        Thu, 03 Oct 2024 07:31:17 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org
Subject: [PULL v1 5/5] hw/arm: xenpvh: Enable PCI for ARM PVH
Date: Thu,  3 Oct 2024 16:31:02 +0200
Message-ID: <20241003143103.1476805-6-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241003143103.1476805-1-edgar.iglesias@gmail.com>
References: <20241003143103.1476805-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ATaR7lRFElIb

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


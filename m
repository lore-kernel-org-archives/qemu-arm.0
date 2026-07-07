Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFB5C44501
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 22:46:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whEWA-0001WD-JQ; Tue, 07 Jul 2026 18:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1whEW8-0001V8-IW
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 18:43:52 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1whEW6-0004ES-Ue
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 18:43:52 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2cc6ae3e7f1so577625ad.0
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 15:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783464229; x=1784069029; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=O86QJm1XxClMyzD31RebPc3Pom31UHvgzzbgIM9gz34=;
 b=NtsQxGbU8QBnvDHome9b5+6rO+5HcNMRxjVbin6dcSl+DLevyJntxQ1xM5xj+drZ6A
 nJ2Et3C3pJ1Cdb+YWW2icSPp8iGypnk3tvqCoQmhglQioGCUKd8oo5fYCQh9Yu4CQUCo
 UNGE/mJTIywAwx8qNxRr9KUPaA+dNQzuJCJl0j0sRW3xy9xhwfZ0VUAP8dn0xcN3sAbh
 i6iQwB+yEYWbPEaV3W99stug7X1qtxFFjoEbTT+JDM71XJnUrYVwIcSc7dWSQebJjylF
 MvPtV3woL6Z9YegJl94pV10+dJTKTf9vrMz4wvMHmZ9ZZXFu25zD/2WsNckytd753uBM
 p9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783464229; x=1784069029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=O86QJm1XxClMyzD31RebPc3Pom31UHvgzzbgIM9gz34=;
 b=cTY+U12CqOztdAG/ARr7D4MkkjBsExWMbtoOK48B0FWuFnX5xVpSz0jntPxP3q0EQD
 wzXDTPGj6XFPjy+I8EE9NyHziSBR96QzcPK+AvskjgR9D60msuZ02Fn/ylj8YY4D8HBE
 Jir9v+40WUvUmtmhKrdHguUIwEUSdjl5vtw90mgimwp7ecvvrL5BF7thx0IEulS/kYYk
 7EbkT6jTblaQr2+wOw4KoxFmLmRzgroxpTwdoX210Y9YwHjoXFhCMKRXuS/HYKpYAvs+
 V343AoBEP8EjBG1RvxUSt+qw9Jnw8EokXCk9N/HPURtjvmT2O3TSpZPHjEzK79U0YIs/
 A3IA==
X-Forwarded-Encrypted: i=1;
 AHgh+Roaj4qEV2eNY7syrfcAmMFPGma2j4VYzXk9FaA27fLcnIC9Kvj3iX3sxY2ASwuyEF6bHZl7I2pG+g==@nongnu.org
X-Gm-Message-State: AOJu0Yzw7TDzIQikCxZaUzSm/qYENUxXiQSne3k1nwKzhhWLZo0Wswcu
 ED51eBpkaGnCyqMqU3mw39ni3pfZOzMroqiZ5FlW7czpcJpMlEUntuzWNq+qmbCe9ns=
X-Gm-Gg: AfdE7cnaHswEO7jrHu4mK8H+PK53rQLXkQ+yZZXxTzycE/ygE3AtDPMxuSpfWhaKThE
 W9ohXWXXXxo8ohn3MjJ274nJ0eIKxQvbFdajrcGYOhG7W0hRMmuaQx71PYmDrxBuJbdKofdyQmz
 GIgtxDIpGWDe3aYHvdythBh6iZ7E2CmShqu6WnONAQoaVUGXuIkUGaGHMxefpOalh5UGuQaJNlZ
 IaN7IwFg/0m47HO58iJJTb91ftJYFQnDykm2OTDu+eT1MJPM6nN2ObXlKibbm3dklN71pWkBSum
 3wvhCGEvUczU//2B8QjidY5UfgoRONX3v+GDjB/c9kIUtgNNlBBVMTLGDyUNkcdiP6zO1F0YimL
 O9zGAus9TkzJlJ5chuSrY4+/lYUVmbbMTB0pNZxQ+3wSm3Xy3GH7oD4OG10ccCqzcO/Znqk3u5k
 yo7lTuPGTVO3xJuq3jlP+6FW2Klnoxq/ChB29O7ZM=
X-Received: by 2002:a17:902:f789:b0:2ca:281:27f9 with SMTP id
 d9443c01a7336-2ccbed22936mr61406255ad.27.1783464229346; 
 Tue, 07 Jul 2026 15:43:49 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:46c8:dda7:40fa:8958])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d3bbaesm18183805ad.57.2026.07.07.15.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 15:43:48 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, jpb@kernel.org, lorenzo.pieralisi@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v1 20/25] hw/arm/virt: Move virt_flash_create() to
 machvirt_init()
Date: Tue,  7 Jul 2026 16:43:01 -0600
Message-ID: <20260707224306.1202330-21-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
References: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

For confidential VMs we'll want to skip flash device creation.
Unfortunately, in virt_instance_init() the machine->cgs member has not
yet been initialized, so we cannot check whether confidential guest is
enabled. Move virt_flash_create() to machvirt_init(), where we can
access the machine->cgs member.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 hw/arm/virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0f104447e008..2e8e29244284 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2909,6 +2909,8 @@ static void machvirt_init(MachineState *machine)
     unsigned int smp_cpus = machine->smp.cpus;
     unsigned int max_cpus = machine->smp.max_cpus;
 
+    virt_flash_create(vms);
+
     possible_cpus = mc->possible_cpu_arch_ids(machine);
 
     /*
@@ -4429,8 +4431,6 @@ static void virt_instance_init(Object *obj)
 
     vms->virtio_transports = NUM_VIRTIO_TRANSPORTS;
 
-    virt_flash_create(vms);
-
     vms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     vms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
     cxl_machine_init(obj, &vms->cxl_devices_state);
-- 
2.43.0



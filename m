Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E24CA5FDD
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 20:24:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCjki-0007aa-W0; Fri, 02 Oct 2026 16:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjke-0007T7-7Q
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:21:04 -0400
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjkc-0005pl-6H
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:21:03 -0400
Received: by mail-pj2-x0f.google.com with SMTP id
 d9443c01a7336-2d90ba1d807so64143355ad.3
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 13:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790972461; x=1791577261; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Lpj0IMfahKj4TBxv92N1eLG7yRPCpkT9qnzra+mUktE=;
 b=VfjPgtCBNFyfgxAy4eKwET4dKN3Dt09uIfV81rG2r7m8WWrj3NoXktZ7BztUNTD3fK
 iWZc7OaH4LDOVsvjEBOTB5/IUFxjUZtZNL7BP5JUxX6zcA/7H9vhyyx/knhfwR1fYvpt
 JFD1/UrwrPnWnpAwNNNjFO9u2rgIQ4pKgP0YHxpoty61dEnb4N7E/O1obflPa1vWKbx0
 MxHSSaCldtnO/U6ah7S9EMji+qtS+YxstSnt2+Wm+skixnQbigM8amXuAQrGLPWMXcRr
 7sAj5X3BZi+79ZJB46iDrVSsPnTOWV7rli/dAAQoWGIqYrGE7GdoXrzYgUeW3sPrPAxt
 eO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790972461; x=1791577261;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Lpj0IMfahKj4TBxv92N1eLG7yRPCpkT9qnzra+mUktE=;
 b=ocSpw9AQQYdTYqC88RrU7jNJBRpBGCKKPNizNbF/Ni4fJDwRsycJ+UwITqW5Q37X3a
 7VpnfcfTszXdIWuo/8xLTVFeEN4M10tvw1ZOKyVpZZHolvBsaFPcPm87OQn3wlbZBj1R
 kjgRV5GBRLRH02+QW5IKeCAMORPwUFFN9gW3NWXKVq4e0HOGFpYib06/tqFGJ2wf4MLd
 FDnuLV2pGWXdvL59iitVh8MkI6McRbIxkq9/AIUxMYMpMBTyuIRd5kcQmrAtV81L8j5N
 EBZ32PkGQZPD/YD1tG9fOD8iyj/K9AbZg0RvWiQcWaPJcfiE+mzw2FOQxeB4RZZAcQsw
 cloA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxFK+N3gBqLfsVK+jUND5nk8/mQSi7AulzEmLzkqjZIvMBJfTHGK88Cy7QvTLyvBIuAvY+g5xMuow==@nongnu.org
X-Gm-Message-State: AFq9FYKhN8CuNGFQIQKCvX+iGLCWi6Ae3kQxxQO2nKzLSTVabTbH6ZAC
 D0Vo0cgIYG6e5o9ZwAJfA4eh2/qAuzISGti4vtBp6XP/vsBWvWwJG03E8fVBuKaCBFeaP8Ws8fP
 1J4VE
X-Gm-Gg: AYBFou2kK7LI2a1PMDCo9rIibFK/3yom3xyReIMsiFU0ECpw7gtaKamFzRUygbaSUBT
 uFOjZasfC7e7mrxrOME2nXLlS6G24MDiAHhbEZRXPxWdwbZ4Hwc4A3mSBS1uNpb7ztOFts8pEul
 toOwKO+Eqx9hkJx/4TmCQcHN1xQW5tCsvGmbZxqq4aFAmUcPB//PZwhx8hqvcp0s5YbYe8quNnM
 fDBC7Z2woHhHVjp37+x0rtiYDP2e5R+/W1c0mzhWhfTV/CdUCMZaFpO+ccfYHohNQl+f4HmYlEW
 kgKbFAfA7CcBLZpHEQ/qgTwuAKhxyl8U5CuOOAsOsBiWAC70ZPTQ1c8PQOhms+gWbXWN23Zfqnc
 /PkHm67/zFIzMXfgFue8aZgPULfhQh+r3K+AMcIo9cqAqVgKtRP7lbNt1ClCZK8Gf3YIz3SJSB/
 QP0emg99Ti0felvN5uo5FBQZvMUh+yEXt0d8vd1Z6l9HKC2RRtZuIVykHLjt9LfUXgaLX4qaav2
 3dBU2j5sui/IEjW2+xAeq0q
X-Received: by 2002:a17:902:d98c:b0:2e1:2f69:b6d4 with SMTP id
 d9443c01a7336-2e49b4e71c0mr35497965ad.15.1790972460656; 
 Fri, 02 Oct 2026 13:21:00 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:61ac:e744:6559:a357])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e49f6a99acsm12399415ad.34.2026.10.02.13.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 13:20:59 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v5 17/22] hw/arm/virt: Move virt_flash_create() to
 machvirt_init()
Date: Fri,  2 Oct 2026 14:20:21 -0600
Message-ID: <20261002202026.1204110-18-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
References: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::f;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 hw/arm/virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 35e76951dafd..886ea7a97ea0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2904,6 +2904,8 @@ static void machvirt_init(MachineState *machine)
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



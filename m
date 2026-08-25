Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5876C61DB9
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 22:03:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyzEK-0006Z7-3k; Tue, 25 Aug 2026 18:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzDH-00042i-Kz
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:48 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzDG-0001xJ-10
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:47 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-38e041ea211so444063a91.0
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 15:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787695304; x=1788300104; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=dhCTcoxWo5P8En8U5WBnLltAvsdfRdW+zmKjCvPnEtU=;
 b=xyduix5izdz50qfewikh2ed6NQ/zuoDVe7DU/C5JXddGrKG2pMSYBXGMBmqBynVaSw
 Efeq7AKU8dm63soYrdwzmfTOkyJVcZE1v8YTkAjNivMMO5xH3Mj/kVEG77CkdbyAKJBC
 N+XMTZEBvQI5Pf06fG+pj6FjQs69VLae7IczbqkHjeUt1j5lCHFlhKOzlfAdw+FTXHOe
 SsxAIGbWhhhfArB5uZeVH/sAWRsQXhnl2nKQJBqPyhJWvGG+mto00ExPFRgC7Rc2YRNH
 svwrGtMwhu/ZBKJX2k6RjodINRfaugeoyNTxl/emwHdFZ67dSCN7V4QeWDGhPUwGPqJl
 LmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787695304; x=1788300104;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=dhCTcoxWo5P8En8U5WBnLltAvsdfRdW+zmKjCvPnEtU=;
 b=TEkxhoY0M05fmhLGBH7EsAZKeWOFBcdzJ/2Y2wbQkCvpnKGT+xCP6PG5/JRQqTB1S8
 0eZbN1ne52tNOvfGMWCE+NxikZLe+F2hF93JjAVlmc3brzecP/fnyfmdcawOPjB8TfXi
 F6zPl4HSzWXiDJHpA8cVQOU/Hg4Fid5GeaYzZp33kQyN/3HgZK7aTPbW0Y4Q3R/JgP2z
 JvGCZ5VZewkFN/eVCspuqyfVg8g73+7e3pFouXqLVvTncKconK6h9CWk2XL5XIRgyJta
 y3z3G2ITGuBTIkCbTa1Q6aeQyQXEf4Egf+9j/ih1+6lY0k6PEHUGPlhieqkkAsP+bYsF
 FoSQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrnr5jjIOz5ALSCdngZU68EPNZ0/3oihARMNzQiz//D9iG41oPQkLyjeu/o9hPYWA+gQpkVFmkX0g==@nongnu.org
X-Gm-Message-State: AFuF++kvhF+fzlHgfZ9ei//Oko9w0B6IJcNBQmFIPZXmxVmQ+ZBWWgT0
 smwDRh8twYdmfCZXdkQEoeoWBpDoD6pvZ/BL0dTxmkW0pcYfVqzmq0sYGMRSw+wr4Gs=
X-Gm-Gg: AR+sD11orRr71gMfMPrHlaLaOlJnuGPSRF2DhSB7juxB05RkYIf1yiUAondsN3obtK3
 s5W88wWavTv2bQF/E9nXYwpA1mbYM6TZuW0KrUJW0/mbt4oNBWWsGdd3YfppsYc3hlf897Fq1Ep
 MxWMSHMWXi3kWXen3zkTLnRcQ8cpJ0eeMetnYrsdCJ2eCmvFkc1SDtXLgmJydh6ncXFcRFDToNe
 kTioUa2oMPEj6frSF37bZn3QGWW2T3qJ5E550NVT8ntiZslViMG61aG836TZ8Mpb6w7wZfSTcH8
 J+pKrteZSRQr9PaVrZNi01FUZvNFXVm/e2dNIDZboeP/EZE3Ri62HcXzWdvZIY5YkCcJaM9vHgw
 Sv2J/rHek4aog/6gHmG60gOXCfQeZjCl0AzrujEgU99aR1qzP5rYP8QMzJ0IXrX2zvETks35CQw
 0rd1I5Q9KHlFQk2bndav6LDj94E/K0mf0EkmFCcUTolvq2SbDJMWaJHl5f7loYxL/NEQ9jphdhy
 NoIMkQYqxPOFas=
X-Received: by 2002:a17:90b:1d47:b0:38f:aab1:5148 with SMTP id
 98e67ed59e1d1-3966d8ab6e3mr4143621a91.13.1787695304520; 
 Tue, 25 Aug 2026 15:01:44 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:a37a:292f:1363:c0af])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3965d119724sm3090120a91.2.2026.08.25.15.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 15:01:43 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v3 19/24] hw/arm/virt: Move virt_flash_create() to
 machvirt_init()
Date: Tue, 25 Aug 2026 16:00:56 -0600
Message-ID: <20260825220101.3443954-20-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
References: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x1033.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 hw/arm/virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c300224f19e7..966577d6a66f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2861,6 +2861,8 @@ static void machvirt_init(MachineState *machine)
     unsigned int smp_cpus = machine->smp.cpus;
     unsigned int max_cpus = machine->smp.max_cpus;
 
+    virt_flash_create(vms);
+
     possible_cpus = mc->possible_cpu_arch_ids(machine);
 
     /*
@@ -4350,8 +4352,6 @@ static void virt_instance_init(Object *obj)
 
     vms->virtio_transports = NUM_VIRTIO_TRANSPORTS;
 
-    virt_flash_create(vms);
-
     vms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     vms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
     cxl_machine_init(obj, &vms->cxl_devices_state);
-- 
2.43.0



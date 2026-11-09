Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E987606A331
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 22:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lIAZrgcO
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQXu9-0005Od-KF; Mon, 09 Nov 2026 17:31:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXu2-0005IT-B0
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:50 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXtz-0003xD-OF
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:50 -0500
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-8b6399ebb41so1242846b3a.0
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 14:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794263506; x=1794868306; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=/mw9MRLyLESc8KIvtqveP6obTMbEMi6oIn8oBDFbEyA=;
 b=lIAZrgcOpJd+AYU/ABQHZrMjuQBXOA8iiueZ/jv78B3G8qyqexAZHITYYqUZLqrcSF
 XYssRhAcHeXU9xYNyc2T7isyeC/0Lj8lgbgjI7JIP6UtG5aiMoaKtG9QZhAdccBX/2W0
 xbM2gaIoE3IW9WnI0aviJHW2ncRkcR+HAhtQXRBwXCN6i5o9nCRhBdOmaaUIx1davOZr
 IEwHPOKN7Tuu8m7n8ebZXW10HpDJikhAvVjSeAo7bLAovU9zLs6tX6n1E9zztRqLsDFl
 XPNtxhxLNLgFsgzZmNuZwTvt9fikVHsuyW4toDDGzbm0ewCLx+kdkLs5oVsoYqAHo9+7
 LW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794263506; x=1794868306;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=/mw9MRLyLESc8KIvtqveP6obTMbEMi6oIn8oBDFbEyA=;
 b=oMLE2KF1eBstJSTTA2LHrU/t5JQ7HX6ymQpRtDMgdFnBYgbIO7cE5ZB86+UFwpR3Pe
 VlCpHgtjJWmRtSO0b3cOGkeaydCtsJOjqyr9/3hx2rBbNUFa73ORPOh/rcwXTh64blho
 OKMpmzHPrSxwt09rPx5IPn0L7vdDj7fgplnM6cTpk8vV3o0vazpNGV1xLxd7FHjcQ2xH
 0q6bOTHCFK+L+QxgGYePQEmyfNISFBVxMGIqp3Q9SAW+vtbMr356dSVoZnp3cd0rmYhP
 5Pd7ErSqBWm5PJfaHHat7T+LbdNEWpJp31+0cSWht+zsbI++7Tfsu4HKb1mV5VqllEDd
 rt6A==
X-Forwarded-Encrypted: i=1;
 AL+hErGdAoEfSj/6xbDcQuGtW3Tls4ib80YVvDSc+qcwcnqz6cGQDezgYC8Vv6IsHAnJuLgByk8qKlu9YQ==@nongnu.org
X-Gm-Message-State: APuU4Z95PjJPNKGUFys2gBShAK4ZX1E9BEf2gzfjcv5nBJqN+I5NoqA5
 btZbtGhmfy6lWT48VjunBbgvSJSozubKL3dNecHSUd+PwYV9BuSeJcJyaAA3M/jHfEU=
X-Gm-Gg: AYBFou1v8gaWFMJImAn89wnRT9uzKAuganv4vGzy/+wwH1UHiVJXYA2GBgCCelBUJp9
 s30HpTmNId7tpGQu9BMTF1AtZWEGr2DCKVEv7Wdh2aeCharY0Az5PcggtffS0x+jlRMlrlMN5MG
 hrzS3+f2w3JQxm/g9Qvh8lpH0vLgyw3WIDGp0LJCcP8GAz9lyQI/gZiSfaXzQCgwVgcgZu/oKcW
 YC+DgIFAZ/cnZYpOLPzZiflQeE5kEetMwxguvLcAf7Fqi8gxSdbGLndT47KDi356KiOOiAGuYZH
 1RwQmbTkYUH5JII2vsqI5prAJAmFvDL1aUIQNGsx8SKOXtEYUFiMBNv0QCnwJTZw5qgfyKAPlSQ
 Lp+0oIetxicoFOjTW7Ne3b3p1sepNJCqIkFa7t42cXFLIMFstms/n1L3iHl8K2SFHUkc2plATWR
 tx6A3/FrLINH024Nzzy+geSt946/ezMx4NaI3zMnPBYHU4iHxQriyABt73Jfsl4fz0utxZdPksu
 0gMQpnnXdyI4lsRN3fxlBHqLduZSodEwprXrXg7dHw5+jmZeM+Fp9whZ7HeE/0QuqMnHTZ4jdYm
 Qed+2QtYxoH8Ud7utqnOVn2VrQAPTaE8oDnyNXk7DwVEU5d1ZL91fQ==
X-Received: by 2002:a05:6a00:1496:b0:886:cde6:694b with SMTP id
 d2e1a72fcca58-8ba89f19b98mr876605b3a.38.1794263506327; 
 Mon, 09 Nov 2026 14:31:46 -0800 (PST)
Received: from p14s.cg.shawcable.net ([2604:3d09:148c:c800:54d7:1b5:4356:16fb])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8baa506bca4sm165830b3a.0.2026.11.09.14.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 14:31:45 -0800 (PST)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com, michael.roth@amd.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [PATCH v6 18/23] hw/arm/virt: Move virt_flash_create() to
 machvirt_init()
Date: Mon,  9 Nov 2026 16:31:05 -0600
Message-ID: <20261109223110.1619504-19-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
References: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x434.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index 9d53ed4d51ca..f1ca233a1566 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2922,6 +2922,8 @@ static void machvirt_init(MachineState *machine)
     unsigned int smp_cpus = machine->smp.cpus;
     unsigned int max_cpus = machine->smp.max_cpus;
 
+    virt_flash_create(vms);
+
     possible_cpus = mc->possible_cpu_arch_ids(machine);
 
     /*
@@ -4444,8 +4446,6 @@ static void virt_instance_init(Object *obj)
 
     vms->virtio_transports = NUM_VIRTIO_TRANSPORTS;
 
-    virt_flash_create(vms);
-
     vms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     vms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
     cxl_machine_init(obj, &vms->cxl_devices_state);
-- 
2.53.0



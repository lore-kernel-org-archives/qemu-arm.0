Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp574156ejd;
        Tue, 16 Apr 2024 12:03:43 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWxjrKPibzpK15L2g0EGJ3pfrW+ZTmHaiEhULUmWefN2I6Y9v+tjYi7xDG6x/xrWfUUWCNKgGyXWwnN2Qaw+B8H+uwhuRuQ
X-Google-Smtp-Source: AGHT+IEsevwwUJrLeKKRW0stdf3pCmfikTQIQzbQVfFrEKpfSy450CDmiajTpHmF10t9KYUe5JCZ
X-Received: by 2002:a17:90b:b0c:b0:2a2:97ce:24f5 with SMTP id bf12-20020a17090b0b0c00b002a297ce24f5mr14054134pjb.35.1713294223407;
        Tue, 16 Apr 2024 12:03:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1713294223; cv=pass;
        d=google.com; s=arc-20160816;
        b=L0pYQHIcAqdzsl6md1UJwKh82H3MhsqQS4RS3S120KFWCfTMrJsgxEMU9fe8KwTl6n
         PDDADcEkwVKPYfQcKG1Nubfw7ZeILObfEAoIg3psXCSUztTzI9MHm47i6U43MXQNfrMw
         A2bCL8T/r77QHuZzEj5D4a1uCibZkkZoJE+zucRih7Ca29LYbGgjqSQgq0Xn97O9W8Ng
         4uU8/YRWL5WW/zXqdCYiQlgxDSF/tNLnYmgh93igsKch2R9YYNgQSUqTKq6/F+Okbi/w
         WlIFMpvI0QC5eOWDp+cDK9m6Y4SdVyi0l1J+ODo8HCSX1DIGLHMDZkKIO9mmaCAUe8fL
         aYUA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=kMNnC0CtBUMfvsWtjsnWY6TflDR4yCy2djdqUVTuvak=;
        fh=GjH+4XoBWHAudEF4fhVelGGpXGf/0QzCYvzBn6kOd6o=;
        b=b42qbDYMhENBQoh+rP4GVLV8RJVLdTu+9xL9o8zCrxDEVeyhEjxCto2knKg9KkcPz+
         yOW+L0rvPSOKHtT5wMk5/HCqcaulorqIDzBfqXjs8VmJ7kRdyiOxePONdRcLDI/c0NTI
         P5BFZqNIppNdea1nmkPG76AM0lxEij0ddXVsiJrZRWk4L1lXGEb1w1sQFJMouRmQXHDD
         ACrC4TMjr9Z8F7HoIZHvL0ooa/WtfLjGhetHkjmdvSUdeIyP2CZkirnPG75fFVijl7JA
         ZLp6gPGYIWs4rdJOwHKuyUNwQqu9HHKYBNft9D8JuWsObavTny25USh1Vq1TrGytWkQ1
         SwfQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R23Wb54f;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-14871-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-14871-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-14871-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id cm20-20020a17090afa1400b002a046fecedcsi9982266pjb.41.2024.04.16.12.03.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 12:03:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-14871-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R23Wb54f;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-14871-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-14871-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA400282D99
	for <alex.bennee@linaro.org>; Tue, 16 Apr 2024 19:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62567137C39;
	Tue, 16 Apr 2024 19:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R23Wb54f"
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B46D13174B
	for <kvm@vger.kernel.org>; Tue, 16 Apr 2024 19:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713294132; cv=none; b=QiKh8bHZsYldrVoUR86oMDcihGRR6ovj5irT2DlopgvYeb5UMQmHdFjKSKhCWP/cnSsQvFes3xr6UiGr7GXNkP91GDQ/AC4UL0W9OY88mBLKHsDLNB9uRGpIHfN/8KLBjuHjEk9TiytgA9/vn8FK/0GmQmLgDnPrcYpXOEJRNbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713294132; c=relaxed/simple;
	bh=utjCSRSnFQ4QGhgePIrwuRcocO8CWSqeIQIJaiflH2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XrtochNepYRsCi2s3SvNZQt6CrT2JnPw3GLLKCge+0xGy8/+wps7oNeCBM93FbOzaIa9KO5+KpstyH0+AZCnCUvWoxQbVDOjsTZ4yGcH9Y3Rt/TkqxQPdAcZbk/TRIrDu8yMSyxTv+p7JG9FdkswMiFm2nBOaBvgzju0OPCikao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R23Wb54f; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-516d2b9cd69so5894557e87.2
        for <kvm@vger.kernel.org>; Tue, 16 Apr 2024 12:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713294129; x=1713898929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMNnC0CtBUMfvsWtjsnWY6TflDR4yCy2djdqUVTuvak=;
        b=R23Wb54fw2S4g0ZBR9K9U8hZRfsdvla9MyE9OE5vR99aoxka0XvYpyhLNLaV9TlCW1
         OOMt3X2CA8Zx5C9qEL+sPDj0Oi2sN1kkbguo0rwVZ8AY2+oUbbu69GQCxZnzzhxVc/Y8
         rwz0d8tSJchEj3qycgGs1k/EnWpLbw3a85rRy02HlTmURT5TF1/nZnEpEZOZA0waJku/
         qJHwUixWoukCssjDhScKG3sSOo/D5AankevI3jRKifAehpjif96rJnKNJP1+aIu2mLaE
         tDBAPAZNlYPULv0j16/l0CgePfIifq4b5qEOguRuOnQ5Ph5UxqMqufKtQFQ/4E4sQi2/
         FuxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713294129; x=1713898929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMNnC0CtBUMfvsWtjsnWY6TflDR4yCy2djdqUVTuvak=;
        b=Ov/k0AB/z2MfcJlZP/uzd0rMQ56xHcZpE4Xs+Xkc0Ud+LvVnKxxwWM6kcu3LXFqfM8
         46ckiz3nRiluirUGDDUgvqErLm+7WmNtI/MQbmRqN/USU8SqnPp/KLyb/90sgj3HRe4b
         3xRESvjo7Bl7zgmiMnsLxpQ6Sm6wbjLQrjLdmnUFaXITcpFd/oPnlfFvBxF+P5GoTlGc
         GB0zF+XkQDjEjy8l5NfC8/NY3WalRvNjCAFflUuVObha4FcbMk64Bdn9x6vcndUnBlpj
         1P59VZa9qwogAO3A6VekroFft+mst1XVlDt7q/MT/1Au5E0JLMF11+D2TyakQV0tNfyD
         aBVg==
X-Forwarded-Encrypted: i=1; AJvYcCUpiW9MBd5br9TsdhqB4SdbSmaTZ+Zw1boRn0s48mvquOeQpMI8eLmwDM+KBgwRLfivIHpi8wGt7nOYKTZFgYTtcCOP
X-Gm-Message-State: AOJu0Yxrql74QioCagw45AWEAUFiy9zU6CNwvwCR1J4tid1WAx8+OFTB
	QxoVNhxRogEIMo0yfyKWLoDoRBq2tSS0uk7EwfK4nSHtFMN1kc1CPJDpS6Yl6s0=
X-Received: by 2002:a05:6512:33c8:b0:518:b069:3b7d with SMTP id d8-20020a05651233c800b00518b0693b7dmr6333284lfg.6.1713294128761;
        Tue, 16 Apr 2024 12:02:08 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.155.61])
        by smtp.gmail.com with ESMTPSA id d19-20020a170906c21300b00a553846966csm1570949ejz.24.2024.04.16.12.02.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Apr 2024 12:02:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v4 22/22] hw/i386/pc: Replace PCMachineClass::acpi_data_size by PC_ACPI_DATA_SIZE
Date: Tue, 16 Apr 2024 20:59:38 +0200
Message-ID: <20240416185939.37984-23-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240416185939.37984-1-philmd@linaro.org>
References: <20240416185939.37984-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2XGUSmjE2qH1

PCMachineClass::acpi_data_size was only used by the pc-i440fx-2.0
machine, which got removed. Since it is constant, replace the class
field by a definition (local to hw/i386/pc.c, since not used
elsewhere).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 include/hw/i386/pc.h |  4 ----
 hw/i386/pc.c         | 19 ++++++++++++-------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 96ccb4583f..0ad971782c 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -74,9 +74,6 @@ typedef struct PCMachineState {
  *
  * Compat fields:
  *
- * @acpi_data_size: Size of the chunk of memory at the top of RAM
- *                  for the BIOS ACPI tables and other BIOS
- *                  datastructures.
  * @gigabyte_align: Make sure that guest addresses aligned at
  *                  1Gbyte boundaries get mapped to host
  *                  addresses aligned at 1Gbyte boundaries. This
@@ -100,7 +97,6 @@ struct PCMachineClass {
 
     /* ACPI compat: */
     bool has_acpi_build;
-    unsigned acpi_data_size;
     int pci_root_uid;
 
     /* SMBIOS compat: */
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 2e2146f42b..0be8f08c47 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -256,6 +256,16 @@ GlobalProperty pc_compat_2_4[] = {
 };
 const size_t pc_compat_2_4_len = G_N_ELEMENTS(pc_compat_2_4);
 
+/*
+ * @PC_ACPI_DATA_SIZE:
+ * Size of the chunk of memory at the top of RAM for the BIOS ACPI tables
+ * and other BIOS datastructures.
+ *
+ * BIOS ACPI tables: 128K. Other BIOS datastructures: less than 4K
+ * reported to be used at the moment, 32K should be enough for a while.
+ */
+#define PC_ACPI_DATA_SIZE (0x20000 + 0x8000)
+
 GSIState *pc_gsi_create(qemu_irq **irqs, bool pci_enabled)
 {
     GSIState *s;
@@ -634,8 +644,7 @@ void xen_load_linux(PCMachineState *pcms)
     fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, x86ms->boot_cpus);
     rom_set_fw(fw_cfg);
 
-    x86_load_linux(x86ms, fw_cfg, pcmc->acpi_data_size,
-                   pcmc->pvh_enabled);
+    x86_load_linux(x86ms, fw_cfg, PC_ACPI_DATA_SIZE, pcmc->pvh_enabled);
     for (i = 0; i < nb_option_roms; i++) {
         assert(!strcmp(option_rom[i].name, "linuxboot.bin") ||
                !strcmp(option_rom[i].name, "linuxboot_dma.bin") ||
@@ -969,8 +978,7 @@ void pc_memory_init(PCMachineState *pcms,
     }
 
     if (linux_boot) {
-        x86_load_linux(x86ms, fw_cfg, pcmc->acpi_data_size,
-                       pcmc->pvh_enabled);
+        x86_load_linux(x86ms, fw_cfg, PC_ACPI_DATA_SIZE, pcmc->pvh_enabled);
     }
 
     for (i = 0; i < nb_option_roms; i++) {
@@ -1724,9 +1732,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     pcmc->gigabyte_align = true;
     pcmc->has_reserved_memory = true;
     pcmc->enforce_amd_1tb_hole = true;
-    /* BIOS ACPI tables: 128K. Other BIOS datastructures: less than 4K reported
-     * to be used at the moment, 32K should be enough for a while.  */
-    pcmc->acpi_data_size = 0x20000 + 0x8000;
     pcmc->pvh_enabled = true;
     pcmc->kvmclock_create_always = true;
     x86mc->apic_xrupt_override = true;
-- 
2.41.0


Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D20FCCD193
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 09:41:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAmNe-0002eK-SG; Mon, 20 Oct 2025 05:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAmNZ-0002dw-Vo
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 05:40:38 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAmNY-0000Pw-5H
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 05:40:37 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-4270a0127e1so1633417f8f.3
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 02:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760953234; x=1761558034; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2KxjeObRk1P1HK21h4eui2hE+ps24ke9aec+CgRBzl8=;
 b=pXLLXAC6Lygkwj1Nik7zpXZ6IasNKGkSs25SFfSOtfVxYmv2AgmZyY8SPfl2TTfPa1
 bL225/LJgs+mQ2hebZMttwm8mSNuGuiC5kgtVEmj7wLY3+7r6ZZttKNePkpavc5yD6DP
 Y3OcxE0Tzlg7ID+L6bYuWovfzgqzi2Mu4uBNG/uzNFfOpxxE66uYatYXO2cO3AutnMVR
 p6DlzH7z5ETLZ7ljzSXkfWBGEhCGdLvKWdmfErb/76eLJeafR3fLP9U3VJ8yrz66cehB
 j5VX7gzkzu0MVm2bymjsg8bC5uhSVA1T8bFf3O6bfnbHW4gNb7qLfxoqQcGBXODxupNR
 2E2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760953234; x=1761558034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2KxjeObRk1P1HK21h4eui2hE+ps24ke9aec+CgRBzl8=;
 b=R5Q/sXFPn/6sfcuM10LuaF1Ms2+DvPXBGwvFiygVaL5Nj4puDMv32iKf5f1os8xVCx
 diZQWbkHhPVPd/shw0wOguOR5ae7KxMYsBGdK4gKJODupq5EC28CEe32LmuRTIfnzjub
 mxQSwu6E//b2MOwxnH9PYCxZw6ZlGjrvRbZmQM9EoO4Et7YFZEdyYmOqunEdzJTg0WE+
 OGI+nE8c8HcDzN3XDjZeCNeUE82X6xRNRyGYwbvJ4sPirdQwMTp32joaEKuAvAnIhddV
 OCzK6mCWCqa/J+5rlhPrDLIJr8NB1v6nBIAk+N1Wbz2Nzvv0hSwRNmZ5kPQzqE08cMHX
 enQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2rsAKAozFg+5bl9FjbxlcYigFZw7eYBNlBzfZsa6B2ZBY20A/5Jrezr4LyQFR9ATnDIWHeGhjHQ==@nongnu.org
X-Gm-Message-State: AOJu0YzxElizTPqcPOtg+MbPj04k6nCCNvj/uCYOA+QzI8aFiscfc54j
 d5wlIvL6P8pzTLkytskjerNzycJBXF0t2uhgK/z1aXyJAZBDbc3ucZRYeivyYR4ocEs=
X-Gm-Gg: ASbGncunA35OtFDlasd5kGrRAYTAn5rl8zbJjRVAe3EL8+HvXDljI3qrpgz3aGqyD8e
 Zk2bp8PDhaOORV4pahf9qJZfnSAl92RXs8ihLCn8WWCBoeu24dz9hu7c3A6ivqrQ9cTNPpm9xB+
 8Lf6e3ZokWSJM2l7bGohLzroqNzWUov31iQwtAC9GkOoxFdl50uMy3kz21qY22j4DFIP4xaFL6T
 PO/Caif6pRj1FISOrNhpqo3fbiGjeyhD6kUlTPdFNcgcinWuBI4GgAUF2bFUL8UzP+1MEkUnAty
 2+eMYv3qDN72CqNwvt5cHiK9Kc1gJz1dkb4wA6piO9wdn7RrUG4JAmkz2XvpI3JSbYVREJngoGZ
 9JlGCJkfS2+XZOZi9cHUy5dQhZeh6i9ieg1yAWAFFEOHfVjGki+WpLmXygnrq5CwGKzc5xMtsRd
 MLD0zHCvytdHfkwKhXxr/FWkDpVNAxNf5CVOJNdveGYBCQ/tUiSw==
X-Google-Smtp-Source: AGHT+IGKqkcNPkCKLUzn5wtyFVkd9wp9INwWUrvNGIpJ+IBbjuBH58rpIyTMXnRmO5oei8Qx86P8zQ==
X-Received: by 2002:a05:6000:2301:b0:428:3e62:3221 with SMTP id
 ffacd0b85a97d-4283e6236admr4666015f8f.51.1760953233896; 
 Mon, 20 Oct 2025 02:40:33 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5bbc50sm14564755f8f.21.2025.10.20.02.40.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Oct 2025 02:40:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 2/4] hw/arm/virt: Remove VirtMachineClass::no_ged field
Date: Mon, 20 Oct 2025 11:40:19 +0200
Message-ID: <20251020094022.68768-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020094022.68768-1-philmd@linaro.org>
References: <20251020094022.68768-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

The VirtMachineClass::no_ged field was only used by virt-4.1
machine, which got removed. Remove it as now unused.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/virt.h | 1 -
 hw/arm/virt.c         | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 04a09af3540..993872bb680 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -123,7 +123,6 @@ struct VirtMachineClass {
     MachineClass parent;
     bool no_tcg_its;
     bool no_highmem_compact;
-    bool no_ged;   /* Machines < 4.2 have no support for ACPI GED device */
     bool kvm_no_adjvtime;
     bool no_kvm_steal_time;
     bool acpi_expose_flash;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ed81f3fe8d8..2eda2d43974 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2210,7 +2210,6 @@ static void machvirt_init(MachineState *machine)
     int n, virt_max_cpus;
     bool firmware_loaded;
     bool aarch64 = true;
-    bool has_ged = !vmc->no_ged;
     unsigned int smp_cpus = machine->smp.cpus;
     unsigned int max_cpus = machine->smp.max_cpus;
 
@@ -2512,7 +2511,7 @@ static void machvirt_init(MachineState *machine)
     create_pcie(vms);
     create_cxl_host_reg_region(vms);
 
-    if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
+    if (aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
         vms->acpi_dev = create_acpi_ged(vms);
         vms->generic_error_notifier.notify = virt_generic_error_req;
         notifier_list_add(&acpi_generic_error_notifiers,
-- 
2.51.0



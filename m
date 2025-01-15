Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp3171602dlj;
        Wed, 15 Jan 2025 09:12:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUetdS7teMHpF1/oyFXAdBgQ3u41rSGWVi3D8XgtoNegOOnXNVJF5aOy6baCtefRr7ML1k2APVW7RizUg==@linaro.org
X-Google-Smtp-Source: AGHT+IFvAjQ6m3MrteL2F46gd+42rg8YPu1Aj4BSqoi33Nbp5PLmA7d21Ddr13m9hgDe7+7GVXgz
X-Received: by 2002:a05:6214:27e8:b0:6d8:99cf:d2e3 with SMTP id 6a1803df08f44-6df9b277077mr390045586d6.22.1736961139263;
        Wed, 15 Jan 2025 09:12:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736961139; cv=none;
        d=google.com; s=arc-20240605;
        b=BZHwKgMoMFj4qC0Y7b+CP9r44Sf2TgFt7qXCowEspWAZocuSQRlAH3MgW+mvQWU37j
         pq0f9M11H1dNFFzgV8wjNV2k+yADIzYMRr1rlby3zphD9kyllIc/Q+joNtMqafkr79Pk
         WAIqSHpK0vetiSjDcLBhEb8xfU62/TP94MaxjyEXeANfwiC/iD5fecynK07ndUpB/aSL
         cJAqC0zwPlzTUKrfQpzOojhbygFEueiqYuT1ti/uB7w7PbUSnIlonWUUHrqDw7AzkmNm
         luuaaCdVQK+EloNls1o8ekZUML5sW2gQKGY+13wZywb9RAwdYG4coSH+325RM9eQD0Kl
         SA0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+rpS4UoGMNFWvPB8UZ1XtPkvHJUg2YKopwCuDHPyLwI=;
        fh=7UZiU2xA7y4r3vQsYRZ1MLTGY2qVLagIw8QunwUbkpY=;
        b=VV3wg/rrN8Pb3oQndmZQlBYohkOBm81Xe/L6kIxYdmfPq/XuipnWEMwAC4xcMLLoYx
         EMuaEXRW7Nob0TLC6ayUKsGDTRp/OZlFqjaHmO1hlKcaXZpRnH8RTSXZhCvS2XDg2lTh
         EfZT4WSkpgD/Isfe/xcmYZhsb2SPbsVyLXSvk4DPRhlcu34CXK7ah/ZKhwstyjv/pXOp
         eUsbEOVI8uHK5ZhBIt6Fn16LMVr0NEhMWChyHQzKsZB5LTSlybKB4TuEeNAQoaE9kCL7
         FteCVuT8Z7QAwKECJZGYx0JJ0nuI8h9t95HgNYbRcWj4e5RAVL/K+lVfhTFpI4cVqUml
         lVSg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P6M+Zvz+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dfadfc6038si155910616d6.393.2025.01.15.09.12.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 09:12:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P6M+Zvz+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tY6un-0007Rz-Si; Wed, 15 Jan 2025 12:10:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tY6ul-0007RT-TD
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 12:10:47 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tY6uk-0006aY-At
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 12:10:47 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43621d27adeso48751755e9.2
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2025 09:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736961045; x=1737565845; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+rpS4UoGMNFWvPB8UZ1XtPkvHJUg2YKopwCuDHPyLwI=;
 b=P6M+Zvz+hcU9nfpTr6Blmwce3ktOcXbQnX6+VdhCdAyf5zE0GwCPYCaRxJCB2UHuaq
 4KOCR6CLtbag9NjFi0M/8Ss0gVke8Lm27xqEJ75MPmIMPug40UHgzyqK8Un0qr7as4K8
 p63Hj2vIYifURDSDo+nlnp7ewQDsUf65Cee6o1R4z0MdI2RYVoMSx5uOXFQGsbhns3IG
 kPRg8pyVg6eqxOaCCy/rcXAB98lyTEN9QQuxmsYCgJxBz4/FmlfyvmHmFNNKBZPbgHud
 8+EYhdJjC8STjvKKZ4f2x5Z2jN6gi+isILTEQC8M3uiLBgCD1myfonL5tfIJZ4I4eICK
 SqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736961045; x=1737565845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+rpS4UoGMNFWvPB8UZ1XtPkvHJUg2YKopwCuDHPyLwI=;
 b=VQsoI0ZmFjoVPVBE3+ORrbzZljhp6LCtoRVAoMohq7/8bvJTNFgwc/c+oePCub8k3c
 CwSV2CxahaZfGCrP8UR0MG5sJcdrw+g16ydyQ4fyJiVNiAgotkTyB4dcgXUko6ZmuAU4
 tGTFhYoGak+hjhUdPeIy5UXl+3mjiqYIem9w4Dd8pXBRbtPkNRColTsaxQF7xI6wmTbT
 XVDmGO2JSF8Xp0kNgbh1DNo/zrMdYz7SUK+lhISmWjPk1Cl9jBqKxzpMYXvI3CqIuxiF
 DUs6y2B1FMeI2Zh/tdWqjHRlbNd7IW7lwaMQxQYQOAhm27VywNtEevDIWdo5YRsEVyk4
 X2Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnuiLHfx7HIAwk+IacwSz/+siw33BTpZwVQif8n7CbY4AX9bk7bymL/YrSgh9kEHt7BSXvZCgb5Q==@nongnu.org
X-Gm-Message-State: AOJu0YzdzS6z9otgzPgg5Cmfsb7F7aaJFKb0OJsKRW+hlrRS1d05X8G9
 mJhR45wcFwv3ZSUg3u17aT3+3RSXriwrCf93KKvQe/ljDBIP4XPXcbPapdXks5g=
X-Gm-Gg: ASbGncv7qCY4Cr0AhlQ0mSvZavpwq8SNnoZXf1xneNmjcWt4W+Xy8JNaARoBJ4xbpe/
 1gyyR/O8nhxN+BVdGC3YWl+E4YTPRFdbeCPq2PVfxSKyCUs6yXbQ8oNUt+cv3JSs1yL35St44ET
 cVKndncq7hJlWBC0ysXWQLDnYAgu8xGO3ZpHFYO59BP/vxQvMtoMNbgyxKhFho0VV6btsLP45Xk
 FaVR4mb0IhMkgbUz/RKZ6Kwf0QNwd37B3rJAUCWnOlFt9HuA//1ngaCs12rTgzJhicV3VU4tRgv
 bTh3QrioixMlI3r1uqumpO6GpyiZ4IeSUxi8
X-Received: by 2002:a05:600c:4f4e:b0:434:a902:97cd with SMTP id
 5b1f17b1804b1-436e26935cbmr265279745e9.12.1736961044600; 
 Wed, 15 Jan 2025 09:10:44 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e37e36asm17745917f8f.5.2025.01.15.09.10.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Jan 2025 09:10:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>, qemu-arm@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/13] hw/arm/virt: Remove
 VirtMachineClass::claim_edge_triggered_timers field
Date: Wed, 15 Jan 2025 18:10:03 +0100
Message-ID: <20250115171009.19302-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250115171009.19302-1-philmd@linaro.org>
References: <20250115171009.19302-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: e0N4NxnQwqFz

The VirtMachineClass::claim_edge_triggered_timers field
was only used by virt-2.8 machine, which got removed.
Remove it and simplify fdt_add_timer_nodes() and build_gtdt().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/virt.h    | 1 -
 hw/arm/virt-acpi-build.c | 5 +----
 hw/arm/virt.c            | 5 -----
 3 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 463ac09615e..9c531e28d04 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -118,7 +118,6 @@ typedef enum VirtGICType {
 struct VirtMachineClass {
     MachineClass parent;
     bool no_tcg_its;
-    bool claim_edge_triggered_timers;
     bool smbios_old_sys_ver;
     bool no_highmem_compact;
     bool no_highmem_ecam;
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index ccecea9e09b..6e04fea165a 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -537,15 +537,12 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 static void
 build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
-    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     /*
      * Table 5-117 Flag Definitions
      * set only "Timer interrupt Mode" and assume "Timer Interrupt
      * polarity" bit as '0: Interrupt is Active high'
      */
-    uint32_t irqflags = vmc->claim_edge_triggered_timers ?
-        1 : /* Interrupt is Edge triggered */
-        0;  /* Interrupt is Level triggered  */
+    const uint32_t irqflags = 0;  /* Interrupt is Level triggered  */
     AcpiTable table = { .sig = "GTDT", .rev = 3, .oem_id = vms->oem_id,
                         .oem_table_id = vms->oem_table_id };
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 4ec94190769..ec47ee4755a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -361,14 +361,9 @@ static void fdt_add_timer_nodes(const VirtMachineState *vms)
      * the correct information.
      */
     ARMCPU *armcpu;
-    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     uint32_t irqflags = GIC_FDT_IRQ_FLAGS_LEVEL_HI;
     MachineState *ms = MACHINE(vms);
 
-    if (vmc->claim_edge_triggered_timers) {
-        irqflags = GIC_FDT_IRQ_FLAGS_EDGE_LO_HI;
-    }
-
     if (vms->gic_version == VIRT_GIC_VERSION_2) {
         irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
                              GIC_FDT_IRQ_PPI_CPU_WIDTH,
-- 
2.47.1


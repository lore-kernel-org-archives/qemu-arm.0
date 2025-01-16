Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3807853njn;
        Thu, 16 Jan 2025 07:01:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWemz7bsOmhJCDSK3EIWnFfLaAxclTdRjhbNby3X0VyVBtMDNNsDwxKMbPUs2e+m/cP8i/aDLMGTJUgxg==@linaro.org
X-Google-Smtp-Source: AGHT+IHWnzOQ8iShKpqFXZJTqq9QYAjOj5Q6/ur0iSEI26Ax+og8gyNXkm++50lTQG0F+ffX/F5I
X-Received: by 2002:adf:a44e:0:b0:38a:36a5:ff81 with SMTP id ffacd0b85a97d-38a8730e0admr24450064f8f.40.1737039669264;
        Thu, 16 Jan 2025 07:01:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737039669; cv=none;
        d=google.com; s=arc-20240605;
        b=MagieUXQs6jxI1HSbRLTTpVQTDvx4frP3oaP+EV+n9ZIgIWw0WBX4P8ujQjiVBtV2F
         yUEap+4q2keqXMhzBks7NrHqQzCDCxP8blyIEY+cRM/tP0dv6q+qoKUclnOI/09najMm
         ZBy5v2wbP653H2s9sGlnwx1OOUbvW2/Inbey5oKRBpBFVXuhJMka23Twvbe2qRmCNeRP
         2IwR4NwEv45LOUm2WLVuXeRYmtHf57nLfYnWQUYSdFIBEFIgnEZ9p/NReYK1lR7l9NCE
         zf8OSnotcYyaFwBwF/K+oOwrhRYCnfkIXrrCf1eVIm1vAypSUzMzdVx3OwWOcsMdbcr3
         QshA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QKyurn3hyAn+7BGFNFmnur/chv9BVb1zR9y6ikplhXM=;
        fh=Q5GNgeG4hwvXK8nWDxwLySQTPXZUr9FLVptSZ1H/5p4=;
        b=BOEaPOtERNuKGB0vNXGnov3CBb8D6dZ8DIkZi2wJx3asg+8k4vUGoe3hgTWRhtGpTK
         49+a09n42mCMrR91HAu9cd7j3az1y2RLfmDDObyHREcFkC689xuLUZsskdow3CdTCrdE
         fFP9y3LHN5A7HbiuEa2a2R4ZkQgfaViKQI1sqDzgVXhkJNNzpltSinBIeNvW+LR2Q3oT
         IM2uo0WvkgNRoNmS+bLwazdSfkwmlBYuVoKS+/tvAnH2gjwW78GJrqddtOQTj5aBSRMI
         LfISYXwwnPMskdJPYyqOBtDVIzzFNnbveno5zBWEBbOlVdKtH63bFbk/5Eow5jv+9dM/
         +C1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E4BC0TtZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38bf3283461si43960f8f.514.2025.01.16.07.01.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2025 07:01:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E4BC0TtZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tYRMS-0002SV-Di; Thu, 16 Jan 2025 10:00:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tYRM9-0002AG-9Q
 for qemu-devel@nongnu.org; Thu, 16 Jan 2025 10:00:25 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tYRM6-000094-Be
 for qemu-devel@nongnu.org; Thu, 16 Jan 2025 10:00:24 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-436326dcb1cso6618905e9.0
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2025 07:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737039620; x=1737644420; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QKyurn3hyAn+7BGFNFmnur/chv9BVb1zR9y6ikplhXM=;
 b=E4BC0TtZooepjAwr/lMvl0KPECGC9c4R0OSYpr8yEroCyPBHqSRMH/B++BM/jpEEg8
 PFh9cUpJM+nCzksdrusz/y9GPetI2Njl1DRVS3UUStNiCXzZ8gIuxkSwLYjfYRvyeXPN
 ovtUdV6Y8o15ognF0GzHKnY4/GdJYi66k+O7U1nNwqeI2F/a2FazC3PwpTrZx++5CRaK
 gafbkMEKsHf/RWSB/dcISB5Mtx+TE7AkukYXeRthHs/w78ZjToNj0qqVVY55xhjakc0J
 TGtTP41bFBQsREbrd/2RlxomRxAqUQpR5BhxDPijNc5odPOGvaU80VKE3ETBnRU5G/EW
 UNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737039620; x=1737644420;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QKyurn3hyAn+7BGFNFmnur/chv9BVb1zR9y6ikplhXM=;
 b=PZzoixCzaOH9J00p145dbNJiVJqNGTvBeDxbjtT4i01dJuKecAlYT2hhNE8S/kqlPS
 7OK+smqkzsCo5zQ3NaTEkdHQklsu+D+IT3Cjfxr1REZOsTJ3n2NmZQqrvcFUKJAZa9CE
 FWzpyRs03XuH0CU6xRAHZ0QsJk/uOLEaci6QdJg2CMTcu10HmZwLoA9JfquW69qsEuXk
 VjW47w9SgNjvr2fSAObkeUNrt2A0zIRvQGcQQc4CBKffPa1hu0wKI1ONzhlMhHA9a/8b
 AZHxFF/ic8LUK4wUUuHdQA6499t0czl2HyUhMTDPmVkuomSLmdmnbf8Md2l2/3eftfv9
 U5Uw==
X-Gm-Message-State: AOJu0YybYrjYRAOdAyr3ENAmObR1SeHpNkFHaOBD1jNFHkyXjO8N/gyg
 hJwe9B6AVk7BhqQ1d5ksvotaXjDx6UUlMuoxnjyvkooq0xbsS+oh3i700dk9/EkV4Qg5vi0C5+4
 WBG0=
X-Gm-Gg: ASbGncuqEKuNKX+mu8sJtHD9LHuP1c4FvhekOCLIWuk/f9eiAxfgL5BXQahrTslopRd
 yz3jlzZyZ+oGb9suo9XQytagWQxEixKL2xdLtiheglW1HxuA+eI12C7/ftQ5mhRhdPF9waeDDTw
 wKHKWbzVVi9mE0WgLxKP/I2IzQ+XvJCSCOOKvHEXB302Ao5Bg8T2LeBmHlcTLrChGx0Coebt+wx
 X+J3PdPHjHQfEKoCBt6W/z2f/6SkKfr2su+3rH1c6ORzbF35B9erO4IHONduJPoDgRs7rcMLL4K
 ur+Wmj8eRo3amdpImIWA/Sod/YNDskI=
X-Received: by 2002:a05:600c:1ca7:b0:434:ff9d:a370 with SMTP id
 5b1f17b1804b1-436e255e2cbmr331132315e9.0.1737039620466; 
 Thu, 16 Jan 2025 07:00:20 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438904623a8sm1683135e9.26.2025.01.16.07.00.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 16 Jan 2025 07:00:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>, Thomas Huth <thuth@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 v2 07/13] hw/arm/virt: Remove
 VirtMachineClass::claim_edge_triggered_timers field
Date: Thu, 16 Jan 2025 15:59:38 +0100
Message-ID: <20250116145944.38028-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250116145944.38028-1-philmd@linaro.org>
References: <20250116145944.38028-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VilA/GfSD8Yn

The VirtMachineClass::claim_edge_triggered_timers field
was only used by virt-2.8 machine, which got removed.
Remove it and simplify fdt_add_timer_nodes() and build_gtdt().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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
index 76d83cfdd3b..589f3e27ee8 100644
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


Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3807530njn;
        Thu, 16 Jan 2025 07:00:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWBDxwK2uJ57S2P/IArlLsbsMZK51meQzYYJMxuv+kYFd8tlwOqW90I9qadLORyteqI7Tp1RLTVTxd5zQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFz1xxAi9gcX8UROwUnXl5WpxCdl+jK4K08WSMAVD2GN/rwuEtza48LDUmbvO5nFhduesm5
X-Received: by 2002:ac8:5fd1:0:b0:467:6742:5633 with SMTP id d75a77b69052e-46c7102bae6mr538780381cf.23.1737039650225;
        Thu, 16 Jan 2025 07:00:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737039650; cv=none;
        d=google.com; s=arc-20240605;
        b=aq0/+XHAzDldeVZQDa2Smh0rgeraOxqCZVdrwMIAqfZnKzWWaUHYl6hGa+PlUDBhVK
         ctYvfcGwpuGNqD2hh0gWnc86+MJ8fGL4Elo/EIGP5sfPu/9kpbc6Te+FBqa3eCsn9T2B
         +BOFvcS+DuhdM56/6ys4Wq/WocPIPD0eoyJmIaSePyzziDC1UGeKrjiKlViJUuzpSzLH
         iqvVp2qj1+MpAxqGkGePlZMJRW1TQa9tLqmWrkDQu1w+5D02Ld0HVb8F5RbzTHJbQPxr
         AjxK6gRR8jogbhsaGY9R/1IPymeQmXbqvRwGjx//AJq2CcX/lvssn68ttNjQh8EoHPzj
         K70A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VLP6MHIeVotcuU3w8Dkkpq3gJTXXHTzTWILY4ffGEXM=;
        fh=7+X6/hxfEwK0Sq/Mxk5/yUnKdONTZ7bcgzx0cHMbmOM=;
        b=ZpBhgCUNM57vXgn48Kvde39ck75iFft0AxKMJ7u/Lh1SlLkf943vqLs6ESxQ/mxL4I
         lAEgmWr1Mg6HAAtKoot6bOSEpH0ivohwha2R3PnfrAZ4QihoB1yBxLpD6cvtBdvFVn/Y
         4RfRElvVxEoc+XLw9oitcIkaxF5EAjDdGIO2Puz5B70nHopXaud+VAI6MyGZXvG4raU6
         LgzoLGw7uGBXWMMDeDB7QQZzEedEh6C+1VJeVNC1LtMWAGufR209cRqYOixU/Rgi3prD
         RBrPSRKulAmkCZZ1+cDmDLjdXMnxkmd+AvwhuxDTOeKER6yEal5/EXNfLtih2YC/UKYJ
         xahw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RXZEbZEJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e102f2ae4si676371cf.112.2025.01.16.07.00.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2025 07:00:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RXZEbZEJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tYRM3-00028f-3l; Thu, 16 Jan 2025 10:00:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tYRLy-000252-2K
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 10:00:15 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tYRLw-00005j-HE
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 10:00:13 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-436249df846so6662335e9.3
 for <qemu-arm@nongnu.org>; Thu, 16 Jan 2025 07:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737039611; x=1737644411; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VLP6MHIeVotcuU3w8Dkkpq3gJTXXHTzTWILY4ffGEXM=;
 b=RXZEbZEJ0bF1uCZh1deNL0hT2F/KcKZeMQlcOqvuppFaKMusP84z9q0FBBkx/9SQo+
 b/7I77yY7JBNsFd4V6aC2bqU4bI7Dh46t40OdGVcPs0TnyB7uVWuw7BtzHNsZtw8vKuV
 vF8PwcTwhsQJuGRMTxJ21l0zHAhgWmUPwUzkavr2r7rk60cXzvhNWqmAN0MhZ6icYC8N
 uIae8ZjxF0xyWR9zTIJrzEGvXkXdGGjAFpisPR3bpd9Jtnk+MWoZFgcCB8QqPyKnSnVm
 Atkzq8XtH2AXZdk0sUqpf2JznSzQ9o4J58CSIDNPHXTC4rIvGYVSTDJwOJ/MICjSiAgq
 w8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737039611; x=1737644411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VLP6MHIeVotcuU3w8Dkkpq3gJTXXHTzTWILY4ffGEXM=;
 b=poTOk04pLJUYe0TrWtMSqiXDX/ipk5LiIR8l4XnVvVYnNX5/XtMPI7m3mL+qP0XB2H
 20K1S1+rtGn/X/WBA/CyXBi/wA7nKYcNa+2KFkXdLkho7idbTeOqQXfu5PcaRPXQfnw7
 Ql7Gt+uBYydFN6qixJHbOx1xvDdrj/LsXiCLgsJowkiff/cLm65+tyZr8M8bAbHhSxdC
 CwU3+vMdI81HgZhLbqrgaW4SdiX7N7BkQWPbmDkq+fedVDna7N8ekgxNHeLIZeWbaF/I
 J73uo3a/qc83zuzgC5jl8uoqie/tq0E51GxMKIuTxSRT+v5BktxWxO153D8nTCIEeRZ2
 cTfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3dFRUfRWW79BqY3kFA2A1FzjOvD3guS7kuDU5+zuO1I8btYgGh7gj0OtIIWXWDQkxY0PWKfEukQ==@nongnu.org
X-Gm-Message-State: AOJu0YyuG26MTBTSMeySMIACt3+UDGsq6RyJlP1XDvw6DtkfIIw1Cukq
 M1NV+31mruCPnYHfVQ3+eCcDUbFOZSU3zjS6f8mk4MSH+922qoTBkCsWbntGAGM=
X-Gm-Gg: ASbGncvpkEjzSMLqdM2g0KM0k/juGCGrIsVGUZPrNcRUwkqiPUcMjQeC6EZtcvubvYZ
 0qOaixfu/1D7IERpzxdbLAz91U8XQPNTXjSWsbKAcOGAkfEtKcmhxky7YrH4ihxIp7Ob1lXaQdw
 g1DULn4ZjC3aybQgsGynJtFv8SxieoC51mOvOEGCIyW15qf04Bdlc73Avmg+pD1rE1KuLa4pL0K
 kZWNc4nS/IPaBwQy7xJJqFUqB+QqIncmzaZ8dlWpbs3xwDNO1b5sf81HyvFV92CfHcTDFaMg0tG
 4OLqUGp9la32fqlWqMdBikeplk3pHCU=
X-Received: by 2002:a05:600c:5115:b0:434:feb1:adae with SMTP id
 5b1f17b1804b1-436e266e823mr293591825e9.3.1737039610951; 
 Thu, 16 Jan 2025 07:00:10 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3282a63sm64775f8f.96.2025.01.16.07.00.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 16 Jan 2025 07:00:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>, Thomas Huth <thuth@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 v2 05/13] hw/arm/virt: Remove
 VirtMachineClass::no_its field
Date: Thu, 16 Jan 2025 15:59:36 +0100
Message-ID: <20250116145944.38028-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250116145944.38028-1-philmd@linaro.org>
References: <20250116145944.38028-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: CXb4IH66Qi1b

The VirtMachineClass::no_its field was only used by
virt-2.7 machine, which got removed. Remove it and
simplify virt_instance_init() and virt_acpi_build().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/arm/virt.h    |  1 -
 hw/arm/virt-acpi-build.c |  5 ++---
 hw/arm/virt.c            | 16 ++++++----------
 3 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 5d3b25509ff..463ac09615e 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -117,7 +117,6 @@ typedef enum VirtGICType {
 
 struct VirtMachineClass {
     MachineClass parent;
-    bool no_its;
     bool no_tcg_its;
     bool claim_edge_triggered_timers;
     bool smbios_old_sys_ver;
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index c9b13057a34..ccecea9e09b 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -670,7 +670,6 @@ static void
 build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
     int i;
-    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     const MemMapEntry *memmap = vms->memmap;
     AcpiTable table = { .sig = "APIC", .rev = 4, .oem_id = vms->oem_id,
                         .oem_table_id = vms->oem_table_id };
@@ -741,7 +740,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                                           memmap[VIRT_HIGH_GIC_REDIST2].size);
         }
 
-        if (its_class_name() && !vmc->no_its) {
+        if (its_class_name()) {
             /*
              * ACPI spec, Revision 6.0 Errata A
              * (original 6.0 definition has invalid Length)
@@ -974,7 +973,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
                           vms->oem_table_id);
     }
 
-    if (its_class_name() && !vmc->no_its) {
+    if (its_class_name()) {
         acpi_add_table(table_offsets, tables_blob);
         build_iort(tables_blob, tables->linker, vms);
     }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index eb27305dcd3..06530a5dbf8 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3294,17 +3294,13 @@ static void virt_instance_init(Object *obj)
     vms->highmem_mmio = true;
     vms->highmem_redists = true;
 
-    if (vmc->no_its) {
-        vms->its = false;
-    } else {
-        /* Default allows ITS instantiation */
-        vms->its = true;
+    /* Default allows ITS instantiation */
+    vms->its = true;
 
-        if (vmc->no_tcg_its) {
-            vms->tcg_its = false;
-        } else {
-            vms->tcg_its = true;
-        }
+    if (vmc->no_tcg_its) {
+        vms->tcg_its = false;
+    } else {
+        vms->tcg_its = true;
     }
 
     /* Default disallows iommu instantiation */
-- 
2.47.1


Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp320698ejy;
        Thu, 29 Jun 2023 05:55:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6l69H6rFFd6DSRs8jamrqaO4ps3Ca1jatLTCjo0a7ylNv1hYUcv3CI7lIEON2XfNvTZyWf
X-Received: by 2002:a05:6102:3013:b0:443:7635:34d with SMTP id s19-20020a056102301300b004437635034dmr5305514vsa.30.1688043339234;
        Thu, 29 Jun 2023 05:55:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688043339; cv=none;
        d=google.com; s=arc-20160816;
        b=XawJDYBbf1sZDBcdOD9F3XCdBbI7B0a/CEYyhl0lBRIjb4e2YhiiMy8g/8dpi9xlG6
         5LK9bPjwulnRRPSIsOhE3aP1J7/RysEF9opxUXRiY9REo1p+bba2ibxrnaO7wG4/VCdh
         psPmSIB5w8R91oAt+m2tItd94Q49xwsfFTIyGoYQrL/gafip6e6febbYHo3tPMwTTvAQ
         rPlfndjpaCE0m8JN4R5ApH4gzpi0mYU2d8qAx6mE20zQVRl5pZv5sZRiE8ksOl+eeSdq
         hmYZFC6S2zgFmtPjuicrH7RgrJHOWmWJWEbdHoz3SGYH1QhpufJDNdtE7jCZMQ4x8HYE
         LLQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=+k+EZiPsbqU979sALNTepkIWmx3NZEF8XVlueEy6VNo=;
        fh=qyJ7eyCs9BuG68e8YyZAbIPtkiJwFzDD2GU3+7ZjRFw=;
        b=0pWikvekJPjFnIV/YNC3mFI0cr3kMFYOEpUABv7Jn5XsxpP9MuirbUGBEYgthz+2Hx
         /A17Na6Zyt2pztbCFHW5r+3OoHJQKXPriNe9MPaa6p6LGFRJmydKJmuNFAffiR4HHT4t
         jnrhnbGMvZgzt4zK6OVHviPGFa4WpzAihtvcgF9m8aubn+TVhbt4Tc70J3icowMG2nQ9
         O5pK/akkIqkfJAZRacIEu5SLceVa4HRFFxE71FEmxLgnaG7OOKAkJJYPoH7Mf1vpuaDX
         yXargH9cYmtH9AkWX6yTAB+MOz0oqZ+IK10n9N/80Qdr615znHGqBjJAG0Y55e1wx5Z3
         1p8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Te5eowZa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fw13-20020a056214238d00b0062df978c2d9si6148990qvb.532.2023.06.29.05.55.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jun 2023 05:55:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Te5eowZa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qErB0-0001bC-0Y; Thu, 29 Jun 2023 08:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qErAu-0001aE-T9
 for qemu-arm@nongnu.org; Thu, 29 Jun 2023 08:55:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qErAr-0007Bh-Mq
 for qemu-arm@nongnu.org; Thu, 29 Jun 2023 08:55:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688043300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=+k+EZiPsbqU979sALNTepkIWmx3NZEF8XVlueEy6VNo=;
 b=Te5eowZan2d0bwgtal5iLIuVsKJnE8miW1suEhgIOLrVtYggXnG/KRdm1Of2UK6a6FHiWu
 PIauWxJfIC55dP0WSNniWJFS8qOFZqpzOVYBSxWMmh7Mou7L2ExDFMD6T+q4wa9hf2P1eZ
 Sbk7KDzXIVjEvZ3n9leqnj1i2+SWlM0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-otZ0DLfkNn6EC3MG7UDMBg-1; Thu, 29 Jun 2023 08:54:54 -0400
X-MC-Unique: otZ0DLfkNn6EC3MG7UDMBg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5DE31C09048;
 Thu, 29 Jun 2023 12:54:53 +0000 (UTC)
Received: from thuth.com (dhcp-192-205.str.redhat.com [10.33.192.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 956402166B27;
 Thu, 29 Jun 2023 12:54:51 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH] hw: Simplify calls to pci_nic_init_nofail()
Date: Thu, 29 Jun 2023 14:54:49 +0200
Message-Id: <20230629125449.234945-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: kKytj6bExztq

pci_nic_init_nofail() calls qemu_find_nic_model(), and this function
sets nd->model = g_strdup(default_model) if it has not been initialized
yet. So we don't have to set nd->model to the default_nic in the
calling sites.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/sbsa-ref.c        | 8 +-------
 hw/arm/virt.c            | 8 +-------
 hw/loongarch/virt.c      | 8 +-------
 hw/mips/loongson3_virt.c | 8 +-------
 hw/xtensa/virt.c         | 8 +-------
 5 files changed, 5 insertions(+), 35 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index b774d80291..d8e13ddbfe 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -683,13 +683,7 @@ static void create_pcie(SBSAMachineState *sms)
     pci = PCI_HOST_BRIDGE(dev);
     if (pci->bus) {
         for (i = 0; i < nb_nics; i++) {
-            NICInfo *nd = &nd_table[i];
-
-            if (!nd->model) {
-                nd->model = g_strdup(mc->default_nic);
-            }
-
-            pci_nic_init_nofail(nd, pci->bus, nd->model, NULL);
+            pci_nic_init_nofail(&nd_table[i], pci->bus, mc->default_nic, NULL);
         }
     }
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3937e30477..b660119bce 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1477,13 +1477,7 @@ static void create_pcie(VirtMachineState *vms)
     vms->bus = pci->bus;
     if (vms->bus) {
         for (i = 0; i < nb_nics; i++) {
-            NICInfo *nd = &nd_table[i];
-
-            if (!nd->model) {
-                nd->model = g_strdup(mc->default_nic);
-            }
-
-            pci_nic_init_nofail(nd, pci->bus, nd->model, NULL);
+            pci_nic_init_nofail(&nd_table[i], pci->bus, mc->default_nic, NULL);
         }
     }
 
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index ca8824b6ef..51a453fa9a 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -547,13 +547,7 @@ static void loongarch_devices_init(DeviceState *pch_pic, LoongArchMachineState *
 
     /* Network init */
     for (i = 0; i < nb_nics; i++) {
-        NICInfo *nd = &nd_table[i];
-
-        if (!nd->model) {
-            nd->model = g_strdup(mc->default_nic);
-        }
-
-        pci_nic_init_nofail(nd, pci_bus, nd->model, NULL);
+        pci_nic_init_nofail(&nd_table[i], pci_bus, mc->default_nic, NULL);
     }
 
     /*
diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
index 216812f660..3dd91da7a6 100644
--- a/hw/mips/loongson3_virt.c
+++ b/hw/mips/loongson3_virt.c
@@ -454,13 +454,7 @@ static inline void loongson3_virt_devices_init(MachineState *machine,
     }
 
     for (i = 0; i < nb_nics; i++) {
-        NICInfo *nd = &nd_table[i];
-
-        if (!nd->model) {
-            nd->model = g_strdup(mc->default_nic);
-        }
-
-        pci_nic_init_nofail(nd, pci_bus, nd->model, NULL);
+        pci_nic_init_nofail(&nd_table[i], pci_bus, mc->default_nic, NULL);
     }
 }
 
diff --git a/hw/xtensa/virt.c b/hw/xtensa/virt.c
index b87f842e74..a6cf646e99 100644
--- a/hw/xtensa/virt.c
+++ b/hw/xtensa/virt.c
@@ -103,13 +103,7 @@ static void create_pcie(MachineState *ms, CPUXtensaState *env, int irq_base,
     pci = PCI_HOST_BRIDGE(dev);
     if (pci->bus) {
         for (i = 0; i < nb_nics; i++) {
-            NICInfo *nd = &nd_table[i];
-
-            if (!nd->model) {
-                nd->model = g_strdup(mc->default_nic);
-            }
-
-            pci_nic_init_nofail(nd, pci->bus, nd->model, NULL);
+            pci_nic_init_nofail(&nd_table[i], pci->bus, mc->default_nic, NULL);
         }
     }
 }
-- 
2.39.3


Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1838145lfm;
        Thu, 2 Jul 2020 13:52:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDiUNXk81FbvaeDgk0ucXdediME2NniwvH0e2bKnybamT41OseWL49Z9uDxGv2b4ar5IH7
X-Received: by 2002:a25:34c1:: with SMTP id b184mr43513856yba.355.1593723172650;
        Thu, 02 Jul 2020 13:52:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593723172; cv=none;
        d=google.com; s=arc-20160816;
        b=xEoAbW7XHn5p85LG/Wx3vku+r/3x1daoqmqFSqguX1lixCIrOiIQZuc8W2IKQaVG/m
         Il8qbboAkUuouN/Vn31KzRVSSsvDPI9q9sv8kk5tOeVDrp/JAiZ65L95w2sx/KpEZ0Wu
         vax6dgjAmOtcWHuTtRhwa2VWJQsfk4gxNjJu/qozUay16zljs/jXuHIWqotSyjc6P3qm
         sFTi0qNfrdGObsVW3nwqy+mLVzVS4OQUNc28HaJscfsEzTsktb3RoK0dRbY2uqXncM5s
         F3yYvUFA07Ex5DQeQjOFRdLm09mAA7I0c+7NBy5IAeXA4kdhwV95a09INH4YWeZp+8Oe
         1C5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=3qmo/QC1Uo41VjKsHy5G+USrNARFiKstgjsHC8RmoEs=;
        b=RG6Spr+anpS5jujddIo9DqGvqlanKJeZSzweiWuV8yHlbm+98B2KPZlsftfyteCsd8
         dEsd61fUtxUE5PVIOYLLg6ql+RYkXh7kY+9vvGjaBkMqyUoMSDOn1XDnTW55uBohEj8D
         HpXmttEPocc0K9o29snrKY5BsGtZ1S4ZGLGH7Fgp9QPkZt4mg+0dpJ0h8gLmDCuqx1T7
         8PGx3B0VhGXduyehn9LLsdaX6ldj12pkWhDHIDYhQLfBJNjtC4VcRf/RKEGQhGNIpXc6
         qn4BaGDu6kiTH2LkyGSoj+BvYNxoCmrJRUFsbVKnudRUwfY03eS/cUee8ekjSQlj6G9x
         L9tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SaPzU143;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f190si7918335ybb.481.2020.07.02.13.52.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jul 2020 13:52:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SaPzU143;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jr6CR-000286-UH
	for alex.bennee@linaro.org; Thu, 02 Jul 2020 16:52:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jr69D-0004cW-L5
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 16:49:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60186
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jr696-0003Z3-4m
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 16:49:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593722963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=3qmo/QC1Uo41VjKsHy5G+USrNARFiKstgjsHC8RmoEs=;
 b=SaPzU143FdODFwrabfX6jlPmT8Ce4oSrAG10q9HjRZqHGwMRjvJj4H5XhlUDNACVff5AMw
 vIvy+pEzwg0G1ZRl1ufkwO9SQoITm3cXDjf0W+QmVstbIhLX8cITK1Ghtn6TUWqVUvnA1y
 mQV9dsS3SQmcKxD9B0iHxdcHL5UGoCY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-U2UQ2T7fP0CZmI8OqfOBmA-1; Thu, 02 Jul 2020 16:49:20 -0400
X-MC-Unique: U2UQ2T7fP0CZmI8OqfOBmA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA05A1932483;
 Thu,  2 Jul 2020 20:49:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-62.ams2.redhat.com
 [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E1755C1C5;
 Thu,  2 Jul 2020 20:49:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 175AF31E93; Thu,  2 Jul 2020 22:49:00 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/21] microvm: make virtio irq base runtime configurable
Date: Thu,  2 Jul 2020 22:48:45 +0200
Message-Id: <20200702204859.9876-8-kraxel@redhat.com>
In-Reply-To: <20200702204859.9876-1-kraxel@redhat.com>
References: <20200702204859.9876-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 04:00:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BYID/ZVxmpoq

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
---
 include/hw/i386/microvm.h |  2 +-
 hw/i386/microvm.c         | 11 +++++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
index fd34b78e0d2a..03e735723726 100644
--- a/include/hw/i386/microvm.h
+++ b/include/hw/i386/microvm.h
@@ -27,7 +27,6 @@
 
 /* Platform virtio definitions */
 #define VIRTIO_MMIO_BASE      0xfeb00000
-#define VIRTIO_IRQ_BASE       5
 #define VIRTIO_NUM_TRANSPORTS 8
 #define VIRTIO_CMDLINE_MAXLEN 64
 
@@ -57,6 +56,7 @@ typedef struct {
     bool auto_kernel_cmdline;
 
     /* Machine state */
+    uint32_t virtio_irq_base;
     bool kernel_cmdline_fixed;
 } MicrovmMachineState;
 
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 1300c396947b..ab6ee6c67b1a 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -121,10 +121,11 @@ static void microvm_devices_init(MicrovmMachineState *mms)
 
     kvmclock_create();
 
+    mms->virtio_irq_base = 5;
     for (i = 0; i < VIRTIO_NUM_TRANSPORTS; i++) {
         sysbus_create_simple("virtio-mmio",
                              VIRTIO_MMIO_BASE + i * 512,
-                             x86ms->gsi[VIRTIO_IRQ_BASE + i]);
+                             x86ms->gsi[mms->virtio_irq_base + i]);
     }
 
     /* Optional and legacy devices */
@@ -227,7 +228,7 @@ static void microvm_memory_init(MicrovmMachineState *mms)
     x86ms->ioapic_as = &address_space_memory;
 }
 
-static gchar *microvm_get_mmio_cmdline(gchar *name)
+static gchar *microvm_get_mmio_cmdline(gchar *name, uint32_t virtio_irq_base)
 {
     gchar *cmdline;
     gchar *separator;
@@ -247,7 +248,7 @@ static gchar *microvm_get_mmio_cmdline(gchar *name)
     ret = g_snprintf(cmdline, VIRTIO_CMDLINE_MAXLEN,
                      " virtio_mmio.device=512@0x%lx:%ld",
                      VIRTIO_MMIO_BASE + index * 512,
-                     VIRTIO_IRQ_BASE + index);
+                     virtio_irq_base + index);
     if (ret < 0 || ret >= VIRTIO_CMDLINE_MAXLEN) {
         g_free(cmdline);
         return NULL;
@@ -259,6 +260,7 @@ static gchar *microvm_get_mmio_cmdline(gchar *name)
 static void microvm_fix_kernel_cmdline(MachineState *machine)
 {
     X86MachineState *x86ms = X86_MACHINE(machine);
+    MicrovmMachineState *mms = MICROVM_MACHINE(machine);
     BusState *bus;
     BusChild *kid;
     char *cmdline;
@@ -282,7 +284,8 @@ static void microvm_fix_kernel_cmdline(MachineState *machine)
             BusState *mmio_bus = &mmio_virtio_bus->parent_obj;
 
             if (!QTAILQ_EMPTY(&mmio_bus->children)) {
-                gchar *mmio_cmdline = microvm_get_mmio_cmdline(mmio_bus->name);
+                gchar *mmio_cmdline = microvm_get_mmio_cmdline
+                    (mmio_bus->name, mms->virtio_irq_base);
                 if (mmio_cmdline) {
                     char *newcmd = g_strjoin(NULL, cmdline, mmio_cmdline, NULL);
                     g_free(mmio_cmdline);
-- 
2.18.4

